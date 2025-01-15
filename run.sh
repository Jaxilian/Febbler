source venv/bin/activate
python manage.py migrate
sudo gunicorn Febbler.wsgi:application --bind 0.0.0.0:443