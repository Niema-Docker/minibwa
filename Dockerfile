# Minimal Docker image for minibwa using Alpine base
FROM alpine:latest

# install minibwa
RUN apk update && \
    apk add --no-cache bash gcc make musl-dev zlib-dev && \
    wget -qO- "https://github.com/lh3/minibwa/archive/refs/tags/v0.7.tar.gz" | tar -zx && \
    cd minibwa-* && \
    make && \
    mv minibwa /usr/local/bin/ && \
    cd .. && \
    rm -rf minibwa-*
