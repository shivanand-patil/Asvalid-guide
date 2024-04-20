#!/bin/bash

python3 valid.py

if [ $? -ne 0 ]; then
    echo "Structure not good, server-valid.py encountered errors. Exiting."
    exit 1
fi

# proceed if no errors
file_path="/etc/aerospike/aerospike.conf"
echo " Structure is good, Evaluating $file_path against config schema "


# get AS version
version=$(asd --version | awk '{print $5}' | cut -d. -f1-3)


# asconfig
if asconfig validate --aerospike-version "$version" "$file_path"; then
    echo "Validation successful"
else
    echo "Validation failed"
fi
