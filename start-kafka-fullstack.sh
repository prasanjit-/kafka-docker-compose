#!/bin/bash
internal_ip=`curl http://169.254.169.254/latest/meta-data/local-ipv4`
external_ip=`curl -s icanhazip.com`
export DOCKER_HOST_IP=$external_ip
echo "Server IP is $DOCKER_HOST_IP"
docker-compose -f full-stack.yml up -d

## Full stack Kafka (External IP's)

echo "- Single Zookeeper: $DOCKER_HOST_IP:2181"
echo "- Single Kafka: $DOCKER_HOST_IP:9092"
echo "- Kafka Schema Registry: $DOCKER_HOST_IP:8081"
echo "- Kafka Schema Registry UI: $DOCKER_HOST_IP:8001"
echo "- Kafka Rest Proxy: $DOCKER_HOST_IP:8082"
echo "- Kafka Topics UI: $DOCKER_HOST_IP:8000"
echo "- Kafka Connect: $DOCKER_HOST_IP:8083"
echo "- Kafka Connect UI: $DOCKER_HOST_IP:8003"
echo "- KSQL Server: $DOCKER_HOST_IP:8088"
echo "- Zoonavigator Web: $DOCKER_HOST_IP:8004"

exit 0
