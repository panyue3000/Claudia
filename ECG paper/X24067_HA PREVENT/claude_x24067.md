# Claude Context File — Project X24067: Heart Age & Heart Age Deviation in HIV

> This file provides Claude with full project context when starting a new session in this directory.
> Last updated: April 2026.

---

## 1. Project Identity

| Field | Details |
|-------|---------|
| **Project code** | X24067 |
| **Study title** | Heart Age and Heart-Age Deviation Among People With and Without HIV in the United States |
| **Lead author / PI** | Yue Pan, PhD — Department of Public Health Sciences, Division of Biostatistics & Bioinformatics, University of Miami Miller School of Medicine (panyue@med.miami.edu) |
| **Co-authors** | 18 total, spanning Johns Hopkins, UCLA, Northwestern, Emory, UNC Chapel Hill, UCSF, and other MWCCS sites |
| **Target journal** | AIDS (Wolters Kluwer / Lippincott) — Vancouver/NLM numeric citation style |
| **Manuscript status** | Revised submission (April 2026) |
| **Grant context** | Scholar 2024 award — strategy and aims documents in this directory |

---

## 2. Scientific Background

### What is Heart Age (HA) and Heart Age Deviation (HAD)?
- **Heart Age (HA):** The age of a "cardiovascular average" person with the same 10-year CVD risk as the participant. Computed from the **AHA 2023/2024 PREVENT equations** (Khan et al., Circulation 2024).
- **Heart Age Deviation (HAD = HA − chronological age):** Quantifies how many years older or younger the cardiovascular system appears relative to the person's actual age. Positive HAD = accelerated cardiovascular aging.
- **PREVENT equations** replace the older Pooled Cohort Equations (PCE/Framingham). Key improvements: incorporates eGFR, BMI, HbA1c; **removes race as a predictor**; uses sex-specific estimation; validated in 6.5 million+ diverse US adults.
- PREVENT has **not been validated in HIV populations** — an important limitation.

### Cohort: MWCCS
- **MACS/WIHS Combined Cohort Study (MWCCS)** — largest US HIV cohort, up to 35 years of follow-up.
- **4 US metropolitan sites:** South, Mid-Atlantic/Northeast, West Coast, Midwest.
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
| **references_aids.bib** | Bibliography | 36 BibTeX entries; AIDS journal format |
| **aids.csl** | Citation style | Vancouver/NLM numeric (AIDS journal) |
| **render_manuscript.py** | Python rendering helper | Automates quarto render calls |
| Manuscript_Heart_Age_HIV_MWCCS.qmd | Older draft | Do NOT edit — kept for reference only |
| Pan_et_al_Heart_Age_HIV 04062026.docx | Previous Word version | Reference copy; do not overwrite |
| Pan_et_al_Heart_Age_HIV_PLOS_ONE_Manuscript.docx | Earlier PLOS ONE format | Archived |
| X24067 HA Abstract IAS 01272026.docx | IAS conference abstract | Submitted January 2026 |
| E. Pan_Aims_Scholar_2024.docx | Grant specific aims | Scholar 2024 award |
| F. Pan_Strategy_Scholar_2024.docx | Grant research strategy | Scholar 2024 award |

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
## References             (auto-generated from references_aids.bib via aids.csl)
## Tables                 (Tables 1–10 + S1; placeholders and captions only)
## Figures                (Figures 1–4; placeholders and captions only)
## Supplemental Material
```

### Tables
| Table | Content |
|-------|---------|
| Table 1 | Descriptive characteristics by HIV serostatus |
| Table 2 | PREVENT 10-year CVD risk by subgroups *(Supplemental)* |
| Table 3 | HAD (years) by subgroups |
| Table 4 | Heart age by subgroups *(Supplemental)* |
| Table 5 | Prevalence of HAD ≥5 years by subgroups *(Supplemental)* |
| Table 6 | Prevalence of HA > chronological age by subgroups *(Supplemental)* |
| Table 7 | Multivariable linear regression: HAD (continuous) |
| Table 8 | Multivariable logistic regression: HAD ≥5 years |
| Table 9 | MICE model: mental health & social determinants → HAD |
| Table 10 | HIV-specific model: viral load, CD4, ART → HAD (among PLWH) |
| Table S1 | HIV × sex interaction model *(Supplemental)* |

### Figures
| Figure | Content |
|--------|---------|
| Fig 1 | Forest plot — logistic regression ORs for HAD ≥5 years |
| Fig 2 | Predicted HAD by sex × HIV serostatus (with 95% CIs) *(Supplemental)* |
| Fig 3 | Forest plot — HIV-specific predictors (β coefficients) |
| Fig 4 | Heatmap — prevalence of HAD ≥5 years across subgroups |

---

## 5. Statistical Methods Summary

- **Software:** R 4.3+ (tidyverse, gtsummary, emmeans, broom, mice)
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
| 2 | Narrative gaps & logical weaknesses | Strengthened introduction rationale; added PREVENT-not-validated-in-HIV caveat |
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

### Limitations expanded to 11 points (April 2026):
1. Cross-sectional design (no causal inference)
2. PREVENT not validated in HIV populations
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

## 10. Future Work / Open Questions

- Longitudinal analysis: time-varying CD4, HAD trajectories over follow-up
- Nadir CD4 availability in future MWCCS data pulls
- Calibration/discrimination of PREVENT in HIV populations (external validation study)
- Comparison of PREVENT-derived HA vs. imaging biomarkers (CAC, cIMT, PWV) in MWCCS
- Whether HA-based feedback motivates CVD risk behavior change in PLWH (intervention study)
- HAD ≥5 threshold validation against incident CVD events
