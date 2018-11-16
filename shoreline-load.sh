curl -X POST -H 'Content-Type: application/json' \
    http://shoreline.c45ikshrooy3.us-west-2.neptune.amazonaws.com:8182/loader -d '
    { 
      "source" : "s3://1s-shoreline/edges", 
      "format" : "csv",  
      "iamRoleArn" : "arn:aws:iam::281782457076:role/shoreline", 
      "region" : "us-west-2", 
      "failOnError" : "FALSE"
    }'

# curl -G 'http://your-neptune-endpoint:8182/loader/ef478d76-d9da-4d94-8ff1-08d9d4863aa5'

# Set up Gremlin Console
# sudo yum install java-1.8.0-devel -y
# sudo /usr/sbin/alternatives --config java
# wget https://archive.apache.org/dist/tinkerpop/3.3.2/apache-tinkerpop-gremlin-console-3.3.2-bin.zip
# unzip apache-tinkerpop-gremlin-console-3.3.2-bin.zip
# cd apache-tinkerpop-gremlin-console-3.3.2
# cd conf
# touch neptune-remote.yaml
#
# hosts: [shoreline.c45ikshrooy3.us-west-2.neptune.amazonaws.com]
# port: 8182
# serializer: { className: org.apache.tinkerpop.gremlin.driver.ser.GryoMessageSerializerV3d0, config: { serializeResultToString: true }}
#
# cd ../
# bin/gremlin.sh
# :remote connect tinkerpop.server conf/neptune-remote.yaml
# :remote console
# :exit
