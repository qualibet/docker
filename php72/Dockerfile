FROM php:7.2-fpm

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    curl \
    libmemcached-dev \
    libz-dev \
    libpq-dev \
    libjpeg-dev \
    libpng-dev \
    libfreetype6-dev \
    libssl-dev \
    libmcrypt-dev \
    zip \
  && rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-install calendar pdo_mysql \
    && docker-php-ext-install pcntl zip \
    && docker-php-ext-configure gd \
        --enable-gd-native-ttf \
        --with-jpeg-dir=/usr/lib \
        --with-freetype-dir=/usr/include/freetype2 && \
        docker-php-ext-install gd

RUN pecl install redis xdebug \
    && docker-php-ext-enable redis xdebug

RUN pecl install mongodb && \
    docker-php-ext-enable mongodb

ADD --chown=www-data:www-data  . /var/www/html

RUN php -r "readfile('https://getcomposer.org/installer');" > composer-setup.php && \
	php composer-setup.php && php -r "unlink('composer-setup.php');"  && \
	mv composer.phar /usr/local/bin/composer