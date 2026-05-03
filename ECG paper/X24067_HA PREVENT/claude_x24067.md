# Claude Context File — Project X24067: Heart Age & Heart Age Deviation in HIV

> This file provides Claude with full project context when starting a new session in this directory.
> Last updated: May 3, 2026 (co-author follow-up revisions, supported sex-by-HIV supplementary table, ZIP/geocode feasibility check, humanized manuscript pass, separated manuscript/table-result deliverables).

---

## 1. Project Identity

| Field | Details |
|-------|---------|
| **Project code** | X24067 |
| **Study title** | Heart Age and Heart-Age Deviation Among People With and Without HIV in the United States |
| **Lead author / PI** | Yue Pan, PhD — Department of Public Health Sciences, Division of Biostatistics & Bioinformatics, University of Miami Miller School of Medicine (panyue@med.miami.edu) |
| **Co-authors** | 18 total, spanning Johns Hopkins, UCLA, Northwestern, Emory, UNC Chapel Hill, UCSF, and other MWCCS sites |
| **Target journal** | AIDS (Wolters Kluwer / Lippincott) — Vancouver/NLM numeric citation style |
| **Manuscript status** | Revised submission update (May 2026) |
| **Grant context** | Scholar 2024 award — strategy and aims documents in this directory |

---

## 2. Scientific Background

### What is Heart Age (HA) and Heart Age Deviation (HAD)?
- **Heart Age (HA):** The age of a "cardiovascular average" person with the same 10-year CVD risk as the participant. Computed from the **AHA 2023/2024 PREVENT equations** (Khan et al., Circulation 2024).
- **Heart Age Deviation (HAD = HA − chronological age):** Quantifies how many years older or younger the cardiovascular system appears relative to the person's actual age. Positive HAD = accelerated cardiovascular aging.
- **PREVENT equations** replace the older Pooled Cohort Equations (PCE/Framingham). Key improvements: incorporates eGFR, BMI, HbA1c; **removes race as a predictor**; uses sex-specific estimation; validated in 6.5 million+ diverse US adults.
- PREVENT was not developed specifically for HIV populations. Emerging CNICS and REPRIEVE evaluations suggest calibration/reclassification concerns among people with HIV, so PREVENT-derived HA should be interpreted cautiously.

### Cohort: MWCCS
- **MACS/WIHS Combined Cohort Study (MWCCS)** — largest US HIV cohort, up to 35 years of follow-up.
- **MWCCS sites/regions:** South, Mid-Atlantic/Northeast, West Coast, and Midwest clinical research sites.
- **Study period:** October 2020 – September 2024 (visit windows V101–V104).
- **Analytic sample:** n=2,729 (1,766 PLWH; 963 PLWoH); age 30–75; no prior CVD; complete PREVENT variables.
- Demographics: mean age 54.4 years (SD=10.0); 62.0% women; 60.7% Non-Hispanic Black (NHB).

### Key Findings
| Finding | Estimate | p-value |
|---------|----------|---------|
| Mean HAD overall | 3.2 years (SD=7.5) | — |
| HAD ≥5 years prevalence | 32.5% | — |
| HIV serostatus → HAD | β = −0.18 (95% CI −0.77, 0.42) | p=0.56 (null) |
| NHB race/ethnicity → HAD | β = +2.0 (95% CI 1.2, 2.8) | p<0.001 |
| Southern US region → HAD | β = +1.7 (95% CI 0.78, 2.7) | p<0.001 |
| Detectable viral load → HAD (among PLWH) | β = +1.3 (95% CI 0.41, 2.1) | p=0.004 |
| CD4 count → HAD (per 100 cells/mm³) | β = +0.23 (95% CI 0.14, 0.32) | p<0.001 |
| Depressive symptoms (CES-D ≥16) → HAD | β = +1.5 (95% CI 0.39, 2.6) | p=0.009 |
| Female sex → HAD | β ≈ −1.5 to −2.1 across models | p<0.001 |
| HAD ≥5: NHB odds ratio | OR = 1.88 (95% CI 1.47, 2.41) | p<0.001 |

