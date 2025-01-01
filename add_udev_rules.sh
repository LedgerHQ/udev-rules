#!/bin/bash

# Ensure /etc/udev/rules.d directory exists
if [ ! -d "/etc/udev/rules.d" ]; then
    mkdir -p /etc/udev/rules.d
fi

cat <<EOF > /etc/udev/rules.d/20-hw1.rules
# HW.1, Nano
SUBSYSTEMS=="usb", ATTRS{idVendor}=="2581", ATTRS{idProduct}=="1b7c|2b7c|3b7c|4b7c", TAG+="uaccess", TAG+="udev-acl"

# Blue, NanoS, Aramis, HW.2, Nano X, NanoSP, Stax, Ledger Test,
SUBSYSTEMS=="usb", ATTRS{idVendor}=="2c97", TAG+="uaccess", TAG+="udev-acl"

# Same, but with hidraw-based library (instead of libusb)
KERNEL=="hidraw*", ATTRS{idVendor}=="2c97", MODE="0666"
EOF

udevadm control --reload-rules
udevadm trigger
