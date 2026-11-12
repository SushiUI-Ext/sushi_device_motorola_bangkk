#!/usr/bin/env bash
set -euo pipefail

nz=device/nzoutput

install -Dm644 System/etc/p/permissions/privapp-permissions-org.fdroid.fdroid.privileged.xml \
	"${nz}/system/product/etc/permissions/privapp-permissions-org.fdroid.fdroid.privileged.xml"
install -Dm755 System/bin/sushi "${nz}/system/bin/sushi"
install -Dm644 System/product/media/bootanimation.zip "${nz}/system/product/media/bootanimation.zip"

