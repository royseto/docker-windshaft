# docker-windshaft

A `Dockerfile` based off of [`node:6.10-slim`](https://registry.hub.docker.com/_/node/) that installs CARTO's [Windshaft](https://github.com/CartoDB/Windshaft).

This Dockerfile was originally forked from [https://github.com/azavea/docker-windshaft](https://github.com/azavea/docker-windshaft). It has been brought up to date to work on current versions of Windshaft and Node.

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
