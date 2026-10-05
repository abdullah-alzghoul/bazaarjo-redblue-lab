# Bazaarjo Red/Blue Lab

A four-phase attack-defense lifecycle simulation built for Cybersecurity Graduation Field Training.
This repository contains the complete infrastructure-as-code, detection logic, and documentation for a controlled penetration testing environment.

## Lab Safety

This lab is intentionally vulnerable. Run it only in an isolated lab environment on systems you own or are explicitly authorized to test. Do not expose the target VM to the public internet.

## My Contribution

My contribution was **S1 - Architecture & Visibility**: lab setup, log forwarding, SIEM deployment, and the Git baseline.

This was a team project. The table below describes the division of responsibilities.

## Team Roles

| Role | Responsibility |
|---|---|
| **S1 - Architecture & Visibility (my role)** | Lab build, log forwarding, SIEM deployment, Git baseline |
| **S2 - Red Team** | Black-box penetration testing, exploit chain, RCE proof |
| **S3 - Blue Team / IR** | SIEM timeline reconstruction, containment, detection queries |
| **S4 - Mitigation & QA** | Git-based code fixes, re-exploitation validation |

## Network Topology & Architecture

| Node | IP Address | Role | Key Services |
|---|---|---|---|
| **VM1-Target** | `192.168.56.101` | Vulnerable web host | Apache2 (TCP/80), SSH (TCP/22), rsyslog (UDP/514) |
| **VM2-SIEM** | `192.168.56.102` | Log collector & indexer | Splunk Enterprise (TCP/8000), Syslog (UDP/514) |
| **VM3-Attacker** | `192.168.56.103` | Offensive workstation | nmap, sqlmap, gobuster, netcat, curl |

**Traffic Channels:**
- **Exploit:** VM3 → VM1 via HTTP/TCP 80
- **Telemetry:** VM1 → VM2 via Syslog/UDP 514
- **Remediation:** Analyst → VM1 via SSH/TCP 22

## Vulnerabilities Implemented

1. **Unrestricted File Upload** — No extension/MIME validation; world-writable upload directory
2. **Reflected Cross-Site Scripting (XSS)** — Unescaped parameter reflection via `render_template_string()`
3. **OS Command Injection** — User input passed directly to `os.popen()`
4. **SQL Injection (Union-based)** — Raw f-string concatenation into SQLite queries

## Prerequisites

- **Host RAM:** 6 GB minimum (8 GB recommended)
- **Host Disk:** 100 GB free
- **VMware Workstation Pro** or VirtualBox
- **Kali Linux** (all 3 VMs)
- **Splunk Enterprise** (VM2)
- **Git**

## Quick Start

### 1. Clone Repository

```bash
git clone https://github.com/abdullah-alzghoul/bazaarjo-redblue-lab.git
cd bazaarjo-redblue-lab
```

### 2. Setup VM1 Target

```bash
cd vm1-target/scripts
chmod +x setup_vm1.sh
./setup_vm1.sh
```

### 3. Setup VM2 SIEM

```bash
cd ../../vm2-siem/scripts
chmod +x setup_vm2.sh
./setup_vm2.sh
```

### 4. Start Red Team Testing

```bash
cd ../../vm3-attacker/scripts
chmod +x reconnaissance.sh
./reconnaissance.sh
```
