FROM tutum/rabbitmq

# Install supervisord
RUN apt-get update && apt-get install -y supervisor

# supervisord
RUN mkdir -p /var/log/supervisor
ADD supervisord.conf /etc/supervisor/supervisord.conf

# Rename rabbitmq start script
# note: `/run.sh` is copied from the rabbitmq dockerfile.
ADD configure-rabbitmq.sh /tmp/configure-rabbitmq.sh
RUN chmod +x /tmp/configure-rabbitmq.sh
RUN mv /run.sh /tmp/start-rabbitmq.sh
ADD supervisor-start-rabbitmq.conf /etc/supervisor/conf.d/supervisor-start-rabbitmq.conf

# Start it up
CMD ["supervisord"]
