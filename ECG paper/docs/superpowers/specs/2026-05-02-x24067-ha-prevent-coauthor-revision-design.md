# X24067 HA PREVENT Co-Author Revision Design

## Goal

Revise the X24067 HA PREVENT manuscript in response to co-author comments, with the April 28, 2026 update treated as the current baseline. The work should improve scientific clarity, address actionable comments in the manuscript and supplemental material, document all changes in `X24067_HA PREVENT/claude_x24067.md`, and push the completed update to GitHub.

## Source Files

- Main manuscript: `X24067_HA PREVENT/Pan_et_al_Revised_AIDS.qmd`
- Project context log: `X24067_HA PREVENT/claude_x24067.md`
- Co-author comment files:
  - `X24067_HA PREVENT/Co-author comments/Other co-author.docx`
  - `X24067_HA PREVENT/Co-author comments/Pan_et_al_Revised_AIDSMJM.docx`
  - `X24067_HA PREVENT/Co-author comments/Pan_et_al_Revised_AIDS_cam.docx`
- Analysis source and local data:
  - `X24067_HA PREVENT/analysis/X24067_Pan_Heart Age v2.qmd`
  - `X24067_HA PREVENT/data/prevent_risk.sas7bdat`
  - `X24067_HA PREVENT/figures/`

## Revision Strategy

Use a targeted co-author-response pass rather than a full manuscript rebuild. The manuscript is already close to submission, so edits should be focused, evidence-based, and consistent with the existing AIDS-format structure.

Emily's April 28 comments will be double-checked against the manuscript and analysis files. Items already addressed should be verified rather than rewritten unnecessarily. These include pregnancy wording, em-dash reduction, citations for neighborhood safety/loneliness/software packages, cross-sectional design rationale, SES-adjustment rationale, and figure label/reference-category cleanup.

Additional co-author comments will be addressed where appropriate:

- Add or verify the MWCCS abbreviation in the abstract.
- Incorporate clear author affiliation/name edits when supported by tracked changes.
- Move interpretation out of the abstract Results section if needed.
- Clarify reference categories, especially the comparison group for NHB race/ethnicity estimates.
- Consider adding cited context for PREVENT performance among people with HIV, PTSD and endothelial dysfunction, and REPRIEVE findings on female sex and cardiac events if bibliographic details can be verified.
- Rework the limitations/strengths section so it reads naturally and does not feel like a mechanical numbered list.

## Supplementary Analysis Decision Rule

Attempt supplementary analyses only if local data support them without speculative variable mapping.

Planned checks:

- Inspect `prevent_risk.sas7bdat` variables and existing analysis code for sex, HIV status, HAD, age, geography, smoking, obesity/BMI, race/ethnicity, and other model covariates.
- If feasible, create a sex-stratified HIV-status supplementary table summarizing age and key covariates, plus HAD or HAD >=5 results by sex and HIV status.
- Inspect available variables for ZIP code, geocode, area deprivation, or similar neighborhood-level measures. If present and interpretable, assess whether adding the variable is feasible as a supplementary analysis. If absent or insufficiently documented, address it as future work/limitation rather than forcing an analysis.

Any new supplementary table must be referenced briefly in Results or Discussion and listed in the supplemental material section. New analyses should avoid changing the primary conclusions unless they reveal a clear inconsistency.

## Humanizing and Style

After scientific edits, use the `humanizer_academic` workflow for a final manuscript pass. The pass should reduce AI-like signals such as excessive em-dashes, inflated novelty claims, mechanical list phrasing, and over-explained transitions while preserving statistical precision, citations, and cautious interpretation.

## Verification

Before claiming completion:

- Check that all citation keys used in the manuscript exist in `references_aids.bib`.
- Scan for unresolved Word-comment artifacts, tracked-change markers, and unsupported placeholders.
- Confirm no LaTeX math delimiters were introduced in the QMD.
- Render the manuscript to HTML and DOCX if local tools and file locks allow.
- Review git diff for X24067 files only and avoid committing unrelated dirty files.

## Deliverables

- Updated `Pan_et_al_Revised_AIDS.qmd`
- Updated supplemental table/result text if supported by local data
- Updated bibliography if new citations are added
- Updated `claude_x24067.md` documenting the revision round
- Rendered manuscript outputs if rendering succeeds
- Git commit and push containing only relevant X24067 revision changes
