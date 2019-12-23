FROM debian:stretch-slim

LABEL author='Girish Pasupathy'
LABEL description='GTypist in alpine linux'

SHELL ["/bin/bash", "-c"]

ARG BUILD_DEPS='gtypist'

RUN apt-get update && \
  apt-get  install -y ${BUILD_DEPS}

CMD ["gtypist"]
