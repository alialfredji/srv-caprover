#!make
include .env.local
export $(shell sed 's/=.*//' .env.local)

run:
	docker run -p 80:80 -p 443:443 -p 3000:3000 \
	-e BY_PASS_PROXY_CHECK=${BY_PASS_PROXY_CHECK} \
	-e MAIN_NODE_IP_ADDRESS=${MAIN_NODE_IP_ADDRESS} \
	-v /var/run/docker.sock:/var/run/docker.sock \
	-v /captain:/captain caprover/caprover
	cd ./services/api && make dev

stop:
	docker swarm leave -f

