milestones:

1. write parser to read `/etc/aerospike/aserospike.conf` and check for JSON indentation
2. Check for total namespaces if there are more than `32` namespaces, throw an error
3. Check if there are any duplicate namespaces, if yes throw an error
4. check for duplicate .dat files under `/opt/aerospike/data/` directory
