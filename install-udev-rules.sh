#!/bin/bash -x
set -e

sudo usermod -a -G users "$(whoami)"
sudo cp 97-myriad-usbboot.rules /etc/udev/rules.d/
sudo udevadm control --reload-rules
sudo udevadm trigger

echo "Please reboot."
