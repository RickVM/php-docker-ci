# Create a base image
FROM php:7.2.26-apache-buster AS base

LABEL maintainer="rick.van.melis@peercode.nl"

ENV PHP_OPCACHE_VALIDATE_TIMESTAMPS=0 \
    PHP_OPCACHE_MAX_ACCELERATED_FILES=10000 \
    PHP_OPCACHE_MEMORY_CONSUMPTION=128

RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    default-mysql-client \
    libmagickwand-dev \
     unzip \
    imagemagick 

RUN pecl install imagick xdebug
RUN docker-php-ext-install sockets bcmath gd zip pdo_mysql   
RUN  docker-php-ext-enable \
            imagick \
            xdebug \
            opcache 
            
RUN a2enmod rewrite

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN apt-get clean && rm -r /var/lib/apt/lists/*