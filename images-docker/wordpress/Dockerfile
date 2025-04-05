# Utilise Ubuntu 20.04 comme base
FROM ubuntu:20.04

# Infos sur le mainteneur
LABEL maintainer="josephjeanmardochee@gmail.com"

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Paris

RUN apt-get update && apt-get upgrade -y

# Installation des dépendances nécessaires et de PHP 8.1
RUN apt-get install -y --no-install-recommends \
    wget \
    curl \
    gnupg \
    apache2 \
    libapache2-mod-php8.1 \
    php8.1-mysql \
    php8.1-fpm \
    php8.1-cli \
    php8.1-gd \
    php8.1-xml \
    php8.1-mbstring \
    php8.1-intl \
    php8.1-zip \
    unzip

# Activation des modules Apache nécessaires
RUN a2enmod rewrite

# Téléchargement et extraction de WordPress 6.2.2
RUN wget https://wordpress.org/wordpress-6.2.2.tar.gz && \
    tar -xzvf wordpress-6.2.2.tar.gz -C /var/www/html/ && \
    rm wordpress-6.2.2.tar.gz

# Renommage du répertoire WordPress
RUN mv /var/www/html/wordpress/* /var/www/html/ && \
    rm -rf /var/www/html/wordpress

# Configuration de l'hôte virtuel Apache par défaut
COPY 000-default.conf /etc/apache2/sites-available/000-default.conf
RUN a2ensite 000-default.conf
RUN a2dissite 000-default.conf

# Configuration des permissions (ajustez selon vos besoins)
RUN chown -R www-data:www-data /var/www/html/
RUN find /var/www/html/ -type d -exec chmod 755 {} +
RUN find /var/www/html/ -type f -exec chmod 644 {} +
RUN chown -R www-data:www-data /var/log/apache2/

# Configuration PHP (facultatif, personnalisez selon vos besoins)
# COPY php.ini /usr/local/etc/php/

# Nettoyage
RUN apt-get autoremove -y && apt-get clean

WORKDIR /var/www/html

EXPOSE 80

CMD ["apache2-foreground"]