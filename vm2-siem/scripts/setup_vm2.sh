#!/bin/bash

echo "[+] Preparing VM2 SIEM configuration..."

echo "[+] Creating Splunk configuration directory..."

sudo mkdir -p /opt/splunk/etc/system/local

echo "[+] Copying Splunk input configuration..."

sudo cp ../config/splunk_inputs.conf /opt/splunk/etc/system/local/

sudo cp ../config/indexes.conf /opt/splunk/etc/system/local/

echo "[+] Restarting Splunk..."

sudo /opt/splunk/bin/splunk restart

echo "[+] VM2 SIEM Setup Complete!"
