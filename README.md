# confluent-vagrant
A multi-box setup of the Confluent platform using Vagrant

This Vagrantfile can be used to spin up a stack that includes:

* 3x Zookeeper nodes
* 3x Kafka brokers
* 2x REST Proxy + Schema Registry boxes

Each machine requires 1GB RAM.

## How...?

    vagrant up

## What...?

### Zookeeper

IP Addresses:

* 192.168.32.11
* 192.168.32.12
* 192.168.32.13

Port: 2181

### Kafka

IP Addresses:

* 192.168.32.21
* 192.168.32.22
* 192.168.32.23

Port: 9092

### REST Proxy + Schema Registry

IP Addresses:

* 192.168.32.31
* 192.168.32.32

Schema Registry Port: 8081

Rest Proxy Port: 8082
