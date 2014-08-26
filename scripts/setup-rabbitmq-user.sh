#!/bin/bash

# Setup rabbitmq
rabbitmqctl add_vhost $RABBITMQ_VHOST
rabbitmqctl add_user $RABBITMQ_USER $RABBITMQ_PASSWORD
rabbitmqctl set_permissions -p $RABBITMQ_VHOST $RABBITMQ_USER ".*" ".*" ".*"
rabbitmqctl set_user_tags $RABBITMQ_USER administrator

exit 0
