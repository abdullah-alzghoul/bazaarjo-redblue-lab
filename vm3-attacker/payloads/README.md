# Attack Payloads

## shell.php

Purpose:

Proof-of-concept malicious PHP web shell.

Related Vulnerability:

Unrestricted File Upload.

Attack Flow:

1. Attacker uploads shell.php to VM1.
2. Web server stores the file.
3. Attacker executes commands through the web shell.
4. Blue Team detects activity using:
   - Splunk queries.
   - YARA webshell detection rule.

Detection Rule:

detection-queries/php_webshell_detection.yar
