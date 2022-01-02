Content-Type: multipart/mixed; boundary="===============3902538634150626051=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/msm/dp/dp_aux.c:149:2: warning: Value stored to 'data' is never read [clang-analyzer-deadcode.DeadStores]
Date: Mon, 03 Jan 2022 00:11:02 +0800
Message-ID: <202201030024.YFWNNqQy-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3902538634150626051==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: "Christian K=C3=B6nig" <christian.koenig@amd.com>
CC: Rob Clark <robdclark@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   278218f6778bc7d6f8b67199446c56cec7ebb841
commit: b3ed524f84f573ece1aa2f26e9db3c34a593e0d1 drm/msm: allow compile_tes=
t on !ARM
date:   3 months ago
:::::: branch date: 22 hours ago
:::::: commit date: 3 months ago
config: riscv-randconfig-c006-20211230 (https://download.01.org/0day-ci/arc=
hive/20220103/202201030024.YFWNNqQy-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project cd284b=
7ac0615afc6e0f1a30da2777e361de27a3)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Db3ed524f84f573ece1aa2f26e9db3c34a593e0d1
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout b3ed524f84f573ece1aa2f26e9db3c34a593e0d1
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   include/linux/pgtable.h:978:36: note: expanded from macro 'arch_leave_la=
zy_mmu_mode'
   #define arch_leave_lazy_mmu_mode()      do {} while (0)
                                           ^
   mm/memory.c:2542:6: note: Assuming the condition is true
           if (mm !=3D &init_mm)
               ^~~~~~~~~~~~~~
   mm/memory.c:2542:2: note: Taking true branch
           if (mm !=3D &init_mm)
           ^
   mm/memory.c:2543:3: note: 1st function call argument is an uninitialized=
 value
                   pte_unmap_unlock(mapped_pte, ptl);
                   ^
   include/linux/mm.h:2274:2: note: expanded from macro 'pte_unmap_unlock'
           spin_unlock(ptl);                               \
           ^           ~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   fs/isofs/inode.c:1388:3: warning: Value stored to 'ret' is never read [c=
lang-analyzer-deadcode.DeadStores]
                   ret =3D -EIO;
                   ^     ~~~~
   fs/isofs/inode.c:1388:3: note: Value stored to 'ret' is never read
                   ret =3D -EIO;
                   ^     ~~~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   fs/isofs/util.c:40:14: warning: The result of the left shift is undefine=
