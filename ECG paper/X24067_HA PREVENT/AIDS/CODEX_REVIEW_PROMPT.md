# Codex Review Prompt — X24067 Table/Figure Restructuring + Polish

## What you are reviewing

A restructuring of tables and figures in a cardiovascular epidemiology manuscript
("Heart Age and Heart-Age Deviation Among People With and Without HIV in the United States",
Pan et al.) submitted to the journal *AIDS* (Lippincott/Wolters Kluwer) as an Original Paper.

The goal was to comply with AIDS's limit of **5 combined tables+figures** for Original Papers.
The prior package had 4 tables + 2 figures = 6. After restructuring: 4 tables + 1 combined
figure = 5.

After the initial restructuring, several iterations of cosmetic polish were applied to fix
rendering defects (empty merged columns, misplaced significance stars, overlapping figure
titles, Markdown-eaten star keys, etc.). This review covers BOTH the structural restructuring
AND the subsequent polish.

---

## Files to review

| File | Path | Role |
|------|------|------|
| Analysis script | `X24067_HA PREVENT/analysis/X24067_Pan_Heart Age v2.qmd` | R/Quarto source for all tables and figures |
| Rendered HTML | `X24067_HA PREVENT/analysis/X24067_Pan_Heart Age v2.html` | Inspect actual rendered output |
| Submission manuscript | `X24067_HA PREVENT/AIDS/Pan_et_al_AIDS.qmd` | Trimmed AIDS submission manuscript |
| Rendered docx | `X24067_HA PREVENT/AIDS/Pan_et_al_AIDS.docx` / `01_Manuscript.docx` | Final submission file |
| Combined figure | `X24067_HA PREVENT/figures/Fig1_Combined.png` | Patchwork-stacked Fig 1 (A over B) |
| Change log | `X24067_HA PREVENT/AIDS/CHANGES.md` | Full log of all changes |
| Project context | `X24067_HA PREVENT/claude_x24067.md` | Project memory and file inventory |

---

## Changes made (verify each item)

### A. Analysis script (`analysis/X24067_Pan_Heart Age v2.qmd`)

**A1. Table 1 (chunk `table1`)**
- [ ] Categorical `digits` argument is `all_categorical() ~ c(0, 1)` (integer for n, 1 decimal for %)
- [ ] Rendered cells appear as `1,234 (45.2%)` — NO `.0` on the integer count

**A2. Table 2 (chunk `table2_prevalence_merged`) — final implementation**
- [ ] Table is built with `gt::gt()` directly from a manually computed tibble (NOT `tbl_merge` on `tbl_stack` — that approach was abandoned because the second spanner came out empty)
- [ ] Two-level column spanner present: "HAD ≥5 years" and "Heart age > chronological age"; under each spanner are PLWoH (N=963) and PLWH (N=1,766) columns
- [ ] Counts shown as integer `n/N (%)` format with chi-square significance stars at the END of each cell (e.g. `123/963 (12.8%)*`)
- [ ] Footnote contains escaped asterisks (`\*p<0.05; \*\*p<0.01; \*\*\*p<0.001`) so the stars render literally — NOT consumed as Markdown emphasis

**A3. Table 3 (chunk `table3_merged_and_fig1`)**
- [ ] `lm_aim1` (linear) and `glm_aim1` (logistic) model definitions present
- [ ] `tbl_aim1_linear` and `tbl_aim1_logistic` built with `tbl_regression` (no `add_global_p()` — it was removed because it moves p-values to label rows and breaks level-row stars)
- [ ] Both get `add_significance_stars(hide_p = TRUE, hide_ci = FALSE, hide_se = TRUE)` — SE column is hidden
- [ ] `modify_column_merge(pattern = "{estimate} ({ci}){stars}")` — stars appear AFTER the CI: e.g. `2.0 (1.2 to 2.8)***` (not `2.0*** (1.2, 2.8)`)
- [ ] `modify_column_hide` removes `conf.low`, `conf.high`, `std.error`, `ci`
- [ ] Column header is `**β (95% CI)**` for linear panel and `**OR (95% CI)**` for logistic panel
- [ ] Merged via `tbl_merge(..., tab_spanner = c("**Panel A: Linear regression (continuous HAD)**", "**Panel B: Logistic regression (HAD ≥5 years)**"))`
- [ ] Caption reads "Table 3. Multivariable regression predicting heart age deviation..."
- [ ] Footnote text exactly: `Reference categories: HIV-negative, male, Non-Hispanic White, West US region. Age modeled per 10-year increment. OR = Odds Ratio. \*p<0.05; \*\*p<0.01; \*\*\*p<0.001.`
- [ ] In rendered HTML: stars actually appear (not stripped as Markdown emphasis); `OR = Odds Ratio` present

