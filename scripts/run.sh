#!/bin/sh
#
# Purpose: UnicornLoadBalancer initialization script for Docker container

/bin/sh /scripts/update.sh
/bin/sh /scripts/env-check.sh
exec npm start --prefix /UnicornLoadBalancer