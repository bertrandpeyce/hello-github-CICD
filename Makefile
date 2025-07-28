
VENV_PATH=~/.venv/hexencoder
APP_PORT=8000

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
	docker run -d --name hexencoder -p $(APP_PORT):$(APP_PORT) hexencoder:latest

docker-start:
	docker start hexencoder

docker-stop:
	docker stop hexencoder
