.PHONY: deps test

deps:
	pip install -r requirements.txt; \
		pip install -r test_requirements.txt
lint:
	flake8 --exit-zero hello_world test
test:
	PYTHONPATH=. py.test --verbose -s

docker build:
	docker image build -t hello-world-printer .
run:
	PYTHONPATH=. FLASK_APP=hello_world flask run
