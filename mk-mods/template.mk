YML_FILES  = docker-compose.yml
YML_FILES += $(wildcard */docker-compose.yml)

ifndef COMPOSE_BIN
COMPOSE_BIN   = docker-compose
endif
COMPOSE_ARGS += $(foreach yml,$(YML_FILES),-f $(yml))


.PHONY: all clean purge
.PHONY: up config down prepare

all: up

clean: down

include ../mk-mods/version.mk    # version checking support

up: version prepare $(YML_FILES)
	$(COMPOSE_BIN) $(COMPOSE_ARGS) up

config: version $(YML_FILES)
	$(COMPOSE_BIN) $(COMPOSE_ARGS) config

down: version $(YML_FILES)
	-$(COMPOSE_BIN) $(COMPOSE_ARGS) down --volumes

purge: clean
	-sudo rm -rvf $(DATA_FOLDER)
	-sudo rm -rvf $(TMP_FOLDER)

prepare:
