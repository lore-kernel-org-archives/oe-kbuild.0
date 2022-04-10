Content-Type: multipart/mixed; boundary="===============8149258397713241794=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/soc/imx/imx8m-blk-ctrl.c:33:8: warning: Excessive padding in 'struct imx8m_blk_ctrl_domain_data' (8 padding bytes, where 0 is optimal).
Date: Mon, 11 Apr 2022 04:29:59 +0800
Message-ID: <202204110441.1pioMIjH-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8149258397713241794==
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
head:   4ea3c6425269d33da53c79d539ce9554117cf4d4
commit: 042b67799e2991e301df8269e166d8bc5944495e soc: imx: imx8m-blk-ctrl: =
Fix imx8mm mipi reset
date:   4 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 4 months ago
config: riscv-randconfig-c006-20220405 (https://download.01.org/0day-ci/arc=
hive/20220411/202204110441.1pioMIjH-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c4a1b0=
7d0979e7ff20d7d541af666d822d66b566)
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
   fs/xfs/scrub/parent.c:179:2: note: Taking false branch
           if (dp =3D=3D sc->ip || !S_ISDIR(VFS_I(dp)->i_mode)) {
           ^
   fs/xfs/scrub/parent.c:191:6: note: Assuming the condition is false
           if (xfs_ilock_nowait(dp, XFS_IOLOCK_SHARED)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/scrub/parent.c:191:2: note: Taking false branch
           if (xfs_ilock_nowait(dp, XFS_IOLOCK_SHARED)) {
           ^
   fs/xfs/scrub/parent.c:210:6: note: Assuming 'error' is 0
           if (error)
               ^~~~~
   fs/xfs/scrub/parent.c:210:2: note: Taking false branch
           if (error)
           ^
   fs/xfs/scrub/parent.c:214:10: note: Calling 'xchk_parent_count_parent_de=
ntries'
           error =3D xchk_parent_count_parent_dentries(sc, dp, &nlink);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/scrub/parent.c:92:6: note: Assuming field 'if_nextents' is > 0
           if (parent->i_df.if_nextents > 0)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/scrub/parent.c:92:2: note: Taking true branch
           if (parent->i_df.if_nextents > 0)
           ^
   fs/xfs/scrub/parent.c:95:6: note: Assuming 'error' is not equal to 0
           if (error)
               ^~~~~
   fs/xfs/scrub/parent.c:95:2: note: Taking true branch
           if (error)
           ^
   fs/xfs/scrub/parent.c:96:3: note: Returning without writing to '*nlink'
                   return error;
                   ^
   fs/xfs/scrub/parent.c:214:10: note: Returning from 'xchk_parent_count_pa=
rent_dentries'
           error =3D xchk_parent_count_parent_dentries(sc, dp, &nlink);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/scrub/parent.c:215:6: note: Assuming the condition is false
           if (!xchk_fblock_xref_process_error(sc, XFS_DATA_FORK, 0, &error=
))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/scrub/parent.c:215:2: note: Taking false branch
           if (!xchk_fblock_xref_process_error(sc, XFS_DATA_FORK, 0, &error=
))
           ^
   fs/xfs/scrub/parent.c:221:6: note: Assuming 'error' is 0
           if (error)
               ^~~~~
   fs/xfs/scrub/parent.c:221:2: note: Taking false branch
           if (error)
           ^
   fs/xfs/scrub/parent.c:230:19: note: Assuming field 'i_nlink' is not equa=
l to 0
           expected_nlink =3D VFS_I(sc->ip)->i_nlink =3D=3D 0 ? 0 : 1;
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/scrub/parent.c:230:19: note: '?' condition is false
   fs/xfs/scrub/parent.c:234:6: note: Assuming the condition is false
           if (!xchk_fblock_process_error(sc, XFS_DATA_FORK, 0, &error))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/scrub/parent.c:234:2: note: Taking false branch
           if (!xchk_fblock_process_error(sc, XFS_DATA_FORK, 0, &error))
           ^
   fs/xfs/scrub/parent.c:238:6: note: Assuming 'dnum' is equal to field 'i_=
ino'
           if (dnum !=3D dp->i_ino) {
               ^~~~~~~~~~~~~~~~~
   fs/xfs/scrub/parent.c:238:2: note: Taking false branch
           if (dnum !=3D dp->i_ino) {
           ^
   fs/xfs/scrub/parent.c:249:12: note: The left operand of '!=3D' is a garb=
age value
           if (nlink !=3D expected_nlink)
               ~~~~~ ^
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (3 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (3 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   drivers/soc/aspeed/aspeed-lpc-ctrl.c:73:17: warning: Value stored to 'de=
v' during its initialization is never read [clang-analyzer-deadcode.DeadSto=
res]
           struct device *dev =3D file->private_data;
                          ^~~   ~~~~~~~~~~~~~~~~~~
   drivers/soc/aspeed/aspeed-lpc-ctrl.c:73:17: note: Value stored to 'dev' =
during its initialization is never read
           struct device *dev =3D file->private_data;
                          ^~~   ~~~~~~~~~~~~~~~~~~
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
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
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
   3 warnings generated.
   drivers/leds/led-core.c:472:30: warning: Access to field 'name' results =
in a dereference of a null pointer [clang-analyzer-core.NullDereference]
                   strscpy(led_classdev_name, to_of_node(fwnode)->name,
                                              ^
   include/linux/of.h:161:2: note: expanded from macro 'to_of_node'
           ({                                                              \
           ^
   drivers/leds/led-core.c:424:2: note: Taking false branch
           BUG_ON(props.color =3D=3D LED_COLOR_ID_MULTI);
           ^
   include/asm-generic/bug.h:65:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                  ^
   drivers/leds/led-core.c:424:2: note: Loop condition is false.  Exiting l=
oop
           BUG_ON(props.color =3D=3D LED_COLOR_ID_MULTI);
           ^
   include/asm-generic/bug.h:65:27: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                             ^
   drivers/leds/led-core.c:426:6: note: Assuming 'led_classdev_name' is non=
-null
           if (!led_classdev_name)
               ^~~~~~~~~~~~~~~~~~
   drivers/leds/led-core.c:426:2: note: Taking false branch
           if (!led_classdev_name)
           ^
   drivers/leds/led-core.c:429:2: note: Calling 'led_parse_fwnode_props'
           led_parse_fwnode_props(dev, fwnode, &props);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/leds/led-core.c:370:6: note: Assuming 'fwnode' is non-null
           if (!fwnode)
               ^~~~~~~
   drivers/leds/led-core.c:370:2: note: Taking false branch
           if (!fwnode)
           ^
   drivers/leds/led-core.c:373:6: note: Assuming the condition is false
           if (fwnode_property_present(fwnode, "label")) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/leds/led-core.c:373:2: note: Taking false branch
           if (fwnode_property_present(fwnode, "label")) {
           ^
   drivers/leds/led-core.c:380:6: note: Assuming the condition is false
           if (fwnode_property_present(fwnode, "color")) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/leds/led-core.c:380:2: note: Taking false branch
           if (fwnode_property_present(fwnode, "color")) {
           ^
   drivers/leds/led-core.c:391:6: note: Assuming the condition is true
           if (!fwnode_property_present(fwnode, "function"))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/leds/led-core.c:391:2: note: Taking true branch
           if (!fwnode_property_present(fwnode, "function"))
           ^
   drivers/leds/led-core.c:392:3: note: Returning without writing to 'props=
->label', which participates in a condition later
                   return;
                   ^
   drivers/leds/led-core.c:392:3: note: Returning without writing to 'props=
->function', which participates in a condition later
   drivers/leds/led-core.c:392:3: note: Returning without writing to 'props=
->color_present', which participates in a condition later
   drivers/leds/led-core.c:429:2: note: Returning from 'led_parse_fwnode_pr=
ops'
           led_parse_fwnode_props(dev, fwnode, &props);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/leds/led-core.c:431:12: note: Field 'label' is null
           if (props.label) {
                     ^
   drivers/leds/led-core.c:431:2: note: Taking false branch
           if (props.label) {
           ^
   drivers/leds/led-core.c:445:19: note: Field 'function' is null
           } else if (props.function || props.color_present) {
                            ^
   drivers/leds/led-core.c:445:13: note: Left side of '||' is false
           } else if (props.function || props.color_present) {
                      ^
   drivers/leds/led-core.c:445:37: note: Field 'color_present' is false
           } else if (props.function || props.color_present) {
                                              ^
   drivers/leds/led-core.c:445:9: note: Taking false branch
           } else if (props.function || props.color_present) {
                  ^
   drivers/leds/led-core.c:464:13: note: Assuming field 'default_label' is =
null
           } else if (init_data->default_label) {
                      ^~~~~~~~~~~~~~~~~~~~~~~~

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

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8149258397713241794==--

