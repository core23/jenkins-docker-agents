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
    && npm install npm yarn --global

# install php extensions
RUN apt-get update && \
    apt-get install -y \
        php7.2 php7.2-cli php7.2-xsl \
        php7.2-gd php7.2-intl php7.2-bcmath php7.2-imagick \
        php7.2-json php7.2-soap php7.2-curl php7.2-mysqlnd \
        php7.2-pdo php7.2-sqlite \
        php7.2-xdebug php7.2-intl \
        php7.2-mbstring php7.2-zip \
        php7.2-mongodb \
        php7.2-redis \
        php7.2-xsl \
    && apt-get clean -y

# Get Composer
COPY --from=composer:2 /usr/bin/composer /usr/local/bin/composer2
COPY --from=composer:1 /usr/bin/composer /usr/local/bin/composer1
COPY --from=composer   /usr/bin/composer /usr/local/bin/composer

USER jenkins

ENTRYPOINT ["jenkins-slave"]
