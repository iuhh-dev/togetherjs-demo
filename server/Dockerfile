FROM node:12-alpine as builder
LABEL version="1.0" maintainer="IUHH <me@iuhh.dev>"

WORKDIR /usr/local/src
ENV NODE_ENV=production

RUN apk add git && \
  git clone https://github.com/jsfiddle/togetherjs && \
  cd togetherjs && rm -rf .git && \
  npm install && apk del git
#is-typedarray         ms                    optimist              websocket             wordwrap
#minimist              nan                   typedarray-to-buffer  websocket-server      yaeti
#
FROM node:12-alpine
LABEL version="1.0" maintainer="IUHH <me@iuhh.dev>"

WORKDIR /usr/local/src
ENV NODE_ENV=production

COPY --from=builder /usr/local/src/togetherjs/hub /usr/local/src/hub/
COPY --from=builder /usr/local/src/togetherjs/node_modules/ /usr/local/src/node_modules/
#RUN cd togetherjs && \
#  mkdir ../node_modules && mv hub ../ && mv node_modules/websocket* ../node_modules && mv package.json ../package.json && \
#  cd .. && rm -rf togetherjs
ENTRYPOINT ["node", "./hub/server.js", "--host", "0.0.0.0"]