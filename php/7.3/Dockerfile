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
        php7.3 php7.3-cli php7.3-xsl \
        php7.3-gd php7.3-intl php7.3-bcmath php7.3-imagick \
        php7.3-json php7.3-soap php7.3-curl php7.3-mysqlnd \
        php7.3-pdo php7.3-sqlite \
        php7.3-xdebug php7.3-intl \
        php7.3-mbstring php7.3-zip \
        php7.3-mongodb \
        php7.3-redis \
        php7.3-xsl \
    && apt-get clean -y

# Get Composer
COPY --from=composer:2 /usr/bin/composer /usr/local/bin/composer2
COPY --from=composer:1 /usr/bin/composer /usr/local/bin/composer1
COPY --from=composer   /usr/bin/composer /usr/local/bin/composer

USER jenkins

ENTRYPOINT ["jenkins-slave"]
