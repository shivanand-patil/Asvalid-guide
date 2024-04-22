#!/bin/bash

# Validate python script
python3 validate.py

# Check for errors
if [ $? -ne 0 ]; then
    echo "Structure not good, server-valid.py encountered errors. Exiting."
    exit 1
fi

# Proceed if no errors
file_path="/etc/aerospike/aerospike.conf"


# Get Aerospike version
version=$(asd --version | awk '{print $5}' | cut -d. -f1-3)

echo "Structure is good. Evaluating $file_path against version $version config schema."

# Validate configuration using asconfig
if asconfig validate --aerospike-version "$version" "$file_path"; then

    echo "Validation successful for Aerospike version $version."

    read -p "Do you want to restart the server to apply changes? (y/n): " choice
    if [ "$choice" == "y" ]; then
        systemctl restart aerospike
        echo "Aerospike server restarted successfully."
    else
        echo "No action taken. Exiting"
    fi
else
    echo "Validation failed for Aerospike version $version."
fi

