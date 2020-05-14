FROM ubuntu:18.04

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    git \
    curl \
    && curl -sL https://deb.nodesource.com/setup_14.x | bash - \
    && apt-get install -y nodejs \
    && git clone https://github.com/UnicornTranscoder/UnicornLoadBalancer.git /UnicornLoadBalancer \
    && cd /UnicornLoadBalancer \
    && npm install \
    && npm start \
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
    CUSTOM_SCORES_TIMEOUT=10

EXPOSE 3001
ENTRYPOINT ["/UnicornLoadBalancer", "--"]
CMD ["/usr/bin/npm start"]
