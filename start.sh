#!/bin/sh
# start
tor &
/xr -config /xcfg.json &
caddy run --config /etc/caddy/Caddyfile --adapter caddyfile
