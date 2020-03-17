PHONY: docker
NODE_IMAGE=node:12-alpine

test:
	@docker stop temp || true
	@docker run -it --rm --name temp -w /usr/local/src $(NODE_IMAGE) sh

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
	@docker build ./server -t iuhhdev/togetherjs-server:latest

docker-test-server:
	@docker run --rm --name temp-server -p 8080:8080 iuhhdev/togetherjs-server

docker-test-client:
	@docker run --rm --name temp-client -p 4200:80 test

build:
	@HUB_URL=http://localhost:8080 ./node_modules/.bin/grunt build --base-url=http://localhost:4200 --no-hardlink --dest=static-myapp