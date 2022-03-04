ifneq (,)
.error This Makefile requires GNU Make.
endif

# Ensure additional Makefiles are present
MAKEFILES = Makefile.docker Makefile.lint
$(MAKEFILES): URL=https://raw.githubusercontent.com/devilbox/makefiles/master/$(@)
$(MAKEFILES):
	@if ! (curl --fail -sS -o $(@) $(URL) || wget -O $(@) $(URL)); then \
		echo "Error, curl or wget required."; \
		echo "Exiting."; \
		false; \
	fi
include $(MAKEFILES)

# Set default Target
.DEFAULT_GOAL := help


# -------------------------------------------------------------------------------------------------
# Default configuration
# -------------------------------------------------------------------------------------------------
# Own vars
TAG        = latest

# Makefile.docker overwrites
# NAME    = no default
# VERSION = no default
IMAGE    = devilbox/mysql
DIR      = Dockerfiles
FILE     = $(NAME)-$(VERSION)
TAG      = latest
ARCH     = linux/amd64

ifeq ($(strip $(TAG)),latest)
DOCKER_TAG := $(NAME)-$(VERSION)
endif
ifneq ($(strip $(TAG)),latest)
DOCKER_TAG := $(NAME)-$(VERSION)-$(TAG)
endif


# -------------------------------------------------------------------------------------------------
# Default Target
# -------------------------------------------------------------------------------------------------
.PHONY: help
help:
	@echo "lint                                     Lint project files and repository"
	@echo
	@echo "build [ARCH=...] [TAG=...]               Build Docker image"
	@echo "rebuild [ARCH=...] [TAG=...]             Build Docker image without cache"
	@echo "push [ARCH=...] [TAG=...]                Push Docker image to Docker hub"
	@echo
	@echo "manifest-create [ARCHES=...] [TAG=...]   Create multi-arch manifest"
	@echo "manifest-push [TAG=...]                  Push multi-arch manifest"
	@echo
	@echo "test [ARCH=...]                          Test built Docker image"
	@echo


# -------------------------------------------------------------------------------------------------
# Build Targets
# -------------------------------------------------------------------------------------------------
.PHONY: build
build: docker-arch-build

.PHONY: rebuild
rebuild: docker-arch-rebuild

.PHONY: push
push: docker-arch-push


# -------------------------------------------------------------------------------------------------
#  Manifest Targets
# -------------------------------------------------------------------------------------------------
.PHONY: manifest-create
manifest-create: docker-manifest-create

.PHONY: manifest-push
manifest-push: docker-manifest-push


# -------------------------------------------------------------------------------------------------
#  Test Targets
# -------------------------------------------------------------------------------------------------
.PHONY: test
test:
ifeq ($(strip $(NAME)),)
	@$(info This make target requires the NAME variable to be set.)
	@$(info make test NAME= VERSION=)
	@$(info )
	@$(error Exiting)
endif
ifeq ($(strip $(VERSION)),)
	@$(info This make target requires the VERSION variable to be set.)
	@$(info make test NAME= VERSION=)
	@$(info )
	@$(error Exiting)
endif
	@echo "################################################################################"
	@echo "# Testing $(IMAGE):$(NAME)-$(VERSION) $(ARCH)"
	@echo "################################################################################"
	./tests/tests.sh "$(NAME)" "$(VERSION)" "$(ARCH)"
