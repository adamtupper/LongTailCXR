#!/bin/bash

# Switch to project root
cd ..

# Setup virtual environment
virtualenv env -p python3.10
source env/bin/activate
pip install --upgrade pip

# Install development-specific dependencies
pip install -r requirements_dev.txt --extra-index-url https://download.pytorch.org/whl/cu117

# Install project dependencies
pip install -r requirements.txt