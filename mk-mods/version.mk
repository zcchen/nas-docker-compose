COMPOSE_VER_REQ   = 1.24.0

COMPOSE_VER       = $(word 3, $(shell $(COMPOSE_BIN) -v))
COMPOSE_VER_MAJOR = $(word 1, $(subst ., ,$(COMPOSE_VER)))
COMPOSE_VER_MINOR = $(word 2, $(subst ., ,$(COMPOSE_VER)))

COMPOSE_VER_REQ_MAJOR = $(word 1, $(subst ., ,$(COMPOSE_VER_REQ)))
COMPOSE_VER_REQ_MINOR = $(word 2, $(subst ., ,$(COMPOSE_VER_REQ)))


.PHONY: version
version:
	@echo "-------- docker compose version ----------"
	@echo "Version $(COMPOSE_VER)"
	@echo "Reqired >= $(COMPOSE_VER_REQ)"
	@echo "------------------------------------------"
	@[ $(COMPOSE_VER_MAJOR) -eq $(COMPOSE_VER_REQ_MAJOR) ] || return 1
	@[ $(COMPOSE_VER_MINOR) -gt $(COMPOSE_VER_REQ_MINOR) ] || return 1

