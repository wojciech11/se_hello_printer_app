.PHONY: deps test
deps:
	pip install -r requirements.txt; \
        pip install -r test_requirements.txt

lint:
	flake8 --exit-zero hello_world test

run:
	PYTHONPATH=. FLASK_APP=hello_world flask run