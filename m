Content-Type: multipart/mixed; boundary="===============0955991234538112711=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/arm/mach-ep93xx/clock.c:154:2: warning: Use of memory after it is freed [clang-analyzer-unix.Malloc]
Date: Sun, 02 Jan 2022 09:50:18 +0800
Message-ID: <202201020954.6w3vdd8s-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0955991234538112711==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Nikita Shubin <nikita.shubin@maquefel.me>
CC: Arnd Bergmann <arnd@arndb.de>
CC: Alexander Sverdlin <alexander.sverdlin@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   278218f6778bc7d6f8b67199446c56cec7ebb841
commit: 9645ccc7bd7a16cd73c3be9dee70cd702b03be37 ep93xx: clock: convert in-=
place to COMMON_CLK
date:   2 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 2 months ago
config: arm-randconfig-c002-20220101 (https://download.01.org/0day-ci/archi=
ve/20220102/202201020954.6w3vdd8s-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project c05440=
2170cd8466683a20385befc0523aba3359)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D9645ccc7bd7a16cd73c3be9dee70cd702b03be37
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 9645ccc7bd7a16cd73c3be9dee70cd702b03be37
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
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
   drivers/dma/ti/omap-dma.c:1521:3: note: Memory is released
                   kfree(c);
                   ^~~~~~~~
   drivers/dma/ti/omap-dma.c:1515:2: note: Loop condition is true.  Enterin=
