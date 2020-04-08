#!/bin/sh
echo "Updating etcd"

KEYS_URL=http://${ETCD_HOST:-172.17.42.1}:4001/v2/keys/
#KEYS_URL=http://172.17.42.1:4001/v2/keys/
RUNNING_URL=${KEYS_URL}instances/${INSTANCE_ID}/running
#RUNNING_URL=${KEYS_URL}instances/minio1/running

# Check if everything is up and running before starting heartbeat
while true; do
    url='http://localhost:9000/minio'
    response=$(curl -sI ${url} | head -n1)
	case "$response" in
		*"HTTP/1.1 403 Forbidden"*)  break ;;
		*       ) ;;
	esac
    sleep 1
done

while true; do
	echo "Updating xxxxxxxxxxxxxxxxxxxxxxxxxx"
    curl -L ${RUNNING_URL} -XPUT -d value=true -d ttl=20
    sleep 10
done

