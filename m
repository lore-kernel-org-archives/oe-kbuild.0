Content-Type: multipart/mixed; boundary="===============2093472336311508805=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 12673/13576] drivers/media/platform/st/sti/delta/delta-v4l2.c:63:20: warning: Value stored to 'delta' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Sat, 19 Mar 2022 09:45:16 +0800
Message-ID: <202203190939.8pgGRBFO-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2093472336311508805==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media(a)vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   6d72dda014a4753974eb08950089ddf71fec4f60
commit: 05dba31552682f0e0ff5fea48c99133068549737 [12673/13576] media: platf=
orm: place stm32/ and sti/ under st/ dir
:::::: branch date: 17 hours ago
:::::: commit date: 2 days ago
config: riscv-randconfig-c006-20220317 (https://download.01.org/0day-ci/arc=
hive/20220319/202203190939.8pgGRBFO-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a6ec1e=
3d798f8eab43fb3a91028c6ab04e115fcb)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3D05dba31552682f0e0ff5fea48c99133068549737
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 05dba31552682f0e0ff5fea48c99133068549737
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
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
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   drivers/mfd/tps65010.c:650:5: warning: Value stored to 'status' is never=
 read [clang-analyzer-deadcode.DeadStores]
                                   status =3D 0;
                                   ^        ~
   drivers/mfd/tps65010.c:650:5: note: Value stored to 'status' is never re=
ad
                                   status =3D 0;
                                   ^        ~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   drivers/media/platform/samsung/s5p-mfc/s5p_mfc_opr_v5.c:600:3: warning: =
Value stored to 'buf_addr2' is never read [clang-analyzer-deadcode.DeadStor=
es]
                   buf_addr2 +=3D S5P_FIMV_ENC_INTRAPRED_SIZE;
                   ^
   drivers/media/platform/samsung/s5p-mfc/s5p_mfc_opr_v5.c:600:3: note: Val=
ue stored to 'buf_addr2' is never read
   drivers/media/platform/samsung/s5p-mfc/s5p_mfc_opr_v5.c:604:3: warning: =
Value stored to 'buf_addr1' is never read [clang-analyzer-deadcode.DeadStor=
es]
                   buf_addr1 +=3D S5P_FIMV_ENC_NBORINFO_SIZE;
                   ^
   drivers/media/platform/samsung/s5p-mfc/s5p_mfc_opr_v5.c:604:3: note: Val=
ue stored to 'buf_addr1' is never read
   drivers/media/platform/samsung/s5p-mfc/s5p_mfc_opr_v5.c:635:3: warning: =
Value stored to 'buf_addr1' is never read [clang-analyzer-deadcode.DeadStor=
es]
                   buf_addr1 +=3D S5P_FIMV_ENC_ACDCCOEF_SIZE;
                   ^
   drivers/media/platform/samsung/s5p-mfc/s5p_mfc_opr_v5.c:635:3: note: Val=
ue stored to 'buf_addr1' is never read
   drivers/media/platform/samsung/s5p-mfc/s5p_mfc_opr_v5.c:661:3: warning: =
Value stored to 'buf_addr1' is never read [clang-analyzer-deadcode.DeadStor=
es]
                   buf_addr1 +=3D S5P_FIMV_ENC_ACDCCOEF_SIZE;
                   ^
   drivers/media/platform/samsung/s5p-mfc/s5p_mfc_opr_v5.c:661:3: note: Val=
ue stored to 'buf_addr1' is never read
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
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   27 warnings generated.
>> drivers/media/platform/st/sti/delta/delta-v4l2.c:63:20: warning: Value s=
tored to 'delta' during its initialization is never read [clang-analyzer-de=
adcode.DeadStores]
           struct delta_dev *delta =3D ctx->dev;
                             ^~~~~   ~~~~~~~~
   drivers/media/platform/st/sti/delta/delta-v4l2.c:63:20: note: Value stor=
ed to 'delta' during its initialization is never read
           struct delta_dev *delta =3D ctx->dev;
                             ^~~~~   ~~~~~~~~
>> drivers/media/platform/st/sti/delta/delta-v4l2.c:65:6: warning: Value st=
ored to 'data' during its initialization is never read [clang-analyzer-dead=
code.DeadStores]
           u8 *data =3D (u8 *)(au->vaddr);
               ^~~~   ~~~~~~~~~~~~~~~~~
   drivers/media/platform/st/sti/delta/delta-v4l2.c:65:6: note: Value store=
d to 'data' during its initialization is never read
           u8 *data =3D (u8 *)(au->vaddr);
               ^~~~   ~~~~~~~~~~~~~~~~~
   drivers/media/platform/st/sti/delta/delta-v4l2.c:79:20: warning: Value s=
tored to 'delta' during its initialization is never read [clang-analyzer-de=
adcode.DeadStores]
           struct delta_dev *delta =3D ctx->dev;
                             ^~~~~   ~~~~~~~~
   drivers/media/platform/st/sti/delta/delta-v4l2.c:79:20: note: Value stor=
ed to 'delta' during its initialization is never read
           struct delta_dev *delta =3D ctx->dev;
                             ^~~~~   ~~~~~~~~
   drivers/media/platform/st/sti/delta/delta-v4l2.c:81:6: warning: Value st=
ored to 'data' during its initialization is never read [clang-analyzer-dead=
code.DeadStores]
           u8 *data =3D (u8 *)(frame->vaddr);
               ^~~~   ~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/st/sti/delta/delta-v4l2.c:81:6: note: Value store=
d to 'data' during its initialization is never read
           u8 *data =3D (u8 *)(frame->vaddr);
               ^~~~   ~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/st/sti/delta/delta-v4l2.c:428:20: warning: Value =
stored to 'delta' during its initialization is never read [clang-analyzer-d=
eadcode.DeadStores]
           struct delta_dev *delta =3D ctx->dev;
                             ^~~~~   ~~~~~~~~
   drivers/media/platform/st/sti/delta/delta-v4l2.c:428:20: note: Value sto=
red to 'delta' during its initialization is never read
           struct delta_dev *delta =3D ctx->dev;
                             ^~~~~   ~~~~~~~~
