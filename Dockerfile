FROM php:7.3-fpm

RUN apt-get update && apt-get install -y git wget curl libxml2-dev libssl-dev libzip-dev zlib1g-dev apt-transport-https lsb-release ca-certificates libpng-dev libturbojpeg0 libjpeg-dev \
    && wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg \
    && echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/php.list \
    && docker-php-ext-configure gd --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install zip mbstring iconv xml pdo_mysql phar gd exif \
    && wget https://getcomposer.org/composer.phar -O /usr/local/bin/composer \
    && chmod a+rx /usr/local/bin/composer
