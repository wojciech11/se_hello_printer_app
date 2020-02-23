.PHONY: test

deps:
	pip install -r requirements.txt; \
	pip install -r test_requirements.txt

lint:
	flake8 hello_world test

test:
	PYTHONPATH=. py.test  --verbose -s

run:
	PYTHONPATH=. FLASK_APP=hello_world flask run

docker_build:
	docker build -t hello_world_printer .

docker_run:
	docker run \
	--name hello_world_printer-dev \
	-p 5000:5000 \
	-d hello_world_printer

docker_push:
	USERNAME=subbler
	TAG=$(USERNAME)/hello_world_printer

	@docker login --username ${USERNAME} --password $${DOCKER_PASSWORD}; \
	docker tag hello_world_printer $(TAG); \
	docker push $(TAG); \
	docker logout;
