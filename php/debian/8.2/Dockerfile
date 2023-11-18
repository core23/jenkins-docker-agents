FROM jenkins/inbound-agent

MAINTAINER Christian Gripp <mail@core23.de>

# Switch to install mode
USER root

RUN apt-get update && apt-get install -y --no-install-recommends \
    apt-transport-https \
    apt-utils sendmail libpng-dev zlib1g-dev \
    gnupg2 curl git ant wget

# NPM tools
RUN apt-get install -y nodejs npm && \
    npm install -g yarn --unsafe-perm

RUN wget -q https://packages.sury.org/php/apt.gpg -O- | apt-key add - \
    && echo "deb https://packages.sury.org/php/ buster main" | tee /etc/apt/sources.list.d/php.list

# install php extensions
RUN wget "http://ftp.de.debian.org/debian/pool/main/libf/libffi/libffi6_3.2.1-9_$(dpkg --print-architecture).deb" && \
    dpkg -i "libffi6_3.2.1-9_$(dpkg --print-architecture).deb"

RUN apt-get update && \
    apt-get install -y \
        php8.2 \
        php8.2-bcmath \
        php8.2-cli \
        php8.2-curl \
        php8.2-gd \
        php8.2-imagick \
        php8.2-intl \
        php8.2-mbstring \
        php8.2-mongodb \
        php8.2-mysqlnd \
        php8.2-pcov \
        php8.2-pdo \
        php8.2-redis \
        php8.2-soap \
        php8.2-sqlite \
        php8.2-xdebug \
        php8.2-xsl \
        php8.2-zip \
    && apt-get clean -y

# Get Composer
COPY --from=composer /usr/bin/composer /usr/local/bin/composer

USER jenkins

ENTRYPOINT ["jenkins-slave"]
