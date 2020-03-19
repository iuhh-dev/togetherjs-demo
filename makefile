PHONY: docker node
NODE_IMAGE=node:12-alpine
HUB_URL=http://localhost:8080
CLIENT_BASE_URL=http://localhost:4200

node:
	@docker stop temp || true
	@docker run -it --rm --name temp \
		-v $$(pwd):/usr/local/src -w /usr/local/src \
		-e NODE_OPTIONS=--max_old_space_size=4096 \
		-e NODE_ENV=development \
		$(NODE_IMAGE) sh

build:
	@docker run -it --rm --name temp \
		-v $$(pwd):/usr/local/src -w /usr/local/src \
		-e UID=$$(id -u) -e GID=$$(id -g) \
		-e NODE_ENV=development \
		-e HUB_URL=$(HUB_URL) \
		-e BASE_URL=$(CLIENT_BASE_URL) \
		-e HOME=. \
		-e NODE_OPTIONS=--max_old_space_size=4096 \
		$(NODE_IMAGE) ./build.sh

docker-build-server:
	@cp server/.dockerignore .dockerignore
	@docker build -f server/Dockerfile -t iuhhdev/togetherjs-server:latest .
	@rm .dockerignore

docker-build-client:
	@cp client/.dockerignore .dockerignore
	@docker build -f client/Dockerfile -t iuhhdev/togetherjs-client:latest .
	@rm .dockerignore

docker-test-server:
	@docker run --rm --name temp-server -p 8080:8080 -e HOST="0.0.0.0" iuhhdev/togetherjs-server

docker-test-client:
	@docker run --rm --name temp-client -p 4200:80 iuhhdev/togetherjs-client