g loop body
           while (!list_empty(&od->ddev.channels)) {
           ^
   drivers/dma/ti/omap-dma.c:1516:25: note: Left side of '&&' is false
                   struct omap_chan *c =3D list_first_entry(&od->ddev.chann=
els,
                                         ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:495:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/dma/ti/omap-dma.c:1516:25: note: Taking false branch
                   struct omap_chan *c =3D list_first_entry(&od->ddev.chann=
els,
                                         ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
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
   drivers/dma/ti/omap-dma.c:1516:25: note: Loop condition is false.  Exiti=
ng loop
                   struct omap_chan *c =3D list_first_entry(&od->ddev.chann=
els,
                                         ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
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
   drivers/dma/ti/omap-dma.c:1519:3: note: Calling 'list_del'
                   list_del(&c->vc.chan.device_node);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:147:14: note: Use of memory after it is freed
           entry->next =3D LIST_POISON1;
           ~~~~~~~~~~~ ^
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (8 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
>> arch/arm/mach-ep93xx/clock.c:154:2: warning: Use of memory after it is f=
reed [clang-analyzer-unix.Malloc]
           return &psc->hw;
           ^
   arch/arm/mach-ep93xx/clock.c:553:6: note: Assuming the condition is true
           if (!(value & EP93XX_SYSCON_CLKSET1_NBYP1))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/mach-ep93xx/clock.c:553:2: note: Taking true branch
           if (!(value & EP93XX_SYSCON_CLKSET1_NBYP1))
           ^
   arch/arm/mach-ep93xx/clock.c:579:6: note: Assuming the condition is true
           if (!(value & EP93XX_SYSCON_CLKSET2_NBYP2))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/mach-ep93xx/clock.c:579:2: note: Taking true branch
           if (!(value & EP93XX_SYSCON_CLKSET2_NBYP2))
           ^
   arch/arm/mach-ep93xx/clock.c:627:6: note: Assuming the condition is false
           if (ep93xx_chip_revision() < EP93XX_CHIP_REV_E2)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/mach-ep93xx/clock.c:627:2: note: Taking false branch
           if (ep93xx_chip_revision() < EP93XX_CHIP_REV_E2)
           ^
   arch/arm/mach-ep93xx/clock.c:636:2: note: Left side of '&&' is true
           pr_info("PLL1 running at %ld MHz, PLL2 at %ld MHz\n",
           ^
   include/linux/printk.h:519:2: note: expanded from macro 'pr_info'
           printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:446:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:417:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:370:7: note: expanded from macro '__printk_index_=
emit'
                   if (__builtin_constant_p(_fmt) && __builtin_constant_p(_=
level)) { \
                       ^
   arch/arm/mach-ep93xx/clock.c:636:2: note: Taking true branch
           pr_info("PLL1 running at %ld MHz, PLL2 at %ld MHz\n",
           ^
   include/linux/printk.h:519:2: note: expanded from macro 'pr_info'
           printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:446:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:417:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:370:3: note: expanded from macro '__printk_index_=
emit'
                   if (__builtin_constant_p(_fmt) && __builtin_constant_p(_=
level)) { \
                   ^
   arch/arm/mach-ep93xx/clock.c:636:2: note: '?' condition is true
           pr_info("PLL1 running at %ld MHz, PLL2 at %ld MHz\n",
           ^
   include/linux/printk.h:519:2: note: expanded from macro 'pr_info'
           printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:446:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:417:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:379:12: note: expanded from macro '__printk_index=
_emit'
                                   .fmt =3D __builtin_constant_p(_fmt) ? (_=
fmt) : NULL, \
                                          ^
   arch/arm/mach-ep93xx/clock.c:636:2: note: '?' condition is true
           pr_info("PLL1 running at %ld MHz, PLL2 at %ld MHz\n",
           ^
   include/linux/printk.h:519:2: note: expanded from macro 'pr_info'
           printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:446:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:417:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:383:14: note: expanded from macro '__printk_index=
_emit'
                                   .level =3D __builtin_constant_p(_level) =
? (_level) : NULL, \
                                            ^
   arch/arm/mach-ep93xx/clock.c:636:2: note: Loop condition is false.  Exit=
ing loop
           pr_info("PLL1 running at %ld MHz, PLL2@%ld MHz\n",
           ^
   include/linux/printk.h:519:2: note: expanded from macro 'pr_info'
           printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:446:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:417:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:369:2: note: expanded from macro '__printk_index_=
emit'
           do {                                                            \
           ^
   arch/arm/mach-ep93xx/clock.c:638:2: note: Left side of '&&' is true
           pr_info("FCLK %ld MHz, HCLK %ld MHz, PCLK %ld MHz\n",
           ^
   include/linux/printk.h:519:2: note: expanded from macro 'pr_info'
           printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
--
   include/linux/printk.h:369:2: note: expanded from macro '__printk_index_=
emit'
           do {                                                            \
           ^
   arch/arm/mach-ep93xx/clock.c:638:2: note: Left side of '&&' is true
           pr_info("FCLK %ld MHz, HCLK %ld MHz, PCLK %ld MHz\n",
           ^
   include/linux/printk.h:519:2: note: expanded from macro 'pr_info'
           printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:446:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:417:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:370:7: note: expanded from macro '__printk_index_=
emit'
                   if (__builtin_constant_p(_fmt) && __builtin_constant_p(_=
level)) { \
                       ^
   arch/arm/mach-ep93xx/clock.c:638:2: note: Taking true branch
           pr_info("FCLK %ld MHz, HCLK %ld MHz, PCLK %ld MHz\n",
           ^
   include/linux/printk.h:519:2: note: expanded from macro 'pr_info'
           printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:446:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:417:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:370:3: note: expanded from macro '__printk_index_=
emit'
                   if (__builtin_constant_p(_fmt) && __builtin_constant_p(_=
level)) { \
                   ^
   arch/arm/mach-ep93xx/clock.c:638:2: note: '?' condition is true
           pr_info("FCLK %ld MHz, HCLK %ld MHz, PCLK %ld MHz\n",
           ^
   include/linux/printk.h:519:2: note: expanded from macro 'pr_info'
           printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:446:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:417:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:379:12: note: expanded from macro '__printk_index=
_emit'
                                   .fmt =3D __builtin_constant_p(_fmt) ? (_=
fmt) : NULL, \
                                          ^
   arch/arm/mach-ep93xx/clock.c:638:2: note: '?' condition is true
           pr_info("FCLK %ld MHz, HCLK %ld MHz, PCLK %ld MHz\n",
           ^
   include/linux/printk.h:519:2: note: expanded from macro 'pr_info'
           printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:446:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:417:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:383:14: note: expanded from macro '__printk_index=
_emit'
                                   .level =3D __builtin_constant_p(_level) =
? (_level) : NULL, \
                                            ^
   arch/arm/mach-ep93xx/clock.c:638:2: note: Loop condition is false.  Exit=
ing loop
           pr_info("FCLK %ld MHz, HCLK %ld MHz, PCLK %ld MHz\n",
           ^
   include/linux/printk.h:519:2: note: expanded from macro 'pr_info'
           printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:446:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:417:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:369:2: note: expanded from macro '__printk_index_=
emit'
           do {                                                            \
           ^
   arch/arm/mach-ep93xx/clock.c:645:7: note: Calling 'clk_hw_register_div'
           hw =3D clk_hw_register_div("ep93xx-adc",
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/mach-ep93xx/clock.c:434:6: note: Assuming 'psc' is non-null
           if (!psc)
               ^~~~
   arch/arm/mach-ep93xx/clock.c:434:2: note: Taking false branch
           if (!psc)
           ^
   arch/arm/mach-ep93xx/clock.c:440:23: note: 'parent_name' is non-null
           init.parent_names =3D (parent_name ? &parent_name : NULL);
                                ^~~~~~~~~~~
   arch/arm/mach-ep93xx/clock.c:440:23: note: '?' condition is true
   arch/arm/mach-ep93xx/clock.c:453:2: note: Taking true branch
           if (IS_ERR(clk))
           ^
   arch/arm/mach-ep93xx/clock.c:454:3: note: Memory is released
                   kfree(psc);
                   ^~~~~~~~~~
   arch/arm/mach-ep93xx/clock.c:456:2: note: Use of memory after it is freed
           return &psc->hw;
           ^      ~~~~~~~~
>> arch/arm/mach-ep93xx/clock.c:484:2: warning: Value stored to 'hw' is nev=
er read [clang-analyzer-deadcode.DeadStores]
           hw =3D clk_hw_register_fixed_factor(NULL, "uart", "xtali", 0, 1,=
 clk_uart_div);
           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~
   arch/arm/mach-ep93xx/clock.c:484:2: note: Value stored to 'hw' is never =
read
           hw =3D clk_hw_register_fixed_factor(NULL, "uart", "xtali", 0, 1,=
 clk_uart_div);
           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~
   arch/arm/mach-ep93xx/clock.c:612:2: warning: Value stored to 'hw' is nev=
er read [clang-analyzer-deadcode.DeadStores]
           hw =3D clk_hw_register_fixed_factor(NULL, "usb_clk", "pll2", 0, =
1, clk_usb_div);
           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~
   arch/arm/mach-ep93xx/clock.c:612:2: note: Value stored to 'hw' is never =
read
           hw =3D clk_hw_register_fixed_factor(NULL, "usb_clk", "pll2", 0, =
1, clk_usb_div);
           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (2 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
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
   5 warnings generated.
   drivers/pwm/core.c:427:20: warning: Value stored to 'last' during its in=
itialization is never read [clang-analyzer-deadcode.DeadStores]
           struct pwm_state *last =3D &pwm->last;
                             ^~~~   ~~~~~~~~~~
   drivers/pwm/core.c:427:20: note: Value stored to 'last' during its initi=
alization is never read
           struct pwm_state *last =3D &pwm->last;
                             ^~~~   ~~~~~~~~~~
   drivers/pwm/core.c:428:19: warning: Value stored to 'chip' during its in=
itialization is never read [clang-analyzer-deadcode.DeadStores]
           struct pwm_chip *chip =3D pwm->chip;
                            ^~~~   ~~~~~~~~~
   drivers/pwm/core.c:428:19: note: Value stored to 'chip' during its initi=
alization is never read
           struct pwm_chip *chip =3D pwm->chip;
                            ^~~~   ~~~~~~~~~
   drivers/pwm/core.c:816:13: warning: Access to field 'name' results in a =
dereference of a null pointer (loaded from variable 'np') [clang-analyzer-c=
ore.NullDereference]
                           con_id =3D np->name;
                                    ^
   drivers/pwm/core.c:1148:6: note: Assuming the condition is true
           if (is_of_node(fwnode))
               ^~~~~~~~~~~~~~~~~~
   drivers/pwm/core.c:1148:2: note: Taking true branch
           if (is_of_node(fwnode))
           ^
   drivers/pwm/core.c:1149:25: note: Assuming the condition is false
                   pwm =3D of_pwm_get(dev, to_of_node(fwnode), con_id);
                                         ^
   include/linux/of.h:164:3: note: expanded from macro 'to_of_node'
                   is_of_node(__to_of_node_fwnode) ?                       \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pwm/core.c:1149:25: note: '?' condition is false
                   pwm =3D of_pwm_get(dev, to_of_node(fwnode), con_id);
                                         ^
   include/linux/of.h:164:3: note: expanded from macro 'to_of_node'
                   is_of_node(__to_of_node_fwnode) ?                       \
                   ^
   drivers/pwm/core.c:1149:25: note: Passing null pointer value via 2nd par=
ameter 'np'
                   pwm =3D of_pwm_get(dev, to_of_node(fwnode), con_id);
                                         ^
   include/linux/of.h:161:2: note: expanded from macro 'to_of_node'
           ({                                                              \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pwm/core.c:1149:9: note: Calling 'of_pwm_get'
                   pwm =3D of_pwm_get(dev, to_of_node(fwnode), con_id);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pwm/core.c:773:6: note: Assuming 'con_id' is null
           if (con_id) {
               ^~~~~~
   drivers/pwm/core.c:773:2: note: Taking false branch
           if (con_id) {
           ^
   drivers/pwm/core.c:781:6: note: Assuming 'err' is 0
           if (err) {
               ^~~
   drivers/pwm/core.c:781:2: note: Taking false branch
           if (err) {
           ^
   drivers/pwm/core.c:786:25: note: Assuming '__of_fwnode_handle_node' is n=
ull
           pc =3D fwnode_to_pwmchip(of_fwnode_handle(args.np));
                                  ^
   include/linux/of.h:174:3: note: expanded from macro 'of_fwnode_handle'
                   __of_fwnode_handle_node ?                               \
                   ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/pwm/core.c:786:25: note: '?' condition is false
           pc =3D fwnode_to_pwmchip(of_fwnode_handle(args.np));
                                  ^
   include/linux/of.h:174:3: note: expanded from macro 'of_fwnode_handle'
                   __of_fwnode_handle_node ?                               \
                   ^
   drivers/pwm/core.c:787:6: note: Calling 'IS_ERR'
           if (IS_ERR(pc)) {

vim +154 arch/arm/mach-ep93xx/clock.c

ff05c0330b9880 Hartley Sweeten 2009-05-07  125  =

9645ccc7bd7a16 Nikita Shubin   2021-10-18  126  static struct clk_hw *ep93x=
x_clk_register_gate(const char *name,
9645ccc7bd7a16 Nikita Shubin   2021-10-18  127  				    const char *parent_=
name,
9645ccc7bd7a16 Nikita Shubin   2021-10-18  128  				    void __iomem *reg,
9645ccc7bd7a16 Nikita Shubin   2021-10-18  129  				    u8 bit_idx)
9645ccc7bd7a16 Nikita Shubin   2021-10-18  130  {
9645ccc7bd7a16 Nikita Shubin   2021-10-18  131  	struct clk_init_data init;
9645ccc7bd7a16 Nikita Shubin   2021-10-18  132  	struct clk_psc *psc;
9645ccc7bd7a16 Nikita Shubin   2021-10-18  133  	struct clk *clk;
9645ccc7bd7a16 Nikita Shubin   2021-10-18  134  =

9645ccc7bd7a16 Nikita Shubin   2021-10-18  135  	psc =3D kzalloc(sizeof(*ps=
c), GFP_KERNEL);
9645ccc7bd7a16 Nikita Shubin   2021-10-18  136  	if (!psc)
9645ccc7bd7a16 Nikita Shubin   2021-10-18  137  		return ERR_PTR(-ENOMEM);
9645ccc7bd7a16 Nikita Shubin   2021-10-18  138  =

9645ccc7bd7a16 Nikita Shubin   2021-10-18  139  	init.name =3D name;
9645ccc7bd7a16 Nikita Shubin   2021-10-18  140  	init.ops =3D &clk_ep93xx_g=
ate_ops;
9645ccc7bd7a16 Nikita Shubin   2021-10-18  141  	init.flags =3D CLK_SET_RAT=
E_PARENT;
9645ccc7bd7a16 Nikita Shubin   2021-10-18  142  	init.parent_names =3D (par=
ent_name ? &parent_name : NULL);
9645ccc7bd7a16 Nikita Shubin   2021-10-18  143  	init.num_parents =3D (pare=
nt_name ? 1 : 0);
9645ccc7bd7a16 Nikita Shubin   2021-10-18  144  =

9645ccc7bd7a16 Nikita Shubin   2021-10-18  145  	psc->reg =3D reg;
9645ccc7bd7a16 Nikita Shubin   2021-10-18  146  	psc->bit_idx =3D bit_idx;
9645ccc7bd7a16 Nikita Shubin   2021-10-18  147  	psc->hw.init =3D &init;
9645ccc7bd7a16 Nikita Shubin   2021-10-18  148  	psc->lock =3D &clk_lock;
9645ccc7bd7a16 Nikita Shubin   2021-10-18  149  =

9645ccc7bd7a16 Nikita Shubin   2021-10-18  150  	clk =3D clk_register(NULL,=
 &psc->hw);
9645ccc7bd7a16 Nikita Shubin   2021-10-18  151  	if (IS_ERR(clk))
9645ccc7bd7a16 Nikita Shubin   2021-10-18  152  		kfree(psc);
9645ccc7bd7a16 Nikita Shubin   2021-10-18  153  =

9645ccc7bd7a16 Nikita Shubin   2021-10-18 @154  	return &psc->hw;
ff05c0330b9880 Hartley Sweeten 2009-05-07  155  }
ff05c0330b9880 Hartley Sweeten 2009-05-07  156  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0955991234538112711==--

