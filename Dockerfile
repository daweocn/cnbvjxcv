FROM alpine:edge

ARG AUUID="38af4abc-c00c-4036-a9da-1334c9c86d19"
ARG CADDYIndexPage="https://www.free-css.com/assets/files/free-css-templates/download/page255/girly.zip"
ARG ParameterSSENCYPT="chacha20-ietf-poly1305"
ARG PORT=8000

ADD etc/Caddyfile /tmp/Caddyfile
ADD etc/xray.json /tmp/xray.json
ADD deploy.sh /deploy.sh
ADD start.sh /start.sh

RUN apk update && \
    apk add --no-cache ca-certificates bash caddy tor unzip wget && \
    bash deploy.sh

RUN chmod +x /start.sh

CMD /start.sh
