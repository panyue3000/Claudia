# Codex Review Prompt — X24067 Table/Figure Restructuring

## What you are reviewing

A restructuring of tables and figures in a cardiovascular epidemiology manuscript
("Heart Age and Heart-Age Deviation Among People With and Without HIV in the United States",
Pan et al.) submitted to the journal *AIDS* (Lippincott/Wolters Kluwer) as an Original Paper.

The goal was to comply with AIDS's limit of **5 combined tables+figures** for Original Papers.
The prior package had 4 tables + 2 figures = 6. After restructuring: 4 tables + 1 combined
figure = 5.

---

## Files to review

| File | Path | Role |
|------|------|------|
| Analysis script | `X24067_HA PREVENT/analysis/X24067_Pan_Heart Age v2.qmd` | R/Quarto source for all tables and figures |
| Submission manuscript | `X24067_HA PREVENT/AIDS/Pan_et_al_AIDS.qmd` | Trimmed AIDS submission manuscript |
| Change log | `X24067_HA PREVENT/AIDS/CHANGES.md` | Full log of all changes |
| Project context | `X24067_HA PREVENT/claude_x24067.md` | Project memory and file inventory |

---

## Changes made (verify each item)

### A. Analysis script (`analysis/X24067_Pan_Heart Age v2.qmd`)

**A1. New Table 2 chunk** (`table2_prevalence_merged`, placed after `strat_functions` chunk)
- [ ] Calls `create_strat_prevalence(analysis_clean, "had5", ...)` and `create_strat_prevalence(analysis_clean, "ha_gt_age", ...)`
- [ ] Both sub-tables get `add_significance_stars(hide_p = TRUE, hide_ci = FALSE)` applied
- [ ] Merged via `tbl_merge(tbls = list(tbl_s4_stars, tbl_s5_stars), tab_spanner = c("HAD ≥5 years", "Heart age > chronological age"))`
- [ ] Caption reads "Table 2. Prevalence of elevated heart age deviation..."
- [ ] Footnote specifies: p-values from chi-square test; *<0.05 **<0.01 ***<0.001

**A2. Old S4/S5 chunks retired**
- [ ] Chunk `suppl_s4_retired` has `eval=FALSE` — no output produced
- [ ] Content is commented out, not deleted

**A3. New Table 3 chunk** (`table3_merged_and_fig1`)
- [ ] Contains `lm_aim1` (linear) and `glm_aim1` (logistic) model definitions
- [ ] `tbl_aim1_linear` and `tbl_aim1_logistic` built with `add_global_p()`
- [ ] Both get `add_significance_stars(hide_p = TRUE, hide_ci = FALSE)` — p-value columns removed
- [ ] Merged via `tbl_merge(..., tab_spanner = c("Panel A: β (95% CI)", "Panel B: OR (95% CI)"))`
- [ ] Caption reads "Table 3. Multivariable regression predicting heart age deviation..."
- [ ] Footnote specifies reference categories and star key

**A4. Figure 1A (Panel A) — logistic forest**
- [ ] Object assigned to `fig1a_obj` (not printed directly via `ggplot(...)` without assignment)
- [ ] Title: "A. Predictors of elevated HAD (≥5 years)"
- [ ] Old standalone `ggsave(Fig1_HAD5_LogisticForestPlot.png)` is **commented out**

**A5. Figure 1B (Panel B) — HIV severity forest**
- [ ] Object assigned to `fig1b_obj`
- [ ] Title: "B. HIV-specific predictors of HAD (PLWH only)"
- [ ] Old standalone `ggsave(Fig2_HIV_Severity_ForestPlot.png)` is **commented out**

**A6. Combined Fig 1 saved**
- [ ] `fig1_combined <- fig1a_obj + fig1b_obj + plot_layout(ncol = 2, widths = c(1, 1))`
- [ ] Saved as `figures/Fig1_Combined.png` at 16×7 inches, 300 dpi
- [ ] File exists and size > 200 KB

**A7. Supplemental renumbering**
- [ ] Section header changed from "S1–S5" to "S1–S3 (S4/S5 promoted to main Table 2)"
- [ ] `suppl_s4_mice` chunk: caption says "Supplemental Table S4" (was S6)
- [ ] `suppl_s5_and_figs1` chunk: caption says "Supplemental Table S5" (was S7)
- [ ] `suppl_s6_sex_hiv` chunk: caption says "Supplemental Table S6" (was S8)
- [ ] Table 4 caption updated to say "people with HIV only" (minor wording fix)

**A8. Output-order comment (line ~79)**
- [ ] Reflects new ordering: Table 1 → Table 2 (merged S4+S5) → Table 3 (merged reg) → Fig 1 (A+B) → Suppl S1–S3 → Suppl S4 → Suppl S5 → Table 4 → Suppl S6 → Suppl Fig S1 → Suppl Fig S2 → Suppl Figs S3–S5

---

### B. Manuscript (`AIDS/Pan_et_al_AIDS.qmd`)

**B1. In-text references updated (verify exact line content)**

| Location | Expected text |
|----------|--------------|
| Results §HAD section | `(Table 2; Supplemental Tables S1–S3; Supplemental Fig S2)` |
| Results §HAD section | `Supplemental Table S6` (sex-stratified) |
| Results §linear regression | `(Table 3, Panel A)` |
| Results §logistic regression | `(Table 3, Panel B; Fig 1A)` |
| Results §interaction | `Supplemental Table S5` |
| Results §HIV severity | `(Table 4; Fig 1B)` |
| Results §MICE | `Supplemental Table S4` |

