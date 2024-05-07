FROM php:8.2-fpm

ARG user
ARG uid

RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip \
    supervisor \
    nginx \
    build-essential \
    openssl

RUN docker-php-ext-install gd pdo pdo_mysql sockets

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

RUN useradd -G www-data,root -u $uid -d /home/$user $user
RUN mkdir -p /home/$user/.composer && \
    chown -R $user:$user /home/$user

WORKDIR /var/www

COPY ./openssl.cnf /etc/ssl/openssl.cnf

COPY composer.json composer.lock ./
RUN composer install --no-dev --optimize-autoloader --no-scripts

COPY . .

RUN chown -R $uid:$uid /var/www

COPY ./supervisord.conf /etc/supervisord.conf

CMD ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisord.conf"]

# ...
# WORKDIR /var/www
# 
# COPY ./openssl.cnf /etc/ssl/openssl.cnf
# 
# COPY ./php.ini /usr/local/etc/php/php.ini
# ...
