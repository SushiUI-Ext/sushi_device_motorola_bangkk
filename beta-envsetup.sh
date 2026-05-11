#!/usr/bin/env bash

#
# Copyright (c) 2026 SushiUI Extended 
# All rights reserved

DEVICE="bangkk"
VERSION="1.2.0b1"
VENDOR="motorola"
AB="true"
RESOLUTION="1080x2400"
SOC="QTI SM6375"
ARCHITECTURES="aarch64,armeabi-v7a,armeabi"
LATEST_SDK="35"
FIRST_SDK="33"
BUILDNO="V1TCS35H.88-16-4"
BUILD_SDK="35"
# color variables
RED="\e[31m"
GREEN="\e[32m"
RESET="\e[0m"
BLUE="\e[34m"
# functions (commands)
sushidevinfo() {
  echo -e "Device ${BLUE}$DEVICE${RESET} info"
  echo -e "SoC: $SOC"
  echo -e "SushiUI version: $VERSION"
  echo -e "A/B: $AB"
  echo -e "Architectures: $ARCHITECTURES"
}
