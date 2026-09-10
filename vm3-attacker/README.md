# VM3 Attacker

## Purpose

VM3 represents the Red Team attacker machine used to perform authorized penetration testing against VM1 Target.

The objective is to simulate attacks against the vulnerable application and generate security events for detection by VM2 SIEM.

## Attack Components

### payloads/

Contains proof-of-concept attack payloads.

- shell.php:
  - Used to demonstrate unrestricted file upload exploitation.
  - Simulates a malicious PHP web shell.

### scripts/

Contains exploitation and reconnaissance scripts.

## Available Scripts

### reconnaissance.sh

Purpose:
- Performs initial information gathering against VM1.

Actions:
- Nmap service discovery.
- HTTP endpoint checking.

### sqli_exploit.py

Purpose:
- Demonstrates SQL Injection exploitation.

Target:
- VM1 `/sqli` endpoint.

### cmdi_exploit.py

Purpose:
- Demonstrates OS Command Injection exploitation.

Target:
- VM1 `/cmdi` endpoint.

### xss_exploit.py

Purpose:
- Demonstrates Cross-Site Scripting (XSS) exploitation.

Target:
- VM1 `/xss` endpoint.

Payload:
- Sends a reflected JavaScript payload to verify XSS behavior.

Expected Result:
- The application response contains the injected payload, allowing the Blue Team to verify XSS detection rules.

## Target Configuration

VM1 Target IP:

192.168.56.101

Network:

192.168.56.0/24

## Authorized Usage

These tools are only for the isolated laboratory environment.

## Red Team Attack Workflow

The penetration testing workflow follows the same sequence used in the project methodology.

### Phase 1 — Reconnaissance

Run:

```bash
bash scripts/reconnaissance.sh
