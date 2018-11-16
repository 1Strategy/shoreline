curl -X POST -H 'Content-Type: application/json' \
    http://shoreline.c45ikshrooy3.us-west-2.neptune.amazonaws.com:8182/loader -d '
    { 
      "source" : "s3://1s-shoreline/", 
      "format" : "csv",  
      "iamRoleArn" : "arn:aws:iam::281782457076:role/shoreline", 
      "region" : "us-west-2", 
      "failOnError" : "FALSE"
    }'

# curl -G 'http://your-neptune-endpoint:8182/loader/ef478d76-d9da-4d94-8ff1-08d9d4863aa5'