#!/bin/bash

RADICLE_DIR=/radicle/
PEER_LISTEN=${PEER_LISTEN:-0.0.0.0:12345}
HTTP_LISTEN=${HTTP_LISTEN:-0.0.0.0:8889}
NAME=${NAME:-radicle}

if [ -z "${PUBLIC_ADDR}" ]; then
  echo "PUBLIC_ADDR must be set" 1>&2
  exit 1
fi

cd ${RADICLE_DIR}

if [ ! -d ".seed" ]; then
  mkdir ".seed"
fi

if [ ! -f ".seed/secret.key" ]; then
  ./radicle-keyutil --filename `pwd`/.seed/secret.key
fi


./radicle-seed-node \
  --root `pwd`/.seed \
  --assets-path `pwd`/ui \
  --peer-listen ${PEER_LISTEN} \
  --http-listen ${HTTP_LISTEN} \
  --name "${NAME}" \
  --public-addr "${PUBLIC_ADDR}" \
  < `pwd`/.seed/secret.key
