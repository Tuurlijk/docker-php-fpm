FROM tuurlijk/php-fpm:7.3

RUN yes | pecl install xdebug \
    && docker-php-ext-enable xdebug

RUN apt-get clean \
    && apt-get -y purge \
        automake \ 
        binutils \
        cpp \ 
        dpkg-dev \
        git \
        libc-dev-bin libc6-dev \
        libzip-dev \
        linux-libc-dev \
        m4 \
        make \
        mariadb-client \
        parallel \
        rsync \
        unzip \
        vim \
        zlib1g-dev \
    && apt-get autoremove --purge -y \
    && rm -rf /var/lib/apt/lists/* /usr/src/*
