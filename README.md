# docker-windshaft

A `Dockerfile` based off of [`node:7.9-slim`](https://registry.hub.docker.com/_/node/) that installs CartoDB's [Windshaft](https://github.com/CartoDB/Windshaft).

## Usage

First, build the container:

```bash
$ docker build -t windshaft .
```

From there, assuming you have a local Windshaft server at `server/server.js`, you can run a container with:

```bash
$ docker run --rm -v ${PWD}/server:/opt/windshaft/server/ \
    windshaft server/server.js
```
