# Utilise Ubuntu 20.04 comme base
FROM ubuntu:20.04

# Infos sur le mainteneur
LABEL maintainer="ton-email@example.com"

# Variables d’environnement
ENV DEBIAN_FRONTEND=noninteractive

# Mise à jour & installation des paquets nécessaires
RUN apt-get update && apt-get install -y \
    nginx \
    php \
    php-fpm \
    php-mysql \
    php-curl \
    php-gd \
    php-mbstring \
    php-xml \
    php-zip \
    php-soap \
    php-intl \
    mysql-client \
    curl \
    unzip \
    supervisor \
    wget \
    vim \
    && apt-get clean

# Télécharger WordPress
RUN curl -O https://wordpress.org/latest.tar.gz && \
    tar -xzf latest.tar.gz && \
    mv wordpress /var/www/html && \
    rm latest.tar.gz

# Définir les permissions
RUN chown -R www-data:www-data /var/www/html && \
    chmod -R 755 /var/www/html

# Copie des fichiers de config
COPY nginx.conf /etc/nginx/sites-available/default
COPY php-fpm.conf /etc/php/7.4/fpm/php-fpm.conf
COPY supervisord.conf /etc/supervisord.conf

# Expose le port HTTP
EXPOSE 80

# Commande de démarrage
CMD ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisord.conf"]