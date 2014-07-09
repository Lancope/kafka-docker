kafka-docker
============

##Quickstart

The following will deploy a single broker; this will potentially deploy a zookeeper container, listening on port `2181`, if none yet exists.
This may be run multiple times to deploy multiple brokers, just change `BROKER_ID`.

```bash

## BROKER_ID - arbitrary int identifying broker.
## PORT - port HOST OS should assign to broker.
## HOST_IP - IP of HOST OS that broker will register with zookeeper.
./start-broker.sh [BROKER_ID] [PORT] [HOST_IP];

```



