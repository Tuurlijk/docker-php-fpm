FROM tuurlijk/php-fpm:7.3

RUN yes | pecl install  xdebug-2.9.8 \
    && docker-php-ext-enable xdebug

RUN apt-get clean \
    && apt-get -y purge \
        automake \
        binutils \
        cpp \
        dpkg-dev \
        gcc \
        m4 \
        mariadb-client \
        parallel \
        rsync \
        unzip \
    && apt-get autoremove --purge -y \
    && rm -rf /var/lib/apt/lists/* /usr/src/*
