# PHP fpm

The stock PHP fpm image with some added tools for use in local development.

# Versions

Currently, images are being built for:

| version | plain php | blackfire | xdebug | supervisor | alpine based |
|---------|-----------|-----------|--------|------------|--------------|
| 8.3     | ✔️        | ✔️        | ✔️     | ✔️         | ✔️           |
| 8.2     | ✔️        | ✔️        | ✔️     | ✔️         | ✔️           |
| 8.1     | ✔️        | ✔️        | ✔️     | ✔️         | ️            |
| 7.4     | ✔️        | ✔️        | ✔️     | ️          | ️            |
| 7.3     | ✔️        | ✔️        | ✔️     | ️          | ️            |
| 7.2     | ✔️        | ✔️        | ✔️     | ️          | ️            |
| 7.1     | ✔️        | ✔️        | ✔️     | ️          | ️            |
| 5.6     | ✔️        | ✔️        | ✔️     | ️          | ️            |

# Added PHP modules
* blackfire
* bz2
* gd
* iconv
* intl
* mysqli
* opcache
* pcntl
* pdo_mysql
* redis
* soap
* xdebug
* yaml
* zip

# Added tools:
* composer (v2) and composer1 (v1)
* exa
* git
* graphicsmagick
* imagemagick
* locales
* mariadb-client
* parallel
* rsync
* ssh
* sqlite
* unzip
* vim (removed from alpine images)
* zsh

# Supervisor
The supervisor image runs http://supervisord.org/