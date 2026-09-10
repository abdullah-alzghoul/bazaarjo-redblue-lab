#!/bin/bash
# Initial Reconnaissance Script against VM1 Target
source ../config/target.conf

echo "[*] Running Nmap Port Scan on $TARGET_IP..."
nmap -sV -sC -p- $TARGET_IP -oN nmap_initial.txt

echo "[*] Checking Web Application endpoints..."
curl -I http://$TARGET_IP/
