FROM debian:buster-slim
RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
        ca-certificates \
        git \
        ; \
    apt-get autoremove; \
    rm -rf /var/lib/apt/lists/*
WORKDIR /
RUN mkdir radicle
ADD ./radicle-seed-node ./radicle/
ADD ./radicle-keyutil ./radicle/
ADD ./ui ./radicle/ui
ADD ./radicle.sh /
RUN find /radicle
ENTRYPOINT ["./radicle.sh"]
