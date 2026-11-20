FROM php:8.2-apache

# Suprimir aviso de ServerName do Apache
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

# Habilitar output buffering no PHP para evitar problemas de headers already sent
RUN echo "output_buffering = 4096" >> /usr/local/etc/php/conf.d/docker-php-custom.ini

# Instalar extensões necessárias para conexão com MySQL/MariaDB
RUN docker-php-ext-install mysqli pdo pdo_mysql && docker-php-ext-enable mysqli

# Habilitar mod_rewrite do Apache
RUN a2enmod rewrite

# Copiar os arquivos da aplicação
COPY janine_comercios/ /var/www/html/

# Ajustar permissões
RUN chown -R www-data:www-data /var/www/html

EXPOSE 80
