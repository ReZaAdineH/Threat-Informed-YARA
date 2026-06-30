#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
SRC="$ROOT_DIR/telemetry/linux/auditd/auditd-enterprise-baseline.rules"
DST="/etc/audit/rules.d/99-minimalcyber-enterprise.rules"

if [[ $EUID -ne 0 ]]; then
  echo "Run as root: sudo $0"
  exit 1
fi

if [[ ! -f "$SRC" ]]; then
  echo "Missing source file: $SRC"
  exit 1
fi

cp "$SRC" "$DST"
augenrules --load || auditctl -R "$DST"
systemctl restart auditd || true
auditctl -s
