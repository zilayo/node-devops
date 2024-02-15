#!/bin/sh
set -e

RUST_LOG="debug,discv5=trace"
RUST_LOG_TARGET=1

L1_RPC_URL="http://host.docker.internal:8545"
EXECUTION_CLIENT="op-reth"
RPC_PORT=9645
RPC_ADDR="0.0.0.0"
SYNC_MODE="full"

ADDITIONAL_ARGS=""

# TODO - currently magi doesn't support configuring bootnodes/trusted peers

if [ -n "${ROLLUP_BOOTNODES-}" ]; then
    ADDITIONAL_ARGS="$ADDITIONAL_ARGS --bootnodes=$ROLLUP_BOOTNODES"
fi

if [ -n "${ROLLUP_TRUSTED_PEERS-}" ]; then
    ADDITIONAL_ARGS="$ADDITIONAL_ARGS --trusted-peers=$ROLLUP_TRUSTED_PEERS"
fi

exec /usr/local/bin/magi \
    --network "$CHAIN_NAME" \
    --jwt-secret $(cat $JWT_PATH) \
    --l1-rpc-url $L1_RPC_URL \
    --l2-rpc-url http://${EXECUTION_CLIENT}:9545 \
    --l2-engine-url http://${EXECUTION_CLIENT}:9551 \
    --rpc-port "$RPC_PORT" \
    --rpc-addr "$RPC_ADDR" \
    --sync-mode "$SYNC_MODE" \
    --logs-dir /root/magilogs/ \
    $ADDITIONAL_ARGS