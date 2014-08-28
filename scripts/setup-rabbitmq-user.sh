#!/bin/bash

## todo: move out into sensu-server image

echo "vhost: $RABBITMQ_VHOST \n\n" >> /var/log/rabbitmq/env-variables.out
echo "user $RABBITMQ_USER\n\n" >> /var/log/rabbitmq/env-variables.out
echo "pass: $RABBITMQ_PASS \n\n" >> /var/log/rabbitmq/env-variables.out

echo "rabbitmqctl add_user $RABBITMQ_USER $RABBITMQ_PASS" > /var/log/rabbitmq/add-user-command.out

# Setup rabbitmq
rabbitmqctl add_vhost $RABBITMQ_VHOST > /var/log/rabbitmq/add-vhost.out
rabbitmqctl add_user $RABBITMQ_USER $RABBITMQ_PASS > /var/log/rabbitmq/add-user.out
rabbitmqctl set_permissions -p $RABBITMQ_VHOST $RABBITMQ_USER ".*" ".*" ".*" > /var/log/rabbitmq/set-permissions.out
rabbitmqctl set_user_tags $RABBITMQ_USER administrator > /var/log/rabbitmq/set-user-tags.out

exit 0
