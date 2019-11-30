# GNU gtypist

## Exiting docker images

* girishpasupathy/gtypist
* kalibek/gtypist

```bash
docker pull girishpasupathy/gtypist:latest

# or

docker pull kalibek/gtypist
```

## Build your own docker image with gtypist

You can build your own docker image from the below snippet.

```Dockerfile
FROM debian:stretch-slim

LABEL author='Girish Pasupathy'
LABEL description='GTypist in alpine linux'

SHELL ["/bin/bash", "-c"]

ARG BUILD_DEPS='gtypist'

RUN apt-get update && \
  apt-get  install -y ${BUILD_DEPS}

CMD ["gtypist"]
```

## Reference

* [GNU Gtypist](https://www.gnu.org/software/gtypist/doc/gtypist.html)
* [Medium GNU gtypist](https://medium.com/datadriveninvestor/gtypist-gnu-typist-2d25d08756a3)
