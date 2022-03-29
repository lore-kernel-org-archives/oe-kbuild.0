Content-Type: multipart/mixed; boundary="===============8584825166146049211=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/iio/test/iio-test-rescale.c:578:2: warning: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-...
Date: Wed, 30 Mar 2022 05:51:42 +0800
Message-ID: <202203300527.sDzBjoh9-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8584825166146049211==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Liam Beguin <liambeguin@gmail.com>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>
CC: Peter Rosin <peda@axentia.se>
CC: Andy Shevchenko <andy.shevchenko@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   1930a6e739c4b4a654a69164dbe39e554d228915
commit: 8e74a48d17d509bf605e64252f38550b1a9cc376 iio: test: add basic tests=
 for the iio-rescale driver
date:   4 weeks ago
:::::: branch date: 21 hours ago
:::::: commit date: 4 weeks ago
config: arm-randconfig-c002-20220328 (https://download.01.org/0day-ci/archi=
ve/20220330/202203300527.sDzBjoh9-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0f6d95=
01cf49ce02937099350d08f20c4af86f3d)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D8e74a48d17d509bf605e64252f38550b1a9cc376
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 8e74a48d17d509bf605e64252f38550b1a9cc376
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                           ^
   fs/xfs/libxfs/xfs_defer.c:499:9: note: Left side of '||' is false
           while (!list_empty(&dop_pending) || !list_empty(&(*tp)->t_dfops)=
) {
                  ^
   fs/xfs/libxfs/xfs_defer.c:499:2: note: Loop condition is true.  Entering=
 loop body
           while (!list_empty(&dop_pending) || !list_empty(&(*tp)->t_dfops)=
) {
           ^
   fs/xfs/libxfs/xfs_defer.c:513:7: note: 'error' is 0
                   if (error)
                       ^~~~~
   fs/xfs/libxfs/xfs_defer.c:513:3: note: Taking false branch
                   if (error)
                   ^
   fs/xfs/libxfs/xfs_defer.c:518:7: note: 'error' is 0
                   if (error)
                       ^~~~~
   fs/xfs/libxfs/xfs_defer.c:518:3: note: Taking false branch
                   if (error)
                   ^
   fs/xfs/libxfs/xfs_defer.c:523:11: note: Calling 'xfs_defer_finish_one'
                   error =3D xfs_defer_finish_one(*tp, dfp);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_defer.c:442:2: note: 'error' declared without an initi=
al value
           int                             error;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_defer.c:447:2: note: Loop condition is false. Executio=
n continues on line 470
           list_for_each_safe(li, n, &dfp->dfp_work) {
           ^
   include/linux/list.h:607:2: note: expanded from macro 'list_for_each_saf=
e'
           for (pos =3D (head)->next, n =3D pos->next; \
           ^
   fs/xfs/libxfs/xfs_defer.c:473:6: note: Assuming field 'finish_cleanup' i=
s null
           if (ops->finish_cleanup)
               ^~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_defer.c:473:2: note: Taking false branch
           if (ops->finish_cleanup)
           ^
   fs/xfs/libxfs/xfs_defer.c:475:2: note: Undefined or garbage value return=
ed to caller
           return error;
           ^      ~~~~~
   Suppressed 8 warnings (8 in non-user code).
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
   fs/jfs/jfs_types.h:61:33: warning: The left operand of '&' is a garbage =
value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           pxd->len_addr =3D (pxd->len_addr & cpu_to_le32(~0xffffff)) |
                                          ^
   fs/jfs/inode.c:211:6: note: Assuming 'create' is not equal to 0
           if (create)
               ^~~~~~
   fs/jfs/inode.c:211:2: note: Taking true branch
           if (create)
           ^
   fs/jfs/inode.c:216:7: note: Assuming the condition is true
           if (((lblock64 << ip->i_sb->s_blocksize_bits) < ip->i_size) &&
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/jfs/inode.c:216:6: note: Left side of '&&' is true
           if (((lblock64 << ip->i_sb->s_blocksize_bits) < ip->i_size) &&
               ^
   fs/jfs/inode.c:217:7: note: Assuming the condition is true
               (!xtLookup(ip, lblock64, xlen, &xflag, &xaddr, &xlen, 0)) &&
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/jfs/inode.c:216:6: note: Left side of '&&' is true
           if (((lblock64 << ip->i_sb->s_blocksize_bits) < ip->i_size) &&
               ^
   fs/jfs/inode.c:218:6: note: Assuming 'xaddr' is not equal to 0
               xaddr) {
               ^~~~~
   fs/jfs/inode.c:216:2: note: Taking true branch
           if (((lblock64 << ip->i_sb->s_blocksize_bits) < ip->i_size) &&
           ^
   fs/jfs/inode.c:219:7: note: Assuming the condition is true
                   if (xflag & XAD_NOTRECORDED) {
                       ^~~~~~~~~~~~~~~~~~~~~~~
   fs/jfs/inode.c:219:3: note: Taking true branch
                   if (xflag & XAD_NOTRECORDED) {
                   ^
   fs/jfs/inode.c:220:9: note: 'create' is not equal to 0
                           if (!create)
                                ^~~~~~
   fs/jfs/inode.c:220:4: note: Taking false branch
                           if (!create)
                           ^
   fs/jfs/inode.c:228:4: note: Calling 'PXDlength'
                           XADlength(&xad, xlen);
                           ^
   fs/jfs/jfs_xtree.h:38:34: note: expanded from macro 'XADlength'
   #define XADlength(xad, length32) PXDlength(&(xad)->loc, length32)
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/jfs/jfs_types.h:61:33: note: The left operand of '&' is a garbage val=
ue
           pxd->len_addr =3D (pxd->len_addr & cpu_to_le32(~0xffffff)) |
                            ~~~~~~~~~~~~~ ^
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
>> drivers/iio/test/iio-test-rescale.c:578:2: warning: Call to function 'st=
rcpy' is insecure as it does not provide bounding of the memory buffer. Rep=
lace unbounded copy functions with analogous functions that support length =
arguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.s=
trcpy]
           strcpy(desc, t->name);
           ^~~~~~
   drivers/iio/test/iio-test-rescale.c:578:2: note: Call to function 'strcp=
y' is insecure as it does not provide bounding of the memory buffer. Replac=
e unbounded copy functions with analogous functions that support length arg=
uments such as 'strlcpy'. CWE-119
           strcpy(desc, t->name);
           ^~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   drivers/perf/arm-cmn.c:1252:25: warning: Value stored to 'nid' during it=
s initialization is never read [clang-analyzer-deadcode.DeadStores]
                   struct arm_cmn_nodeid nid =3D arm_cmn_nid(cmn, nodeid);
                                         ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/perf/arm-cmn.c:1252:25: note: Value stored to 'nid' during its i=
nitialization is never read
                   struct arm_cmn_nodeid nid =3D arm_cmn_nid(cmn, nodeid);
                                         ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/perf/arm-cmn.c:1635:3: warning: Value stored to 'level' is never=
 read [clang-analyzer-deadcode.DeadStores]
                   level =3D 0;
                   ^       ~
   drivers/perf/arm-cmn.c:1635:3: note: Value stored to 'level' is never re=
ad
                   level =3D 0;
                   ^       ~
   drivers/perf/arm-cmn.c:1637:3: warning: Value stored to 'level' is never=
 read [clang-analyzer-deadcode.DeadStores]
                   level =3D 1;
                   ^       ~
   drivers/perf/arm-cmn.c:1637:3: note: Value stored to 'level' is never re=
ad
                   level =3D 1;
                   ^       ~
   drivers/perf/arm-cmn.c:1639:3: warning: Value stored to 'level' is never=
 read [clang-analyzer-deadcode.DeadStores]
                   level =3D 2;
                   ^       ~
   drivers/perf/arm-cmn.c:1639:3: note: Value stored to 'level' is never re=
ad
                   level =3D 2;
                   ^       ~
   drivers/perf/arm-cmn.c:1823:29: warning: Division by zero [clang-analyze=
r-core.DivideZero]
           cmn->mesh_y =3D cmn->num_xps / cmn->mesh_x;
                         ~~~~~~~~~~~~~^~~~~~~~~~~~~
   drivers/perf/arm-cmn.c:1657:2: note: Calling 'arm_cmn_init_node_info'
           arm_cmn_init_node_info(cmn, rgn_offset, &cfg);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/perf/arm-cmn.c:1628:15: note: Taking false branch
           node->type =3D FIELD_GET(CMN_NI_NODE_TYPE, reg);
                        ^
   include/linux/bitfield.h:125:3: note: expanded from macro 'FIELD_GET'
                   __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
                   ^
   include/linux/bitfield.h:62:3: note: expanded from macro '__BF_FIELD_CHE=
CK'
                   BUILD_BUG_ON_MSG(!__builtin_constant_p(_mask),          \
                   ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:346:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:334:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:326:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/perf/arm-cmn.c:1628:15: note: Loop condition is false.  Exiting =
loop
           node->type =3D FIELD_GET(CMN_NI_NODE_TYPE, reg);
                        ^
   include/linux/bitfield.h:125:3: note: expanded from macro 'FIELD_GET'
                   __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
                   ^
   include/linux/bitfield.h:62:3: note: expanded from macro '__BF_FIELD_CHE=
CK'
                   BUILD_BUG_ON_MSG(!__builtin_constant_p(_mask),          \
                   ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:346:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:334:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:318:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/perf/arm-cmn.c:1628:15: note: Taking false branch
           node->type =3D FIELD_GET(CMN_NI_NODE_TYPE, reg);
                        ^
   include/linux/bitfield.h:125:3: note: expanded from macro 'FIELD_GET'
                   __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
                   ^
   include/linux/bitfield.h:64:3: note: expanded from macro '__BF_FIELD_CHE=
CK'
                   BUILD_BUG_ON_MSG((_mask) =3D=3D 0, _pfx "mask is zero");=
    \

vim +578 drivers/iio/test/iio-test-rescale.c

8e74a48d17d509 Liam Beguin 2022-02-12  575  =

8e74a48d17d509 Liam Beguin 2022-02-12  576  static void case_to_desc(const =
struct rescale_tc_data *t, char *desc)
8e74a48d17d509 Liam Beguin 2022-02-12  577  {
8e74a48d17d509 Liam Beguin 2022-02-12 @578  	strcpy(desc, t->name);
8e74a48d17d509 Liam Beguin 2022-02-12  579  }
8e74a48d17d509 Liam Beguin 2022-02-12  580  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8584825166146049211==--

