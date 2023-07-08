#!/usr/bin/env sh

if [ -d '/blockchain/data/geth/chaindata' ]
  then
    echo "already initialized"
    bsc --config /blockchain/config/config.toml --datadir /blockchain/data
  else
    echo "initializing with genesis"
    bsc --config /blockchain/config/config.toml --datadir /blockchain/data init /blockchain/config/genesis.json
    sleep 2
    echo "starting bsc"
    bsc --config /blockchain/config/config.toml --datadir /blockchain/data
fi
