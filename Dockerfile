FROM ubuntu:20.04

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get -y -qq -o "Dpkg::Options::=--force-confdef" upgrade \
    && DEBIAN_FRONTEND=noninteractive apt-get -y -qq -o "Dpkg::Options::=--force-confdef" install --no-install-recommends \
    git \
    curl \
    nodejs \
    npm \
    && DEBIAN_FRONTEND=noninteractive apt-get -y -qq -o "Dpkg::Options::=--force-confdef" autoremove \
    && GIT_SSL_NO_VERIFY=true git clone https://github.com/UnicornTranscoder/UnicornLoadBalancer.git /UnicornLoadBalancer \
    && cd /UnicornLoadBalancer \
    && /usr/bin/npm config set strict-ssl false \
    && /usr/bin/npm install \
    && apt-get -y autoremove \
    && apt-get clean

ENV SERVER_PORT=3001 \
    SERVER_PUBLIC="http://127.0.0.1:3001/" \
    PLEX_HOST="127.0.0.1" \
    PLEX_PORT=32400 \
    PLEX_PATH_USR="/usr/lib/plexmediaserver/" \
    PLEX_PATH_SESSIONS="/var/lib/plexmediaserver/Library/Application Support/Plex Media Server/Cache/Transcode/Sessions" \
    DATABASE_MODE="sqlite" \
    DATABASE_SQLITE_PATH="/var/lib/plexmediaserver/Library/Application Support/Plex Media Server/Plug-in Support/Databases/com.plexapp.plugins.library.db" \
    DATABASE_POSTGRESQL_HOST= \
    DATABASE_POSTGRESQL_DATABASE= \
    DATABASE_POSTGRESQL_USER= \
    DATABASE_POSTGRESQL_PASSWORD= \
    DATABASE_POSTGRESQL_PORT=5432 \
    REDIS_HOST= \
    REDIS_PORT=6379 \
    REDIS_PASSWORD= \
    REDIS_DB=0 \
    CUSTOM_SCORES_TIMEOUT=10 \
    CUSTOM_IMAGE_PROXY="https://images.weserv.nl/" \
    CUSTOM_DOWNLOAD_FORWARD="false" \
    CUSTOM_SERVERS_LIST= 

VOLUME /Sessions
VOLUME /Databases
EXPOSE 3001
ENTRYPOINT ["/UnicornLoadBalancer", "--"]
CMD ["/usr/bin/npm start"]
