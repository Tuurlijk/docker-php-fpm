FROM tuurlijk/php-fpm:8.3

RUN apk --update --no-progress add \
    php82-pecl-xdebug

RUN touch /usr/local/etc/php/conf.d/docker-modules.ini \
    && echo $'extension=xdebug.so \n\
' >> /usr/local/etc/php/conf.d/docker-modules.ini

RUN rm -rf /var/lib/apk/* /var/cache/apk/*
