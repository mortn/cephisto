# Cephisto
My Ceph stuff

#### Checking the Ceph cluster:
- `ceph osd tree` (all the time)
- `ceph [osd | pg | mon | mds] dump`
- `ceph status`
- `ceph health`, or `ceph health detail` for getting info on unhealthy _pg_'s
- `ceph df`
- `ceph auth list`

##### Continous monitoring:
-  `ceph -w`

