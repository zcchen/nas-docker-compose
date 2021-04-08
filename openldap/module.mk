mkfile_dir := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
MODULE_NAME := $(notdir $(mkfile_dir))

$(MODULE_NAME)_DATA_SUBFOLDERS = var etc
$(MODULE_NAME)_TMP_SUBFOLDERS =

