#!/bin/sh
set -e

if [ ! -d "/usr/share/nginx/html/administrator" ]; then
	mv /tmp/html /usr/share/nginx
	chown -Rf nginx.nginx /usr/share/nginx/html
fi