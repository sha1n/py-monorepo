REPO_PATH		:= $(shell git rev-parse --show-toplevel)
PYTHON_VERSION 	:= "3.13"

define run_in_all_projects
	@for project in $(shell ls projects); do \
		if [ -d "projects/$$project" ]; then \
			echo "Running '$(1)' on projects/$$project..."; \
			cd $(REPO_PATH)/projects/$$project && $(1) && cd $(REPO_PATH); \
		fi \
	done
endef


.PHONY: lock
lock: .env
	@echo "Locking..."
	@poetry lock
	$(call run_in_all_projects,poetry lock)

.PHONY: install
install: .env
	@echo "Syncing..."
	@poetry sync

.PHONY: test
test: install
	@echo "Running tests..."
	$(call run_in_all_projects,poetry install && poetry run pytest || exit 1)

.PHONY: format
format: install
	@echo "Running black formatter..."
	@poetry run black --safe .

.PHONY: lint
lint: install .ruff .black_check .poetry-check

.PHONY: fix-lint
fix-lint: format
	@echo "Running automatic lint fixes..."
	@poetry run ruff check . --fix

.PHONY: build
build: install
	@echo "Building packages..."
	$(call run_in_all_projects,poetry build)

.PHONY: clean
clean:
	@echo "Cleaning up..."
	@poetry env remove --all
	$(call run_in_all_projects,poetry env remove --all)
	$(call run_in_all_projects,rm -rf dist/ .pytest_cache .coverage coverage.xml .ruff_cache .pytest_cache)
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