>> drivers/media/platform/st/sti/delta/delta-v4l2.c:431:16: warning: Value =
stored to 'str' during its initialization is never read [clang-analyzer-dea=
dcode.DeadStores]
           unsigned char str[100] =3D "";
                         ^~~        ~~
   drivers/media/platform/st/sti/delta/delta-v4l2.c:431:16: note: Value sto=
red to 'str' during its initialization is never read
           unsigned char str[100] =3D "";
                         ^~~        ~~
   drivers/media/platform/st/sti/delta/delta-v4l2.c:456:20: warning: Value =
stored to 'delta' during its initialization is never read [clang-analyzer-d=
eadcode.DeadStores]
           struct delta_dev *delta =3D ctx->dev;
                             ^~~~~   ~~~~~~~~
   drivers/media/platform/st/sti/delta/delta-v4l2.c:456:20: note: Value sto=
red to 'delta' during its initialization is never read
           struct delta_dev *delta =3D ctx->dev;
                             ^~~~~   ~~~~~~~~
   drivers/media/platform/st/sti/delta/delta-v4l2.c:460:16: warning: Value =
stored to 'str' during its initialization is never read [clang-analyzer-dea=
dcode.DeadStores]
           unsigned char str[100] =3D "";
                         ^~~        ~~
   drivers/media/platform/st/sti/delta/delta-v4l2.c:460:16: note: Value sto=
red to 'str' during its initialization is never read
           unsigned char str[100] =3D "";
                         ^~~        ~~
   drivers/media/platform/st/sti/delta/delta-v4l2.c:495:20: warning: Value =
stored to 'delta' during its initialization is never read [clang-analyzer-d=
eadcode.DeadStores]
           struct delta_dev *delta =3D ctx->dev;
                             ^~~~~   ~~~~~~~~
   drivers/media/platform/st/sti/delta/delta-v4l2.c:495:20: note: Value sto=
red to 'delta' during its initialization is never read
           struct delta_dev *delta =3D ctx->dev;
                             ^~~~~   ~~~~~~~~
   drivers/media/platform/st/sti/delta/delta-v4l2.c:549:20: warning: Value =
stored to 'delta' during its initialization is never read [clang-analyzer-d=
eadcode.DeadStores]
           struct delta_dev *delta =3D ctx->dev;
                             ^~~~~   ~~~~~~~~
   drivers/media/platform/st/sti/delta/delta-v4l2.c:549:20: note: Value sto=
red to 'delta' during its initialization is never read
           struct delta_dev *delta =3D ctx->dev;
                             ^~~~~   ~~~~~~~~
   drivers/media/platform/st/sti/delta/delta-v4l2.c:609:20: warning: Value =
stored to 'delta' during its initialization is never read [clang-analyzer-d=
eadcode.DeadStores]
           struct delta_dev *delta =3D ctx->dev;
                             ^~~~~   ~~~~~~~~
   drivers/media/platform/st/sti/delta/delta-v4l2.c:609:20: note: Value sto=
red to 'delta' during its initialization is never read
           struct delta_dev *delta =3D ctx->dev;
                             ^~~~~   ~~~~~~~~
   drivers/media/platform/st/sti/delta/delta-v4l2.c:645:20: warning: Value =
stored to 'delta' during its initialization is never read [clang-analyzer-d=
eadcode.DeadStores]
           struct delta_dev *delta =3D ctx->dev;
                             ^~~~~   ~~~~~~~~
   drivers/media/platform/st/sti/delta/delta-v4l2.c:645:20: note: Value sto=
red to 'delta' during its initialization is never read
           struct delta_dev *delta =3D ctx->dev;
                             ^~~~~   ~~~~~~~~
   drivers/media/platform/st/sti/delta/delta-v4l2.c:649:16: warning: Value =
stored to 'str' during its initialization is never read [clang-analyzer-dea=
dcode.DeadStores]
           unsigned char str[100] =3D "";
                         ^~~        ~~
   drivers/media/platform/st/sti/delta/delta-v4l2.c:649:16: note: Value sto=
red to 'str' during its initialization is never read
           unsigned char str[100] =3D "";
                         ^~~        ~~
   drivers/media/platform/st/sti/delta/delta-v4l2.c:766:20: warning: Value =
stored to 'delta' during its initialization is never read [clang-analyzer-d=
eadcode.DeadStores]
           struct delta_dev *delta =3D ctx->dev;
                             ^~~~~   ~~~~~~~~
   drivers/media/platform/st/sti/delta/delta-v4l2.c:766:20: note: Value sto=
red to 'delta' during its initialization is never read
           struct delta_dev *delta =3D ctx->dev;
                             ^~~~~   ~~~~~~~~
   drivers/media/platform/st/sti/delta/delta-v4l2.c:809:20: warning: Value =
stored to 'delta' during its initialization is never read [clang-analyzer-d=
eadcode.DeadStores]
           struct delta_dev *delta =3D ctx->dev;
                             ^~~~~   ~~~~~~~~
   drivers/media/platform/st/sti/delta/delta-v4l2.c:809:20: note: Value sto=
red to 'delta' during its initialization is never read
           struct delta_dev *delta =3D ctx->dev;
                             ^~~~~   ~~~~~~~~
   drivers/media/platform/st/sti/delta/delta-v4l2.c:1045:20: warning: Value=
 stored to 'delta' during its initialization is never read [clang-analyzer-=
deadcode.DeadStores]
           struct delta_dev *delta =3D ctx->dev;
                             ^~~~~   ~~~~~~~~
   drivers/media/platform/st/sti/delta/delta-v4l2.c:1045:20: note: Value st=
ored to 'delta' during its initialization is never read
           struct delta_dev *delta =3D ctx->dev;
                             ^~~~~   ~~~~~~~~
   drivers/media/platform/st/sti/delta/delta-v4l2.c:1055:20: warning: Value=
 stored to 'delta' during its initialization is never read [clang-analyzer-=
deadcode.DeadStores]
           struct delta_dev *delta =3D ctx->dev;
                             ^~~~~   ~~~~~~~~
   drivers/media/platform/st/sti/delta/delta-v4l2.c:1055:20: note: Value st=
