# Use official PHP image with Apache
FROM php:8.2-apache

# Enable Apache mod_rewrite (common for PHP apps)
RUN a2enmod rewrite

# Set working directory inside the container
WORKDIR /var/www/html

# Copy app code into the container
COPY . /var/www/html

# Optional: Install PHP extensions
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Expose port 80
EXPOSE 80
