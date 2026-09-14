#!/usr/bin/env bash

if [ "$BETA" = 1 ]; then
	echo "Warning: beta mode is with the value 1."
	. ./beta-envsetup.sh
elif [ "$BETA" = 0 ]; then
	. ./envsetup.sh
elif [ -z "$BETA" ]; then
	. ./envsetup.sh
else
	echo "Invalid BETA!"
	exit 1
fi

nzoutput=device/nzoutput
echo "W: F-Droid not on ApkDown repo. Installing from website.."
mkdir -p "${nzoutput}"/system/product/priv-app/F-Droid
curl -fsSL https://f-droid.org/F-Droid.apk -o  "${nzoutput}"/system/product/priv-app/F-Droid/F-Droid.apk
echo "W: F-Droid Privileged Extension not on ApkDown repo. Installing from website..."
mkdir -p "${nzoutput}"/system/product/priv-app/F-Droid-Priv
curl -fsSL https://f-droid.org/repo/org.fdroid.fdroid.privileged_2130.apk -o "${nzoutput}"/system/product/priv-app/F-Droid/F-Droid.apk
