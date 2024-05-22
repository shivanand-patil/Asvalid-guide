Aerospike uses a single file to configure a database node. The default location of the configuration file is `/etc/aerospike/aerospike.conf`.

The configuration file is divided into different _contexts_, some of which are optional. These contexts can be in any order in the configuration file. A context can be further divided into sub-contexts.

The maximum length of a line in the configuration file is 1,024 characters. (Prior to Aerospike Server 5.0, the line length limit was 256 characters.)

You can use any port between 1024 and 65335 for Aerospike, as long as the port is not in use by an existing process.