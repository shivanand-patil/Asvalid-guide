#!/bin/bash

baseline_config="/path/to/baseline_config.txt"
current_config="/path/to/current_runtime_config.txt"

asinfo -v 'get-config:' -l > "$current_config"

if ! diff "$baseline_config" "$current_config" > /dev/null; then
    echo "Configuration has changed"
    diff "$baseline_config" "$current_config"
fi
