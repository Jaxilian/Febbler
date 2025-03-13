#!/bin/bash
source venv/bin/activate

# Reset database
sudo -u postgres psql -c "DROP DATABASE IF EXISTS flask_app;"
sudo -u postgres psql -c "DROP USER IF EXISTS flask_user;"
sudo -u postgres psql -c "CREATE USER flask_user WITH PASSWORD 'new_password' CREATEDB;"
sudo -u postgres psql -c "CREATE DATABASE flask_app OWNER flask_user;"

# Grant schema privileges
sudo -u postgres psql -d flask_app -c \
    "GRANT ALL PRIVILEGES ON SCHEMA public TO flask_user;"
sudo -u postgres psql -d flask_app -c \
    "ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON TABLES TO flask_user;"
sudo -u postgres psql -d flask_app -c \
    "ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON SEQUENCES TO flask_user;"

#if using existing database:
sudo -u postgres psql -d flask_app -c \
    "GRANT CREATE ON SCHEMA public TO flask_user;"
sudo -u postgres psql -d flask_app -c \
    "GRANT USAGE ON SCHEMA public TO flask_user;"

# Set environment variables
export FLASK_APP=app.py
export FLASK_ENV=development
export DATABASE_URL="postgresql://flask_user:new_password@localhost:5432/flask_app"

# Migrations
rm -rf migrations/
flask db init
flask db migrate
flask db upgrade