#!/bin/bash -x

set -e

CONTAINER_NAME=compute-stick-dev

lxc launch ubuntu:18.04 $CONTAINER_NAME

lxc config device add $CONTAINER_NAME intel-compute-stick usb vendorid=03e7 productid=2485

lxc config device add $CONTAINER_NAME microdia-compute-stick usb vendorid=0c45 productid=0133

lxc config device add $CONTAINER_NAME myriad-booted usb vendorid=03e7 productid=f63b
