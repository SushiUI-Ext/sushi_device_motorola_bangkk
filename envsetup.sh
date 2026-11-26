#!/usr/bin/env bash

#
# Copyright (c) 2026 SushiUI Extended 
# All rights reserved

DEVICE="bangkk"
VERSION="1.1.2"
VENDOR="motorola"
AB="true"
RESOLUTION="1080x2400"
SOC="QTI SM6375"
ARCHITECTURES="aarch64,armeabi-v7a,armeabi"
LATEST_SDK="35"
FIRST_SDK="33"
BUILDNO="V1TCS35H.88-16-9"
BUILD_SDK="35"
MIN_SDK="36"
VERSION_CODE="10102"
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

smake() {
    local -a MAKEFLAGS=()

    local arg
    local has_jobs=0

    for arg in "$@"; do
        case "$arg" in
            -j|--jobs)
                has_jobs=1
                ;;
            -j[0-9]*|--jobs=[0-9]*)
                has_jobs=1
                ;;
        esac
    done

    if (( !has_jobs )); then
        MAKEFLAGS+=("-j$(nproc)")
    fi

    command make "${MAKEFLAGS[@]}" "$@"
}

submit2releases() {
    read -rp "Where are your releases directory? " reldir

    [ ! -d "$reldir" ] && {
        echo "The releases repository does not exist! Aborting."
        exit 1
    }

    cp device/output/*.zip "$reldir"/devices/"$DEVICE"/ || exit 1

    cd "$reldir" || exit 1

    read -rp "You want to commit changes? [y/n]: " yn

    case "$yn" in
        y|Y)
            echo "Adding actual directory to Git stage..."
            git add .
            echo "Committing..."
            git commit -m "devices: Add $DEVICE release"
            echo "Pushing..."
            git push
            ;;
        n|N)
            echo "Aborting..."
            return 1
            ;;
        *)
            echo "Invalid option."
            return 1
            ;;
    esac
}
