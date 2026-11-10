#!/usr/bin/env bash
set -euo pipefail

product=device/nzoutput/system/product

gh_apk() {
	local repo="$1" dir="$2" name="$3" re="${4:-\.apk$}" url auth=()
	[ -n "${GITHUB_TOKEN:-}" ] && auth=(-H "Authorization: Bearer ${GITHUB_TOKEN}")
	url=$(curl -fsSL ${auth[@]+"${auth[@]}"} \
		"https://api.github.com/repos/${repo}/releases/latest" \
		| grep -o '"browser_download_url": *"[^"]*"' \
		| sed 's/.*"\(https[^"]*\)"/\1/' \
		| grep -E "$re" | sed -n 1p || true)
	[ -n "$url" ] || { echo "E: no apk found for ${repo}" >&2; exit 1; }
	echo "I: ${name} <- ${url}"
	mkdir -p "${product}/app/${dir}"
	curl -fsSL "$url" -o "${product}/app/${dir}/${name}.apk"
}

mkdir -p "${product}/priv-app/F-Droid" "${product}/priv-app/F-Droid-Priv" "${product}/app/SmartPackKM"

curl -fsSL https://f-droid.org/F-Droid.apk \
	-o "${product}/priv-app/F-Droid/F-Droid.apk"
curl -fsSL https://f-droid.org/repo/org.fdroid.fdroid.privileged_2130.apk \
	-o "${product}/priv-app/F-Droid-Priv/F-Droid-Priv.apk"
curl -fsSL https://f-droid.org/repo/com.smartpack.kernelmanager_177.apk \
	-o "${product}/app/SmartPackKM/SmartPackKM.apk"

gh_apk Mahmud0808/Iconify Iconify Iconify
gh_apk Mahmud0808/XMorphClock XMorphClock XMorphClock
gh_apk d4rken-org/sdmaid-se SDMaid SDMaid
