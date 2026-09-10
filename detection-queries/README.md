# Blue Team Detection Rules & SIEM Queries

This directory contains the detection logic engineered by the Blue Team to monitor, detect, and investigate attacks on **VM1 (Target Application)**.

## Detection Coverage Matrix

| Attack Type | Log Source | Detection Method | Artifact / File |
|---|---|---|---|
| **SQL Injection** | Apache Access Logs | Splunk SPL Pattern Matching | `splunk_queries.spl` |
| **Command Injection** | Apache Access Logs | Regex URI Parameter Scanning | `splunk_queries.spl` |
| **Unrestricted File Upload** | Apache Access / Disk | YARA File Scanner & SIEM Alert | `webshell_rule.yar` |
| **Post-Exploitation** | Linux Audit Logs (`/var/log/syslog`) | Syslog Bash Audit Parser | `splunk_queries.spl` |

## Detection Rule Purpose

### splunk_queries.spl

This file contains Splunk Search Processing Language (SPL) rules used to detect suspicious activity from Apache access logs and system logs.

The queries focus on:

- SQL Injection payload patterns.
- Command execution attempts.
- Web shell access.
- Suspicious attacker behavior after exploitation.

### webshell_rule.yar

This YARA rule detects uploaded malicious PHP web shells by searching for dangerous execution functions such as:

- system()
- exec()
- passthru()

The rule is applied against the application upload directory to identify successful file upload exploitation.

## Detection Validation

Each detection rule should be tested by executing the corresponding attack scenario and confirming that:

1. The event appears in the collected logs.
2. The Splunk query returns the malicious activity.
3. The YARA rule identifies uploaded malicious files.

## Deployment Instructions

1. **Splunk Integration:** Import queries from `splunk_queries.spl` into Splunk Enterprise saved searches and alert actions.
2. **YARA Scanning:** Run YARA against the upload directory:
   ```bash
   yara -r webshell_rule.yar /var/www/html/vulnerable-app/uploads/
   ```
