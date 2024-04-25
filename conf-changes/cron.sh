#!/bin/bash

# persist last run file
flag_file="/var/run/aerospike_last_run.flag"

# get the last modification time of AS
last_modified=$(systemctl show -p ActiveEnterTimestamp aerospike | cut -d'=' -f2)

# check for last run 
if [ -f "$flag_file" ]; then
    last_run=$(cat "$flag_file")
else
    last_run="1970-01-01 00:00:00"  # Use a very old date as a fallback
    echo "$last_run" > "$flag_file"  # Initialize the file with the old date
fi

# run the preserve script if AS was restarted after the last run
if [[ "$last_modified" > "$last_run" ]]; then
    /etc/aerospike/preserve
    # update
    echo "$last_modified" > "$flag_file"
fi
