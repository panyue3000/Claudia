"""
Render the revised Heart Age manuscript to Word (.docx) and HTML.

Requirements:
  - Quarto CLI installed (https://quarto.org/docs/get-started/)
  - Python 3.8+

Usage:
  python render_manuscript.py            # renders both docx and html
  python render_manuscript.py --docx     # renders docx only
  python render_manuscript.py --html     # renders html only
  python render_manuscript.py --check    # checks dependencies only

Files expected in the same directory:
  - Pan_et_al_Revised_AIDS.qmd
  - references_aids.bib
  - aids.csl
"""

import subprocess
import sys
import os
from pathlib import Path


def get_script_dir():
    """Return the directory containing this script."""
    return Path(__file__).resolve().parent


def check_quarto():
    """Verify Quarto is installed and accessible."""
    try:
        result = subprocess.run(
            ["quarto", "--version"],
            capture_output=True, text=True, timeout=10
        )
        if result.returncode == 0:
            version = result.stdout.strip()
            print(f"[OK] Quarto version: {version}")
            return True
        else:
            print("[ERROR] Quarto found but returned an error.")
            return False
    except FileNotFoundError:
        print("[ERROR] Quarto not found. Install from https://quarto.org/docs/get-started/")
        return False
    except subprocess.TimeoutExpired:
        print("[ERROR] Quarto check timed out.")
        return False


def check_files(work_dir):
    """Verify all required files exist."""
    required = [
        "Pan_et_al_Revised_AIDS.qmd",
        "references_aids.bib",
        "aids.csl",
    ]
    all_ok = True
    for fname in required:
        fpath = work_dir / fname
        if fpath.exists():
            print(f"[OK] Found: {fname}")
        else:
            print(f"[MISSING] {fname}")
            all_ok = False
    return all_ok


def render(work_dir, fmt):
    """Render the QMD file to the specified format."""
    qmd_file = work_dir / "Pan_et_al_Revised_AIDS.qmd"

    print(f"\n{'='*60}")
    print(f"Rendering to {fmt.upper()}...")
    print(f"{'='*60}")

    cmd = ["quarto", "render", str(qmd_file), "--to", fmt]

    result = subprocess.run(
        cmd,
        cwd=str(work_dir),
        capture_output=True,
        text=True,
        timeout=300,
    )

    if result.returncode == 0:
        # Determine output filename
        if fmt == "docx":
            out_name = "Pan_et_al_Revised_AIDS.docx"
        else:
            out_name = "Pan_et_al_Revised_AIDS.html"

        out_path = work_dir / out_name
        if out_path.exists():
            size_kb = out_path.stat().st_size / 1024
            print(f"[SUCCESS] Output: {out_path}")
            print(f"          Size:   {size_kb:.1f} KB")
        else:
            print(f"[SUCCESS] Render completed but output file not found at expected path.")
            print(f"          Check the directory: {work_dir}")
    else:
        print(f"[ERROR] Render failed.")
        if result.stdout:
            print("--- stdout ---")
            print(result.stdout[-2000:])  # last 2000 chars
        if result.stderr:
            print("--- stderr ---")
            print(result.stderr[-2000:])

    return result.returncode == 0


def main():
    work_dir = get_script_dir()
    print(f"Working directory: {work_dir}\n")

    args = sys.argv[1:]

    # --- Dependency check ---
    if "--check" in args:
        check_quarto()
        check_files(work_dir)
        return

    # --- Validate environment ---
    if not check_quarto():
        sys.exit(1)
    if not check_files(work_dir):
        print("\n[ERROR] Missing files. Cannot proceed.")
        sys.exit(1)

    # --- Determine formats to render ---
    if "--docx" in args:
        formats = ["docx"]
    elif "--html" in args:
        formats = ["html"]
    else:
        formats = ["docx", "html"]

    # --- Render ---
    results = {}
    for fmt in formats:
        results[fmt] = render(work_dir, fmt)

    # --- Summary ---
    print(f"\n{'='*60}")
    print("RENDER SUMMARY")
    print(f"{'='*60}")
    for fmt, success in results.items():
        status = "SUCCESS" if success else "FAILED"
        print(f"  {fmt.upper():6s} : {status}")

    if all(results.values()):
        print("\nAll renders completed successfully.")
        print(f"Output files are in: {work_dir}")
    else:
        print("\nSome renders failed. Check the error messages above.")
        sys.exit(1)


if __name__ == "__main__":
    main()
