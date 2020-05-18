#!/bin/sh
#
# Purpose: UnicornLoadBalancer initialization script for Docker container

/bin/sh /UnicornLoadBalancer/update.sh
/bin/sh /UnicornLoadBalancer/env-check.sh
exec npm start --prefix /UnicornLoadBalancer