SERVICE_NAME=hello_world_printer
DOCKER_IMG_NAME=$(SERVICE_NAME)
.PHONY: test


USERNAME=7kaza
TAG=$(USERNAME)/hello_world_printer

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
	docker build  -t helo_world_printer .

docker_run: docker_build
		docker run \
			--name hello_world_printer-dev \
			-p 5000:5000 \
			-d hello_world_printer

docker_push: docker_build
	@docker login --username $(USERNAME) --password $${DOCKER_PASSWORD}; \
	docker tag hello_world_printer $(TAG); \
	docker push $(TAG); \
	docker logout;

docker_stop:
	docker stop hello_world_printer-dev

test_cov:
	PYTHONPATH=. py.test --verbose -s --cov=.
	PYTHONPATH=. py.test --verbose -s --cov=. --cov-report xml

test_xunit:
	PYTHONPATH=. py.test -s --cov=. --cov-report xml --junit-xml=test_results.xml  
