BASH := $(shell command -v bash 2>/dev/null)

ifeq ($(BASH),)
$(error GNU Bash not present!)
endif

SHELL := $(BASH)
.SHELLFLAGS := -e -c
.ONESHELL:

V ?= 0
BETA ?= 0

include Makefile.inv/main.mk

ifeq ($(V),1)
Q :=
else
Q := @
endif

ifeq ($(BETA),1)
$(error Beta not available. Exiting)
else
ENVSETUP := envsetup.sh
endif

ifeq ($(strip $(MAINTAINER)),)
MAINTAINER := $(shell whoami)
endif

OFFICIAL ?= 0
ifeq ($(OFFICIAL),1)
RELEASE_TYPE := OFFICIAL
else ifeq ($(OFFICIAL),0)
RELEASE_TYPE := UNOFFICIAL
else
$(error OFFICIAL must be 0 or 1)
endif

BUILDDATE := $(shell date +%Y%m%d)

envvar = $(shell source ./$(ENVSETUP) && printf '%s' "$$$(1)")

VERSION      := $(call envvar,VERSION)
VERSION_CODE := $(call envvar,VERSION_CODE)
MIN_SDK      := $(call envvar,MIN_SDK)

export MAINTAINER

define MODULE_PROP
id=sushiui.extended.mm.$(DEVICE)
name=SushiUI Extended
version=$(VERSION)
versionCode=$(VERSION_CODE)
author=$(MAINTAINER), SushiUI team
description=Personalization Magisk module.
updateJson=https://raw.githubusercontent.com/SushiUI-Ext/sushi_device_motorola_$(DEVICE)/refs/heads/main/ota/update.json
endef
export MODULE_PROP

define SUSHI_ENV
SUSHI_VERSION="$(VERSION)"
SUSHI_VERSION_CODE="$(VERSION_CODE)"
SUSHI_DEVICE="$(DEVICE)"
SUSHI_MIN_SDK="$(MIN_SDK)"
SUSHI_MAINTAINER="$(MAINTAINER)"
SUSHI_RELEASE="$(VERSION)-$(RELEASE_TYPE)"
SUSHI_BUILDDATE="$(BUILDDATE)"
endef
export SUSHI_ENV

.PHONY: all check-env sushi-prepare sushi-compact clean

all: check-env sushi-compact

check-env:
	$(Q)source ./$(ENVSETUP)
	$(Q)if ! type sushidevinfo >/dev/null 2>&1; then
		echo "ERROR: Failed to load SushiUI environment."
		exit 1
	fi
	$(Q)echo "SushiUI Extended: $$VERSION"
	$(Q)echo "Device: $$DEVICE"

sushi-prepare: check-env
	$(Q)source ./$(ENVSETUP)
	$(Q)case "$$MAINTAINER" in *[!A-Za-z0-9._[:space:]-]*) echo "E: invalid MAINTAINER" >&2; exit 1;; esac
	$(Q)echo "Building $(VERSION)-$(RELEASE_TYPE) by $(MAINTAINER)"
	$(Q)rm -rf "$(NZOUTPUT_DIR)"
	$(Q)mkdir -p "$(NZOUTPUT_DIR)"
	$(Q)cp -a "$(MODULE_SOURCE_DIR)/." "$(NZOUTPUT_DIR)/"
	$(Q)printf '%s\n' "$$MODULE_PROP" > "$(NZOUTPUT_DIR)/module.prop"
	$(Q)printf '%s\n' "$$SUSHI_ENV" > "$(NZOUTPUT_DIR)/sushi.env"
	$(Q)bash "$(MAKEFILE_DIR)/apkdown.sh"
	$(Q)bash "$(MAKEFILE_DIR)/systemfiles.sh"

sushi-compact: sushi-prepare
	$(Q)source ./$(ENVSETUP)
	$(Q)mkdir -p "$(OUTPUT_DIR)"
	$(Q)ZIP_NAME="$(PROJECT)_$${VERSION}_$${DEVICE}.zip"
	$(Q)rm -f "$(OUTPUT_DIR)/$$ZIP_NAME"
	$(Q)cd "$(NZOUTPUT_DIR)"
	$(Q)zip -r "../output/$$ZIP_NAME" . >/dev/null
	$(Q)echo "Created $(OUTPUT_DIR)/$$ZIP_NAME."

clean:
	$(Q)rm -rf "$(NZOUTPUT_DIR)" "$(OUTPUT_DIR)"
