FROM php:8.4-cli

# System dependencies + PHP extensions + Node.js (ZA VITE)
RUN apt-get update && apt-get install -y \
    unzip \
    zip \
    curl \
    git \
    libsqlite3-dev \
    libzip-dev \
    nodejs \
    npm \
    && docker-php-ext-install pdo pdo_sqlite zip

# Working directory
WORKDIR /var/www

# Copy project
COPY . .

# Install Composer
RUN curl -fsSL https://getcomposer.org/installer | php -- \
    --install-dir=/usr/local/bin \
    --filename=composer

# Install PHP dependencies
RUN composer install --no-dev --optimize-autoloader --no-interaction

# Install Node dependencies + build Vite assets
RUN npm install
RUN npm run build

# Permissions for Laravel
RUN chmod -R 775 storage bootstrap/cache

# Expose Render port
EXPOSE 10000

# Start Laravel server
CMD php -S 0.0.0.0:10000 -t public
