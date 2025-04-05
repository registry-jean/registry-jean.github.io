FROM ubuntu:20.04

# Infos sur le mainteneur
LABEL maintainer="josephjeanmardochee@gmail.com"

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Paris

RUN apt-get update && apt-get upgrade -y

# Installation des dépendances pour Nginx
RUN apt-get install -y --no-install-recommends \
    wget \
    curl \
    gnupg \
    lsb-release

# Ajout du dépôt officiel Nginx
RUN echo "deb http://nginx.org/packages/ubuntu `lsb_release -cs` nginx" >> /etc/apt/sources.list.d/nginx.list
RUN curl -fsSL https://nginx.org/keys/nginx_signing.key | gpg --dearmor -o /etc/apt/trusted.gpg.d/nginx_signing.gpg
RUN apt-get update

# Installation de Nginx
RUN apt-get install -y nginx

# Configuration (facultatif, personnalisez votre configuration Nginx)
# COPY nginx.conf /etc/nginx/nginx.conf
# COPY default /etc/nginx/sites-available/default

# Gestion des permissions (Nginx utilise généralement l'utilisateur www-data)
RUN chown -R www-data:www-data /var/www/html /var/log/nginx

# Exposition du port Nginx
EXPOSE 80 443

# Démarrage de Nginx
CMD ["nginx", "-g", "daemon off;"]