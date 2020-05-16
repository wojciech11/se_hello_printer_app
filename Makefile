SERVICE_NAME=hello-world-printer
DOCKER_IMG_NAME=$(SERVICE_NAME)
.PHONY: test .DEFAULT_GOAL := test

USERNAME = '7kaza'


deps:
	pip install -r requirements.txt
	pip install -r test_requirements.txt

lint:
	flake8 hello_world test

run:
	PYTHONPATH=. FLASK_APP=hello_world flask run

test:
	PYTHONPATH=. py.test

docker_build:
  docker build -t $(DOCKER_IMG_NAME)

docker_run: docker_build
	docker run
		--name $(SERVICE_NAME)-dev
	  -p 5000:5000
	  -d $(DOCKER_IMG_NAME)

docker_stop:
	docker stop $(SERVICE_NAME)-dev

docker_push: docker_build
	@docker login --username $(USERNAME) --password $${DOCKER_PASSWORD}; \
	docker tag $(DOCKER_IMG_NAME) $(TAG); \
	docker push $(TAG); \
	docker logout;
