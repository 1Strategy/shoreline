curl -X POST -H 'Content-Type: application/json' \
    http://shoreline.c45ikshrooy3.us-west-2.neptune.amazonaws.com:8182/loader -d '
    { 
      "source" : "s3://1s-shoreline/", 
      "format" : "csv",  
      "iamRoleArn" : "arn:aws:iam::281782457076:role/shoreline", 
      "region" : "us-west-2", 
      "failOnError" : "FALSE"
    }'