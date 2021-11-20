__DATA_SUBFOLDERS := acme.sh
__TMP_SUBFOLDERS := log


mkfile_dir := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
MODULE_NAME := $(lastword $(subst /, ,$(mkfile_dir)))

DATA_SUBFOLDERS += $(foreach d,$(__DATA_SUBFOLDERS),$(MODULE_NAME)/$(d))
TMP_SUBFOLDERS += $(foreach d,$(__TMP_SUBFOLDERS),$(MODULE_NAME)/$(d))
