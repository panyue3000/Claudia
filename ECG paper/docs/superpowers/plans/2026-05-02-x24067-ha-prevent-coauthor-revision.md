# X24067 HA PREVENT Co-Author Revision Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Revise the X24067 HA PREVENT manuscript, separate table/result deliverables, and project log in response to co-author comments, adding supported supplementary analyses from local data.

**Architecture:** Treat `Pan_et_al_Revised_AIDS.qmd` as the manuscript source and preserve the existing separate table/result deliverables, including `X24067_Tables and Figures.docx` and analysis outputs. Use local data only for supplementary analyses with clearly identifiable variables. Keep commits narrow and avoid unrelated dirty files in the parent repository.

**Tech Stack:** Quarto QMD, R/tidyverse-style analysis, SAS7BDAT local data, Pandoc/Quarto rendering, BibTeX, Word DOCX comment extraction, Git.

---

### Task 1: Build Comment And Deliverable Audit

**Files:**
- Read: `X24067_HA PREVENT/Co-author comments/Other co-author.docx`
- Read: `X24067_HA PREVENT/Co-author comments/Pan_et_al_Revised_AIDSMJM.docx`
- Read: `X24067_HA PREVENT/Co-author comments/Pan_et_al_Revised_AIDS_cam.docx`
- Read: `X24067_HA PREVENT/Pan_et_al_Revised_AIDS.qmd`
- Read: `X24067_HA PREVENT/X24067_Tables and Figures.docx`
- Modify later: `X24067_HA PREVENT/claude_x24067.md`

- [ ] **Step 1: Extract tracked-change/comment text from all co-author DOCX files**

Run:

```bash
pandoc --track-changes=all "X24067_HA PREVENT/Co-author comments/Pan_et_al_Revised_AIDSMJM.docx" -t markdown > /tmp/x24067_mjm_comments.md
pandoc --track-changes=all "X24067_HA PREVENT/Co-author comments/Pan_et_al_Revised_AIDS_cam.docx" -t markdown > /tmp/x24067_cam_comments.md
pandoc --track-changes=all "X24067_HA PREVENT/Co-author comments/Other co-author.docx" -t markdown > /tmp/x24067_other_comments.md
```

Expected: three markdown files exist in `/tmp`; `Other co-author.docx` contains Emily/Amber plain-text notes; MJM and CAM files include tracked insertions and comment markers.

- [ ] **Step 2: Extract raw Word comments where present**

Run:

```bash
unzip -p "X24067_HA PREVENT/Co-author comments/Pan_et_al_Revised_AIDSMJM.docx" word/comments.xml > /tmp/x24067_mjm_comments.xml
unzip -p "X24067_HA PREVENT/Co-author comments/Pan_et_al_Revised_AIDS_cam.docx" word/comments.xml > /tmp/x24067_cam_comments.xml
```

Expected: MJM comments include the NHB reference category and abstract-conclusion suggestions; CAM comments include sex-stratified analysis, PREVENT-in-PWH PMIDs, CD4 nadir, ZIP/geocode, PTSD/endothelial dysfunction, REPRIEVE female-sex, and limitations style suggestions.

- [ ] **Step 3: Create an audit checklist in notes for implementation**

Create a temporary checklist in `/tmp/x24067_comment_audit.md` with these exact headings:

```markdown
# X24067 Comment Audit

## Emily / Other Co-Author
- Pregnancy wording
- Em-dash reduction
- Neighborhood safety/loneliness citations
- emmeans and package citations
- Cross-sectional rationale
- SES-adjustment rationale
- Figure labels/reference categories
- MWCCS abbreviation in abstract

## Matthew Mimiaga
- UCLA affiliation
- PLWoH wording
- Multiple linear and multivariable logistic regression wording
- NHB comparison group
- CD4 interpretation location
- Mental health management conclusion wording

## Caitlin Moran
- Name/affiliation
- Move CD4 interpretation out of abstract Results when interpretive wording is present
- Sex-stratified HIV-status supplementary analysis
- PREVENT discrimination in PWH citations
- CD4 nadir availability explanation
- ZIP/geocode PREVENT component feasibility
- PTSD/endothelial dysfunction citation
- Female sex in REPRIEVE citation
- Limitations/strengths style
```

Expected: this checklist is used to drive edits and later summarized in `claude_x24067.md`. It does not need to be committed.

- [ ] **Step 4: Verify separated deliverables**

