# Attack & Defense Incident Timeline

This timeline documents the synchronized sequence of offensive operations executed by the Red Team (**Ashraf**) and the corresponding detection and incident response events captured by the Blue Team (**Osama**).

| Timestamp (UTC) | Phase | Red Team Action (VM3) | Blue Team Visibility & Alert (VM2 SIEM) | Status |
|---|---|---|---|---|
| **10:00:15** | Reconnaissance | Executed `nmap -sV -sC 192.168.56.101` | TCP connection bursts logged on port 80/22 | Detected |
| **10:12:40** | Vulnerability Scan | Enumerated endpoints using `gobuster` / `curl` | High volume of HTTP 200/404 responses in Apache access logs | Detected |
| **10:25:05** | SQL Injection | Submitted payload `admin' OR '1'='1` to `/sqli` | Splunk SPL rule triggered on URI parameter SQL keywords | Alerted |
| **10:38:12** | Command Injection | Sent RCE string `127.0.0.1; id; uname -a` to `/cmdi` | Access log recorded `;` and command execution parameters | Alerted |
| **10:50:30** | File Upload Exploit | Uploaded `shell.php` via `/upload` multipart form | New file created in `/var/www/html/vulnerable-app/uploads/` | Detected |
| **10:52:18** | Post-Exploitation | Interacted with web shell via `GET /uploads/shell.php?cmd=whoami` | YARA rule matched `shell.php` file signature; Syslog captured `bash_audit` logs | High Severity Alert |
| **11:15:00** | Containment & Fix | - | Isolated webshell file and applied patch pipeline on VM1 | Mitigated |
