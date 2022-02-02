Content-Type: multipart/mixed; boundary="===============5270826035975998652=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/soc/imx/imx8m-blk-ctrl.c:33:8: warning: Excessive padding in 'struct imx8m_blk_ctrl_domain_data' (8 padding bytes, where 0 is optimal).
Date: Thu, 03 Feb 2022 02:56:11 +0800
Message-ID: <202202030245.cjg3G8GS-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5270826035975998652==
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
head:   9f7fb8de5d9bac17b6392a14af40baf555d9129b
commit: 042b67799e2991e301df8269e166d8bc5944495e soc: imx: imx8m-blk-ctrl: =
Fix imx8mm mipi reset
date:   8 weeks ago
:::::: branch date: 22 hours ago
:::::: commit date: 8 weeks ago
config: riscv-randconfig-c006-20220121 (https://download.01.org/0day-ci/arc=
hive/20220203/202202030245.cjg3G8GS-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project d4baf3=
b1322b84816aa623d8e8cb45a49cb68b84)
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
   fs/hfsplus/super.c:231:2: warning: Value stored to 'error2' is never rea=
d [clang-analyzer-deadcode.DeadStores]
           error2 =3D hfsplus_submit_bio(sb,
           ^        ~~~~~~~~~~~~~~~~~~~~~~
   fs/hfsplus/super.c:231:2: note: Value stored to 'error2' is never read
           error2 =3D hfsplus_submit_bio(sb,
           ^        ~~~~~~~~~~~~~~~~~~~~~~
   fs/hfsplus/super.c:236:3: warning: Value stored to 'error2' is never rea=
d [clang-analyzer-deadcode.DeadStores]
                   error2 =3D error;
                   ^        ~~~~~
   fs/hfsplus/super.c:236:3: note: Value stored to 'error2' is never read
                   error2 =3D error;
                   ^        ~~~~~
   fs/hfsplus/super.c:570:5: warning: Value stored to 'err' is never read [=
clang-analyzer-deadcode.DeadStores]
                                   err =3D 0; /* Operation is not supported=
. */
                                   ^     ~
   fs/hfsplus/super.c:570:5: note: Value stored to 'err' is never read
                                   err =3D 0; /* Operation is not supported=
. */
                                   ^     ~
   Suppressed 15 warnings (8 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (7 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (7 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (7 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (7 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (7 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (7 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (7 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   fs/hfsplus/bnode.c:328:4: warning: Value stored to 'tmp' is never read [=
clang-analyzer-deadcode.DeadStores]
                           tmp =3D hfs_bnode_read_u16(node, key_off);
                           ^
   fs/hfsplus/bnode.c:328:4: note: Value stored to 'tmp' is never read
   Suppressed 15 warnings (8 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   fs/ntfs3/inode.c:372:2: warning: Value stored to 'err' is never read [cl=
ang-analyzer-deadcode.DeadStores]
           err =3D 0;
           ^     ~
   fs/ntfs3/inode.c:372:2: note: Value stored to 'err' is never read
           err =3D 0;
           ^     ~
   Suppressed 14 warnings (7 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   fs/ntfs3/index.c:2463:3: warning: Value stored to 'err' is never read [c=
lang-analyzer-deadcode.DeadStores]
                   err =3D attr_set_size(ni, ATTR_ALLOC, in->name, in->name=
_len,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   fs/ntfs3/index.c:2463:3: note: Value stored to 'err' is never read
                   err =3D attr_set_size(ni, ATTR_ALLOC, in->name, in->name=
_len,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   fs/ntfs3/index.c:2465:3: warning: Value stored to 'err' is never read [c=
lang-analyzer-deadcode.DeadStores]
                   err =3D ni_remove_attr(ni, ATTR_ALLOC, in->name, in->nam=
e_len,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   fs/ntfs3/index.c:2465:3: note: Value stored to 'err' is never read
                   err =3D ni_remove_attr(ni, ATTR_ALLOC, in->name, in->nam=
e_len,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   fs/ntfs3/index.c:2469:3: warning: Value stored to 'err' is never read [c=
lang-analyzer-deadcode.DeadStores]
                   err =3D attr_set_size(ni, ATTR_BITMAP, in->name, in->nam=
e_len,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   fs/ntfs3/index.c:2469:3: note: Value stored to 'err' is never read
                   err =3D attr_set_size(ni, ATTR_BITMAP, in->name, in->nam=
e_len,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   Suppressed 14 warnings (7 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (7 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (7 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (7 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (7 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (8 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (7 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (5 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
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
   Suppressed 13 warnings (6 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (6 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (5 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (6 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (5 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (5 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (5 in non-user code, 7 with check filters).
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
   2 warnings generated.
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
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   drivers/gpio/gpio-bcm-kona.c:285:30: warning: The result of the left shi=
ft is undefined due to shifting by '4294967294', which is greater or equal =
to the width of type 'unsigned long' [clang-analyzer-core.UndefinedBinaryOp=
eratorResult]
                   if (res > 0 && (debounce & BIT(res - 1)))
                                              ^
   include/vdso/bits.h:7:26: note: expanded from macro 'BIT'
   #define BIT(nr)                 (UL(1) << (nr))
                                          ^
   drivers/gpio/gpio-bcm-kona.c:315:6: note: Assuming the condition is false
           if (pinconf_to_config_param(config) !=3D PIN_CONFIG_INPUT_DEBOUN=
CE)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpio-bcm-kona.c:315:2: note: Taking false branch
           if (pinconf_to_config_param(config) !=3D PIN_CONFIG_INPUT_DEBOUN=
CE)
           ^
   drivers/gpio/gpio-bcm-kona.c:319:9: note: Calling 'bcm_kona_gpio_set_deb=
ounce'
           return bcm_kona_gpio_set_debounce(chip, gpio, debounce);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpio-bcm-kona.c:272:7: note: Assuming 'debounce' is > 0
           if ((debounce > 0 && debounce < 1000) || debounce > 128000) {
                ^~~~~~~~~~~~
   drivers/gpio/gpio-bcm-kona.c:272:7: note: Left side of '&&' is true
   drivers/gpio/gpio-bcm-kona.c:272:23: note: Assuming 'debounce' is >=3D 1=
000
           if ((debounce > 0 && debounce < 1000) || debounce > 128000) {
                                ^~~~~~~~~~~~~~~
   drivers/gpio/gpio-bcm-kona.c:272:6: note: Left side of '||' is false
           if ((debounce > 0 && debounce < 1000) || debounce > 128000) {
               ^
   drivers/gpio/gpio-bcm-kona.c:272:43: note: Assuming 'debounce' is <=3D 1=
28000
           if ((debounce > 0 && debounce < 1000) || debounce > 128000) {
                                                    ^~~~~~~~~~~~~~~~~
   drivers/gpio/gpio-bcm-kona.c:272:2: note: Taking false branch
           if ((debounce > 0 && debounce < 1000) || debounce > 128000) {
           ^
   drivers/gpio/gpio-bcm-kona.c:279:6: note: 'debounce' is not equal to 0
           if (debounce !=3D 0) {
               ^~~~~~~~
   drivers/gpio/gpio-bcm-kona.c:279:2: note: Taking true branch
           if (debounce !=3D 0) {
           ^
   drivers/gpio/gpio-bcm-kona.c:285:7: note: 'res' is > 0
                   if (res > 0 && (debounce & BIT(res - 1)))
                       ^~~
   drivers/gpio/gpio-bcm-kona.c:285:7: note: Left side of '&&' is true
   drivers/gpio/gpio-bcm-kona.c:285:30: note: The result of the left shift =
is undefined due to shifting by '4294967294', which is greater or equal to =
the width of type 'unsigned long'
                   if (res > 0 && (debounce & BIT(res - 1)))
                                              ^

vim +33 drivers/soc/imx/imx8m-blk-ctrl.c

2684ac05a8c4d2d Lucas Stach 2021-10-02  32  =

2684ac05a8c4d2d Lucas Stach 2021-10-02 @33  struct imx8m_blk_ctrl_domain_da=
ta {
2684ac05a8c4d2d Lucas Stach 2021-10-02  34  	const char *name;
2684ac05a8c4d2d Lucas Stach 2021-10-02  35  	const char * const *clk_names;
2684ac05a8c4d2d Lucas Stach 2021-10-02  36  	int num_clks;
2684ac05a8c4d2d Lucas Stach 2021-10-02  37  	const char *gpc_name;
2684ac05a8c4d2d Lucas Stach 2021-10-02  38  	u32 rst_mask;
2684ac05a8c4d2d Lucas Stach 2021-10-02  39  	u32 clk_mask;
042b67799e2991e Adam Ford   2021-11-28  40  =

042b67799e2991e Adam Ford   2021-11-28  41  	/*
042b67799e2991e Adam Ford   2021-11-28  42  	 * i.MX8M Mini and Nano have a=
 third DISPLAY_BLK_CTRL register
042b67799e2991e Adam Ford   2021-11-28  43  	 * which is used to control th=
e reset for the MIPI Phy.
042b67799e2991e Adam Ford   2021-11-28  44  	 * Since it's only present in =
certain circumstances,
042b67799e2991e Adam Ford   2021-11-28  45  	 * an if-statement should be u=
sed before setting and clearing this
042b67799e2991e Adam Ford   2021-11-28  46  	 * register.
042b67799e2991e Adam Ford   2021-11-28  47  	 */
042b67799e2991e Adam Ford   2021-11-28  48  	u32 mipi_phy_rst_mask;
2684ac05a8c4d2d Lucas Stach 2021-10-02  49  };
2684ac05a8c4d2d Lucas Stach 2021-10-02  50  =


:::::: The code at line 33 was first introduced by commit
:::::: 2684ac05a8c4d2d5c49e6c11eb6206b30a284813 soc: imx: add i.MX8M blk-ct=
rl driver

:::::: TO: Lucas Stach <l.stach@pengutronix.de>
:::::: CC: Shawn Guo <shawnguo@kernel.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5270826035975998652==--

