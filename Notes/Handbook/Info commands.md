```
asinfo -v 'set-config:context=<context name>;id=<optional id>;<parameter name>=<parameter value>' -l
```

asinfo -v 'set-config:context=service;proto-fd-max=14000' 
  
asinfo -v "set-config:context=network;heartbeat.interval=200"

asinfo -v "set-config:context=namespace;id=bar;evict-sys-memory-pct=80"

asinfo -v "set-config:context=namespace;id=test;max-record-size=2"




`evict-sys-memory-pct` (Above Version 7.x.x.x) is same as 
`high-water-memory-pct` (Prior to version 7.x.x.x)
description: eviction threshold as a percentage of system memory

`asinfo -v "set-config:context=namespace;id=bar;stop-writes-sys-memory-pct=80"`