Run:

```bash
find "X24067_HA PREVENT" -maxdepth 2 -type f | sort
```

Expected: output includes `Pan_et_al_Revised_AIDS.qmd`, `Pan_et_al_Revised_AIDS.docx`, `X24067_Tables and Figures.docx`, `analysis/`, `figures/`, and `data/prevent_risk.sas7bdat`. Treat manuscript and table/result deliverables as separate outputs.

### Task 2: Check Local Data Support For Supplementary Analyses

**Files:**
- Read: `X24067_HA PREVENT/data/prevent_risk.sas7bdat`
- Read: `X24067_HA PREVENT/analysis/X24067_Pan_Heart Age v2.qmd`
- Potentially modify: `X24067_HA PREVENT/analysis/X24067_Pan_Heart Age v2.qmd`
- Potentially create: `X24067_HA PREVENT/analysis/x24067_supplementary_sex_hiv_table.csv`
- Potentially create: `X24067_HA PREVENT/analysis/x24067_supplementary_geocode_check.txt`

- [ ] **Step 1: Inspect analysis variable names**

Run:

```bash
rg -n "HAD|heart|STATUS|status|sex|gender|race|ethnic|region|smok|BMI|bmi|zip|geocode|adi|depriv|sdoh|CD4|viral|vl" "X24067_HA PREVENT/analysis/X24067_Pan_Heart Age v2.qmd"
```

Expected: identify the variable names used for HIV status, sex, age, HAD, HAD >=5, race/ethnicity, region, BMI/obesity, smoking, and hypertension/diabetes. If ZIP/geocode/ADI-like variables are absent from the analysis code, continue to inspect the SAS7BDAT metadata.

- [ ] **Step 2: Inspect SAS7BDAT metadata**

Run:

```bash
Rscript -e 'library(haven); d <- read_sas("X24067_HA PREVENT/data/prevent_risk.sas7bdat", n_max = 5); cat(paste(names(d), collapse = "\n"))'
```

Expected: prints all local data variable names. If `haven` is unavailable, install nothing automatically; instead try `Rscript -e 'installed.packages()[,1]'` to confirm missing package and document the blocker.

- [ ] **Step 3: Save variable inventory for the record**

Run:

```bash
Rscript -e 'library(haven); d <- read_sas("X24067_HA PREVENT/data/prevent_risk.sas7bdat", n_max = 5); writeLines(names(d), "X24067_HA PREVENT/analysis/x24067_variable_inventory.txt")'
```

Expected: `analysis/x24067_variable_inventory.txt` exists and will be committed if it materially supports the analysis decisions.

- [ ] **Step 4: Decide sex-stratified HIV-status table feasibility**

Use the inventory and analysis code. Proceed only if these fields are clearly identifiable: HIV status, sex, age, HAD or heart-age deviation, HAD >=5 or enough data to derive it, race/ethnicity, region, smoking, BMI/obesity, diabetes, and hypertension/SBP.

Expected decision:
- Feasible: create a supplementary table stratified by sex and HIV status.
- Not feasible: add a short methods/limitations sentence explaining that the local dataset does not contain sufficiently documented variables for this supplemental analysis.

- [ ] **Step 5: Decide ZIP/geocode feasibility**

Search the variable inventory for `zip`, `zipcode`, `geocode`, `tract`, `county`, `adi`, `svi`, `sdoh`, `deprivation`, `zcta`, and similar names.

Expected decision:
- Feasible: add a secondary geocode/area-level variable check or sensitivity table only if the variable is documented enough to interpret.
- Not feasible: address as future work, noting MWCCS geocoded data may be limited and was not available in the local analytic file.

### Task 3: Implement Supported Supplementary Table/Results Updates

**Files:**
- Modify if feasible: `X24067_HA PREVENT/analysis/X24067_Pan_Heart Age v2.qmd`
- Create if feasible: `X24067_HA PREVENT/analysis/x24067_supplementary_sex_hiv_table.csv`
- Modify: `X24067_HA PREVENT/Pan_et_al_Revised_AIDS.qmd`
- Modify: `X24067_HA PREVENT/X24067_Tables and Figures.docx` or regenerate an updated separate table/results deliverable if editing DOCX directly is impractical

- [ ] **Step 1: Add sex-stratified HIV table generation if feasible**

