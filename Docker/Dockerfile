# https://github.com/codemix/yii2-dockerbase/blob/master/2.0/apache/Dockerfile
FROM php:7.0-fpm

RUN apt-get update && apt-get install -y \
        curl \
        unzip \
        git \
        ssh \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng12-dev \
        libmcrypt-dev \
        libicu-dev \
        libcurl4-openssl-dev \
        --no-install-recommends \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-install -j$(nproc) opcache \
    && docker-php-ext-install -j$(nproc) mcrypt \
    && docker-php-ext-install -j$(nproc) mbstring \
    && docker-php-ext-install -j$(nproc) zip \
    && docker-php-ext-install -j$(nproc) mysqli \
    && docker-php-ext-install -j$(nproc) pdo_mysql \
    && docker-php-ext-install -j$(nproc) intl \
    && docker-php-ext-install -j$(nproc) bcmath \
    && docker-php-ext-install -j$(nproc) pcntl \
    && rm -r /var/lib/apt/lists/*

RUN pecl install xdebug

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && composer global require --no-progress "fxp/composer-asset-plugin:~1.3.0"

RUN curl -sS https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -o /usr/local/bin/wp

RUN chmod 744 /usr/local/bin/wp 

COPY Docker/php/docker-entrypoint.sh /docker-entrypoint.sh
COPY Docker/php/docker-run.sh /docker-run.sh

RUN chmod 744 /docker-entrypoint.sh
RUN chmod 744 /docker-run.sh

RUN usermod -u ${DOCKER_USER_ID:-1000} www-data \
    && mkdir -p ${APP_BASE_DIR:-/var/www}

WORKDIR ${APP_BASE_DIR:-/var/www}

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["/docker-run.sh"]
