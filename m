Content-Type: multipart/mixed; boundary="===============1222381364482961357=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/soc/imx/imx8m-blk-ctrl.c:33:8: warning: Excessive padding in 'struct imx8m_blk_ctrl_domain_data' (8 padding bytes, where 0 is optimal).
Date: Mon, 21 Mar 2022 14:36:37 +0800
Message-ID: <202203211436.wGtFxoij-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1222381364482961357==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Adam Ford <aford173@gmail.com>
CC: Shawn Guo <shawnguo@kernel.org>
CC: Fabio Estevam <festevam@gmail.com>
CC: Lucas Stach <l.stach@pengutronix.de>
CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   f443e374ae131c168a065ea1748feac6b2e76613
commit: 042b67799e2991e301df8269e166d8bc5944495e soc: imx: imx8m-blk-ctrl: =
Fix imx8mm mipi reset
date:   4 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 4 months ago
config: riscv-randconfig-c006-20220313 (https://download.01.org/0day-ci/arc=
hive/20220321/202203211436.wGtFxoij-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 43f668=
b98e8d87290fc6bbf5ed13c3ab542e3497)
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
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (2 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   lib/bootconfig.c:169:15: warning: Access to field 'data' results in a de=
reference of a null pointer (loaded from variable 'node') [clang-analyzer-c=
ore.NullDereference]
           int offset =3D node->data & ~XBC_VALUE;
                        ^
   lib/bootconfig.c:284:6: note: Assuming 'node' is non-null
           if (!node || node =3D=3D root)
               ^~~~~
   lib/bootconfig.c:284:6: note: Left side of '||' is false
   lib/bootconfig.c:284:15: note: Assuming 'node' is not equal to 'root'
           if (!node || node =3D=3D root)
                        ^~~~~~~~~~~~
   lib/bootconfig.c:284:2: note: Taking false branch
           if (!node || node =3D=3D root)
           ^
   lib/bootconfig.c:287:6: note: Assuming the condition is false
           if (xbc_node_is_value(node))
               ^~~~~~~~~~~~~~~~~~~~~~~
   lib/bootconfig.c:287:2: note: Taking false branch
           if (xbc_node_is_value(node))
           ^
   lib/bootconfig.c:290:9: note: 'node' is non-null
           while (node && node !=3D root) {
                  ^~~~
   lib/bootconfig.c:290:9: note: Left side of '&&' is true
   lib/bootconfig.c:290:17: note: 'node' is not equal to 'root'
           while (node && node !=3D root) {
                          ^~~~
   lib/bootconfig.c:290:2: note: Loop condition is true.  Entering loop body
           while (node && node !=3D root) {
           ^
   lib/bootconfig.c:292:7: note: 'depth' is not equal to XBC_DEPTH_MAX
                   if (depth =3D=3D XBC_DEPTH_MAX)
                       ^~~~~
   lib/bootconfig.c:292:3: note: Taking false branch
                   if (depth =3D=3D XBC_DEPTH_MAX)
                   ^
   lib/bootconfig.c:294:10: note: Calling 'xbc_node_get_parent'
                   node =3D xbc_node_get_parent(node);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~
   lib/bootconfig.c:131:9: note: Assuming field 'parent' is not equal to XB=
C_NODE_MAX
           return node->parent =3D=3D XBC_NODE_MAX ? NULL : &xbc_nodes[node=
->parent];
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/bootconfig.c:131:9: note: '?' condition is false
   lib/bootconfig.c:131:2: note: Returning pointer, which participates in a=
 condition later
           return node->parent =3D=3D XBC_NODE_MAX ? NULL : &xbc_nodes[node=
->parent];
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   lib/bootconfig.c:294:10: note: Returning from 'xbc_node_get_parent'
                   node =3D xbc_node_get_parent(node);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~
   lib/bootconfig.c:290:9: note: Assuming 'node' is null
           while (node && node !=3D root) {
                  ^~~~
   lib/bootconfig.c:290:14: note: Left side of '&&' is false
           while (node && node !=3D root) {
                       ^
   lib/bootconfig.c:296:7: note: 'node' is null
           if (!node && root)
                ^~~~
   lib/bootconfig.c:296:6: note: Left side of '&&' is true
           if (!node && root)
               ^
   lib/bootconfig.c:296:15: note: Assuming 'root' is null
           if (!node && root)
                        ^~~~
   lib/bootconfig.c:296:2: note: Taking false branch
           if (!node && root)
           ^
   lib/bootconfig.c:299:2: note: Loop condition is true.  Entering loop body
           while (--depth >=3D 0) {
           ^
   lib/bootconfig.c:300:3: note: Null pointer value stored to 'node'
                   node =3D xbc_nodes + keys[depth];
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/bootconfig.c:301:55: note: Passing null pointer value via 1st parame=
ter 'node'
                   ret =3D snprintf(buf, size, "%s%s", xbc_node_get_data(no=
de),
                                                                       ^~~~
   lib/bootconfig.c:301:37: note: Calling 'xbc_node_get_data'
                   ret =3D snprintf(buf, size, "%s%s", xbc_node_get_data(no=
de),
                                                     ^~~~~~~~~~~~~~~~~~~~~~~
   lib/bootconfig.c:169:15: note: Access to field 'data' results in a deref=
erence of a null pointer (loaded from variable 'node')
           int offset =3D node->data & ~XBC_VALUE;
                        ^~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
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
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   41 warnings generated.
   drivers/soc/mediatek/mtk-devapc.c:133:13: warning: The result of the lef=
t shift is undefined due to shifting by '32', which is greater or equal to =
the width of type 'int' [clang-analyzer-core.UndefinedBinaryOperatorResult]
           writel(0x1 << min_shift_group, pd_vio_shift_sel_reg);
                      ^
   drivers/soc/mediatek/mtk-devapc.c:190:9: note: Calling 'devapc_sync_vio_=
dbg'
           while (devapc_sync_vio_dbg(ctx))
                  ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/soc/mediatek/mtk-devapc.c:126:8: note: Loop condition is false. =
 Exiting loop
           val =3D readl(pd_vio_shift_sta_reg);
                 ^
   arch/riscv/include/asm/mmio.h:140:30: note: expanded from macro 'readl'
   #define readl(c)        ({ u32 __v; __io_br(); __v =3D readl_cpu(c); __i=
o_ar(__v); __v; })
                                       ^
   arch/riscv/include/asm/mmio.h:133:19: note: expanded from macro '__io_br'
   #define __io_br()       do {} while (0)
                           ^
   drivers/soc/mediatek/mtk-devapc.c:127:6: note: Assuming 'val' is not equ=
al to 0
           if (!val)
               ^~~~
   drivers/soc/mediatek/mtk-devapc.c:127:2: note: Taking false branch
           if (!val)
           ^
   drivers/soc/mediatek/mtk-devapc.c:130:20: note: Calling '__ffs'
           min_shift_group =3D __ffs(val);
                             ^~~~~~~~~~
   include/asm-generic/bitops/__ffs.h:18:6: note: Assuming the condition is=
 true
           if ((word & 0xffffffff) =3D=3D 0) {
               ^~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/__ffs.h:18:2: note: Taking true branch
           if ((word & 0xffffffff) =3D=3D 0) {
           ^
   include/asm-generic/bitops/__ffs.h:19:3: note: The value 32 is assigned =
to 'num'
                   num +=3D 32;
                   ^~~~~~~~~
   include/asm-generic/bitops/__ffs.h:23:6: note: Assuming the condition is=
 false
           if ((word & 0xffff) =3D=3D 0) {
               ^~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/__ffs.h:23:2: note: Taking false branch
           if ((word & 0xffff) =3D=3D 0) {
           ^
   include/asm-generic/bitops/__ffs.h:27:6: note: Assuming the condition is=
 false
           if ((word & 0xff) =3D=3D 0) {
               ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/__ffs.h:27:2: note: Taking false branch
           if ((word & 0xff) =3D=3D 0) {
           ^
   include/asm-generic/bitops/__ffs.h:31:6: note: Assuming the condition is=
 false
           if ((word & 0xf) =3D=3D 0) {
               ^~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/__ffs.h:31:2: note: Taking false branch
           if ((word & 0xf) =3D=3D 0) {
           ^
   include/asm-generic/bitops/__ffs.h:35:6: note: Assuming the condition is=
 false
           if ((word & 0x3) =3D=3D 0) {
               ^~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/__ffs.h:35:2: note: Taking false branch
           if ((word & 0x3) =3D=3D 0) {
           ^
   include/asm-generic/bitops/__ffs.h:39:6: note: Assuming the condition is=
 false
           if ((word & 0x1) =3D=3D 0)
               ^~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/__ffs.h:39:2: note: Taking false branch
           if ((word & 0x1) =3D=3D 0)
           ^
   include/asm-generic/bitops/__ffs.h:41:2: note: Returning the value 32 (l=
oaded from 'num')
           return num;
           ^~~~~~~~~~
   drivers/soc/mediatek/mtk-devapc.c:130:20: note: Returning from '__ffs'
           min_shift_group =3D __ffs(val);
                             ^~~~~~~~~~
   drivers/soc/mediatek/mtk-devapc.c:130:2: note: The value 32 is assigned =
to 'min_shift_group'
           min_shift_group =3D __ffs(val);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/soc/mediatek/mtk-devapc.c:133:13: note: The result of the left s=
hift is undefined due to shifting by '32', which is greater or equal to the=
 width of type 'int'
           writel(0x1 << min_shift_group, pd_vio_shift_sel_reg);
                      ^
   arch/riscv/include/asm/mmio.h:144:48: note: expanded from macro 'writel'
   #define writel(v, c)    ({ __io_bw(); writel_cpu((v), (c)); __io_aw(); })

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


:::::: The code@line 33 was first introduced by commit
:::::: 2684ac05a8c4d2d5c49e6c11eb6206b30a284813 soc: imx: add i.MX8M blk-ct=
rl driver

:::::: TO: Lucas Stach <l.stach@pengutronix.de>
:::::: CC: Shawn Guo <shawnguo@kernel.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1222381364482961357==--

