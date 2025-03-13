#!/bin/bash
source venv/bin/activate
export FLASK_APP=app.py
export FLASK_ENV=development
export DATABASE_URL="postgresql://flask_user:new_password@localhost:5432/flask_app"

python3 app.py