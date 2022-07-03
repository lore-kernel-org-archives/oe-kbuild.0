Content-Type: multipart/mixed; boundary="===============4741768662814836843=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [kdave-btrfs-devel:misc-next 76/116] fs/btrfs/extent_io.c:479:26: warning: Uninitialized variable: entry [uninitvar]
Date: Sun, 03 Jul 2022 08:31:49 +0800
Message-ID: <202207030805.svlqdcRx-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4741768662814836843==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: fs/btrfs/=
extent_io.c:479:26: warning: Uninitialized variable: entry [uninitvar]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: David Sterba <dsterba@suse.com>

tree:   https://github.com/kdave/btrfs-devel.git misc-next
head:   9a4b16cd9e0e63881ab30600f982e2fd49ba3d4e
commit: dcbe36e23dfcb24bcac106215a24da2221103a60 [76/116] btrfs: open code =
inexact rbtree search in tree_search
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
compiler: sparc64-linux-gcc (GCC) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout dcbe36e23dfcb24bcac106215a24da2221103a60
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)
   In file included from fs/btrfs/transaction.c:
   fs/btrfs/extent_io.c:5928:7: warning: Local variable 'ret' shadows outer=
 variable [shadowVariable]
     int ret;
         ^
   fs/btrfs/extent_io.c:5907:6: note: Shadowed declaration
    int ret;
        ^
   fs/btrfs/extent_io.c:5928:7: note: Shadow variable
     int ret;
         ^

cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   In file included from fs/btrfs/transaction.c:
   fs/btrfs/tree-log.h:55:28: warning: Uninitialized variables: ordered.fil=
e_offset, ordered.num_bytes, ordered.ram_bytes, ordered.disk_bytenr, ordere=
d.disk_num_bytes, ordered.offset, ordered.bytes_left, ordered.outstanding_i=
size, ordered.truncated_len, ordered.flags, ordered.compress_type, ordered.=
qgroup_rsv, ordered.refs, ordered.inode, ordered.list, ordered.wait, ordere=
d.rb_node, ordered.root_extent_list, ordered.work, ordered.completion, orde=
red.flush_work, ordered.work_list, ordered.physical, ordered.bdev [uninitva=
r]
     btrfs_put_ordered_extent(ordered);
                              ^
   fs/btrfs/transaction.c:179:28: warning: Uninitialized variable: root->co=
