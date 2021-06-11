FROM jenkins/jnlp-slave:latest

MAINTAINER Christian Gripp <mail@core23.de>

# Switch to install mode
USER root

RUN apt-get update && apt-get install -y --no-install-recommends \
    apt-transport-https \
    apt-utils sendmail libpng-dev zlib1g-dev \
    curl git ant

RUN wget -q https://packages.sury.org/php/apt.gpg -O- | apt-key add - \
    && echo "deb https://packages.sury.org/php/ buster main" | tee /etc/apt/sources.list.d/php.list

# NPM tools
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash - \
    && apt-get install -y nodejs \
    && npm install -g yarn --unsafe-perm

# install php extensions
RUN apt-get update && \
    apt-get install -y \
        php8.0 php8.0-cli php8.0-xsl \
        php8.0-gd php8.0-intl php8.0-bcmath php8.0-imagick \
        php8.0-soap php8.0-curl php8.0-mysqlnd \
        php8.0-pdo php8.0-sqlite \
        php8.0-xdebug php8.0-intl \
        php8.0-mbstring php8.0-zip \
        php8.0-mongodb \
        php8.0-redis \
        php8.0-xsl \
    && apt-get clean -y

# Get Composer
COPY --from=composer:2 /usr/bin/composer /usr/local/bin/composer2
COPY --from=composer:1 /usr/bin/composer /usr/local/bin/composer1
COPY --from=composer   /usr/bin/composer /usr/local/bin/composer

USER jenkins

ENTRYPOINT ["jenkins-slave"]