**A4. Figure 1 — final layout**
- [ ] `fig1a_obj` (Panel A: logistic forest, title "A. Predictors of elevated HAD (≥5 years)") and `fig1b_obj` (Panel B: HIV severity forest, title "B. HIV-specific predictors of HAD (PLWH only)") assigned as objects (not printed directly)
- [ ] Combined via VERTICAL patchwork: `fig1_combined <- fig1a_tight / fig1b_tight + plot_layout(heights = c(1, 1))` (NOT horizontal `+` — horizontal layout was abandoned because labels were truncated)
- [ ] Each tight panel sets `plot.title = element_text(face="bold", size=12, margin=margin(b=4))` and `plot.subtitle = element_text(size=9, margin=margin(b=8))`
- [ ] `plot_annotation()` provides BOTH `title = "Fig. 1. Forest plots of predictors of heart age deviation."` (rendered at TOP) AND `caption =` containing the Panel A + Panel B reference-category details, split with `\n` between panels
- [ ] Title theme: `plot.title = element_text(size = 11, face = "bold", hjust = 0, margin = margin(b = 8))`
- [ ] Caption theme: `plot.caption = element_text(size = 8, hjust = 0, margin = margin(t = 10))`
- [ ] Saved at 10×12 inches, 300 dpi, file `figures/Fig1_Combined.png` exists and >200 KB
- [ ] Combined figure printed inline (`fig1_combined`) after `ggsave` so it appears in the HTML body
- [ ] Old standalone `ggsave(Fig1_HAD5_LogisticForestPlot.png)` and `ggsave(Fig2_HIV_Severity_ForestPlot.png)` calls are commented out

**A5. Supplemental Fig S2 heatmap (chunk `suppl_figs2_heatmap`)**
- [ ] `scale_fill_gradient` uses explicit `breaks = seq(0.3, 1.0, by = 0.2)` and `labels = scales::percent_format(accuracy = 1)` (NOT bare `labels = scales::percent` which produced overlapping % labels)
- [ ] `guide = guide_colorbar(barwidth = 8, barheight = 0.5, title.position = "top", title.hjust = 0.5)` applied
- [ ] Rendered legend shows well-separated 30%/50%/70%/90% tick labels (no overlap)

**A6. Supplemental Figs S3–S5 (chunk `suppl_figs3_5_diagnostics`)**
- [ ] Panel layout: `(p1 | p2) / p3` (S3 top-left, S4 top-right, S5 bottom)
- [ ] Title prefix shortened to `Fig S3:` / `Fig S4:` (NOT `Supplemental Fig S3/S4:` — the longer form overflowed the 6-inch wide panels and overlapped)
- [ ] Both p1 and p2 have `theme(plot.title = element_text(size = 11))` applied
- [ ] Saved at 12×8 inches, 300 dpi → `figures/FigS3_S5_CD4_Diagnostics.png`
- [ ] In rendered HTML: S3 and S4 titles do not overlap; both fit within their panel widths

**A7. Supplemental renumbering**
- [ ] Section header reflects "S1–S3 (S4/S5 promoted to main Table 2)"
- [ ] `suppl_s4_mice` chunk: caption "Supplemental Table S4" (was S6)
- [ ] `suppl_s5_and_figs1` chunk: caption "Supplemental Table S5" (was S7)
- [ ] `suppl_s6_sex_hiv` chunk: caption "Supplemental Table S6" (was S8)
- [ ] Table 4 caption updated to "people with HIV only"

**A8. Output-order comment (line ~79)**
- [ ] Reflects ordering: Table 1 → Table 2 (merged S4+S5) → Table 3 (merged reg) → Fig 1 (A+B vertical) → Suppl S1–S3 → Suppl S4 → Suppl S5 → Table 4 → Suppl S6 → Suppl Fig S1 → Suppl Fig S2 → Suppl Figs S3–S5

---

### B. Manuscript (`AIDS/Pan_et_al_AIDS.qmd`)

**B1. In-text references**

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
- [ ] Table 1 entry: descriptive characteristics by HIV serostatus
- [ ] Table 2 entry: prevalence of HAD ≥5 years + HA > chron. age; chi-square stars
- [ ] Table 3 entry: Panel A (linear β) + Panel B (logistic OR); star footnote key
- [ ] Table 4 entry: HIV severity model
- [ ] NO Table 5 or old Table 2/3 entries

**B3. Figures section**
- [ ] Only **one figure entry** (Fig. 1) present
- [ ] Fig. 1 entry describes both Panel A (logistic ORs) and Panel B (HIV severity β)
- [ ] NO "Fig. 2" entry

**B4. Supplemental section**
- [ ] S1, S2, S3 entries: unchanged
- [ ] NO S4 entry for "Prevalence of HAD ≥5 years"
- [ ] NO S5 entry for "Prevalence of HA > chronological age"
- [ ] S4 entry: MICE model; S5 entry: interaction (HIV × sex); S6 entry: sex-stratified descriptives
- [ ] NO S7, S8 entries