**B2. Tables section**
- [ ] Table 1 entry: unchanged
- [ ] Table 2 entry: describes prevalence of HAD ≥5 years + HA > chron. age; mentions chi-square stars
- [ ] Table 3 entry: describes Panel A (linear β) + Panel B (logistic OR); star footnote key
- [ ] Table 4 entry: HIV severity model (unchanged content)
- [ ] NO Table 5 or old Table 2/3 entries present

**B3. Figures section**
- [ ] Only **one figure entry** (Fig. 1) present
- [ ] Fig. 1 entry describes both Panel A (logistic ORs) and Panel B (HIV severity β)
- [ ] NO "Fig. 2" entry present

**B4. Supplemental section**
- [ ] S1, S2, S3 entries: unchanged
- [ ] NO S4 entry for "Prevalence of HAD ≥5 years"
- [ ] NO S5 entry for "Prevalence of HA > chronological age"
- [ ] S4 entry: Multiple-imputation model (MICE)
- [ ] S5 entry: Interaction model (HIV × sex)
- [ ] S6 entry: Sex-stratified descriptives
- [ ] NO S7, S8 entries

**B5. AIDS compliance**
- [ ] Abstract word count: ≤250 (expected ~247)
- [ ] Main text word count: ≤3,500 (expected ~3,223)
- [ ] Combined tables+figures: 4+1=5 ≤ 5 ✓
- [ ] No "Fig 2" remaining in text
- [ ] No "Table S7", "Table S8", or old S4/S5 supplemental references remaining

---

### C. Numerical consistency

Verify that key effect estimates cited in the manuscript text still match what would appear in the rendered tables. These numbers must not have changed:

| Statistic | Expected value | Location |
|-----------|---------------|----------|
| Sample size | n=2,729 (1,766 PLWH; 963 PLWoH) | Table 1, abstract |
| HIV serostatus β | −0.18 (95% CI −0.77 to 0.42; p=0.56) | Table 3, Panel A |
| NHB β (linear) | 2.0 (95% CI 1.2 to 2.8; p<0.001) | Table 3, Panel A |
| NHB OR (logistic) | 1.88 (95% CI 1.47 to 2.41; p<0.001) | Table 3, Panel B |
| Viral load β | 1.3 (95% CI 0.41 to 2.1; p=0.004) | Table 4 |
| CD4 β | 0.23 per 100 cells/μL (95% CI 0.14 to 0.32; p<0.001) | Table 4 |
| CES-D β (MICE) | 1.5 (95% CI 0.39 to 2.6; p=0.009) | Suppl Table S4 |
| HAD ≥5 years prevalence | 32.5% | Table 2, abstract |
| Mean HAD | 3.2 years (both groups; p>0.9) | Table 1 / text |

---

### D. Documentation

**D1. `claude_x24067.md`**
- [ ] File inventory row for `analysis/X24067_Pan_Heart Age v2.qmd` notes it is the canonical script
- [ ] R dependency table present (sumExtras, broom.helpers, car, parameters, rUM)
- [ ] Filename conflict workaround documented
- [ ] Table/figure inventory updated to new numbering (Tables 1–4, Fig 1A/B, Suppl S1–S6, Suppl Figs S1–S2)

**D2. `AIDS/CHANGES.md`**
- [ ] Section "Table/figure restructuring (2026-05-11)" present
- [ ] Contains cross-reference update table
- [ ] Final word counts recorded

---

## Known edge cases and failure modes

1. **`tbl_merge` on `tbl_stack` objects (Table 2):** `create_strat_prevalence()` returns a stacked table. `tbl_merge` may struggle if the two sub-tables have column-naming inconsistencies. If the merged Table 2 does not render correctly, check that both sub-tables use identical `by = hiv_status` structure.

2. **`add_significance_stars(hide_p = TRUE)` on `tbl_stack`:** The p-value column must exist from the `add_p()` calls made per-row inside `create_strat_prevalence()`. If stars are missing or the p-column is not hidden, the fix is to call `add_significance_stars()` inside the function definition (in the pipe after `modify_header`).

3. **`remove_row_type(type = "header")` omission:** This call was noted as optional in the plan; it was omitted from the final code. Global-p header rows may appear in Table 3 between predictor groups. This is a cosmetic issue, not a correctness issue.

4. **Patchwork figure legibility:** `Fig1_Combined.png` at 16×7 inches should be readable. If y-axis labels are truncated (HIV severity panel has 7 terms; logistic panel has 10 terms), adjust with `widths = c(1.2, 0.8)` in `plot_layout()`.

5. **Chunk dependency ordering:** The `table2_prevalence_merged` chunk was placed AFTER `strat_functions` in the document to ensure `create_strat_prevalence()` is defined before it is called. Verify this ordering is maintained if the qmd is edited further.

---

## Output to produce

A numbered PASS/FAIL/WARN report for each checklist item (A1–A8, B1–B5, C, D1–D2), with:
- For PASS: brief confirmation evidence (e.g., "found 'Table 2. Prevalence' at line 612")
- For FAIL: exact failing condition and location
- For WARN: minor issue that does not block submission but should be addressed

End with an overall verdict: **READY FOR SUBMISSION** or **NEEDS FIXES** with a prioritized fix list.
