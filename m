Content-Type: multipart/mixed; boundary="===============1662019724692853006=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: fs/btrfs/delayed-inode.c:1885:24: warning: Uninitialized variables: delayed_node.inode_id, delayed_node.bytes_reserved, delayed_node.root, delayed_node.n_list, delayed_node.p_list, delayed_node.ins_root, delayed_node.del_root, delayed_node.mutex, delayed_...
Date: Sun, 03 Jul 2022 07:40:37 +0800
Message-ID: <202207030701.M1tFEYrd-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1662019724692853006==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: fs/btrfs/=
delayed-inode.c:1885:24: warning: Uninitialized variables: delayed_node.ino=
de_id, delayed_node.bytes_reserved, delayed_node.root, delayed_node.n_list,=
 delayed_node.p_list, delayed_node.ins_root, delayed_node.del_root, delayed=
_node.mutex, delayed_node.inode_item, delayed_node.index_cnt, delayed_node.=
flags, delayed_node.count [uninitvar]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Gabriel Niebler <gniebler@suse.com>
CC: David Sterba <dsterba@suse.com>
CC: Nikolay Borisov <nborisov@suse.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   69cb6c6556ad89620547318439d6be8bb1629a5a
commit: 253bf57555e451dec5a7f09dc95d380ce8b10e5b btrfs: turn delayed_nodes_=
tree into an XArray
date:   7 weeks ago
:::::: branch date: 5 hours ago
:::::: commit date: 7 weeks ago
compiler: sparc64-linux-gcc (GCC) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 253bf57555e451dec5a7f09dc95d380ce8b10e5b
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)
   In file included from fs/btrfs/ordered-data.c:
>> fs/btrfs/zoned.c:117:7: warning: Local variable 'i' shadows outer variab=
le [shadowVariable]
     int i;
         ^
   fs/btrfs/zoned.c:83:6: note: Shadowed declaration
    int i;
        ^
   fs/btrfs/zoned.c:117:7: note: Shadow variable
     int i;
         ^

cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   In file included from fs/btrfs/ordered-data.c:
>> fs/btrfs/ordered-data.c:314:7: warning: Local variable 'entry_end' shado=
ws outer function [shadowFunction]
     u64 entry_end;
         ^
   fs/btrfs/ordered-data.c:23:12: note: Shadowed declaration
   static u64 entry_end(struct btrfs_ordered_extent *entry)
              ^
   fs/btrfs/ordered-data.c:314:7: note: Shadow variable
     u64 entry_end;
         ^
