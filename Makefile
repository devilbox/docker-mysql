ifneq (,)
.error This Makefile requires GNU Make.
endif

# -------------------------------------------------------------------------------------------------
# Default configuration
# -------------------------------------------------------------------------------------------------

CURRENT_DIR = $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

# -------------------------------------------------------------------------------------------------
# File-lint configuration
# -------------------------------------------------------------------------------------------------
FL_VERSION = 0.4
FL_IGNORES = .git/,.github/,tests/

# -------------------------------------------------------------------------------------------------
# Docker configuration
# -------------------------------------------------------------------------------------------------
IMAGE    = devilbox/mysql
DIR      = Dockerfiles
TAG      = latest
NO_CACHE =


# -------------------------------------------------------------------------------------------------
# Default Target
# -------------------------------------------------------------------------------------------------
help:
	@echo "help          Show this help screen"
	@echo "lint          Lint repository"
	@echo "build         Build docker image"
	@echo "test          Test docker image"


# -------------------------------------------------------------------------------------------------
# Lint Targets
# -------------------------------------------------------------------------------------------------
.PHONY: lint
lint: lint-files
lint: lint-workflow


.PHONY: lint-files
lint-files:
	@echo "################################################################################"
	@echo "# Lint Files"
	@echo "################################################################################"
	@docker run --rm $$(tty -s && echo "-it" || echo) -v $(CURRENT_DIR):/data cytopia/file-lint:$(FL_VERSION) file-cr --text --ignore '$(FL_IGNORES)' --path .
	@docker run --rm $$(tty -s && echo "-it" || echo) -v $(CURRENT_DIR):/data cytopia/file-lint:$(FL_VERSION) file-crlf --text --ignore '$(FL_IGNORES)' --path .
	@docker run --rm $$(tty -s && echo "-it" || echo) -v $(CURRENT_DIR):/data cytopia/file-lint:$(FL_VERSION) file-trailing-single-newline --text --ignore '$(FL_IGNORES)' --path .
	@docker run --rm $$(tty -s && echo "-it" || echo) -v $(CURRENT_DIR):/data cytopia/file-lint:$(FL_VERSION) file-trailing-space --text --ignore '$(FL_IGNORES)' --path .
	@docker run --rm $$(tty -s && echo "-it" || echo) -v $(CURRENT_DIR):/data cytopia/file-lint:$(FL_VERSION) file-utf8 --text --ignore '$(FL_IGNORES)' --path .
	@docker run --rm $$(tty -s && echo "-it" || echo) -v $(CURRENT_DIR):/data cytopia/file-lint:$(FL_VERSION) file-utf8-bom --text --ignore '$(FL_IGNORES)' --path .


.PHONY: lint-workflow
lint-workflow:
	@echo "################################################################################"
	@echo "# Lint Workflow"
	@echo "################################################################################"
	@GIT_CURR_MAJOR="$$( git tag | sort -V | tail -1 | sed 's|\.[0-9]*$$||g' )"; \
	GIT_CURR_MINOR="$$( git tag | sort -V | tail -1 | sed 's|^[0-9]*\.||g' )"; \
	GIT_NEXT_TAG="$${GIT_CURR_MAJOR}.$$(( GIT_CURR_MINOR + 1 ))"; \
	if ! grep 'refs:' -A 100 .github/workflows/nightly.yml \
		| grep  "          - '$${GIT_NEXT_TAG}'" >/dev/null; then \
		echo "[ERR] New Tag required in .github/workflows/nightly.yml: $${GIT_NEXT_TAG}"; \
			exit 1; \
	else \
		echo "[OK] Git Tag present in .github/workflows/nightly.yml: $${GIT_NEXT_TAG}"; \
	fi;


# -------------------------------------------------------------------------------------------------
# Build Targets
# -------------------------------------------------------------------------------------------------
.PHONY: build
build: pull-base-image
build:
ifeq ($(strip $(MYSQL)),)
	@$(info This make target requires the MYSQL variable to be set.)
	@$(info make build MYSQL= VERSION=)
	@$(info )
	@$(error Exiting)
endif
ifeq ($(strip $(VERSION)),)
	@$(info This make target requires the VERSION variable to be set.)
	@$(info make build MYSQL= VERSION=)
	@$(info )
	@$(error Exiting)
endif
	@echo "################################################################################"
	@echo "# Building $(IMAGE):$(MYSQL)-$(VERSION)"
	@echo "################################################################################"
	docker build \
		$(NO_CACHE) \
		--label "org.opencontainers.image.created"="$$(date --rfc-3339=s)" \
		--label "org.opencontainers.image.revision"="$$(git rev-parse HEAD)" \
		--label "org.opencontainers.image.name"="${MYSQL}" \
		--label "org.opencontainers.image.version"="${VERSION}" \
		-t $(IMAGE):$(MYSQL)-$(VERSION) -f $(DIR)/$(MYSQL)-$(VERSION) $(DIR) \


.PHONY: rebuild
rebuild: NO_CACHE=--no-cache
rebuild: build


.PHONY: test
test:
ifeq ($(strip $(MYSQL)),)
	@$(info This make target requires the MYSQL variable to be set.)
	@$(info make test MYSQL= VERSION=)
	@$(info )
	@$(error Exiting)
endif
ifeq ($(strip $(VERSION)),)
	@$(info This make target requires the VERSION variable to be set.)
	@$(info make test MYSQL= VERSION=)
	@$(info )
	@$(error Exiting)
endif
	@echo "################################################################################"
	@echo "# Testing $(IMAGE):$(MYSQL)-$(VERSION)"
	@echo "################################################################################"
	./tests/tests.sh "$(MYSQL)" "$(VERSION)"


# -------------------------------------------------------------------------------------------------
#  Deploy Targets
# -------------------------------------------------------------------------------------------------
.PHONY: tag
tag:
	docker tag $(IMAGE):$(MYSQL)-$(VERSION) $(IMAGE):$(TAG)


.PHONY: login
login:
ifeq ($(strip $(USERNAME)),)
	@$(info This make target requires the USERNAME variable to be set.)
	@$(info make login USERNAME= PASSWORD=)
	@$(info )
	@$(error Exiting)
endif
ifeq ($(strip $(PASSWORD)),)
	@$(info This make target requires the PASSWORD variable to be set.)
	@$(info make login USERNAME= PASSWORD=)
	@$(info )
	@$(error Exiting)
endif
	@yes | docker login --username $(USERNAME) --password $(PASSWORD)


.PHONY: push
push:
ifeq ($(strip $(TAG)),)
	@$(info This make target requires the TAG variable to be set.)
	@$(info make push TAG=)
	@$(info )
	@$(error Exiting)
endif
	docker push $(IMAGE):$(TAG)


# -------------------------------------------------------------------------------------------------
# Helper Targets
# -------------------------------------------------------------------------------------------------
.PHONY: pull-base-image
pull-base-image:
ifeq ($(strip $(MYSQL)),)
	@$(info This make target requires the MYSQL variable to be set.)
	@$(info make pull-base-image MYSQL= VERSION=)
	@$(info )
	@$(error Exiting)
endif
ifeq ($(strip $(VERSION)),)
	@$(info This make target requires the VERSION variable to be set.)
	@$(info make pull-base-image MYSQL= VERSION=)
	@$(info )
	@$(error Exiting)
endif
	while ! docker pull $(MYSQL):$(VERSION); do sleep 1; done
