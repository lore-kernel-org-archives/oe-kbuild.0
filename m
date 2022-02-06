Content-Type: multipart/mixed; boundary="===============6081638775166992232=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/soc/imx/imx8m-blk-ctrl.c:33:8: warning: Excessive padding in 'struct imx8m_blk_ctrl_domain_data' (8 padding bytes, where 0 is optimal).
Date: Sun, 06 Feb 2022 09:48:30 +0800
Message-ID: <202202060816.6rq608xQ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6081638775166992232==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Adam Ford <aford173@gmail.com>
CC: Shawn Guo <shawnguo@kernel.org>
CC: Fabio Estevam <festevam@gmail.com>
CC: Lucas Stach <l.stach@pengutronix.de>
CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   90c9e950c0def5c354b4a6154a2ddda3e5f214ac
commit: 042b67799e2991e301df8269e166d8bc5944495e soc: imx: imx8m-blk-ctrl: =
Fix imx8mm mipi reset
date:   9 weeks ago
:::::: branch date: 6 hours ago
:::::: commit date: 9 weeks ago
config: riscv-randconfig-c006-20220206 (https://download.01.org/0day-ci/arc=
hive/20220206/202202060816.6rq608xQ-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project dee058=
c670593b999fec19c458dbbd882ad9de56)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D042b67799e2991e301df8269e166d8bc5944495e
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 042b67799e2991e301df8269e166d8bc5944495e
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                        ^~~~~
   drivers/mtd/nand/raw/nand_toshiba.c:62:15: note: Assuming 'i' is < field=
 'steps'
                   for (i =3D 0; i < chip->ecc.steps; i++) {
                               ^~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/raw/nand_toshiba.c:62:3: note: Loop condition is true. =
 Entering loop body
                   for (i =3D 0; i < chip->ecc.steps; i++) {
                   ^
   drivers/mtd/nand/raw/nand_toshiba.c:63:29: note: The left operand of '&'=
 is a garbage value
                           bitflips =3D ecc_status[i] & TOSHIBA_NAND_ECC_ST=
ATUS_MASK;
                                      ~~~~~~~~~~~~~ ^
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   drivers/mtd/chips/cfi_cmdset_0020.c:714:29: warning: The right operand o=
f '+' is a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
                           memcpy(buffer, elem_base + thislen, buflen);
                                                    ^ ~~~~~~~
   drivers/mtd/chips/cfi_cmdset_0020.c:667:22: note: 'thislen' declared wit=
hout an initial value
           size_t   totlen =3D 0, thislen;
                                ^~~~~~~
   drivers/mtd/chips/cfi_cmdset_0020.c:672:6: note: Assuming field 'writesi=
ze' is not equal to 0
           if (!ECCBUF_SIZE) {
               ^~~~~~~~~~~~
   drivers/mtd/chips/cfi_cmdset_0020.c:672:2: note: Taking false branch
           if (!ECCBUF_SIZE) {
           ^
   drivers/mtd/chips/cfi_cmdset_0020.c:678:11: note: Calling 'kmalloc'
           buffer =3D kmalloc(ECCBUF_SIZE, GFP_KERNEL);
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:578:2: note: Taking false branch
           if (__builtin_constant_p(size)) {
           ^
   include/linux/slab.h:595:2: note: Returning pointer, which participates =
in a condition later
           return __kmalloc(size, flags);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/chips/cfi_cmdset_0020.c:678:11: note: Returning from 'kmallo=
c'
           buffer =3D kmalloc(ECCBUF_SIZE, GFP_KERNEL);
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/chips/cfi_cmdset_0020.c:679:6: note: Assuming 'buffer' is no=
n-null
           if (!buffer)
               ^~~~~~~
   drivers/mtd/chips/cfi_cmdset_0020.c:679:2: note: Taking false branch
           if (!buffer)
           ^
   drivers/mtd/chips/cfi_cmdset_0020.c:682:12: note: Assuming 'i' is < 'cou=
nt'
           for (i=3D0; i<count; i++) {
                     ^~~~~~~
   drivers/mtd/chips/cfi_cmdset_0020.c:682:2: note: Loop condition is true.=
  Entering loop body
           for (i=3D0; i<count; i++) {
           ^
   drivers/mtd/chips/cfi_cmdset_0020.c:685:7: note: Assuming 'elem_len' is =
not equal to 0
                   if (!elem_len) /* FIXME: Might be unnecessary. Check tha=
t */
                       ^~~~~~~~~
   drivers/mtd/chips/cfi_cmdset_0020.c:685:3: note: Taking false branch
                   if (!elem_len) /* FIXME: Might be unnecessary. Check tha=
t */
                   ^
   drivers/mtd/chips/cfi_cmdset_0020.c:687:7: note: 'buflen' is 0
                   if (buflen) { /* cut off head */
                       ^~~~~~
   drivers/mtd/chips/cfi_cmdset_0020.c:687:3: note: Taking false branch
                   if (buflen) { /* cut off head */
                   ^
   drivers/mtd/chips/cfi_cmdset_0020.c:703:7: note: Assuming the condition =
is false
                   if (ECCBUF_DIV(elem_len)) { /* write clean aligned data =
*/
                       ^
   drivers/mtd/chips/cfi_cmdset_0020.c:660:24: note: expanded from macro 'E=
CCBUF_DIV'
   #define ECCBUF_DIV(x) ((x) & ~(ECCBUF_SIZE - 1))
                          ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/chips/cfi_cmdset_0020.c:703:3: note: Taking false branch
                   if (ECCBUF_DIV(elem_len)) { /* write clean aligned data =
*/
                   ^
   drivers/mtd/chips/cfi_cmdset_0020.c:712:7: note: Assuming 'buflen' is no=
t equal to 0
                   if (buflen) {
                       ^~~~~~
   drivers/mtd/chips/cfi_cmdset_0020.c:712:3: note: Taking true branch
                   if (buflen) {
                   ^
   drivers/mtd/chips/cfi_cmdset_0020.c:714:29: note: The right operand of '=
+' is a garbage value
                           memcpy(buffer, elem_base + thislen, buflen);
                                                    ^ ~~~~~~~
   drivers/mtd/chips/cfi_cmdset_0020.c:1035:16: warning: Value stored to 't=
imeo' during its initialization is never read [clang-analyzer-deadcode.Dead=
Stores]
           unsigned long timeo =3D jiffies + HZ;
                         ^~~~~   ~~~~~~~~~~~~
   drivers/mtd/chips/cfi_cmdset_0020.c:1035:16: note: Value stored to 'time=
o' during its initialization is never read
           unsigned long timeo =3D jiffies + HZ;
                         ^~~~~   ~~~~~~~~~~~~
   drivers/mtd/chips/cfi_cmdset_0020.c:1181:16: warning: Value stored to 't=
imeo' during its initialization is never read [clang-analyzer-deadcode.Dead=
Stores]
           unsigned long timeo =3D jiffies + HZ;
                         ^~~~~   ~~~~~~~~~~~~
   drivers/mtd/chips/cfi_cmdset_0020.c:1181:16: note: Value stored to 'time=
o' during its initialization is never read
           unsigned long timeo =3D jiffies + HZ;
                         ^~~~~   ~~~~~~~~~~~~
   Suppressed 7 warnings (7 in non-user code).
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
>> drivers/soc/imx/imx8m-blk-ctrl.c:33:8: warning: Excessive padding in 'st=
ruct imx8m_blk_ctrl_domain_data' (8 padding bytes, where 0 is optimal). =

   Optimal fields order: =

   name, =

   clk_names, =

   gpc_name, =

   num_clks, =

   rst_mask, =

   clk_mask, =

   mipi_phy_rst_mask, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct imx8m_blk_ctrl_domain_data {
   ~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/soc/imx/imx8m-blk-ctrl.c:33:8: note: Excessive padding in 'struc=
t imx8m_blk_ctrl_domain_data' (8 padding bytes, where 0 is optimal). Optima=
l fields order: name, clk_names, gpc_name, num_clks, rst_mask, clk_mask, mi=
pi_phy_rst_mask, consider reordering the fields or adding explicit padding =
members
   struct imx8m_blk_ctrl_domain_data {
   ~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
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
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   drivers/media/i2c/ov9650.c:606:3: warning: Value stored to 'ret' is neve=
r read [clang-analyzer-deadcode.DeadStores]
                   ret =3D ov965x_write(ov965x, REG_COM8, reg);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/ov9650.c:606:3: note: Value stored to 'ret' is never r=
ead
                   ret =3D ov965x_write(ov965x, REG_COM8, reg);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/ov9650.c:877:12: warning: The result of the left shift=
 is undefined due to shifting by '32', which is greater or equal to the wid=
th of type 'int' [clang-analyzer-core.UndefinedBinaryOperatorResult]
                   m =3D 0x01 << fls(gain >> 4);
                            ^
   drivers/media/i2c/ov9650.c:905:27: note: Calling 'ctrl_to_sd'
           struct v4l2_subdev *sd =3D ctrl_to_sd(ctrl);
                                    ^~~~~~~~~~~~~~~~
   drivers/media/i2c/ov9650.c:417:2: note: Returning without writing to 'ct=
rl->id', which participates in a condition later
           return &container_of(ctrl->handler, struct ov965x, ctrls.handler=
)->sd;
           ^
   drivers/media/i2c/ov9650.c:417:2: note: Returning without writing to 'ct=
rl->val', which participates in a condition later
   drivers/media/i2c/ov9650.c:905:27: note: Returning from 'ctrl_to_sd'
           struct v4l2_subdev *sd =3D ctrl_to_sd(ctrl);
                                    ^~~~~~~~~~~~~~~~
   drivers/media/i2c/ov9650.c:909:14: note: Assuming 'debug' is < 1
           v4l2_dbg(1, debug, sd, "g_ctrl: %s\n", ctrl->name);
                       ^
   include/media/v4l2-common.h:73:7: note: expanded from macro 'v4l2_dbg'
                   if (debug >=3D (level))                                 =
  \
                       ^~~~~~~~~~~~~~~~
   drivers/media/i2c/ov9650.c:909:2: note: Taking false branch
           v4l2_dbg(1, debug, sd, "g_ctrl: %s\n", ctrl->name);
           ^
   include/media/v4l2-common.h:73:3: note: expanded from macro 'v4l2_dbg'
                   if (debug >=3D (level))                                 =
  \
                   ^
   drivers/media/i2c/ov9650.c:909:2: note: Loop condition is false.  Exitin=
g loop
           v4l2_dbg(1, debug, sd, "g_ctrl: %s\n", ctrl->name);
           ^
   include/media/v4l2-common.h:72:2: note: expanded from macro 'v4l2_dbg'
           do {                                                            \
           ^
   drivers/media/i2c/ov9650.c:912:8: note: Calling '__g_volatile_ctrl'
           ret =3D __g_volatile_ctrl(ov965x, ctrl);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/ov9650.c:863:6: note: Assuming field 'power' is not eq=
ual to 0
           if (!ov965x->power)
               ^~~~~~~~~~~~~~
   drivers/media/i2c/ov9650.c:863:2: note: Taking false branch
           if (!ov965x->power)
           ^
   drivers/media/i2c/ov9650.c:866:2: note: Control jumps to 'case 9963794:'=
  at line 867
           switch (ctrl->id) {
           ^
   drivers/media/i2c/ov9650.c:868:7: note: Assuming field 'val' is not equa=
l to 0

vim +33 drivers/soc/imx/imx8m-blk-ctrl.c

2684ac05a8c4d2 Lucas Stach 2021-10-02  32  =

2684ac05a8c4d2 Lucas Stach 2021-10-02 @33  struct imx8m_blk_ctrl_domain_dat=
a {
2684ac05a8c4d2 Lucas Stach 2021-10-02  34  	const char *name;
2684ac05a8c4d2 Lucas Stach 2021-10-02  35  	const char * const *clk_names;
2684ac05a8c4d2 Lucas Stach 2021-10-02  36  	int num_clks;
2684ac05a8c4d2 Lucas Stach 2021-10-02  37  	const char *gpc_name;
2684ac05a8c4d2 Lucas Stach 2021-10-02  38  	u32 rst_mask;
2684ac05a8c4d2 Lucas Stach 2021-10-02  39  	u32 clk_mask;
042b67799e2991 Adam Ford   2021-11-28  40  =

042b67799e2991 Adam Ford   2021-11-28  41  	/*
042b67799e2991 Adam Ford   2021-11-28  42  	 * i.MX8M Mini and Nano have a =
third DISPLAY_BLK_CTRL register
042b67799e2991 Adam Ford   2021-11-28  43  	 * which is used to control the=
 reset for the MIPI Phy.
042b67799e2991 Adam Ford   2021-11-28  44  	 * Since it's only present in c=
ertain circumstances,
042b67799e2991 Adam Ford   2021-11-28  45  	 * an if-statement should be us=
ed before setting and clearing this
042b67799e2991 Adam Ford   2021-11-28  46  	 * register.
042b67799e2991 Adam Ford   2021-11-28  47  	 */
042b67799e2991 Adam Ford   2021-11-28  48  	u32 mipi_phy_rst_mask;
2684ac05a8c4d2 Lucas Stach 2021-10-02  49  };
2684ac05a8c4d2 Lucas Stach 2021-10-02  50  =


:::::: The code at line 33 was first introduced by commit
:::::: 2684ac05a8c4d2d5c49e6c11eb6206b30a284813 soc: imx: add i.MX8M blk-ct=
rl driver

:::::: TO: Lucas Stach <l.stach@pengutronix.de>
:::::: CC: Shawn Guo <shawnguo@kernel.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6081638775166992232==--

