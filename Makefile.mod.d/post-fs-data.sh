#!/system/bin/sh

resetprop -n ro.lineage.version SushiUi-EXT-@VERSION@-STABLE
resetprop -n ro.sushiui.dev @DEVICE@
resetprop -n ro.sushiui.release @VERSION@-OFFICIAL
resetprop -n ro.sushi.maintainer @MAINTAINER@
resetprop -n ro.sushi.builddate @BUILDDATE@
