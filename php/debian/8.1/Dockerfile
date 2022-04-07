FROM jenkins/inbound-agent

MAINTAINER Christian Gripp <mail@core23.de>

# Switch to install mode
USER root

RUN apt-get update && apt-get install -y --no-install-recommends \
    apt-transport-https \
    apt-utils sendmail libpng-dev zlib1g-dev \
    gnupg2 curl git ant wget

# NPM tools
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash - \
    && apt-get install -y nodejs \
    && npm install -g yarn --unsafe-perm

RUN wget -q https://packages.sury.org/php/apt.gpg -O- | apt-key add - \
    && echo "deb https://packages.sury.org/php/ buster main" | tee /etc/apt/sources.list.d/php.list

# install php extensions
RUN wget "http://ftp.de.debian.org/debian/pool/main/libf/libffi/libffi6_3.2.1-9_$(dpkg --print-architecture).deb" && \
    dpkg -i "libffi6_3.2.1-9_$(dpkg --print-architecture).deb"

RUN apt-get update && \
    apt-get install -y \
        php8.1 \
        php8.1-bcmath \
        php8.1-cli \
        php8.1-curl \
        php8.1-gd \
        php8.1-imagick \
        php8.1-intl \
        php8.1-mbstring \
        php8.1-mongodb \
        php8.1-mysqlnd \
        php8.1-pcov \
        php8.1-pdo \
        php8.1-redis \
        php8.1-soap \
        php8.1-sqlite \
        php8.1-xdebug \
        php8.1-xsl \
        php8.1-zip \
    && apt-get clean -y

# Get Composer
COPY --from=composer /usr/bin/composer /usr/local/bin/composer

USER jenkins

ENTRYPOINT ["jenkins-slave"]
