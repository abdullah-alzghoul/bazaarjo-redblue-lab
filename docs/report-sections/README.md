# PTES Penetration Testing & Defense Report Structure

This directory holds the individual report modules aligned with the Penetration Testing Execution Standard (PTES) framework.

## Report Index & Deliverables

1. **Pre-Engagement & Scope** (`01-scope.md`): Environment boundaries, IP allocation (`192.168.56.0/24`), and rules of engagement.
2. **Intelligence Gathering** (`02-recon.md`): Port scans, service enumeration, and web banner grabbing outputs.
3. **Vulnerability Analysis** (`03-vulnerability-assessment.md`): Source code review findings and CVSS v3.1 scoring matrix for the 4 web vulnerabilities.
4. **Exploitation & PoC** (`04-exploitation.md`): Step-by-step exploit chain leading to Remote Code Execution (RCE).
5. **SIEM & Incident Detection** (`05-detection-logs.md`): Log correlation rules, Splunk dashboards, and YARA rule validation.
6. **Remediation & Patching** (`06-remediation.md`): Code diffs, secure coding fixes, and re-exploitation verification results.
