#!/bin/sh
cd /UnicornLoadBalancer
git fetch --all \
&& git reset --hard origin/master
exit 0