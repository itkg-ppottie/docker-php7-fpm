FROM ppottie/docker-php7-fpm:php7.1

LABEL maintenainer="Pierre Pottié <pierre.pottie@gmail.com>"

RUN pecl install -o -f xdebug \
    && rm -rf /tmp/pear

RUN docker-php-ext-enable xdebug
