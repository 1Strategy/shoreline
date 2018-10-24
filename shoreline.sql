select md5(to_utf8(a.eventTime)) as "~id"
     -- , a.eventTime as "readable_id"
     -- , split(a.useridentity.principalId,':')[2] as "readable_from"
     , md5(to_utf8(split(a.useridentity.principalId,':')[2])) as "~from"
     -- , a.eventSource as "readable_to"
     , md5(to_utf8(a.eventSource)) as "~to"
     , a.eventName as "~label"
     , 1 as "weight:Double"
    from (
         select *
           from aws_logs.cloudtrail
        ) a
left join (
               select eventId
                    , r.ARN as resource_arn
                    , r.accountId as resource_acct
                    , r.type as resource_type
                 from aws_logs.cloudtrail
           cross join unnest(resources) as t (r)
        ) b
       on a.eventId = b.eventId
    where awsregion = 'us-west-2'
      and a.useridentity.sessioncontext.sessionIssuer.userName = '1S-Admins'
      and date_parse(a.eventTime, '%Y-%m-%dT%TZ') between date '2018-01-01' and date '2018-01-31'
;