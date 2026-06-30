-- Title: S3 Bucket Policy or ACL Changed Toward Public Exposure
-- ID: AWS-S3-0001
-- Severity: High
-- Source: CloudTrail Lake / Athena-style query

SELECT eventTime, userIdentity.arn AS actor, sourceIPAddress, userAgent, eventName,
       requestParameters.bucketName AS bucket
FROM cloudtrail_logs
WHERE eventName IN ('PutBucketPolicy','PutBucketAcl','PutPublicAccessBlock','DeletePublicAccessBlock')
  AND errorCode IS NULL;
