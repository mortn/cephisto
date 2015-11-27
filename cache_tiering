### Setup cache tiering
# Create new cache pool (don't reuse existing SSD pools)
ceph osd pool create vol-cache 128 128 replicated ssd
ceph osd tier add volumes vol-cache
ceph osd tier cache-mode vol-cache writeback

# Heads up: Activating vol-cache as overlay. 
ceph osd tier set-overlay volumes vol-cache

# Define cache tiering variables 
ceph osd pool set vol-cache hit_set_type bloom
ceph osd pool set vol-cache hit_set_count 1
ceph osd pool set vol-cache hit_set_period 3600
ceph osd pool set vol-cache target_max_bytes 1000000000000
