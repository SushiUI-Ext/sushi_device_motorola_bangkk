sushi-prepare:
	. ./envsetup.sh; \
	mkdir -p module; \
	( cd module && \
	touch customize.sh service.sh post-fs-data.sh && \
	mkdir -p META-INF/com/google/android )
