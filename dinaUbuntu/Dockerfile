FROM ubuntu:18.04

WORKDIR /root

RUN apt-get update && apt-get install -y vim git nginx ca-certificates apt-transport-https software-properties-common

RUN add-apt-repository ppa:ondrej/php -y
RUN apt-get update -y