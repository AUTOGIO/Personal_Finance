---
name: edu-price-analysis
description: Operating manual for Eduardo's edu_price_analysis repo — a personal Bloomberg/Reuters-style price-inflation and cash-flow tracking project with two live models (IIP tracker + Sanebox cash-flow) and a hard no-silent-recompute rule on the audited inflation figures. Use this whenever working inside edu_price_analysis, or on any request that touches personal_inflation_tracker-v2.xlsx, modelo_financeiro_saneado_v3.xlsx, iip_terminal.html, the Registro de Compras ledger, or README_Personal_Inflation.md — including requests that don't name the repo explicitly, like "add these receipts to my tracker," "update the inflation dashboard," "log this Litoral/Masterboi invoice," or "compare Manaíra vs Litoral prices." Trigger before appending transactions, editing either model, or touching the chained-Jevons IIP numbers.
---

# edu_price_analysis — operating manual

This is a real personal finance project, not a sandbox — every number in
`02_Models/` reflects Eduardo's actual spending. Treat it accordingly:
private data, reversible edits, no invented numbers.

**Full rules live in `AGENTS.md` at the project root — read it before any
substantial edit.** This file is the fast-start version so an agent that
hasn't opened `AGENTS.md` yet still starts on the right foot; it doesn't
replace it.

## Two tracks, one repo

- **Track 1 — Personal Inflation Index (IIP).** Chained-Jevons price index
  from real grocery/retail purchases, 2022–present. Canonical file:
  `02_Models/personal_inflation_tracker-v2.xlsx` (`Registro de Compras`
  ledger + `Terminal IIP` sheet). Dashboard: `02_Models/iip_terminal.html`.
  Live stats: `README_Personal_Inflation.md`.
- **Track 2 — Cash-Flow Sanebox Model.** Short-horizon budget control from
  bank/card statements. Canonical file:
  `02_Models/modelo_financeiro_saneado_v3.xlsx`.

Know which track a request touches before editing — they have separate
canonical files and separate data sources (`03_Raw_Data/`).

## Non-negotiables

These exist because this project has already been burned by each of them
once. Follow them even if the request doesn't mention them.

1. **Backup before editing a model.** `make backup` snapshots the IIP
   tracker; do the equivalent by hand for the cash-flow model. Every edit
   must be reversible — that's the whole point of a personal ledger.
2. **Never merge public/store-wide data into `Registro de Compras`.** A
   public NFC-e dump (e.g. a competing supermarket's full-day sales) covers
   many customers, not Eduardo's purchases. It belongs in
   `05_Comparisons/` as a market benchmark, clearly labeled — never in the
   personal ledger.
3. **Don't silently recompute the audited IIP figures.** The cumulative
   IIP (+40.23%), its annual YoY series, the market benchmark (+28.25%),
   and the 2027 scenario table (`Terminal IIP` D11:D14, F11:F14,
   H8:J13) are hardcoded, not formulas — two independent reproduction
   attempts from raw and cleaned price data didn't reconcile with them,
   meaning the original calculation used an undocumented item-selection
   rule. If a data refresh is requested, update what's directly computable
   (totals, category weights, item medians) and leave those specific
   figures alone unless the user explicitly asks for a methodology
   re-derivation as its own task.
4. **Confirm before deleting.** No `rm` in this repo without asking. Move
   unwanted files aside and say so; let Eduardo delete them.

## Common workflows

**Adding new transactions/receipts:**
1. `make backup`
2. Append to `Registro de Compras`: `ID Transação`, `Data da Compra`,
   `Produto / Item`, `Quantidade`, `Preço Unitário`, `Valor Total` (as a
   formula, `=Qty*Unit`, not a static number), `Categoria`,
   `Estabelecimento`.
3. Cross-check the new rows' sum against the source document's printed
   total before closing the file — this project catches data-entry errors
   this way, not by trusting the entry.
4. Recompute and update `README_Personal_Inflation.md`'s headline stats
   (total tx, total spend, category weights) directly from the ledger.
   `Terminal IIP` category totals recalc automatically on open (SUMIF) —
   don't touch those formulas.
5. If asked to reflect the new data in `iip_terminal.html`, regenerate its
   KPI tiles/tables by hand from the same recomputed numbers — it's a
   static snapshot, not formula-linked to the xlsx.

**Regenerating or extending `iip_terminal.html`:** it's a single
self-contained HTML file styled after Bloomberg/Reuters terminals (dark
theme, monospace data, amber/cyan accent). Pull real numbers from the xlsx
before writing any markup — this dashboard has previously shipped with
placeholder figures that had to be corrected; treat every number in it as
something that must trace back to `Registro de Compras` or `Terminal IIP`.

**Writing a new comparison or report:** check `01_Reports/` and
`05_Comparisons/` first for the pattern to follow (methodology note,
scope disclaimer distinguishing personal spend from market-wide data,
sources footer). Every deliverable mentioned in a README must actually
exist on disk — this repo has been burned by phantom file references
before; don't add a new one without creating the file.

## Reference

- `AGENTS.md` — full hard rules, folder map, known open items
- `USER_GUIDE.md` — human-facing walkthrough, troubleshooting
- `make help` — `open` / `backup` / `tree`
