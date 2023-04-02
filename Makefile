.PHONY: deps test

deps:
	pip install -r requirements.txt; \
		pip install -r test_requirements.txt

run:
	python main.py

lint:
	flake8 hello_world test

test:
	PYTHONPATH=. py.test
	PYTHONPATH=. py.test --verbose -s

activate:
	source .venv/bin/action

curl:
	curl 127.0.0.1:5000/

docker_build:
	docker build -t hello-world-printer .

test_smoke:
		curl --fail 127.0.0.1:5000

test_smoke:
		curl -s -o /dev/null -w "%{http_code}" --fail 127.0.0.1:5000

docker_run:
	docker run --name hello-world-printer-dev -p 5000:5000 -d hello-world-printer
