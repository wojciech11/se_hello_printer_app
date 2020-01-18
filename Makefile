.PHONY: test
deps:
	pip install -r test_requirements.txt; \
	pip install -r test_requirements.txt

test:
	PYTHONPATH=. py.test --verbose -s

link:
	flake8 hello_world test

run:
	PYTHONPATH=. FLASK_APP=hello_world flask run
