DOCKER = docker
IMAGE = mlm-games/aosp_7.1

all: Dockerfile
		$(DOCKER) build -t $(IMAGE) .

.PHONY: all
