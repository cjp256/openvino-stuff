#!/bin/bash -x

set -e

for x in hardware-observe home mount-observe network-bind network-control network-observe raw-usb; do
  sudo snap connect openvino-core18-example:$x
done

openvino-core18-example.benchmark-app -m models/squeezenet1.1.xml -d MYRIAD
