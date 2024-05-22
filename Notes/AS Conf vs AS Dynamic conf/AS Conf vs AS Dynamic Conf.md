- AS Server by default listens to conf file that sits in `/etc/aerospike/aerospike.conf` and is only applied when the server is started/restarted
- But an SRE can make *Configuration Changes* dynamically using `asadm enable` privileged commands
```
root@VM-1:/etc/aerospike# asadm

Seed:        [('127.0.0.1', 3000, None)]
Config_file: /root/.aerospike/astools.conf, /etc/aerospike/astools.conf
Aerospike Interactive Shell, version 2.22.0

Found 3 nodes
Online:  192.168.64.15:3000, 192.168.64.17:3000, 192.168.64.16:3000

Admin> enable

Admin+> manage config service param proto-fd-max to 15000 with 192.168.64*
Admin+> manage config namespace <NAMESPACE> param memory-size to 3G`

~Set Service Param proto-fd-max to 15000~
              Node|Response
192.168.64.16:3000|ok
192.168.64.17:3000|ok
VM-1:3000         |ok
Number of rows: 3
```
- Above example dynamically changes the *proto-fd-max* parameter in all nodes participating in a cluster using *manage config* command during *run time*
- IMPORTANT: However when the server gets restarted, The server reads the aerospike.conf by default and the *previous changes that was made during run time will be lost* 

### **How do i do it?**

**Plan for week-2**

Goal: Custom script to compare `aerospike.conf` and configuration changes made during 
`run time (dynamic)` 

1. At AS server startup or restart, i will capture the config into a baseline.txt file by running :(This file will represent the initial state of the runtime configuration that should match the `aerospike.conf` at startup.)
		
```
asinfo -v 'get-config' -l
```

2. Any runtime (dynamic) changes made as the server is running, the changes will be captured (using the same asinfo command) in other file called `runtime.txt`
3. Compare the changes/differences and report if any inconsistencies.
4. Apply this concept to a standalone node at first and then expand the idea into a cluster
			