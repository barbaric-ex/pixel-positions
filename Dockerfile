FROM php:8.4-cli

# System dependencies + PHP extensions
RUN apt-get update && apt-get install -y \
    unzip \
    zip \
    curl \
    git \
    libsqlite3-dev \
    libzip-dev \
    && docker-php-ext-install pdo pdo_sqlite zip

# Working directory
WORKDIR /var/www

# Copy project
COPY . .

# Install Composer
RUN curl -fsSL https://getcomposer.org/installer | php -- \
    --install-dir=/usr/local/bin \
    --filename=composer

# Install dependencies
RUN composer install --no-dev --optimize-autoloader --no-interaction

# Permissions for Laravel
RUN chmod -R 775 storage bootstrap/cache

# Expose Render port
EXPOSE 10000

# IMPORTANT: serve /public folder (fix for 404 issue)
CMD php -S 0.0.0.0:10000 -t public
