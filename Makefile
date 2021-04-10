.PHONY: test

deps:
	pip install -r requirements.txt;\
	pip install -r test_requirements.txt

lint:
#	flake8 hello_world test
#	pip install flake8-noqa
#	flake8 --noqa-no-include-name E302,E402,F401,W292,E501 hello_world test

test:
	PYTHONPATH=. py.test --verbose -s

run:
	python main.py
