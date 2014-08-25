#!/bin/bash

RABBITMQ_USER=${RABBITMQ_USER:-}
RABBITMQ_PASSWORD=${RABBITMQ_PASSWORD:-}

echo `env` > /tmp/config-sensu.out
echo "add_user $RABBITMQ_USER $RABBITMQ_PASSWORD" > /tmp/config-sensu.out

# Setup rabbitmq
rabbitmqctl add_vhost /sensu
rabbitmqctl add_user $RABBITMQ_USER $RABBITMQ_PASSWORD
rabbitmqctl set_permissions -p /sensu $RABBITMQ_USER ".*" ".*" ".*"
rabbitmqctl set_user_tags $RABBITMQ_USER administrator

exit 0;
