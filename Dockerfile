FROM php:8.1-fpm

# Arguments defined in docker-compose.yml
# ARG user
# ARG uid

RUN whoami

# Install system dependencies
RUN apt-get update && apt-get install -y \
    sudo \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip

# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Install PHP extensions
RUN docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd

# Get latest Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Create system user to run Composer and Artisan Commands
# RUN useradd -G www-data,root -u $uid -d /home/$user $user

# Copy existing application directory contents
# COPY . /var/www

RUN echo $user
RUN mkdir -p /home/$user/.composer && \
    chown -R $user:$user /home/$user

# Install xdebug
RUN pecl install xdebug \
    && docker-php-ext-enable xdebug

# Install Redis
RUN pecl install redis && docker-php-ext-enable redis
# Set working directory
WORKDIR /var/www

USER $user

