#!/bin/bash

# Adapted from tutumcloud/tutum-docker-rabbitmq

if [ -f /.rabbitmq_password_set ]; then
	echo "RabbitMQ password already set!"
	exit 0
fi

INET_DIST_LISTEN_MIN=${INET_DIST_LISTEN_MIN:-55950}
INET_DIST_LISTEN_MAX=${INET_DIST_LISTEN_MAX:-55954}

cat > /etc/rabbitmq/rabbitmq.config <<EOF
[
	{rabbit, [{default_user, <<"$RABBITMQ_USER">>},{default_pass, <<"$RABBITMQ_PASS">>},{tcp_listeners, [{"0.0.0.0", 5672}]}]},
        {kernel, [{inet_dist_listen_min, $INET_DIST_LISTEN_MIN}, {inet_dist_listen_max, $INET_DIST_LISTEN_MAX}]}
].
EOF

touch /.rabbitmq_password_set

exit 0
