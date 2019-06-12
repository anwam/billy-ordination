FROM alpine:latest

RUN apk add --no-cache openssh-client tar curl
RUN curl --silent -o - "https://caddyserver.com/download/linux/amd64?license=personal" | tar --no-same-owner -C /usr/bin/ -xz caddy
RUN chmod 0755 /usr/bin/caddy

EXPOSE 80 443

WORKDIR /srv

COPY . /srv/

ENTRYPOINT /usr/bin/caddy