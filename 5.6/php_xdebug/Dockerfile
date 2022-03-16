FROM tuurlijk/php-fpm:5.6

RUN yes | pecl install xdebug \
    && docker-php-ext-enable xdebug

RUN apt-get clean \
    && apt-get -y purge \
        git \
        mariadb-client \
        rsync \
        parallel \
        unzip \
        vim \
    && apt-get autoremove --purge -y \
    && rm -rf /var/lib/apt/lists/* /usr/src/*
