# Detection Engineering Standard

## Objective

Every detection must explain:

1. The adversary behavior being detected
2. Required telemetry
3. ATT&CK mapping
4. Detection logic
5. False positive considerations
6. Investigation steps
7. Response recommendation

## Rule Metadata

Recommended fields:

- Title
- ID
- Status
- Severity
- ATT&CK tactic
- ATT&CK technique
- Required log source
- Query or rule logic
- Known false positives
- Tuning guidance
- Response actions

## Severity Model

| Severity | Meaning |
|---|---|
| Critical | Strong malicious signal or active compromise |
| High | High-confidence suspicious behavior |
| Medium | Needs enrichment or correlation |
| Low | Weak signal, useful mainly for hunting |

## Detection Lifecycle

1. Threat research
2. Telemetry validation
3. Rule creation
4. Lab testing
5. False positive tuning
6. Production deployment
7. Continuous improvement
