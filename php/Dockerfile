# берём образ php 7.2
FROM php:7.2-fpm

# устанавливаем xdebug-2.9.8
# для третьей версии нужны другие настройки в xdebug.ini
RUN pecl install xdebug-2.9.8 \
# включаем расширение xdebug
    && docker-php-ext-enable xdebug
