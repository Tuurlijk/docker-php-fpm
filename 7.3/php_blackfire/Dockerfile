FROM tuurlijk/php-fpm:7.3

RUN apt-get update \
    && apt-get install -y \
        libzip-dev \
        libzstd-dev \
        zlib1g-dev \
        --no-install-recommends

RUN version=$(php -r "echo PHP_MAJOR_VERSION.PHP_MINOR_VERSION;") \
    && curl -A "Docker" -o /tmp/blackfire-probe.tar.gz -D - -L -s https://blackfire.io/api/v1/releases/probe/php/linux/amd64/$version \
    && mkdir -p /tmp/blackfire \
    && tar zxpf /tmp/blackfire-probe.tar.gz -C /tmp/blackfire \
    && mv /tmp/blackfire/blackfire-*.so $(php -r "echo ini_get('extension_dir');")/blackfire.so \
    && printf "extension=blackfire.so\nblackfire.agent_socket=tcp://blackfire:8707\n" > $PHP_INI_DIR/conf.d/blackfire.ini \
    && rm -rf /tmp/blackfire /tmp/blackfire-probe.tar.gz

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
