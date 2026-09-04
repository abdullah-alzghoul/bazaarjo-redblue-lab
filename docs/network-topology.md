# Network Topology & IP Allocation

| Hostname | Role | OS | IP Address | Subnet Mask | Services / Ports |
|---|---|---|---|---|---|
| **VM1** | Target Web Server | Debian 11 | `192.168.56.101` | `255.255.255.0` | HTTP (80), Syslog Forwarder (514) |
| **VM2** | SIEM / Splunk | Ubuntu | `192.168.56.102` | `255.255.255.0` | Splunk Web (8000), Syslog Receiver (514/UDP) |
| **VM3** | Attacker | Kali Linux | `192.168.56.103` | `255.255.255.0` | Nmap, Curl, Sqlmap |
