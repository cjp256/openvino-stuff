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

pushd snaps/openvino-toolkit-unofficial
snapcraft clean
snapcraft snap
sudo snap install *.snap --dangerous
popd

pushd snaps/openvino-examples
snapcraft clean
snapcraft snap
sudo snap install *.snap --dangerous
popd

pushd demo
./run-benchmark-snap.sh
popd
