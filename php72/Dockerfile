FROM php:7.2-fpm

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    curl \
    git \
    libmemcached-dev \
    libz-dev \
    libpq-dev \
    libjpeg-dev \
    libpng-dev \
    libfreetype6-dev \
    libssl-dev \
    libmcrypt-dev \
    zip \
    libgpgme-dev \
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

RUN pecl install gnupg \
    && docker-php-ext-enable gnupg

ARG username=dev
ARG userid=1000

RUN groupadd -g $userid $username && \
    useradd -r -u $userid -g $username $username && \
    mkdir -p /home/$username && \
    chown $userid:$userid /home/$username

ADD --chown=dev:dev  . /var/www/html

ARG GITHUB_TOKEN
RUN php -r "readfile('https://getcomposer.org/installer');" > composer-setup.php && \
	php composer-setup.php && php -r "unlink('composer-setup.php');"  && \
	mv composer.phar /usr/local/bin/composer

USER $userid:$userid

RUN /usr/local/bin/composer config --global github-oauth.github.com $GITHUB_TOKEN

RUN echo 'alias ll="ls -lah"' >> ~/.bashrc