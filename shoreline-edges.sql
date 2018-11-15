-- There are NO Property columns created with this query

select distinct md5(to_utf8(split(useridentity.principalId,':')[2] || eventSource)) as "~id"
     , md5(to_utf8(split(useridentity.principalId,':')[2])) as "~from"
     , md5(to_utf8(eventSource)) as "~to"
     , eventName as "~label"
  from aws_logs.cloudtrail_partitioned
 where region = 'us-west-2'
   and year = '2018'
   and resources is not null
   and useridentity.sessioncontext.sessionIssuer.userName = '1S-Admins'
   and not regexp_like(useridentity.principalId, 'botocore')
;