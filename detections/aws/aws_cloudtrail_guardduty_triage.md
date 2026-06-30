# GuardDuty Finding Triage Checklist

## Required context

- Finding type
- Severity
- Affected account
- Resource type
- Principal ARN
- Source IP
- First seen / last seen
- Related CloudTrail events

## First-response questions

1. Is the principal expected to perform this action?
2. Is the source IP known, corporate, VPN, CI/CD, or third party?
3. Was the event preceded by failed authentication, unusual geolocation, or new access key creation?
4. Did the principal enumerate IAM, S3, EC2, Secrets Manager, or STS?
5. Are there follow-on actions such as policy changes, public exposure, snapshot sharing, or data access?

## Recommended containment

- Disable suspected access key
- Revoke sessions if possible
- Attach deny policy temporarily
- Rotate credentials
- Preserve CloudTrail, GuardDuty, VPC Flow Logs, and IAM Access Analyzer output
