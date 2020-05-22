FROM plexinc/pms-docker:1.19.3.2843-e3c1f7bcd
# https://github.com/magn2o/UnicornDockerUnofficial/blob/master/Dockerfile

RUN \
# Update and get dependencies
    curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
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

ENV DATABASE_MODE="sqlite" \
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
    chmod +x /installUnicornLoadBalancer.sh && \
    chmod +x /installUnicornFFMPEG.sh && \
    /installUnicornLoadBalancer.sh && \
    /installUnicornFFMPEG.sh