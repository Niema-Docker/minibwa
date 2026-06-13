# Minimal Docker image for Minimap2 using Alpine base
FROM alpine:3.13.5
MAINTAINER Niema Moshiri <niemamoshiri@gmail.com>

# install Minimap2
RUN apk update && \
    apk add bash gcc make musl-dev unzip zlib-dev && \
    wget "https://github.com/lh3/minibwa/archive/refs/heads/master.zip" && \
    unzip master.zip && \
    cd minibwa-* && \
    make && \
    chmod a+x minimap2 && \
    mv minibwa /usr/local/bin/minibwa && \
    cd .. && \
    rm -rf master.zip minibwa-*
