#!/bin/bash

# USAGE: run-kafka.sh [ipaddress] [brokerid]

#host.name=$1
#id=$2
#schema.registry.url=http://localhost:8081
#zookeeper.connect=...

sed -i '/^host\.name=/d' /etc/kafka-rest/kafka-rest.properties
echo "host.name=$1" >> /etc/kafka-rest/kafka-rest.properties

sed -i '/^id=/d' /etc/kafka-rest/kafka-rest.properties
echo "id=$2" >> /etc/kafka-rest/kafka-rest.properties

sed -i '/^schema\.registry\.url=/d' /etc/kafka-rest/kafka-rest.properties
echo "schema.registry.url=http://localhost:8081" >> /etc/kafka-rest/kafka-rest.properties

sed -i '/^zookeeper\.connect=/d' /etc/kafka-rest/kafka-rest.properties
echo "zookeeper.connect=192.168.32.11:2181,192.168.32.12:2181,192.168.32.13:2181" >> /etc/kafka-rest/kafka-rest.properties

kafka-rest-start -daemon /etc/kafka-rest/kafka-rest.properties