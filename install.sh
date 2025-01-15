sudo dnf install python3 python3-pip python3-venv certbot python3-certbot-nginx
sudo dnf install nginx
sudo certbot --nginx -d febbler.com
systemctl enable nginx.service

python3 -m venv venv
source venv/bin/activate
pip install django gunicorn
