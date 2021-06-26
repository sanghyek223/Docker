FROM centos/systemd

RUN yum -y update
RUN yum -y install httpd; yum clean all; systemctl enable httpd.service

EXPOSE 80

# Install EPEL Repo
RUN rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm \
    && rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm

# Install PHP (5.4)
RUN yum -y install php
RUN yum -y install php php-mcrypt php-cli php-gd php-curl php-mysql php-ldap php-zip php-fileinfo

# Install Git
RUN yum -y install git
RUN git config --global user.name "{name}"
RUN git config --global user.email "{email}"

# Git Update
RUN rpm -Uvh http://opensource.wandisco.com/centos/7/git/x86_64/wandisco-git-release-7-2.noarch.rpm
RUN yum -y update git

# Git Update
RUN rpm -Uvh http://opensource.wandisco.com/centos/7/git/x86_64/wandisco-git-release-7-2.noarch.rpm
RUN yum update git

# # MySQL설치
# RUN yum -y install http://dev.mysql.com/get/mysql57-community-release-el7-11.noarch.rpm
# RUN yum -y install mysql-community-server

# Start Apache
VOLUME ["/sys/fs/cgroup"]
CMD ["/usr/sbin/init"]