#!/bin/bash
VENV_DIR="/home/ubuntu/urlshortener/myenv"
REQUIREMENT_FILE="/home/ubuntu/urlshortener/requirements.txt"
MARKER_FILE="$VENV_DIR/.requirement-installed"


if [ ! -d "$VENV_DIR" ]; then
	python3 -m venv "$VENV_DIR"
fi

source "$VENV_DIR/bin/activate"

if [ ! -f "$MARKER_FILE" ]; then
	pip install -r "$REQUIREMENT_FILE" && touch "$MARKER_FILE"
fi

python3 /home/ubuntu/urlshortener/app.py 
