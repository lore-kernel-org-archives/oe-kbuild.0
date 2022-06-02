Content-Type: multipart/mixed; boundary="===============1077547295098336415=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: fs/f2fs/f2fs.h:2607:6: warning: Branch condition evaluates to a garbage value [clang-analyzer-core.uninitialized.Branch]
Date: Thu, 02 Jun 2022 09:20:07 +0800
Message-ID: <202206020913.jG3oANN8-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1077547295098336415==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: fs/f2fs/f=
2fs.h:2607:6: warning: Branch condition evaluates to a garbage value [clang=
-analyzer-core.uninitialized.Branch]"
:::::: =


CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>
CC: Jaegeuk Kim <jaegeuk@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   8171acb8bc9b33f3ed827f0615b24f7a06495cd0
commit: 94afd6d6e5253179c9b891d02081cc8355a11768 f2fs: extent cache: suppor=
t unaligned extent
date:   10 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 10 months ago
config: i386-randconfig-c001 (https://download.01.org/0day-ci/archive/20220=
602/202206020913.jG3oANN8-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0fbe3f=
3f486e01448121f7931a4ca29fac1504ab)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D94afd6d6e5253179c9b891d02081cc8355a11768
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 94afd6d6e5253179c9b891d02081cc8355a11768
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   fs/nilfs2/super.c:296:9: note: Calling 'nilfs_sync_super'
           return nilfs_sync_super(sb, flag);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/nilfs2/super.c:179:6: note: Assuming the condition is false
           if (nilfs_test_opt(nilfs, BARRIER)) {
               ^
   fs/nilfs2/the_nilfs.h:219:37: note: expanded from macro 'nilfs_test_opt'
   #define nilfs_test_opt(nilfs, opt) ((nilfs)->ns_mount_opt & NILFS_MOUNT_=
##opt)
                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   fs/nilfs2/super.c:179:2: note: Taking false branch
           if (nilfs_test_opt(nilfs, BARRIER)) {
           ^
   fs/nilfs2/super.c:186:6: note: Assuming 'err' is not equal to 0
           if (unlikely(err)) {
               ^
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   fs/nilfs2/super.c:186:2: note: Taking true branch
           if (unlikely(err)) {
           ^
   fs/nilfs2/super.c:188:7: note: Assuming the condition is true
                   if (err =3D=3D -EIO && nilfs->ns_sbh[1]) {
                       ^~~~~~~~~~~
   fs/nilfs2/super.c:188:7: note: Left side of '&&' is true
   fs/nilfs2/super.c:188:22: note: Assuming the condition is true
                   if (err =3D=3D -EIO && nilfs->ns_sbh[1]) {
                                      ^~~~~~~~~~~~~~~~
   fs/nilfs2/super.c:188:3: note: Taking true branch
                   if (err =3D=3D -EIO && nilfs->ns_sbh[1]) {
                   ^
   fs/nilfs2/super.c:193:4: note: Null pointer passed as 1st argument to me=
mory copy function
                           memcpy(nilfs->ns_sbp[1], nilfs->ns_sbp[0],
                           ^      ~~~~~~~~~~~~~~~~
   fs/nilfs2/super.c:640:4: warning: Value stored to 'err' is never read [c=
lang-analyzer-deadcode.DeadStores]
                           err =3D 0;
                           ^     ~
   fs/nilfs2/super.c:640:4: note: Value stored to 'err' is never read
                           err =3D 0;
                           ^     ~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   arch/x86/include/asm/div64.h:54:20: warning: Division by zero [clang-ana=
lyzer-core.DivideZero]
                   d.v32[1] =3D upper / divisor;
                                    ^
   fs/f2fs/gc.c:308:23: note: Assuming the condition is true
           unsigned int secno =3D GET_SEC_FROM_SEG(sbi, segno);
                                ^
   fs/f2fs/segment.h:104:4: note: expanded from macro 'GET_SEC_FROM_SEG'
           (((segno) =3D=3D -1) ? -1: (segno) / (sbi)->segs_per_sec)
             ^~~~~~~~~~~~~
   fs/f2fs/gc.c:308:23: note: '?' condition is true
           unsigned int secno =3D GET_SEC_FROM_SEG(sbi, segno);
                                ^
   fs/f2fs/segment.h:104:3: note: expanded from macro 'GET_SEC_FROM_SEG'
           (((segno) =3D=3D -1) ? -1: (segno) / (sbi)->segs_per_sec)
            ^
   fs/f2fs/gc.c:315:2: note: 'usable_segs_per_sec' initialized here
           unsigned int usable_segs_per_sec =3D f2fs_usable_segs_in_sec(sbi=
, segno);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/gc.c:317:14: note: Assuming 'i' is >=3D 'usable_segs_per_sec'
           for (i =3D 0; i < usable_segs_per_sec; i++)
                       ^~~~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/gc.c:317:2: note: Loop condition is false. Execution continues o=
n line 319
           for (i =3D 0; i < usable_segs_per_sec; i++)
           ^
   fs/f2fs/gc.c:321:25: note: Passing the value 0 via 2nd parameter 'diviso=
r'
           mtime =3D div_u64(mtime, usable_segs_per_sec);
                                  ^~~~~~~~~~~~~~~~~~~
   fs/f2fs/gc.c:321:10: note: Calling 'div_u64'
           mtime =3D div_u64(mtime, usable_segs_per_sec);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/math64.h:128:31: note: Passing the value 0 via 2nd paramet=
er 'divisor'
           return div_u64_rem(dividend, divisor, &remainder);
                                        ^~~~~~~
   include/linux/math64.h:128:9: note: Calling 'div_u64_rem'
           return div_u64_rem(dividend, divisor, &remainder);
                  ^
   arch/x86/include/asm/div64.h:61:21: note: expanded from macro 'div_u64_r=
em'
   #define div_u64_rem     div_u64_rem
                           ^
   arch/x86/include/asm/div64.h:53:6: note: Assuming 'upper' is >=3D 'divis=
or'
           if (upper >=3D divisor) {
               ^~~~~~~~~~~~~~~~
   arch/x86/include/asm/div64.h:53:2: note: Taking true branch
           if (upper >=3D divisor) {
           ^
   arch/x86/include/asm/div64.h:54:20: note: Division by zero
                   d.v32[1] =3D upper / divisor;
                              ~~~~~~^~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
>> fs/f2fs/f2fs.h:2607:6: warning: Branch condition evaluates to a garbage =
value [clang-analyzer-core.uninitialized.Branch]
           if (dn->node_page)
               ^
   fs/f2fs/data.c:2134:2: note: Assuming the condition is true
           f2fs_bug_on(sbi, f2fs_cluster_is_empty(cc));
           ^
   fs/f2fs/f2fs.h:36:7: note: expanded from macro 'f2fs_bug_on'
                   if (WARN_ON(condition))                                 \
                       ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:121:23: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                ^~~~~~~~~~~~
   fs/f2fs/data.c:2134:2: note: Taking false branch
           f2fs_bug_on(sbi, f2fs_cluster_is_empty(cc));
           ^
   fs/f2fs/f2fs.h:36:7: note: expanded from macro 'f2fs_bug_on'
                   if (WARN_ON(condition))                                 \
                       ^
   include/asm-generic/bug.h:122:2: note: expanded from macro 'WARN_ON'
           if (unlikely(__ret_warn_on))                                    \
           ^
   fs/f2fs/data.c:2134:2: note: Taking false branch
           f2fs_bug_on(sbi, f2fs_cluster_is_empty(cc));
           ^
   fs/f2fs/f2fs.h:36:3: note: expanded from macro 'f2fs_bug_on'
                   if (WARN_ON(condition))                                 \
                   ^
   fs/f2fs/data.c:2134:2: note: Loop condition is false.  Exiting loop
           f2fs_bug_on(sbi, f2fs_cluster_is_empty(cc));
           ^
   fs/f2fs/f2fs.h:35:2: note: expanded from macro 'f2fs_bug_on'
           do {                                                            \
           ^
   fs/f2fs/data.c:2140:14: note: Assuming 'i' is >=3D field 'cluster_size'
           for (i =3D 0; i < cc->cluster_size; i++) {
                       ^~~~~~~~~~~~~~~~~~~~
   fs/f2fs/data.c:2140:2: note: Loop condition is false. Execution continue=
s on line 2158
           for (i =3D 0; i < cc->cluster_size; i++) {
           ^
   fs/f2fs/data.c:2158:6: note: Assuming the condition is false
           if (f2fs_cluster_is_empty(cc))
               ^~~~~~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/data.c:2158:2: note: Taking false branch
           if (f2fs_cluster_is_empty(cc))
           ^
   fs/f2fs/data.c:2161:6: note: Assuming the condition is true
           if (f2fs_lookup_extent_cache(inode, start_idx, &ei))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/data.c:2161:2: note: Taking true branch
           if (f2fs_lookup_extent_cache(inode, start_idx, &ei))
           ^
   fs/f2fs/data.c:2164:7: note: 'from_dnode' is false
           if (!from_dnode)
                ^~~~~~~~~~
   fs/f2fs/data.c:2164:2: note: Taking true branch
           if (!from_dnode)
           ^
   fs/f2fs/data.c:2165:3: note: Control jumps to line 2175
                   goto skip_reading_dnode;
                   ^
   fs/f2fs/data.c:2175:14: note: Assuming 'i' is >=3D field 'cluster_size'
           for (i =3D 1; i < cc->cluster_size; i++) {
                       ^~~~~~~~~~~~~~~~~~~~
   fs/f2fs/data.c:2175:2: note: Loop condition is false. Execution continue=
s on line 2196
           for (i =3D 1; i < cc->cluster_size; i++) {
           ^
   fs/f2fs/data.c:2196:6: note: Assuming field 'nr_cpages' is not equal to 0
           if (cc->nr_cpages =3D=3D 0) {
               ^~~~~~~~~~~~~~~~~~
   fs/f2fs/data.c:2196:2: note: Taking false branch
           if (cc->nr_cpages =3D=3D 0) {
           ^
   fs/f2fs/data.c:2202:2: note: Taking false branch
           if (IS_ERR(dic)) {
           ^
   fs/f2fs/data.c:2207:14: note: Assuming 'i' is < field 'nr_cpages'
           for (i =3D 0; i < cc->nr_cpages; i++) {
                       ^~~~~~~~~~~~~~~~~
   fs/f2fs/data.c:2207:2: note: Loop condition is true.  Entering loop body
           for (i =3D 0; i < cc->nr_cpages; i++) {
           ^
   fs/f2fs/data.c:2212:13: note: 'from_dnode' is false
                   blkaddr =3D from_dnode ? data_blkaddr(dn.inode, dn.node_=
page,
                             ^~~~~~~~~~
   fs/f2fs/data.c:2212:13: note: '?' condition is false
   fs/f2fs/data.c:2218:7: note: Assuming the condition is false
                   if (f2fs_load_compressed_page(sbi, page, blkaddr)) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/data.c:2218:3: note: Taking false branch
                   if (f2fs_load_compressed_page(sbi, page, blkaddr)) {
                   ^
   fs/f2fs/data.c:2224:7: note: Assuming 'bio' is null
                   if (bio && (!page_is_mergeable(sbi, bio,
                       ^~~
   fs/f2fs/data.c:2224:11: note: Left side of '&&' is false
                   if (bio && (!page_is_mergeable(sbi, bio,
                           ^
   fs/f2fs/data.c:2232:8: note: 'bio' is null
                   if (!bio) {
                        ^~~
   fs/f2fs/data.c:2232:3: note: Taking true branch

vim +2607 fs/f2fs/f2fs.h

39a53e0ce0df01 Jaegeuk Kim 2012-11-28  2604  =

39a53e0ce0df01 Jaegeuk Kim 2012-11-28  2605  static inline void f2fs_put_dn=
ode(struct dnode_of_data *dn)
39a53e0ce0df01 Jaegeuk Kim 2012-11-28  2606  {
39a53e0ce0df01 Jaegeuk Kim 2012-11-28 @2607  	if (dn->node_page)
39a53e0ce0df01 Jaegeuk Kim 2012-11-28  2608  		f2fs_put_page(dn->node_page,=
 1);
39a53e0ce0df01 Jaegeuk Kim 2012-11-28  2609  	if (dn->inode_page && dn->nod=
e_page !=3D dn->inode_page)
39a53e0ce0df01 Jaegeuk Kim 2012-11-28  2610  		f2fs_put_page(dn->inode_page=
, 0);
39a53e0ce0df01 Jaegeuk Kim 2012-11-28  2611  	dn->node_page =3D NULL;
39a53e0ce0df01 Jaegeuk Kim 2012-11-28  2612  	dn->inode_page =3D NULL;
39a53e0ce0df01 Jaegeuk Kim 2012-11-28  2613  }
39a53e0ce0df01 Jaegeuk Kim 2012-11-28  2614  =


:::::: The code at line 2607 was first introduced by commit
:::::: 39a53e0ce0df01b3cf4bb898c7ae2fd2189647d5 f2fs: add superblock and ma=
jor in-memory structure

:::::: TO: Jaegeuk Kim <jaegeuk.kim@samsung.com>
:::::: CC: Jaegeuk Kim <jaegeuk.kim@samsung.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1077547295098336415==--

