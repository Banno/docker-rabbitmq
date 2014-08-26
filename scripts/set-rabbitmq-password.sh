#!/bin/bash

# Copied from tutumcloud/tutum-docker-rabbitmq

if [ -f /.rabbitmq_password_set ]; then
	echo "RabbitMQ password already set!"
	exit 0
fi

PASS=${RABBITMQ_PASS:-}
USER=${RABBITMQ_USER:-}

cat > /etc/rabbitmq/rabbitmq.config <<EOF
[
	{rabbit, [{default_user, <<"$USER">>},{default_pass, <<"$PASS">>},{tcp_listeners, [{"0.0.0.0", 5672}]}]},
        {kernel, [{inet_dist_listen_min, 55950},{inet_dist_listen_min, 55950}]}
].
EOF

echo "=> Done!"
touch /.rabbitmq_password_set

echo "========================================================================"
echo "You can now connect to this RabbitMQ server using, for example:"
echo ""
echo "    rabbitmqadmin -u $USER -p $PASS -H <host> -P <port> list vhosts"
echo ""
echo "Please remember to change the above password as soon as possible!"
echo "========================================================================"
