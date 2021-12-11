Content-Type: multipart/mixed; boundary="===============1420979678364744506=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/clk/ralink/clk-mt7621.c:50:8: warning: Excessive padding in 'struct mt7621_gate' (11 padding bytes, where 3 is optimal).
Date: Sat, 11 Dec 2021 18:09:53 +0800
Message-ID: <202112111818.tMOXbZlc-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1420979678364744506==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Sergio Paracuellos <sergio.paracuellos@gmail.com>
CC: Stephen Boyd <sboyd@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   6f513529296fd4f696afb4354c46508abe646541
commit: 48df7a26f4700aac8b7e5ab68796daf25c27e062 clk: ralink: add clock dri=
ver for mt7621 SoC
date:   8 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 8 months ago
config: riscv-randconfig-c006-20211210 (https://download.01.org/0day-ci/arc=
hive/20211211/202112111818.tMOXbZlc-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 097a1c=
b1d5ebb3a0ec4bcaed8ba3ff6a8e33c00a)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D48df7a26f4700aac8b7e5ab68796daf25c27e062
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 48df7a26f4700aac8b7e5ab68796daf25c27e062
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   drivers/mfd/wm831x-irq.c:481:7: note: Assuming the condition is false
                   if (!(primary & wm831x_irqs[i].primary))
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mfd/wm831x-irq.c:481:3: note: Taking false branch
                   if (!(primary & wm831x_irqs[i].primary))
                   ^
   drivers/mfd/wm831x-irq.c:488:7: note: Assuming the condition is false
                   if (!read[offset]) {
                       ^~~~~~~~~~~~~
   drivers/mfd/wm831x-irq.c:488:3: note: Taking false branch
                   if (!read[offset]) {
                   ^
   drivers/mfd/wm831x-irq.c:510:7: note: Assuming the condition is false
                   if (*status & wm831x_irqs[i].mask)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mfd/wm831x-irq.c:510:3: note: Taking false branch
                   if (*status & wm831x_irqs[i].mask)
                   ^
   drivers/mfd/wm831x-irq.c:517:7: note: Assuming 'primary' is equal to WM8=
31X_GP_INT
                   if (primary =3D=3D WM831X_GP_INT &&
                       ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mfd/wm831x-irq.c:517:7: note: Left side of '&&' is true
   drivers/mfd/wm831x-irq.c:518:7: note: Assuming the condition is true
                       wm831x->gpio_level_high[i - WM831X_IRQ_GPIO_1]) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mfd/wm831x-irq.c:517:3: note: Taking true branch
                   if (primary =3D=3D WM831X_GP_INT &&
                   ^
   drivers/mfd/wm831x-irq.c:520:19: note: The result of the left shift is u=
ndefined due to shifting by '4294967295', which is greater or equal to the =
width of type 'int'
                           while (ret & 1 << (i - WM831X_IRQ_GPIO_1)) {
                                          ^  ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mfd/wm831x-irq.c:531:21: warning: The result of the left shift i=
s undefined due to shifting by '4294967295', which is greater or equal to t=
he width of type 'int' [clang-analyzer-core.UndefinedBinaryOperatorResult]
                           while (!(ret & 1 << (i - WM831X_IRQ_GPIO_1))) {
                                            ^  ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mfd/wm831x-irq.c:459:6: note: Assuming 'primary' is >=3D 0
           if (primary < 0) {
               ^~~~~~~~~~~
   drivers/mfd/wm831x-irq.c:459:2: note: Taking false branch
           if (primary < 0) {
           ^
   drivers/mfd/wm831x-irq.c:470:6: note: Assuming the condition is false
           if (primary & WM831X_TCHPD_INT)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mfd/wm831x-irq.c:470:2: note: Taking false branch
           if (primary & WM831X_TCHPD_INT)
           ^
   drivers/mfd/wm831x-irq.c:473:6: note: Assuming the condition is false
           if (primary & WM831X_TCHDATA_INT)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mfd/wm831x-irq.c:473:2: note: Taking false branch
           if (primary & WM831X_TCHDATA_INT)
           ^
   drivers/mfd/wm831x-irq.c:478:2: note: Loop condition is true.  Entering =
loop body
           for (i =3D 0; i < ARRAY_SIZE(wm831x_irqs); i++) {
           ^
   drivers/mfd/wm831x-irq.c:481:7: note: Assuming the condition is false
                   if (!(primary & wm831x_irqs[i].primary))
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mfd/wm831x-irq.c:481:3: note: Taking false branch
                   if (!(primary & wm831x_irqs[i].primary))
                   ^
   drivers/mfd/wm831x-irq.c:488:7: note: Assuming the condition is false
                   if (!read[offset]) {
                       ^~~~~~~~~~~~~
   drivers/mfd/wm831x-irq.c:488:3: note: Taking false branch
                   if (!read[offset]) {
                   ^
   drivers/mfd/wm831x-irq.c:510:7: note: Assuming the condition is false
                   if (*status & wm831x_irqs[i].mask)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mfd/wm831x-irq.c:510:3: note: Taking false branch
                   if (*status & wm831x_irqs[i].mask)
                   ^
   drivers/mfd/wm831x-irq.c:517:7: note: Assuming 'primary' is equal to WM8=
31X_GP_INT
                   if (primary =3D=3D WM831X_GP_INT &&
                       ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mfd/wm831x-irq.c:517:7: note: Left side of '&&' is true
   drivers/mfd/wm831x-irq.c:518:7: note: Assuming the condition is false
                       wm831x->gpio_level_high[i - WM831X_IRQ_GPIO_1]) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mfd/wm831x-irq.c:517:3: note: Taking false branch
                   if (primary =3D=3D WM831X_GP_INT &&
                   ^
   drivers/mfd/wm831x-irq.c:528:7: note: 'primary' is equal to WM831X_GP_INT
                   if (primary =3D=3D WM831X_GP_INT &&
                       ^~~~~~~
   drivers/mfd/wm831x-irq.c:528:7: note: Left side of '&&' is true
   drivers/mfd/wm831x-irq.c:529:7: note: Assuming the condition is true
                       wm831x->gpio_level_low[i - WM831X_IRQ_GPIO_1]) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mfd/wm831x-irq.c:528:3: note: Taking true branch
                   if (primary =3D=3D WM831X_GP_INT &&
                   ^
   drivers/mfd/wm831x-irq.c:531:21: note: The result of the left shift is u=
ndefined due to shifting by '4294967295', which is greater or equal to the =
width of type 'int'
                           while (!(ret & 1 << (i - WM831X_IRQ_GPIO_1))) {
                                            ^  ~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
>> drivers/clk/ralink/clk-mt7621.c:50:8: warning: Excessive padding in 'str=
uct mt7621_gate' (11 padding bytes, where 3 is optimal). =

   Optimal fields order: =

   name, =

   parent_name, =

   priv, =

   hw, =

   bit_idx, =

   idx, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct mt7621_gate {
   ~~~~~~~^~~~~~~~~~~~~
   drivers/clk/ralink/clk-mt7621.c:50:8: note: Excessive padding in 'struct=
 mt7621_gate' (11 padding bytes, where 3 is optimal). Optimal fields order:=
 name, parent_name, priv, hw, bit_idx, idx, consider reordering the fields =
or adding explicit padding members
   struct mt7621_gate {
   ~~~~~~~^~~~~~~~~~~~~
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
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   drivers/base/swnode.c:542:9: warning: Assigned value is garbage or undef=
ined [clang-analyzer-core.uninitialized.Assign]
                   nargs =3D nargs_prop_val;
                         ^ ~~~~~~~~~~~~~~
   drivers/base/swnode.c:499:26: note: Calling 'is_software_node'
           struct swnode *swnode =3D to_swnode(fwnode);
                                   ^
   drivers/base/swnode.c:47:3: note: expanded from macro 'to_swnode'
                   is_software_node(__to_swnode_fwnode) ?                  \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/base/swnode.c:39:10: note: Calling 'IS_ERR_OR_NULL'
           return !IS_ERR_OR_NULL(fwnode) && fwnode->ops =3D=3D &software_n=
ode_ops;
                   ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/err.h:41:18: note: Assuming 'ptr' is non-null, which parti=
cipates in a condition later
           return unlikely(!ptr) || IS_ERR_VALUE((unsigned long)ptr);
                           ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/err.h:41:9: note: Left side of '||' is false
           return unlikely(!ptr) || IS_ERR_VALUE((unsigned long)ptr);
                  ^
   include/linux/compiler.h:78:22: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                           ^
   include/linux/err.h:41:27: note: Assuming the condition is false
           return unlikely(!ptr) || IS_ERR_VALUE((unsigned long)ptr);
                                    ^
   include/linux/err.h:22:34: note: expanded from macro 'IS_ERR_VALUE'
   #define IS_ERR_VALUE(x) unlikely((unsigned long)(void *)(x) >=3D (unsign=
ed long)-MAX_ERRNO)
                           ~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   drivers/base/swnode.c:39:10: note: Returning from 'IS_ERR_OR_NULL'
           return !IS_ERR_OR_NULL(fwnode) && fwnode->ops =3D=3D &software_n=
ode_ops;
                   ^~~~~~~~~~~~~~~~~~~~~~
   drivers/base/swnode.c:39:9: note: Left side of '&&' is true
           return !IS_ERR_OR_NULL(fwnode) && fwnode->ops =3D=3D &software_n=
ode_ops;
                  ^
   drivers/base/swnode.c:499:26: note: Returning from 'is_software_node'
           struct swnode *swnode =3D to_swnode(fwnode);
                                   ^
   drivers/base/swnode.c:47:3: note: expanded from macro 'to_swnode'
                   is_software_node(__to_swnode_fwnode) ?                  \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/base/swnode.c:499:26: note: Assuming the condition is true
           struct swnode *swnode =3D to_swnode(fwnode);
                                   ^

vim +50 drivers/clk/ralink/clk-mt7621.c

48df7a26f4700a Sergio Paracuellos 2021-04-10  49  =

48df7a26f4700a Sergio Paracuellos 2021-04-10 @50  struct mt7621_gate {
48df7a26f4700a Sergio Paracuellos 2021-04-10  51  	u8 idx;
48df7a26f4700a Sergio Paracuellos 2021-04-10  52  	const char *name;
48df7a26f4700a Sergio Paracuellos 2021-04-10  53  	const char *parent_name;
48df7a26f4700a Sergio Paracuellos 2021-04-10  54  	struct mt7621_clk_priv *=
priv;
48df7a26f4700a Sergio Paracuellos 2021-04-10  55  	u32 bit_idx;
48df7a26f4700a Sergio Paracuellos 2021-04-10  56  	struct clk_hw hw;
48df7a26f4700a Sergio Paracuellos 2021-04-10  57  };
48df7a26f4700a Sergio Paracuellos 2021-04-10  58  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1420979678364744506==--

