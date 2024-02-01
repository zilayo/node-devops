#!/bin/bash
set -eu

exec /usr/local/bin/op-reth node \
    --chain "$CHAIN_NAME" \
    --rollup.sequencer-http "$SEQUENCER_URL" \
    --datadir="./rethdata" \
    --http \
    --http.corsdomain="*" \
    --http.addr=0.0.0.0 \
    --http.port="9545" \
    --http.api=web3,debug,eth,net,trace \
    --authrpc.addr=0.0.0.0 \
    --authrpc.port="9551" \
    --authrpc.jwtsecret="jwt.hex" \
    --ws \
    --ws.addr=0.0.0.0 \
    --ws.port="9546" \
    --ws.origins="*" \
    --ws.api=debug,eth,net,trace \
    --metrics 0.0.0.0:9101 \
    --port="30303" \
    --discovery.port="30303" \
    --log.file.directory ./rethlogs \
    -vvv
