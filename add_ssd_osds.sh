#
#  Adding SSD OSDs on existing spinning disk OSD nodes
#
#  In the test phase I check with "ceph osd tree"
#  after most commands to see how tree evolves 
#

# Create the Ceph root bucket 
ceph osd crush add-bucket ssd root

# Create a new ruleset
# ceph osd crush rule create-simple <name> <root> <type>
ceph osd crush rule create-simple ssd ssd host

# Creating logical host buckets
# We just add "-ssd" to the actual hostname of the nodes
ceph osd crush add-bucket osdhost1-ssd host
ceph osd crush add-bucket osdhost2-ssd host

# Now, do a check with:
ceph osd tree
# You shoud see the host buckets on the root level of the tree

# Move the SSD host buckets to the SSD root bucket
ceph osd crush move osdhost1-ssd root=ssd
ceph osd crush move osdhost2-ssd root=ssd

# And check again (of course, I know you want to):
ceph osd tree

# Now turn our 250G SSDs into OSDs.
# osdhost1 has 2 SSDs and osdhost2 has just 1
ceph-ceploy osd create osdhost1:/dev/sdb
ceph-ceploy osd create osdhost1:/dev/sdc
ceph-ceploy osd create osdhost2:/dev/sdc

# Add the OSDs to the tree under their nodes
ceph osd crush add 11 0.230 host=osdhost1-ssd
ceph osd crush add 12 0.230 host=osdhost1-ssd
ceph osd crush add 13 0.230 host=osdhost2-ssd

