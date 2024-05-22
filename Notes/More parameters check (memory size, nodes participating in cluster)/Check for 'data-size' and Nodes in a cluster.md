reference: https://aerospike.com/docs/server/reference/configuration?search=memory&context=all&version=7&all=true#namespace__data-size

goal:

1. check for all the nodes mentioned in heartbeat context and get their ip
2. check for nodes online in a cluster and compare with the config and report warnings if some nodes are offline
3. check for `data-size` in  `storage-engine memory` for all namespaces and report warning if the memory exceeds host machine's system memory 
```
	namespace test-new {
		replication-factor 2

		storage-engine memory {
			data-size 4G
	}
```

output:
```
Warning: The following nodes are configured but not participating in the cluster:
192.168.64.46
Warning: Total configured data-size (8.00 GiB) exceeds system memory (0.94 GiB)
```
