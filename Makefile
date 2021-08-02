YML_FILES  = docker-compose.yml
YML_FILES += $(filter-out $(wildcard */docker-compose.test.yml), $(wildcard */docker-compose.yml))

YML_TESTS  = docker-compose.test.yml
YML_TESTS += $(wildcard */docker-compose.test.yml)

DOCKER_ARGS  =
DOCKER_ARGS += $(foreach yml,$(YML_FILES),-f $(yml))

DOCKER_ARGS_TEST = $(foreach yml,$(YML_TESTS),-f $(yml))

.PHONY: all test clean purge

all: $(YML_FILES)
	docker-compose $(DOCKER_ARGS) up

test: clean $(YML_FILES) $(YML_TESTS)
	docker-compose $(DOCKER_ARGS) $(DOCKER_ARGS_TEST) up

clean: $(YML_FILES) $(YML_TESTS)
	-docker-compose $(DOCKER_ARGS) $(DOCKER_ARGS_TEST) down -v

PERSIST_DATA = data/mysql/* data/ldap/etc/* data/ldap/var/*
purge: $(PERSIST_DATA)
	-sudo rm $^ -rf
