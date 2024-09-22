.PHONY: help
.EXPORT_ALL_VARIABLES:
SHELL := /bin/bash -euo pipefail

BLACK ?= \033[0;30m
RED ?= \033[0;31m
GREEN ?= \033[0;32m
YELLOW ?= \033[0;33m
BLUE ?= \033[0;34m
PURPLE ?= \033[0;35m
CYAN ?= \033[0;36m
GRAY ?= \033[0;37m
COFF ?= \033[0m

BAKE_OPTIONS=--no-input

initialize:
ifneq ($(wildcard .git),)
	@printf "$(CYAN)>>> Repository already initialized.$(COFF)\n"
else
	@printf "$(CYAN)>>> Initializing git repository.$(COFF)\n"
	git init
endif

deps: initialize ## Install dependencies, including dev & test dependencies
	@printf "$(CYAN)>>> Creating environment for project...$(COFF)\n"
	poetry install --no-root --sync
	poetry run pre-commit install
	poetry run pre-commit install --hook-type pre-push

bake:  ## Generate project using defaults
	cookiecutter $(BAKE_OPTIONS) . --overwrite-if-exists

test: ## Run unit tests
	@printf "$(CYAN)Running test suite$(COFF)\n"
	poetry run pytest tests

check: ## Run static code checkers and linters
	@printf "$(CYAN)Running static code analysis and license generation$(COFF)\n"
	poetry run ruff check tests
	@printf "All $(GREEN)done$(COFF)\n"

lint: ## Runs ruff formatter
	@printf "$(CYAN)Auto-formatting with ruff$(COFF)\n"
	poetry run ruff format tests
	poetry run ruff check tests --fix

precommit: ## Runs all pre-commit hooks
	@printf "$(CYAN)Running pre-commit hooks$(COFF)\n"
	poetry run pre-commit run --all-files
	@printf "All $(GREEN)done$(COFF)\n"

license: ## Generated the licenses.md file based on the project's dependencies
	@printf " >>> Generating $(CYAN)licenses.md$(COFF) file\n"
	poetry run pip-licenses --with-authors -f markdown --output-file ./licenses.md

clean: ## Removed the build, dist directories, pycache, pyo or pyc and swap files
	@printf "$(CYAN)Cleaning EVERYTHING!$(COFF)\n"
	@rm -rf build/
	@rm -rf dist/
	@rm -rf *.egg-info
	@find . -type d -name '__pycache__' -exec rm -rf {} +
	@find . -type f -name '*.py[co]' -exec rm -f {} +
	@find . -name '*~' -exec rm -f {} +
	@find . -type f -name '.DS_Store' -delete
	@printf "$(GREEN)>>> Removed$(COFF) pycache, .pyc, .pyo, .DS_Store files and files with ~\n"

all: clean lint test license ## Runs clean, lint, test and license targets
	@printf "$(GREEN)>>> Done$(COFF) ~\n"

#################################################################################
# Self Documenting Commands                                                     #
#################################################################################
.DEFAULT_GOAL := help
.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "$(CYAN)%-30s$(COFF) %s\n", $$1, $$2}'
