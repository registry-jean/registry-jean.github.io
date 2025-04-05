FROM ubuntu:20.04

# Infos sur le mainteneur
LABEL maintainer="josephjeanmardochee@gmail.com"

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Paris

# Mise à jour du système et installation des dépendances
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
    gnupg \
    wget \
    curl \
    lsb-release \
    ca-certificates \
    software-properties-common

# Ajout de la clé GPG officielle MariaDB
RUN curl -LsS https://mariadb.org/mariadb_release_signing_key.asc | gpg --dearmor -o /usr/share/keyrings/mariadb.gpg

# Ajout du dépôt MariaDB 10.11
RUN echo "deb [signed-by=/usr/share/keyrings/mariadb.gpg] http://mirror.23media.com/mariadb/repo/10.11/ubuntu $(lsb_release -cs) main" \
    > /etc/apt/sources.list.d/mariadb.list

# Installation de MariaDB
RUN apt-get update && \
    apt-get install -y mariadb-server mariadb-client

# Configuration des permissions
RUN mkdir -p /var/run/mysqld && \
    chown -R mysql:mysql /var/run/mysqld /var/lib/mysql && \
    chmod 755 /var/run/mysqld

# Exposition du port MariaDB
EXPOSE 3306

# Démarrage de MariaDB
CMD ["mysqld_safe"]
