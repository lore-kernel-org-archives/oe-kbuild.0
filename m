Content-Type: multipart/mixed; boundary="===============7258952447448424462=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 4428/6993] drivers/soc/imx/imx8m-blk-ctrl.c:33:8: warning: Excessive padding in 'struct imx8m_blk_ctrl_domain_data' (8 padding bytes, where 0 is optimal).
Date: Wed, 15 Dec 2021 22:03:35 +0800
Message-ID: <202112152151.IWCuLwfK-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7258952447448424462==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Adam Ford <aford173@gmail.com>
CC: Shawn Guo <shawnguo@kernel.org>
CC: Fabio Estevam <festevam@gmail.com>
CC: Lucas Stach <l.stach@pengutronix.de>
CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   0bafb8f3ebc84525d0ae0fcea22d12151b99312f
commit: 042b67799e2991e301df8269e166d8bc5944495e [4428/6993] soc: imx: imx8=
m-blk-ctrl: Fix imx8mm mipi reset
:::::: branch date: 16 hours ago
:::::: commit date: 10 days ago
config: riscv-randconfig-c006-20211213 (https://download.01.org/0day-ci/arc=
hive/20211215/202112152151.IWCuLwfK-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project b6a2dd=
b6c8ac29412b1361810972e15221fa021c)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3D042b67799e2991e301df8269e166d8bc5944495e
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 042b67799e2991e301df8269e166d8bc5944495e
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpiolib-cdev.c:229:3: note: Taking false branch
                   if (copy_from_user(&ghd, ip, sizeof(ghd)))
                   ^
   drivers/gpio/gpiolib-cdev.c:233:15: note: Assuming 'i' is < field 'num_d=
escs'
                   for (i =3D 0; i < lh->num_descs; i++)
                               ^~~~~~~~~~~~~~~~~
   drivers/gpio/gpiolib-cdev.c:233:3: note: Loop condition is true.  Enteri=
ng loop body
                   for (i =3D 0; i < lh->num_descs; i++)
                   ^
   drivers/gpio/gpiolib-cdev.c:234:4: note: Calling '__assign_bit'
                           __assign_bit(i, vals, ghd.values[i]);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitops.h:251:6: note: Assuming 'value' is false
           if (value)
               ^~~~~
   include/linux/bitops.h:251:2: note: Taking false branch
           if (value)
           ^
   include/linux/bitops.h:254:3: note: Calling 'arch___clear_bit'
                   __clear_bit(nr, addr);
                   ^
   include/asm-generic/bitops/non-atomic.h:34:21: note: expanded from macro=
 '__clear_bit'
   #define __clear_bit arch___clear_bit
                       ^
   include/asm-generic/bitops/non-atomic.h:32:5: note: The left expression =
of the compound assignment is an uninitialized value. The computed value wi=
ll also be garbage
           *p &=3D ~mask;
           ~~ ^
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/char/ipmi/ipmb_dev_int.c:150:12: warning: The right operand of '=
<' is a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           if (count < msg[0])
                     ^ ~~~~~~
   drivers/char/ipmi/ipmb_dev_int.c:144:6: note: Assuming the condition is =
false
           if (count > sizeof(msg))
               ^~~~~~~~~~~~~~~~~~~
   drivers/char/ipmi/ipmb_dev_int.c:144:2: note: Taking false branch
           if (count > sizeof(msg))
           ^
   drivers/char/ipmi/ipmb_dev_int.c:147:6: note: Calling 'copy_from_user'
           if (copy_from_user(&msg, buf, count))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:191:13: note: Calling 'check_copy_size'
           if (likely(check_copy_size(to, n, false)))
                      ^
   include/linux/compiler.h:77:40: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                               ^
   include/linux/thread_info.h:207:15: note: Assuming 'sz' is >=3D 0
           if (unlikely(sz >=3D 0 && sz < bytes)) {
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/thread_info.h:207:15: note: Left side of '&&' is true
           if (unlikely(sz >=3D 0 && sz < bytes)) {
                        ^
   include/linux/thread_info.h:207:26: note: Assuming 'sz' is < 'bytes', wh=
ich participates in a condition later
           if (unlikely(sz >=3D 0 && sz < bytes)) {
                                   ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/thread_info.h:207:2: note: Taking true branch
           if (unlikely(sz >=3D 0 && sz < bytes)) {
           ^
   include/linux/thread_info.h:208:3: note: Taking true branch
                   if (!__builtin_constant_p(bytes))
                   ^
   include/linux/uaccess.h:191:13: note: Returning from 'check_copy_size'
           if (likely(check_copy_size(to, n, false)))
                      ^
   include/linux/compiler.h:77:40: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                               ^
   include/linux/uaccess.h:191:2: note: Taking false branch
           if (likely(check_copy_size(to, n, false)))
           ^
   include/linux/uaccess.h:193:2: note: Returning value (loaded from 'n'), =
which participates in a condition later
           return n;
           ^~~~~~~~
   drivers/char/ipmi/ipmb_dev_int.c:147:6: note: Returning from 'copy_from_=
user'
           if (copy_from_user(&msg, buf, count))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/ipmi/ipmb_dev_int.c:147:6: note: Assuming the condition is =
false
           if (copy_from_user(&msg, buf, count))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/ipmi/ipmb_dev_int.c:147:2: note: Taking false branch
           if (copy_from_user(&msg, buf, count))
           ^
   drivers/char/ipmi/ipmb_dev_int.c:150:12: note: The right operand of '<' =
is a garbage value
           if (count < msg[0])
                     ^ ~~~~~~
   Suppressed 8 warnings (7 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
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
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
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
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
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
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
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
   6 warnings generated.
   block/badblocks.c:68:3: warning: Value stored to 'sectors' is never read=
 [clang-analyzer-deadcode.DeadStores]
                   sectors =3D target - s;
                   ^         ~~~~~~~~~~
   block/badblocks.c:68:3: note: Value stored to 'sectors' is never read
                   sectors =3D target - s;
                   ^         ~~~~~~~~~~
   block/badblocks.c:348:3: warning: Value stored to 'sectors' is never rea=
d [clang-analyzer-deadcode.DeadStores]
                   sectors =3D target - s;
                   ^         ~~~~~~~~~~
   block/badblocks.c:348:3: note: Value stored to 'sectors' is never read
                   sectors =3D target - s;
                   ^         ~~~~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   block/partitions/amiga.c:118:19: warning: The left operand of '<' is a g=
arbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
                           if (dostype[3] < ' ')
                               ~~~~~~~~~~ ^
   block/partitions/amiga.c:38:2: note: Loop condition is true.  Entering l=
oop body
           for (blk =3D 0; ; blk++, put_dev_sector(sect)) {
           ^
   block/partitions/amiga.c:39:7: note: 'blk' is not equal to RDB_ALLOCATIO=
N_LIMIT
                   if (blk =3D=3D RDB_ALLOCATION_LIMIT)
                       ^~~
   block/partitions/amiga.c:39:3: note: Taking false branch
                   if (blk =3D=3D RDB_ALLOCATION_LIMIT)
                   ^
   block/partitions/amiga.c:42:7: note: Assuming 'data' is non-null
                   if (!data) {
                       ^~~~~
   block/partitions/amiga.c:42:3: note: Taking false branch
                   if (!data) {

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

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7258952447448424462==--

