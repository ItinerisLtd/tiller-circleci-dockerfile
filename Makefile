IMAGE_NAME:=itinerisltd/tiller-circleci
VERSION:=$(shell date -u +%Y.%m.%d)

.PHONY: docker-build docker-push docker-push-stable

docker-build: docker-build-base docker-build-node-10 docker-build-node-12 docker-build-node-14
docker-push: docker-push-base docker-push-node-10 docker-push-node-12 docker-push-node-14
docker-push-stable: docker-push-base-stable docker-push-node-10-stable docker-push-node-12-stable docker-push-node-14-stable

docker-build-base:
	docker build --tag ${IMAGE_NAME}:base --tag ${IMAGE_NAME}:base-${VERSION} base

docker-build-node-%: docker-build-base
	docker build --tag ${IMAGE_NAME}:node-$* --tag ${IMAGE_NAME}:node-$*-${VERSION} --build-arg NODE_MAJOR_VERSION=$* node

docker-push-base: docker-build-base
	docker push ${IMAGE_NAME}:base-${VERSION}

docker-push-base-stable: docker-build-base
	docker push ${IMAGE_NAME}:base

docker-push-node-%: docker-build-node-% docker-push-base
	docker push ${IMAGE_NAME}:node-$*-${VERSION}

docker-push-node-%-stable: docker-build-node-% docker-push-base
	docker push ${IMAGE_NAME}:node