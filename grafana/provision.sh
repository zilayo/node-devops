#!/bin/bash

source_dashboards="$PWD/dashboards/."
target_dashboards="/etc/grafana/provisioning/dashboards/"

sudo cp -r "$source_dashboards" "$target_dashboards"

if [ $? -eq 0 ]; then
    echo "Dashboards copied successfully."
else
    echo "Failed to copy dashboards"
    exit 1
fi

find "$target_dashboards" -name '*.json' -exec sed -i 's/\${DS_PROMETHEUS}/Prometheus-op-stack-docker/g' {} \+

