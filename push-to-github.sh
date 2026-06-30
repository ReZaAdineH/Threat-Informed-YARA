#!/usr/bin/env bash
set -euo pipefail

REPO_URL="${1:-git@github.com:ReZaAdineH/Threat-Informed-YARA.git}"

git init
git branch -M main
git add .
git commit -m "Add threat-informed detection engineering baseline"
git remote remove origin 2>/dev/null || true
git remote add origin "$REPO_URL"
git push -u origin main
