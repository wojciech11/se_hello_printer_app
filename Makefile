.PHONY: test

deps:
	echo ${DOCKER_PASSWORD}
	pip install -r requirements.txt;\
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
	docker run \
		--name hello-world-printer-dev \
		-p 5000:5000 \
		-d hello-world-printer

docker_restart:
	docker stop hello-world-printer-dev
	docker start hello-world-printer-dev

USERNAME=katarzynamyrcik
TAG=$(USERNAME)/hello-world-printer

docker_push: docker_build
		docker login --username ${USERNAME}  --password ${DOCKER_PASSWORD}; \
		docker tag hello-world-printer ${TAG}; \
		docker push ${TAG}; \
		docker logout;
