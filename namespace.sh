#!/bin/bash

output_file="test1.conf"

echo "# Aerospike database configuration file" >> "$output_file"

for i in {1..32}; do
    echo "
namespace bar$i {
    replication-factor 2
    memory-size 4G
    storage-engine memory
}" >> "$output_file"
done