In `analysis/X24067_Pan_Heart Age v2.qmd`, add a small analysis block after the existing descriptive/supplemental table code. Use the actual variable names found in Task 2. The block should summarize, by sex and HIV status, at minimum: n, mean age, NHB %, South %, current smoking %, obesity or mean BMI, diabetes %, mean HAD, and HAD >=5 %.

Expected: the code writes `X24067_HA PREVENT/analysis/x24067_supplementary_sex_hiv_table.csv`.

- [ ] **Step 2: Run the new analysis block or equivalent script**

Run the narrowest available command. If the QMD is safe to render locally:

```bash
quarto render "X24067_HA PREVENT/analysis/X24067_Pan_Heart Age v2.qmd" --to html
```

If the QMD cannot run because of absolute Windows paths, run a focused `Rscript -e` command using `haven`, `dplyr`, and the variable names identified in Task 2.

Expected: CSV output exists, has one row per sex-by-HIV-status combination, and includes counts that sum to 2,729 or to the documented analytic subset.

- [ ] **Step 3: Update manuscript references to the new supplementary table**

Modify `Pan_et_al_Revised_AIDS.qmd` in the Results and Supplemental Material sections:

```markdown
Sex-stratified descriptive analyses by HIV status are provided in Supplemental Table S8. These analyses were added to contextualize the modest age difference between PLWH and PLWoH and to describe sex-specific differences in age, geography, smoking, obesity, race/ethnicity, and HAD.
```

Use this text only if the table is feasible and created. If not feasible, do not add a fake table; instead add a limitation/future-work sentence.

- [ ] **Step 4: Update separate table/result deliverable**

If editing DOCX is practical, add the new Supplemental Table S8 to `X24067_Tables and Figures.docx`. If direct editing is not practical, create a separate supplemental output file:

```text
X24067_HA PREVENT/analysis/x24067_supplementary_sex_hiv_table.csv
```

Expected: the final response clearly states whether the separate table/result deliverable was updated as DOCX, CSV, or both.

### Task 4: Revise Manuscript For Co-Author Comments

**Files:**
- Modify: `X24067_HA PREVENT/Pan_et_al_Revised_AIDS.qmd`
- Modify when new verified citations are added: `X24067_HA PREVENT/references_aids.bib`

- [ ] **Step 1: Apply author and affiliation edits**

Check tracked changes from MJM and CAM. Apply only clear identity/affiliation corrections:

```markdown
Matthew J. Mimiaga affiliation should include Department of Epidemiology, UCLA Fielding School of Public Health, Los Angeles, CA, United States of America.
Caitlin A. Moran name should include middle initial A.
Caitlin A. Moran affiliation should be Department of Medicine, Emory University School of Medicine, Atlanta, GA, United States of America.
```

Expected: author block reflects supported co-author edits.

- [ ] **Step 2: Verify Emily's April 28 comments are addressed**

Use `rg` checks:

```bash
rg -n "or pregnancy|currently pregnant|Social determinant variables|Mujahid|Hughes|emmeans|Wickham|Sjoberg|Robinson|VanderWeele|cross-sectional|socioeconomic|Reference categories" "X24067_HA PREVENT/Pan_et_al_Revised_AIDS.qmd"
```

Expected: pregnancy wording says not currently pregnant at the index visit; neighborhood safety and loneliness have citations; software packages have citations; cross-sectional and SES rationales are present; figure captions spell out reference categories.

- [ ] **Step 3: Add MWCCS abbreviation in abstract if absent**

In Abstract Methods, ensure the sentence reads:

```markdown
We analyzed cross-sectional data from 2,729 participants (963 PLWoH; 1,766 PLWH) enrolled in the MACS/WIHS Combined Cohort Study (MWCCS) between October 2020 and September 2024.
```

Expected: Amber's NIH-tracking comment is addressed.

- [ ] **Step 4: Make abstract Results less interpretive**

Replace the CD4 clause in abstract Results with a results-only version:

```markdown
In the HIV-specific model among PLWH, detectable viral load (β=1.3; 95% CI: 0.41, 2.1; p=0.004) and higher CD4 count (β=0.23 per 100 cells/mm³; 95% CI: 0.14, 0.32; p<0.001) were independently associated with higher HAD.
```

Move the interpretation to Abstract Conclusions or Discussion:

```markdown
The positive CD4 association likely reflects survivorship and cumulative treatment exposure rather than a harmful effect of immune reconstitution.
```