ored to 'delta' during its initialization is never read
           struct delta_dev *delta =3D ctx->dev;
                             ^~~~~   ~~~~~~~~
   drivers/media/platform/st/sti/delta/delta-v4l2.c:1118:20: warning: Value=
 stored to 'delta' during its initialization is never read [clang-analyzer-=
deadcode.DeadStores]
           struct delta_dev *delta =3D ctx->dev;
                             ^~~~~   ~~~~~~~~
   drivers/media/platform/st/sti/delta/delta-v4l2.c:1118:20: note: Value st=
ored to 'delta' during its initialization is never read
           struct delta_dev *delta =3D ctx->dev;
                             ^~~~~   ~~~~~~~~
>> drivers/media/platform/st/sti/delta/delta-v4l2.c:1314:16: warning: Value=
 stored to 'str1' during its initialization is never read [clang-analyzer-d=
eadcode.DeadStores]
           unsigned char str1[100] =3D "";
                         ^~~~        ~~
   drivers/media/platform/st/sti/delta/delta-v4l2.c:1314:16: note: Value st=
ored to 'str1' during its initialization is never read
           unsigned char str1[100] =3D "";
                         ^~~~        ~~
>> drivers/media/platform/st/sti/delta/delta-v4l2.c:1315:16: warning: Value=
 stored to 'str2' during its initialization is never read [clang-analyzer-d=
eadcode.DeadStores]
           unsigned char str2[100] =3D "";
                         ^~~~        ~~
   drivers/media/platform/st/sti/delta/delta-v4l2.c:1315:16: note: Value st=
ored to 'str2' during its initialization is never read
           unsigned char str2[100] =3D "";
                         ^~~~        ~~
   drivers/media/platform/st/sti/delta/delta-v4l2.c:1420:20: warning: Value=
 stored to 'delta' during its initialization is never read [clang-analyzer-=
deadcode.DeadStores]
           struct delta_dev *delta =3D ctx->dev;
                             ^~~~~   ~~~~~~~~
   drivers/media/platform/st/sti/delta/delta-v4l2.c:1420:20: note: Value st=
ored to 'delta' during its initialization is never read
           struct delta_dev *delta =3D ctx->dev;
                             ^~~~~   ~~~~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   fs/btrfs/extent-tree.c:1124:13: warning: Dereference of null pointer (lo=
aded from variable 'last_ref') [clang-analyzer-core.NullDereference]
                   *last_ref =3D 1;
                             ^
   fs/btrfs/extent-tree.c:1469:6: note: Assuming 'path' is non-null
           if (!path)
               ^~~~~
   fs/btrfs/extent-tree.c:1469:2: note: Taking false branch
           if (!path)
           ^
   fs/btrfs/extent-tree.c:1473:8: note: Calling 'insert_inline_extent_backr=
