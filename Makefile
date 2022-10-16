SHELL=/bin/bash

UID := $(shell id -u)
CURRENT_DIR := $(shell pwd)

.PHONY: lint docs

lint:
	@docker run --rm --workdir /workdir --volume "$(CURRENT_DIR):/workdir" quay.io/helmpack/chart-testing:v3.4.0 ct lint

docs:
	@docker run --rm --volume "$(CURRENT_DIR):/helm-docs" -u $(UID) jnorwood/helm-docs:v1.5.0
