#!/bin/sh -eu

cat << EOF > /target/etc/apt/sources.list
deb http://deb.debian.org/debian bookworm main contrib non-free-firmware
EOF

mv /target/etc/default/grub /target/etc/default/grub.example
cat << EOF > /target/etc/default/grub
GRUB_TIMEOUT_STYLE=hidden
GRUB_HIDDEN_TIMEOUT=0
GRUB_DEFAULT=0
GRUB_TIMEOUT=0
GRUB_DISTRIBUTOR=`lsb_release -i -s 2> /dev/null || echo Debian`
GRUB_CMDLINE_LINUX_DEFAULT="quiet"
GRUB_CMDLINE_LINUX="initrd=/install/gtk/initrd.gz"
GRUB_TERMINAL=console
EOF
in-target update-grub
