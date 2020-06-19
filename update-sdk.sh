#!/bin/bash -x

set -e

pushd snaps/openvino-toolkit-unofficial
rm -f *.snap
snapcraft snap
snapcraft upload *.snap --release edge
popd
