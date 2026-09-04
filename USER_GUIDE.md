# User Guide — edu_price_analysis

Your personal price/inflation tracking system: one Excel ledger, one
Bloomberg-style dashboard, and a handful of comparison reports. This guide
covers day-to-day use.

---

## Quick start

```
cd ~/Desktop/edu_price_analysis
make open
```

`make open` (or double-click **`open_analysis.command`** in Finder) opens
the full working set in one shot: both READMEs, both models
(`personal_inflation_tracker-v2.xlsx` and `modelo_financeiro_saneado_v3.xlsx`),
the `iip_terminal.html` dashboard, and the two key reports. That's the "one
button" for getting into analysis mode.

This repo has two tracks — the **Personal Inflation Index (IIP)**
(long-horizon grocery/retail price tracking) and the **Cash-Flow Sanebox
Model** (short-horizon Abr–Ago 2026 budget control). `make open` opens
both; the sections below are IIP-focused since that's where day-to-day
maintenance happens. See `README.md` for the full architecture of both
tracks.

---

## Folder map

| Folder | What's in it | When you touch it |
|---|---|---|
| `02_Models/` | `personal_inflation_tracker-v2.xlsx` (ledger + IIP terminal sheet), `iip_terminal.html` (dashboard), `modelo_financeiro_saneado_v3.xlsx` (Track 2 cash-flow model) | logging new purchases, checking either dashboard |
| `01_Reports/` | Litoral 6-year audit, methodology PDF, `relatorio_saidas_exclusivo.md` (Track 2) | reference reading |
| `05_Comparisons/` | Manaíra vs. Litoral market-basket comparison | shopping decisions |
| `03_Raw_Data/` | source CSVs/statements (NFC-e history, Pix, card) | rarely — only when adding a new data source |
| `04_Charts/` | generated PNGs used in the markdown reports (both tracks) | reference |

---

## Everyday tasks

**Log a new receipt**
1. `make backup` (snapshots the xlsx to `02_Models/_backups/` first — always do this)
2. Open `personal_inflation_tracker-v2.xlsx` → `Registro de Compras` sheet
3. Add one row per item: transaction ID, date, item name, qty, unit price,
   total (`=Qty*UnitPrice`), category, merchant
4. Save. Category totals on the `Terminal IIP` sheet recalc automatically
   on open — no formula work needed.

**Check where you stand**
- Open `iip_terminal.html` (or `make open`). Tab through:
  - **00 CMD CTR** — headline KPIs, annual spend trend, category split
  - **01 IIP\<GO\>** — your inflation index vs. market, year by year
  - **02 CATEGORIES** — budget weight by category
  - **03 BENCHMARK** — Manaíra vs. Litoral price comparison
  - **04 SCENARIOS 27** — 2027 budget under Otimista/Conservador/Pessimista
  - **05 WATCHLIST** — 6 key SKUs tracked since 2022, with price sparklines
  - **06 TX LOG** — most recent 30 transactions
  - **07 METHOD** — formula and data-source reference

**Decide where to shop**
- `05_Comparisons/manaira_vs_litoral_price_comparison.md` — Manaíra runs
  ~6.3% cheaper on the coincident basket, driven mostly by produce
  (hortifrúti, ~10% cheaper); packaged goods are close to a wash.

**Refresh the headline numbers after adding data**
- Recompute total transactions, total spend, and category weights directly
  from `Registro de Compras` (don't estimate). Update
  `README_Personal_Inflation.md`. Leave the audited IIP/market/scenario
  figures alone unless you're deliberately re-deriving them (see
  `AGENTS.md` — that methodology hasn't reconciled cleanly twice already).

---

## Troubleshooting

| Problem | Fix |
|---|---|
| Excel won't open the tracker / shows a lock file (`~$personal_inflation_tracker-v2.xlsx`) | Close any other window/app with the file open, then delete the lock file (safe — it's just a lock, not data) |
| `make open` does nothing | Run `chmod +x open_analysis.command` once, then retry |
| Numbers in `iip_terminal.html` look stale | It's static HTML, not linked to the xlsx — regenerate its tables by hand (or ask your agent to) after a data refresh |
| Accidentally broke a formula | Restore from `02_Models/_backups/` (created by `make backup`) or `personal_inflation_tracker-v2.BACKUP_pre_append.xlsx` |

---

## Commands reference

```
make help      # list commands
make open      # open the full analysis working set
make backup    # timestamped snapshot of the tracker before editing
make tree      # print the folder structure
```
