#!/bin/bash -x

set -e

for x in hardware-observe home mount-observe network-bind network-control network-observe raw-usb; do
  sudo snap connect openvino-samples:$x
done

openvino-samples.benchmark-app -m squeezenet1.1.xml -d MYRIAD
