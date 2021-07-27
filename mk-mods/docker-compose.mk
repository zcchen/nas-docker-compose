YML_FILES  = docker-compose.yml
YML_FILES += $(wildcard */docker-compose.yml)

ifndef COMPOSE_BIN
COMPOSE_BIN   = docker-compose
endif
COMPOSE_ARGS += $(foreach yml,$(YML_FILES),-f $(yml))

COMPOSE_VER_REQ   = 1.24.0
COMPOSE_VER       = $(word 3, $(shell $(COMPOSE_BIN) -v))
COMPOSE_VER_MAJOR = $(word 1, $(subst ., ,$(COMPOSE_VER)))
COMPOSE_VER_MINOR = $(word 2, $(subst ., ,$(COMPOSE_VER)))
COMPOSE_VER_REQ_MAJOR = $(word 1, $(subst ., ,$(COMPOSE_VER_REQ)))
COMPOSE_VER_REQ_MINOR = $(word 2, $(subst ., ,$(COMPOSE_VER_REQ)))

.PHONY: docker-compose/up docker-compose/config docker-compose/down docker-compose/prepare
.PHONY: docker-compose/version docker-compose/purge

docker-compose/up: docker-compose/version docker-compose/prepare $(YML_FILES)
	$(COMPOSE_BIN) $(COMPOSE_ARGS) up --remove-orphans

docker-compose/config: docker-compose/version $(YML_FILES)
	$(COMPOSE_BIN) $(COMPOSE_ARGS) config

docker-compose/down: docker-compose/version $(YML_FILES)
	-$(COMPOSE_BIN) $(COMPOSE_ARGS) down --volumes --remove-orphans

docker-compose/purge: docker-compose/down
	-sudo rm -rvf $(DATA_FOLDER)
	-sudo rm -rvf $(TMP_FOLDER)

docker-compose/prepare:

docker-compose/version:
	@echo "-------- docker compose version ----------"
	@echo "Version $(COMPOSE_VER)"
	@echo "Reqired >= $(COMPOSE_VER_REQ)"
	@echo "------------------------------------------"
	@[ $(COMPOSE_VER_MAJOR) -eq $(COMPOSE_VER_REQ_MAJOR) ] || return 1
	@[ $(COMPOSE_VER_MINOR) -gt $(COMPOSE_VER_REQ_MINOR) ] || return 1

