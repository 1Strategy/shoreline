-- There are NO Property columns created with this query

select distinct md5(to_utf8(split(useridentity.principalId,':')[2])) as "~id"
     , split(useridentity.principalId,':')[2] as "~label"
  from aws_logs.cloudtrail_partitioned
 where region = 'us-west-2'
   and year = '2018'
   and useridentity.sessioncontext.sessionIssuer.userName = '1S-Admins'
   and not regexp_like(useridentity.principalId, 'botocore')

union

select distinct md5(to_utf8(split(eventSource,'.')[1])) as "~id"
     , split(eventSource,'.')[1] as "~label"
  from aws_logs.cloudtrail_partitioned
 where region = 'us-west-2'
   and year = '2018'
   and useridentity.sessioncontext.sessionIssuer.userName = '1S-Admins'
   and not regexp_like(useridentity.principalId, 'botocore')
;