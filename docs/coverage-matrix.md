# Threat Coverage Matrix

| Threat Area | ATT&CK | Telemetry | Splunk | Sentinel | YARA | AWS |
|---|---|---|---|---|---|---|
| PowerShell abuse | T1059.001 | Sysmon, Security 4688 | Yes | Yes | Partial | No |
| LSASS credential access | T1003.001 | Sysmon 10, Security 4688 | Yes | Yes | Partial | No |
| Scheduled task persistence | T1053.005 | Sysmon, Security 4698 | Yes | Planned | No | No |
| LOLBin abuse | T1218 | Sysmon 1, 7, 11 | Yes | Planned | No | No |
| Linux privilege escalation | T1068/T1548 | auditd, auth.log | Planned | No | No | No |
| AWS IAM abuse | T1098 / Cloud | CloudTrail | Planned | Yes | No | Yes |
| S3 exposure | Cloud | CloudTrail, Config | Planned | Yes | No | Yes |
| Malware artifact matching | Multiple | File scanning | No | No | Yes | No |
