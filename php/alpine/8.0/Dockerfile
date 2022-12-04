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
        php8 \
        php8-bcmath \
        php8-ctype \
        php8-curl \
        php8-dom \
        php8-exif \
        php8-fileinfo \
        php8-fpm \
        php8-gd \
        php8-iconv \
        php8-intl \
        php8-mbstring \
        php8-mongodb \
        php8-mysqli \
        php8-opcache \
        php8-openssl \
        php8-pcntl \
        php8-pdo \
        php8-pdo_mysql \
        php8-pdo_sqlite \
        php8-pecl-imagick \
        php8-pecl-mongodb \
        php8-pecl-pcov \
        php8-pecl-redis \
        php8-phar \
        php8-posix \
        php8-redis \
        php8-session \
        php8-simplexml \
        php8-soap \
        php8-sodium \
        php8-tokenizer \
        php8-xdebug \
        php8-xsl \
        php8-xml \
        php8-xmlreader \
        php8-xmlwriter \
        php8-zip \
        php8-zlib

COPY php.ini /etc/php8/conf.d/custom.ini

# Get Composer
COPY --from=composer /usr/bin/composer /usr/local/bin/composer

USER jenkins

ENTRYPOINT ["jenkins-slave"]
