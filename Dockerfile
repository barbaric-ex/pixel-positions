FROM php:8.4-cli

RUN apt-get update && apt-get install -y \
    unzip \
    zip \
    curl \
    git \
    libsqlite3-dev \
    libzip-dev \
    && docker-php-ext-install pdo pdo_sqlite zip

WORKDIR /var/www

COPY . .

RUN curl -fsSL https://getcomposer.org/installer | php -- \
    --install-dir=/usr/local/bin \
    --filename=composer

RUN composer install --no-dev --optimize-autoloader --no-interaction

RUN chmod -R 775 storage bootstrap/cache

EXPOSE 10000

CMD php artisan serve --host=0.0.0.0 --port=10000
