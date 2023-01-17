Instructions take from https://support.ledger.com/hc/en-us/articles/360019301813-Fix-USB-issues

# udev rules to support Ledger devices on Linux

On Linux you need to create a set of udev rules to allow device access. Refer to the Chrome USB API documentation for details. Please follow the instructions below.

1. Add the udev rules

    Enter the following command to automatically add the rules and reload udev:

    wget -q -O - https://raw.githubusercontent.com/LedgerHQ/udev-rules/master/add_udev_rules.sh | sudo bash

    Retry connecting your Ledger Nano S with Ledger Live.

    If it's still not working, continue to step 2: Troubleshooting.

2. Troubleshooting

Try each of the following three options. 

Option 1
Edit the file `/etc/udev/rules.d/20-hw1.rules` file by adding the `OWNER="<user>"` parameter to each line, where <user> is your Linux user name.
    Then reload the rules as follows:

    udevadm trigger
    udevadm control --reload-rules

 Retry the connection with Ledger Live. If it does not work, try the next option.
   
Option 2
 Edit the /etc/udev/rules.d/20-hw1.rules file and add the following lines:

    KERNEL=="hidraw*", SUBSYSTEM=="hidraw", MODE="0660", GROUP="plugdev", ATTRS{idVendor}=="2c97"

    KERNEL=="hidraw*", SUBSYSTEM=="hidraw", MODE="0660", GROUP="plugdev", ATTRS{idVendor}=="2581"

Then reload the rules:

    udevadm trigger
    udevadm control --reload-rules

Retry connecting with Ledger Live. If it does not work yet, try the last option.

Option 3
 If you are on Arch Linux, you can try the following rules:

    /etc/udev/rules.d/20-hw1.rules

    SUBSYSTEMS=="usb", ATTRS{idVendor}=="2581", ATTRS{idProduct}=="1b7c", MODE="0660", TAG+="uaccess", TAG+="udev-acl"

    SUBSYSTEMS=="usb", ATTRS{idVendor}=="2581", ATTRS{idProduct}=="2b7c", MODE="0660", TAG+="uaccess", TAG+="udev-acl"

    SUBSYSTEMS=="usb", ATTRS{idVendor}=="2581", ATTRS{idProduct}=="3b7c", MODE="0660", TAG+="uaccess", TAG+="udev-acl"

    SUBSYSTEMS=="usb", ATTRS{idVendor}=="2581", ATTRS{idProduct}=="4b7c", MODE="0660", TAG+="uaccess", TAG+="udev-acl"

    SUBSYSTEMS=="usb", ATTRS{idVendor}=="2581", ATTRS{idProduct}=="1807", MODE="0660", TAG+="uaccess", TAG+="udev-acl"

    SUBSYSTEMS=="usb", ATTRS{idVendor}=="2581", ATTRS{idProduct}=="1808", MODE="0660", TAG+="uaccess", TAG+="udev-acl"

    SUBSYSTEMS=="usb", ATTRS{idVendor}=="2c97", ATTRS{idProduct}=="0000", MODE="0660", TAG+="uaccess", TAG+="udev-acl"

    SUBSYSTEMS=="usb", ATTRS{idVendor}=="2c97", ATTRS{idProduct}=="0001", MODE="0660", TAG+="uaccess", TAG+="udev-acl"
     SUBSYSTEMS=="usb", ATTRS{idVendor}=="2c97", ATTRS{idProduct}=="0004", MODE="0660", TAG+="uaccess", TAG+="udev-acl"
     SUBSYSTEMS=="usb", ATTRS{idVendor}=="2c97", ATTRS{idProduct}=="1011", MODE="0660", GROUP="plugdev"
     SUBSYSTEMS=="usb", ATTRS{idVendor}=="2c97", ATTRS{idProduct}=="1015", MODE="0660", GROUP="plugdev" 

    Then reload the rules again and retry the connection with Ledger Live:

    udevadm trigger
    udevadm control --reload-rules

