FROM alpine:edge

ARG AUUID="d8b6af50-11dd-46ae-b598-6701778ce6b3"
ARG CADDYIndexPage="https://github.com/cristianCeamatu/microverse-HTML-CSS-capstone-project-online-shop-for-electronics/archive/master.zip"
ARG ParameterSSENCYPT="chacha20-ietf-poly1305"
ARG PORT=8080

RUN apk update && \
    apk add --no-cache ca-certificates caddy tor wget && \
    rm -rf /var/cache/apk/*

ADD xr /xr
ADD etc/Caddyfile /tmp/Caddyfile
ADD etc/xcfg.json /tmp/xcfg.json
ADD start.sh /start.sh
RUN chmod +x /start.sh
RUN chmod +x /xr

CMD /start.sh