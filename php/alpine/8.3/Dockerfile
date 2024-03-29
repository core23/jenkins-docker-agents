FROM jenkins/inbound-agent:alpine

MAINTAINER Christian Gripp <mail@core23.de>

# Switch to install mode
USER root

# cmd tools
RUN apk update && apk upgrade && apk add --update alpine-sdk && \
    apk add --no-cache make cmake

# NPM
RUN apk add --no-cache nodejs npm \
    && npm install -g yarn --unsafe-perm

# PHP
RUN apk add --no-cache -X http://dl-cdn.alpinelinux.org/alpine/edge/testing \
        php83 \
        php83-bcmath \
        php83-cli \
        php83-ctype \
        php83-curl \
        php83-dom \
        php83-exif \
        php83-fileinfo \
        php83-fpm \
        php83-gd \
        php83-iconv \
        php83-intl \
        php83-mbstring \
        php83-mysqli \
        php83-opcache \
        php83-openssl \
        php83-pcntl \
        php83-pdo \
        php83-pdo_mysql \
        php83-pdo_sqlite \
        php83-pecl-imagick \
        php83-pecl-mongodb \
        php83-pecl-redis \
        php83-phar \
        php83-posix \
        php83-redis \
        php83-session \
        php83-simplexml \
        php83-soap \
        php83-sodium \
        php83-tokenizer \
        php83-xdebug \
        php83-xsl \
        php83-xml \
        php83-xmlreader \
        php83-xmlwriter \
        php83-zip \
        php83-zlib

RUN ln -sf /usr/bin/php83 /usr/bin/php

COPY php.ini /etc/php83/conf.d/custom.ini

# Get Composer
COPY --from=composer /usr/bin/composer /usr/local/bin/composer

USER jenkins

ENTRYPOINT ["jenkins-slave"]
