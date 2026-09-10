# Deployment Guide — Bazaarjo Red/Blue Lab

## 1. VM1 Target Deployment

VM1 hosts the vulnerable Flask web application.

Deployment steps:

1. Install required packages:

- Apache2
- Python 3
- Flask
- mod_wsgi
- rsyslog

2. Deploy the application files:

Location:

/var/www/html/vulnerable-app/

3. Configure Apache:

Configuration file:

vm1-target/config/apache_vhost.conf

4. Enable the Apache virtual host and restart Apache.


## 2. VM2 SIEM Deployment

VM2 receives logs from VM1.

Required configuration:

- Enable Splunk Enterprise.
- Configure UDP port 514 for Syslog ingestion.
- Import detection queries from:

detection-queries/splunk_queries.spl


## 3. VM1 Log Forwarding

VM1 forwards:

- Apache access logs
- Bash audit logs

Configuration file:

vm1-target/config/rsyslog_forward.conf


## 4. Verification

Confirm:

- Web application loads successfully.
- VM2 receives VM1 logs.
- Splunk indexes incoming events.
- Detection queries return expected events.
