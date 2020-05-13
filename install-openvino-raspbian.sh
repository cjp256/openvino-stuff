#!/bin/bash -x

set -e

TOOLKIT_VERSION=l_openvino_toolkit_runtime_raspbian_p_2020.2.120
INSTALL_DIR=$(readlink -f .)/$TOOLKIT_VERSION

sudo apt-get update

sudo apt-get install -y \
  apt-utils \
  automake \
  cmake \
  cpio \
  gcc \
  g++ \
  libatlas-base-dev \
  libgtk-3-dev \
  libstdc++6 \
  libtool \
  libusb-1.0.0-dev \
  lsb-release \
  make \
  python3-dev \
  python3-pip \
  python3-numpy \
  python3-scipy \
  sudo \
  udev \
  unzip \
  vim \
  wget

pip3 install wheel setuptools -U

if [[ ! -f $TOOLKIT_VERSION.tgz ]]; then
    wget https://download.01.org/opencv/2020/openvinotoolkit/2020.2/l_openvino_toolkit_runtime_raspbian_p_2020.2.120.tgz
fi

tar xf $TOOLKIT_VERSION.tgz

cd $TOOLKIT_VERSION

. $INSTALL_DIR/bin/setupvars.sh

sudo -E $INSTALL_DIR/install_dependencies/install_openvino_dependencies.sh

sudo -E $INSTALL_DIR/install_dependencies/install_NCS_udev_rules.sh
