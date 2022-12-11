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
        php81 \
        php81-bcmath \
        php81-ctype \
        php81-curl \
        php81-dom \
        php81-exif \
        php81-fileinfo \
        php81-fpm \
        php81-gd \
        php81-iconv \
        php81-intl \
        php81-mbstring \
        php81-mysqli \
        php81-opcache \
        php81-openssl \
        php81-pcntl \
        php81-pdo \
        php81-pdo_mysql \
        php81-pdo_sqlite \
        php81-pecl-imagick \
        php81-pecl-mongodb \
        php81-pecl-pcov \
        php81-pecl-redis \
        php81-phar \
        php81-posix \
        php81-redis \
        php81-session \
        php81-simplexml \
        php81-soap \
        php81-sodium \
        php81-tokenizer \
        php81-xdebug \
        php81-xsl \
        php81-xml \
        php81-xmlreader \
        php81-xmlwriter \
        php81-zip \
        php81-zlib

RUN ln -s /usr/bin/php81 /usr/bin/php

COPY php.ini /etc/php81/conf.d/custom.ini

# Get Composer
COPY --from=composer /usr/bin/composer /usr/local/bin/composer

USER jenkins

ENTRYPOINT ["jenkins-slave"]
