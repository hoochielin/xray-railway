#!/bin/sh
set -e
: "${UUID:?need UUID}"
: "${WS_PATH:=/ws}"
PORT="${PORT:-8080}"
sed -i "s|\${UUID}|$UUID|g; s|\${WS_PATH}|$WS_PATH|g; s|\${PORT}|$PORT|g" /usr/local/etc/xray/config.json
exec /usr/local/bin/xray run -config /usr/local/etc/xray/config.json
