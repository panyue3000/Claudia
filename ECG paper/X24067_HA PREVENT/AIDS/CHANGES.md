# AIDS Submission Package — Changes Log

**Date:** 2026-05-11
**Source manuscript:** `../Pan_et_al_Revised_AIDS.qmd` (unchanged)
**Trimmed submission manuscript:** `Pan_et_al_AIDS.qmd` (this folder)
**Target journal:** *AIDS* (Lippincott / Wolters Kluwer)
**Article type:** Original Paper
**Guidelines verified from:** `Editorial Manager - AIDS Author Guideline.pdf` (this folder)

---

## 1. Official AIDS Original Paper requirements (verified from PDF)

| Requirement | Official limit | This package | Status |
|---|---|---|---|
| Main text words | **≤3,500** (excluding abstract, references, figure legends) | **3,220** | ✓ |
| Tables + figures combined | **up to 5** | **5** (3 tables + 2 figures) | ✓ |
| Abstract | **≤250 words**, structured | **247** | ✓ |
| Abstract structure | Objective(s) / Design / Methods / Results / Conclusions | matches | ✓ |
| Title | ≤120 characters | 88 | ✓ |
| Short title (running head) | ≤40 characters | 40 | ✓ |
| Key words | 5–7, from MeSH | 7 | ✓ |
| Reference numbering | Numbered in order of appearance, brackets `[17]` | `aids.csl` applied | ✓ |
| Reference author listing | All authors if ≤6; first 6 + *et al.* if ≥7 | handled by `aids.csl` | ✓ |
| Title page heading | **"Conflicts of Interest and Source of Funding:"** combined | applied | ✓ |
| Person-centered language | "people with HIV" not "HIV-infected" | already applied throughout | ✓ |
| AI tool disclosure | Required in Methods (or similar) if AI used | added under "Use of AI tools" | ✓ |
| Cover letter | Required | provided | ✓ |
| Suggested reviewers | up to 6 allowed | 3 placeholders in cover letter | ✓ |

## 2. Word counts

Computed by stripping bold-label markers and horizontal-rule dividers from the qmd:

| Section | Original (`Pan_et_al_Revised_AIDS.qmd`) | Trimmed (`Pan_et_al_AIDS.qmd`) | Δ |
|---|---:|---:|---:|
| Abstract (structured) | 391 | **247** | −144 |
| Introduction | ~900 | 405 | −495 |
| Methods (incl. AI tool disclosure) | ~1,100 | ~730 | −370 |
| Results | ~900 | 736 | −164 |
| Discussion (incl. Limitations + Strengths) | ~3,000 | 1,259 | −1,741 |
| Conclusions | ~250 | 109 | −141 |
| **Main text total** | **~5,814** | **3,220** | **−2,594** |

## 3. Tables and figures — merged to 5 combined

The AIDS PDF specifies **up to 5 figures or tables** combined. The current package therefore merged Tables 2 and 3 from the original layout:

| AIDS submission | Content | Origin |
|---|---|---|
| **Table 1** | Descriptive characteristics by HIV serostatus | unchanged |
| **Table 2** (merged) | Multivariable linear regression for HAD (left panel) + logistic regression for elevated HAD (right panel) | **merge of original Tables 2 and 3** |
| **Table 3** | HIV severity model (people with HIV only): viral load and CD4 count | renumbered from original Table 4 |
| **Fig. 1** | Forest plot of logistic-regression predictors of HAD ≥5 years | unchanged |
| **Fig. 2** | Forest plot of HIV-specific predictors of HAD | unchanged |

**Combined: 3 tables + 2 figures = 5** ✓

In-text references in the manuscript already point to the merged numbering (Table 2 with "left panel" / "right panel" callouts; Table 3 for the HIV severity model). The supplementary file `02_Tables_and_Figures.docx` still contains the **un-merged** original Tables 2 and 3; **the corresponding author must merge them into a single side-by-side Table 2 before submission**. See open items §8.

Supplemental tables (S1–S8) and supplemental figures (S1, S2) are unchanged and are not counted toward the main-text 5-combined limit.

## 4. Section-by-section edits (trim + humanization)

