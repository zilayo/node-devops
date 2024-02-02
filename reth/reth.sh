#!/bin/bash
set -eu

exec /usr/local/bin/op-reth node \
    --chain "$CHAIN_NAME" \
    --rollup.sequencer-http "$SEQUENCER_URL" \
    --datadir="/root/rethdata" \
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
    --port="31303" \
    --discovery.port="31303" \
    --log.file.directory /root/rethlogs \
    -vvv \
    --max-outbound-peers 500 \
    --max-inbound-peers 100 \
    --bootnodes "$BOOTNODES"
