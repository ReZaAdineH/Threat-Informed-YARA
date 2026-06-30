#!/usr/bin/env python3
"""Validate basic YARA rule syntax if yara-python is installed."""
from pathlib import Path
import sys

RULE_DIR = Path(__file__).resolve().parents[2] / "detections" / "yara"

def main() -> int:
    try:
        import yara  # type: ignore
    except Exception:
        print("yara-python is not installed. Install with: pip install yara-python")
        return 2

    failed = False
    for rule in sorted(RULE_DIR.glob("*.yar")):
        try:
            yara.compile(filepath=str(rule))
            print(f"[OK] {rule.name}")
        except Exception as exc:
            failed = True
            print(f"[FAIL] {rule.name}: {exc}")
    return 1 if failed else 0

if __name__ == "__main__":
    sys.exit(main())