| Section | What was cut or condensed | Scientific content preserved |
|---|---|---|
| Abstract | Compressed Background to one sentence; merged Methods sentences into a single statement; tightened Conclusions | All effect estimates, CIs, p-values, NHB β, viral-load β, CD4 β, CES-D β |
| Introduction | Merged paragraphs 1–2 (CVD-in-HIV and risk-communication background); collapsed the PREVENT-vs-PCE comparison; dropped redundant secondary references (Bonner2018, LopezGonzalez2015, GuzmanVilca2022, Grover2007, Goff2014, Triant2007, Samji2013, GBD2019) | Hypotheses, PREVENT background, MWCCS rationale, external CNICS/REPRIEVE caution |
| Ethics | Tightened phrasing | IRB approval, written consent, Declaration of Helsinki |
| Study design and population | Tightened cohort history; condensed eligibility list | All eligibility criteria, visit windows, sample size, cross-sectional rationale |
| Heart age and HAD | Moved PREVENT optimal-value list to Supplemental Methods | HA definition, HAD definition, ≥5-year and ≥10-year thresholds, caveat that thresholds are unvalidated |
| Covariates | Condensed lists | All demographic, clinical, HIV-specific, mental-health, and social-determinant covariates retained |
| Statistical analysis | Tightened narrative; kept the over-adjustment justification (VanderWeele2014) and MICE description | All model specifications, interaction term, MICE m=10, software list, α=0.05 |
| Use of AI tools (new subsection) | Added per AIDS guideline requiring AI tool disclosure | New subsection in Methods |
| Results | Removed narrative repetition of table cells; updated table callouts for merged Table 2 (left/right panels) and renumbered Table 3 (was Table 4) | All numeric findings |
| Discussion | Largest cuts: collapsed three CD4-interpretation paragraphs into one; trimmed NHB-disparities paragraph (kept structural-racism framing); condensed depression mechanism paragraph; merged female-sex and HIV×sex paragraphs | All interpretations, alternative-explanation arguments, REPRIEVE/CNICS context, insurance sensitivity result |
| Limitations | Converted to compact prose; removed redundant qualifiers | All limitations (cross-sectional, no HIV-specific PREVENT inputs, healthy-survivor bias, PCL-C sparsity, no SES adjustment, no ZIP-code data, threshold-validation caveat) |
| Strengths | Compressed | First PREVENT-HA assessment in HIV cohort; MWCCS scale; multivariable approach; MICE |
| Conclusions | Tightened to single paragraph | Main findings and future directions retained |

## 5. Title-page changes per official AIDS format

- Title (≤120 chars): "Heart Age and Heart-Age Deviation Among People With and Without HIV in the United States" — 88 chars ✓
- **Short title / running head (≤40 chars):** "Heart age in people with and without HIV" — exactly 40 chars ✓
- Family names rendered in CAPITAL letters per AIDS rule: will appear via aids.csl in the rendered docx; current qmd uses standard capitalization for author block readability — corresponding author may need to convert surnames to ALL CAPS in the submission docx if AIDS strictly enforces this.
- Combined heading: **"Conflicts of Interest and Source of Funding:"** ✓
- Word count clearly stated on title page: Abstract 247; main text 3,220 ✓

## 6. Reference reconciliation

- Original bib: **47** entries
- Citations used in trimmed manuscript: **34** unique keys
- Orphan citations (cited but not in bib): **0** (verified by grep-diff)
- Final reference count: **34** (well below the implicit ~40–50 norm; AIDS does not state a hard reference cap for Original Papers in the IFA PDF)
- Entries kept in `references_aids.bib` but no longer cited (retained in bib for transparency; will not appear in the rendered reference list because they are not cited):

  Adimora2018, Arnett2019, Bonner2018, Freiberg2013, GBD2019, Goff2014, Grover2007, GuzmanVilca2022, Kaslow1987, Lazar2018, LopezGonzalez2015, Samji2013, Triant2007.

  Rationale: secondary or redundant citations (older Framingham/Pooled Cohort guideline references, second Bonner reference, MACS/WIHS history references already covered by `DSouza2021` and `Barkan1998`). No primary finding-supporting citation was removed.

## 7. Humanization pass (humanizer_academic skill)

The trimmed prose was scanned for AI-writing tells. The trim was composed in a humanized style at the outset; the scan found and corrected:

| Pattern | Original phrase | Replacement |
|---|---|---|
| Pattern 19 — informal "linked to" | "conditions linked to adverse cardiovascular outcomes" | "conditions associated with adverse cardiovascular outcomes" |
| Pattern 25 — overuse of "yield" | "PREVENT yielded lower estimates" | "PREVENT produced lower estimates" |
| Pattern 8 — copula avoidance | "the 2-year increment ... represents a meaningful additional disparity" | "the 2-year increment ... is a meaningful additional disparity" |

Other scans (all clean):

- Em dashes (Unicode `—`): 0 occurrences (zero-tolerance rule satisfied; the `---` lines in the file are Markdown section separators that render as horizontal rules, not em dashes in prose).
- AI vocabulary cluster (`underscore`, `highlight`, `crucial`, `pivotal`, `landscape`, `tapestry`, `delve`, `robust`, `leverage`, `intricate`): 0.
- "via": 0.
- "Beyond" as transition: 0.
- ", where" as non-locative connector: 0.
- "Additionally / Furthermore / Moreover" stacked at paragraph starts: 0.

## 8. Deliverables in this folder

