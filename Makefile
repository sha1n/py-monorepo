REPO_PATH		:= $(shell git rev-parse --show-toplevel)
PYTHON_VERSION 	:= "3.13"

define run_on_all_modules
	@for module in $(shell ls modules); do \
		if [ -d "modules/$$module" ]; then \
			echo "Running command on modules/$$module..."; \
			$(1) $(REPO_PATH)/modules/$$module; \
		fi \
	done
endef


.PHONY: install
install: .env
	@echo "Syncing..."
	@poetry sync

.PHONY: test
test: install
	@echo "Running tests..."
	@poetry run pytest

.PHONY: format
format: install
	@echo "Running black formatter..."
	@poetry run black --safe .

.PHONY: lint
lint: .ruff .black_check .poetry-check

.PHONY: fix-lint
fix-lint: format
	@echo "Running automatic lint fixes..."
	@poetry run ruff check . --fix

.PHONY: build
build: install
	@echo "Building packages..."
	@poetry build

.PHONY: clean
clean:
	@echo "Cleaning up..."
	@poetry env remove --all
	@rm -rf dist/ .pytest_cache .coverage coverage.xml .ruff_cache .pytest_cache

.PHONY: .poetry-check
.poetry-check:
	@echo "Checking project configuration..."
	@poetry check

.PHONY: .ruff
.ruff:
	@echo "Running ruff..."
	@poetry run ruff check .

.PHONY: .black_check
.black_check:
	@echo "Running format checks..."
	@poetry run black --safe --check --diff --color .


.PHONY: .env
.env:
	@poetry env use $(PYTHON_VERSION)
