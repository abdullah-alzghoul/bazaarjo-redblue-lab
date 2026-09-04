# BazaarJo Red/Blue Team Cybersecurity Lab

## Overview
A multi-VM hands-on cybersecurity lab simulating attack vector execution (Red Team) and SIEM log monitoring/telemetry analysis (Blue Team).

## Environment Architecture
* **VM1 (Target):** Debian 11 - Apache2, Vulnerable Flask App (`192.168.56.101`)
* **VM2 (SIEM):** Ubuntu Server - Splunk Enterprise (`192.168.56.102`)
* **VM3 (Attacker):** Kali Linux - Attack Execution Tools (`192.168.56.103`)

## Repository Structure
* `vm1-target/`: Web application source code and system configuration files.
* `vm2-siem/`: Splunk input configurations and indexes.
* `vm3-attacker/`: Reconnaissance and attack payload scripts.
* `docs/`: Network topology and system architecture diagrams.
* `detection-queries/`: SPL queries for attack detection.
