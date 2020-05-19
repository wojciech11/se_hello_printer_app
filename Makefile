SERVICE_NAME=hello_world_printer
DOCKER_IMG_NAME=$(SERVICE_NAME)
.PHONY: test


USERNAME=7kaza
TAG=$(USERNAME)/hello-world-printer

deps:
	pip install -r requirements.txt; \
	pip install -r test_requirements.txt

test:
	PYTHONPATH=. py.test  --verbose -s

lint:
	flake8 hello_world test

run:
	PYTHONPATH=. FLASK_APP=hello_world flask run

docker_build:
	docker build  -t helo-world-printer .

docker_run: docker_build
		docker run \
			--name hello-world-printer-dev \
			-p 5000:5000 \
			-d hello-world-printer

docker_push: docker_build
	@docker login --username $(USERNAME) --password $${DOCKER_PASSWORD}; \
	docker tag hello-world-printer $(TAG); \
	docker push $(TAG); \
	docker logout;

docker_stop:
	docker stop hello-world-printer-dev

test_cov:
	PYTHONPATH=. py.test --verbose -s --cov=.
	PYTHONPATH=. py.test --verbose -s --cov=. --cov-report xml

test_xunit:
	PYTHONPATH=. py.test -s --cov=. --junit-xml=test_results.xml
