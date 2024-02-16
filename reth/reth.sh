#!/bin/bash
set -e

RUST_LOG="debug,net=trace"
RUST_LOG_TARGET=1

ADDITIONAL_ARGS=""

if [ -n "${EXECUTION_BOOTNODES-}" ]; then
    ADDITIONAL_ARGS="$ADDITIONAL_ARGS --bootnodes=$EXECUTION_BOOTNODES"
fi

if [ -n "${EXECUTION_TRUSTED_PEERS-}"  ]; then
    ADDITIONAL_ARGS="$ADDITIONAL_ARGS --trusted-peers=$EXECUTION_TRUSTED_PEERS"
fi

PUBLIC_IP=$(curl -s v4.ident.me)

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
    --addr="0.0.0.0" \
    --discovery.addr="0.0.0.0" \
    --discovery.port="31303" \
    --log.file.directory /root/rethlogs \
    -vvv \
    --max-outbound-peers 500 \
    --max-inbound-peers 100 \
    --nat extip:"$PUBLIC_IP" \
    $ADDITIONAL_ARGS