| File | Status | Purpose |
|---|---|---|
| `Pan_et_al_AIDS.qmd` | Created | Quarto source for the AIDS submission manuscript (trimmed + humanized) |
| `01_Manuscript.docx` | Re-rendered from new qmd | Manuscript file for submission |
| `02_Tables_and_Figures.docx` | **Needs in-place merge of original Tables 2+3** before submission (open item) | Tables 1–4 currently; should become Tables 1–3 after merge |
| `03_Supplemental_Sensitivity_Insurance.html` | Unchanged | Supplemental material |
| `04_Cover_Letter.qmd` | Created | Quarto source for cover letter |
| `04_Cover_Letter.docx` | Rendered | Cover letter for submission |
| `Figure_1.png`, `Figure_2.png` | Unchanged | Figure files |
| `Figure_S1.png`, `Figure_S2.png` | Unchanged | Supplemental figure files |
| `Editorial Manager - AIDS Author Guideline.pdf` | Reference | Verified guidelines used to build this package |
| `COVER_LETTER_NEEDED.txt` | Deleted | Placeholder; superseded by the actual cover letter |
| `CHANGES.md` | This file | Full change log |

## 9. Open items for the corresponding author before submission

1. **Merge Tables 2 and 3 in `02_Tables_and_Figures.docx`** into a single side-by-side Table 2 (linear regression on the left, logistic regression on the right). Renumber the current Table 4 as Table 3. The qmd manuscript text already refers to the merged numbering. This is the only mandatory remaining change.
2. **Suggested reviewers** — three placeholder slots are in the cover letter. Replace with 3 (up to 6 allowed per AIDS) named experts before submission.
3. **Surname capitalization** — AIDS requires family names in CAPITAL letters on the title page. The current docx renders standard capitalization. Convert surnames to ALL CAPS in `01_Manuscript.docx` if the editor enforces this.
4. **Co-author approval** — confirm all 18 co-authors have approved this version, given the substantial trim.
5. **Data-availability statement** — the cover letter states "available on reasonable request, subject to MWCCS data-sharing policies." Confirm wording with MWCCS DACC (Gypsyamber D'Souza / Stephen Gange) before submission.
6. **Color figures** — the figures will print in color free of charge online but incur a fee in print. Confirm online-only color is acceptable when prompted during Editorial Manager submission.
7. **PRISMA / CONSORT / TREND checklist** — not applicable (this is a cross-sectional observational analysis, not a systematic review, RCT, or non-randomized public-health evaluation requiring TREND).

---

## Table/figure restructuring (2026-05-11)

Changes applied to `Pan_et_al_AIDS.qmd` (this folder) and `../analysis/X24067_Pan_Heart Age v2.qmd`. Motivation: AIDS Original Paper limit is 5 combined tables+figures; prior package had 4+2=6.

| Change | Details |
|--------|---------|
| Suppl S4+S5 promoted → **main Table 2** | `tbl_merge` of `create_strat_prevalence("had5")` + `create_strat_prevalence("ha_gt_age")`; chi-square stars via `add_significance_stars(hide_p=TRUE)`; spans "HAD ≥5 years" / "HA > chron. age" |
| Tables 2+3 merged → **main Table 3** | `tbl_merge` of linear + logistic regression tables; p-value columns replaced with significance stars; Panel A: β (95% CI), Panel B: OR (95% CI) |
| Figs 1+2 combined → **Fig 1 (A+B)** | patchwork `fig1a_obj + fig1b_obj`, 16×7 in; saved as `../figures/Fig1_Combined.png`; standalone PNG files retired |
| Suppl S6 → S4, S7 → S5, S8 → S6 | Renumbered to close gaps left by S4/S5 promotion |
| **AIDS combined total: 4+1=5** | Within AIDS limit of 5 ✓ |

### Manuscript cross-reference updates (`Pan_et_al_AIDS.qmd`)

| Old reference | New reference |
|---|---|
| `(Supplemental Tables S1–S5; Fig S2)` | `(Table 2; Supplemental Tables S1–S3; Supplemental Fig S2)` |
| `Supplemental Table S8` | `Supplemental Table S6` |
| `(Table 2, left panel)` | `(Table 3, Panel A)` |
| `(Table 2, right panel; Fig 1)` | `(Table 3, Panel B; Fig 1A)` |
| `Supplemental Table S7` | `Supplemental Table S5` |
| `(Table 3; Fig 2)` | `(Table 4; Fig 1B)` |
| `Supplemental Table S6` | `Supplemental Table S4` |
| Fig 2 entry in Figures section | removed (now Panel B of Fig 1) |
| Supplemental S4, S5 entries | removed (promoted to main Table 2) |

### Word counts after restructuring
- Abstract: 247 / 250 ✓
- Main text: 3,223 / 3,500 ✓
