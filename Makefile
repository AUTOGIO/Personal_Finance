# edu_price_analysis — operational commands
# Run `make` or `make help` to see this list.

SHELL := /bin/bash
.DEFAULT_GOAL := help

.PHONY: help open backup tree

help:
	@echo "edu_price_analysis — available commands"
	@echo "  make open      Open the full analysis working set (both tracks: IIP + cash-flow model)"
	@echo "  make backup    Snapshot personal_inflation_tracker-v2.xlsx before editing (reversible)"
	@echo "  make tree      Print the folder structure"

open:
	@./open_analysis.command

backup:
	@mkdir -p 02_Models/_backups
	@cp 02_Models/personal_inflation_tracker-v2.xlsx "02_Models/_backups/personal_inflation_tracker-v2.$$(date +%Y%m%d-%H%M%S).xlsx"
	@echo "backup saved -> 02_Models/_backups/"

tree:
	@find . -not -path '*/_to_delete*' -not -path '*/_backups*' -not -name '.DS_Store' -not -path '*/.git*' | sort | sed -e 's|[^/]*/|  |g'
