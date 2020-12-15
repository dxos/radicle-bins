#!/bin/bash

DOCKER_DIR=`pwd`

cargo build -p radicle-seed-node --release
cp -f ../target/release/radicle-seed-node .

cargo build -p radicle-keyutil --release
cp -f ../target/release/radicle-keyutil .

cd ../seed/ui/
yarn
yarn build
cd $DOCKER_DIR
rm -f ui
cp -rf ../seed/ui/public ui

sudo docker build .
