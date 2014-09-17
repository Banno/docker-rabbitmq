#!/bin/bash

/opt/rabbitmq/bin/setup-rabbitmq-user.sh
/opt/rabbitmq/bin/write-erlang-cookie.sh
/opt/rabbitmq/bin/write-rabbitmq-config.sh

exec /opt/rabbitmq/bin/start-rabbitmq-server.sh
