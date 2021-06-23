FROM php:7.4-fpm

# step 1
WORKDIR /home
RUN apt-get update            
RUN apt-get install -y curl

# step 2
RUN curl -sS https://getcomposer.org/installer | php  
RUN mv composer.phar /usr/bin/composer

# step 3
RUN apt-get install -y zlib1g-dev && apt-get install -y libzip-dev
RUN docker-php-ext-install zip

# step 4 
RUN composer global require laravel/installer
RUN ["/bin/bash", "-c", "echo PATH=$PATH:~/.composer/vendor/bin/ >> ~/.bashrc"]
RUN ["/bin/bash", "-c", "source ~/.bashrc"]

# step 5 
EXPOSE 9000
CMD ["php-fpm"]