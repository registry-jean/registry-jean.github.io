# Utilise Ubuntu 20.04 comme base
FROM ubuntu:20.04

# Infos sur le mainteneur
LABEL maintainer="josephjeanmardochee@gmail.com"

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Paris

# Ajout du dépôt PHP 8.1 (si pas déjà dispo dans base)
RUN apt-get update && apt-get install -y software-properties-common \
    && add-apt-repository ppa:ondrej/php -y

# Installation Apache, PHP 8.1 et extensions
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
    wget \
    curl \
    unzip \
    apache2 \
    libapache2-mod-php8.1 \
    php8.1-cli \
    php8.1-fpm \
    php8.1-mysql \
    php8.1-gd \
    php8.1-xml \
    php8.1-mbstring \
    php8.1-intl \
    php8.1-zip && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Activation du module rewrite
RUN a2enmod rewrite

# Téléchargement et installation de WordPress 6.2.2
RUN wget https://wordpress.org/wordpress-6.2.2.tar.gz && \
    tar -xzf wordpress-6.2.2.tar.gz && \
    mv wordpress/* /var/www/html/ && \
    rm -rf wordpress wordpress-6.2.2.tar.gz

# Suppression de l’index par défaut
RUN rm -f /var/www/html/index.html

# Ajout de la configuration Apache personnalisée (si fournie)
COPY 000-default.conf /etc/apache2/sites-available/000-default.conf

# Configuration des droits
RUN chown -R www-data:www-data /var/www/html && \
    find /var/www/html -type d -exec chmod 755 {} \; && \
    find /var/www/html -type f -exec chmod 644 {} \;

WORKDIR /var/www/html

EXPOSE 80

CMD ["apachectl", "-D", "FOREGROUND"]
