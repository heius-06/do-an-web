FROM php:7.4.3-fpm

RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip

RUN apt-get clean && rm -rf /var/lib/apt/lists/*

RUN pecl install apcu-5.1.20 && docker-php-ext-enable apcu

RUN docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd mysqli

WORKDIR /var/www

COPY . /var/www/

RUN chown -R www-data:www-data /var/www

# CMD ["/usr/local/bin/start"]
CMD ["php-fpm"]
