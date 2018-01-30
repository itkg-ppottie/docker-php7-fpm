FROM ppottie/docker-php7-fpm:php7.1-xdebug

LABEL maintenainer="Pierre Pottié <pierre.pottie@gmail.com>"

# Install the available extensions
RUN docker-php-ext-install pdo

# POSTGRES
RUN docker-php-ext-install pdo_pgsql
