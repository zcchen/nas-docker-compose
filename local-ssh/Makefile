# Setup the env files
ENV_SRC  = project.env ../configs/domain.env ../configs/local.env
ENV_FILE = compose.env
include $(ENV_FILE)

# setup the docker compose parameters
COMPOSE_BIN  = docker-compose
COMPOSE_ARGS = --env-file $(ENV_FILE)

# prepare the interfaces
.PHONY: all clean purge install uninstall
all:
clean:
purge:
install:
uninstall:

# include the template
include ../mk-mods/docker-compose.mk
include ../mk-mods/systemd.mk

# Fill the interfaces
all: nas-$(current_dir).service docker-compose/up
clean: docker-compose/down nas-$(current_dir).service/clean
purge: purge_ENV_FILE
install: nas-$(current_dir).service/install
uninstall: nas-$(current_dir).service/uninstall docker-compose/down

# include the module setup
DATA_SUBFOLDERS :=
TMP_SUBFOLDERS :=
MODULE_FILES = $(wildcard */module.mk)
#ifneq (,$(MODULE_FILES))
include $(MODULE_FILES)
MODULES      = $(foreach mf,$(MODULE_FILES),$(basename $(dir $(mf))))

# updates the template interfaces
docker-compose/prepare: $(ENV_FILE) $(eval include $(ENV_FILE)) prepare_FOLDERS
#endif


# env file handler
.PHONY: purge_ENV_FILE
purge_ENV_FILE:
	-rm $(ENV_FILE)

$(ENV_FILE): $(ENV_SRC)
	eval "echo \"`cat $^`\"" > $@

# sub module dirs handler
.PHONY: prepare_FOLDERS
prepare_FOLDERS: $(DATA_SUBFOLDERS) $(TMP_SUBFOLDERS)

$(DATA_SUBFOLDERS): $(DATA_FOLDER) $(MODULES)
	mkdir -p $(foreach d,$@,$</$(d))

$(TMP_SUBFOLDERS): $(TMP_FOLDER) $(MODULES)
	mkdir -p $(foreach d,$@,$</$(d))

$(DATA_FOLDER) $(TMP_FOLDER):
	mkdir -p $@

