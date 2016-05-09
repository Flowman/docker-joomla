[![](https://badge.imagelayers.io/flowman/joomla:latest.svg)](https://imagelayers.io/?images=flowman/joomla:latest 'Get your own badge on imagelayers.io')

# What is Joomla?

Joomla is a free and open-source content management system (CMS) for publishing web content. It is built on a model–view–controller web application framework that can be used independently of the CMS. Joomla is written in PHP, uses object-oriented programming (OOP) techniques and software design patterns, stores data in a MySQL, MS SQL, or PostgreSQL database, and includes features such as page caching, RSS feeds, printable versions of pages, news flashes, blogs, search, and support for language internationalization.

## Info

This container is not meant to be run standalone as it is part of a [Rancher](http://rancher.com) Catalog item. If it suites your purpose you are more then welcome to use it.

This image is based on the popular Alpine Linux project, available in the alpine official image. Alpine Linux is much smaller than most distribution base images (~5MB), and thus leads to much slimmer images in general.

## Usage

```
$ docker run -d flowman/joomla:tag
```

## ... via `docker-compose`

Example Rancher docker-compose stack

```
nginx:
  image: flowman/nginx:1.10.0
  labels:
    io.rancher.sidekicks: php-fpm, www-data
  volumes_from:
    - 'www-data'
  ports:
   - "80:80"
php-fpm:
  image: flowman/php-fpm:7.0.6
  net: "container:nginx"
  volumes_from:
    - 'www-data'
  environment:
    XDEBUG: 'true'
www-data:
  image: flowman/joomla:3.5.1
  net: none
  command: /bin/true
  labels:
    io.rancher.container.start_once: true
```

Example docker-compose file

```
version: '2'
services:
  nginx:
    image: flowman/nginx:1.10.0
    ports:
     - "80:80"
    volumes_from:
      - 'joomla'
  php-fpm:
    image: flowman/php-fpm:7.0.6
    network_mode: "service:nginx"
    volumes_from:
      - 'joomla'
    environment:
      XDEBUG: 'true'
  joomla:
    image: flowman/joomla:3.5.1
    network_mode: none
```

## Build

For example, if you need to change Joomla version, edit the Dockerfile and than build-it.

```
git clone git@github.com:Flowman/docker-joomla.git
cd ./docker-joomla
docker build --rm -t flowman/joomla .
```
