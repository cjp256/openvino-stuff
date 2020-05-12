#!/bin/bash -x

set -e

TOOLKIT_VERSION=l_openvino_toolkit_p_2020.2.120
INSTALL_DIR=$HOME/openvino-toolkit

. $INSTALL_DIR/openvino/bin/setupvars.sh

$INSTALL_DIR/openvino/deployment_tools/demo/demo_benchmark_app.sh

cd $HOME/inference_engine_samples_build/intel64/Release

# Benchmark CPU
./benchmark_app -d CPU -i $INSTALL_DIR/openvino/deployment_tools/demo/car.png -m $HOME/openvino_models/ir/public/squeezenet1.1/FP16/squeezenet1.1.xml -pc -niter 1000

# Benchmark MYRIAD
./benchmark_app -d MYRIAD -i $INSTALL_DIR/openvino/deployment_tools/demo/car.png -m $HOME/openvino_models/ir/public/squeezenet1.1/FP16/squeezenet1.1.xml -pc -niter 1000

