
ifneq ("$(wildcard .env)","")
    include .env
    export $(shell sed 's/=.*//' .env | grep -v '^#')
endif

VENV_PATH?=~/.venv/hexencoder
APP_PORT?=8000
NAME?=hexencoder

build-venv:
	python3 -m venv $(VENV_PATH)
	. $(VENV_PATH)/bin/activate \
		&& pip install . --no-cache-dir

venv:
	. $(VENV_PATH)/bin/activate \
		&& uvicorn hexencoder.main:app --reload --port $(APP_PORT) --host 0.0.0.0

build-docker:
	docker build -t hexencoder:latest .

docker-run:
	docker run -d --name $(NAME) -p $(APP_PORT):8000 hexencoder:latest

docker-start:
	docker start $(NAME)

docker-stop:
	docker stop $(NAME)

test:
	. $(VENV_PATH)/bin/activate \
		&& pytest -v --tb=short --disable-warnings

docker-clean: docker-stop
	docker container rm $(NAME)
	docker image rm hexencoder:latest

venv-clean:
	rm -rf $(VENV_PATH)

clean: docker-clean venv-clean
