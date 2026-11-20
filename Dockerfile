FROM php:8.2-apache

# Instalar extensões necessárias para conexão com MySQL/MariaDB
RUN docker-php-ext-install mysqli pdo pdo_mysql && docker-php-ext-enable mysqli

# Habilitar mod_rewrite do Apache
RUN a2enmod rewrite

# Copiar os arquivos da aplicação
COPY janine_comercios/ /var/www/html/

# Ajustar permissões
RUN chown -R www-data:www-data /var/www/html

EXPOSE 80
