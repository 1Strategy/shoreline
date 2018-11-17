select 'e' || cast(row_number() over() as varchar) as "~id"
     , split(useridentity.principalId,':')[2] as "~from"
     , split(eventSource,'.')[1] as "~to"
     , eventType as "~label"
     , eventName as "Action:String"
     , count(eventName)/100.0 as "Weight:Double"
  from aws_logs.cloudtrail_partitioned
 where region = 'us-west-2'
   and year = '2018'
   and useridentity.sessioncontext.sessionIssuer.userName = '1S-Admins'
   and not regexp_like(useridentity.principalId, 'botocore')
   group by useridentity.principalId
          , eventSource
          , eventType
          , eventName
;