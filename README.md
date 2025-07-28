# hello-github-CICD

hello-github-CICD is a simple FastAPI service that encodes and decodes hexadecimal strings. It provides endpoints to encode a string to hexadecimal and decode a hexadecimal string back to its original form.
It is designed to be used as a demonstration of continuous integration and continuous deployment (CICD) practices with GitHub.

## Environment and dependencies

Required dependencies:

- Python3
- fastapi

Optional dependencies:

- uvicorn
- pytest

## Setup

### Python venv

1. Clone the repository:

```bash
git clone git@github.com:bertrandpeyce/hello-github-CICD.git
cd hello-github-CICD
```

2. Create a virtual environment and install the package:

```bash
python3 -m venv ~/.venv/hexencoder/
source .venv/bin/activate
pip install .
```

or use Makefile

```bash
make build-venv
```

3. Run the tests to ensure everything is working correctly:

```bash
pytest
```

4. Run the service:

```bash
uvicorn hexencoder.main:app --reload --port 8000 --host 0.0.0.0
```

or use Makefile

```bash
make venv
```

6. Test the service

```bash
# Encode "toto" to hexadecimal
curl http://localhost:8000/encode/toto
# expected output: "746f746f"
curl http://localhost:8000/decode/746f746f
# expected output: "toto"
```

### Docker

1. Clone the repository:

```bash
git clone git@github.com:bertrandpeyce/hello-github-CICD.git
cd hello-github-CICD
```

2. Build the docker image

```bash
docker build -t hexencoder .
```

3. Run the container

```bash
docker run -d --name hexencoder -p 8000:8000 localhost/hexencoder
```

4. Test the service

```bash
# Encode "toto" to hexadecimal
curl http://localhost:8000/encode/toto
# expected output: "746f746f"
curl http://localhost:8000/decode/746f746f
# expected output: "toto"
```

You can also use Makefile target to build and run the docker, see `Makefile`
