FROM php:8.2-fpm

# Встановлюємо необхідні залежності
RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip

# Встановлюємо PHP розширення
RUN docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd

# Встановлюємо Composer
COPY --from=composer:2.6 /usr/bin/composer /usr/bin/composer

# Встановлюємо робочу директорію
WORKDIR /var/www

# Копіюємо файли проекту
COPY . /var/www

# Встановлюємо права
RUN chown -R www-data:www-data /var/www

# Відкриваємо порт для PHP-FPM
EXPOSE 9000

CMD ["php-fpm"]