FROM ppottie/docker-php7-fpm:php7.1

LABEL maintenainer="Pierre Pottié <pierre.pottie@gmail.com>"

# Install the available extensions
RUN docker-php-ext-install   opcache


# Enable apc
RUN echo "apc.enable_cli = On" >> /usr/local/etc/php/conf.d/docker-php-ext-apcu.ini

# set recommended opcache PHP.ini settings # see https://secure.php.net/manual/en/opcache.installation.php
RUN { \
		echo 'opcache.memory_consumption=128'; \
		echo 'opcache.interned_strings_buffer=8'; \
		echo 'opcache.max_accelerated_files=4000'; \
		echo 'opcache.revalidate_freq=60'; \
		echo 'opcache.fast_shutdown=1'; \
		echo 'opcache.enable_cli=1'; \
} > /usr/local/etc/php/conf.d/opcache-recommended.ini
# set recommended apcu PHP.ini settings # see https://secure.php.net/manual/en/apcu.configuration.php
RUN { \
        echo 'apc.shm_segments=1'; \
        echo 'apc.shm_size=256M'; \
        echo 'apc.num_files_hint=7000'; \
        echo 'apc.user_entries_hint=4096'; \
        echo 'apc.ttl=7200'; \
        echo 'apc.user_ttl=7200'; \
        echo 'apc.gc_ttl=3600'; \
        echo 'apc.max_file_size=1M'; \
        echo 'apc.stat=1'; \
} > /usr/local/etc/php/conf.d/apcu-recommended.ini

