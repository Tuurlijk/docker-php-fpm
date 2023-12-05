FROM tuurlijk/php-fpm:8.3

RUN apk --update --no-progress add supervisor

RUN rm -rf /var/lib/apk/* /var/cache/apk/*

RUN mkdir -p /etc/supervisor/conf.d && mkdir -p /var/log/supervisor

COPY /etc/supervisor/supervisord.conf /etc/supervisor/supervisord.conf

ENTRYPOINT ["/usr/bin/supervisord", "-n", "-c",  "/etc/supervisor/supervisord.conf"]

WORKDIR /etc/supervisor/conf.d/
