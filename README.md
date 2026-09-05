# Bazaarjo Red/Blue Lab

A four-phase attack-defense lifecycle simulation built for Cybersecurity Graduation Field Training.
This repository contains the complete infrastructure-as-code, detection logic, and documentation for a controlled penetration testing environment.

## Team Roles

| Role | Student | Responsibility |
|---|---|---|
| **S1 — Architecture & Visibility** | **Abdallah Ali Abdallah Alzghoul** | Lab build, log forwarding, SIEM deployment, Git baseline |
| **S2 — Red Team** | **Ashraf Khaled Al-Mashaqbeh** | Black-box penetration testing, exploit chain, RCE proof |
| **S3 — Blue Team / IR** | **Osama** *(Full name pending)* | SIEM timeline reconstruction, containment, detection queries |
| **S4 — Mitigation & QA** | **Mohammad Mahmoud Ghaith** | Git-based code fixes, re-exploitation validation |

## Network Topology & Architecture

| Node | IP Address | Role | Key Services |
|---|---|---|---|
| **VM1-Target** | `192.168.56.101` | Vulnerable web host | Apache2 (TCP/80), SSH (TCP/22), rsyslog (UDP/514) |
| **VM2-SIEM** | `192.168.56.102` | Log collector & indexer | Splunk Enterprise (TCP/8000), Syslog (UDP/514) |
| **VM3-Attacker** | `192.168.56.103` | Offensive workstation | nmap, sqlmap, gobuster, netcat, curl |

**Traffic Channels:**
- 🔴 **Exploit:** VM3 → VM1 via HTTP/TCP 80
- 🟢 **Telemetry:** VM1 → VM2 via Syslog/UDP 514
- 🔵 **Remediation:** Analyst → VM1 via SSH/TCP 22

## Vulnerabilities Implemented

1. **Unrestricted File Upload** — No extension/MIME validation; world-writable upload directory
2. **Reflected Cross-Site Scripting (XSS)** — Unescaped parameter reflection via `render_template_string()`
3. **OS Command Injection** — User input passed directly to `os.popen()`
4. **SQL Injection (Union-based)** — Raw f-string concatenation into SQLite queries

## Prerequisites

- **Host RAM:** 6 GB minimum (8 GB recommended)
- **Host Disk:** 100 GB free
- **VMware Workstation Pro** 17.x+ or VirtualBox
- **Kali Linux** 2024.x (all 3 VMs)
- **Splunk Enterprise Free** 9.3.0+ (VM2)
- **Git** 2.40+

## Quick Start

### 1. Clone the Repository

```bash
git clone [https://github.com/abdullah-alzghoul/bazaarjo-redblue-lab.git](https://github.com/abdullah-alzghoul/bazaarjo-redblue-lab.git)
cd bazaarjo-redblue-lab
