#!/bin/bash -x

set -e

# installs to /usr/local

sudo apt install libssl-dev
./bootstrap
make -j4
sudo make install
