SRV_NAME=resume
HUB_URL=shiningrush

.PHONY: init
init:
	git submodule update --init --recursive

.PHONY: build
build:
	hugo

.PHONY: publish
publish: build
	docker buildx build --platform linux/amd64,linux/arm64 -t $(HUB_URL)/$(SRV_NAME) --push .