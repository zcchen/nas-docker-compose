__DATA_SUBFOLDERS := mysql html data config apps
__TMP_SUBFOLDERS := ./


mkfile_dir := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
MODULE_NAME := $(lastword $(subst /, ,$(mkfile_dir)))

DATA_SUBFOLDERS += $(foreach d,$(__DATA_SUBFOLDERS),$(MODULE_NAME)/$(d))
TMP_SUBFOLDERS += $(foreach d,$(__TMP_SUBFOLDERS),$(MODULE_NAME)/$(d))
