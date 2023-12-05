FROM tuurlijk/php-fpm:8.2

RUN apk --update --no-progress add \
    php82-pecl-xdebug

RUN touch /usr/local/etc/php/conf.d/docker-modules.ini \
    && echo $'extension=xdebug \n\
' >> /usr/local/etc/php/conf.d/docker-modules.ini

RUN rm -rf /var/lib/apk/* /usr/src/* /var/cache/apk/*
