Content-Type: multipart/mixed; boundary="===============0555705979780303968=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [kdave-btrfs-devel:for-next 147/195] fs/btrfs/inode.c:11309:21: warning: Value stored to 'root' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Thu, 17 Mar 2022 03:58:06 +0800
Message-ID: <202203170346.hztSzYrv-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0555705979780303968==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Filipe Manana <fdmanana@suse.com>
CC: David Sterba <dsterba@suse.com>

tree:   https://github.com/kdave/btrfs-devel.git for-next
head:   274c7b59fbd77edddc488f5f408f432ca96fd390
commit: 9cf32bee81e4ad916e47326464234b265da3028b [147/195] btrfs: add and u=
se helper to assert an inode range is clean
:::::: branch date: 26 hours ago
:::::: commit date: 28 hours ago
config: riscv-randconfig-c006-20220313 (https://download.01.org/0day-ci/arc=
hive/20220317/202203170346.hztSzYrv-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a6ec1e=
3d798f8eab43fb3a91028c6ab04e115fcb)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/kdave/btrfs-devel/commit/9cf32bee81e4ad916e473=
26464234b265da3028b
        git remote add kdave-btrfs-devel https://github.com/kdave/btrfs-dev=
el.git
        git fetch --no-tags kdave-btrfs-devel for-next
        git checkout 9cf32bee81e4ad916e47326464234b265da3028b
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
               ^
   include/asm-generic/bitops/non-atomic.h:120:18: note: expanded from macr=
