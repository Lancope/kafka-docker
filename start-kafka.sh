#!/bin/sh
## since kafka is running inside a docker container, we need to use the docker ip address as the advertised
## OR we need to change hosts to point HOST_IP (i.e., the vagrant IP) to localhost, but can't seem to edit /etc/hosts
##

CONTAINER_IP=$(/sbin/ifconfig eth0 | grep "inet addr" | awk -F: '{print $2}' | awk '{print $1}')

## Assuming zookeeper is exposed on the host_ip
sed -r -i "s/(zookeeper.connect)=(.*)/\1=$HOST_IP:2181/g" $KAFKA_HOME/config/server.properties
sed -r -i "s/(broker.id)=(.*)/\1=$BROKER_ID/g" $KAFKA_HOME/config/server.properties
sed -r -i "s/#(advertised.host.name)=(.*)/\1=$HOST_IP/g" $KAFKA_HOME/config/server.properties
sed -r -i "s/^(port)=(.*)/\1=$PORT/g" $KAFKA_HOME/config/server.properties

$KAFKA_HOME/bin/kafka-server-start.sh $KAFKA_HOME/config/server.properties
