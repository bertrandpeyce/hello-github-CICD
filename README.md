# hello-github-CICD# Environment and dependencies

# Create virtual environment

python -m venv .venv
source .venv/bin/activate

# Install dependencies

pip install fastapi uvicorn pytest

# Install package

pip install .

# Test the service

pytest

# Run the service

uvicorn hexencoder.main:app --reload
