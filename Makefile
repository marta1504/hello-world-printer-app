.PHONY: test deps

deps:
	pip install -r requirements.txt; \
	pip install -r test_requirements.txt

lint:
	flake8 hello_world test

test:
	PYTHONPATH=. py.test --verbose -s

docker_build:
	docker build -t hello-world-printer .

docker_run: docker_build
		docker run \
		   --name hello-wold-printer-dev \
		   -p 5000:5000 \
		   -d hello-wold-printer

USERNAME=marta1504 # marta1504
TAG=$(USERNAME)/hello-world-printer
docker_push:
	docker login --username $(USERNAME) --password $(PASSWORLD) ; \
	docker tag hello-wold-printer $(TAG); \
	docker push $(TAG); \
	docker logout;
