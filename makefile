PHONY: docker
NODE_IMAGE=node:12-alpine

test:
	@docker stop temp || true
	@docker run -it --rm --name temp -w /usr/local/src -e UID=$$(id -u) -e GID=$$(id -g) $(NODE_IMAGE) sh

build:
	@docker run -it --rm --name temp \
		-v $$(pwd):/usr/local/src -w /usr/local/src \
		-e UID=$$(id -u) -e GID=$$(id -g) \
		-e NODE_ENV=production \
		-e HOME=. \
		-e NODE_OPTIONS=--max_old_space_size=4096 \
		$(NODE_IMAGE) ./build.sh

node:
	@docker stop temp || true
	@docker run -it --rm --name temp -u $$(id -u):$$(id -g) \
		-v $$(pwd):/usr/local/src -w /usr/local/src \
		-p 8080:8080 \
		-e NODE_ENV=production \
		-e HOME=. \
		-e NODE_OPTIONS=--max_old_space_size=8192 \
		$(NODE_IMAGE) sh

docker-build-server:
	@cp server/.dockerignore .dockerignore
	@docker build -f server/Dockerfile -t iuhhdev/togetherjs-server:latest .
	@rm .dockerignore

docker-test-server:
	@docker run --rm --name temp-server -p 8080:8080 -e HOST="0.0.0.0" iuhhdev/togetherjs-server

docker-test-client:
	@docker run --rm --name temp-client -p 4200:80 test

# build:
# 	@HUB_URL=http://localhost:8080 ./node_modules/.bin/grunt build --base-url=http://localhost:4200 --no-hardlink --dest=static-myapp