DOCKER = docker
IMAGE = mlmgames/aosp_7.1

all: Dockerfile
		$(DOCKER) build -t $(IMAGE) .

.PHONY: all
