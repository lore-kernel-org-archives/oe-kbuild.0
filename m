Content-Type: multipart/mixed; boundary="===============2310862353575446187=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [goldwynr:iomap 11/33] fs/btrfs/inode.c:1519:6: warning: Branch condition evaluates to a garbage value [clang-analyzer-core.uninitialized.Branch]
Date: Tue, 11 Jan 2022 07:35:34 +0800
Message-ID: <202201110733.tCpbUHCk-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2310862353575446187==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Goldwyn Rodrigues <rgoldwyn@suse.com>

tree:   https://github.com/goldwynr/linux iomap
head:   fd871fa60e5495543660657e665f1a6c13d0af97
commit: 4af4ae51ffeb69c9bc3e55b05ed9f51c4fe07e44 [11/33] btrfs: Add btrfs_m=
ap_blocks to for iomap_writeback_ops
:::::: branch date: 10 days ago
:::::: commit date: 10 days ago
config: x86_64-randconfig-c007-20220102 (https://download.01.org/0day-ci/ar=
chive/20220111/202201110733.tCpbUHCk-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project b50fea=
47b6c454581fce89af359f3afe5154986c)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/goldwynr/linux/commit/4af4ae51ffeb69c9bc3e55b0=
5ed9f51c4fe07e44
        git remote add goldwynr https://github.com/goldwynr/linux
        git fetch --no-tags goldwynr iomap
        git checkout 4af4ae51ffeb69c9bc3e55b05ed9f51c4fe07e44
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   fs/btrfs/inode.c:2003:2: note: Taking false branch
           if (locked_page)
           ^
   fs/btrfs/inode.c:2007:6: note: Calling 'should_nocow'
           if (should_nocow(inode, start, end)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/inode.c:1978:6: note: Assuming the condition is false
           if (inode->flags & (BTRFS_INODE_NODATACOW | BTRFS_INODE_PREALLOC=
)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/inode.c:1978:2: note: Taking false branch
           if (inode->flags & (BTRFS_INODE_NODATACOW | BTRFS_INODE_PREALLOC=
)) {
           ^
   fs/btrfs/inode.c:1985:2: note: Returning zero, which participates in a c=
ondition later
           return false;
           ^~~~~~~~~~~~
   fs/btrfs/inode.c:2007:6: note: Returning from 'should_nocow'
           if (should_nocow(inode, start, end)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/inode.c:2007:2: note: Taking false branch
           if (should_nocow(inode, start, end)) {
           ^
   fs/btrfs/inode.c:2019:14: note: Calling 'inode_can_compress'
           } else if (!inode_can_compress(inode) ||
                       ^~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/inode.c:492:6: note: Assuming the condition is false
           if (inode->flags & BTRFS_INODE_NODATACOW ||
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/inode.c:492:6: note: Left side of '||' is false
   fs/btrfs/inode.c:493:6: note: Assuming the condition is false
               inode->flags & BTRFS_INODE_NODATASUM)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/inode.c:492:2: note: Taking false branch
           if (inode->flags & BTRFS_INODE_NODATACOW ||
           ^
   fs/btrfs/inode.c:495:2: note: Returning the value 1, which participates =
in a condition later
           return true;
           ^~~~~~~~~~~
   fs/btrfs/inode.c:2019:14: note: Returning from 'inode_can_compress'
           } else if (!inode_can_compress(inode) ||
                       ^~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/inode.c:2019:13: note: Left side of '||' is false
           } else if (!inode_can_compress(inode) ||
                      ^
   fs/btrfs/inode.c:2020:7: note: Calling 'inode_need_compress'
                      !inode_need_compress(inode, start, end)) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/inode.c:507:7: note: Calling 'inode_can_compress'
           if (!inode_can_compress(inode)) {
                ^~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/inode.c:492:6: note: Left side of '||' is false
           if (inode->flags & BTRFS_INODE_NODATACOW ||
               ^
   fs/btrfs/inode.c:492:2: note: Taking false branch
           if (inode->flags & BTRFS_INODE_NODATACOW ||
           ^
   fs/btrfs/inode.c:495:2: note: Returning the value 1, which participates =
in a condition later
           return true;
           ^~~~~~~~~~~
   fs/btrfs/inode.c:507:7: note: Returning from 'inode_can_compress'
           if (!inode_can_compress(inode)) {
                ^~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/inode.c:507:2: note: Taking false branch
           if (!inode_can_compress(inode)) {
           ^
   fs/btrfs/inode.c:539:6: note: Assuming the condition is false
           if (fs_info->sectorsize < PAGE_SIZE) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/inode.c:539:2: note: Taking false branch
           if (fs_info->sectorsize < PAGE_SIZE) {
           ^
   fs/btrfs/inode.c:546:6: note: Assuming the condition is true
           if (btrfs_test_opt(fs_info, FORCE_COMPRESS))
               ^
   fs/btrfs/ctree.h:1445:39: note: expanded from macro 'btrfs_test_opt'
   #define btrfs_test_opt(fs_info, opt)    ((fs_info)->mount_opt & \
                                            ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/inode.c:546:2: note: Taking true branch
           if (btrfs_test_opt(fs_info, FORCE_COMPRESS))
           ^
   fs/btrfs/inode.c:547:3: note: Returning the value 1, which participates =
in a condition later
                   return 1;
                   ^~~~~~~~
   fs/btrfs/inode.c:2020:7: note: Returning from 'inode_need_compress'
                      !inode_need_compress(inode, start, end)) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/inode.c:2019:9: note: Taking false branch
           } else if (!inode_can_compress(inode) ||
                  ^
   fs/btrfs/inode.c:2029:37: note: Passing null pointer value via 2nd param=
eter 'wbc'
                   ret =3D cow_file_range_async(inode, wbc, locked_page, st=
art, end,
                                                     ^~~
   fs/btrfs/inode.c:2029:9: note: Calling 'cow_file_range_async'
                   ret =3D cow_file_range_async(inode, wbc, locked_page, st=
art, end,
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   fs/btrfs/inode.c:1400:42: note: Access to field 'wb' results in a derefe=
rence of a null pointer (loaded from variable 'wbc')
           struct cgroup_subsys_state *blkcg_css =3D wbc_blkcg_css(wbc);
                                                   ^
   include/linux/writeback.h:113:3: note: expanded from macro 'wbc_blkcg_cs=
s'
           ((wbc)->wb ? (wbc)->wb->blkcg_css : blkcg_root_css)
            ^~~~
>> fs/btrfs/inode.c:1519:6: warning: Branch condition evaluates to a garbag=
e value [clang-analyzer-core.uninitialized.Branch]
           if (*page_started)
               ^
   fs/btrfs/inode.c:8454:2: note: 'page_started' declared without an initia=
l value
           int page_started; /* unused */
           ^~~~~~~~~~~~~~~~
   fs/btrfs/inode.c:8460:6: note: Assuming 'offset' is < field 'offset'
           if (offset >=3D wpc->iomap.offset &&
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/inode.c:8460:34: note: Left side of '&&' is false
           if (offset >=3D wpc->iomap.offset &&
                                           ^
   fs/btrfs/inode.c:8465:6: note: Assuming 'ret' is >=3D 0
           if (ret < 0)
               ^~~~~~~
   fs/btrfs/inode.c:8465:2: note: Taking false branch
           if (ret < 0)
           ^
   fs/btrfs/inode.c:8468:8: note: Calling 'btrfs_run_delalloc_range'
           ret =3D btrfs_run_delalloc_range(BTRFS_I(inode), NULL,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/inode.c:2003:6: note: 'locked_page' is null
           if (locked_page)
               ^~~~~~~~~~~
   fs/btrfs/inode.c:2003:2: note: Taking false branch
           if (locked_page)
           ^
   fs/btrfs/inode.c:2007:2: note: Taking false branch
           if (should_nocow(inode, start, end)) {
           ^
   fs/btrfs/inode.c:2019:13: note: Left side of '||' is false
           } else if (!inode_can_compress(inode) ||
                      ^
   fs/btrfs/inode.c:2019:9: note: Taking true branch
           } else if (!inode_can_compress(inode) ||
                  ^
   fs/btrfs/inode.c:2021:7: note: 'zoned' is true
                   if (zoned)
                       ^~~~~
   fs/btrfs/inode.c:2021:3: note: Taking true branch
                   if (zoned)
                   ^
   fs/btrfs/inode.c:2022:10: note: Calling 'run_delalloc_zoned'
                           ret =3D run_delalloc_zoned(inode, locked_page, s=
tart, end,
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   fs/btrfs/inode.c:1514:8: note: Calling 'cow_file_range'
           ret =3D cow_file_range(inode, locked_page, start, end, page_star=
ted,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   fs/btrfs/inode.c:1131:2: note: Taking false branch
           if (btrfs_is_free_space_inode(inode)) {
           ^
   fs/btrfs/inode.c:1138:14: note: Assuming '__UNIQUE_ID___x2020' is > '__U=
NIQUE_ID___y2021'
           num_bytes =3D max(blocksize,  num_bytes);
                       ^
   include/linux/minmax.h:52:19: note: expanded from macro 'max'
   #define max(x, y)       __careful_cmp(x, y, >)
                           ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^~~~~~~~~~
   fs/btrfs/inode.c:1138:14: note: '?' condition is true
           num_bytes =3D max(blocksize,  num_bytes);
                       ^
   include/linux/minmax.h:52:19: note: expanded from macro 'max'
   #define max(x, y)       __careful_cmp(x, y, >)
                           ^
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^
   fs/btrfs/inode.c:1139:9: note: Assuming the condition is true
           ASSERT(num_bytes <=3D btrfs_super_total_bytes(fs_info->super_cop=
y));
                  ^
   fs/btrfs/ctree.h:3526:29: note: expanded from macro 'ASSERT'
   #define ASSERT(expr)    (void)(expr)
                                  ^~~~
   fs/btrfs/inode.c:1153:6: note: 'start' is not equal to 0
           if (start =3D=3D 0 && fs_info->sectorsize =3D=3D PAGE_SIZE) {
               ^~~~~
   fs/btrfs/inode.c:1153:17: note: Left side of '&&' is false
           if (start =3D=3D 0 && fs_info->sectorsize =3D=3D PAGE_SIZE) {
                          ^
   fs/btrfs/inode.c:1206:2: note: Taking true branch
           if (btrfs_is_data_reloc_root(root))
           ^
   fs/btrfs/inode.c:1211:9: note: Assuming 'num_bytes' is <=3D 0
           while (num_bytes > 0) {
                  ^~~~~~~~~~~~~
   fs/btrfs/inode.c:1211:2: note: Loop condition is false. Execution contin=
ues on line 1295
           while (num_bytes > 0) {

vim +1519 fs/btrfs/inode.c

be20aa9dbadc8c Chris Mason  2007-12-17  1506  =

42c01100096344 Naohiro Aota 2021-02-04  1507  static noinline int run_delal=
loc_zoned(struct btrfs_inode *inode,
42c01100096344 Naohiro Aota 2021-02-04  1508  				       struct page *locke=
d_page, u64 start,
42c01100096344 Naohiro Aota 2021-02-04  1509  				       u64 end, int *page=
_started,
42c01100096344 Naohiro Aota 2021-02-04  1510  				       unsigned long *nr_=
written)
42c01100096344 Naohiro Aota 2021-02-04  1511  {
42c01100096344 Naohiro Aota 2021-02-04  1512  	int ret;
42c01100096344 Naohiro Aota 2021-02-04  1513  =

42c01100096344 Naohiro Aota 2021-02-04  1514  	ret =3D cow_file_range(inode=
, locked_page, start, end, page_started,
42c01100096344 Naohiro Aota 2021-02-04  1515  			     nr_written, 0);
42c01100096344 Naohiro Aota 2021-02-04  1516  	if (ret)
42c01100096344 Naohiro Aota 2021-02-04  1517  		return ret;
42c01100096344 Naohiro Aota 2021-02-04  1518  =

42c01100096344 Naohiro Aota 2021-02-04 @1519  	if (*page_started)
42c01100096344 Naohiro Aota 2021-02-04  1520  		return 0;
42c01100096344 Naohiro Aota 2021-02-04  1521  =

42c01100096344 Naohiro Aota 2021-02-04  1522  	__set_page_dirty_nobuffers(l=
ocked_page);
42c01100096344 Naohiro Aota 2021-02-04  1523  	account_page_redirty(locked_=
page);
2bd0fc9349b636 Qu Wenruo    2021-09-27  1524  	extent_write_locked_range(&i=
node->vfs_inode, start, end);
42c01100096344 Naohiro Aota 2021-02-04  1525  	*page_started =3D 1;
42c01100096344 Naohiro Aota 2021-02-04  1526  =

42c01100096344 Naohiro Aota 2021-02-04  1527  	return 0;
42c01100096344 Naohiro Aota 2021-02-04  1528  }
42c01100096344 Naohiro Aota 2021-02-04  1529  =


:::::: The code at line 1519 was first introduced by commit
:::::: 42c011000963442ce533d92a492c4a057b2f5a46 btrfs: zoned: introduce ded=
icated data write path for zoned filesystems

:::::: TO: Naohiro Aota <naohiro.aota@wdc.com>
:::::: CC: David Sterba <dsterba@suse.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2310862353575446187==--

