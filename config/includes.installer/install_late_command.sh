#!/bin/sh -eu

cat << EOF > /target/etc/apt/sources.list
deb http://deb.debian.org/debian bookworm main contrib non-free-firmware
EOF

