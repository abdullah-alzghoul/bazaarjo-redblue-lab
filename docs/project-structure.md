# Project Structure

The repository is organized according to the four phases of the Red/Blue Team security lifecycle.

bazaarjo-redblue-lab/

├── vm1-target/
│ ├── app/
│ │ ├── app_vulnerable.py
│ │ └── app_patched.py
│ ├── config/
│ └── scripts/

├── vm2-siem/
│ └── config/

├── vm3-attacker/
│ ├── payloads/
│ └── scripts/

├── detection-queries/
│ ├── splunk_queries.spl
│ ├── php_webshell_detection.yar
│ └── README.md

└── docs/
├── report-sections/
│   ├── README.md
│   ├── 01-scope.md
│   ├── 02-recon.md
│   ├── 03-vulnerability-assessment.md
│   ├── 04-exploitation.md
│   ├── 05-detection-logs.md
│   └── 06-remediation.md
├── attack_defense_timeline.md
├── deployment-guide.md
├── network_topology.md
└── security-notice.md

## Folder Purpose

- `vm1-target/`  
  Contains the vulnerable and secured application versions.

- `vm2-siem/`  
  Contains SIEM configuration files.

- `vm3-attacker/`  
  Contains penetration testing scripts and payloads.

- `detection-queries/`  
  Contains Blue Team detection logic.

- `docs/`  
  Contains project documentation.
