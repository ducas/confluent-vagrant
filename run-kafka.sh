#!/bin/bash

# USAGE: run-kafka.sh [ipaddress] [brokerid]

#advertised.host.name=$1
#broker.id=$2
#zookeeper.connect=...

sed -i '/^advertised\.host\.name=/d' /etc/kafka/server.properties
echo "advertised.host.name=$1" >> /etc/kafka/server.properties

sed -i '/^broker\.id=/d' /etc/kafka/server.properties
echo "broker.id=$2" >> /etc/kafka/server.properties

sed -i '/^zookeeper\.connect=/d' /etc/kafka/server.properties
echo "zookeeper.connect=192.168.32.11:2181,192.168.32.12:2181,192.168.32.13:2181" >> /etc/kafka/server.properties

kafka-server-start -daemon /etc/kafka/server.properties