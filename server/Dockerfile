FROM node:12-alpine
LABEL version="1.0" maintainer="IUHH <me@iuhh.dev>"

WORKDIR /usr/local/src
ENV NODE_ENV=production
EXPOSE 8080

COPY server/package.json package.json
COPY togetherjs/ togetherjs/
CMD ["npm", "start"]