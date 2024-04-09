FROM php:8.3-fpm-alpine

RUN apk --update --no-progress add \
    exa \
    git \
    graphicsmagick \
    imagemagick \
    mariadb-client \
    musl-locales \
    openssh-client-default \
    parallel \
    php82-apc \
    php82-bz2 \
    php82-gd \
    php82-intl \
    php82-mysqli \
    php82-opcache \
    php82-pcntl \
    php82-pdo_mysql \
    php82-pecl-igbinary \
    php82-pecl-imagick \
    php82-pecl-msgpack \
    php82-pecl-redis \
    php82-pecl-yaml \
    php82-session \
    php82-sockets \
    php82-soap \
    rsync \
    shadow \
    sqlite \
    unzip \
    zsh \
    zsh-vcs

RUN apk add --no-cache \
      libzip-dev \
      zip \
    && docker-php-ext-install zip

RUN cp -pr /usr/local/lib/php/extensions/no-debug-non-zts*/* /usr/lib/php82/modules

RUN mv /usr/local/etc/php/php.ini-production /usr/local/etc/php/php.ini

RUN touch /usr/local/etc/php/conf.d/docker-modules.ini \
    && echo $'extension_dir=/usr/lib/php82/modules \n\
extension=bz2 \n\
extension=gd \n\
extension=igbinary \n\
extension=intl \n\
extension=msgpack \n\
extension=mysqli \n\
extension=pdo_mysql \n\
extension=redis \n\
extension=soap \n\
zend_extension=opcache.so \n\
' > /usr/local/etc/php/conf.d/docker-modules.ini

ENV LANG en_US
ENV LANGUAGE en_US:en
ENV LC_CTYPE "en_US"
ENV LC_NUMERIC "en_US"
ENV LC_TIME "en_US"
ENV LC_COLLATE "en_US"
ENV LC_MONETARY "en_US"
ENV LC_MESSAGES "en_US"
ENV LC_PAPER "en_US"
ENV LC_NAME "en_US"
ENV LC_ADDRESS "en_US"
ENV LC_TELEPHONE "en_US"
ENV LC_MEASUREMENT "en_US"
ENV LC_IDENTIFICATION "en_US"
ENV LC_ALL en_US

COPY --from=composer:1 /usr/bin/composer /usr/local/bin/composer1

COPY --from=composer:2 /usr/bin/composer /usr/local/bin/

RUN curl -L https://github.com/mailhog/mhsendmail/releases/download/v0.2.0/mhsendmail_linux_amd64 -o mhsendmail_linux_amd64 \
    && chmod +x mhsendmail_linux_amd64 \
    && mv mhsendmail_linux_amd64 /usr/local/bin/mhsendmail

# create users and groups for most common default uids
RUN set -x \
    && if ! getent group docker; then groupadd -g 1000 -r docker; \
    useradd -u 1000 -m -s /bin/zsh -g docker docker; fi \
    && if ! getent group docker1; then groupadd -g 1001 -r docker1; \
    useradd -u 1001 -m -s /bin/zsh -g docker1 docker1; fi \
    && if ! getent group docker2; then groupadd -g 1002 -r docker2; \
    useradd -u 1002 -m -s /bin/zsh -g docker2 docker2; fi \
    && if ! getent group docker3; then groupadd -g 1003 -r docker3; \
    useradd -u 1003 -m -s /bin/zsh -g docker3 docker3; fi \
    && if ! getent group docker4; then groupadd -g 1004 -r docker4; \
    useradd -u 1004 -m -s /bin/zsh -g docker4 docker4; fi \
    && if ! getent group docker5; then groupadd -g 1005 -r docker5; \
    useradd -u 1005 -m -s /bin/zsh -g docker5 docker5; fi \
    && if ! getent group docker6; then groupadd -g 1006 -r docker6; \
    useradd -u 1006 -m -s /bin/zsh -g docker6 docker6; fi \
    && if ! getent group macdocker; then groupadd -g 500 -r macdocker; \
    useradd -u 500 -m -s /bin/zsh -g macdocker macdocker; fi \
    && if ! getent group macdocker1; then groupadd -g 501 -r macdocker1; \
    useradd -u 501 -m -s /bin/zsh -g macdocker1 macdocker1; fi \
    && if ! getent group macdocker2; then groupadd -g 502 -r macdocker2; \
    useradd -u 502 -m -s /bin/zsh -g macdocker2 macdocker2; fi \
    && if ! getent group macdocker3; then groupadd -g 503 -r macdocker3; \
    useradd -u 503 -m -s /bin/zsh -g macdocker3 macdocker3; fi \
    && if ! getent group macdocker4; then groupadd -g 504 -r macdocker4; \
    useradd -u 504 -m -s /bin/zsh -g macdocker4 macdocker4; fi \
    && if ! getent group macdocker5; then groupadd -g 505 -r macdocker5; \
    useradd -u 505 -m -s /bin/zsh -g macdocker5 macdocker5; fi \
    && if ! getent group macdocker6; then groupadd -g 506 -r macdocker6; \
    useradd -u 506 -m -s /bin/zsh -g macdocker6 macdocker6; fi

COPY  /home/ /home/docker/
COPY  /home/ /home/docker1/
COPY  /home/ /home/docker2/
COPY  /home/ /home/docker3/
COPY  /home/ /home/docker4/
COPY  /home/ /home/docker5/
COPY  /home/ /home/docker6/

COPY  /home/ /home/macdocker/
COPY  /home/ /home/macdocker1/
COPY  /home/ /home/macdocker2/
COPY  /home/ /home/macdocker3/
COPY  /home/ /home/macdocker4/
COPY  /home/ /home/macdocker5/
COPY  /home/ /home/macdocker6/

RUN chown -R 1000:1000 /home/docker \
    && chown -R 1001:1001 /home/docker1 \
    && chown -R 1002:1002 /home/docker2 \
    && chown -R 1003:1003 /home/docker3 \
    && chown -R 1004:1004 /home/docker4 \
    && chown -R 1005:1005 /home/docker5 \
    && chown -R 1006:1006 /home/docker6 \
    && chown -R 500:500 /home/macdocker \
    && chown -R 501:501 /home/macdocker1 \
    && chown -R 502:502 /home/macdocker2 \
    && chown -R 503:503 /home/macdocker3 \
    && chown -R 504:504 /home/macdocker4 \
    && chown -R 505:505 /home/macdocker5 \
    && chown -R 506:506 /home/macdocker6

COPY  /etc/dev.sh /etc/profile.d/

RUN rm -rf /var/lib/apk/* /var/cache/apk/*
