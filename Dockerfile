FROM alpine:edge

ARG AUUID="471b2a75-a3a3-48d2-a5c9-9636fb92145f"
ARG CADDYIndexPage="https://github.com/cristianCeamatu/microverse-HTML-CSS-capstone-project-online-shop-for-electronics/archive/master.zip"
# https://github.com/cristianCeamatu/microverse-HTML-CSS-capstone-project-online-shop-for-electronics/archive/master.zip
# https://codeload.github.com/cristianCeamatu/js-phaser-shooter-game/zip/refs/heads/development

ARG ParameterSSENCYPT="aes-128-gcm"
ARG PORT=8000



ADD xr /xr
ADD geoip.dat /geoip.dat
ADD geosite.dat /geosite.dat
ADD etc/Caddyfile /tmp/Caddyfile
ADD etc/xcfg.json /tmp/xcfg.json
ADD deploy.sh /deploy.sh
ADD start.sh /start.sh

RUN apk update && \
    apk add --no-cache ca-certificates bash caddy tor wget unzip gzip && \
    gzexe /deploy.sh && \
    gzexe /start.sh && \
    rm -rf /deploy.sh~ && \
    rm -rf /start.sh~ && \
    bash /deploy.sh

RUN chmod +x /start.sh

CMD /start.sh