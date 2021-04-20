mkfile_dir := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
include $(mkfile_dir)/.env
MODULE_NAME = $(notdir $(CURDIR))

.PHONY: all prepare purge

all: prepare

ifneq ($(strip $(DATA_SUBFOLDERS)),)
prepare: $(DATA_SUBFOLDERS)
endif

ifneq ($(strip $(TMP_SUBFOLDERS)),)
prepare: $(TMP_SUBFOLDERS)
endif

prepare:

$(DATA_SUBFOLDERS): $(DATA_FOLDER)/$(MODULE_NAME)
	mkdir -p $(foreach s,$@,$</$(s))

$(TMP_SUBFOLDERS): $(TMP_FOLDER)/$(MODULE_NAME)
	mkdir -p $(foreach s,$@,$</$(s))

$(DATA_FOLDER)/$(MODULE_NAME):
	mkdir -p $@

$(TMP_FOLDER)/$(MODULE_NAME):
	mkdir -p $@

purge:
	-rm -rf $(DATA_FOLDER)/$(MODULE_NAME)
	-rm -rf $(TMP_FOLDER)/$(MODULE_NAME)

