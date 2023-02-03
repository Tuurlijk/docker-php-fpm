FROM tuurlijk/php-fpm:7.1

RUN yes | pecl install  xdebug-2.9.8 \
    && docker-php-ext-enable xdebug

RUN apt-get clean \
    && apt-get -y purge \
        automake \ 
        binutils \
        cpp \ 
        dpkg-dev \
        gcc \
        libc-dev-bin libc6-dev \
        libzip-dev \
        linux-libc-dev \
        m4 \
        make \
        mariadb-client \
        parallel \
        rsync \
        unzip \
        zlib1g-dev \
    && apt-get autoremove --purge -y \
    && rm -rf /var/lib/apt/lists/* /usr/src/*
