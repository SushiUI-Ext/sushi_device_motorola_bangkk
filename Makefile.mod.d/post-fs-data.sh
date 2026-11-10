#!/system/bin/sh

MODDIR="${0%/*}"
. "$MODDIR/sushi.env"

resetprop -n ro.lineage.version "SushiUi-EXT-${SUSHI_VERSION}-STABLE"
resetprop -n ro.sushiui.dev "$SUSHI_DEVICE"
resetprop -n ro.sushiui.release "$SUSHI_RELEASE"
resetprop -n ro.sushi.maintainer "$SUSHI_MAINTAINER"
resetprop -n ro.sushi.builddate "$SUSHI_BUILDDATE"
