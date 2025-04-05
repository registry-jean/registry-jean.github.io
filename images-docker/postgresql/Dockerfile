FROM ubuntu:20.04

# Infos sur le mainteneur
LABEL maintainer="josephjeanmardochee@gmail.com"

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Paris

RUN apt-get update && apt-get upgrade -y

# Installation des dépendances pour PostgreSQL
RUN apt-get install -y --no-install-recommends \
    wget \
    curl \
    gnupg

# Création du fichier de dépôt PostgreSQL
RUN sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'

# Importation de la clé GPG PostgreSQL
RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -

# Mise à jour et installation de PostgreSQL 16
RUN apt-get update && apt-get install -y postgresql-16 postgresql-client-16

# Configuration (facultatif, personnalisez postgresql.conf et pg_hba.conf)
# COPY postgresql.conf /etc/postgresql/16/main/postgresql.conf
# COPY pg_hba.conf /etc/postgresql/16/main/pg_hba.conf

# Gestion des permissions (PostgreSQL gère ses propres fichiers sous l'utilisateur postgres)
RUN chown -R postgres:postgres /var/lib/postgresql/

# Exposition du port PostgreSQL
EXPOSE 5432

# Changement d'utilisateur et démarrage du serveur PostgreSQL
USER postgres
CMD ["postgres", "-D", "/var/lib/postgresql/16/main"]