FROM tuurlijk/php-fpm:5.6

RUN yes | pecl install xdebug-2.5.5 \
    && docker-php-ext-enable xdebug

RUN apt-get clean \
    && apt-get -y purge \
        automake \
        binutils \
        cpp \
        dpkg-dev \
        gcc \
        libc-dev-bin \
        libc6-dev \
        linux-libc-dev \
        m4 \
        make \
        mariadb-client \
        parallel \
        rsync \
        unzip \
    && apt-get autoremove --purge -y \
    && rm -rf /var/lib/apt/lists/* /usr/src/*
