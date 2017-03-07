FROM php:7.1-apache

RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng12-dev \
        libicu-dev \
     	libxml2-dev \
        libcurl4-openssl-dev \
        libmagickwand-dev \
        php5-mysql \
        phpunit \
        git \
        zip \
        unzip

RUN docker-php-ext-install -j$(nproc) iconv intl xml soap mcrypt opcache pdo pdo_mysql mysqli mbstring curl \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd

RUN pecl install imagick \
    && docker-php-ext-enable imagick

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN a2enmod rewrite

EXPOSE 80
