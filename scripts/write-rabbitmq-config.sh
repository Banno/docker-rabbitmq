#!/bin/bash

INET_DIST_LISTEN_MIN=${INET_DIST_LISTEN_MIN:-55950}
INET_DIST_LISTEN_MAX=${INET_DIST_LISTEN_MAX:-55954}

# For reference: https://www.rabbitmq.com/configure.html
cat > /etc/rabbitmq/rabbitmq.config <<EOF
[
	{rabbit, [{default_user, <<"$RABBITMQ_USER">>},
                  {default_pass, <<"$RABBITMQ_PASS">>},
                  {default_permissions, [<<".*">>, <<".*">>, <<".*">>]},
                  {tcp_listeners, [5672]},
                  {reverse_dns_lookups, true},
                  {loopback_users, []}
        ]},
        {kernel, [{inet_dist_listen_min, $INET_DIST_LISTEN_MIN},
                  {inet_dist_listen_max, $INET_DIST_LISTEN_MAX}
        ]}
].
EOF

exit 0
