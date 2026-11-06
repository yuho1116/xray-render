#!/bin/sh
set -e
PORT="${PORT:-3000}"
UUID="${CLIENT_ID:?CLIENT_ID is required}"
WSPATH="${WS_PATH:-/ws}"
cat > /tmp/xray.json <<JSON
{"log":{"loglevel":"warning"},"inbounds":[{"port":${PORT},"listen":"0.0.0.0","protocol":"vless","settings":{"clients":[{"id":"${UUID}"}],"decryption":"none"},"streamSettings":{"network":"ws","wsSettings":{"path":"${WSPATH}"}}}],"outbounds":[{"protocol":"freedom"}]}
JSON
exec /usr/local/bin/xray run -c /tmp/xray.json
