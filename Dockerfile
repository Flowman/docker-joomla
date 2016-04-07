FROM alpine:latest

MAINTAINER Peter Szalatnay <theotherland@gmail.com>

# Define Joomla version and expected SHA1 signature
ENV JOOMLA_VERSION 3.5.1
#ENV JOOMLA_SHA1 8c88f079f31774adc9d2682067beabc057c541aa

RUN \
    addgroup -S nginx \
    && adduser -D -S -h /var/cache/nginx -s /sbin/nologin -G nginx nginx \
    && apk add --update \
        curl \
    && rm -fr /var/cache/apk/* \
	&& curl -o joomla.zip -SL https://github.com/joomla/joomla-cms/releases/download/${JOOMLA_VERSION}/Joomla_${JOOMLA_VERSION}-Stable-Full_Package.zip \
	#&& echo "$JOOMLA_SHA1 *joomla.zip" | sha1sum -c - \
	&& mkdir -p /usr/share/nginx/html \
	&& unzip joomla.zip -d /usr/share/nginx/html \
	&& rm joomla.zip \
	&& chown -Rf nginx.nginx /usr/share/nginx/html

VOLUME ["/usr/share/nginx/html"]