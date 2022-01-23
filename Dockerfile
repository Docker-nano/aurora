FROM alpine:3.7
LABEL maintainer="Bilge <bilge@scriptfusion.com>"

RUN apk add --no-cache tini tzdata xdg-utils lynx curl \
    && mkdir -p /opt/aurora \
    && cd /opt/aurora \
    && curl -LO https://github.com/xuri/aurora/releases/download/2.2/aurora_linux_amd64_v2.2.tar.gz \
    && tar xf *.tar.* \
    && rm *.tar.* \
    && apk del curl

COPY aurora.toml /opt/aurora

EXPOSE 3000
ENTRYPOINT ["/sbin/tini", "--"]
CMD ["/opt/aurora/aurora"]