**B5. AIDS compliance**
- [ ] Abstract ≤250 words (expected ~247)
- [ ] Main text ≤3,500 words (expected ~3,223)
- [ ] Combined tables+figures: 4+1=5 ≤ 5
- [ ] No "Fig 2" remaining in text
- [ ] No "Table S7", "Table S8", or old S4/S5 supplemental references remaining

**B6. Rendered docx check**
- [ ] `Pan_et_al_AIDS.docx` rendered cleanly without errors
- [ ] Spot-check: in-text Table/Fig references match the qmd
- [ ] Spot-check: title page heading exactly `Conflicts of Interest and Source of Funding:`

---

### C. Numerical consistency

Key effect estimates cited in manuscript text must match rendered tables:

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
- [ ] File inventory notes `analysis/X24067_Pan_Heart Age v2.qmd` is the canonical script
- [ ] R dependency table present (sumExtras, broom.helpers, car, parameters, rUM)
- [ ] Filename conflict workaround documented (must rename `.rmarkdown` before `quarto render`)
- [ ] Table/figure inventory updated (Tables 1–4, Fig 1A/B, Suppl S1–S6, Suppl Figs S1–S2)

**D2. `AIDS/CHANGES.md`**
- [ ] Section "Table/figure restructuring (2026-05-11)" present
- [ ] Cross-reference update table present
- [ ] Final word counts recorded

---

## Known edge cases and failure modes (lessons learned)

1. **`tbl_merge` on `tbl_stack` objects:** Fails row alignment — the second spanner came out empty. Resolution: Table 2 was rebuilt with `gt::gt()` directly from a computed tibble. If you see the Table 2 code use `tbl_merge(tbl_stack(...), tbl_stack(...))`, that is the OLD broken approach.

2. **`add_global_p()` + `add_significance_stars`:** `add_global_p()` moves p-values from level rows (NHB, Female, PLWH) to the variable label row. After that, `add_significance_stars` finds `p.value = NA` on level rows and no stars appear. Resolution: `add_global_p()` was REMOVED from Table 3 model tables.

3. **Markdown asterisk eating in footnotes:** `*p<0.05; **p<0.01` in a gt/gtsummary footnote renders as italic/bold and the asterisks vanish. Resolution: both Table 2 (`md()` footnote) and Table 3 (`modify_footnote`) use escaped `\\*` so literal `\*` reaches the renderer.

4. **Patchwork horizontal vs vertical:** Horizontal `+` at 16×7 inches truncated y-axis labels (7 terms on Panel B, 10 on Panel A). Vertical `/` at 10×12 inches gives each panel full width.

5. **`plot_annotation(caption=…)` vs `title=…`:** `caption` renders at the BOTTOM of the patchwork. To put the figure title above the panels, use `title =`. Caption is used only for the smaller reference-category details below.

6. **Heatmap legend overlap:** `scale_fill_gradient(labels = scales::percent)` with no explicit `breaks` produces overlapping % labels at the default colorbar size. Resolution: explicit `breaks = seq(0.3, 1.0, by = 0.2)` and `guide_colorbar(barwidth = 8)`.

7. **Chunk dependency ordering:** `table2_prevalence_merged` must run after `strat_setup` and `strat_functions` (it uses `row_vars`, `var_labels_map`, `n_plwoh`, `n_plwh`).

8. **Filename conflict for render:** Quarto fails on `X24067_Pan_Heart Age v2.qmd` if `X24067_Pan_Heart-Age-v2.rmarkdown` exists alongside it. Workaround: temporarily rename the `.rmarkdown` file before render and restore after.

---

## Output to produce

A numbered PASS/FAIL/WARN report for each checklist item (A1–A8, B1–B6, C, D1–D2), with:
- For PASS: brief confirmation evidence (e.g., "found 'Table 2. Prevalence' at line 612" or "rendered HTML cell at row 12 reads '2.0 (1.2 to 2.8)***'")
- For FAIL: exact failing condition and location
- For WARN: minor issue that does not block submission but should be addressed

Pay particular attention to verifying the **rendered HTML** (not just the source qmd) for:
- Table 2 second spanner is populated (not empty)
- Table 3 stars appear AFTER each CI
- Table 3 footnote shows literal `*`, `**`, `***` characters and `OR = Odds Ratio`
- Figure 1 title sits ABOVE Panel A, reference caption sits BELOW Panel B (not truncated)
- Suppl Fig S2 legend tick labels are non-overlapping
- Suppl Figs S3/S4 titles do not collide
- Table 1 categorical n values are integers (no `.0`)

End with an overall verdict: **READY FOR SUBMISSION** or **NEEDS FIXES** with a prioritized fix list.
