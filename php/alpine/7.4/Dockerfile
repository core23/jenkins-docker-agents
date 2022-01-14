FROM jenkins/inbound-agent:alpine

MAINTAINER Christian Gripp <mail@core23.de>

# Switch to install mode
USER root

# NPM
RUN apk add --no-cache nodejs npm \
    && npm install -g yarn --unsafe-perm

# PHP
RUN apk add --no-cache -X http://dl-cdn.alpinelinux.org/alpine/edge/testing \
        php7 \
        php7-bcmath \
        php7-ctype \
        php7-curl \
        php7-dom \
        php7-exif \
        php7-fileinfo \
        php7-fpm \
        php7-gd \
        php7-iconv \
        php7-intl \
        php7-mbstring \
        php7-mysqli \
        php7-opcache \
        php7-openssl \
        php7-pdo \
        php7-pdo_mysql \
        php7-pdo_sqlite \
        php7-pecl-imagick \
        php7-pecl-mongodb \
        php7-pecl-pcov \
        php7-pecl-redis \
        php7-phar \
        php7-redis \
        php7-session \
        php7-simplexml \
        php7-soap \
        php7-tokenizer \
        php7-xdebug \
        php7-xsl \
        php7-xml \
        php7-xmlreader \
        php7-xmlwriter \
        php7-zip \
        php7-zlib

COPY php.ini /etc/php/conf.d/custom.ini

# Get Composer
COPY --from=composer /usr/bin/composer /usr/local/bin/composer

USER jenkins

ENTRYPOINT ["jenkins-slave"]