ef'
           ret =3D insert_inline_extent_backref(trans, path, bytenr, num_by=
tes,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   fs/btrfs/extent-tree.c:1152:6: note: Assuming 'ret' is equal to 0
           if (ret =3D=3D 0) {
               ^~~~~~~~
   fs/btrfs/extent-tree.c:1152:2: note: Taking true branch
           if (ret =3D=3D 0) {
           ^
   fs/btrfs/extent-tree.c:1157:7: note: Assuming 'owner' is >=3D BTRFS_FIRS=
T_FREE_OBJECTID
                   if (owner < BTRFS_FIRST_FREE_OBJECTID) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/extent-tree.c:1157:3: note: Taking false branch
                   if (owner < BTRFS_FIRST_FREE_OBJECTID) {
                   ^
   fs/btrfs/extent-tree.c:1170:22: note: Passing null pointer value via 5th=
 parameter 'last_ref'
                                                extent_op, NULL);
                                                           ^
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
   #define NULL ((void *)0)
                ^~~~~~~~~~~
   fs/btrfs/extent-tree.c:1169:3: note: Calling 'update_inline_extent_backr=
ef'
                   update_inline_extent_backref(path, iref, refs_to_add,
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/extent-tree.c:1091:10: note: Assuming 'refs_to_mod' is < 0
           WARN_ON(refs_to_mod < 0 && refs + refs_to_mod <=3D 0);
                   ^
   include/asm-generic/bug.h:121:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   fs/btrfs/extent-tree.c:1091:10: note: Left side of '&&' is true
           WARN_ON(refs_to_mod < 0 && refs + refs_to_mod <=3D 0);
                   ^
   fs/btrfs/extent-tree.c:1091:29: note: Assuming the condition is false
           WARN_ON(refs_to_mod < 0 && refs + refs_to_mod <=3D 0);
                                      ^
   include/asm-generic/bug.h:121:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   fs/btrfs/extent-tree.c:1091:2: note: Taking false branch
           WARN_ON(refs_to_mod < 0 && refs + refs_to_mod <=3D 0);
           ^
   include/asm-generic/bug.h:122:2: note: expanded from macro 'WARN_ON'
           if (unlikely(__ret_warn_on))                                    \
           ^
   fs/btrfs/extent-tree.c:1094:6: note: Assuming 'extent_op' is null
           if (extent_op)
               ^~~~~~~~~
   fs/btrfs/extent-tree.c:1094:2: note: Taking false branch
           if (extent_op)
           ^
   fs/btrfs/extent-tree.c:1102:9: note: Assuming 'type' is not equal to BTR=
FS_REF_TYPE_INVALID
           ASSERT(type !=3D BTRFS_REF_TYPE_INVALID);
                  ^
   fs/btrfs/ctree.h:3483:10: note: expanded from macro 'ASSERT'
           (likely(expr) ? (void)0 : assertfail(#expr, __FILE__, __LINE__))
                   ^~~~
   include/linux/compiler.h:77:40: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                               ^
   fs/btrfs/extent-tree.c:1102:2: note: '?' condition is true
           ASSERT(type !=3D BTRFS_REF_TYPE_INVALID);
           ^
   fs/btrfs/ctree.h:3483:3: note: expanded from macro 'ASSERT'
           (likely(expr) ? (void)0 : assertfail(#expr, __FILE__, __LINE__))
            ^
   include/linux/compiler.h:77:20: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                           ^
   fs/btrfs/extent-tree.c:1104:6: note: Assuming 'type' is not equal to BTR=
FS_EXTENT_DATA_REF_KEY
           if (type =3D=3D BTRFS_EXTENT_DATA_REF_KEY) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/extent-tree.c:1104:2: note: Taking false branch
           if (type =3D=3D BTRFS_EXTENT_DATA_REF_KEY) {
           ^
   fs/btrfs/extent-tree.c:1107:13: note: Assuming 'type' is not equal to BT=
RFS_SHARED_DATA_REF_KEY
           } else if (type =3D=3D BTRFS_SHARED_DATA_REF_KEY) {
--
   include/linux/compiler_types.h:326:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   fs/ext4/mballoc.c:5247:2: note: Loop condition is false.  Exiting loop
           list_for_each_entry_rcu(pa, &lg->lg_prealloc_list[order],
           ^
   include/linux/rculist.h:391:13: note: expanded from macro 'list_for_each=
_entry_rcu'
                pos =3D list_entry_rcu((head)->next, typeof(*pos), member);=
  \
                      ^
   include/linux/rculist.h:307:15: note: expanded from macro 'list_entry_rc=
u'
           container_of(READ_ONCE(ptr), type, member)
                        ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
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
   fs/ext4/mballoc.c:5247:2: note: Loop condition is false. Execution conti=
nues on line 5285
           list_for_each_entry_rcu(pa, &lg->lg_prealloc_list[order],
           ^
   include/linux/rculist.h:390:2: note: expanded from macro 'list_for_each_=
entry_rcu'
           for (__list_check_rcu(dummy, ## cond, 0),                       \
           ^
   fs/ext4/mballoc.c:5287:2: note: Assigned value is garbage or undefined
           list_for_each_entry_safe(pa, tmp, &discard_list, u.pa_tmp_list) {
           ^
   include/linux/list.h:726:7: note: expanded from macro 'list_for_each_ent=
ry_safe'
                   n =3D list_next_entry(pos, member);                     =
  \
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:564:2: note: expanded from macro 'list_next_entry'
           list_entry((pos)->member.next, typeof(*(pos)), member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:520:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:18:2: note: expanded from macro 'container_=
of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
           ^              ~~~~~~~~~~~~~
   fs/ext4/mballoc.c:5813:3: warning: Value stored to 'err' is never read [=
clang-analyzer-deadcode.DeadStores]
                   err =3D PTR_ERR(bitmap_bh);
                   ^     ~~~~~~~~~~~~~~~~~~
   fs/ext4/mballoc.c:5813:3: note: Value stored to 'err' is never read
                   err =3D PTR_ERR(bitmap_bh);
                   ^     ~~~~~~~~~~~~~~~~~~
   fs/ext4/mballoc.c:6299:9: warning: Assigned value is garbage or undefine=
d [clang-analyzer-core.uninitialized.Assign]
           bitmap =3D e4b->bd_bitmap;
                  ^
   fs/ext4/mballoc.c:3348:2: note: Loop condition is true.  Entering loop b=
ody
           list_for_each_entry_safe(fd, nfd, &discard_list, efd_list) {
           ^
   include/linux/list.h:725:2: note: expanded from macro 'list_for_each_ent=
ry_safe'
           for (pos =3D list_first_entry(head, typeof(*pos), member),      =
  \
           ^
   fs/ext4/mballoc.c:3353:8: note: Assuming the condition is true
                   if ((sb->s_flags & SB_ACTIVE) && !err &&
                        ^~~~~~~~~~~~~~~~~~~~~~~
   fs/ext4/mballoc.c:3353:7: note: Left side of '&&' is true
                   if ((sb->s_flags & SB_ACTIVE) && !err &&
                       ^
   fs/ext4/mballoc.c:3353:37: note: 'err' is 0
                   if ((sb->s_flags & SB_ACTIVE) && !err &&
                                                     ^~~
   fs/ext4/mballoc.c:3353:7: note: Left side of '&&' is true
                   if ((sb->s_flags & SB_ACTIVE) && !err &&
                       ^
   fs/ext4/mballoc.c:3354:7: note: Assuming the condition is true
                       !atomic_read(&sbi->s_retry_alloc_pending)) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ext4/mballoc.c:3353:3: note: Taking true branch
                   if ((sb->s_flags & SB_ACTIVE) && !err &&
                   ^
   fs/ext4/mballoc.c:3356:8: note: Assuming 'grp' is equal to 'load_grp'
                           if (grp !=3D load_grp) {
                               ^~~~~~~~~~~~~~~
   fs/ext4/mballoc.c:3356:4: note: Taking false branch
                           if (grp !=3D load_grp) {
                           ^
   fs/ext4/mballoc.c:3371:4: note: Calling 'ext4_try_to_trim_range'
                           ext4_try_to_trim_range(sb, &e4b, fd->efd_start_c=
luster,
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   fs/ext4/mballoc.c:6299:9: note: Assigned value is garbage or undefined
           bitmap =3D e4b->bd_bitmap;
                  ^ ~~~~~~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
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
   9 warnings generated.
>> drivers/media/platform/st/sti/delta/delta-debug.c:57:20: warning: Value =
stored to 'delta' during its initialization is never read [clang-analyzer-d=
eadcode.DeadStores]
           struct delta_dev *delta =3D ctx->dev;
                             ^~~~~   ~~~~~~~~
   drivers/media/platform/st/sti/delta/delta-debug.c:57:20: note: Value sto=
red to 'delta' during its initialization is never read
           struct delta_dev *delta =3D ctx->dev;
                             ^~~~~   ~~~~~~~~
>> drivers/media/platform/st/sti/delta/delta-debug.c:58:27: warning: Value =
stored to 's' during its initialization is never read [clang-analyzer-deadc=
ode.DeadStores]
           struct delta_streaminfo *s =3D &ctx->streaminfo;
                                    ^   ~~~~~~~~~~~~~~~~
   drivers/media/platform/st/sti/delta/delta-debug.c:58:27: note: Value sto=
red to 's' during its initialization is never read
           struct delta_streaminfo *s =3D &ctx->streaminfo;
                                    ^   ~~~~~~~~~~~~~~~~
>> drivers/media/platform/st/sti/delta/delta-debug.c:59:16: warning: Value =
stored to 'str' during its initialization is never read [clang-analyzer-dea=
dcode.DeadStores]
           unsigned char str[100] =3D "";
                         ^~~        ~~
   drivers/media/platform/st/sti/delta/delta-debug.c:59:16: note: Value sto=
red to 'str' during its initialization is never read
           unsigned char str[100] =3D "";
                         ^~~        ~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
>> drivers/media/platform/st/sti/delta/delta-mjpeg-dec.c:41:2: warning: Val=
ue stored to 'b' is never read [clang-analyzer-deadcode.DeadStores]
           b +=3D snprintf(b, len,
           ^    ~~~~~~~~~~~~~~~~
   drivers/media/platform/st/sti/delta/delta-mjpeg-dec.c:41:2: note: Value =
stored to 'b' is never read
           b +=3D snprintf(b, len,
           ^    ~~~~~~~~~~~~~~~~
   drivers/media/platform/st/sti/delta/delta-mjpeg-dec.c:59:2: warning: Val=
ue stored to 'b' is never read [clang-analyzer-deadcode.DeadStores]
           b +=3D snprintf(b, len,
           ^    ~~~~~~~~~~~~~~~~
   drivers/media/platform/st/sti/delta/delta-mjpeg-dec.c:59:2: note: Value =
stored to 'b' is never read
           b +=3D snprintf(b, len,
           ^    ~~~~~~~~~~~~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   21 warnings generated.
>> drivers/media/platform/st/sti/hva/hva-v4l2.c:230:17: warning: Value stor=
ed to 'dev' during its initialization is never read [clang-analyzer-deadcod=
e.DeadStores]
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/st/sti/hva/hva-v4l2.c:230:17: note: Value stored =
to 'dev' during its initialization is never read
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
>> drivers/media/platform/st/sti/hva/hva-v4l2.c:231:25: warning: Value stor=
ed to 'stream' during its initialization is never read [clang-analyzer-dead=
code.DeadStores]
           struct hva_streaminfo *stream =3D &ctx->streaminfo;
                                  ^~~~~~   ~~~~~~~~~~~~~~~~
   drivers/media/platform/st/sti/hva/hva-v4l2.c:231:25: note: Value stored =
to 'stream' during its initialization is never read
           struct hva_streaminfo *stream =3D &ctx->streaminfo;
                                  ^~~~~~   ~~~~~~~~~~~~~~~~
>> drivers/media/platform/st/sti/hva/hva-v4l2.c:232:24: warning: Value stor=
ed to 'frame' during its initialization is never read [clang-analyzer-deadc=
ode.DeadStores]
           struct hva_frameinfo *frame =3D &ctx->frameinfo;
                                 ^~~~~   ~~~~~~~~~~~~~~~
   drivers/media/platform/st/sti/hva/hva-v4l2.c:232:24: note: Value stored =
to 'frame' during its initialization is never read
           struct hva_frameinfo *frame =3D &ctx->frameinfo;
                                 ^~~~~   ~~~~~~~~~~~~~~~
   drivers/media/platform/st/sti/hva/hva-v4l2.c:339:17: warning: Value stor=
ed to 'dev' during its initialization is never read [clang-analyzer-deadcod=
e.DeadStores]
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/st/sti/hva/hva-v4l2.c:339:17: note: Value stored =
to 'dev' during its initialization is never read
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/st/sti/hva/hva-v4l2.c:403:17: warning: Value stor=
ed to 'dev' during its initialization is never read [clang-analyzer-deadcod=
e.DeadStores]
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/st/sti/hva/hva-v4l2.c:403:17: note: Value stored =
to 'dev' during its initialization is never read
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/st/sti/hva/hva-v4l2.c:453:17: warning: Value stor=
ed to 'dev' during its initialization is never read [clang-analyzer-deadcod=
e.DeadStores]
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/st/sti/hva/hva-v4l2.c:453:17: note: Value stored =
to 'dev' during its initialization is never read
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/st/sti/hva/hva-v4l2.c:483:17: warning: Value stor=
ed to 'dev' during its initialization is never read [clang-analyzer-deadcod=
e.DeadStores]
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/st/sti/hva/hva-v4l2.c:483:17: note: Value stored =
to 'dev' during its initialization is never read
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/st/sti/hva/hva-v4l2.c:557:17: warning: Value stor=
ed to 'dev' during its initialization is never read [clang-analyzer-deadcod=
e.DeadStores]
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/st/sti/hva/hva-v4l2.c:557:17: note: Value stored =
to 'dev' during its initialization is never read
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/st/sti/hva/hva-v4l2.c:620:17: warning: Value stor=
ed to 'dev' during its initialization is never read [clang-analyzer-deadcod=
e.DeadStores]
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/st/sti/hva/hva-v4l2.c:620:17: note: Value stored =
to 'dev' during its initialization is never read
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/st/sti/hva/hva-v4l2.c:695:17: warning: Value stor=
ed to 'dev' during its initialization is never read [clang-analyzer-deadcod=
e.DeadStores]
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/st/sti/hva/hva-v4l2.c:695:17: note: Value stored =
to 'dev' during its initialization is never read
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/st/sti/hva/hva-v4l2.c:866:17: warning: Value stor=
ed to 'dev' during its initialization is never read [clang-analyzer-deadcod=
e.DeadStores]
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/st/sti/hva/hva-v4l2.c:866:17: note: Value stored =
to 'dev' during its initialization is never read
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/st/sti/hva/hva-v4l2.c:876:17: warning: Value stor=
ed to 'dev' during its initialization is never read [clang-analyzer-deadcod=
e.DeadStores]
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/st/sti/hva/hva-v4l2.c:876:17: note: Value stored =
to 'dev' during its initialization is never read
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/st/sti/hva/hva-v4l2.c:914:17: warning: Value stor=
ed to 'dev' during its initialization is never read [clang-analyzer-deadcod=
e.DeadStores]
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/st/sti/hva/hva-v4l2.c:914:17: note: Value stored =
to 'dev' during its initialization is never read
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/st/sti/hva/hva-v4l2.c:936:17: warning: Value stor=
ed to 'dev' during its initialization is never read [clang-analyzer-deadcod=
e.DeadStores]
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/st/sti/hva/hva-v4l2.c:936:17: note: Value stored =
to 'dev' during its initialization is never read
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/st/sti/hva/hva-v4l2.c:1069:17: warning: Value sto=
red to 'dev' during its initialization is never read [clang-analyzer-deadco=
de.DeadStores]
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/st/sti/hva/hva-v4l2.c:1069:17: note: Value stored=
 to 'dev' during its initialization is never read
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
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
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
--
                       ^
   include/uapi/linux/byteorder/little_endian.h:43:26: note: expanded from =
macro '__be16_to_cpu'
   #define __be16_to_cpu(x) __swab16((__force __u16)(__be16)(x))
                            ^
   include/uapi/linux/swab.h:105:2: note: expanded from macro '__swab16'
           (__builtin_constant_p((__u16)(x)) ?     \
           ^
   fs/xfs/libxfs/xfs_dir2_data.c:193:4: note: Taking false branch
                           if (be16_to_cpu(*xfs_dir2_data_unused_tag_p(dup)=
) !=3D
                           ^
   fs/xfs/libxfs/xfs_dir2_data.c:197:8: note: Assuming 'fa' is null
                           if (fa)
                               ^~
   fs/xfs/libxfs/xfs_dir2_data.c:197:4: note: Taking false branch
                           if (fa)
                           ^
   fs/xfs/libxfs/xfs_dir2_data.c:199:8: note: Assuming 'dfp' is non-null
                           if (dfp) {
                               ^~~
   fs/xfs/libxfs/xfs_dir2_data.c:199:4: note: Taking true branch
                           if (dfp) {
                           ^
   fs/xfs/libxfs/xfs_dir2_data.c:201:9: note: Assuming the condition is fal=
se
                                   if ((freeseen & (1 << i)) !=3D 0)
                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_dir2_data.c:201:5: note: Taking false branch
                                   if ((freeseen & (1 << i)) !=3D 0)
                                   ^
   fs/xfs/libxfs/xfs_dir2_data.c:209:14: note: '?' condition is false
                           offset +=3D be16_to_cpu(dup->length);
                                     ^
   include/linux/byteorder/generic.h:97:21: note: expanded from macro 'be16=
_to_cpu'
   #define be16_to_cpu __be16_to_cpu
                       ^
   include/uapi/linux/byteorder/little_endian.h:43:26: note: expanded from =
macro '__be16_to_cpu'
   #define __be16_to_cpu(x) __swab16((__force __u16)(__be16)(x))
                            ^
   include/uapi/linux/swab.h:105:3: note: expanded from macro '__swab16'
           (__builtin_constant_p((__u16)(x)) ?     \
            ^
   fs/xfs/libxfs/xfs_dir2_data.c:211:4: note:  Execution continues on line =
177
                           continue;
                           ^
   fs/xfs/libxfs/xfs_dir2_data.c:177:9: note: Assuming 'offset' is >=3D 'en=
d'
           while (offset < end) {
                  ^~~~~~~~~~~~
   fs/xfs/libxfs/xfs_dir2_data.c:177:2: note: Loop condition is false. Exec=
ution continues on line 252
           while (offset < end) {
           ^
   fs/xfs/libxfs/xfs_dir2_data.c:252:6: note: Assuming 'freeseen' is equal =
to 7
           if (freeseen !=3D 7)
               ^~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_dir2_data.c:252:2: note: Taking false branch
           if (freeseen !=3D 7)
           ^
   fs/xfs/libxfs/xfs_dir2_data.c:254:20: note: '?' condition is true
           if (hdr->magic =3D=3D cpu_to_be32(XFS_DIR2_BLOCK_MAGIC) ||
                             ^
   include/linux/byteorder/generic.h:94:21: note: expanded from macro 'cpu_=
to_be32'
   #define cpu_to_be32 __cpu_to_be32
                       ^
   include/uapi/linux/byteorder/little_endian.h:40:43: note: expanded from =
macro '__cpu_to_be32'
   #define __cpu_to_be32(x) ((__force __be32)__swab32((x)))
                                             ^
   include/uapi/linux/swab.h:118:3: note: expanded from macro '__swab32'
           (__builtin_constant_p((__u32)(x)) ?     \
            ^
   fs/xfs/libxfs/xfs_dir2_data.c:254:6: note: Assuming the condition is true
           if (hdr->magic =3D=3D cpu_to_be32(XFS_DIR2_BLOCK_MAGIC) ||
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_dir2_data.c:254:54: note: Left side of '||' is true
           if (hdr->magic =3D=3D cpu_to_be32(XFS_DIR2_BLOCK_MAGIC) ||
                                                               ^
   fs/xfs/libxfs/xfs_dir2_data.c:256:27: note: Access to field 'count' resu=
lts in a dereference of a null pointer (loaded from variable 'btp')
                   for (i =3D stale =3D 0; i < be32_to_cpu(btp->count); i++=
) {
                                           ^
   include/linux/byteorder/generic.h:95:21: note: expanded from macro 'be32=
_to_cpu'
   #define be32_to_cpu __be32_to_cpu
                       ^
   include/uapi/linux/byteorder/little_endian.h:41:58: note: expanded from =
macro '__be32_to_cpu'
   #define __be32_to_cpu(x) __swab32((__force __u32)(__be32)(x))
                                                            ^~
   include/uapi/linux/swab.h:118:32: note: expanded from macro '__swab32'
           (__builtin_constant_p((__u32)(x)) ?     \
                                         ^
   fs/xfs/libxfs/xfs_dir2_data.c:931:4: warning: Value stored to 'dfp' is n=
ever read [clang-analyzer-deadcode.DeadStores]
                           dfp =3D xfs_dir2_data_freeinsert(hdr, bf, prevdu=
p,
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_dir2_data.c:931:4: note: Value stored to 'dfp' is neve=
r read
                           dfp =3D xfs_dir2_data_freeinsert(hdr, bf, prevdu=
p,
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 7 warnings (7 in non-user code).
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
   9 warnings generated.
>> drivers/media/platform/st/sti/hva/hva-h264.c:429:17: warning: Value stor=
ed to 'dev' during its initialization is never read [clang-analyzer-deadcod=
e.DeadStores]
           struct device *dev =3D ctx_to_dev(pctx);
                          ^~~
   drivers/media/platform/st/sti/hva/hva-h264.c:429:17: note: Value stored =
to 'dev' during its initialization is never read
           struct device *dev =3D ctx_to_dev(pctx);
                          ^~~
>> drivers/media/platform/st/sti/hva/hva-h264.c:435:6: warning: Value store=
d to 'idr_pic_id' during its initialization is never read [clang-analyzer-d=
eadcode.DeadStores]
           int idr_pic_id =3D frame_num % 2;
               ^~~~~~~~~~   ~~~~~~~~~~~~~
   drivers/media/platform/st/sti/hva/hva-h264.c:435:6: note: Value stored t=
o 'idr_pic_id' during its initialization is never read
           int idr_pic_id =3D frame_num % 2;
               ^~~~~~~~~~   ~~~~~~~~~~~~~
   drivers/media/platform/st/sti/hva/hva-h264.c:492:17: warning: Value stor=
ed to 'dev' during its initialization is never read [clang-analyzer-deadcod=
e.DeadStores]
           struct device *dev =3D ctx_to_dev(pctx);
                          ^~~
   drivers/media/platform/st/sti/hva/hva-h264.c:492:17: note: Value stored =
to 'dev' during its initialization is never read
           struct device *dev =3D ctx_to_dev(pctx);
                          ^~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   drivers/media/platform/ti-vpe/vpe.c:2589:2: warning: Value stored to 'fu=
nc' is never read [clang-analyzer-deadcode.DeadStores]
           func =3D read_field_reg(dev, VPE_PID, VPE_PID_FUNC_MASK,
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/ti-vpe/vpe.c:2589:2: note: Value stored to 'func'=
 is never read
           func =3D read_field_reg(dev, VPE_PID, VPE_PID_FUNC_MASK,
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/log2.h:57:13: warning: The result of the left shift is und=
efined due to shifting by '32', which is greater or equal to the width of t=
ype 'unsigned long' [clang-analyzer-core.UndefinedBinaryOperatorResult]
           return 1UL << fls_long(n - 1);
                      ^
   drivers/media/platform/ti-vpe/vpe.c:1788:8: note: Calling 'vpe_try_fmt'
           ret =3D vpe_try_fmt(file, priv, f);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/ti-vpe/vpe.c:1725:6: note: Assuming field 'type' =
is not equal to V4L2_BUF_TYPE_VIDEO_OUTPUT
           if (V4L2_TYPE_IS_OUTPUT(f->type))
               ^
   include/uapi/linux/videodev2.h:165:3: note: expanded from macro 'V4L2_TY=
PE_IS_OUTPUT'
           ((type) =3D=3D V4L2_BUF_TYPE_VIDEO_OUTPUT                   \
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/ti-vpe/vpe.c:1725:6: note: Left side of '||' is f=
alse
           if (V4L2_TYPE_IS_OUTPUT(f->type))
               ^
   include/uapi/linux/videodev2.h:165:3: note: expanded from macro 'V4L2_TY=
PE_IS_OUTPUT'
           ((type) =3D=3D V4L2_BUF_TYPE_VIDEO_OUTPUT                   \
            ^
   drivers/media/platform/ti-vpe/vpe.c:1725:6: note: Assuming field 'type' =
is not equal to V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE
           if (V4L2_TYPE_IS_OUTPUT(f->type))
               ^
   include/uapi/linux/videodev2.h:166:6: note: expanded from macro 'V4L2_TY=
PE_IS_OUTPUT'
            || (type) =3D=3D V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE         \
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/ti-vpe/vpe.c:1725:6: note: Left side of '||' is f=
alse
           if (V4L2_TYPE_IS_OUTPUT(f->type))
               ^
   include/uapi/linux/videodev2.h:165:3: note: expanded from macro 'V4L2_TY=
PE_IS_OUTPUT'
           ((type) =3D=3D V4L2_BUF_TYPE_VIDEO_OUTPUT                   \
            ^
   drivers/media/platform/ti-vpe/vpe.c:1725:6: note: Assuming field 'type' =
is not equal to V4L2_BUF_TYPE_VIDEO_OVERLAY
           if (V4L2_TYPE_IS_OUTPUT(f->type))
               ^
   include/uapi/linux/videodev2.h:167:6: note: expanded from macro 'V4L2_TY=
PE_IS_OUTPUT'
            || (type) =3D=3D V4L2_BUF_TYPE_VIDEO_OVERLAY               \
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/ti-vpe/vpe.c:1725:6: note: Left side of '||' is f=
alse
           if (V4L2_TYPE_IS_OUTPUT(f->type))
               ^
   include/uapi/linux/videodev2.h:165:3: note: expanded from macro 'V4L2_TY=
PE_IS_OUTPUT'
           ((type) =3D=3D V4L2_BUF_TYPE_VIDEO_OUTPUT                   \
            ^
   drivers/media/platform/ti-vpe/vpe.c:1725:6: note: Assuming field 'type' =
is not equal to V4L2_BUF_TYPE_VIDEO_OUTPUT_OVERLAY
           if (V4L2_TYPE_IS_OUTPUT(f->type))
               ^
   include/uapi/linux/videodev2.h:168:6: note: expanded from macro 'V4L2_TY=
PE_IS_OUTPUT'
            || (type) =3D=3D V4L2_BUF_TYPE_VIDEO_OUTPUT_OVERLAY        \
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/ti-vpe/vpe.c:1725:6: note: Left side of '||' is f=
alse
           if (V4L2_TYPE_IS_OUTPUT(f->type))
               ^
   include/uapi/linux/videodev2.h:165:3: note: expanded from macro 'V4L2_TY=
PE_IS_OUTPUT'
           ((type) =3D=3D V4L2_BUF_TYPE_VIDEO_OUTPUT                   \
            ^
   drivers/media/platform/ti-vpe/vpe.c:1725:6: note: Assuming field 'type' =
is not equal to V4L2_BUF_TYPE_VBI_OUTPUT
           if (V4L2_TYPE_IS_OUTPUT(f->type))
               ^
   include/uapi/linux/videodev2.h:169:6: note: expanded from macro 'V4L2_TY=
PE_IS_OUTPUT'
            || (type) =3D=3D V4L2_BUF_TYPE_VBI_OUTPUT                  \
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/ti-vpe/vpe.c:1725:6: note: Left side of '||' is f=
alse
           if (V4L2_TYPE_IS_OUTPUT(f->type))
               ^
   include/uapi/linux/videodev2.h:165:3: note: expanded from macro 'V4L2_TY=
PE_IS_OUTPUT'
           ((type) =3D=3D V4L2_BUF_TYPE_VIDEO_OUTPUT                   \
            ^
   drivers/media/platform/ti-vpe/vpe.c:1725:6: note: Assuming field 'type' =
is not equal to V4L2_BUF_TYPE_SLICED_VBI_OUTPUT
           if (V4L2_TYPE_IS_OUTPUT(f->type))
               ^
   include/uapi/linux/videodev2.h:170:6: note: expanded from macro 'V4L2_TY=
PE_IS_OUTPUT'
            || (type) =3D=3D V4L2_BUF_TYPE_SLICED_VBI_OUTPUT           \
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/ti-vpe/vpe.c:1725:6: note: Left side of '||' is f=
alse
           if (V4L2_TYPE_IS_OUTPUT(f->type))
               ^
   include/uapi/linux/videodev2.h:165:3: note: expanded from macro 'V4L2_TY=
PE_IS_OUTPUT'
           ((type) =3D=3D V4L2_BUF_TYPE_VIDEO_OUTPUT                   \
            ^
   drivers/media/platform/ti-vpe/vpe.c:1725:6: note: Assuming field 'type' =
is not equal to V4L2_BUF_TYPE_SDR_OUTPUT
           if (V4L2_TYPE_IS_OUTPUT(f->type))

vim +/delta +63 drivers/media/platform/st/sti/delta/delta-v4l2.c

f386509e4959459 drivers/media/platform/sti/delta/delta-v4l2.c Hugues Fruche=
t 2017-02-02  60  =

f386509e4959459 drivers/media/platform/sti/delta/delta-v4l2.c Hugues Fruche=
t 2017-02-02  61  static void dump_au(struct delta_ctx *ctx, struct delta_a=
u *au)
f386509e4959459 drivers/media/platform/sti/delta/delta-v4l2.c Hugues Fruche=
t 2017-02-02  62  {
f386509e4959459 drivers/media/platform/sti/delta/delta-v4l2.c Hugues Fruche=
t 2017-02-02 @63  	struct delta_dev *delta =3D ctx->dev;
f386509e4959459 drivers/media/platform/sti/delta/delta-v4l2.c Hugues Fruche=
t 2017-02-02  64  	u32 size =3D 10;	/* dump first & last 10 bytes */
f386509e4959459 drivers/media/platform/sti/delta/delta-v4l2.c Hugues Fruche=
t 2017-02-02 @65  	u8 *data =3D (u8 *)(au->vaddr);
f386509e4959459 drivers/media/platform/sti/delta/delta-v4l2.c Hugues Fruche=
t 2017-02-02  66  =

f386509e4959459 drivers/media/platform/sti/delta/delta-v4l2.c Hugues Fruche=
t 2017-02-02  67  	if (au->size <=3D (size * 2))
f386509e4959459 drivers/media/platform/sti/delta/delta-v4l2.c Hugues Fruche=
t 2017-02-02  68  		dev_dbg(delta->dev, "%s dump au[%d] dts=3D%lld size=3D%=
d data=3D%*ph\n",
f386509e4959459 drivers/media/platform/sti/delta/delta-v4l2.c Hugues Fruche=
t 2017-02-02  69  			ctx->name, au->vbuf.vb2_buf.index, au->dts, au->size,
f386509e4959459 drivers/media/platform/sti/delta/delta-v4l2.c Hugues Fruche=
t 2017-02-02  70  			au->size, data);
f386509e4959459 drivers/media/platform/sti/delta/delta-v4l2.c Hugues Fruche=
t 2017-02-02  71  	else
f386509e4959459 drivers/media/platform/sti/delta/delta-v4l2.c Hugues Fruche=
t 2017-02-02  72  		dev_dbg(delta->dev, "%s dump au[%d] dts=3D%lld size=3D%=
d data=3D%*ph..%*ph\n",
f386509e4959459 drivers/media/platform/sti/delta/delta-v4l2.c Hugues Fruche=
t 2017-02-02  73  			ctx->name, au->vbuf.vb2_buf.index, au->dts, au->size,
f386509e4959459 drivers/media/platform/sti/delta/delta-v4l2.c Hugues Fruche=
t 2017-02-02  74  			size, data, size, data + au->size - size);
f386509e4959459 drivers/media/platform/sti/delta/delta-v4l2.c Hugues Fruche=
t 2017-02-02  75  }
f386509e4959459 drivers/media/platform/sti/delta/delta-v4l2.c Hugues Fruche=
t 2017-02-02  76  =


:::::: The code at line 63 was first introduced by commit
:::::: f386509e49594591f80af2e5a73d4c9ce389aa29 [media] st-delta: STiH4xx m=
ulti-format video decoder v4l2 driver

:::::: TO: Hugues Fruchet <hugues.fruchet@st.com>
:::::: CC: Mauro Carvalho Chehab <mchehab@s-opensource.com>

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2093472336311508805==--

