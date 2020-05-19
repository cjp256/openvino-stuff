#!/bin/bash -x

set -e

MODELS_DIR=$HOME/openvino-models

git clone https://github.com/opencv/open_model_zoo

pip3 install pyyaml requests

open_model_zoo/tools/downloader.py --all -o $MODELS_DIR
