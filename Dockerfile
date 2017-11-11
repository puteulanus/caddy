FROM alpine

RUN apk add --no-cache openssl
RUN wget -O caddy.tar.gz 'https://caddyserver.com/download/linux/amd64' \
    && tar zxf caddy.tar.gz \
    && mv caddy /usr/bin/caddy \
    && rm -f caddy.tar.gz \
    && mkdir -p /etc/caddy \
    && touch /etc/caddy/Caddyfile

VOLUME /etc/caddy/
EXPOSE 80 443
ENV CONFIG_PATH /etc/caddy/Caddyfile
CMD caddy -c "$CONFIG_PATH"
