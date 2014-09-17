FROM ubuntu:14.04

# Install
RUN apt-get update && apt-get install -y rabbitmq-server
RUN rabbitmq-plugins enable rabbitmq_management

# Add scripts
RUN mkdir -p /opt/rabbitmq/bin/
ADD scripts/start-rabbitmq-server.sh /opt/rabbitmq/bin/start-rabbitmq-server.sh
ADD scripts/write-rabbitmq-config.sh /opt/rabbitmq/bin/write-rabbitmq-config.sh
ADD scripts/setup-rabbitmq-user.sh /opt/rabbitmq/bin/setup-rabbitmq-user.sh
ADD start.sh /opt/rabbitmq/bin/start.sh

## Add .erlang.cookie
RUN rm -rf /.erlang.cookie /var/lib/rabbitmq/.erlang.cookie
ADD scripts/write-erlang-cookie.sh /opt/rabbitmq/bin/write-erlang-cookie.sh

## Setup custom rabbitmq scripts to be executable.
RUN chmod +x /opt/rabbitmq/bin/*.sh

# rabbitmq ports
EXPOSE 4369 5672 15672

# erlang communication ports
EXPOSE 55950 55951 55952 55953 55954

CMD ["/opt/rabbitmq/bin/start.sh"]
