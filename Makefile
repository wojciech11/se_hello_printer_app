.PHONY: test

deps:
	pip install -r requirements.txt
	pip install -r test_requirements.txt

lint:
	flake8 hello_world.txt test

run:
	python main.py

test:
	PYTHONPATH=. py.test
	PYTHONPATH=. py.test  --verbose -s

docker_build:
	docker build -t hello-world-printer .

docker_run: docker_build
	docker run \
		--name hello-world-printer-dev \
		-p 5000:5000 \
		-d hello-world-printer
