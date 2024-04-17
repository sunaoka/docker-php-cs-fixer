VERSION := 3.54.0

IMAGE := sunaoka/php-cs-fixer

PLATFORM := linux/arm64,linux/amd64

BUILDER := docker-php-cs-fixer-builder

BUILDER_ARGS := --build-arg VERSION=$(VERSION) -t $(IMAGE):latest -t $(IMAGE):$(VERSION)

all: build

setup:
	(docker buildx ls | grep $(BUILDER)) || docker buildx create --name $(BUILDER)

build: setup
	docker buildx use $(BUILDER)
	docker buildx build --rm --no-cache --platform $(PLATFORM) $(BUILDER_ARGS) --push .
	docker buildx rm $(BUILDER)

.PHONY: all setup build
