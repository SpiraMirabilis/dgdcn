FROM ubuntu:16.04
MAINTAINER Jangshant Singh <mail@jangshant.com>

ENV DEBIAN_FRONTEND noninteractive
## Install php nginx mysql supervisor drush git
RUN apt update && \
    apt upgrade && \
    apt install -y php-fpm php-cli php-gd php-mcrypt php-mysql php-curl \
                       nginx \
                       curl \
		       supervisor && \
    echo "mysql-server mysql-server/root_password password" | debconf-set-selections && \
    echo "mysql-server mysql-server/root_password_again password" | debconf-set-selections && \
    apt install -y mysql-server && \
    apt install -y libpng12-dev libjpeg-dev libpq-dev && \
    apt install -y drush && \
    apt install -y git && \
    rm -rf /var/lib/apt/lists/*
    
  
