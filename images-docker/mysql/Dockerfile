FROM ubuntu:20.04

# Infos sur le mainteneur
LABEL maintainer="josephjeanmardochee@gmail.com"

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Paris

RUN apt-get update && apt-get upgrade -y

# Installation des dépendances pour MySQL
RUN apt-get install -y --no-install-recommends \
    wget \
    curl \
    gnupg

# Téléchargement et ajout de la clé GPG MySQL
RUN wget https://dev.mysql.com/doc/refman/8.0/en/gpg-key.asc
RUN apt-key add gpg-key.asc
RUN rm gpg-key.asc

# Ajout du dépôt APT MySQL 8.0
RUN echo "deb http://repo.mysql.com/apt/ubuntu/ focal mysql-8.0" >> /etc/apt/sources.list.d/mysql.list
RUN echo "deb-src http://repo.mysql.com/apt/ubuntu/ focal mysql-8.0" >> /etc/apt/sources.list.d/mysql.list

# Mise à jour et installation de MySQL Server
RUN apt-get update && apt-get install -y mysql-server

# Configuration (facultatif, personnalisez my.cnf)
# COPY my.cnf /etc/mysql/my.cnf

# Gestion des permissions (MySQL gère ses propres fichiers sous l'utilisateur mysql)
RUN chown -R mysql:mysql /var/lib/mysql

# Exposition du port MySQL
EXPOSE 3306

# Démarrage de MySQL (la configuration initiale se fera au premier démarrage)
CMD ["/usr/sbin/mysqld", "--user=mysql"]