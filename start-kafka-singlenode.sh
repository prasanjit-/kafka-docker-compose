#!/bin/bash
internal_ip=`curl http://169.254.169.254/latest/meta-data/local-ipv4`
export DOCKER_HOST_IP=$internal_ip
echo "Server IP is $DOCKER_HOST_IP"
docker-compose -f zk-single-kafka-single.yml up
echo "Zookeeper will be available at $DOCKER_HOST_IP:2181"
echo "Kafka will be available at $DOCKER_HOST_IP:9092"
exit 0
