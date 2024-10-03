FROM jenkins/inbound-agent

MAINTAINER Christian Gripp <mail@core23.de>

# Switch to install mode
USER root

RUN apt-get update && apt-get install -y --no-install-recommends \
    apt-transport-https \
    apt-utils sendmail libpng-dev zlib1g-dev \
    gnupg2 curl git ant wget

# NPM tools
RUN curl -sL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install -y nodejs \
    && npm install -g yarn --unsafe-perm

RUN wget -q https://packages.sury.org/php/apt.gpg -O- | apt-key add - \
    && echo "deb https://packages.sury.org/php/ buster main" | tee /etc/apt/sources.list.d/php.list

# install php extensions
RUN wget "http://ftp.de.debian.org/debian/pool/main/libf/libffi/libffi6_3.2.1-9_$(dpkg --print-architecture).deb" && \
    dpkg -i "libffi6_3.2.1-9_$(dpkg --print-architecture).deb"

RUN wget "http://ftp.de.debian.org/debian/pool/main/o/openssl/libssl1.1_1.1.1w-0+deb11u1_$(dpkg --print-architecture).deb" && \
    dpkg -i "libssl1.1_1.1.1w-0+deb11u1_$(dpkg --print-architecture).deb"

RUN wget "http://ftp.de.debian.org/debian/pool/main/libw/libwebp/libwebp6_0.6.1-2.1+deb11u2_$(dpkg --print-architecture).deb" && \
    dpkg -i "libwebp6_0.6.1-2.1+deb11u2_$(dpkg --print-architecture).deb"

RUN wget "http://ftp.de.debian.org/debian/pool/main/t/tiff/libtiff5_4.2.0-1+deb11u5_$(dpkg --print-architecture).deb" && \
    dpkg -i "libtiff5_4.2.0-1+deb11u5_$(dpkg --print-architecture).deb"

RUN apt-get update && \
    apt-get install -y \
        php8.3 \
        php8.3-bcmath \
        php8.3-cli \
        php8.3-ctype \
        php8.3-curl \
        php8.3-dom \
        php8.3-exif \
        php8.3-fileinfo \
        php8.3-fpm \
        php8.3-gd \
        php8.3-iconv \
        php8.3-intl \
        php8.3-mbstring \
        php8.3-mysqli \
        php8.3-opcache \
        php8.3-pdo \
        php8.3-phar \
        php8.3-posix \
        php8.3-redis \
        php8.3-simplexml \
        php8.3-soap \
        php8.3-tokenizer \
        php8.3-xdebug \
        php8.3-xsl \
        php8.3-xml \
        php8.3-xmlreader \
        php8.3-xmlwriter \
        php8.3-zip \
    && apt-get clean -y

# Get Composer
COPY --from=composer /usr/bin/composer /usr/local/bin/composer

# Get phive
RUN wget -O phive.phar "https://phar.io/releases/phive.phar" && \
    wget -O phive.phar.asc "https://phar.io/releases/phive.phar.asc" && \
    gpg --keyserver hkps://keys.openpgp.org --recv-keys 0x6AF725270AB81E04D79442549D8A98B29B2D5D79 && \
    gpg --verify phive.phar.asc phive.phar && \
    rm phive.phar.asc && \
    chmod +x phive.phar && \
    mv phive.phar /usr/local/bin/phive
    
USER jenkins

ENTRYPOINT ["jenkins-slave"]
