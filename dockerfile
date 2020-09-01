# Create a base image
# 16.04, 18.04, 20.04
ARG VERSION=
FROM php:${VERSION} AS base

LABEL maintainer="rick.van.melis@peercode.nl"

ENV TZ=Europe/Amsterdam

COPY --from=composer /usr/bin/composer /usr/bin/composer

RUN apt-get update -y && apt-get install -y \
    libpng-dev \
    unzip \
    subversion \
    rsync \
    git

RUN docker-php-ext-configure gd
RUN docker-php-ext-install gd zip

# FROM base AS debug
# RUN pecl install imagick xdebug
# RUN  docker-php-ext-enable \
#             xdebug

