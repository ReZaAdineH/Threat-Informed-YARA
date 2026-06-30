#!/usr/bin/env python3
"""Build a lightweight markdown index of detection files and ATT&CK metadata."""
from pathlib import Path
import re

ROOT = Path(__file__).resolve().parents[2]
OUT = ROOT / "docs" / "rule-index.md"
PATTERN = re.compile(r"ATT&CK[:=]\s*([^\n]+)", re.IGNORECASE)

rows = ["# Rule Index", "", "| File | ATT&CK |", "|---|---|"]
for path in sorted((ROOT / "detections").rglob("*")):
    if path.is_file():
        text = path.read_text(errors="ignore")
        match = PATTERN.search(text)
        attack = match.group(1).strip() if match else "Not specified"
        rows.append(f"| `{path.relative_to(ROOT)}` | {attack} |")

OUT.write_text("\n".join(rows) + "\n")
print(f"Wrote {OUT}")
