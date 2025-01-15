sudo dnf install python3 python3-pip python3-venv certbot python3-certbot-nginx
pip install django gunicorn
sudo dnf install nginx
sudo certbot --nginx -d febbler.com
systemctl enable nginx.service
