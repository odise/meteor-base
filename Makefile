ifeq ($(origin REGISTRY), undefined)
  REGISTRY = docker.io
endif

ifeq ($(origin VERSION), undefined)
  VERSION = 1.1.0.2
endif


IMAGE_BASE = $(REGISTRY)/odise/meteor-base
IMAGE = $(IMAGE_BASE):$(VERSION)

build:
	docker build -t $(IMAGE) .

removeimage:
	docker rmi $(IMAGE) || true

run:
	docker run  \
		-ti --rm \
		--name meteor \
		-p 80:8282 \
    $(IMAGE) /bin/bash
	
release:
	docker tag $(IMAGE) $(IMAGE_BASE):latest
	docker push $(IMAGE) $(IMAGE_BASE):latest
