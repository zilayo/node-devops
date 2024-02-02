#!/bin/sh
set -e

L1_RPC_URL="http://host.docker.internal:8545"
EXECUTION_CLIENT="op-reth"
RPC_PORT=9645
SYNC_MODE="full"

magi \
    --network "./rollup.json" \
    --jwt-secret $(cat $JWT_PATH) \
    --l1-rpc-url $L1_RPC_URL \
    --l2-rpc-url http://${EXECUTION_CLIENT}:9545 \
    --l2-engine-url http://${EXECUTION_CLIENT}:9551 \
    --rpc-port $RPC_PORT \
    --sync-mode $SYNC_MODE \
    -v \
    --logs-dir /root/magilogs/