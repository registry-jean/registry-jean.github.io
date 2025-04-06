FROM ubuntu:20.04

LABEL maintainer="josephjeanmardochee@gmail.com"

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Paris

# Dépendances système
RUN apt-get update && apt-get install -y --no-install-recommends \
    gnupg \
    wget \
    curl \
    lsb-release \
    ca-certificates \
    software-properties-common

# Ajouter la clé GPG publique pour le dépôt MySQL
RUN gpg --keyserver keyserver.ubuntu.com --recv-keys B7B3B788A8D3785C && \
    gpg --export B7B3B788A8D3785C | gpg --dearmor -o /usr/share/keyrings/mysql.gpg

# Ajouter le dépôt MySQL
RUN echo "deb [signed-by=/usr/share/keyrings/mysql.gpg] http://repo.mysql.com/apt/ubuntu focal mysql-8.0" > /etc/apt/sources.list.d/mysql.list

# Installer MySQL
RUN apt-get update && apt-get install -y mysql-server && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Configuration des variables d'environnement
ENV MYSQL_ROOT_PASSWORD=rootpassword
ENV MYSQL_DATABASE=myapp_db
ENV MYSQL_USER=myapp_user
ENV MYSQL_PASSWORD=myapp_password

# Copie du script d'initialisation
COPY init.sql /docker-entrypoint-initdb.d/init.sql

# Créer un volume pour persister les données MySQL
VOLUME ["/var/lib/mysql"]

EXPOSE 3306

# Démarrage de MySQL en foreground
CMD ["/usr/sbin/mysqld", "--user=mysql"]