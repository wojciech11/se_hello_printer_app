.PHONY: test

deps:
	pip install -r requirements.txt;	\
	pip install -r test_requirements.txt

lint:
	flake8 hello_world test

test:
	flake8 hello_world test

run:
	flake8 hello_world test
