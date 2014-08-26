FROM ubuntu:14.04

# Install supervisord
RUN apt-get update && apt-get install -y supervisor

# supervisor
RUN mkdir -p /var/log/supervisor
ADD supervisord.conf /etc/supervisor/supervisord.conf

# Install
RUN apt-get update && apt-get install -y rabbitmq-server
RUN rabbitmq-plugins enable rabbitmq_management

# Add scripts
RUN mkdir -p /opt/rabbitmq
ADD scripts/start-rabbitmq-server.sh /opt/rabbitmq/start-rabbitmq-server.sh
ADD scripts/set-rabbitmq-password.sh /opt/rabbitmq/set-rabbitmq-password.sh
ADD scripts/setup-rabbitmq-user.sh /opt/rabbitmq/setup-rabbitmq-user.sh
RUN chmod +x /opt/rabbitmq/*.sh

## Add .erlang.cookie
RUN rm -rf /.erlang.cookie
ADD .erlang.cookie /.erlang.cookie
RUN chown rabbitmq /.erlang.cookie
RUN chmod 400 /.erlang.cookie

# Add supervisord config for starting rabbitmq
ADD supervisor-start-rabbitmq.conf /etc/supervisor/conf.d/supervisor-start-rabbitmq.conf

# rabbitmq ports
EXPOSE 4369 5672 15672

# erlang communication ports ports
EXPOSE 55950 55951 55952 55953 55954

CMD ["supervisord"]
