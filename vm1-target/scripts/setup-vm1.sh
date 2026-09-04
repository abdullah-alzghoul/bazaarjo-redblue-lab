#!/bin/bash
# Rebuild & Setup Script for VM1 Target
echo "[+] Updating system packages..."
sudo apt-get update && sudo apt-get install -y apache2 libapache2-mod-wsgi-py3 python3-flask rsyslog

echo "[+] Deploying Apache VHost and Rsyslog config..."
sudo cp ../config/apache-vhost.conf /etc/apache2/sites-available/bazaarjo.conf
sudo cp ../config/rsyslog-forward.conf /etc/rsyslog.d/50-bazaarjo.conf
sudo cp ../config/bash-audit.sh /etc/profile.d/audit.sh

sudo a2ensite bazaarjo.conf
sudo systemctl restart apache2 rsyslog
echo "[+] VM1 Target Setup Complete!"
