#!/bin/bash

[ -z $node_ip ] && echo Please 'export node_ip=<private address of the node>' && exit
[ -z $bridge_ip ] && echo Please 'export bridge_ip=<ip address of docker0 interface>' && exit
[ -z $join_ip ] && echo Warning: Please 'export join_ip=<join ip>' 


if [ -z "$join_ip" ]; then
	docker run --dns 172.17.0.1 --name consul -h $HOSTNAME  -p $node_ip:8300:8300 -p $node_ip:8301:8301 \
	-p $node_ip:8301:8301/udp -p $node_ip:8302:8302 -p $node_ip:8302:8302/udp -p $node_ip:8400:8400  \
	-p $node_ip:8500:8500 -p $bridge_ip:53:53 -p $bridge_ip:53:53/udp   \
	-d  progrium/consul:latest -server -advertise $node_ip -bootstrap-expect 2
else
	echo joining $join_ip
	docker run  --dns 172.17.0.1 --name consul -h $HOSTNAME  -p $node_ip:8300:8300 -p $node_ip:8301:8301 \
	-p $node_ip:8301:8301/udp -p $node_ip:8302:8302 -p $node_ip:8302:8302/udp -p $node_ip:8400:8400  \
	-p $node_ip:8500:8500 -p $bridge_ip:53:53 -p $bridge_ip:53:53/udp   \
	-d  progrium/consul:latest -server -advertise $node_ip -join $join_ip
fi

# Run the registrator as well, so that the ports published by containers are registered with consul.
docker run  --dns 172.17.0.1 -d --link consul:consul --name registrator -v /var/run/docker.sock:/tmp/docker.sock -h $HOSTNAME gliderlabs/registrator consul://consul:8500
