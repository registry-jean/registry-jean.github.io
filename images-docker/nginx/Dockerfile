FROM ubuntu:20.04

# Infos sur le mainteneur
LABEL maintainer="josephjeanmardochee@gmail.com"

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Paris

RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y --no-install-recommends wget curl gnupg lsb-release && \
    echo "deb http://nginx.org/packages/ubuntu $(lsb_release -cs) nginx" >> /etc/apt/sources.list.d/nginx.list && \
    curl -fsSL https://nginx.org/keys/nginx_signing.key | gpg --dearmor -o /etc/apt/trusted.gpg.d/nginx_signing.gpg && \
    apt-get update && apt-get install -y nginx && \
    chown -R www-data:www-data /var/www/html /var/log/nginx && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

EXPOSE 80 443
CMD ["nginx", "-g", "daemon off;"]