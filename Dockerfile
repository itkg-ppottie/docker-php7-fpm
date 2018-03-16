FROM ppottie/docker-php7-fpm:php7.1-apc

LABEL maintenainer="Pierre Pottié <pierre.pottie@gmail.com>"

#Adding xdebug without enabling it
RUN pecl install -o -f xdebug \
    && rm -rf /tmp/pear

# Install the available extensions
RUN docker-php-ext-install pdo
# MYSQL
RUN docker-php-ext-install pdo_mysql
