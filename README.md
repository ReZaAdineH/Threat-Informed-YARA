# Threat-Informed Detection Engineering

A practical, threat-informed detection repository for enterprise security operations.

This project organizes telemetry engineering, detection content, YARA rules, cloud detections, and automation scripts in one structure.

## Repository Scope

- **Telemetry creation**: Windows Sysmon and Linux auditd baseline configuration
- **Detection rules**: Splunk SPL, Microsoft Sentinel KQL, YARA, and AWS-focused detections
- **Automation**: Python, Bash, and PowerShell utilities for collection, validation, and deployment support
- **Threat coverage**: common enterprise threats mapped to MITRE ATT&CK

## Structure

```text
Threat-Informed-YARA/
├── detections/
│   ├── splunk/
│   ├── sentinel/
│   ├── yara/
│   └── aws/
├── telemetry/
│   ├── windows/sysmon/
│   └── linux/auditd/
├── automation/
│   ├── python/
│   ├── bash/
│   └── powershell/
├── docs/
├── tests/
└── .github/workflows/
```

## Detection Naming Convention

```text
<platform>_<tactic>_<technique>_<behavior>.<extension>
```

Example:

```text
splunk_credential_access_t1003_lsass_access.spl
sentinel_execution_t1059_powershell_encoded_command.kql
yara_malware_qakbot_family_basic.yar
```

## Current Coverage

| Area | Content |
|---|---|
| Windows telemetry | Sysmon baseline config |
| Linux telemetry | auditd baseline rules |
| Splunk | PowerShell abuse, LSASS access, suspicious scheduled tasks, LOLBins |
| Sentinel | PowerShell abuse, LSASS access, Azure AD suspicious sign-in, AWS CloudTrail detections |
| YARA | QakBot-style artifact, suspicious PowerShell dropper, generic credential theft artifact |
| AWS | CloudTrail detection queries for IAM abuse, GuardDuty triage, S3 exposure indicators |
| Automation | validation scripts and collectors |

## Important Notes

These rules are starting points. Tune them against your environment, log sources, field names, business context, and known-good administrative behavior.

## Author

Reza Adineh  
SOC Architect | Detection Engineering | Security Strategy
