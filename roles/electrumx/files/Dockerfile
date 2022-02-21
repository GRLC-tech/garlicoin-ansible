
FROM python:3.9-alpine
LABEL maintainer "Ryan Shaw <ryan@rshaw.me>"

WORKDIR /electrumx

COPY ./bin /usr/local/bin
COPY ./electrumx/setup.py /electrumx/
COPY ./electrumx/electrumx_* /electrumx/

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
ENV SSL_PORT=50002
ENV SSL_CERTFILE ${DB_DIRECTORY}/fullchain.pem
ENV SSL_KEYFILE ${DB_DIRECTORY}/privkey.pem
ENV HOST ""
ENV COIN garlicoin
ENV DAEMON_URL "http://{{ rpc_username }}:{{ rpc_password }}@garlicoin:42068"
ENV RPC_HOST "127.0.0.1"
ENV RPC_PORT "8000"
WORKDIR /data

EXPOSE 50002

CMD ["init"]
