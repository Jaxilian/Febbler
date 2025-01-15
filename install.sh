sudo dnf install python3 python3-pip certbot python3-certbot-nginx
sudo dnf install nginx
sudo certbot --nginx -d febbler.com
systemctl enable nginx.service

pip3 install --break-system-packages virtualenv
pip install django gunicorn
python3 -m venv venv
source venv/bin/activate
