#!/usr/bin/env bash

# Install packages
sudo apt update
sudo apt-get install -y nginx python3-venv vim systemd curl

# Activate python virtual environment
python3 -m venv django_env
source django_env/bin/activate

# Install python packages
pip install -r /vagrant/requirements.txt 
pip install supervisor

# setup nginx
sudo cp /vagrant/conf/myproject_nginx /etc/nginx/sites-available/myproject
sudo ln -s /etc/nginx/sites-available/myproject /etc/nginx/sites-enabled


# setup and start supervisor to manage gunicorn
sudo django_env/bin/echo_supervisord_conf > /etc/supervisord.conf
cat /vagrant/conf/myproject_gunicorn.conf >> /etc/supervisord.conf
django_env/bin/supervisord

# change permissions of folder to allow nginx to access
chmod +x /home/
chmod +x /home/vagrant

# restart nginx
sudo service nginx restart
