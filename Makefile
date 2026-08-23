VENV = .venv

PYTHON = $(VENV)/bin/python
PIP = $(PYTHON) -m pip
PYTEST = $(PYTHON) -m pytest
PYLINT = $(PYTHON) -m pylint
BUILD = $(PYTHON) -m build

.PHONY: venv install test lint build clean check run activate

venv:
	python3 -m venv $(VENV)
	$(PIP) install --upgrade pip
	@echo "Virtual environment created!"
	@echo "Run: source $(VENV)/bin/activate"

activate:
	@echo "Run: source $(VENV)/bin/activate"

install: venv
	$(PIP) install -e ".[dev]"

test:
	$(PYTEST)

lint:
	$(PYLINT) src tests

build:
	$(BUILD)

clean:
	rm -rf build dist *.egg-info
	find . -type d -name "__pycache__" -exec rm -rf {} +

check: lint test

run:
	$(VENV)/bin/dev-shell