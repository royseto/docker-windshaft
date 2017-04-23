#!/bin/bash

# Upgrade glibc on Debian Jessie to work around
# https://github.com/mapnik/node-mapnik/issues/700

set -ex

mkdir -p /etc/apt/preferences.d /etc/apt/sources.list.d
echo "deb http://ftp.us.debian.org/debian testing main contrib non-free" > /etc/apt/sources.list.d/testing.list

cat > /etc/apt/preferences.d/testing <<EOF
Package: *
Pin: release a=testing
Pin-Priority: 100
EOF

apt-get update
apt-get install -y -t testing libc6 libstdc++6
