#!/bin/bash -x

set -e

TOOLKIT_VERSION=l_openvino_toolkit_p_2020.2.120
INSTALL_DIR=$HOME/openvino-toolkit

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

wget http://registrationcenter-download.intel.com/akdlm/irc_nas/16612/$TOOLKIT_VERSION.tgz

tar xf $TOOLKIT_VERSION.tgz
cd $TOOLKIT_VERSION

sudo ./install_openvino_dependencies.sh

./install.sh --accept_eula --silent --install_dir $INSTALL_DIR

. $INSTALL_DIR/openvino/bin/setupvars.sh

$INSTALL_DIR/openvino/deployment_tools/model_optimizer/install_prerequisites/install_prerequisites.sh 

$INSTALL_DIR/openvino/install_dependencies/install_NCS_udev_rules.sh

