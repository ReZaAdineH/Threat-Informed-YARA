#!/usr/bin/env bash
set -euo pipefail

RULE_FILE="$(dirname "$0")/../../telemetry/linux/auditd/auditd-enterprise-baseline.rules"

if [[ $EUID -ne 0 ]]; then
  echo "Run as root: sudo $0"
  exit 1
fi

if ! command -v auditctl >/dev/null 2>&1; then
  echo "auditctl not found. Install auditd first."
  exit 1
fi

auditctl -R "$RULE_FILE"
echo "auditd baseline loaded from $RULE_FILE"
