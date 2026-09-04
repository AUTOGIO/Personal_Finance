# AGENTS.md — edu_price_analysis

Instructions for any AI agent (Claude, Cursor, Codex, etc.) working in this
repo. Read this before touching any file.

## What this project is

Two independent tracks in one repo, both private financial data — not a
public dataset, not shared with anyone:

- **Track 1 — Personal Inflation Index (IIP).** Built from Eduardo's real
  purchase history (mostly Supermercado Litoral, Jan 2022–present).
  Computes a chained-Jevons personal price index and compares it against a
  market benchmark. Canonical file: `02_Models/personal_inflation_tracker-v2.xlsx`.
- **Track 2 — Cash-Flow Sanebox Model.** Short-horizon (Abr–Ago 2026)
  cash-flow control built from Banco do Brasil (Pix) and Mercado Pago
  (card) statements. Canonical file: `02_Models/modelo_financeiro_saneado_v3.xlsx`.
  Less deeply audited by this agent than Track 1 — verify before relying on
  its formulas for a decision.

Most rules below were written against Track 1 (that's where the AI work
has concentrated); apply the same discipline — read before writing, backup
before editing, no silent recomputation — to Track 2.

## Folder map

| Path | Contents |
|---|---|
| `README.md` | project overview |
| `README_Personal_Inflation.md` | live headline stats — source of truth for current totals |
| `01_Reports/` | markdown + PDF analysis reports (both tracks) |
| `02_Models/` | Track 1: `personal_inflation_tracker-v2.xlsx` + `iip_terminal.html`. Track 2: `modelo_financeiro_saneado_v3.xlsx` |
| `03_Raw_Data/` | source CSVs/statements (NFC-e price history for Track 1; Pix/card statements for Track 2) |
| `04_Charts/` | generated PNG charts (both tracks) |
| `05_Comparisons/` | market-basket comparisons (e.g. Manaíra vs. Litoral) — Track 1 only |

There is no `_to_delete/` staging folder right now — the last cleanup
cleared it (2026-09-03). If you recreate the pattern of moving instead of
deleting, that folder is where it goes; keep following rule 3 below.

## Hard rules (do not violate)

1. **Read before writing.** Open the target file/sheet and confirm current
   state before any edit.
2. **Backup before editing the tracker.** Run `make backup` (or copy
   `02_Models/personal_inflation_tracker-v2.xlsx` by hand) before appending
   rows or changing formulas. Every change must be reversible.
3. **Confirm before deleting.** Never `rm` inside this project. Move
   unwanted files to `_to_delete/` and tell Eduardo — he deletes it himself.
4. **Never merge store-wide/public data into `Registro de Compras`.**
   Files like `manaira01.csv` are public NFC-e dumps covering many
   customers, not personal purchases. They belong in `05_Comparisons/`
   market-basket analyses only, clearly labeled as such.
5. **Don't silently recompute the audited IIP figures.** The cumulative
   IIP (+40.23%), its annual YoY series, the market benchmark (+28.25%),
   and the 2027 scenario table in `Terminal IIP` (D11:D14, F11:F14) are
   hardcoded, not formulas. Two independent reproduction attempts (raw
   ledger, and cleaned `Price_History`) did not reconcile with these
   published numbers — an undocumented item-selection rule was used
   originally. If asked to refresh them, say so explicitly and treat it as
   its own project, not a side effect of a data append.
6. **`Terminal IIP` category totals (`$H$5:$H$4500` SUMIF ranges) recalc
   automatically** once the workbook is opened in Excel/LibreOffice/Numbers
   — no formula edits needed when appending rows to `Registro de Compras`.

## Adding new transactions

1. `make backup`
2. Append rows to the `Registro de Compras` sheet: `ID Transação`, `Data da
   Compra`, `Produto / Item`, `Quantidade`, `Preço Unitário`, `Valor Total`
   (`=Qty*Unit` formula, keep it a formula not a static value), `Categoria`,
   `Estabelecimento`.
3. Verify the new rows' sum against the source document's total before
   closing the file.
4. Update `README_Personal_Inflation.md` headline stats (total tx, total
   spend, category weights) — recomputed directly from the ledger, not
   estimated.
5. If `02_Models/iip_terminal.html` should reflect the new data, regenerate
   its KPI tiles/tables from the same recomputed numbers (it is static
   HTML, not wired to the xlsx).

## Commands

`make help` · `make open` · `make backup` · `make tree` — see the
Makefile at the project root, or `USER_GUIDE.md` for the human-facing
walkthrough.

## Known open item

`TRX-13557`–`TRX-13571` (Masterboi Paraíba, 15 items) use a **placeholder
date of 2026-09-02** — the real receipt date was never confirmed. Correct
it in `Registro de Compras` if/when the true date surfaces; don't treat it
as verified.
