# docker-murmur [![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/xnaas/murmur?style=flat)](https://hub.docker.com/repository/docker/xnaas/murmur)

Forked from [DerEnderKeks/docker-murmur](https://github.com/DerEnderKeks/docker-murmur). Docker version of [Murmur](https://github.com/mumble-voip/mumble#linuxunix), the server component of Mumble.

## Image details

* This image always downloads the latest murmur version when building.
* The final image is based on alpine and additionally only contains the murmur binary, the default config file, and a tiny start script.
* Data is stored in the `/data` volume. When no config file is present the default one will be copied there.
* The image exposes UDP and TCP port `64738`.
* Default user is `1000`.

Note: run this in [host network mode](https://docs.docker.com/network/host/) if you need functional IPv6.
