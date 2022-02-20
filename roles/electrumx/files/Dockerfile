
FROM python:3.9-alpine
LABEL maintainer "Ryan Shaw <ryan@rshaw.me>"

WORKDIR /electrumx

COPY ./bin /usr/local/bin
COPY setup.py /electrumx/
COPY electrumx_* /electrumx/

RUN chmod a+x /usr/local/bin/* && \
    apk add --no-cache git build-base openssl && \
    apk add --no-cache --repository http://nl.alpinelinux.org/alpine/edge/testing leveldb-dev && \
    cd /electrumx && \
    python setup.py install && \
    apk del git build-base && \
    rm -rf /tmp/*

COPY . /electrumx

VOLUME ["/data"]
ENV HOME /data
ENV ALLOW_ROOT 1
ENV DB_DIRECTORY /data
ENV TCP_PORT=50001
ENV SSL_PORT=50002
ENV SSL_CERTFILE ${DB_DIRECTORY}/fullchain.pem
ENV SSL_KEYFILE ${DB_DIRECTORY}/privkey.pem
ENV HOST ""
WORKDIR /data

EXPOSE 50001 50002

CMD ["/electrumx/electrumx_server"]
