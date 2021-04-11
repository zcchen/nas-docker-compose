include $(CURDIR)/.env

YML_FILES  = docker-compose.yml
YML_FILES += $(wildcard */docker-compose.yml)

DOCKER_ARGS  =
DOCKER_ARGS += $(foreach yml,$(YML_FILES),-f $(yml))


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
	docker-compose $(DOCKER_ARGS) up

config: $(YML_FILES)
	docker-compose $(DOCKER_ARGS) config

down: $(YML_FILES) $(YML_TESTS)
	-docker-compose $(DOCKER_ARGS) $(DOCKER_ARGS_TEST) down -v

purge: $(MODULES)
	-sudo rm -rvf $(foreach m,$<,$(DATA_FOLDER)/$(m))
	-sudo rm -rvf $(foreach m,$<,$(TMP_FOLDER)/$(m))

prepare: $(DATA_SUBFOLDERS) $(TMP_SUBFOLDERS)

$(DATA_SUBFOLDERS): $(DATA_FOLDER)
	mkdir -p $(foreach d,$@,$</$(d))

$(TMP_SUBFOLDERS): $(TMP_FOLDER)
	mkdir -p $(foreach d,$@,$</$(d))

