# Bazaarjo Red/Blue Lab

A four-phase attack-defense lifecycle simulation built for Cybersecurity Graduation Field Training.
This repository contains the complete infrastructure-as-code, detection logic, and documentation for a controlled penetration testing environment.

## Architecture
- **VM1-Target** (`192.168.56.101`): Vulnerable Flask web application (Apache/mod_wsgi)
- **VM2-SIEM** (`192.168.56.102`): Splunk Enterprise log collector and indexer
- **VM3-Attacker** (`192.168.56.103`): Kali Linux offensive workstation

## Vulnerabilities Implemented
1. Unrestricted File Upload
2. Reflected Cross-Site Scripting (XSS)
3. OS Command Injection
4. SQL Injection (Union-based)

## Log Forwarding
- Apache access logs → Splunk via rsyslog/imfile (UDP/514)
- Bash command history → Splunk via rsyslog (UDP/514)

## Team Roles
- S1 (Architecture & Visibility): Abdallah Ali Alzghoul
- S2 (Red Team): ---------------------
- S3 (Blue Team): ---------------------
- S4 (Mitigation): --------------------

## Quick Start
See `vm1-target/scripts/setup-vm1.sh` to rebuild the target environment.
