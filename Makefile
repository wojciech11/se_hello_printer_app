.PHONY: test

deps:
	pip install -r requirements.txt; \
	pip install -r test_requirements.txt

lint:
	flake hello_world test

run:
	python main.py
test:
	PYTHONPATH=. py.test