d because the left operand is negative [clang-analyzer-core.UndefinedBinary=
OperatorResult]
                           tz |=3D (-1 << 8);
                                  ~~ ^
   fs/isofs/util.c:30:6: note: Assuming 'flag' is equal to 0
           if (flag =3D=3D 0) tz =3D p[6]; /* High sierra has no time zone =
*/
               ^~~~~~~~~
   fs/isofs/util.c:30:2: note: Taking true branch
           if (flag =3D=3D 0) tz =3D p[6]; /* High sierra has no time zone =
*/
           ^
   fs/isofs/util.c:33:6: note: 'year' is >=3D 0
           if (year < 0) {
               ^~~~
   fs/isofs/util.c:33:2: note: Taking false branch
           if (year < 0) {
           ^
   fs/isofs/util.c:39:7: note: Assuming the condition is true
                   if (tz & 0x80)
                       ^~~~~~~~~
   fs/isofs/util.c:39:3: note: Taking true branch
                   if (tz & 0x80)
                   ^
   fs/isofs/util.c:40:14: note: The result of the left shift is undefined b=
ecause the left operand is negative
                           tz |=3D (-1 << 8);
                                  ~~ ^
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
>> drivers/gpu/drm/msm/dp/dp_aux.c:149:2: warning: Value stored to 'data' i=
s never read [clang-analyzer-deadcode.DeadStores]
           data =3D dp_catalog_aux_read_data(aux->catalog);
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/dp/dp_aux.c:149:2: note: Value stored to 'data' is n=
ever read
           data =3D dp_catalog_aux_read_data(aux->catalog);
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
>> drivers/gpu/drm/msm/dp/dp_catalog.c:447:34: warning: Division by zero [c=
lang-analyzer-core.DivideZero]
           dispcc_input_rate =3D (rate * 10) / pixel_div;
                               ~~~~~~~~~~~~^~~~~~~~~~~
   drivers/gpu/drm/msm/dp/dp_catalog.c:429:18: note: 'pixel_div' initialize=
d to 0
           u32 mvid, nvid, pixel_div =3D 0, dispcc_input_rate;
                           ^~~~~~~~~
   drivers/gpu/drm/msm/dp/dp_catalog.c:435:39: note: Left side of '&&' is f=
alse
           struct dp_catalog_private *catalog =3D container_of(dp_catalog,
                                                ^
   include/linux/kernel.h:495:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/gpu/drm/msm/dp/dp_catalog.c:435:39: note: Taking false branch
           struct dp_catalog_private *catalog =3D container_of(dp_catalog,
                                                ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:302:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/gpu/drm/msm/dp/dp_catalog.c:435:39: note: Loop condition is fals=
e.  Exiting loop
           struct dp_catalog_private *catalog =3D container_of(dp_catalog,
                                                ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:300:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/gpu/drm/msm/dp/dp_catalog.c:438:6: note: Assuming 'rate' is not =
equal to 'link_rate_hbr3'
           if (rate =3D=3D link_rate_hbr3)
               ^~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/dp/dp_catalog.c:438:2: note: Taking false branch
           if (rate =3D=3D link_rate_hbr3)
           ^
   drivers/gpu/drm/msm/dp/dp_catalog.c:440:11: note: Assuming 'rate' is not=
 equal to 1620000
           else if (rate =3D=3D 1620000 || rate =3D=3D 270000)
                    ^~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/dp/dp_catalog.c:440:11: note: Left side of '||' is f=
alse
   drivers/gpu/drm/msm/dp/dp_catalog.c:440:30: note: Assuming 'rate' is not=
 equal to 270000
           else if (rate =3D=3D 1620000 || rate =3D=3D 270000)
                                       ^~~~~~~~~~~~~~
   drivers/gpu/drm/msm/dp/dp_catalog.c:440:7: note: Taking false branch
           else if (rate =3D=3D 1620000 || rate =3D=3D 270000)
                ^
   drivers/gpu/drm/msm/dp/dp_catalog.c:442:11: note: Assuming 'rate' is not=
 equal to 'link_rate_hbr2'
           else if (rate =3D=3D link_rate_hbr2)
                    ^~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/dp/dp_catalog.c:442:7: note: Taking false branch
           else if (rate =3D=3D link_rate_hbr2)
                ^
   drivers/gpu/drm/msm/dp/dp_catalog.c:447:34: note: Division by zero
           dispcc_input_rate =3D (rate * 10) / pixel_div;
                               ~~~~~~~~~~~~^~~~~~~~~~~
   Suppressed 10 warnings (9 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (9 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (6 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   fs/ksmbd/vfs.c:448:2: warning: Null pointer passed as 1st argument to me=
mory copy function [clang-analyzer-unix.cstring.NullArg]
           memcpy(&stream_buf[*pos], buf, count);
           ^
   fs/ksmbd/vfs.c:487:6: note: Assuming field 'connection_type' is 0
           if (sess->conn->connection_type) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ksmbd/vfs.c:487:2: note: Taking false branch
           if (sess->conn->connection_type) {
           ^
   fs/ksmbd/vfs.c:498:2: note: Taking true branch
           if (ksmbd_stream_fd(fp)) {
           ^
   fs/ksmbd/vfs.c:499:9: note: Calling 'ksmbd_vfs_stream_write'
                   err =3D ksmbd_vfs_stream_write(fp, buf, pos, count);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ksmbd/vfs.c:415:2: note: Assuming the condition is false
--
            ^
   include/linux/compiler.h:77:20: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                           ^
   fs/xfs/libxfs/xfs_iext_tree.c:648:6: note: Assuming 'nr_entries' is equa=
l to RECS_PER_LEAF
           if (nr_entries =3D=3D RECS_PER_LEAF)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_iext_tree.c:648:2: note: Taking true branch
           if (nr_entries =3D=3D RECS_PER_LEAF)
           ^
   fs/xfs/libxfs/xfs_iext_tree.c:655:19: note: 'new' is equal to field 'lea=
f'
           if (cur->leaf !=3D new && cur->pos =3D=3D 0 && nr_entries > 0) {
                            ^~~
   fs/xfs/libxfs/xfs_iext_tree.c:655:23: note: Left side of '&&' is false
           if (cur->leaf !=3D new && cur->pos =3D=3D 0 && nr_entries > 0) {
                                ^
   fs/xfs/libxfs/xfs_iext_tree.c:660:2: note: Loop condition is false. Exec=
ution continues on line 662
           for (i =3D nr_entries; i > cur->pos; i--)
           ^
   fs/xfs/libxfs/xfs_iext_tree.c:667:6: note: 'new' is non-null
           if (new)
               ^~~
   fs/xfs/libxfs/xfs_iext_tree.c:667:2: note: Taking true branch
           if (new)
           ^
   fs/xfs/libxfs/xfs_iext_tree.c:668:3: note: Calling 'xfs_iext_insert_node'
                   xfs_iext_insert_node(ifp, xfs_iext_leaf_key(new, 0), new=
, 2);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   fs/xfs/libxfs/xfs_iext_tree.c:503:6: note: Assuming 'level' is <=3D fiel=
d 'if_height'
           if (ifp->if_height < level)
               ^~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_iext_tree.c:503:2: note: Taking false branch
           if (ifp->if_height < level)
           ^
   fs/xfs/libxfs/xfs_iext_tree.c:507:2: note: Value assigned to 'node'
           node =3D xfs_iext_find_level(ifp, offset, level);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_iext_tree.c:511:9: note: Assuming 'pos' is >=3D 'nr_en=
tries'
           ASSERT(pos >=3D nr_entries || xfs_iext_key_cmp(node, pos, offset=
) !=3D 0);
                  ^
   fs/xfs/xfs_linux.h:214:10: note: expanded from macro 'ASSERT'
           (likely(expr) ? (void)0 : asswarn(NULL, #expr, __FILE__, __LINE_=
_))
                   ^~~~
   include/linux/compiler.h:77:40: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                               ^
   fs/xfs/libxfs/xfs_iext_tree.c:511:27: note: Left side of '||' is true
           ASSERT(pos >=3D nr_entries || xfs_iext_key_cmp(node, pos, offset=
) !=3D 0);
                                    ^
   fs/xfs/libxfs/xfs_iext_tree.c:511:2: note: '?' condition is true
           ASSERT(pos >=3D nr_entries || xfs_iext_key_cmp(node, pos, offset=
) !=3D 0);
           ^
   fs/xfs/xfs_linux.h:214:3: note: expanded from macro 'ASSERT'
           (likely(expr) ? (void)0 : asswarn(NULL, #expr, __FILE__, __LINE_=
_))
            ^
   include/linux/compiler.h:77:20: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                           ^
   fs/xfs/libxfs/xfs_iext_tree.c:512:9: note: Assuming 'nr_entries' is <=3D=
 KEYS_PER_NODE
           ASSERT(nr_entries <=3D KEYS_PER_NODE);
                  ^
   fs/xfs/xfs_linux.h:214:10: note: expanded from macro 'ASSERT'
           (likely(expr) ? (void)0 : asswarn(NULL, #expr, __FILE__, __LINE_=
_))
                   ^~~~
   include/linux/compiler.h:77:40: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                               ^
   fs/xfs/libxfs/xfs_iext_tree.c:512:2: note: '?' condition is true
           ASSERT(nr_entries <=3D KEYS_PER_NODE);
           ^
   fs/xfs/xfs_linux.h:214:3: note: expanded from macro 'ASSERT'
           (likely(expr) ? (void)0 : asswarn(NULL, #expr, __FILE__, __LINE_=
_))
            ^
   include/linux/compiler.h:77:20: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                           ^
   fs/xfs/libxfs/xfs_iext_tree.c:514:6: note: Assuming 'nr_entries' is not =
equal to KEYS_PER_NODE
           if (nr_entries =3D=3D KEYS_PER_NODE)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_iext_tree.c:514:2: note: Taking false branch
           if (nr_entries =3D=3D KEYS_PER_NODE)
           ^
   fs/xfs/libxfs/xfs_iext_tree.c:521:6: note: Assuming 'node' is equal to '=
new'
           if (node !=3D new && pos =3D=3D 0 && nr_entries > 0)
               ^~~~~~~~~~~
   fs/xfs/libxfs/xfs_iext_tree.c:521:18: note: Left side of '&&' is false
           if (node !=3D new && pos =3D=3D 0 && nr_entries > 0)
                           ^
   fs/xfs/libxfs/xfs_iext_tree.c:524:23: note: 'i' is <=3D 'pos'
           for (i =3D nr_entries; i > pos; i--) {
                                ^
   fs/xfs/libxfs/xfs_iext_tree.c:524:2: note: Loop condition is false. Exec=
ution continues on line 528
           for (i =3D nr_entries; i > pos; i--) {
           ^
   fs/xfs/libxfs/xfs_iext_tree.c:528:18: note: Array access (via field 'key=
s') results in a null pointer dereference
           node->keys[pos] =3D offset;
                 ~~~~      ^
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
>> drivers/gpu/drm/msm/dp/dp_ctrl.c:968:8: warning: Assigned value is garba=
ge or undefined [clang-analyzer-core.uninitialized.Assign]
           dp_tu |=3D tu_calc_table.tu_size_minus1;
                 ^
   drivers/gpu/drm/msm/dp/dp_ctrl.c:1590:6: note: Assuming 'dp_ctrl' is non=
-null
           if (!dp_ctrl) {
               ^~~~~~~~
   drivers/gpu/drm/msm/dp/dp_ctrl.c:1590:2: note: Taking false branch
           if (!dp_ctrl) {
           ^
   drivers/gpu/drm/msm/dp/dp_ctrl.c:1595:9: note: Left side of '&&' is false
           ctrl =3D container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
                  ^
   include/linux/kernel.h:495:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/gpu/drm/msm/dp/dp_ctrl.c:1595:9: note: Taking false branch
           ctrl =3D container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
                  ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:302:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/gpu/drm/msm/dp/dp_ctrl.c:1595:9: note: Loop condition is false. =
 Exiting loop
           ctrl =3D container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
                  ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:300:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/gpu/drm/msm/dp/dp_ctrl.c:1598:6: note: Assuming the condition is=
 true
           if (sink_request & DP_TEST_LINK_PHY_TEST_PATTERN) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/dp/dp_ctrl.c:1598:2: note: Taking true branch
           if (sink_request & DP_TEST_LINK_PHY_TEST_PATTERN) {
           ^
   drivers/gpu/drm/msm/dp/dp_ctrl.c:1600:7: note: Calling 'dp_ctrl_process_=
phy_test_request'
                   if (dp_ctrl_process_phy_test_request(ctrl)) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/dp/dp_ctrl.c:1508:6: note: Assuming field 'phy_test_=
pattern_sel' is not equal to 0
           if (!ctrl->link->phy_params.phy_test_pattern_sel) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/dp/dp_ctrl.c:1508:2: note: Taking false branch
           if (!ctrl->link->phy_params.phy_test_pattern_sel) {
           ^
   drivers/gpu/drm/msm/dp/dp_ctrl.c:1519:6: note: 'ret' is 0
           if (ret) {
               ^~~
   drivers/gpu/drm/msm/dp/dp_ctrl.c:1519:2: note: Taking false branch
           if (ret) {
           ^
   drivers/gpu/drm/msm/dp/dp_ctrl.c:1525:7: note: 'ret' is 0
           if (!ret)
                ^~~
   drivers/gpu/drm/msm/dp/dp_ctrl.c:1525:2: note: Taking true branch
           if (!ret)
           ^
   drivers/gpu/drm/msm/dp/dp_ctrl.c:1526:9: note: Calling 'dp_ctrl_on_strea=
m'
                   ret =3D dp_ctrl_on_stream(&ctrl->dp_ctrl);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/dp/dp_ctrl.c:1786:7: note: 'dp_ctrl' is non-null
           if (!dp_ctrl)
                ^~~~~~~
   drivers/gpu/drm/msm/dp/dp_ctrl.c:1786:2: note: Taking false branch
           if (!dp_ctrl)
           ^
   drivers/gpu/drm/msm/dp/dp_ctrl.c:1789:9: note: Left side of '&&' is false
           ctrl =3D container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
                  ^
   include/linux/kernel.h:495:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/gpu/drm/msm/dp/dp_ctrl.c:1789:9: note: Taking false branch
           ctrl =3D container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
                  ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:302:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/gpu/drm/msm/dp/dp_ctrl.c:1789:9: note: Loop condition is false. =
 Exiting loop
           ctrl =3D container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
                  ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:300:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/gpu/drm/msm/dp/dp_ctrl.c:1797:6: note: Assuming the condition is=
 false
           if (!dp_power_clk_status(ctrl->power, DP_CTRL_PM)) { /* link clk=
 is off */
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/dp/dp_ctrl.c:1797:2: note: Taking false branch
           if (!dp_power_clk_status(ctrl->power, DP_CTRL_PM)) { /* link clk=
 is off */
           ^
   drivers/gpu/drm/msm/dp/dp_ctrl.c:1805:6: note: Assuming the condition is=
 false
           if (!dp_ctrl_channel_eq_ok(ctrl))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/dp/dp_ctrl.c:1805:2: note: Taking false branch
           if (!dp_ctrl_channel_eq_ok(ctrl))
           ^
   drivers/gpu/drm/msm/dp/dp_ctrl.c:1812:6: note: 'ret' is 0
           if (ret) {
               ^~~
   drivers/gpu/drm/msm/dp/dp_ctrl.c:1812:2: note: Taking false branch
           if (ret) {
           ^
   drivers/gpu/drm/msm/dp/dp_ctrl.c:1817:2: note: Taking false branch
           if (ctrl->link->sink_request & DP_TEST_LINK_PHY_TEST_PATTERN) {
           ^
   drivers/gpu/drm/msm/dp/dp_ctrl.c:1834:2: note: Calling 'dp_ctrl_setup_tr=
_unit'
           dp_ctrl_setup_tr_unit(ctrl);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/dp/dp_ctrl.c:966:2: note: Calling 'dp_ctrl_calc_tu_p=
arameters'
           dp_ctrl_calc_tu_parameters(ctrl, &tu_calc_table);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/dp/dp_ctrl.c:956:2: note: Calling '_dp_ctrl_calc_tu'
           _dp_ctrl_calc_tu(&in, tu_table);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/dp/dp_ctrl.c:624:6: note: Assuming 'tu' is null
           if (!tu)
               ^~~
   drivers/gpu/drm/msm/dp/dp_ctrl.c:624:2: note: Taking true branch
           if (!tu)
           ^
   drivers/gpu/drm/msm/dp/dp_ctrl.c:625:3: note: Returning without writing =
to 'tu_table->tu_size_minus1'
                   return;
                   ^
   drivers/gpu/drm/msm/dp/dp_ctrl.c:956:2: note: Returning from '_dp_ctrl_c=
alc_tu'
           _dp_ctrl_calc_tu(&in, tu_table);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/dp/dp_ctrl.c:957:1: note: Returning without writing =
to 'tu_table->tu_size_minus1'
   }
   ^
   drivers/gpu/drm/msm/dp/dp_ctrl.c:966:2: note: Returning from 'dp_ctrl_ca=
lc_tu_parameters'
           dp_ctrl_calc_tu_parameters(ctrl, &tu_calc_table);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/dp/dp_ctrl.c:968:8: note: Assigned value is garbage =
or undefined
           dp_tu |=3D tu_calc_table.tu_size_minus1;
                 ^  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/msm/dp/dp_ctrl.c:1096:2: warning: Value stored to 'tries=
' is never read [clang-analyzer-deadcode.DeadStores]
           tries =3D 0;
           ^       ~
   drivers/gpu/drm/msm/dp/dp_ctrl.c:1096:2: note: Value stored to 'tries' i=
s never read
           tries =3D 0;
           ^       ~
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   drivers/regulator/mt6359-regulator.c:281:9: warning: Assigned value is g=
arbage or undefined [clang-analyzer-core.uninitialized.Assign]
           regval >>=3D ffs(info->modeset_mask) - 1;
                  ^
   drivers/regulator/mt6359-regulator.c:306:14: note: Calling 'mt6359_regul=
ator_get_mode'
           curr_mode =3D mt6359_regulator_get_mode(rdev);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/mt6359-regulator.c:274:6: note: Assuming 'ret' is equa=
l to 0
           if (ret !=3D 0) {
               ^~~~~~~~
   drivers/regulator/mt6359-regulator.c:274:2: note: Taking false branch
           if (ret !=3D 0) {
           ^
   drivers/regulator/mt6359-regulator.c:281:9: note: Assigned value is garb=
age or undefined
           regval >>=3D ffs(info->modeset_mask) - 1;
                  ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/mt6359-regulator.c:310:7: warning: Assigned value is g=
arbage or undefined [clang-analyzer-core.uninitialized.Assign]
                   val <<=3D ffs(info->modeset_mask) - 1;
                       ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/mt6359-regulator.c:307:2: note: Control jumps to 'case=
 1:'  at line 308
           switch (mode) {
           ^
   drivers/regulator/mt6359-regulator.c:310:7: note: Assigned value is garb=
age or undefined
                   val <<=3D ffs(info->modeset_mask) - 1;
                       ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/mt6359-regulator.c:319:8: warning: Assigned value is g=
arbage or undefined [clang-analyzer-core.uninitialized.Assign]
                           val <<=3D ffs(info->modeset_mask) - 1;
                               ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/mt6359-regulator.c:307:2: note: Control jumps to 'case=
 2:'  at line 316
           switch (mode) {
           ^
   drivers/regulator/mt6359-regulator.c:317:7: note: Assuming 'curr_mode' i=
s equal to REGULATOR_MODE_FAST
                   if (curr_mode =3D=3D REGULATOR_MODE_FAST) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/mt6359-regulator.c:317:3: note: Taking true branch
                   if (curr_mode =3D=3D REGULATOR_MODE_FAST) {
                   ^
   drivers/regulator/mt6359-regulator.c:319:8: note: Assigned value is garb=
age or undefined
                           val <<=3D ffs(info->modeset_mask) - 1;
                               ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/mt6359-regulator.c:326:8: warning: Assigned value is g=
arbage or undefined [clang-analyzer-core.uninitialized.Assign]
                           val <<=3D ffs(info->lp_mode_mask) - 1;
                               ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/mt6359-regulator.c:307:2: note: Control jumps to 'case=
 2:'  at line 316
           switch (mode) {
           ^
   drivers/regulator/mt6359-regulator.c:317:7: note: Assuming 'curr_mode' i=
s not equal to REGULATOR_MODE_FAST
                   if (curr_mode =3D=3D REGULATOR_MODE_FAST) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/mt6359-regulator.c:317:3: note: Taking false branch
                   if (curr_mode =3D=3D REGULATOR_MODE_FAST) {
                   ^
   drivers/regulator/mt6359-regulator.c:324:14: note: Assuming 'curr_mode' =
is equal to REGULATOR_MODE_IDLE
                   } else if (curr_mode =3D=3D REGULATOR_MODE_IDLE) {
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/mt6359-regulator.c:324:10: note: Taking true branch
                   } else if (curr_mode =3D=3D REGULATOR_MODE_IDLE) {
                          ^
   drivers/regulator/mt6359-regulator.c:326:8: note: Assigned value is garb=
age or undefined
                           val <<=3D ffs(info->lp_mode_mask) - 1;
                               ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/mt6359-regulator.c:336:7: warning: Assigned value is g=
arbage or undefined [clang-analyzer-core.uninitialized.Assign]
                   val <<=3D ffs(info->lp_mode_mask) - 1;
                       ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/mt6359-regulator.c:307:2: note: Control jumps to 'case=
 4:'  at line 334
           switch (mode) {
           ^
   drivers/regulator/mt6359-regulator.c:336:7: note: Assigned value is garb=
age or undefined
                   val <<=3D ffs(info->lp_mode_mask) - 1;
                       ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/mt6359-regulator.c:421:6: warning: Assigned value is g=
arbage or undefined [clang-analyzer-core.uninitialized.Assign]
           val >>=3D ffs(info->desc.vsel_mask) - 1;
               ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/mt6359-regulator.c:401:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   drivers/regulator/mt6359-regulator.c:401:2: note: Taking false branch
           if (ret)
           ^
   drivers/regulator/mt6359-regulator.c:403:2: note: Control jumps to 'case=
 1:'  at line 409
           switch (val) {
           ^
   drivers/regulator/mt6359-regulator.c:413:3: note:  Execution continues o=
n line 417
                   break;
                   ^
   drivers/regulator/mt6359-regulator.c:417:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   drivers/regulator/mt6359-regulator.c:417:2: note: Taking false branch
           if (ret)
           ^
   drivers/regulator/mt6359-regulator.c:421:6: note: Assigned value is garb=
age or undefined
           val >>=3D ffs(info->desc.vsel_mask) - 1;

vim +/data +149 drivers/gpu/drm/msm/dp/dp_aux.c

c943b4948b5848 Chandan Uddaraju 2020-08-27  129  =

e305f678e98799 Stephen Boyd     2021-05-07  130  static ssize_t dp_aux_cmd_=
fifo_rx(struct dp_aux_private *aux,
c943b4948b5848 Chandan Uddaraju 2020-08-27  131  		struct drm_dp_aux_msg *m=
sg)
c943b4948b5848 Chandan Uddaraju 2020-08-27  132  {
c943b4948b5848 Chandan Uddaraju 2020-08-27  133  	u32 data;
c943b4948b5848 Chandan Uddaraju 2020-08-27  134  	u8 *dp;
c943b4948b5848 Chandan Uddaraju 2020-08-27  135  	u32 i, actual_i;
c943b4948b5848 Chandan Uddaraju 2020-08-27  136  	u32 len =3D msg->size;
c943b4948b5848 Chandan Uddaraju 2020-08-27  137  =

c943b4948b5848 Chandan Uddaraju 2020-08-27  138  	dp_catalog_aux_clear_tran=
s(aux->catalog, true);
c943b4948b5848 Chandan Uddaraju 2020-08-27  139  =

c943b4948b5848 Chandan Uddaraju 2020-08-27  140  	data =3D DP_AUX_DATA_INDE=
X_WRITE; /* INDEX_WRITE */
c943b4948b5848 Chandan Uddaraju 2020-08-27  141  	data |=3D DP_AUX_DATA_REA=
D;  /* read */
c943b4948b5848 Chandan Uddaraju 2020-08-27  142  =

c943b4948b5848 Chandan Uddaraju 2020-08-27  143  	aux->catalog->aux_data =
=3D data;
c943b4948b5848 Chandan Uddaraju 2020-08-27  144  	dp_catalog_aux_write_data=
(aux->catalog);
c943b4948b5848 Chandan Uddaraju 2020-08-27  145  =

c943b4948b5848 Chandan Uddaraju 2020-08-27  146  	dp =3D msg->buffer;
c943b4948b5848 Chandan Uddaraju 2020-08-27  147  =

c943b4948b5848 Chandan Uddaraju 2020-08-27  148  	/* discard first byte */
c943b4948b5848 Chandan Uddaraju 2020-08-27 @149  	data =3D dp_catalog_aux_r=
ead_data(aux->catalog);
c943b4948b5848 Chandan Uddaraju 2020-08-27  150  =

c943b4948b5848 Chandan Uddaraju 2020-08-27  151  	for (i =3D 0; i < len; i+=
+) {
c943b4948b5848 Chandan Uddaraju 2020-08-27  152  		data =3D dp_catalog_aux_=
read_data(aux->catalog);
c943b4948b5848 Chandan Uddaraju 2020-08-27  153  		*dp++ =3D (u8)((data >> =
DP_AUX_DATA_OFFSET) & 0xff);
c943b4948b5848 Chandan Uddaraju 2020-08-27  154  =

c943b4948b5848 Chandan Uddaraju 2020-08-27  155  		actual_i =3D (data >> DP=
_AUX_DATA_INDEX_OFFSET) & 0xFF;
c943b4948b5848 Chandan Uddaraju 2020-08-27  156  		if (i !=3D actual_i)
e305f678e98799 Stephen Boyd     2021-05-07  157  			break;
c943b4948b5848 Chandan Uddaraju 2020-08-27  158  	}
e305f678e98799 Stephen Boyd     2021-05-07  159  =

e305f678e98799 Stephen Boyd     2021-05-07  160  	return i;
c943b4948b5848 Chandan Uddaraju 2020-08-27  161  }
c943b4948b5848 Chandan Uddaraju 2020-08-27  162  =


:::::: The code at line 149 was first introduced by commit
:::::: c943b4948b5848fc0e07f875edbd35a973879e22 drm/msm/dp: add displayPort=
 driver support

:::::: TO: Chandan Uddaraju <chandanu@codeaurora.org>
:::::: CC: Rob Clark <robdclark@chromium.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3902538634150626051==--

