#!/bin/bash

echo "copying erlang cookie from container to host"
./copy-erlang-cookie.sh

echo "running container"
docker run -itd --dns 172.17.42.1 \
    -e "RABBITMQ_USER=rabbit" \
    -e "RABBITMQ_PASS=rabbit" \
    -e "RABBITMQ_VHOST=/sensu" \
    -p 4369:4369 \
    -p 5672:5672 \
    -p 15672:15672 \
    -p 55950:55950 \
    registry.banno-internal.com/rabbitmq