>> fs/btrfs/ordered-data.c:653:28: warning: Uninitialized variables: ordere=
d.file_offset, ordered.num_bytes, ordered.ram_bytes, ordered.disk_bytenr, o=
rdered.disk_num_bytes, ordered.offset, ordered.bytes_left, ordered.outstand=
ing_isize, ordered.truncated_len, ordered.flags, ordered.compress_type, ord=
ered.qgroup_rsv, ordered.refs, ordered.inode, ordered.list, ordered.log_lis=
t, ordered.wait, ordered.rb_node, ordered.root_extent_list, ordered.work, o=
rdered.flush_work, ordered.physical, ordered.bdev [uninitvar]
     btrfs_put_ordered_extent(ordered);
                              ^
   fs/btrfs/ordered-data.c:619:30: note: Assuming condition is false
    while (!list_empty(&splice) && nr) {
                                ^
   fs/btrfs/ordered-data.c:619:30: note: Assuming condition is false
    while (!list_empty(&splice) && nr) {
                                ^
   fs/btrfs/ordered-data.c:619:30: note: Assuming condition is false
    while (!list_empty(&splice) && nr) {
                                ^
   fs/btrfs/ordered-data.c:619:30: note: Assuming condition is false
    while (!list_empty(&splice) && nr) {
                                ^
   fs/btrfs/ordered-data.c:619:30: note: Assuming condition is false
    while (!list_empty(&splice) && nr) {
                                ^
   fs/btrfs/ordered-data.c:619:30: note: Assuming condition is false
    while (!list_empty(&splice) && nr) {
                                ^
   fs/btrfs/ordered-data.c:619:30: note: Assuming condition is false
    while (!list_empty(&splice) && nr) {
                                ^
   fs/btrfs/ordered-data.c:619:30: note: Assuming condition is false
    while (!list_empty(&splice) && nr) {
                                ^
   fs/btrfs/ordered-data.c:619:30: note: Assuming condition is false
    while (!list_empty(&splice) && nr) {
                                ^
   fs/btrfs/ordered-data.c:619:30: note: Assuming condition is false
    while (!list_empty(&splice) && nr) {
                                ^
   fs/btrfs/ordered-data.c:619:30: note: Assuming condition is false
    while (!list_empty(&splice) && nr) {
                                ^
   fs/btrfs/ordered-data.c:619:30: note: Assuming condition is false
    while (!list_empty(&splice) && nr) {
                                ^
   fs/btrfs/ordered-data.c:619:30: note: Assuming condition is false
    while (!list_empty(&splice) && nr) {
                                ^
   fs/btrfs/ordered-data.c:619:30: note: Assuming condition is false
    while (!list_empty(&splice) && nr) {
                                ^
   fs/btrfs/ordered-data.c:619:30: note: Assuming condition is false
    while (!list_empty(&splice) && nr) {
                                ^
   fs/btrfs/ordered-data.c:619:30: note: Assuming condition is false
    while (!list_empty(&splice) && nr) {
                                ^
   fs/btrfs/ordered-data.c:619:30: note: Assuming condition is false
    while (!list_empty(&splice) && nr) {
                                ^
   fs/btrfs/ordered-data.c:619:30: note: Assuming condition is false
    while (!list_empty(&splice) && nr) {
                                ^
   fs/btrfs/ordered-data.c:619:30: note: Assuming condition is false
    while (!list_empty(&splice) && nr) {
                                ^
   fs/btrfs/ordered-data.c:619:30: note: Assuming condition is false
    while (!list_empty(&splice) && nr) {
                                ^
   fs/btrfs/ordered-data.c:619:30: note: Assuming condition is false
    while (!list_empty(&splice) && nr) {
                                ^
   fs/btrfs/ordered-data.c:619:30: note: Assuming condition is false
    while (!list_empty(&splice) && nr) {
                                ^
   fs/btrfs/ordered-data.c:619:30: note: Assuming condition is false
    while (!list_empty(&splice) && nr) {
                                ^
   fs/btrfs/ordered-data.c:653:28: note: Uninitialized variables: ordered.f=
ile_offset, ordered.num_bytes, ordered.ram_bytes, ordered.disk_bytenr, orde=
red.disk_num_bytes, ordered.offset, ordered.bytes_left, ordered.outstanding=
_isize, ordered.truncated_len, ordered.flags, ordered.compress_type, ordere=
d.qgroup_rsv, ordered.refs, ordered.inode, ordered.list, ordered.log_list, =
ordered.wait, ordered.rb_node, ordered.root_extent_list, ordered.work, orde=
red.flush_work, ordered.physical, ordered.bdev
     btrfs_put_ordered_extent(ordered);
                              ^
>> fs/btrfs/dev-replace.c:564:60: warning: Parameter 'srcdev' can be declar=
ed with const [constParameter]
   bool btrfs_finish_block_group_to_copy(struct btrfs_device *srcdev,
                                                              ^
   fs/btrfs/dev-replace.c:829:28: warning: Parameter 'srcdev' can be declar=
ed with const [constParameter]
         struct btrfs_device *srcdev,
                              ^
>> fs/btrfs/zoned.c:336:16: warning: Uninitialized variable: device->bdev [=
uninitvar]
     if (!device->bdev)
                  ^
   fs/btrfs/zoned.c:330:6: note: Assuming condition is false
    if (!btrfs_fs_incompat(fs_info, ZONED))
        ^
   fs/btrfs/zoned.c:336:16: note: Uninitialized variable: device->bdev
     if (!device->bdev)
                  ^
   fs/btrfs/zoned.c:642:16: warning: Uninitialized variable: device->bdev [=
uninitvar]
     if (!device->bdev)
                  ^
   fs/btrfs/zoned.c:1984:16: warning: Uninitialized variable: device->bdev =
[uninitvar]
     if (!device->bdev)
                  ^
   fs/btrfs/zoned.c:1976:6: note: Assuming condition is false
    if (!btrfs_is_zoned(fs_info))
        ^
   fs/btrfs/zoned.c:1984:16: note: Uninitialized variable: device->bdev
     if (!device->bdev)
                  ^
>> fs/btrfs/zoned.c:2069:15: warning: Uninitialized variable: device->zone_=
info [uninitvar]
     if (device->zone_info) {
                 ^
   fs/btrfs/zoned.c:2064:6: note: Assuming condition is false
    if (!btrfs_is_zoned(fs_info))
        ^
   fs/btrfs/zoned.c:2069:15: note: Uninitialized variable: device->zone_info
     if (device->zone_info) {
                 ^
   fs/btrfs/zoned.c:2092:16: warning: Uninitialized variable: device->bdev =
[uninitvar]
     if (!device->bdev)
                  ^
   fs/btrfs/zoned.c:2087:36: note: Assuming condition is false
    if (fs_info->bg_reclaim_threshold =3D=3D 0)
                                      ^
   fs/btrfs/zoned.c:2092:16: note: Uninitialized variable: device->bdev
     if (!device->bdev)
                  ^
   fs/btrfs/delayed-inode.c:1347:31: warning: Parameter 'disk_key' can be d=
eclared with const [constParameter]
          struct btrfs_disk_key *disk_key, u8 type,
                                 ^
   fs/btrfs/delayed-inode.c:1577:13: warning: Uninitialized variable: curr-=
>key [uninitvar]
     if (curr->key.offset > index)
               ^
   fs/btrfs/delayed-inode.c:1613:13: warning: Uninitialized variable: curr-=
>key [uninitvar]
     if (curr->key.offset < ctx->pos) {
               ^
   fs/btrfs/delayed-inode.c:1602:16: note: Assuming condition is false
    if (list_empty(ins_list))
                  ^
   fs/btrfs/delayed-inode.c:1613:13: note: Uninitialized variable: curr->key
     if (curr->key.offset < ctx->pos) {
               ^
>> fs/btrfs/delayed-inode.c:1885:24: warning: Uninitialized variables: dela=
yed_node.inode_id, delayed_node.bytes_reserved, delayed_node.root, delayed_=
node.n_list, delayed_node.p_list, delayed_node.ins_root, delayed_node.del_r=
oot, delayed_node.mutex, delayed_node.inode_item, delayed_node.index_cnt, d=
elayed_node.flags, delayed_node.count [uninitvar]
       delayed_nodes[n] =3D delayed_node;
                          ^
   fs/btrfs/delayed-inode.c:1874:15: note: Assuming condition is false
     if (xa_empty(&root->delayed_nodes)) {
                 ^
   fs/btrfs/delayed-inode.c:1874:15: note: Assuming condition is false
     if (xa_empty(&root->delayed_nodes)) {
                 ^
   fs/btrfs/delayed-inode.c:1874:15: note: Assuming condition is false
     if (xa_empty(&root->delayed_nodes)) {
                 ^
   fs/btrfs/delayed-inode.c:1874:15: note: Assuming condition is false
     if (xa_empty(&root->delayed_nodes)) {
                 ^
   fs/btrfs/delayed-inode.c:1874:15: note: Assuming condition is false
     if (xa_empty(&root->delayed_nodes)) {
                 ^
   fs/btrfs/delayed-inode.c:1874:15: note: Assuming condition is false
     if (xa_empty(&root->delayed_nodes)) {
                 ^
   fs/btrfs/delayed-inode.c:1874:15: note: Assuming condition is false
     if (xa_empty(&root->delayed_nodes)) {
                 ^
   fs/btrfs/delayed-inode.c:1874:15: note: Assuming condition is false
     if (xa_empty(&root->delayed_nodes)) {
                 ^
   fs/btrfs/delayed-inode.c:1874:15: note: Assuming condition is false
     if (xa_empty(&root->delayed_nodes)) {
                 ^
   fs/btrfs/delayed-inode.c:1874:15: note: Assuming condition is false
     if (xa_empty(&root->delayed_nodes)) {
                 ^
   fs/btrfs/delayed-inode.c:1874:15: note: Assuming condition is false
     if (xa_empty(&root->delayed_nodes)) {
                 ^
   fs/btrfs/delayed-inode.c:1874:15: note: Assuming condition is false
     if (xa_empty(&root->delayed_nodes)) {
                 ^
   fs/btrfs/delayed-inode.c:1885:24: note: Uninitialized variables: delayed=
_node.inode_id, delayed_node.bytes_reserved, delayed_node.root, delayed_nod=
e.n_list, delayed_node.p_list, delayed_node.ins_root, delayed_node.del_root=
, delayed_node.mutex, delayed_node.inode_item, delayed_node.index_cnt, dela=
yed_node.flags, delayed_node.count
       delayed_nodes[n] =3D delayed_node;
                          ^
   fs/btrfs/tree-log.h:52:28: warning: Uninitialized variables: ordered.fil=
e_offset, ordered.num_bytes, ordered.ram_bytes, ordered.disk_bytenr, ordere=
d.disk_num_bytes, ordered.offset, ordered.bytes_left, ordered.outstanding_i=
size, ordered.truncated_len, ordered.flags, ordered.compress_type, ordered.=
qgroup_rsv, ordered.refs, ordered.inode, ordered.list, ordered.wait, ordere=
d.rb_node, ordered.root_extent_list, ordered.work, ordered.completion, orde=
red.flush_work, ordered.work_list, ordered.physical, ordered.bdev [uninitva=
r]
     btrfs_put_ordered_extent(ordered);
                              ^
>> fs/btrfs/transaction.c:179:28: warning: Uninitialized variable: root->co=
mmit_root [uninitvar]
     free_extent_buffer(root->commit_root);
                              ^
>> fs/btrfs/transaction.c:229:30: warning: Uninitialized variable: cache [u=
ninitvar]
     if (btrfs_block_group_done(cache)) {
                                ^
   fs/btrfs/transaction.c:227:48: note: Assignment 'cache=3Dcaching_ctl->bl=
ock_group', assigned value is <Uninit>
     struct btrfs_block_group *cache =3D caching_ctl->block_group;
                                                  ^
   fs/btrfs/transaction.c:229:30: note: Uninitialized variable: cache
     if (btrfs_block_group_done(cache)) {
                                ^
>> fs/btrfs/transaction.c:929:11: warning: Uninitialized variable: t->state=
 [uninitvar]
      if (t->state >=3D TRANS_STATE_COMMIT_START) {
             ^
>> fs/btrfs/transaction.c:1885:40: warning: Uninitialized variables: pendin=
g.dentry, pending.dir, pending.root, pending.root_item, pending.snap, pendi=
ng.inherit, pending.path, pending.block_rsv, pending.error, pending.anon_de=
v, pending.readonly [uninitvar]
     ret =3D create_pending_snapshot(trans, pending);
                                          ^
>> fs/btrfs/scrub.c:1220:13: warning: Parameter 'raid_map' can be declared =
with const [constParameter]
          u64 *raid_map,
               ^
   fs/btrfs/tree-log.h:52:28: warning: Uninitialized variables: ordered.fil=
e_offset, ordered.num_bytes, ordered.ram_bytes, ordered.disk_bytenr, ordere=
d.disk_num_bytes, ordered.offset, ordered.bytes_left, ordered.outstanding_i=
size, ordered.truncated_len, ordered.flags, ordered.compress_type, ordered.=
qgroup_rsv, ordered.refs, ordered.inode, ordered.list, ordered.wait, ordere=
d.rb_node, ordered.root_extent_list, ordered.work, ordered.completion, orde=
red.flush_work, ordered.work_list, ordered.physical, ordered.bdev [uninitva=
r]
     btrfs_put_ordered_extent(ordered);
                              ^
>> fs/btrfs/ioctl.c:3665:15: warning: Uninitialized variable: device->devid=
 [uninitvar]
     if (device->devid > fi_args->max_id)
                 ^
   fs/btrfs/ioctl.c:3655:12: note: Assuming condition is false
    if (IS_ERR(fi_args))
              ^
   fs/btrfs/ioctl.c:3665:15: note: Uninitialized variable: device->devid
     if (device->devid > fi_args->max_id)
                 ^
>> fs/btrfs/ioctl.c:3831:38: warning: Uninitialized variable: block_group->=
length [uninitvar]
     space->total_bytes +=3D block_group->length;
                                        ^
>> fs/btrfs/ioctl.c:3867:13: warning: Uninitialized variable: tmp->flags [u=
ninitvar]
      if (tmp->flags =3D=3D types[i]) {
               ^
   fs/btrfs/ioctl.c:3920:13: warning: Uninitialized variable: tmp->flags [u=
ninitvar]
      if (tmp->flags =3D=3D types[i]) {
               ^
   fs/btrfs/ioctl.c:3915:7: note: Assuming condition is false
     if (!slot_count)
         ^
   fs/btrfs/ioctl.c:3920:13: note: Uninitialized variable: tmp->flags
      if (tmp->flags =3D=3D types[i]) {
               ^
>> fs/btrfs/send.c:6752:13: warning: Either the condition '*level=3D=3D0' i=
s redundant or the array 'path->nodes[8]' is accessed at index -1, which is=
 out of bounds. [negativeIndex]
    path->nodes[*level - 1] =3D eb;
               ^
   fs/btrfs/send.c:6756:13: note: Assuming that condition '*level=3D=3D0' i=
s not redundant
    if (*level =3D=3D 0)
               ^
   fs/btrfs/send.c:6752:13: note: Negative array index
    path->nodes[*level - 1] =3D eb;
               ^
>> fs/btrfs/send.c:6753:13: warning: Either the condition '*level=3D=3D0' i=
s redundant or the array 'path->slots[8]' is accessed at index -1, which is=
 out of bounds. [negativeIndex]
    path->slots[*level - 1] =3D 0;
               ^
   fs/btrfs/send.c:6756:13: note: Assuming that condition '*level=3D=3D0' i=
s not redundant
    if (*level =3D=3D 0)
               ^
   fs/btrfs/send.c:6753:13: note: Negative array index
    path->slots[*level - 1] =3D 0;
               ^
>> fs/btrfs/send.c:2094:12: warning: Uninitialized variable: cur->ino [unin=
itvar]
     if (cur->ino =3D=3D ino && cur->gen =3D=3D gen)
              ^
   fs/btrfs/send.c:2090:6: note: Assuming condition is false
    if (!nce_head)
        ^
   fs/btrfs/send.c:2094:12: note: Uninitialized variable: cur->ino
     if (cur->ino =3D=3D ino && cur->gen =3D=3D gen)
              ^
>> fs/btrfs/send.c:3101:17: warning: Uninitialized variables: cur.list, cur=
.name, cur.full_path, cur.dir, cur.dir_gen, cur.name_len [uninitvar]
     ret =3D dup_ref(cur, &pm->update_refs);
                   ^
   fs/btrfs/send.c:3078:6: note: Assuming condition is false
    if (!pm)
        ^
   fs/btrfs/send.c:3078:6: note: Assuming condition is false
    if (!pm)
        ^
   fs/btrfs/send.c:3078:6: note: Assuming condition is false
    if (!pm)
        ^
   fs/btrfs/send.c:3078:6: note: Assuming condition is false
    if (!pm)
        ^
   fs/btrfs/send.c:3078:6: note: Assuming condition is false
    if (!pm)
        ^
   fs/btrfs/send.c:3078:6: note: Assuming condition is false
    if (!pm)
        ^
   fs/btrfs/send.c:3101:17: note: Uninitialized variables: cur.list, cur.na=
me, cur.full_path, cur.dir, cur.dir_gen, cur.name_len
     ret =3D dup_ref(cur, &pm->update_refs);
                   ^

vim +1885 fs/btrfs/delayed-inode.c

16cdcec736cd21 Miao Xie        2011-04-22  1863  =

16cdcec736cd21 Miao Xie        2011-04-22  1864  void btrfs_kill_all_delaye=
d_nodes(struct btrfs_root *root)
16cdcec736cd21 Miao Xie        2011-04-22  1865  {
253bf57555e451 Gabriel Niebler 2022-04-26  1866  	unsigned long index =3D 0;
253bf57555e451 Gabriel Niebler 2022-04-26  1867  	struct btrfs_delayed_node=
 *delayed_node;
16cdcec736cd21 Miao Xie        2011-04-22  1868  	struct btrfs_delayed_node=
 *delayed_nodes[8];
16cdcec736cd21 Miao Xie        2011-04-22  1869  =

16cdcec736cd21 Miao Xie        2011-04-22  1870  	while (1) {
253bf57555e451 Gabriel Niebler 2022-04-26  1871  		int n =3D 0;
253bf57555e451 Gabriel Niebler 2022-04-26  1872  =

16cdcec736cd21 Miao Xie        2011-04-22  1873  		spin_lock(&root->inode_l=
ock);
253bf57555e451 Gabriel Niebler 2022-04-26  1874  		if (xa_empty(&root->dela=
yed_nodes)) {
16cdcec736cd21 Miao Xie        2011-04-22  1875  			spin_unlock(&root->inod=
e_lock);
253bf57555e451 Gabriel Niebler 2022-04-26  1876  			return;
16cdcec736cd21 Miao Xie        2011-04-22  1877  		}
16cdcec736cd21 Miao Xie        2011-04-22  1878  =

253bf57555e451 Gabriel Niebler 2022-04-26  1879  		xa_for_each_start(&root-=
>delayed_nodes, index, delayed_node, index) {
baf320b9d531f1 Josef Bacik     2019-09-26  1880  			/*
baf320b9d531f1 Josef Bacik     2019-09-26  1881  			 * Don't increase refs =
in case the node is dead and
baf320b9d531f1 Josef Bacik     2019-09-26  1882  			 * about to be removed =
from the tree in the loop below
baf320b9d531f1 Josef Bacik     2019-09-26  1883  			 */
253bf57555e451 Gabriel Niebler 2022-04-26  1884  			if (refcount_inc_not_ze=
ro(&delayed_node->refs)) {
253bf57555e451 Gabriel Niebler 2022-04-26 @1885  				delayed_nodes[n] =3D d=
elayed_node;
253bf57555e451 Gabriel Niebler 2022-04-26  1886  				n++;
253bf57555e451 Gabriel Niebler 2022-04-26  1887  			}
253bf57555e451 Gabriel Niebler 2022-04-26  1888  			if (n >=3D ARRAY_SIZE(d=
elayed_nodes))
253bf57555e451 Gabriel Niebler 2022-04-26  1889  				break;
baf320b9d531f1 Josef Bacik     2019-09-26  1890  		}
253bf57555e451 Gabriel Niebler 2022-04-26  1891  		index++;
16cdcec736cd21 Miao Xie        2011-04-22  1892  		spin_unlock(&root->inode=
_lock);
16cdcec736cd21 Miao Xie        2011-04-22  1893  =

253bf57555e451 Gabriel Niebler 2022-04-26  1894  		for (int i =3D 0; i < n;=
 i++) {
16cdcec736cd21 Miao Xie        2011-04-22  1895  			__btrfs_kill_delayed_no=
de(delayed_nodes[i]);
16cdcec736cd21 Miao Xie        2011-04-22  1896  			btrfs_release_delayed_n=
ode(delayed_nodes[i]);
16cdcec736cd21 Miao Xie        2011-04-22  1897  		}
16cdcec736cd21 Miao Xie        2011-04-22  1898  	}
16cdcec736cd21 Miao Xie        2011-04-22  1899  }
67cde3448d951b Miao Xie        2012-06-14  1900  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1662019724692853006==--