**Headline message:** HIV serostatus alone does not predict excess cardiovascular aging on PREVENT-derived HAD; however, viral load and depression are independent predictors comparable in magnitude, and NHB race/ethnicity is the strongest demographic correlate — reflecting structural racism rather than biology.

---

## 3. File Inventory

| File | Role | Notes |
|------|------|-------|
| **Pan_et_al_Revised_AIDS.qmd** | MAIN MANUSCRIPT — source of truth | Quarto markdown; edit this file |
| **Pan_et_al_Revised_AIDS.html** | Rendered HTML output | Self-contained (1.3 MB); for sharing/review |
| **Pan_et_al_Revised_AIDS.docx** | Rendered Word output | For journal submission/editing |
| **references_aids.bib** | Bibliography | 47 BibTeX entries; AIDS journal format |
| **aids.csl** | Citation style | Vancouver/NLM numeric (AIDS journal) |
| **render_manuscript.py** | Python rendering helper | Automates quarto render calls |
| Manuscript_Heart_Age_HIV_MWCCS.qmd | Older draft | Do NOT edit — kept for reference only |
| Pan_et_al_Heart_Age_HIV 04062026.docx | Previous Word version | Reference copy; do not overwrite |
| Pan_et_al_Heart_Age_HIV_PLOS_ONE_Manuscript.docx | Earlier PLOS ONE format | Archived |
| X24067 HA Abstract IAS 01272026.docx | IAS conference abstract | Submitted January 2026 |
| E. Pan_Aims_Scholar_2024.docx | Grant specific aims | Scholar 2024 award |
| F. Pan_Strategy_Scholar_2024.docx | Grant research strategy | Scholar 2024 award |
| **analysis/** (subfolder) | All analysis source + outputs | See below |
| analysis/X24067_Pan_Heart Age v2.qmd | **Figure-generating script** for Fig 1 / Fig 2 | Aim 1 forest plot ≈ line 689; Aim 4 forest plot ≈ line 855; uses absolute Windows path to `prevent_risk.sas7bdat` |
| analysis/X24067_Pan_Heart Age.qmd | Earlier exploratory analysis | Reads `prevent_risk_baseline.csv` |
| analysis/X24067_Pan_Heart Age.pdf | Rendered exploratory PDF | |
| analysis/X24067_Pan_Heart Age*.html | Dated rendered analysis HTMLs (09/12/2025, 01/17/2026, 01/23/2026) | Snapshots; do not edit |
| **figures/** (subfolder) | Causal-pathway and table snapshot images | causal_pathway_*.{png,pdf}; Table 5 + table 6 PNG snapshots |

---

## 4. Manuscript Structure

The main file `Pan_et_al_Revised_AIDS.qmd` has this section structure:

```
## Abstract                          (structured: Background / Methods / Results / Conclusions)
## Introduction
## Materials and Methods
   ### Ethics statement
   ### Study design and population
   ### Heart age and heart age deviation
   ### Covariates
   ### Statistical analysis
## Results
   ### Study population characteristics
   ### Heart age and heart age deviation
   ### Multivariable predictors of heart age deviation
   ### HIV serostatus and sex interaction
   ### HIV-specific predictors among PLWH
   ### Mental health and social determinants
## Discussion
   [7 paragraphs: overview → HAD clinical context → PREVENT as risk communication tool →
    HIV null finding → CD4 paradox → NHB race/structural racism → Depression → Sex/interaction]
   ### Strengths          (7 points — added April 2026)
   ### Limitations        (11 points — expanded April 2026)
## Conclusions
## Conflicts of interest  (added April 20, 2026)
## Funding               (MWCCS/NHLBI acknowledgment; added April 20, 2026)
## Acknowledgments       (MWCCS site PIs + grant numbers; added April 20, 2026)
## References            (auto-generated from references_aids.bib via aids.csl)
## Tables                (Tables 1–4 main; placeholders and captions only)
## Figures               (Figures 1–2 main; placeholders and captions only)
## Supplemental Material (Tables S1–S7; Figs S1–S2)
```

### Main Text Tables (4 tables — AIDS journal limit)
| Table | Content | In-text reference |
|-------|---------|-------------------|
| **Table 1** | Descriptive characteristics by HIV serostatus | (Table 1) |
| **Table 2** | Multivariable linear regression: HAD (continuous) | (Table 2) |
| **Table 3** | Multivariable logistic regression: HAD ≥5 years | (Table 3; Fig 1) |
| **Table 4** | HIV-specific model: viral load + CD4 → HAD (PLWH only) | (Table 4; Fig 2) |

### Main Text Figures (2 figures)
| Figure | Content | In-text reference |
|--------|---------|-------------------|
| **Fig 1** | Forest plot — logistic regression ORs for HAD ≥5 years | (Table 3; Fig 1) |
| **Fig 2** | Forest plot — HIV-specific predictors (β coefficients) | (Table 4; Fig 2) |

### Supplemental Material (Online Supplementary)
| Label | Content | Previously |
|-------|---------|------------|
| Supplemental Table S1 | PREVENT 10-year CVD risk by subgroups | Table 2 |
| Supplemental Table S2 | HAD (years) by subgroups | Table 3 |
| Supplemental Table S3 | Heart age by subgroups | Table 4 |
| Supplemental Table S4 | Prevalence of HAD ≥5 years by subgroups | Table 5 |
| Supplemental Table S5 | Prevalence of HA > chronological age by subgroups | Table 6 |
| Supplemental Table S6 | MICE model: mental health & social determinants → HAD | Table 9 |
| Supplemental Table S7 | HIV × sex interaction model | Table S1 |
| Supplemental Table S8 | Sex-stratified descriptive characteristics and HAD by HIV serostatus | Added May 2026 |
| Supplemental Fig S1 | Predicted HAD by sex × HIV serostatus (marginal means) | Fig 2 |
| Supplemental Fig S2 | Heatmap — prevalence of HAD ≥5 years across subgroups | Fig 4 |

**Rationale for supplemental designation:** AIDS journal limits main-text tables + figures to ~4 each. Tables 1, 2, 3, 4 contain the primary analytical results supporting all conclusions. Tables S1–S7 are descriptive stratified tables and secondary analyses; Figs S1–S2 are exploratory visualizations.

---

## 5. Statistical Methods Summary

- **Software:** R 4.5.3 (tidyverse, gtsummary, emmeans, broom, mice)
- **Primary analysis:** Multivariable linear regression (continuous HAD) and logistic regression (binary HAD ≥5 years)
- **Covariates:** age, sex, race/ethnicity, US region, BMI, smoking, diabetes, SBP, HIV serostatus
- **HIV-specific model:** Among PLWH only — viral load (detectable/undetectable), CD4 count, ART status
- **Mental health model:** MICE (m=10 imputed datasets, Rubin's rules) for CES-D, PTSD, loneliness, neighborhood safety
- **Interaction:** HIV × sex term in main model
- **Significance:** Two-sided α=0.05

---

## 6. Rendering Instructions

```bash
# Navigate to this directory first, then:

# Render HTML
quarto render Pan_et_al_Revised_AIDS.qmd --to html

# Render Word
quarto render Pan_et_al_Revised_AIDS.qmd --to docx

# Or use the Python helper (checks dependencies, handles errors)
python render_manuscript.py
```

**Important:** Close `Pan_et_al_Revised_AIDS.docx` in Word before rendering DOCX — Word locks the file and Pandoc will throw `permission denied`.

---

## 7. Known Issues & Rules — Read Before Editing

1. **No LaTeX math delimiters.** Do NOT use `$...$` in this QMD. Pandoc misparses math boundaries adjacent to text (e.g., `$\geq$5` becomes one long math block). Use Unicode directly:
   - ≥ (not `$\geq$`)
   - β (not `$\beta$`)
   - × (not `$\times$`)
   - μ (not `$\mu$`)
   - α (not `$\alpha$`)

2. **Citation style is numeric (Vancouver/NLM).** `aids.csl` produces numbered references like [1], [2,3]. Do not switch to author-year format.

3. **Bibliography key conventions.** `references_aids.bib` uses AuthorYear format (e.g., `Khan2024`, `So-Armah2020`). Verify keys match exactly before adding new citations. The hyphen in `So-Armah2020` is valid BibTeX.

4. **PLWH/PLWoH terminology.** Use "people living with HIV" (PLWH) and "people living without HIV" (PLWoH). Do not use HIV+/HIV−, seropositive/seronegative, or infected/uninfected.

5. **HAD threshold.** Primary threshold is HAD ≥5 years. Secondary is HAD ≥10 years. Both are reported. The ≥5 threshold is a priori defined based on clinical convention (not data-driven).

6. **Do not edit the older drafts.** `Manuscript_Heart_Age_HIV_MWCCS.qmd` and the earlier `.docx` files are archives — edit only `Pan_et_al_Revised_AIDS.qmd`.

---

## 8. Claude-Assisted Revision History (April 2026)

A comprehensive 10-task peer review and revision pass was completed, targeting Circulation / Lancet HIV / AIDS acceptance standards:

| Task | Description | Key Changes |
|------|-------------|-------------|
| 1 | Numerical & internal consistency audit | Verified all β, OR, CI, p-values consistent across abstract, results, discussion |
| 2 | Narrative gaps & logical weaknesses | Strengthened introduction rationale; added PREVENT-in-HIV caution |
| 3 | Statistical interpretation & clarity | Clarified HAD threshold justification; added magnitude contextualization |
| 4 | CD4 "paradox" deep revision | Added survivorship bias explanation; nadir vs. current CD4 distinction; magnitude context (1.8 yrs at cohort mean CD4=800) |
| 5 | NHB race conceptual reinforcement | Reframed as structural racism (allostatic load, segregation, SES, place-based determinants); added unmeasured SES caveat |
| 6 | PREVENT model conceptual strengthening | Added "risk communication tool, not risk discovery tool" framing; comparison to imaging biomarkers (CAC, cIMT, PWV) |
| 7 | Table & figure enhancement | Added exploratory threshold caveat footnote to Table 5 |
| 8 | Reference augmentation | Added D'Agostino 2008 (Circulation) — seminal Framingham heart age concept paper |
| 9 | Reviewer #2 simulation | 8 simulated critical comments generated and addressed in manuscript |
| 10 | Final strengthening pass | Strengthened abstract conclusions; added "first comprehensive assessment" framing |
| + | Strengths section | New ### Strengths subsection added with 7 points (April 20, 2026) |
| + | Font consistency fix | All 63 LaTeX math expressions replaced with Unicode characters |
| + | Peer review pass (April 20, 2026) | Fixed 9 issues: wrong sample sizes in Strengths (1,715→1,766), causal inference language, HAD age-direction error (corrected to 50–59 peak), CD4 units standardized to mm³, neighborhood safety direction clarified, PTSD CI added, age OR noted non-significant in logistic, figure citations added (Fig 1/2/S1/S2), COI + Funding + Acknowledgments sections added |
| + | Table/figure restructuring (April 20, 2026) | AIDS journal compliance: 4 main tables (1–4), 2 main figures (1–2); 7 supplemental tables (S1–S7), 2 supplemental figures (S1–S2); both QMD and X24067_Tables and Figures.docx updated and reordered |
| + | Pre-distribution review pass (April 20, 2026) | Full numerical consistency audit (all 18 key stats verified ✓); 6 edits applied and confirmed: (1) MICE missing-data filled in from `prevent_risk.sas7bdat` (N=2,729): CES-D 10.9% missing, PSS-10 9.7%, neighborhood safety 9.1%, loneliness 8.8%, PTSD (PCL-C) 93.6% missing (n=176 available; assessed in subset only); 87.2% complete on the 4 primary psychosocial vars; (2) R version confirmed **4.5.3**; (3) HAD ≥10-year robustness sentence added to Conclusions; (4) survivor bias / PREVENT lower-bound caveat added to Conclusions; (5) age OR language clarified; (6) `p\>0.9` escaping fixed |
| + | PCL-C/PTSD missingness disclosure (April 20, 2026) | Added 3 targeted edits to address PCL-C availability (n=176; 6.4%): Results — caveat added after PTSD estimate; Limitation #4 — PCL-C subset assessment disclosed, imputed estimate flagged as preliminary, MAR assumption noted; Discussion (depression paragraph) — null PTSD finding contextualized: PTSD–depression co-occurrence, data sparsity rationale, mechanistic plausibility of PTSD–CVD pathways, call for future systematic PCL-C assessment |

### Limitations expanded to 11 points (April 2026):
1. Cross-sectional design (no causal inference)
2. PREVENT not developed for HIV populations; emerging CNICS/REPRIEVE evaluations require cautious interpretation
3. MWCCS volunteer cohort (high care engagement; limited generalizability)
4. Residual confounding (ART regimen, IL-6, D-dimer, HIV duration)
5. Survivor bias (long-term survivor cohort)
6. Nadir CD4 unavailable
7. No individual-level SES adjustment
8. Causal pathway / mediation issue (race + region may share pathway)
9. Underpowered for HIV × sex interaction
10. HAD thresholds not validated against hard CVD endpoints in PLWH
11. Age difference between PLWH and PLWoH (53.9 vs. 55.3 yrs; nonlinear PREVENT age relationship)

---

## 9. Key References to Know

| Citation key | Reference | Why important |
|-------------|-----------|---------------|
| Khan2024 | Khan et al., Circulation 2024 | PREVENT equations (primary methodology paper) |
| Khan2023 | Khan et al., Circulation 2023 | PREVENT development paper |
| DAgostino2008 | D'Agostino et al., Circulation 2008 | Seminal Framingham heart age concept |
| Tsao2023 | Tsao et al., Circulation 2023 | AHA Heart Disease & Stroke Statistics 2023 |
| Shah2018 | Shah et al., Circulation 2018 | CVD burden in PLWH |
| Hsue2019 | Hsue & Waters, Nat Rev Cardiol 2019 | HIV and coronary heart disease mechanisms |
| Feinstein2019 | Feinstein et al., Circulation 2019 | AHA CVD prevention in PLWH |
| So-Armah2020 | So-Armah et al., Lancet HIV 2020 | HIV and CVD (Lancet HIV) |
| Geronimus2006 | Geronimus et al. 2006 | Weathering hypothesis / allostatic load in NHB |
| Remien2019 | Remien et al. 2019 | Mental health in HIV |

---

## 9b. Co-Author Review Round (April 28, 2026)

A co-author returned the revised manuscript with seven specific comments. All were addressed in this session.

| # | Comment | Resolution | Files touched |
|---|---------|-----------|---------------|
| 1 | Exclusion criteria say "or pregnancy" — could bias the female sample | Reworded to "and were not currently pregnant at the index visit" (matches PREVENT contraindication; no ever-pregnant filter was ever applied in code) | `Pan_et_al_Revised_AIDS.qmd` (Methods §Study design) |
| 2 | Too many em-dashes — read as AI-written | Replaced ~30 prose ` --- ` and word-attached `---` instances with commas (and one `;`); preserved the eleven `------------------------------------------------------------------------` section dividers | `Pan_et_al_Revised_AIDS.qmd` (Intro, Discussion, Strengths, Limitations) |
| 3 | Add citations for "neighborhood safety and loneliness" | Cited Mujahid 2007 (neighborhood safety scale) and Hughes 2004 (UCLA-3 loneliness scale); added BibTeX entries `Mujahid2007`, `Hughes2004` | `Pan_et_al_Revised_AIDS.qmd` (§Covariates), `references_aids.bib` |
| 3b | Add citations for `emmeans`; for `tidyverse`, `gtsummary`, `emmeans`, `broom`, `mice` | Cited [@Lenth2024] inline at emmeans first mention; cited [@Wickham2019; @Sjoberg2021; @Lenth2024; @Robinson2024; @vanBuuren2011] at the package list; `vanBuuren2011` already existed | `Pan_et_al_Revised_AIDS.qmd` (§Statistical analysis), `references_aids.bib` |
| 4 | Why cross-sectional when longitudinal data exist? | Added justification at the end of §Study design: cross-sectional baseline characterization is a prerequisite for the planned longitudinal trajectory analysis | `Pan_et_al_Revised_AIDS.qmd` |
| 5 | Why no SES adjustment? | Added paragraph in §Statistical analysis: SES indicators are collinear with race/region; adjusting in a non-mediation framework would over-adjust away the race-indexed structural exposures (cited VanderWeele & Robinson 2014); SES sensitivity analyses planned | `Pan_et_al_Revised_AIDS.qmd`, `references_aids.bib` (`VanderWeele2014`) |
| 6, 7 | Figure 1 & 2: clean variable names; reference categories unclear | Rewrote `term_label` `case_when` blocks in `analysis/X24067_Pan_Heart Age v2.qmd` (Aim 1 ≈ line 679; Aim 4 ≈ line 843) with publication-ready labels and explicit "(vs reference)" annotations; updated plot titles, subtitles (state reference categories), and axis labels; updated Fig 1/Fig 2 captions in the manuscript to spell out reference categories | `Pan_et_al_Revised_AIDS.qmd` (§Figures), `analysis/X24067_Pan_Heart Age v2.qmd` |

### New BibTeX keys added to `references_aids.bib`
- `Wickham2019` — tidyverse (JOSS 2019)
- `Sjoberg2021` — gtsummary (R Journal 2021)
- `Lenth2024` — emmeans (R package manual)
- `Robinson2024` — broom (R package manual)
- `Mujahid2007` — neighborhood-scale measurement properties (Am J Epidemiol 2007)
- `Hughes2004` — UCLA-3 loneliness scale (Res Aging 2004)
- `VanderWeele2014` — over-adjustment for race in regression (Epidemiology 2014)

### Figure-generation reference (post-move)
- **Fig 1** (HAD ≥5 forest plot): `analysis/X24067_Pan_Heart Age v2.qmd`, `case_when` ≈ L679, `ggplot` ≈ L689
- **Fig 2** (HIV-specific forest plot, PLWH only): same file, `case_when` ≈ L843, `ggplot` ≈ L855
- Reference categories used everywhere: HIV-negative (PLWoH); male; Non-Hispanic White; West region; undetectable viral load.
- Variables modeled per increment: age per 10 years; CD4 count per 100 cells/mm³.
- The script uses absolute Windows paths (`C:/Users/panyue/Box/...`) so the file move did not break path resolution; re-running v2.qmd on Yue's Windows machine regenerates the figures into the SAS Output `Figures/` directory.

### Folder reorganization (April 28, 2026)
Untracked X24067 files were consolidated from the parent `ECG paper/` directory into `X24067_HA PREVENT/` to keep this paper separate from the X23026 / X23041 / X23043 / ECG-paper projects:
- `X24067_HA PREVENT/analysis/` — `X24067_Pan_Heart Age.qmd`, `X24067_Pan_Heart Age v2.qmd`, `X24067_Pan_Heart Age.pdf`, four dated rendered HTMLs.
- `X24067_HA PREVENT/figures/` — `causal_pathway_*.{png,pdf}`, Table 5 PNG snapshot, table 6 PNG snapshot.
- Files were not under git version control (untracked), so plain `mv` was used; commit them when ready.

---

## 9c. Co-Author Follow-Up Revision Round (May 3, 2026)

Follow-up revisions were completed after review of `Other co-author.docx`, `Pan_et_al_Revised_AIDSMJM.docx`, and `Pan_et_al_Revised_AIDS_cam.docx`. The work preserved the separated deliverable workflow: manuscript text remains in `Pan_et_al_Revised_AIDS.qmd`, while actual table/result outputs are maintained separately under `analysis/` and existing table/figure deliverables.

| Area | Resolution | Files touched |
|------|------------|---------------|
| Emily / Other co-author audit | Confirmed April 28 items remained addressed: current-pregnancy wording, em-dash reduction, neighborhood/loneliness citations, software citations, cross-sectional rationale, SES rationale, and figure reference categories. Added MWCCS abbreviation to the abstract. | `Pan_et_al_Revised_AIDS.qmd` |
| Matthew Mimiaga comments | Added Department of Epidemiology to UCLA affiliation; clarified PLWoH wording and regression wording; added NHB vs NHW comparator in the abstract; moved CD4 interpretation out of abstract Results while retaining cautious interpretation in Discussion. | `Pan_et_al_Revised_AIDS.qmd` |
| Caitlin Moran comments | Updated name to Caitlin A. Moran and affiliation to Department of Medicine, Emory University School of Medicine; added PREVENT-in-PWH context from CNICS and REPRIEVE; added PTSD/endothelial dysfunction citation; added REPRIEVE sex/CVD-events context; clarified CD4 nadir was unavailable in the local analytic file; added ZIP/geocode limitation. | `Pan_et_al_Revised_AIDS.qmd`, `references_aids.bib` |
| Supported supplementary analysis | Local `prevent_risk.sas7bdat` supports a dedicated sex-by-HIV descriptive table. Added Supplemental Table S8 and generated separate CSV/Markdown table outputs. N sums to 2,729 across four sex-by-HIV groups: Female/PLWoH 505, Female/PLWH 1,186, Male/PLWoH 458, Male/PLWH 580. | `analysis/X24067_Pan_Heart Age v2.qmd`, `analysis/x24067_supplementary_sex_hiv_table.csv`, `analysis/x24067_supplementary_sex_hiv_table.md`, `Pan_et_al_Revised_AIDS.qmd` |
| ZIP/geocode feasibility | ZIP/ZCTA, census tract, county, FIPS, ADI, SVI, deprivation index, and address linkage fields were not present in the local analytic file. Created a feasibility note and handled this as future work/limitation rather than unsupported analysis. | `analysis/x24067_variable_inventory.txt`, `analysis/x24067_supplementary_geocode_check.txt`, `Pan_et_al_Revised_AIDS.qmd` |
| Humanizer pass | Applied `humanizer_academic` style review: removed causal overstatement from cross-sectional results, softened promotional/AI-like wording, removed mechanical limitation numbering, placed Strengths after Limitations, and preserved estimates/citations. | `Pan_et_al_Revised_AIDS.qmd` |

### New BibTeX keys added in May 2026
- `Durstenfeld2025PREVENT` — CNICS evaluation of PREVENT score accuracy among people with HIV (AIDS 2025).
- `Grinspoon2025PREVENT` — REPRIEVE comparison of PCE, PREVENT, and SCORE2 risk assessment among people with HIV (Clin Infect Dis 2026).
- `Vatsa2025PTSD` — PTSD and endothelial dysfunction in women with HIV (JACC Adv 2025).
- `Grinspoon2025RiskFactors` — REPRIEVE CVD-event risk factors among people with HIV, including sex-specific context (Clin Infect Dis 2026).

### Separate table/result outputs added
- `analysis/x24067_supplementary_sex_hiv_table.csv`
- `analysis/x24067_supplementary_sex_hiv_table.md`
- `analysis/x24067_variable_inventory.txt`
- `analysis/x24067_supplementary_geocode_check.txt`

---

## 10. Future Work / Open Questions

- Longitudinal analysis: time-varying CD4, HAD trajectories over follow-up
- Nadir CD4 availability in future MWCCS data pulls
- Further calibration/discrimination of PREVENT in HIV populations, including event validation against MWCCS outcomes
- Comparison of PREVENT-derived HA vs. imaging biomarkers (CAC, cIMT, PWV) in MWCCS
- Geocoded or ZIP-linked analyses of area-level social risk, if restricted MWCCS linkage data become available
- Whether HA-based feedback motivates CVD risk behavior change in PLWH (intervention study)
- HAD ≥5 threshold validation against incident CVD events
