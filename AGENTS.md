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

## Session & context hygiene

- **One tab per track.** Track 1 (IIP) and Track 2 (Cash-Flow Sanebox) have
  separate canonical files and source data — don't work both in the same
  chat tab/session; open a new tab if a request switches tracks.
- **Never paste a full raw file into a prompt.** The 5-part
  `Price_History` CSVs and the two `.xlsx` models are large/tabular —
  reference specific rows, sheets, or ranges instead.
- **Start a fresh tab/session after each append-and-verify cycle** rather
  than extending one long conversation into the next unrelated task.
- **No pinning.** Re-`@`-mention `AGENTS.md` or the relevant file each
  time you need it; don't rely on a pinned file to stay fresh.
- **Antigravity:** the "Known open item" section below is this project's
  Knowledge Item log — check it before starting work, update it (don't
  just delete entries) once an item is resolved.
- Enforced versions of the above live in
  `.cursor/rules/020-context-and-tabs.mdc` (always-on) and
  `.cursor/rules/030-verification.mdc` (manual — invoke with
  `@030-verification` before closing out an edit). Human-facing pre-flight
  checklist: `CONTEXT_CHECKLIST.md`.

## Boundary with `Personal_Finance` — read before comparing totals

`~/Documents/GitHub/Personal_Finance` reads the **same Mercado Pago and Banco do
Brasil statements** this project does, and both look like "personal finance".
They measure different things, and their totals are *supposed* to differ:

| | This repo (`edu_price_analysis`) | `Personal_Finance` |
|---|---|---|
| Question | How much more am I paying **for the same items**? | Where is my money, and what did I spend **by category**? |
| Unit | An item line on a receipt | A transaction |
| Source of truth | `Registro de Compras` ledger | `CALC` (wealth) + `raw/` statements |
| Headline | IIP +40.23% cumulative, R$79.7k ledger 2022–2026 | ~R$282k Jan–Sep 2026 across 26 categories |

**Never reconcile one against the other, and never merge them.** A price index and
a spend total answer different questions from overlapping data. A classification
table, ledger or dashboard belonging to the other project does not belong in this
repo — see the 2026-09-08 entry below.

**The naming trap.** This repo's `origin` is `AUTOGIO/Personal_Finance`.
`Personal_Finance`'s `origin` is `AUTOGIO/Personal_Finance_Dashboards`, and it
carries a second remote (`archive-edu-price-analysis`) pointing at *this* repo's
origin. A 2026-09-07 audit of that repo mistook this project's `29773ca` for its
own remote head and raised a false "remote divergence" risk. Always name the
remote explicitly.

## Known open item

None currently. `TRX-13557`–`TRX-13571` (Masterboi Paraíba, 15 items) used
a placeholder date of 2026-09-02, later confirmed against the physical
receipt (2026-09-04) — no correction needed.

**Resolved 2026-09-08**

- `02_Models/personal_inflation_tracker-v2.BACKUP_pre_append.xlsx` — the rollback
  point for the Sep/2026 253-row append was **missing from the working tree**
  (`A_NOTE_TO_FUTURE_ME.md` §8 had already flagged it as absent). Restored from
  git (`6f1b355`) and verified byte-identical to the tracked blob, valid zip,
  sheets `Terminal IIP` + `Registro de Compras`. Keep it until the append is
  fully trusted.
- `Items_to_review.csv` at the repo root belonged to **`Personal_Finance`** — its
  95-row spending-classification table, carrying one answered row. Nothing here
  read it. Copied to `Personal_Finance/reports/2026-09-08_items_to_review_answered.csv`
  and the original moved to `_to_delete/` per hard rule 3. **Eduardo deletes it.**
