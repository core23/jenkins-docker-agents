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
    apt-get install -y php7.1 php7.1-cli php7.1-xsl \
    php7.1-gd php7.1-intl php7.1-bcmath php7.1-imagick \
    php7.1-json php7.1-soap php7.1-curl php7.1-mysqlnd \
    php7.1-xdebug php7.1-intl \
    php7.1-mbstring php7.1-xdebug php7.1-zip \
    && apt-get clean -y

# Create a Jenkins "HOME" for composer files.
RUN mkdir -p /home/jenkins/composer \
    && chown -R jenkins:jenkins /home/jenkins

# Install composer.
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin/  --filename=composer

# Add execution rights to php
USER root
RUN chmod +x /usr/bin/php*
USER jenkins

ENTRYPOINT ["jenkins-slave"]
