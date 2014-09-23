#!/bin/bash

# Adapted from tutumcloud/tutum-docker-rabbitmq

if [ -f /.rabbitmq_password_set ]; then
	echo "RabbitMQ password already set!"
	exit 0
fi

RABBITMQ_PORT=${RABBITMQ_PORT:-5672}

INET_DIST_LISTEN_MIN=${INET_DIST_LISTEN_MIN:-55950}
INET_DIST_LISTEN_MAX=${INET_DIST_LISTEN_MAX:-55954}

# For reference: https://www.rabbitmq.com/configure.html
cat > /etc/rabbitmq/rabbitmq.config <<EOF
[
	{rabbit, [{default_user, <<"$RABBITMQ_USER">>},
                  {default_pass, <<"$RABBITMQ_PASS">>},
                  {default_permissions, [<<".*">>, <<".*">>, <<".*">>]},
                  {tcp_listeners, [${RABBITMQ_PORT}]},
                  {reverse_dns_lookups, true},
                  {cluster_partition_handling, pause_minority},
                  {log_levels, [
                    {connection, info},
                    {mirroring, info},
                    {federation, info}
                  ]},
                  {loopback_users, []}
        ]},
        {kernel, [{inet_dist_listen_min, $INET_DIST_LISTEN_MIN},
                  {inet_dist_listen_max, $INET_DIST_LISTEN_MAX}
        ]}
].
EOF

touch /.rabbitmq_password_set

exit 0