Expected: Caitlin's comment about interpretation belonging outside Results is addressed.

- [ ] **Step 5: Clarify NHB reference category in abstract**

Adjust the NHB sentence to include the comparator:

```markdown
NHB race/ethnicity, compared with NHW race/ethnicity, was the strongest demographic correlate of higher HAD (β=2.0; 95% CI: 1.2, 2.8; p<0.001) and elevated odds of HAD ≥5 years (OR=1.88; 95% CI: 1.47, 2.41; p<0.001).
```

Expected: Matthew's "Whites?" comment is resolved.

- [ ] **Step 6: Add verified citations from Caitlin's PMIDs**

Use PubMed or local references to verify bibliographic details for PMIDs `40905667`, `41004413`, `39832389`, and `40281648`. Add BibTeX entries to `references_aids.bib` only after verification.

Expected: new citations are used sparingly in these manuscript locations:
- PREVENT performance in people with HIV: Methods/Limitations or Discussion PREVENT paragraph.
- PTSD/endothelial dysfunction: PTSD/depression discussion paragraph.
- REPRIEVE female-sex cardiac events: sex/interaction discussion paragraph.

- [ ] **Step 7: Address CD4 nadir availability**

In Limitations or the CD4 discussion paragraph, ensure this meaning is explicit:

```markdown
Nadir CD4 count was not available in the local analytic file used for this analysis; current CD4 therefore should not be interpreted as a proxy for lifetime immunologic injury.
```

Expected: Caitlin's surprise about CD4 nadir is acknowledged without overstating unavailable data.

- [ ] **Step 8: Address ZIP/geocode analysis outcome**

If ZIP/geocode variables are not present or not interpretable in the local analytic file, add:

```markdown
Although PREVENT can incorporate residential ZIP code as an optional social-risk component, ZIP code or geocoded deprivation measures were not available in the local analytic file for this analysis. Future MWCCS analyses with geocoded data could evaluate whether area-level social risk attenuates associations with race/ethnicity or region.
```

If a supported geocode analysis was run, replace this with the actual result and cite the supplemental table.

Expected: Caitlin's ZIP/geocode point is addressed transparently.

- [ ] **Step 9: Humanize limitations and strengths structure**

Revise the Limitations section from a numbered-feeling list into smoother prose. Keep all substantive limitations but remove ordinal markers such as "First," "Second," through "Eleventh," where possible. Place strengths after limitations if doing so improves the ending tone, or keep the current order if journal convention favors strengths before limitations.

Expected: no limitation sentence begins with a mechanical ordinal sequence.

### Task 5: Humanizer Academic Pass

**Files:**
- Read skill: `/Users/panyue/.codex/skills/humanizer_academic/SKILL.md`
- Modify: `X24067_HA PREVENT/Pan_et_al_Revised_AIDS.qmd`

- [ ] **Step 1: Load the humanizer instructions**

Run:

```bash
sed -n '1,240p' /Users/panyue/.codex/skills/humanizer_academic/SKILL.md
```

Expected: identify the workflow for reducing AI-like academic prose while preserving scientific meaning.

- [ ] **Step 2: Scan for style issues**

Run:

```bash
rg -n "notably|moreover|furthermore|underscore|highlight|comprehensive|robust|critical|Importantly|First,|Second,|Third,|Fourth,|Fifth,|Sixth,|Seventh,|Eighth,|Ninth,|Tenth,|Eleventh,|---|—" "X24067_HA PREVENT/Pan_et_al_Revised_AIDS.qmd"
```

Expected: identify phrases to soften or vary. Preserve section dividers made of hyphens.

- [ ] **Step 3: Edit prose conservatively**

Apply localized edits in Abstract, Discussion, Strengths, Limitations, and Conclusions. Keep estimates, p-values, confidence intervals, citations, and section structure intact.

Expected: manuscript reads less mechanical; no statistical content changes unless already required by comment response.

### Task 6: Update Project Log

**Files:**
- Modify: `X24067_HA PREVENT/claude_x24067.md`

- [ ] **Step 1: Update last-updated line**

Change the top note to reflect the new revision date and scope:

```markdown
> Last updated: May 2026 (co-author comment resolution, supported supplementary analysis checks, humanized manuscript pass, separated manuscript/table-result deliverables).
```

- [ ] **Step 2: Add a new revision history section**

Add a section after `## 9b. Co-Author Review Round (April 28, 2026)`:

