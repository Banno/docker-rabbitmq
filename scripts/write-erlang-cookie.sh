#!/bin/bash

if [[ -z $ERLANG_COOKIE ]]; then
    exit 1;
if;

echo "$ERLANG_COOKIE" > /.erlang.cookie

# Setup the other default erlang cookie location.
ln -s /.erlang.cookie /var/lib/rabbitmq/.erlang.cookie
chown rabbitmq /.erlang.cookie
chmod 400 /.erlang.cookie

exit 0;