mmit_root [uninitvar]
     free_extent_buffer(root->commit_root);
                              ^
   fs/btrfs/transaction.c:229:30: warning: Uninitialized variable: cache [u=
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
   fs/btrfs/transaction.c:927:11: warning: Uninitialized variable: t->state=
 [uninitvar]
      if (t->state >=3D TRANS_STATE_COMMIT_START) {
             ^
>> fs/btrfs/transaction.c:1431:25: warning: Uninitialized variables: root.r=
b_node, root.node, root.commit_root, root.log_root, root.reloc_root, root.s=
tate, root.root_item, root.fs_info, root.dirty_log_pages, root.objectid_mut=
ex, root.accounting_lock, root.block_rsv, root.log_mutex, root.log_writer_w=
ait, root.log_batch, root.log_transid, root.log_transid_committed, root.las=
t_log_commit, root.log_start_pid, root.last_trans, root.type, root.free_obj=
ectid, root.defrag_progress, root.defrag_max, root.dirty_list, root.root_li=
st, root.inode_lock, root.inode_tree, root.delayed_nodes, root.anon_dev, ro=
ot.root_item_lock, root.refs, root.delalloc_mutex, root.delalloc_lock, root=
.delalloc_inodes, root.delalloc_root, root.nr_delalloc_inodes, root.ordered=
_extent_mutex, root.ordered_extent_lock, root.ordered_extents, root.ordered=
_root, root.nr_ordered_extents, root.reloc_dirty_list, root.send_in_progres=
s, root.dedupe_in_progress, root.snapshot_lock, root.snapshot_force_cow, ro=
ot.qgroup_meta_rsv_lock, root.qgroup_meta_rsv_pertrans, root.qgroup_meta_rs=
v_prealloc, root.qgroup_flush_wait, root.nr_swapfiles, root.swapped_blocks,=
 root.log_csum_range [uninitvar]
     btrfs_free_log(trans, root);
                           ^
   fs/btrfs/transaction.c:1871:40: warning: Uninitialized variables: pendin=
g.dentry, pending.dir, pending.root, pending.root_item, pending.snap, pendi=
ng.inherit, pending.path, pending.block_rsv, pending.error, pending.anon_de=
v, pending.readonly [uninitvar]
     ret =3D create_pending_snapshot(trans, pending);
                                          ^
   fs/btrfs/transaction.c:1431:25: warning: Uninitialized variables: root.r=
b_node, root.node, root.commit_root, root.log_root, root.reloc_root, root.s=
tate, root.root_item, root.fs_info, root.dirty_log_pages, root.objectid_mut=
ex, root.accounting_lock, root.block_rsv, root.log_mutex, root.log_writer_w=
ait, root.log_batch, root.log_transid, root.log_transid_committed, root.las=
t_log_commit, root.log_start_pid, root.last_trans, root.type, root.free_obj=
ectid, root.defrag_progress, root.defrag_max, root.dirty_list, root.root_li=
st, root.inode_lock, root.inode_tree, root.delayed_nodes, root.anon_dev, ro=
ot.root_item_lock, root.refs, root.delalloc_mutex, root.delalloc_lock, root=
.delalloc_inodes, root.delalloc_root, root.nr_delalloc_inodes, root.ordered=
_extent_mutex, root.ordered_extent_lock, root.ordered_extents, root.ordered=
_root, root.nr_ordered_extents, root.reloc_dirty_list, root.send_in_progres=
s, root.dedupe_in_progress, root.snapshot_lock, root.snapshot_force_cow, ro=
ot.qgroup_meta_rsv_lock, root.qgroup_meta_rsv_pertrans, root.qgroup_meta_rs=
v_prealloc, root.qgroup_flush_wait, root.nr_swapfiles, root.swapped_blocks,=
 root.log_csum_range, root.leak_list [uninitvar]
     btrfs_free_log(trans, root);
                           ^
   fs/btrfs/transaction.c:1431:25: warning: Uninitialized variables: root.r=
b_node, root.node, root.commit_root, root.log_root, root.reloc_root, root.s=
tate, root.root_item, root.fs_info, root.dirty_log_pages, root.objectid_mut=
ex, root.accounting_lock, root.block_rsv, root.log_mutex, root.log_writer_w=
ait, root.log_batch, root.log_transid, root.log_transid_committed, root.las=
t_log_commit, root.log_start_pid, root.last_trans, root.type, root.free_obj=
ectid, root.defrag_progress, root.defrag_max, root.dirty_list, root.root_li=
st, root.inode_lock, root.inode_tree, root.delayed_nodes, root.anon_dev, ro=
ot.root_item_lock, root.refs, root.delalloc_mutex, root.delalloc_lock, root=
.delalloc_inodes, root.delalloc_root, root.nr_delalloc_inodes, root.ordered=
_extent_mutex, root.ordered_extent_lock, root.ordered_extents, root.ordered=
_root, root.nr_ordered_extents, root.reloc_dirty_list, root.send_in_progres=
s, root.dedupe_in_progress, root.snapshot_lock, root.snapshot_force_cow, ro=
ot.qgroup_meta_rsv_lock, root.qgroup_meta_rsv_pertrans, root.qgroup_meta_rs=
v_prealloc, root.qgroup_flush_wait, root.nr_swapfiles, root.swapped_blocks,=
 root.log_csum_range, root.alloc_bytenr [uninitvar]
     btrfs_free_log(trans, root);
                           ^
   fs/btrfs/scrub.c:1218:13: warning: Parameter 'raid_map' can be declared =
with const [constParameter]
          u64 *raid_map,
               ^
>> fs/btrfs/scrub.c:3112:9: warning: Uninitialized variable: ret [uninitvar]
    return ret;
           ^
   fs/btrfs/scrub.c:3023:21: note: Assuming condition is false
    while (cur_logical < logical + map->stripe_len) {
                       ^
   fs/btrfs/scrub.c:3112:9: note: Uninitialized variable: ret
    return ret;
           ^
   fs/btrfs/scrub.c:3345:9: warning: Uninitialized variable: ret [uninitvar]
    return ret;
           ^
   fs/btrfs/scrub.c:3250:21: note: Assuming condition is false
    while (cur_logical < logical_end) {
                       ^
   fs/btrfs/scrub.c:3345:9: note: Uninitialized variable: ret
    return ret;
           ^
   fs/btrfs/extent_io.c:1850:30: warning: Parameter 'mapping' can be declar=
ed with const [constParameter]
          struct address_space *mapping,
                                ^
   fs/btrfs/extent_io.c:1851:40: warning: Parameter 'locked_page' can be de=
clared with const [constParameter]
          struct page *page, struct page *locked_page,
                                          ^
   fs/btrfs/extent_io.c:6028:16: warning: Parameter 'accessed' can be decla=
red with const [constParameter]
     struct page *accessed)
                  ^
>> fs/btrfs/extent_io.c:479:26: warning: Uninitialized variable: entry [uni=
nitvar]
    while (prev && offset > entry->end) {
                            ^
   fs/btrfs/extent_io.c:466:9: note: Assuming condition is false
    while (*node) {
           ^
   fs/btrfs/extent_io.c:479:26: note: Uninitialized variable: entry
    while (prev && offset > entry->end) {
                            ^
   fs/btrfs/extent_io.c:7291:7: warning: Uninitialized variable: eb->start =
[uninitvar]
     if (in_range(eb->start, page_start, PAGE_SIZE))
         ^

vim +479 fs/btrfs/extent_io.c

d1310b2e0cd98e Chris Mason               2008-01-24  455  =

dcbe36e23dfcb2 David Sterba              2020-06-25  456  /*
dcbe36e23dfcb2 David Sterba              2020-06-25  457   * Inexact rb-tre=
e search, return the next entry if @offset is not found
dcbe36e23dfcb2 David Sterba              2020-06-25  458   */
dcbe36e23dfcb2 David Sterba              2020-06-25  459  static inline str=
uct rb_node *tree_search(struct extent_io_tree *tree, u64 offset)
12cfbad90e0279 Filipe David Borba Manana 2013-11-26  460  {
dcbe36e23dfcb2 David Sterba              2020-06-25  461  	struct rb_root *=
root =3D &tree->state;
dcbe36e23dfcb2 David Sterba              2020-06-25  462  	struct rb_node *=
*node =3D &root->rb_node;
dcbe36e23dfcb2 David Sterba              2020-06-25  463  	struct rb_node *=
prev =3D NULL;
dcbe36e23dfcb2 David Sterba              2020-06-25  464  	struct tree_entr=
y *entry;
dcbe36e23dfcb2 David Sterba              2020-06-25  465  =

dcbe36e23dfcb2 David Sterba              2020-06-25  466  	while (*node) {
dcbe36e23dfcb2 David Sterba              2020-06-25  467  		prev =3D *node;
dcbe36e23dfcb2 David Sterba              2020-06-25  468  		entry =3D rb_en=
try(prev, struct tree_entry, rb_node);
dcbe36e23dfcb2 David Sterba              2020-06-25  469  =

dcbe36e23dfcb2 David Sterba              2020-06-25  470  		if (offset < en=
try->start)
dcbe36e23dfcb2 David Sterba              2020-06-25  471  			node =3D &(*no=
de)->rb_left;
dcbe36e23dfcb2 David Sterba              2020-06-25  472  		else if (offset=
 > entry->end)
dcbe36e23dfcb2 David Sterba              2020-06-25  473  			node =3D &(*no=
de)->rb_right;
dcbe36e23dfcb2 David Sterba              2020-06-25  474  		else
dcbe36e23dfcb2 David Sterba              2020-06-25  475  			return *node;
dcbe36e23dfcb2 David Sterba              2020-06-25  476  	}
dcbe36e23dfcb2 David Sterba              2020-06-25  477  =

dcbe36e23dfcb2 David Sterba              2020-06-25  478  	/* Search neighb=
ors until we find the first one past the end */
dcbe36e23dfcb2 David Sterba              2020-06-25 @479  	while (prev && o=
ffset > entry->end) {
dcbe36e23dfcb2 David Sterba              2020-06-25  480  		prev =3D rb_nex=
t(prev);
dcbe36e23dfcb2 David Sterba              2020-06-25  481  		entry =3D rb_en=
try(prev, struct tree_entry, rb_node);
dcbe36e23dfcb2 David Sterba              2020-06-25  482  	}
dcbe36e23dfcb2 David Sterba              2020-06-25  483  =

dcbe36e23dfcb2 David Sterba              2020-06-25  484  	return prev;
12cfbad90e0279 Filipe David Borba Manana 2013-11-26  485  }
12cfbad90e0279 Filipe David Borba Manana 2013-11-26  486  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4741768662814836843==--

