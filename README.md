# rabbitmq dockerfile

Brings up a rabbitmq queue for use by other containers. inspired from [tutumcloud/tutum-docker-rabbitmq](https://github.com/tutumcloud/tutum-docker-rabbitmq)

## Things to know

- rabbitmq admin password is a randomly generated 12 character password

## Environmental Variables

__rabbitmq__

- RABBITMQ_USER
- RABBITMQ_PASSWORD
- RABBITMQ_VHOST

__erlang specific__

- INET_DIST_LISTEN_MIN (defaults to 55950)
- INET_DIST_LISTEN_MAX (defaults to 55954)

> Note: changing these variables will mean that you have to also update the ports exposed by the container

## Ports exposed

- 5672:5672 (rabbitmq protocol)
- 15672:15672 (rabbitmq admin dashboard)

## Steps

__build__

```
docker build -t registry.banno-internal.com/rabbitmq .
```

__run__

Run the provided `run-image.sh` script.

__pull__

```
docker pull registry.banno-internal.com/rabbitmq
```

__push__

```
docker push registry.banno-internal.com/rabbitmq
```

## Todo

- [ ] setup default user/pass of rabbit/rabbit for control panel
- [ ] update readme with all ports opened / required (and env variables around them)
- [ ] update readme with user/pass env variables and all others
- [ ] need to setup a way to set the erlang cookie onto the container (totally configed)
  - turn it into a bash script that is ran by supervisord which reads an env variable?
- [ ] setup some sort of hostname setup (dns record wise?) for getting into the rabbitmq server(s).
  - need to set a standard hostname for rabbitmq
- [ ] supervisord exists out a whole bunch, that's probably bad.
