.PHONY: deps test

deps:
		pip install -r requirements.txt; \
		pip install -r test_requirements.txt
lint:
		flake8 hello_world test
test:
		PYTHONPATH=. py.test --verbose -s
run:
		python main.py
docker_build:
		docker build -t hello-world-printer .
docker_run:
		docker run --name hello-world-printer-dev -p 5000:5000 -d hello-world-printer
docker_stop:
		docker stop hello-world-printer-dev
