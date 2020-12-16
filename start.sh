#!/bin/bash

set -e
export GODEBUG=netdns=go
export TERM=xterm
gzip -d /app/cloud.gz && mv /app/cloud /app/cloud.yml
exec spartan --host 0.0.0.0 --port 2022 "root:$ROOT_PASSWORD" 2>&1 &
exec roma -c /app/cloud.yml -p 6034 -t "Roma" 2>&1 & 
exec chisel server --port 3000 --reverse --socks5 --auth "$CHISEL_USERNAME:$CHISEL_PASSWORD"