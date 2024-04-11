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
        php82 \
        php82-bcmath \
        php82-cli \
        php82-ctype \
        php82-curl \
        php82-dom \
        php82-exif \
        php82-fileinfo \
        php82-fpm \
        php82-gd \
        php82-iconv \
        php82-intl \
        php82-mbstring \
        php82-mysqli \
        php82-opcache \
        php82-openssl \
        php82-pcntl \
        php82-pdo \
        php82-pdo_mysql \
        php82-pdo_sqlite \
        php82-pecl-imagick \
        php82-pecl-mongodb \
        php82-pecl-pcov \
        php82-pecl-redis \
        php82-phar \
        php82-posix \
        php82-redis \
        php82-session \
        php82-simplexml \
        php82-soap \
        php82-sodium \
        php82-tokenizer \
        php82-xdebug \
        php82-xsl \
        php82-xml \
        php82-xmlreader \
        php82-xmlwriter \
        php82-zip \
        php82-zlib

RUN ln -sf /usr/bin/php82 /usr/bin/php

COPY php.ini /etc/php82/conf.d/custom.ini

# Get Composer
COPY --from=composer /usr/bin/composer /usr/local/bin/composer

USER jenkins

ENTRYPOINT ["jenkins-slave"]
