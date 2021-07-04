FROM centos:7

RUN yum -y update; yum clean all

# ADD the ngix and PHP dependent repository
COPY nginx/nginx.repo /etc/yum.repos.d/nginx.repo

# Installing nginx 
RUN yum -y install nginx git
COPY nginx/default.conf /etc/nginx/conf.d/default.conf

# nginx System
RUN systemctl enable nginx

# Install PHP (7.4)
RUN yum -y install http://rpms.remirepo.net/enterprise/remi-release-7.rpm

# 기존 활성화 된 php 5 버전 레포를 끄고 php7.4 활성화 후 설치
RUN yum-config-manager --disable remi-php54
RUN yum-config-manager --enable remi-php74
RUN yum -y install php-fpm
RUN yum -y install php php-mcrypt php-cli php-gd php-curl php-mysql php-ldap php-zip php-fileinfo

# PHP System
RUN systemctl enable php-fpm
COPY php-fpm/www.conf /etc/php-fpm.d/www.conf

# Composer install
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer

# Git config
RUN git config --global user.name "{name}"
RUN git config --global user.email "{email}"

# Git Update
RUN rpm -Uvh http://opensource.wandisco.com/centos/7/git/x86_64/wandisco-git-release-7-2.noarch.rpm
RUN yum -y update git

# Port 80 
EXPOSE 80

# Workdirectory
WORKDIR /home/project

CMD ["/usr/sbin/init"]