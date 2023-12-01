FROM tuurlijk/php-fpm:8.3

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y \
        supervisor \
        --no-install-recommends

RUN apt-get clean \
    && apt-get -y purge \
        automake \
        binutils \
        cpp \
        dpkg-dev \
        gcc \
        m4 \
        make \
        mariadb-client \
        parallel \
        rsync \
        unzip \
    && apt-get autoremove --purge -y \
    && rm -rf /var/lib/apt/lists/* /usr/src/*

ENTRYPOINT ["/usr/bin/supervisord", "-n", "-c",  "/etc/supervisor/supervisord.conf"]

WORKDIR /etc/supervisor/conf.d/
