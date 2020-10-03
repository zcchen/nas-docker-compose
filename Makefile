PERSIST_DATA_ROOT = $(CURDIR)/data

PERSIST_DATA_DIRS  =
## for nginx testing
#PERSIST_DATA_DIRS += $(PERSIST_DATA_ROOT)/mount-point-test
# for mysql
PERSIST_DATA_DIRS += $(PERSIST_DATA_ROOT)/mysql
# for ldap
PERSIST_DATA_DIRS += $(PERSIST_DATA_ROOT)/ldap $(PERSIST_DATA_ROOT)/ldap/etc $(PERSIST_DATA_ROOT)/ldap/var


YML_FILES  = docker-compose.yml
YML_FILES += $(filter-out $(wildcard */docker-compose.test.yml), $(wildcard */docker-compose.yml))

YML_TESTS  = docker-compose.test.yml
YML_TESTS += $(wildcard */docker-compose.test.yml)

DOCKER_ARGS  =
DOCKER_ARGS += $(foreach yml,$(YML_FILES),-f $(yml))

DOCKER_ARGS_TEST = $(foreach yml,$(YML_TESTS),-f $(yml))

.PHONY: all test clean purge

all: up

clean: down

up: prepare $(YML_FILES)
	docker-compose $(DOCKER_ARGS) up

config: $(YML_FILES)
	docker-compose $(DOCKER_ARGS) config

test: $(YML_FILES) $(YML_TESTS)
	docker-compose $(DOCKER_ARGS) $(DOCKER_ARGS_TEST) up

down: $(YML_FILES) $(YML_TESTS)
	-docker-compose $(DOCKER_ARGS) $(DOCKER_ARGS_TEST) down -v

purge: $(PERSIST_DATA_DIRS)
	-sudo rm $^ -rif

prepare:
	mkdir -p  $(PERSIST_DATA_DIRS)
