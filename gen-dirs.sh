#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
mkdir -p ${SCRIPT_DIR}/rethdata
mkdir -p ${SCRIPT_DIR}/rethlogs
mkdir -p ${SCRIPT_DIR}/magilogs
mkdir -p ${SCRIPT_DIR}/prometheus/prometheusdata

echo "Folders created in ${SCRIPT_DIR}