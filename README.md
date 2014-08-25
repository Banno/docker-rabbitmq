# rabbitmq dockerfile

Brings up a rabbitmq queue for use by other containers.

## External Dependencies

* https://registry.hub.docker.com/u/tutum/rabbitmq/dockerfile/

## Things to know

- rabbitmq admin password is a randomly generated 12 character password

## Environmental Variables

- RABBITMQ_HOST
- RABBITMQ_PORT
- RABBITMQ_USER
- RABBITMQ_PASSWORD

## Ports exposed

- 5672:5672 (rabbitmq protocol)
- 15672:15672 (rabbitmq admin dashboard)

## Steps

__build__

```
docker build -t registry.banno-internal.com/rabbitmq .
```

__run__

```
docker run -itd --dns 172.17.42.1 -e "RABBITMQ_USER=sensu" -e "RABBITMQ_PASSWORD=password" -p 5672:5672 -p 15672:15672 registry.banno-internal.com/rabbitmq
```

__pull__

```
docker pull registry.banno-internal.com/rabbitmq
```

__push__

```
docker push registry.banno-internal.com/rabbitmq
```
