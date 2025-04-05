FROM ubuntu:20.04

LABEL maintainer="josephjeanmardochee@gmail.com"

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Paris

RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
    apt-transport-https \
    wget \
    curl \
    gnupg \
    lsb-release \
    openjdk-11-jre-headless \
    ca-certificates && \
    curl https://downloads.apache.org/cassandra/KEYS | gpg --dearmor -o /etc/apt/trusted.gpg.d/cassandra.gpg && \
    echo "deb https://debian.cassandra.apache.org 41x main" > /etc/apt/sources.list.d/cassandra.sources.list && \
    apt-get update && \
    apt-get install -y cassandra && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

EXPOSE 7000 7001 7199 9042 9160

# Utiliser l'utilisateur cassandra
USER cassandra

CMD ["cassandra", "-f"]