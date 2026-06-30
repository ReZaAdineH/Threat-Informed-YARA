#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
AUDITD_DIR="$ROOT_DIR/telemetry/linux/auditd"
OUT="$AUDITD_DIR/auditd-enterprise-baseline.rules"

{
  echo "## MinimalCyber Linux Auditd Enterprise Baseline"
  echo "## Generated from telemetry/linux/auditd/modules"
  echo "## Review and tune before production deployment."
  echo
  for file in "$AUDITD_DIR"/modules/*.rules; do
    echo
    echo "## BEGIN $(basename "$file")"
    cat "$file"
    echo
    echo "## END $(basename "$file")"
  done
} > "$OUT"

echo "Generated: $OUT"
