FROM jenkinsci/jnlp-slave:latest

MAINTAINER Christian Gripp <mail@core23.de>

# Switch to install mode
USER root

RUN apt-get update && apt-get install -y --no-install-recommends \
    apt-transport-https \
    apt-utils sendmail libpng-dev zlib1g-dev \
    curl git ant

RUN wget -q https://packages.sury.org/php/apt.gpg -O- | apt-key add - \
    && echo "deb https://packages.sury.org/php/ stretch main" | tee /etc/apt/sources.list.d/php.list

# install php extensions
RUN apt-get update && \
    apt-get install -y php7.3 php7.3-cli php7.3-xsl \
    php7.3-gd php7.3-intl php7.3-bcmath php7.3-imagick \
    php7.3-json php7.3-soap php7.3-curl php7.3-mysqlnd \
    php7.3-xdebug php7.3-intl \
    php7.3-mbstring php7.3-zip \
    && apt-get clean -y

# Create a Jenkins "HOME" for composer files.
RUN mkdir -p /home/jenkins/composer \
    && chown -R jenkins:jenkins /home/jenkins

# Install composer.
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin/  --filename=composer

# Install nodejs / npm
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash - \
    && apt-get install -y nodejs npm \
    && apt-get clean -y

# Add execution rights to php
RUN chmod +x /usr/bin/php*

USER jenkins

ENTRYPOINT ["jenkins-slave"]
