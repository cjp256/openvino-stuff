#!/bin/bash -x

set -e

INSTALL_DIR=~/openvino-build
SOURCE_DIR=~/git/openvino
OPENCV_BUILD_DIR=~/opencv-build

export OpenCV_DIR="${OPENCV_BUILD_DIR}"

#rm -rf $INSTALL_DIR
mkdir -p $INSTALL_DIR
cd $INSTALL_DIR

cmake -DCMAKE_BUILD_TYPE=Release \
      -DPYTHON_EXECUTABLE=`which python3.6` \
      $SOURCE_DIR

make -j$(nproc)
