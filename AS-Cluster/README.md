## Installation Guide

- Download Aerospike Community Edition from [here](https://aerospike.com/download/)

- Make sure to check for your VM architecture, OS-Version and download appropriate AS Server. 
You can use following commands to check the same:

```bash
lsb_release -a
```

```bash
uname -m
```

## 3-Node cluster config explaination


### Network Configuration
- **service**: Defines the service network configuration.
  - `address`: Specifies that the service should listen on any available IP address.
  - `port`: Sets the port number for client connections to 3000.

- **heartbeat**: Configures the heartbeat subsystem for cluster communication.
  - `mode`: Specifies the heartbeat mode as "mesh", indicating a mesh network configuration where each node communicates with every other node.
  - `port`: Sets the port number for heartbeat communication to 3002.

  - **Mesh Seed Addresses**: Specifies the IP addresses and ports of seed nodes in the cluster, used for node discovery.
    ```bash
    heartbeat {
    		mode mesh 
		port 3002
   
    	# IP addresses for seed nodes in the cluster

    	mesh-seed-address-port  192.168.64.15 3002        # VM-1
    	mesh-seed-address-port  192.168.64.16 3002        # VM-2
    	mesh-seed-address-port  192.168.64.17 3002        # VM-3

   	interval 150                # Number of milliseconds between heartbeats
   	timeout 10
    }                # Number of heartbeat intervals to wait before timing out a node
    ```

  
      - `mesh-seed-address-port`: Defines the IP address and port of each seed node in the cluster.
      - `192.168.64.15 3002`: Seed node on VM-1.
      - `192.168.64.16 3002`: Seed node on VM-2.
      - `192.168.64.17 3002`: Seed node on VM-3.

      - `interval`: Sets the interval between heartbeats to 150 milliseconds.
      - `timeout`: Defines the number of heartbeat intervals to wait before timing out a node, set to 10 intervals.

- **fabric**: Specifies the port number for inter-node communication within the cluster to 3001.

### Aerospike clustering utilizes two main methods:

- **Multicast**: Utilizes IP addresses and ports to broadcast heartbeat messages, allowing nodes to communicate and discover each other via a multicast group address.

- **Mesh**: Relies on the address of a single Aerospike server (seed node) to join the cluster. Nodes communicate directly with each other using unicast communication, offering flexibility and scalability.

- Read more about Multicast and Mesh [here](https://aerospike.com/docs/server/architecture/clustering.html)


