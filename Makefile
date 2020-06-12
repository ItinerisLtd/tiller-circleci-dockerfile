IMAGE_NAME=itinerisltd/tiller-circleci

.PHONY: docker-build docker-push

docker-build: docker-build-base docker-build-node-10 docker-build-node-12 docker-build-node-14

docker-build-base:
	docker build --tag ${IMAGE_NAME}:base --build-arg PYTHON_MINOR_VERSION=3.8 base

docker-build-node-%: docker-build-base
	docker build --tag ${IMAGE_NAME}:node-$* --build-arg NODE_MAJOR_VERSION=$* node

docker-push: docker-push-base docker-push-node-10 docker-push-node-12 docker-push-node-14

docker-push-base: docker-build-base
	docker push ${IMAGE_NAME}:base

docker-push-node-%: docker-build-node-% docker-push-base
	docker push ${IMAGE_NAME}:node-$*
