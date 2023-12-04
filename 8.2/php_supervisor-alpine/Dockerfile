FROM tuurlijk/php-fpm:8.2-alpine

RUN apk --update --no-progress add \
    supervisor

RUN rm -rf /var/lib/apk/* /usr/src/* /var/cache/apk/*

ENTRYPOINT ["/usr/bin/supervisord", "-n", "-c",  "/etc/supervisor/supervisord.conf"]

WORKDIR /etc/supervisor/conf.d/
