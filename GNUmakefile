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
ENVSETUP := beta-envsetup.sh
else
ENVSETUP := envsetup.sh
endif

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
	$(Q)rm -rf "$(NZOUTPUT_DIR)"
	$(Q)mkdir -p "$(NZOUTPUT_DIR)"
	$(Q)cp -a "$(MODULE_SOURCE_DIR)/." "$(NZOUTPUT_DIR)/"
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
