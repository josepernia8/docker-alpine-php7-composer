FROM alpine:3.8
LABEL Maintainer="José Pernía <josepernia91@gmail.com>" \
      Description="Lightweight container based on Alpine Linux for using popular PHP Frameworks with most needed PHP Extensions, Composer and MySQL Client."

# Install packages
RUN apk --no-cache add php7 php7-fpm php7-mysqli php7-json php7-openssl php7-curl \
    php7-zlib php7-xml php7-phar php7-intl php7-dom php7-xmlreader php7-ctype \
    php7-mbstring php7-gd curl php7-simplexml php7-fileinfo php7-tokenizer \
    php7-xmlwriter php7-memcached php7-imagick mysql-client php7-pdo php7-pdo_mysql php-zip

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

WORKDIR /var/www/html

ENTRYPOINT ["docker-php-entrypoint"]
CMD ["php", "-a"]