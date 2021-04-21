ENV_SRC  = project.env $(CURDIR)/../domain.env $(CURDIR)/../server.env
ENV_FILE = compose.env

YML_FILES  = docker-compose.yml
YML_FILES += $(wildcard */docker-compose.yml)

COMPOSE_BIN   = docker-compose
COMPOSE_ARGS  = --env-file $(ENV_FILE)
COMPOSE_ARGS += $(foreach yml,$(YML_FILES),-f $(yml))


DATA_SUBFOLDERS :=
TMP_SUBFOLDERS :=
MODULE_FILES = $(wildcard */module.mk)
include $(MODULE_FILES)
MODULES      = $(foreach mf,$(MODULE_FILES),$(basename $(dir $(mf))))

.PHONY: all clean purge
.PHONY: up config down prepare

all: up

clean: down

up: prepare $(YML_FILES)
	$(COMPOSE_BIN) $(COMPOSE_ARGS) up

config: $(YML_FILES)
	$(COMPOSE_BIN) $(COMPOSE_ARGS) config

down: $(YML_FILES)
	-$(COMPOSE_BIN) $(COMPOSE_ARGS) down -v

purge: $(MODULES) clean
	-sudo rm -rvf $(foreach m,$<,$(DATA_FOLDER)/$(m))
	-sudo rm -rvf $(foreach m,$<,$(TMP_FOLDER)/$(m))
	-rm $(ENV_FILE)

prepare: $(ENV_FILE) $(eval include $(ENV_FILE))
prepare: $(DATA_SUBFOLDERS) $(TMP_SUBFOLDERS)

$(DATA_SUBFOLDERS): $(DATA_FOLDER) $(MODULES)
	mkdir -p $(foreach d,$@,$</$(d))

$(TMP_SUBFOLDERS): $(TMP_FOLDER) $(MODULES)
	mkdir -p $(foreach d,$@,$</$(d))

$(DATA_FOLDER) $(TMP_FOLDER):
	mkdir -p $@

$(ENV_FILE): $(ENV_SRC)
	cat $^ > $@
