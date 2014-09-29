# rabbitmq dockerfile

Brings up a rabbitmq queue for use by other containers. inspired from [tutumcloud/tutum-docker-rabbitmq](https://github.com/tutumcloud/tutum-docker-rabbitmq)

## Things to know

- rabbitmq env variables for user/pass should be specified at run time.
  - something like `rabbit`/`rabbit` would be good.
- setting the hostname via docker is a really good idea, otherwise it'll be the short container id.
- the `.erlang.cookie` is specified at build time.
  - this helps to ensure that we can keep it the same across machines.

## Environmental Variables

__rabbitmq__

- RABBITMQ_USER
- RABBITMQ_PASS
- RABBITMQ_NODENAME (defaults to eth0 ip)
- RABBITMQ_VHOST (ex. "/sensu")

__erlang specific__

- ERLANG_COOKIE
- INET_DIST_LISTEN_MIN (defaults to 55950)
- INET_DIST_LISTEN_MAX (defaults to 55954)

> Note: changing these variables will mean that you have to also update the ports exposed by the container

## Ports exposed

- 4369:4369 (erlang port mapper)
- 5672:5672 (rabbitmq protocol)
- 15672:15672 (rabbitmq admin dashboard)
- 55950:55950 to 55954:55954 (erlang inet listen ports)

## Steps

__build__

```
docker build -t registry.banno-internal.com/rabbitmq .
```

__run__

Run via [big](https://github.com/Banno/big)

__pull__

```
docker pull registry.banno-internal.com/rabbitmq
```

__push__

```
docker push registry.banno-internal.com/rabbitmq
```
