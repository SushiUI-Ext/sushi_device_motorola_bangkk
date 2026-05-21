.PHONY: all sushi-prepare sushi-make sushi-compact

all: sushi-prepare sushi-make sushi-compact

sushi-prepare:
	@echo ". ./envsetup.sh" >> ~/.sushirc
	@mkdir -p module
	@mkdir -p module/system
	@mkdir -p module/system/product
	@mkdir -p module/system/system_ext
	@mkdir -p module/system/product/app
	@mkdir -p module/system/product/etc
	@mkdir -p module/system/product/priv-app
	@mkdir -p module/system/system_ext/app
	@cd module && \
	touch customize.sh service.sh post-fs-data.sh && \
	mkdir -p META-INF/com/google/android

sushi-make:
	@echo "id=sushiui.extended.mm.bangkk" > module/module.prop
	@echo "name=SushiUI Extended" >> module/module.prop
	@echo "version=1.1.2" >> module/module.prop
	@echo "versionCode=112" >> module/module.prop
	@echo "author=bangkkuser, SushiUI team" >> module/module.prop
	@echo "description=Personalization Magisk module. https://github.com/SushiUI-Ext/sushi_device_motorola_bangkk" >> module/module.prop

sushi-compact:
	@cd module && zip -r ../SushiUI-bangkk.zip .
