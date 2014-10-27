#!/bin/bash

if [ ! -f /.rabbitmq_password_set ]; then
	/opt/rabbitmq/set_rabbitmq_password.sh
fi

exec `/usr/sbin/rabbitmq-server`
