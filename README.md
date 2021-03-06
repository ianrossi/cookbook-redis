Description
===========
Installs and configures Redis.

Requirements
============
No external cookbook dependencies.

Attributes
==========
These attributes map to values in redis.conf.

```
node.default[:redis][:conf_dir]                = "/etc/redis"
node.default[:redis][:pid_file]                = "/var/run/redis.pid"
node.default[:redis][:port]                    = 6379
node.default[:redis][:bind_address]            = "127.0.0.1"
node.default[:redis][:timeout]                 = 300
node.default[:redis][:log_level]               = "notice"
node.default[:redis][:log_file]                = "/var/log/redis/redis.log"
node.default[:redis][:databases]               = 16
node.default[:redis][:append_only]             = "no"
node.default[:redis][:append_fsync]            = "always"
node.default[:redis][:vm_enabled]              = "no"
node.default[:redis][:vm_swap_file]            = "/tmp/redis.swap"
node.default[:redis][:vm_max_memory]           = nil
node.default[:redis][:vm_maxmemory_policy]     = "volatile-lru"
node.default[:redis][:vm_page_size]            = 32
node.default[:redis][:vm_pages]                = 134217728
node.default[:redis][:vm_overcommit_memory]    = true
node.default[:redis][:vm_max_threads]          = 4
node.default[:redis][:glue_output_buf]         = "yes"
node.default[:redis][:hash_max_zipmap_entries] = 64
node.default[:redis][:hash_max_zipmap_value]   = 512
node.default[:redis][:activerehashing]         = "yes"
node.default[:redis][:include_paths]           = Array.new
node.default[:redis][:rdbcompression]          = "yes"
node.default[:redis][:dbfilename]              = "dump.rdb"
node.default[:redis][:db_dir]                  = "/var/lib/redis/"
node.default[:redis][:snapshot_saves]          = [
  { 900 => 1 },
  { 300 => 10 },
  { 60 => 10000 }
]
```

Usage
=====
Place "recipe[redis]" in the run list of a role or node. Make sure the node has a yum repository which contains a package called "redis".