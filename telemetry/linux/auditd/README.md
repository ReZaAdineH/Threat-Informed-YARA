# MinimalCyber Linux Auditd Enterprise Baseline

This folder provides a modular Linux `auditd` telemetry baseline for enterprise detection engineering and threat hunting.

## Structure

- `modules/` - modular audit rules by detection objective
- `auditd-enterprise-baseline.rules` - combined rules file ready to copy into `/etc/audit/rules.d/`
- `README.md` - usage and tuning notes

## Coverage

The baseline covers:

- Identity and account manipulation
- Privilege escalation and sudo/su usage
- Process execution visibility
- Persistence through cron, systemd, shell profiles, SSH keys, and PAM
- Credential access against shadow, passwd, private keys, Kerberos, and cloud credentials
- Defense evasion, audit/log tampering, module loading, ptrace, and timestamp manipulation
- Discovery commands and network reconnaissance tools
- Lateral movement using SSH, SCP, rsync, netcat, socat, and tunneling utilities
- Container and cloud Linux activity, including Docker/Kubernetes files and cloud metadata access tools

## Deployment

Copy the combined file:

```bash
sudo cp telemetry/linux/auditd/auditd-enterprise-baseline.rules /etc/audit/rules.d/99-minimalcyber-enterprise.rules
sudo augenrules --load
sudo systemctl restart auditd
sudo auditctl -s
```

Or, for testing only:

```bash
sudo auditctl -R telemetry/linux/auditd/auditd-enterprise-baseline.rules
```

## Search examples

```bash
sudo ausearch -k mc_identity
sudo ausearch -k mc_privilege_escalation
sudo ausearch -k mc_credential_access
sudo ausearch -k mc_persistence
sudo ausearch -k mc_defense_evasion
sudo ausearch -k mc_lateral_movement
```

## Production note

Auditd can become noisy on busy servers. Pilot on representative systems first, tune high-volume keys, then deploy by server role.
