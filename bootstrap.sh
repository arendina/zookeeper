#!/bin/bash

dnf -y install vim java-11-openjdk.x86_64

sed -i 's/127.0.1.1 zk01.localnet zk01/192.168.56.10 zk01.localnet zk01/' /etc/hosts

cd /opt
wget https://dlcdn.apache.org/zookeeper/zookeeper-3.8.4/apache-zookeeper-3.8.4-bin.tar.gz
tar -xf apache-zookeeper-3.8.4-bin.tar.gz

cd /opt/apache-zookeeper-3.8.4-bin/conf
cp zoo_sample.cfg zoo.cfg
sed -i 's/dataDir=/tmp/zookeeper/dataDir=/var/lib/zookeeper' zoo.cfg

/opt/apache-zookeeper-3.8.4-bin/bin/zkServer.sh start
