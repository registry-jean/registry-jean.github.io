FROM ubuntu:20.04

# Infos sur le mainteneur
LABEL maintainer="josephjeanmardochee@gmail.com"

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Paris

RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y wget curl gnupg ca-certificates lsb-release && \
    curl -fsSL https://repo.mysql.com/RPM-GPG-KEY-mysql-2022 | gpg --dearmor -o /usr/share/keyrings/mysql.gpg && \
    echo "deb [signed-by=/usr/share/keyrings/mysql.gpg] http://repo.mysql.com/apt/ubuntu focal mysql-8.0" > /etc/apt/sources.list.d/mysql.list && \
    apt-get update && apt-get install -y mysql-server && \
    chown -R mysql:mysql /var/lib/mysql && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

EXPOSE 3306
CMD ["/usr/sbin/mysqld", "--user=mysql"]