#!/bin/sh

rm -rf togetherjs || true
apk add git
git clone https://github.com/jsfiddle/togetherjs
cd togetherjs
npm install
chown -R $UID:$GID .