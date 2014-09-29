#!/bin/bash

set -e

echo "setting up configs and rabbitmq user"
/opt/rabbitmq/bin/setup-rabbitmq-user.sh
/opt/rabbitmq/bin/write-erlang-cookie.sh
/opt/rabbitmq/bin/write-rabbitmq-config.sh

echo "starting rabbitmq service"
/opt/rabbitmq/bin/start-rabbitmq-server.sh
