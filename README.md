# edu_price_analysis

Personal financial intelligence for **Eduardo Forster Giovannini** — two independent, terminal-styled tracks sharing one repository: a long-horizon **Personal Inflation Index (IIP)** built from real grocery/retail transactions (2022–2026), and a **Cash-Flow Sanebox Model** for short-horizon budget control (Abr–Ago 2026). Both are styled after institutional market terminals (Bloomberg / Thomson Reuters Eikon) — dark UI, monospace data, amber/cyan/green color coding — for fast visual audit.

> This file describes the repository as it actually exists on disk. See `AGENTS.md` for operating rules and `USER_GUIDE.md` for day-to-day usage.

---

## Repository structure

```
edu_price_analysis/
├── README.md                          this file — architecture overview
├── README_Personal_Inflation.md       IIP tracker — live headline stats
├── AGENTS.md                          rules for AI agents working in this repo
├── USER_GUIDE.md                      day-to-day usage guide
├── Makefile                           make open / make backup / make tree
├── open_analysis.command              double-click: opens the full working set
├── 01_Reports/                        markdown + PDF analysis reports
├── 02_Models/                         the two live models (.xlsx) + the IIP dashboard (.html)
├── 03_Raw_Data/                       source CSVs / bank & card statements
├── 04_Charts/                         generated PNG charts referenced by the reports
└── 05_Comparisons/                    market-basket comparisons (e.g. Manaíra vs. Litoral)
```

### File inventory by folder

| Folder | File | What it is |
|---|---|---|
| `02_Models/` | `personal_inflation_tracker-v2.xlsx` | **Track 1 canonical file.** `Registro de Compras` ledger (3,572 transactions) + `Terminal IIP` sheet (chained-Jevons index, category SUMIF, 2027 scenarios) |
| | `personal_inflation_tracker-v2.BACKUP_pre_append.xlsx` | rollback point captured before the Sep/2026 253-row append — keep until the append is fully trusted |
| | `iip_terminal.html` | Bloomberg/Reuters-style interactive dashboard for Track 1 (static — regenerate by hand after a data refresh) |
| | `modelo_financeiro_saneado_v3.xlsx` | **Track 2 canonical file.** Cash-flow model, Dark Bloomberg/Reuters design, Abr–Ago 2026 |
| `01_Reports/` | `litoral_price_analysis.md` | six-year audit (2020–2026) of Supermercado Litoral pricing, feeds Track 1 |
| | `personal_inflation_index.md` | IIP drivers analysis — divergence vs. market, item-level outliers |
| | `category_inflation_and_budget_2027.md` | category breakdown, 2027 scenarios, risk-mitigation playbook |
| | `personal_inflation_tracker_methodology.pdf` | typeset methodology guide — chained Jevons index, budget weights |
| | `relatorio_saidas_exclusivo.md` | consolidated bank transfers/debits history, feeds Track 2 |
| `03_Raw_Data/` | `Price_History_part_1..5_of_5.csv` | Litoral price history (source for Track 1 + comparisons) |
| | `MercadoPago_Apr-Aug_2026_Professional_Analysis.xlsx` | card statement analysis, feeds Track 2 |
| | `Pix_BB_jan-ago2026.xlsx` | Pix/BB transfer data, feeds Track 2 |
| `04_Charts/` | `litoral_price_analysis.png`, `category_inflation_and_budget_2027.png`, `personal_inflation_index.png` | Track 1 charts |
| | `faturas_comparison.png`, `pix_analysis_chart.png`, `recurrent_spendings_impact_v3.png` | Track 2 charts |
| `05_Comparisons/` | `manaira_vs_litoral_price_comparison.md` (+ `.png`) | market-price benchmark, Manaíra vs. Litoral — separate from personal spend |

---

## Track 1 — Personal Inflation Index (IIP)

Chained-Jevons personal price index built from 3,572 real transactions, Jan 2022–Sep 2026. Full detail lives in **`README_Personal_Inflation.md`** (headline stats, methodology, current figures) and the interactive **`02_Models/iip_terminal.html`** dashboard. Canonical data file: `02_Models/personal_inflation_tracker-v2.xlsx`.

Headline (as of the last refresh — see `README_Personal_Inflation.md` for the live numbers): personal inflation **+40.23%** cumulative (2022–2026) vs. market **+28.25%**; 86.1% of spend is Alimentação e Bebidas; Supermercado Litoral is 94.11% of the ledger.

## Track 2 — Cash-Flow Sanebox Model

Short-horizon (Abr–Ago 2026) cash-flow control and expense-saneamento model, sourced from Banco do Brasil (Pix) and Mercado Pago (card) statements. Canonical file: `02_Models/modelo_financeiro_saneado_v3.xlsx` — dark terminal design (black background, cyan inputs, neon-green formulas, amber headers, red outflows/alerts).

**Five optimization pillars** (documented in `01_Reports/relatorio_saidas_exclusivo.md` and the model's `Assumptions` tab):
1. Eliminate Loterias Caixa Online spend (R$1,200/mo) — avoids account insolvency
2. Absorb new fixed household costs (funcionário doméstico, gasolina, energia, água)
3. Remove double-counted tech subscriptions already inside the card bill (Starlink, Cursor IDE, Google Pro)
4. Consolidate redundant AI tool subscriptions (–R$150/mo)
5. Preventive liquidity bridge in Jun/2026 (R$1,700 transfer) to cover an atypically high Jul/2026 card bill

**How to use it**: open `modelo_financeiro_saneado_v3.xlsx` → start on `TOC & Legend` → edit only the cyan-formatted cells (column C) on `Assumptions` to simulate → `Detailed Cash Flow` and `Dashboard & Comparisons` update automatically.

---

## Getting started

```
make open      # opens the full analysis working set (both tracks)
make backup    # timestamped snapshot of the Track 1 tracker before editing
make tree      # print the folder structure
```

See `USER_GUIDE.md` for the complete walkthrough (logging a transaction, reading the dashboard, troubleshooting) and `AGENTS.md` for the hard rules any AI assistant must follow in this repo (backup before edit, never merge public/store-wide data into the personal ledger, don't silently recompute the audited IIP figures).

---
*Last audited and rewritten: 2026-09-03. Reflects the repository as it exists on disk — no deliverable is listed here unless the file is actually present.*
