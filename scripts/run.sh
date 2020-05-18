#!/bin/sh
#
# Purpose: UnicornLoadBalancer initialization script for Docker container

/bin/sh /UnicornLoadBalancer/update.sh
exec npm start --prefix /UnicornLoadBalancer
