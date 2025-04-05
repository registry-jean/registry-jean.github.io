FROM ubuntu:20.04

# Infos sur le mainteneur
LABEL maintainer="josephjeanmardochee@gmail.com"

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Paris

RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y wget curl gnupg && \
    curl -fsSL https://www.postgresql.org/media/keys/ACCC4CF8.asc | gpg --dearmor -o /usr/share/keyrings/postgres.gpg && \
    echo "deb [signed-by=/usr/share/keyrings/postgres.gpg] http://apt.postgresql.org/pub/repos/apt focal-pgdg main" > /etc/apt/sources.list.d/pgdg.list && \
    apt-get update && apt-get install -y postgresql-16 postgresql-client-16 && \
    chown -R postgres:postgres /var/lib/postgresql && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

EXPOSE 5432
USER postgres
CMD ["postgres", "-D", "/var/lib/postgresql/16/main"]