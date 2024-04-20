#!/bin/bash
#version=4.0.0
version=$(asd --version | awk '{print $5}' | cut -d. -f1-3)

file_path="/etc/aerospike/aerospike.conf"

if asconfig validate --aerospike-version "$version" "$file_path"; then
    echo "Validation successful"
else
    echo "Validation failed"
fi

