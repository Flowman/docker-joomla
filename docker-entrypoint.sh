#!/bin/sh
set -e

if [ ! -d "/usr/share/nginx/html" ]; then
	mkdir /usr/share/nginx
	mv /tmp/html /usr/share/nginx
	chown -Rf nginx.nginx /usr/share/nginx/html
fi