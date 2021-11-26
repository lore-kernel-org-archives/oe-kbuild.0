Content-Type: multipart/mixed; boundary="===============4408937502345868622=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [djwong-xfs:log-recovery-defer-capture 54/87] fs/xfs/xfs_inode.c:3817:20: warning: Value stored to 'ifp' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Fri, 26 Nov 2021 13:32:24 +0800
Message-ID: <202111261319.9plS3tAW-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4408937502345868622==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: "Darrick J. Wong" <darrick.wong@oracle.com>
CC: linux-kernel(a)vger.kernel.org
TO: "Darrick J. Wong" <djwong@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.gi=
t log-recovery-defer-capture
head:   a9ba97129f384fff0a4ac1ff3e2c4b455ea77c88
commit: 5b92b6afccb0b8ef73bda8fd5720bfdbd7b3153f [54/87] xfs: implement liv=
e quotacheck inode scan
:::::: branch date: 5 weeks ago
:::::: commit date: 5 weeks ago
config: arm-randconfig-c002-20211031 (https://download.01.org/0day-ci/archi=
ve/20211126/202111261319.9plS3tAW-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project d32154=
8c3ce987f4f21350ba1c81fdb5d4354224)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.=
git/commit/?id=3D5b92b6afccb0b8ef73bda8fd5720bfdbd7b3153f
        git remote add djwong-xfs https://git.kernel.org/pub/scm/linux/kern=
