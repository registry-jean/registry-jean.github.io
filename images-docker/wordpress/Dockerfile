# Utilise Ubuntu 20.04 comme base
FROM ubuntu:20.04

# Infos sur le mainteneur
LABEL maintainer="josephjeanmardochee@gmail.com"

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Paris 

RUN apt-get update && apt-get upgrade -y

# Installation des dépendances pour WordPress
RUN apt-get install -y --no-install-recommends \
    wget \
    curl \
    gnupg \
    apache2 \
    libapache2-mod-php \
    php-mysql \
    php-fpm \
    php-cli \
    php-gd \
    php-xml \
    php-mbstring \
    php-intl \
    php-zip \
    unzip

# Téléchargement et installation de WordPress
RUN wget https://wordpress.org/latest.tar.gz && \
    tar -xzvf latest.tar.gz -C /var/www/html/ && \
    rm latest.tar.gz

# Configuration d'Apache
RUN a2enmod rewrite
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