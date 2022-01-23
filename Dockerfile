FROM debian:stable-slim

ENV PGUSER=postgres
ENV PGPASSWORD=postgres

RUN apt-get update && apt-get install -qy \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common \
    gnupg2 \
    wget

RUN sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list' && \
    wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - && \
    apt-get update && \
    apt-get -qy install postgresql-client-13

RUN apt-get autoclean

