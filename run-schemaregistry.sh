#!/bin/bash

# USAGE: run-schemaregistry.sh [ipaddress]

#port=8081
#host.name=$1
#kafkastore.connection.url=localhost:2181

sed -i '/^port=/d' /etc/schema-registry/schema-registry.properties
echo "port=8081" >> /etc/schema-registry/schema-registry.properties

sed -i '/^host\.name=/d' /etc/schema-registry/schema-registry.properties
echo "host.name=$1" >> /etc/schema-registry/schema-registry.properties

sed -i '/^kafkastore\.connection\.url=/d' /etc/schema-registry/schema-registry.properties
echo "kafkastore.connection.url=192.168.32.11:2181,192.168.32.12:2181,192.168.32.13:2181" >> /etc/schema-registry/schema-registry.properties

schema-registry-start -daemon /etc/schema-registry/schema-registry.properties