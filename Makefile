

install:
	@echo "Installing..."
	@poetry install --sync

test: install
	@echo "Running tests..."
	@poetry run test-all
