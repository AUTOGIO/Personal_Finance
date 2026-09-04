#!/bin/bash
# open_analysis.command — one push of the button: opens every file needed
# to analyze edu_price_analysis (README, tracker, terminal, reports).
# Double-click in Finder, or: make open
set -e
cd "$(dirname "$0")"

FILES=(
  "README.md"
  "README_Personal_Inflation.md"
  "02_Models/personal_inflation_tracker-v2.xlsx"
  "02_Models/iip_terminal.html"
  "02_Models/modelo_financeiro_saneado_v3.xlsx"
  "01_Reports/personal_inflation_index.md"
  "01_Reports/category_inflation_and_budget_2027.md"
  "01_Reports/litoral_price_analysis.md"
  "05_Comparisons/manaira_vs_litoral_price_comparison.md"
)

echo "Opening edu_price_analysis working set..."
for f in "${FILES[@]}"; do
  if [ -f "$f" ]; then
    echo "  -> $f"
    open "$f"
  else
    echo "  !! missing: $f"
  fi
done
echo "Done."
