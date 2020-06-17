# Tested OS / Hardware

- Ubuntu 20.04, 18.04 Desktop & Server (amd64 PCs)

- Ubuntu 18.04 armhf on Raspberry Pi 4

  - Download: https://ubuntu.com/download/raspberry-pi

## Known issues

- Ubuntu 20.04 aarch64 on Raspberry Pi 4 does not work (issues with TBB breaking build)

# Setup Instructions

Setup udev rules to give all users access to Intel Compute stick devices:

```
$ cd misc
$ ./install-udev-rules.sh
$ reboot
```

# Build Instructions

Build/install snapcraft with OpenVINO extension:

```
$ git clone git://github.com/cjp256/snapcraft --branch openvino
$ cd snapcraft
$ snapcraft snap
$ sudo snap install *.snap --dangerous --classic
```

Build/install the OpenVINO toolkit snap (from source):

```
$ cd snaps/openvino-toolkit-unofficial
$ snapcraft snap
$ sudo snap install *.snap --dangerous
```

Build/install the OpenVINO examples:

```
$ cd snaps/openvino-examples-snap
$ snapcraft snap
$ sudo snap install *.snap --dangerous
```

# Run Instructions

Install snap and connect required interfaces:

```
$ sudo snap install openvino-examples*.snap --dangerous
$ for x in hardware-observe home mount-observe network-bind network-control network-observe raw-usb; do sudo snap connect openvino-examples:$x done
```

Run benchmark app exposed in snap:

```
$ cd demo
$ openvino-examples.benchmark-app -m squeezenet1.1.xml -d MYRIAD
```
