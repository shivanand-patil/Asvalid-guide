https://support.aerospike.com/s/article/How-to-change-data-size-config-in-a-running-cluster?_gl=1*jcckj*_ga*Mjc5MjQzNjA4LjE3MTMyNjg3MTg.*_ga_HSLESVGFW2*MTcxNjAxODQxNS43NS4xLjE3MTYwMjA3MjYuMTUuMC4w

1. How to change data-size config in a running cluster?
		- The [data-size](https://aerospike.com/docs/server/reference/configuration?search=data-size#namespace__data-size) setting was introduced in Aerospike server 7.0. It specifies the total amount of memory allocated in Shared Memory for the namespace's eight virtual devices. This size is split into 8 stripes. The stripes appear individually in the logs. (ie:  stripe-3.0xad002003 where the 0xad hexadecimal prefix helps identify the shared memory segments key for the stripes)
		- When changing the size of the data-size setting on a pre-existing config, the server will fail to start if the shared memory has not been released prior to starting the server with the new stripe size.
		- The solution is to either clear the shared memory with a tool like ipcrm or reboot the machine.

2. 
