FROM php:7.1-fpm

LABEL maintenainer="Pierre Pottié <pierre.pottie@gmail.com>"


RUN systemMods=" \
        apt-utils \
        openssl \
        acl \
        graphicsmagick \
        libssl-dev \
        libmcrypt-dev \
        curl \
        wget \
        libicu-dev \
        libpq-dev \
        zip \
        libxml2-dev \
        unzip \
        locales \
        locales-all \
    " \
    && apt-get update \
    && apt-get install -y $systemMods \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


# Install Composer
COPY --from=composer:1.6.2 /usr/bin/composer /usr/bin/composer
RUN composer --version

# Set timezone
RUN rm /etc/localtime \
    && ln -s /usr/share/zoneinfo/Europe/Paris /etc/localtime
RUN "date"

# Install the available extensions
RUN docker-php-ext-install  intl zip soap  mcrypt

# for linux
RUN usermod -u 1000 www-data \
    && chown 1000:www-data /var/www -R

# for mac
#RUN usermod -u 501 www-data \
#    chown 501:www-data /var/www -R

# Expose ports
EXPOSE 9000

WORKDIR /var/www/
