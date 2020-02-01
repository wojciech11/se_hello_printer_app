.PHONY: test

deps:
	pip install -r requirements.txt;\
	pip install -r test_requirements.txt

lint:
	flake8 hello_world test

run:
	PYTHONPATH=. FLASK_APP=hello_world flask run

test:
	PYTHONPATH=. py.test
	PYTHONPATH=. py.test  --verbose -s
