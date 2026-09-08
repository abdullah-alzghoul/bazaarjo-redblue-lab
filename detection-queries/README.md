# Blue Team Detection Rules & SIEM Queries

This directory contains the detection logic engineered by the Blue Team to monitor, detect, and investigate attacks on **VM1 (Target Application)**.

## Detection Coverage Matrix

| Attack Type | Log Source | Detection Method | Artifact / File |
|---|---|---|---|
| **SQL Injection** | Apache Access Logs | Splunk SPL Pattern Matching | `splunk_queries.spl` |
| **Command Injection** | Apache Access Logs | Regex URI Parameter Scanning | `splunk_queries.spl` |
| **Unrestricted File Upload** | Apache Access / Disk | YARA File Scanner & SIEM Alert | `webshell_rule.yar` |
| **Post-Exploitation** | Linux Audit Logs (`/var/log/syslog`) | Syslog Bash Audit Parser | `splunk_queries.spl` |

## Deployment Instructions

1. **Splunk Integration:** Import queries from `splunk_queries.spl` into Splunk Enterprise saved searches and alert actions.
2. **YARA Scanning:** Run YARA against the upload directory:
   ```bash
   yara -r webshell_rule.yar /var/www/html/vulnerable-app/uploads/
```
