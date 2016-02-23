#!/bin/bash

# USAGE: run-kafka.sh [ipaddress] [brokerid]

sed -i '/^advertised\.host\.name=/d' /etc/kafka/server.properties
echo "advertised.host.name=$1" >> /etc/kafka/server.properties

sed -i '/^broker\.id=/d' /etc/kafka/server.properties
echo "broker.id=$2" >> /etc/kafka/server.properties

sed -i '/^zookeeper\.connect=/d' /etc/kafka/server.properties
echo "zookeeper.connect=192.168.32.10:2181" >> /etc/kafka/server.properties

kafka-server-start -daemon /etc/kafka/server.properties