o 'test_bit'
   #define test_bit arch_test_bit
                    ^
   fs/btrfs/inode.c:10576:2: note: Taking false branch
           if (em->block_start =3D=3D EXTENT_MAP_HOLE ||
           ^
   fs/btrfs/inode.c:10582:13: note: Assuming the condition is true
           } else if (test_bit(EXTENT_FLAG_COMPRESSED, &em->flags)) {
                      ^
   include/asm-generic/bitops/non-atomic.h:120:18: note: expanded from macr=
o 'test_bit'
   #define test_bit arch_test_bit
                    ^
   fs/btrfs/inode.c:10582:9: note: Taking true branch
           } else if (test_bit(EXTENT_FLAG_COMPRESSED, &em->flags)) {
                  ^
   fs/btrfs/inode.c:10588:7: note: Assuming 'count' is >=3D field 'block_le=
n'
                   if (em->block_len > count) {
                       ^~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/inode.c:10588:3: note: Taking false branch
                   if (em->block_len > count) {
                   ^
   fs/btrfs/inode.c:10597:7: note: 'ret' is >=3D 0
                   if (ret < 0)
                       ^~~
   fs/btrfs/inode.c:10597:3: note: Taking false branch
                   if (ret < 0)
                   ^
   fs/btrfs/inode.c:10617:2: note: Taking false branch
           if (disk_bytenr =3D=3D EXTENT_MAP_HOLE) {
           ^
   fs/btrfs/inode.c:10625:9: note: Calling 'btrfs_encoded_read_regular'
                   ret =3D btrfs_encoded_read_regular(iocb, iter, start, lo=
ckend,
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   fs/btrfs/inode.c:10454:6: note: Assuming 'pages' is non-null
           if (!pages)
               ^~~~~~
   fs/btrfs/inode.c:10454:2: note: Taking false branch
           if (!pages)
           ^
   fs/btrfs/inode.c:10456:14: note: Assuming 'i' is >=3D 'nr_pages'
           for (i =3D 0; i < nr_pages; i++) {
                       ^~~~~~~~~~~~
   fs/btrfs/inode.c:10456:2: note: Loop condition is false. Execution conti=
nues on line 10464
           for (i =3D 0; i < nr_pages; i++) {
           ^
   fs/btrfs/inode.c:10464:8: note: Calling 'btrfs_encoded_read_regular_fill=
_pages'
           ret =3D btrfs_encoded_read_regular_fill_pages(inode, start, disk=
_bytenr,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   fs/btrfs/inode.c:10372:2: note: Loop condition is false.  Exiting loop
           init_waitqueue_head(&priv.wait);
           ^
   include/linux/wait.h:67:2: note: expanded from macro 'init_waitqueue_hea=
d'
           do {                                                            =
        \
           ^
   fs/btrfs/inode.c:10377:9: note: Assuming 'cur' is < 'disk_io_size'
           while (cur < disk_io_size) {
                  ^~~~~~~~~~~~~~~~~~
   fs/btrfs/inode.c:10377:2: note: Loop condition is true.  Entering loop b=
ody
           while (cur < disk_io_size) {
           ^
   fs/btrfs/inode.c:10385:7: note: Calling 'IS_ERR'
                   if (IS_ERR(em)) {
                       ^~~~~~~~~~
   include/linux/err.h:36:9: note: Assuming the condition is true
           return IS_ERR_VALUE((unsigned long)ptr);
                  ^
   include/linux/err.h:22:34: note: expanded from macro 'IS_ERR_VALUE'
   #define IS_ERR_VALUE(x) unlikely((unsigned long)(void *)(x) >=3D (unsign=
ed long)-MAX_ERRNO)
                           ~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/err.h:36:2: note: Returning the value 1, which participate=
s in a condition later
           return IS_ERR_VALUE((unsigned long)ptr);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/inode.c:10385:7: note: Returning from 'IS_ERR'
                   if (IS_ERR(em)) {
                       ^~~~~~~~~~
   fs/btrfs/inode.c:10385:3: note: Taking true branch
                   if (IS_ERR(em)) {
                   ^
   fs/btrfs/inode.c:10392:7: note: Assuming 'ret' is 0
                   if (ret) {
                       ^~~
   fs/btrfs/inode.c:10392:3: note: Taking false branch
                   if (ret) {
                   ^
   fs/btrfs/inode.c:10396:15: note: Assigned value is garbage or undefined
                   remaining =3D min(geom.len, disk_io_size - cur);
                               ^
   include/linux/minmax.h:45:19: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                           ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:31:3: note: expanded from macro '__cmp_once'
                   typeof(x) unique_x =3D (x);               \
                   ^                    ~~~
>> fs/btrfs/inode.c:11309:21: warning: Value stored to 'root' during its in=
itialization is never read [clang-analyzer-deadcode.DeadStores]
           struct btrfs_root *root =3D inode->root;
                              ^~~~   ~~~~~~~~~~~
   fs/btrfs/inode.c:11309:21: note: Value stored to 'root' during its initi=
alization is never read
           struct btrfs_root *root =3D inode->root;
                              ^~~~   ~~~~~~~~~~~
   include/linux/list.h:137:13: warning: Use of memory after it is freed [c=
lang-analyzer-unix.Malloc]
           __list_del(entry->prev, entry->next);
                      ^
   fs/btrfs/inode.c:1371:6: note: Assuming field 'inode' is non-null
           if (async_chunk->inode)
               ^~~~~~~~~~~~~~~~~~
   fs/btrfs/inode.c:1371:2: note: Taking true branch
           if (async_chunk->inode)
           ^
   fs/btrfs/inode.c:1372:3: note: Calling 'submit_compressed_extents'
                   submit_compressed_extents(async_chunk);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/inode.c:1046:2: note: Loop condition is true.  Entering loop bo=
dy
           while (!list_empty(&async_chunk->extents)) {
           ^
   fs/btrfs/inode.c:1056:9: note: Calling 'submit_one_async_extent'
                   ret =3D submit_one_async_extent(inode, async_chunk, asyn=
c_extent,
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   fs/btrfs/inode.c:934:6: note: Assuming field 'locked_page' is null
           if (async_chunk->locked_page) {
               ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/inode.c:934:2: note: Taking false branch
           if (async_chunk->locked_page) {
           ^
   fs/btrfs/inode.c:944:6: note: Assuming field 'pages' is non-null
           if (!async_extent->pages)
               ^~~~~~~~~~~~~~~~~~~~
   fs/btrfs/inode.c:944:2: note: Taking false branch
           if (!async_extent->pages)
           ^
   fs/btrfs/inode.c:951:6: note: Assuming 'ret' is not equal to 0
           if (ret) {
               ^~~
   fs/btrfs/inode.c:951:2: note: Taking true branch
           if (ret) {
           ^
   fs/btrfs/inode.c:960:3: note: Control jumps to line 1022
                   goto out_free;
                   ^
   fs/btrfs/inode.c:1029:2: note: Memory is released
           kfree(async_extent);
           ^~~~~~~~~~~~~~~~~~~
   fs/btrfs/inode.c:1056:9: note: Returning; memory was released
                   ret =3D submit_one_async_extent(inode, async_chunk, asyn=
c_extent,
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   fs/btrfs/inode.c:1046:2: note: Loop condition is true.  Entering loop bo=
dy
           while (!list_empty(&async_chunk->extents)) {
           ^
   fs/btrfs/inode.c:1052:3: note: Calling 'list_del'
                   list_del(&async_extent->list);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:148:2: note: Calling '__list_del_entry'
           __list_del_entry(entry);
           ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:134:6: note: Assuming the condition is false
           if (!__list_del_entry_valid(entry))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:134:2: note: Taking false branch
           if (!__list_del_entry_valid(entry))
           ^
   include/linux/list.h:137:13: note: Use of memory after it is freed
           __list_del(entry->prev, entry->next);
                      ^~~~~~~~~~~
   include/linux/list.h:149:14: warning: Use of memory after it is freed [c=
lang-analyzer-unix.Malloc]
           entry->next =3D LIST_POISON1;
                       ^
   fs/btrfs/inode.c:1371:6: note: Assuming field 'inode' is non-null
           if (async_chunk->inode)
               ^~~~~~~~~~~~~~~~~~
   fs/btrfs/inode.c:1371:2: note: Taking true branch
           if (async_chunk->inode)
           ^
   fs/btrfs/inode.c:1372:3: note: Calling 'submit_compressed_extents'
                   submit_compressed_extents(async_chunk);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/inode.c:1046:2: note: Loop condition is true.  Entering loop bo=
dy
           while (!list_empty(&async_chunk->extents)) {
           ^
   fs/btrfs/inode.c:1056:9: note: Calling 'submit_one_async_extent'
                   ret =3D submit_one_async_extent(inode, async_chunk, asyn=
c_extent,
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   fs/btrfs/inode.c:934:6: note: Assuming field 'locked_page' is null
           if (async_chunk->locked_page) {
               ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/inode.c:934:2: note: Taking false branch
           if (async_chunk->locked_page) {
           ^
   fs/btrfs/inode.c:944:6: note: Assuming field 'pages' is non-null
           if (!async_extent->pages)
               ^~~~~~~~~~~~~~~~~~~~
   fs/btrfs/inode.c:944:2: note: Taking false branch
           if (!async_extent->pages)
           ^
   fs/btrfs/inode.c:951:6: note: Assuming 'ret' is not equal to 0
           if (ret) {

vim +/root +11309 fs/btrfs/inode.c

2766ff61762c3fa Filipe Manana 2020-11-04  11291  =

9cf32bee81e4ad9 Filipe Manana 2022-03-15  11292  /*
9cf32bee81e4ad9 Filipe Manana 2022-03-15  11293   * Verify that there are n=
o ordered extents for a given file range.
9cf32bee81e4ad9 Filipe Manana 2022-03-15  11294   *
9cf32bee81e4ad9 Filipe Manana 2022-03-15  11295   * @inode:                =
The target inode.
9cf32bee81e4ad9 Filipe Manana 2022-03-15  11296   * @start:                =
Start offset of the file range, should be sector size
9cf32bee81e4ad9 Filipe Manana 2022-03-15  11297   *                        =
aligned.
9cf32bee81e4ad9 Filipe Manana 2022-03-15  11298   * @end:                  =
End offset (inclusive) of the file range, its value +1
9cf32bee81e4ad9 Filipe Manana 2022-03-15  11299   *                        =
should be sector size aligned.
9cf32bee81e4ad9 Filipe Manana 2022-03-15  11300   *
9cf32bee81e4ad9 Filipe Manana 2022-03-15  11301   * This should typically b=
e used for cases where we locked an inode's VFS lock in
9cf32bee81e4ad9 Filipe Manana 2022-03-15  11302   * exclusive mode, we have=
 also locked the inode's i_mmap_lock in exclusive mode,
9cf32bee81e4ad9 Filipe Manana 2022-03-15  11303   * we have flushed all del=
alloc in the range, we have waited for all ordered
9cf32bee81e4ad9 Filipe Manana 2022-03-15  11304   * extents in the range to=
 complete and finally we have locked the file range in
9cf32bee81e4ad9 Filipe Manana 2022-03-15  11305   * the inode's io_tree.
9cf32bee81e4ad9 Filipe Manana 2022-03-15  11306   */
9cf32bee81e4ad9 Filipe Manana 2022-03-15  11307  void btrfs_assert_inode_ra=
nge_clean(struct btrfs_inode *inode, u64 start, u64 end)
9cf32bee81e4ad9 Filipe Manana 2022-03-15  11308  {
9cf32bee81e4ad9 Filipe Manana 2022-03-15 @11309  	struct btrfs_root *root =
=3D inode->root;
9cf32bee81e4ad9 Filipe Manana 2022-03-15  11310  	struct btrfs_ordered_exte=
nt *ordered;
9cf32bee81e4ad9 Filipe Manana 2022-03-15  11311  =

9cf32bee81e4ad9 Filipe Manana 2022-03-15  11312  	if (!IS_ENABLED(CONFIG_BT=
RFS_ASSERT))
9cf32bee81e4ad9 Filipe Manana 2022-03-15  11313  		return;
9cf32bee81e4ad9 Filipe Manana 2022-03-15  11314  =

9cf32bee81e4ad9 Filipe Manana 2022-03-15  11315  	ordered =3D btrfs_lookup_=
first_ordered_range(inode, start,
9cf32bee81e4ad9 Filipe Manana 2022-03-15  11316  						   end + 1 - start);
9cf32bee81e4ad9 Filipe Manana 2022-03-15  11317  	if (ordered) {
9cf32bee81e4ad9 Filipe Manana 2022-03-15  11318  		btrfs_err(root->fs_info,
9cf32bee81e4ad9 Filipe Manana 2022-03-15  11319  "found unexpected ordered =
extent in file range [%llu, %llu] for inode %llu root %llu (ordered range [=
%llu, %llu])",
9cf32bee81e4ad9 Filipe Manana 2022-03-15  11320  			  start, end, btrfs_ino=
(inode), root->root_key.objectid,
9cf32bee81e4ad9 Filipe Manana 2022-03-15  11321  			  ordered->file_offset,
9cf32bee81e4ad9 Filipe Manana 2022-03-15  11322  			  ordered->file_offset =
+ ordered->num_bytes - 1);
9cf32bee81e4ad9 Filipe Manana 2022-03-15  11323  		btrfs_put_ordered_extent=
(ordered);
9cf32bee81e4ad9 Filipe Manana 2022-03-15  11324  	}
9cf32bee81e4ad9 Filipe Manana 2022-03-15  11325  =

9cf32bee81e4ad9 Filipe Manana 2022-03-15  11326  	ASSERT(ordered =3D=3D NUL=
L);
9cf32bee81e4ad9 Filipe Manana 2022-03-15  11327  }
9cf32bee81e4ad9 Filipe Manana 2022-03-15  11328  =


---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0555705979780303968==--

