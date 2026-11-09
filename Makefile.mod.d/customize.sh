#!/system/bin/sh

ui_print "This installation:"
ui_print "Device: motorola-@DEVICE@"
ui_print "Sushi version: @VERSION@"
ui_print "Maintainer: @MAINTAINER@"
ui_print "Release channel: stable"

ui_print "I: Checking SDK (minimum @MIN_SDK@)"
SDK="$(getprop ro.build.version.sdk)"
[ "$SDK" -ge @MIN_SDK@ ] || abort "Wrong SDK ($SDK), need >= @MIN_SDK@"

ui_print "I: Checking device"
DEVICE="$(getprop ro.product.device)"
[ "$DEVICE" = "@DEVICE@" ] || abort "Wrong device ($DEVICE)"

ui_print "I: Checking Xposed framework"
MODS=/data/adb/modules
UPD=/data/adb/modules_update

for id in zygisk_lsposed riru_lsposed; do
	if [ -d "$MODS/$id" ] || [ -d "$UPD/$id" ]; then
		abort "LSPosed found, remove it and install Vector"
	fi
done

if [ ! -d "$MODS/zygisk_vector" ] && [ ! -d "$UPD/zygisk_vector" ]; then
	abort "Vector not found, install it first"
fi

if [ -f "$MODS/zygisk_vector/disable" ]; then
	abort "Vector is disabled, enable it first"
fi

if [ "$SDK" -ge 37 ]; then
	ui_print "W: SDK $SDK, Vector support is experimental here"
fi

set_perm "$MODPATH/system/bin/sushi" 0 0 0755