```markdown
## 9c. Co-Author Follow-Up Revision Round (May 2026)
```

Include a compact table with rows for Emily verification, Amber MWCCS abbreviation, Matthew edits, Caitlin scientific comments, supplementary analyses, humanizer pass, and deliverable separation.

Expected: `claude_x24067.md` accurately documents what was changed and which files were touched.

### Task 7: Render And Verify

**Files:**
- Read/Render: `X24067_HA PREVENT/Pan_et_al_Revised_AIDS.qmd`
- Output if successful: `X24067_HA PREVENT/Pan_et_al_Revised_AIDS.html`
- Output if successful: `X24067_HA PREVENT/Pan_et_al_Revised_AIDS.docx`

- [ ] **Step 1: Check citation keys**

Run:

```bash
rg -o "@[A-Za-z0-9_:-]+" "X24067_HA PREVENT/Pan_et_al_Revised_AIDS.qmd" | sed 's/@//' | sort -u > /tmp/x24067_used_keys.txt
rg -n "^@[A-Za-z0-9_:-]+\\{" "X24067_HA PREVENT/references_aids.bib" | sed 's/^@[^{}]*(//' | sed 's/,.*//' | sort -u > /tmp/x24067_bib_keys.txt
comm -23 /tmp/x24067_used_keys.txt /tmp/x24067_bib_keys.txt
```

Expected: no missing citation keys printed. If the command fails because of shell quoting differences, use an equivalent `rg` and compare manually.

- [ ] **Step 2: Scan for forbidden or risky artifacts**

Run:

```bash
rg -n "\\$|comment-start|comment-end|\\.insertion|\\.deletion|TODO|TBD|or pregnancy|HIV\\+|HIV−|seropositive|seronegative" "X24067_HA PREVENT/Pan_et_al_Revised_AIDS.qmd"
```

Expected: no LaTeX math delimiters, no tracked-change artifacts, no TODO/TBD, no old pregnancy wording, no disallowed HIV terminology. Escaped email addresses or currency symbols should be reviewed manually if printed.

- [ ] **Step 3: Render manuscript**

Run:

```bash
cd "X24067_HA PREVENT"
python render_manuscript.py
```

Expected: HTML and DOCX render successfully. If DOCX fails due to a Word file lock, render HTML and document the DOCX blocker. If Quarto is unavailable, document the missing dependency.

- [ ] **Step 4: Review rendered outputs**

Run:

```bash
ls -lh "X24067_HA PREVENT/Pan_et_al_Revised_AIDS.html" "X24067_HA PREVENT/Pan_et_al_Revised_AIDS.docx"
```

Expected: rendered files exist and have nonzero sizes if rendering succeeded.

### Task 8: Commit And Push Relevant X24067 Updates

**Files:**
- Commit relevant changes under `X24067_HA PREVENT/`
- Do not commit unrelated dirty files such as `Import Data.sas`, `SAS Prog/`, parent `.DS_Store`, unrelated QMDs, or unrelated app files

- [ ] **Step 1: Review git status and diff**

Run:

```bash
git status --short
git diff -- "X24067_HA PREVENT"
```

Expected: relevant changes are limited to manuscript, references, analysis/table outputs, rendered outputs if regenerated, and `claude_x24067.md`.

- [ ] **Step 2: Stage only relevant files**

Use explicit paths, for example:

```bash
git add "X24067_HA PREVENT/Pan_et_al_Revised_AIDS.qmd"
git add "X24067_HA PREVENT/references_aids.bib"
git add "X24067_HA PREVENT/claude_x24067.md"
git add "X24067_HA PREVENT/analysis/x24067_variable_inventory.txt"
git add "X24067_HA PREVENT/analysis/x24067_supplementary_sex_hiv_table.csv"
git add "X24067_HA PREVENT/Pan_et_al_Revised_AIDS.html"
git add "X24067_HA PREVENT/Pan_et_al_Revised_AIDS.docx"
```

Expected: stage only files that actually changed and are relevant. Skip nonexistent optional outputs.

- [ ] **Step 3: Commit**

Run:

```bash
git commit -m "Revise X24067 HA PREVENT manuscript for coauthor comments"
```

Expected: one focused commit with relevant X24067 files only.

- [ ] **Step 4: Push**

Run:

```bash
git push
```

Expected: branch pushes to GitHub. If push requires authentication or network approval, request escalation and report any blocker.
