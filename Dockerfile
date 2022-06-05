FROM alpine:latest
LABEL maintainer="knaackville"

COPY service /etc/service/

EXPOSE 8118

RUN apk update --no-cache && apk upgrade -a --no-cache && apk --update --no-cache add privoxy runit tini curl \
&& addgroup -S privdocker \
&& adduser -S privdocker -G privdocker \
&& chown privdocker:privdocker /etc/service \
&& chown -R privdocker:privdocker /etc/service/*

HEALTHCHECK --interval=120s --timeout=15s --start-period=120s --retries=2 \
            CMD curl --fail -x http://127.0.0.1:8118 -s 'https://duckduckgogg42xjoc72x3sjasowoarfbgcmvfimaftt6twagswzczad.onion' -k > /dev/null && echo "HealthCheck succeeded..." || exit 1

USER privdocker

ENTRYPOINT ["tini", "--"]
CMD ["runsvdir", "/etc/service"]
