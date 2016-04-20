#!/bin/sh
set -e

if [ ! -d "/usr/share/nginx/html/administrator" ] && [ -d "/data/html" ]; then
    cp -r /data/html /usr/share/nginx
    rm -rf /data/html
    chown -Rf nginx.nginx /usr/share/nginx/html
fi

exec "$@"