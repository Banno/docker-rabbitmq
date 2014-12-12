#!/bin/bash

RABBITMQ_NODENAME=`echo \`ifconfig eth0\` | grep -Eo '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | head -n 1`
echo "running rabbitmq with a nodename of '$RABBITMQ_NODENAME'"
# sudo hostname $RABBITMQ_NODENAME

HOSTNAME=$RABBITMQ_NODENAME /usr/sbin/rabbitmq-server
