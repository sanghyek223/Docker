FROM php:7-fpm

# php-mysqli pdo install
RUN docker-php-ext-install mysqli pdo pdo_mysql

# php-gd install
RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd 
