FROM ubuntu:20.04

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get -y upgrade \
    && DEBIAN_FRONTEND=noninteractive apt-get -y install --no-install-recommends \
    git \
    curl \
    nodejs \
    npm \
    && DEBIAN_FRONTEND=noninteractive apt-get -y autoremove \
    && git clone https://github.com/UnicornTranscoder/UnicornLoadBalancer.git /UnicornLoadBalancer \
    && cd /UnicornLoadBalancer \
    && /usr/bin/npm install \
    && apt-get -y autoremove \
    && apt-get clean \
    chmod +x /run.sh \
    && chmod +x /UnicornLoadBalancer/update.sh

ENV SERVER_PORT=3001 \
    SERVER_PUBLIC="http://127.0.0.1:3001/" \
    PLEX_HOST="127.0.0.1" \
    PLEX_PORT=32400 \
    PLEX_PATH_USR="/usr/lib/plexmediaserver/" \
    PLEX_PATH_SESSIONS="/Sessions" \
    DATABASE_MODE="sqlite" \
    DATABASE_SQLITE_PATH="/Databases/com.plexapp.plugins.library.db" \
    DATABASE_POSTGRESQL_HOST= \
    DATABASE_POSTGRESQL_DATABASE= \
    DATABASE_POSTGRESQL_USER= \
    DATABASE_POSTGRESQL_PASSWORD= \
    DATABASE_POSTGRESQL_PORT=5432 \
    #REDIS_HOST= \
    #REDIS_PORT=6379 \
    #REDIS_PASSWORD= \
    #REDIS_DB=0 \
    CUSTOM_SCORES_TIMEOUT=10 \
    CUSTOM_IMAGE_PROXY="https://images.weserv.nl/" \
    CUSTOM_DOWNLOAD_FORWARD="false" \
    CUSTOM_SERVERS_LIST= 

VOLUME /usr/lib/plexmediaserver/
VOLUME /Sessions
VOLUME /Databases
EXPOSE 3001
CMD ["run.sh"]
