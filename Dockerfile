FROM python:3.12.0-slim

ENV HOST=0.0.0.0
ENV PORT=8000

WORKDIR /app

COPY src ./src
COPY pyproject.toml .

RUN python3 -m venv .venv && \
  . .venv/bin/activate && \
  pip install --no-cache-dir .

EXPOSE ${PORT}

CMD . /app/.venv/bin/activate && uvicorn hexencoder.main:app --host $HOST --reload --port $PORT

