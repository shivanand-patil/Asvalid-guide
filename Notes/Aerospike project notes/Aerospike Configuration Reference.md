https://aerospike.com/docs/server/reference/configuration/

https://aerospike.com/docs/server/operations/configure

**Configuration Check Steps**

1. Feature-key file:
	- The feature-key file is a cryptographically-signed list of enabled server features, issued upon purchase of a paid version of Aerospike Server. Aerospike Database Enterprise Edition (EE) and Aerospike Database Standard Edition (SE) require a feature-key file to start up. Aerospike Database Community Edition (CE) does not use a feature-key file.
	
 2. Namespaces
    - The minimum requirement for configuring a namespace is to provide a namespace-name. This will create an in memory namespace by that name with a 4GB capacity. The configuration would be similar to the following, the commented parameters indicate the defaults.
```
...
namespace someNameSpaceName {
  ...
  memory-size 256G
  replication-factor 2
  storage-engine device {
    ...
    ...
  }

}
...

```

There is a maximum limit of 32 namespaces in a cluster in the Aerospike Enterprise Edition Server version and 2 namespaces in a cluster in the Aerospike Community Edition Server version (as of version 4.0).
    - 
    
