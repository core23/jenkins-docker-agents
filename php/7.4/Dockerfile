FROM jenkins/jnlp-slave:latest

MAINTAINER Christian Gripp <mail@core23.de>

# Switch to install mode
USER root

RUN apt-get update && apt-get install -y --no-install-recommends \
    apt-transport-https \
    apt-utils sendmail libpng-dev zlib1g-dev \
    curl git ant

RUN wget -q https://packages.sury.org/php/apt.gpg -O- | apt-key add - \
    && echo "deb https://packages.sury.org/php/ stretch main" | tee /etc/apt/sources.list.d/php.list

# NPM tools
RUN curl -sL https://deb.nodesource.com/setup_13.x | bash - \
    && apt-get install -y nodejs yarn \
    && npm install npm --global

# install php extensions
RUN apt-get update && \
    apt-get install -y php7.4 php7.4-cli php7.4-xsl \
    php7.4-gd php7.4-intl php7.4-bcmath php7.4-imagick \
    php7.4-json php7.4-soap php7.4-curl php7.4-mysqlnd \
    php7.4-pdo \
    php7.4-xdebug php7.4-intl \
    php7.4-mbstring php7.4-zip \
    && apt-get clean -y

# Get Composer
COPY --from=composer /usr/bin/composer /usr/local/bin/composer

USER jenkins

ENTRYPOINT ["jenkins-slave"]
