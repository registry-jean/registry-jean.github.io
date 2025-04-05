FROM ubuntu:20.04

# Infos sur le mainteneur
LABEL maintainer="josephjeanmardochee@gmail.com"

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Paris

RUN apt-get update && apt-get upgrade -y

# Installation des dépendances pour Cassandra
RUN apt-get install -y --no-install-recommends \
    wget \
    curl \
    gnupg

# Ajout de la clé et du dépôt Apache Cassandra
RUN apt-get update && apt-get install -y apt-transport-https
RUN curl https://cassandra.apache.org/debian/cassandra-4.1.asc | gpg --dearmor > /etc/apt/trusted.gpg.d/cassandra.gpg
RUN echo "deb https://debian.cassandra.apache.org 41x main" > /etc/apt/sources.list.d/cassandra.sources.list

# Installation de Cassandra
RUN apt-get update && apt-get install -y cassandra

# Configuration (facultatif, personnalisez selon vos besoins dans cassandra.yaml)
# COPY cassandra.yaml /etc/cassandra/cassandra.yaml

# Gestion des permissions (Cassandra gère généralement ses propres fichiers)
# Nous nous assurons que les répertoires de données appartiennent à l'utilisateur cassandra
RUN chown -R cassandra:cassandra /var/lib/cassandra /var/log/cassandra

# Exposition des ports Cassandra
EXPOSE 7000 7001 7199 9042 9160

# Démarrage de Cassandra
CMD ["/bin/bash", "-c", "cassandra -f"]