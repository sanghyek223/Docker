FROM php:8.1-fpm

# step 1
WORKDIR /home
RUN apt-get update            
RUN apt-get install -y curl

# step 2
RUN curl -sS https://getcomposer.org/installer | php  
RUN mv composer.phar /usr/bin/composer

# step 3
RUN apt-get update && apt-get install -y \
    libpq-dev \
    procps \
    git \
    zip \
    unzip \
    vim \
    && pecl install xdebug \
    && docker-php-ext-install pdo_mysql opcache \
    && docker-php-ext-enable xdebug

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - \
    && apt-get install -y nodejs \
    && npm install -g npm

RUN git config --global user.name "{name}"
RUN git config --global user.email "{email}"

RUN apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# step 4 
RUN ["/bin/bash", "-c", "echo PATH=$PATH:~/.composer/vendor/bin/ >> ~/.bashrc"]
RUN ["/bin/bash", "-c", "source ~/.bashrc"]

# step 5 
EXPOSE 9000
CMD ["php-fpm"]