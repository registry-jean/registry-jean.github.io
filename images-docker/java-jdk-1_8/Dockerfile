FROM ubuntu:20.04

# Infos sur le mainteneur
LABEL maintainer="josephjeanmardochee@gmail.com"

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Paris
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64
ENV PATH $PATH:$JAVA_HOME/bin

RUN apt-get update && apt-get upgrade -y

# Installation du JDK 1.8 OpenJDK
RUN apt-get install -y --no-install-recommends openjdk-8-jdk

# Gestion des permissions (généralement pas nécessaire pour le JDK lui-même)

# Nettoyage
RUN apt-get autoremove -y && apt-get clean

CMD ["java", "-version"]