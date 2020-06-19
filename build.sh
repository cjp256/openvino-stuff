#!/bin/bash -x

set -e

export SNAPCRAFT_BUILD_ENVIRONMENT=host

if [ -d snapcraft ]; then
  pushd snapcraft
  git pull
  popd
else
  git clone git://github.com/cjp256/snapcraft -b openvino
fi

pushd snapcraft
snapcraft clean
snapcraft snap
sudo snap install *.snap --classic --dangerous
popd

pushd snaps/openvino-samples
snapcraft clean
snapcraft snap
sudo snap install *.snap --dangerous
popd
