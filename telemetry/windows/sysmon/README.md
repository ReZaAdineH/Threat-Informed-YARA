# MinimalCyber Enterprise Sysmon Baseline

This folder contains an enterprise-oriented Sysmon baseline for Windows endpoint telemetry.

## Files

- `sysmon-enterprise-baseline.xml` - full Sysmon XML configuration based on the uploaded sysmon-modular generated config.

## Purpose

The baseline is designed to support detection engineering, threat hunting, incident response, and ATT&CK-oriented visibility across common enterprise threats, including:

- Process execution and LOLBins
- PowerShell and script abuse
- Credential access and LSASS access
- Process injection and remote thread creation
- Network connections from suspicious processes
- File creation in user-writable and persistence paths
- Registry persistence
- WMI persistence
- Named pipes
- DNS visibility
- Driver and image load telemetry

## Production note

This is a strong baseline, not a universal final answer. Tune allowlists and exclusions before large production rollout. Test first on a small pilot group, review event volume, then expand.

## Suggested validation

```powershell
Sysmon64.exe -c telemetry\windows\sysmon\sysmon-enterprise-baseline.xml
```

To install Sysmon with this config:

```powershell
Sysmon64.exe -accepteula -i telemetry\windows\sysmon\sysmon-enterprise-baseline.xml
```
