FROM php:7.4-fpm

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y \
        exa \
        git \
        graphicsmagick \
        imagemagick \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        liblz4-dev \
        libmagickwand-dev \
        libpng-dev \
        libwebp-dev \
        libxml2-dev \
        libyaml-dev \
        libzip-dev \
        libzstd-dev \
        locales \
        mariadb-client \
        parallel \
        rsync \
        sendmail \
        sqlite3 \
        ssh \
        unzip \
        vim \
        zlib1g-dev \
        zsh \
        --no-install-recommends

COPY  /etc/locale.gen /etc/

RUN locale-gen

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_CTYPE "en_US.UTF-8"
ENV LC_NUMERIC "en_US.UTF-8"
ENV LC_TIME "en_US.UTF-8"
ENV LC_COLLATE "en_US.UTF-8"
ENV LC_MONETARY "en_US.UTF-8"
ENV LC_MESSAGES "en_US.UTF-8"
ENV LC_PAPER "en_US.UTF-8"
ENV LC_NAME "en_US.UTF-8"
ENV LC_ADDRESS "en_US.UTF-8"
ENV LC_TELEPHONE "en_US.UTF-8"
ENV LC_MEASUREMENT "en_US.UTF-8"
ENV LC_IDENTIFICATION "en_US.UTF-8"
ENV LC_ALL en_US.UTF-8

COPY --from=composer:1 /usr/bin/composer /usr/local/bin/composer1

COPY --from=composer:2 /usr/bin/composer /usr/local/bin/

RUN curl -L https://github.com/mailhog/mhsendmail/releases/download/v0.2.0/mhsendmail_linux_amd64 -o mhsendmail_linux_amd64 \
    && chmod +x mhsendmail_linux_amd64 \
    && mv mhsendmail_linux_amd64 /usr/local/bin/mhsendmail \
    && chsh root -s /bin/zsh

RUN docker-php-ext-configure gd --enable-gd --with-freetype --with-jpeg --with-webp \
    && docker-php-ext-configure pdo_mysql --with-pdo-mysql=mysqlnd \
    && docker-php-ext-configure mysqli --with-mysqli=mysqlnd \
    && docker-php-ext-configure intl \
    && docker-php-ext-configure zip \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-install -j$(nproc) bz2 \
    && docker-php-ext-install -j$(nproc) intl \
    && docker-php-ext-install -j$(nproc) mysqli \
    && docker-php-ext-install -j$(nproc) opcache \
    && docker-php-ext-configure pcntl --enable-pcntl \
    && docker-php-ext-install -j$(nproc) pcntl \
    && docker-php-ext-install -j$(nproc) pdo_mysql \
    && docker-php-ext-install -j$(nproc) soap \
    && docker-php-ext-install -j$(nproc) zip \
    && yes | pecl install imagick \
    && docker-php-ext-enable imagick

RUN yes | pecl install apcu \
    && docker-php-ext-enable apcu

RUN yes | pecl install igbinary \
    && docker-php-ext-enable igbinary

RUN yes | pecl install --configureoptions 'enable-redis-msgpack="no"' redis \
    && docker-php-ext-enable redis

RUN yes | pecl install yaml \
    && docker-php-ext-enable yaml

# create users and groups for most common default uids
RUN set -x \
    && if ! getent group dev; then groupadd -g 1000 -r dev; \
    useradd -u 1000 -m -s /bin/zsh -g dev dev; fi \
    && if ! getent group dev1; then groupadd -g 1001 -r dev1; \
    useradd -u 1001 -m -s /bin/zsh -g dev1 dev1; fi \
    && if ! getent group dev2; then groupadd -g 1002 -r dev2; \
    useradd -u 1002 -m -s /bin/zsh -g dev2 dev2; fi \
    && if ! getent group dev3; then groupadd -g 1003 -r dev3; \
    useradd -u 1003 -m -s /bin/zsh -g dev3 dev3; fi \
    && if ! getent group dev4; then groupadd -g 1004 -r dev4; \
    useradd -u 1004 -m -s /bin/zsh -g dev4 dev4; fi \
    && if ! getent group dev5; then groupadd -g 1005 -r dev5; \
    useradd -u 1005 -m -s /bin/zsh -g dev5 dev5; fi \
    && if ! getent group docker; then groupadd -g 500 -r docker; \
    useradd -u 500 -m -s /bin/zsh -g docker docker; fi \
    && if ! getent group docker1; then groupadd -g 501 -r docker1; \
    useradd -u 501 -m -s /bin/zsh -g docker1 docker1; fi \
    && if ! getent group docker2; then groupadd -g 502 -r docker2; \
    useradd -u 502 -m -s /bin/zsh -g docker2 docker2; fi \
    && if ! getent group docker3; then groupadd -g 503 -r docker3; \
    useradd -u 503 -m -s /bin/zsh -g docker3 docker3; fi \
    && if ! getent group docker4; then groupadd -g 504 -r docker4; \
    useradd -u 504 -m -s /bin/zsh -g docker4 docker4; fi \
    && if ! getent group docker5; then groupadd -g 505 -r docker5; \
    useradd -u 505 -m -s /bin/zsh -g docker5 docker5; fi \
    && if ! getent group docker6; then groupadd -g 506 -r docker6; \
    useradd -u 506 -m -s /bin/zsh -g docker6 docker6; fi

COPY  /home/ /home/dev/
COPY  /home/ /home/dev1/
COPY  /home/ /home/dev2/
COPY  /home/ /home/dev3/
COPY  /home/ /home/dev4/
COPY  /home/ /home/dev5/

COPY  /home/ /home/docker/
COPY  /home/ /home/docker1/
COPY  /home/ /home/docker2/
COPY  /home/ /home/docker3/
COPY  /home/ /home/docker4/
COPY  /home/ /home/docker5/
COPY  /home/ /home/docker6/

RUN chown -R 1000:1000 /home/dev \
    && chown -R 1001:1001 /home/dev1 \
    && chown -R 1002:1002 /home/dev2 \
    && chown -R 1003:1003 /home/dev3 \
    && chown -R 1004:1004 /home/dev4 \
    && chown -R 1005:1005 /home/dev5 \
    && chown -R 500:500 /home/docker \
    && chown -R 501:501 /home/docker1 \
    && chown -R 502:502 /home/docker2 \
    && chown -R 503:503 /home/docker3 \
    && chown -R 504:504 /home/docker4 \
    && chown -R 505:505 /home/docker5 \
    && chown -R 506:506 /home/docker6

COPY  /etc/dev.sh /etc/profile.d/

RUN apt-get clean \
    && apt-get -y purge \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmagickwand-dev \
        libpng-dev \
        libwebp-dev \
        libxml2-dev \
        libzstd-dev \
    && apt-get autoremove --purge -y \
    && rm -rf /var/lib/apt/lists/* /usr/src/*
