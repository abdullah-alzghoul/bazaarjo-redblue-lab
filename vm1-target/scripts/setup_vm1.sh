#!/bin/bash
# Rebuild & Setup Script for VM1 Target
echo "[+] Updating system packages..."
sudo apt-get update && sudo apt-get install -y apache2 libapache2-mod-wsgi-py3 python3-flask rsyslog

echo "[+] Creating application directory structure..."

sudo mkdir -p /var/www/html/vulnerable-app/uploads

sudo chown -R www-data:www-data /var/www/html/vulnerable-app

sudo chmod -R 755 /var/www/html/vulnerable-app

echo "[+] Deploying application files..."

sudo cp ../app/app_patched.py /var/www/html/vulnerable-app/
sudo cp ../app/vulnerable_app.wsgi /var/www/html/vulnerable-app/

sudo mkdir -p /var/www/html/vulnerable-app/uploads

sudo chown -R www-data:www-data /var/www/html/vulnerable-app
sudo chmod -R 755 /var/www/html/vulnerable-app

echo "[+] Deploying Apache VHost and Rsyslog config..."
sudo cp ../config/apache_vhost.conf /etc/apache2/sites-available/vulnerable-app.conf
sudo cp ../config/rsyslog_forward.conf /etc/rsyslog.d/50-bazaarjo.conf
sudo cp ../config/bash_audit.sh /etc/profile.d/audit.sh

sudo a2ensite vulnerable-app.conf
sudo systemctl restart apache2 rsyslog
echo "[+] VM1 Target Setup Complete!"
