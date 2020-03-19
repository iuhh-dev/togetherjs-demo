#!/bin/sh

rm -rf togetherjs || true
apk add git
git clone --depth 1 https://github.com/jsfiddle/togetherjs
cd togetherjs

# package-lock.json version is outdated, need to remove before install
rm package-lock.json
npm install
npm install grunt-cli

# HUB_URL and BASE_URL is needed static copy of client side javascript
echo HUB_URL = $HUB_URL
echo BASE_URL = $BASE_URL
./node_modules/.bin/grunt build --base-url=$BASE_URL --no-hardlink
chown -R $UID:$GID .