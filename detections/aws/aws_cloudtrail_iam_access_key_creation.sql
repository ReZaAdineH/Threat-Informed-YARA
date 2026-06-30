-- Title: AWS IAM Access Key Creation
-- ID: AWS-IAM-0001
-- Severity: High
-- Source: CloudTrail Lake / Athena-style query
-- ATT&CK: T1098 - Account Manipulation

SELECT eventTime, userIdentity.arn AS actor, sourceIPAddress, userAgent, awsRegion,
       requestParameters.userName AS target_user, eventName
FROM cloudtrail_logs
WHERE eventName = 'CreateAccessKey'
  AND errorCode IS NULL;
