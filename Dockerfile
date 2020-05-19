FROM plexinc/pms-docker
# https://github.com/magn2o/UnicornDockerUnofficial/blob/master/Dockerfile

RUN \
# Update and get dependencies
    curl -sL https://deb.nodesource.com/setup_14.x | bash - && \
    apt-get update && \
    apt-get install -y \
      nodejs \
      git \
      iptables \
    && \

# Cleanup
    apt-get -y autoremove && \
    apt-get -y clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/* && \
    rm -rf var/tmp/*

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
    REDIS_HOST= \
    REDIS_PORT=6379 \
    REDIS_PASSWORD= \
    REDIS_DB=0 \
    CUSTOM_SCORES_TIMEOUT=10 \
    CUSTOM_IMAGE_PROXY="https://images.weserv.nl/" \
    CUSTOM_DOWNLOAD_FORWARD="false" \
    CUSTOM_SERVERS_LIST= 

EXPOSE 3001/tcp

COPY root/ /

RUN \
# Save versions and install
    /installUnicornLoadBalancer.sh && \
    /installUnicornFFMPEG.sh