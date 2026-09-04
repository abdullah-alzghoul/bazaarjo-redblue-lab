#!/bin/bash
# Initial Reconnaissance Script against VM1 Target
TARGET_IP="192.168.56.101"

echo "[*] Running Nmap Port Scan on $TARGET_IP..."
nmap -sV -sC -p- $TARGET_IP -oN nmap_initial.txt

echo "[*] Checking Web Application endpoints..."
curl -I http://$TARGET_IP/