el/git/djwong/xfs-linux.git
        git fetch --no-tags djwong-xfs log-recovery-defer-capture
        git checkout 5b92b6afccb0b8ef73bda8fd5720bfdbd7b3153f
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   Suppressed 17 warnings (17 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   18 warnings generated.
   drivers/mfd/tps65010.c:650:5: warning: Value stored to 'status' is never=
 read [clang-analyzer-deadcode.DeadStores]
                                   status =3D 0;
                                   ^        ~
   drivers/mfd/tps65010.c:650:5: note: Value stored to 'status' is never re=
ad
                                   status =3D 0;
                                   ^        ~
   Suppressed 17 warnings (17 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   Suppressed 17 warnings (17 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   Suppressed 17 warnings (17 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   Suppressed 17 warnings (17 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/input/touchscreen/cyttsp4_core.c:806:17: warning: Value stored t=
o 'dev' during its initialization is never read [clang-analyzer-deadcode.De=
adStores]
           struct device *dev =3D &md->input->dev;
                          ^~~   ~~~~~~~~~~~~~~~
   drivers/input/touchscreen/cyttsp4_core.c:806:17: note: Value stored to '=
dev' during its initialization is never read
           struct device *dev =3D &md->input->dev;
                          ^~~   ~~~~~~~~~~~~~~~
   drivers/input/touchscreen/cyttsp4_core.c:990:2: warning: Value stored to=
 'hst_mode' is never read [clang-analyzer-deadcode.DeadStores]
           hst_mode =3D si->xy_mode[CY_REG_BASE];
           ^          ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/input/touchscreen/cyttsp4_core.c:990:2: note: Value stored to 'h=
st_mode' is never read
           hst_mode =3D si->xy_mode[CY_REG_BASE];
           ^          ~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   18 warnings generated.
   drivers/mtd/nftlcore.c:334:30: warning: The left operand of '!=3D' is a =
garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
                           if (BlockLastState[block] !=3D SECTOR_FREE &&
                               ~~~~~~~~~~~~~~~~~~~~~ ^
   drivers/mtd/nftlcore.c:250:6: note: Assuming 'thisEUN' is not equal to B=
LOCK_NIL
           if (thisEUN =3D=3D BLOCK_NIL) {
               ^~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nftlcore.c:250:2: note: Taking false branch
           if (thisEUN =3D=3D BLOCK_NIL) {
           ^
   drivers/mtd/nftlcore.c:261:9: note: Assuming 'thisEUN' is > field 'lastE=
UN'
           while (thisEUN <=3D nftl->lastEUN ) {
                  ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nftlcore.c:261:2: note: Loop condition is false. Execution c=
ontinues on line 325
           while (thisEUN <=3D nftl->lastEUN ) {
           ^
   drivers/mtd/nftlcore.c:325:6: note: 'inplace' is 1
           if (inplace) {
               ^~~~~~~
   drivers/mtd/nftlcore.c:325:2: note: Taking true branch
           if (inplace) {
           ^
   drivers/mtd/nftlcore.c:333:8: note: The value 0 is assigned to 'block'
                   for (block =3D 0; block < nftl->EraseSize / 512 ; block+=
+) {
                        ^~~~~~~~~
   drivers/mtd/nftlcore.c:333:19: note: Assuming the condition is true
                   for (block =3D 0; block < nftl->EraseSize / 512 ; block+=
+) {
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nftlcore.c:333:3: note: Loop condition is true.  Entering lo=
op body
                   for (block =3D 0; block < nftl->EraseSize / 512 ; block+=
+) {
                   ^
   drivers/mtd/nftlcore.c:334:30: note: The left operand of '!=3D' is a gar=
bage value
                           if (BlockLastState[block] !=3D SECTOR_FREE &&
                               ~~~~~~~~~~~~~~~~~~~~~ ^
   Suppressed 17 warnings (17 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/mtd/inftlcore.c:537:4: warning: Value stored to 'thisEUN' is nev=
er read [clang-analyzer-deadcode.DeadStores]
                           thisEUN =3D INFTL_makefreeblock(inftl, block);
                           ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/inftlcore.c:537:4: note: Value stored to 'thisEUN' is never =
read
                           thisEUN =3D INFTL_makefreeblock(inftl, block);
                           ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   19 warnings generated.
>> fs/xfs/xfs_inode.c:3817:20: warning: Value stored to 'ifp' during its in=
itialization is never read [clang-analyzer-deadcode.DeadStores]
           struct xfs_ifork        *ifp =3D XFS_IFORK_PTR(ip, XFS_DATA_FORK=
);
                                    ^~~
   fs/xfs/xfs_inode.c:3817:20: note: Value stored to 'ifp' during its initi=
alization is never read
           struct xfs_ifork        *ifp =3D XFS_IFORK_PTR(ip, XFS_DATA_FORK=
);
                                    ^~~
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   Suppressed 17 warnings (17 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   Suppressed 17 warnings (17 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   Suppressed 17 warnings (17 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   18 warnings generated.
   drivers/input/touchscreen/surface3_spi.c:28:8: warning: Excessive paddin=
g in 'struct surface3_ts_data' (96 padding bytes, where 32 is optimal). =

   Optimal fields order: =

   rd_buf, =

   spi, =

   input_dev, =

   pen_input_dev, =

   pen_tool, =

   gpiod_rst, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct surface3_ts_data {
   ~~~~~~~^~~~~~~~~~~~~~~~~~
   drivers/input/touchscreen/surface3_spi.c:28:8: note: Excessive padding i=
n 'struct surface3_ts_data' (96 padding bytes, where 32 is optimal). Optima=
l fields order: rd_buf, spi, input_dev, pen_input_dev, pen_tool, gpiod_rst,=
 consider reordering the fields or adding explicit padding members
   struct surface3_ts_data {
   ~~~~~~~^~~~~~~~~~~~~~~~~~
   Suppressed 17 warnings (17 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/input/touchscreen/ti_am335x_tsc.c:158:2: warning: Value stored t=
o 'config' is never read [clang-analyzer-deadcode.DeadStores]
           config =3D 0;
           ^        ~
   drivers/input/touchscreen/ti_am335x_tsc.c:158:2: note: Value stored to '=
config' is never read
           config =3D 0;
           ^        ~
   drivers/input/touchscreen/ti_am335x_tsc.c:251:8: warning: Division by ze=
ro [clang-analyzer-core.DivideZero]
                   ysum /=3D creads;
                        ^
   drivers/input/touchscreen/ti_am335x_tsc.c:277:11: note: Calling 'titsc_r=
eadl'
           status =3D titsc_readl(ts_dev, REG_RAWIRQSTATUS);
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/input/touchscreen/ti_am335x_tsc.c:65:2: note: Returning without =
writing to 'ts->coordinate_readouts'
           return readl(ts->mfd_tscadc->tscadc_base + reg);
           ^
   drivers/input/touchscreen/ti_am335x_tsc.c:277:11: note: Returning from '=
titsc_readl'
           status =3D titsc_readl(ts_dev, REG_RAWIRQSTATUS);
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/input/touchscreen/ti_am335x_tsc.c:278:6: note: Assuming the cond=
ition is false
           if (status & IRQENB_HW_PEN) {
               ^~~~~~~~~~~~~~~~~~~~~~
   drivers/input/touchscreen/ti_am335x_tsc.c:278:2: note: Taking false bran=
ch
           if (status & IRQENB_HW_PEN) {
           ^
   drivers/input/touchscreen/ti_am335x_tsc.c:284:6: note: Assuming the cond=
ition is false
           if (status & IRQENB_PENUP) {
               ^~~~~~~~~~~~~~~~~~~~~
   drivers/input/touchscreen/ti_am335x_tsc.c:284:2: note: Taking false bran=
ch
           if (status & IRQENB_PENUP) {
           ^
   drivers/input/touchscreen/ti_am335x_tsc.c:298:6: note: Assuming the cond=
ition is false
           if (status & IRQENB_EOS)
               ^~~~~~~~~~~~~~~~~~~
   drivers/input/touchscreen/ti_am335x_tsc.c:298:2: note: Taking false bran=
ch
           if (status & IRQENB_EOS)
           ^
   drivers/input/touchscreen/ti_am335x_tsc.c:305:6: note: Assuming the cond=
ition is true
           if (status & IRQENB_FIFO0THRES) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/input/touchscreen/ti_am335x_tsc.c:305:2: note: Taking true branch
           if (status & IRQENB_FIFO0THRES) {
           ^
   drivers/input/touchscreen/ti_am335x_tsc.c:307:3: note: Calling 'titsc_re=
ad_coordinates'
                   titsc_read_coordinates(ts_dev, &x, &y, &z1, &z2);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/input/touchscreen/ti_am335x_tsc.c:222:2: note: 'creads' initiali=
zed here
           unsigned int creads =3D ts_dev->coordinate_readouts;
           ^~~~~~~~~~~~~~~~~~~
   drivers/input/touchscreen/ti_am335x_tsc.c:224:14: note: Assuming 'i' is =
>=3D 'creads'
           for (i =3D 0; i < creads; i++) {
                       ^~~~~~~~~~

vim +/ifp +3817 fs/xfs/xfs_inode.c

5b92b6afccb0b8 Darrick J. Wong 2021-09-01  3808  =

5b92b6afccb0b8 Darrick J. Wong 2021-09-01  3809  /* Compute the number of d=
ata and realtime blocks used by a file. */
5b92b6afccb0b8 Darrick J. Wong 2021-09-01  3810  void
5b92b6afccb0b8 Darrick J. Wong 2021-09-01  3811  xfs_inode_count_blocks(
5b92b6afccb0b8 Darrick J. Wong 2021-09-01  3812  	struct xfs_trans	*tp,
5b92b6afccb0b8 Darrick J. Wong 2021-09-01  3813  	struct xfs_inode	*ip,
5b92b6afccb0b8 Darrick J. Wong 2021-09-01  3814  	xfs_filblks_t		*dblocks,
5b92b6afccb0b8 Darrick J. Wong 2021-09-01  3815  	xfs_filblks_t		*rblocks)
5b92b6afccb0b8 Darrick J. Wong 2021-09-01  3816  {
5b92b6afccb0b8 Darrick J. Wong 2021-09-01 @3817  	struct xfs_ifork	*ifp =3D=
 XFS_IFORK_PTR(ip, XFS_DATA_FORK);

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============4408937502345868622==--

