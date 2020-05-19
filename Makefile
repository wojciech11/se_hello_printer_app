SERVICE_NAME=hello-world-printer
DOCKER_IMG_NAME=$(SERVICE_NAME)

.PHONY: test
.DEFAULT_GOAL := test

USERNAME=7kaza
TAG=$(USERNAME)/$helo-world-printer

deps:
	pip install -r requirements.txt; \
	pip install -r test_requirements.txt

run:
	PYTHONPATH=. FLASK_APP=hello_world flask run

lint:
	flake8 hello_world test

test:
	PYTHONPATH=. py.test  --verbose -s

test_cov:
	PYTHONPATH=. py.test --verbose -s --cov=.
	PYTHONPATH=. py.test --verbose -s --cov=. --cov-report xml

test_xunit:
	PYTHONPATH=. py.test -s --cov=. --junit-xml=test_results.xml

test_smoke:
	curl --fail 127.0.0.1:5000

docker_build:
	docker build -t $(DOCKER_IMG_NAME) .

docker_run: docker_build
	docker run \
	 --name $(SERVICE_NAME)-dev \
	 -p 5000:5000 \
	 -d $(DOCKER_IMG_NAME)

docker_push: docker_build
	@docker login --username $(USERNAME) --password $${DOCKER_PASSWORD}; \
	docker tag $(DOCKER_IMG_NAME) $(TAG); \
	docker push $(TAG); \
	docker logout;

docker_stop:
	docker stop $(SERVICE_NAME)-dev
