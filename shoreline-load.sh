curl -X POST -H 'Content-Type: application/json' \
    http://shoreline.c45ikshrooy3.us-west-2.neptune.amazonaws.com:8182/loader -d '
    { 
      "source" : "s3://1s-shoreline/", 
      "format" : "csv",  
      "iamRoleArn" : "arn:aws:iam::281782457076:role/shoreline", 
      "region" : "us-west-2", 
      "failOnError" : "FALSE"
    }'

# curl -G 'http://shoreline.c45ikshrooy3.us-west-2.neptune.amazonaws.com:8182/loader/5632bb8c-f121-4c46-8fca-4eff09a4e67a'

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

# // How many of each type of vertex are there?
# g.V().groupCount().by(label)
# // How many of each type of edge are there?
# g.E().groupCount().by(label)
# // Show all users
# g.V().hasLabel('user')



# Users connected to a specific service
# g.V().has('~id', 'ssm').inE().outV().dedupe()
# g.V().has('~id', 'ssm').inE('AwsApiCall').has('Action', 'DescribeKeyPairs')

# Show all users who've used the DescribeKeyPairs api call
# g.E().has('Action', 'DescribeKeyPairs').outV()

# Show all users who've used the DescribeKeyPairs api call AND the DescribeNatGateways api call
# g.E().has('Action', 'DescribeKeyPairs').outV().outE().has('Action', 'DescribeNatGateways')

# Show all users with api call weights greater than or equal to 1
# g.V().outE().filter(values('Weight').is(gte(1.0)))

# g.V().where(out().values('Action').is('DescribeKeyPairs'))

# Show all services touched by Justin Iravani
# g.V().has('~id', 'justiniravani').out().dedupe()

# :exit