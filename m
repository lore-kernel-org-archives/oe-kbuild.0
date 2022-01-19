Content-Type: multipart/mixed; boundary="===============8497069949873910593=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/arm/mach-ep93xx/clock.c:154:2: warning: Use of memory after it is freed [clang-analyzer-unix.Malloc]
Date: Thu, 20 Jan 2022 04:13:25 +0800
Message-ID: <202201200359.lTk9zHg4-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8497069949873910593==
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
head:   1d1df41c5a33359a00e919d54eaebfb789711fdc
commit: 9645ccc7bd7a16cd73c3be9dee70cd702b03be37 ep93xx: clock: convert in-=
place to COMMON_CLK
date:   3 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 3 months ago
config: arm-randconfig-c002-20220118 (https://download.01.org/0day-ci/archi=
ve/20220120/202201200359.lTk9zHg4-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 5f782d=
25a742302d25ef3c8b84b54f7483c2deb9)
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
   security/integrity/ima/ima_api.c:73:4: note: Control jumps to line 81
                           goto out;
                           ^
   security/integrity/ima/ima_api.c:82:2: note: Null pointer value stored t=
o 'entry'
           *entry =3D NULL;
           ^~~~~~~~~~~~~
   security/integrity/ima/ima_api.c:328:11: note: Returning from 'ima_alloc=
_init_template'
           result =3D ima_alloc_init_template(&event_data, &entry, template=
_desc);
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   security/integrity/ima/ima_api.c:329:6: note: Assuming 'result' is >=3D 0
           if (result < 0) {
               ^~~~~~~~~~
   security/integrity/ima/ima_api.c:329:2: note: Taking false branch
           if (result < 0) {
           ^
   security/integrity/ima/ima_api.c:335:30: note: Passing null pointer valu=
e via 1st parameter 'entry'
           result =3D ima_store_template(entry, violation, inode, filename,=
 pcr);
                                       ^~~~~
   security/integrity/ima/ima_api.c:335:11: note: Calling 'ima_store_templa=
te'
           result =3D ima_store_template(entry, violation, inode, filename,=
 pcr);
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   security/integrity/ima/ima_api.c:108:24: note: Access to field 'template=
_desc' results in a dereference of a null pointer (loaded from variable 'en=
try')
           char *template_name =3D entry->template_desc->name;
                                 ^~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   drivers/bus/mhi/core/boot.c:28:17: warning: Value stored to 'dev' during=
 its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D &mhi_cntrl->mhi_dev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/bus/mhi/core/boot.c:28:17: note: Value stored to 'dev' during it=
s initialization is never read
           struct device *dev =3D &mhi_cntrl->mhi_dev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/bus/mhi/core/boot.c:121:3: warning: Value stored to 'ee' is neve=
r read [clang-analyzer-deadcode.DeadStores]
                   ee =3D mhi_get_exec_env(mhi_cntrl);
                   ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/bus/mhi/core/boot.c:121:3: note: Value stored to 'ee' is never r=
ead
                   ee =3D mhi_get_exec_env(mhi_cntrl);
                   ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/bus/mhi/core/boot.c:143:2: warning: Value stored to 'ret' is nev=
er read [clang-analyzer-deadcode.DeadStores]
           ret =3D mhi_read_reg(mhi_cntrl, base, BHIE_RXVECSTATUS_OFFS, &rx=
_status);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   drivers/bus/mhi/core/boot.c:143:2: note: Value stored to 'ret' is never =
read
           ret =3D mhi_read_reg(mhi_cntrl, base, BHIE_RXVECSTATUS_OFFS, &rx=
_status);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   drivers/bus/mhi/core/boot.c:158:17: warning: Value stored to 'dev' durin=
g its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D &mhi_cntrl->mhi_dev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/bus/mhi/core/boot.c:158:17: note: Value stored to 'dev' during i=
ts initialization is never read
           struct device *dev =3D &mhi_cntrl->mhi_dev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/bus/mhi/core/boot.c:183:17: warning: Value stored to 'dev' durin=
g its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D &mhi_cntrl->mhi_dev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/bus/mhi/core/boot.c:183:17: note: Value stored to 'dev' during i=
ts initialization is never read
           struct device *dev =3D &mhi_cntrl->mhi_dev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/phy/phy-core.c:307:2: warning: Value stored to 'ret' is never re=
ad [clang-analyzer-deadcode.DeadStores]
           ret =3D 0; /* Override possible ret =3D=3D -ENOTSUPP */
           ^     ~
   drivers/phy/phy-core.c:307:2: note: Value stored to 'ret' is never read
           ret =3D 0; /* Override possible ret =3D=3D -ENOTSUPP */
           ^     ~
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
   6 warnings generated.
   Suppressed 6 warnings (3 in non-user code, 3 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
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
   5 warnings generated.
   Suppressed 5 warnings (4 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
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
   include/linux/printk.h:392:34: note: expanded from macro '__printk_index=
_emit'
   #define __printk_index_emit(...) do {} while (0)
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
   include/linux/printk.h:392:34: note: expanded from macro '__printk_index=
_emit'
   #define __printk_index_emit(...) do {} while (0)
                                    ^
   arch/arm/mach-ep93xx/clock.c:642:2: note: Calling 'ep93xx_uart_clock_ini=
t'
           ep93xx_uart_clock_init();
           ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/mach-ep93xx/clock.c:479:6: note: Assuming the condition is false
           if (value & EP93XX_SYSCON_PWRCNT_UARTBAUD)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/mach-ep93xx/clock.c:479:2: note: Taking false branch
           if (value & EP93XX_SYSCON_PWRCNT_UARTBAUD)
           ^
   arch/arm/mach-ep93xx/clock.c:487:2: note: Loop condition is true.  Enter=
ing loop body
           for (i =3D 0; i < ARRAY_SIZE(ep93xx_uarts); i++) {
           ^
   arch/arm/mach-ep93xx/clock.c:488:8: note: Calling 'ep93xx_clk_register_g=
ate'
                   hw =3D ep93xx_clk_register_gate(ep93xx_uarts[i].dev_id,
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/mach-ep93xx/clock.c:136:6: note: Assuming 'psc' is non-null
           if (!psc)
               ^~~~
   arch/arm/mach-ep93xx/clock.c:136:2: note: Taking false branch
           if (!psc)
           ^
   arch/arm/mach-ep93xx/clock.c:142:23: note: 'parent_name' is non-null
           init.parent_names =3D (parent_name ? &parent_name : NULL);
                                ^~~~~~~~~~~
   arch/arm/mach-ep93xx/clock.c:142:23: note: '?' condition is true
   arch/arm/mach-ep93xx/clock.c:143:22: note: 'parent_name' is non-null
           init.num_parents =3D (parent_name ? 1 : 0);
                               ^~~~~~~~~~~
   arch/arm/mach-ep93xx/clock.c:143:22: note: '?' condition is true
   arch/arm/mach-ep93xx/clock.c:151:2: note: Taking true branch
           if (IS_ERR(clk))
           ^
   arch/arm/mach-ep93xx/clock.c:152:3: note: Memory is released
                   kfree(psc);
                   ^~~~~~~~~~
   arch/arm/mach-ep93xx/clock.c:154:2: note: Use of memory after it is freed
           return &psc->hw;
           ^      ~~~~~~~~
   arch/arm/mach-ep93xx/clock.c:349:2: warning: Use of memory after it is f=
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
--
   include/linux/printk.h:446:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:417:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:392:34: note: expanded from macro '__printk_index=
_emit'
   #define __printk_index_emit(...) do {} while (0)
                                    ^
   arch/arm/mach-ep93xx/clock.c:686:7: note: Calling 'clk_hw_register_ddiv'
           hw =3D clk_hw_register_ddiv("ep93xx-fb",
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/mach-ep93xx/clock.c:331:6: note: Assuming 'psc' is non-null
           if (!psc)
               ^~~~
   arch/arm/mach-ep93xx/clock.c:331:2: note: Taking false branch
           if (!psc)
           ^
   arch/arm/mach-ep93xx/clock.c:346:2: note: Taking true branch
           if (IS_ERR(clk))
           ^
   arch/arm/mach-ep93xx/clock.c:347:3: note: Memory is released
                   kfree(psc);
                   ^~~~~~~~~~
   arch/arm/mach-ep93xx/clock.c:349:2: note: Use of memory after it is freed
           return &psc->hw;
           ^      ~~~~~~~~
   arch/arm/mach-ep93xx/clock.c:456:2: warning: Use of memory after it is f=
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
   include/linux/printk.h:392:34: note: expanded from macro '__printk_index=
_emit'
   #define __printk_index_emit(...) do {} while (0)
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
   include/linux/printk.h:392:34: note: expanded from macro '__printk_index=
_emit'
   #define __printk_index_emit(...) do {} while (0)
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
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   lib/mpi/mpi-pow.c:164:10: warning: The result of the left shift is undef=
ined due to shifting by '32', which is greater or equal to the width of typ=
e 'mpi_limb_t' [clang-analyzer-core.UndefinedBinaryOperatorResult]
                   e =3D (e << c) << 1;      /* shift the exp bits to the l=
eft, lose msb */
                          ^  ~
   lib/mpi/mpi-pow.c:49:6: note: Assuming 'msize' is not equal to 0
           if (!msize)
               ^~~~~~
   lib/mpi/mpi-pow.c:49:2: note: Taking false branch
           if (!msize)
           ^
   lib/mpi/mpi-pow.c:52:6: note: Assuming 'esize' is not equal to 0
           if (!esize) {
               ^~~~~~
   lib/mpi/mpi-pow.c:52:2: note: Taking false branch
           if (!esize) {
           ^
   lib/mpi/mpi-pow.c:71:6: note: Assuming 'mp' is non-null
           if (!mp)
               ^~~
   lib/mpi/mpi-pow.c:71:2: note: Taking false branch
           if (!mp)
           ^
   lib/mpi/mpi-pow.c:74:6: note: 'mod_shift_cnt' is 32
           if (mod_shift_cnt)
               ^~~~~~~~~~~~~
   lib/mpi/mpi-pow.c:74:2: note: Taking true branch
           if (mod_shift_cnt)
           ^
   lib/mpi/mpi-pow.c:81:6: note: Assuming 'bsize' is <=3D 'msize'
           if (bsize > msize) {    /* The base is larger than the module. R=
educe it. */
               ^~~~~~~~~~~~~
   lib/mpi/mpi-pow.c:81:2: note: Taking false branch
           if (bsize > msize) {    /* The base is larger than the module. R=
educe it. */
           ^
   lib/mpi/mpi-pow.c:98:6: note: Assuming 'bsize' is not equal to 0
           if (!bsize) {
               ^~~~~~
   lib/mpi/mpi-pow.c:98:2: note: Taking false branch
           if (!bsize) {
           ^
   lib/mpi/mpi-pow.c:104:6: note: Assuming 'size' is > field 'alloced'
           if (res->alloced < size) {
               ^~~~~~~~~~~~~~~~~~~
   lib/mpi/mpi-pow.c:104:2: note: Taking true branch
           if (res->alloced < size) {
           ^
   lib/mpi/mpi-pow.c:108:7: note: Assuming 'rp' is not equal to 'ep'
                   if (rp =3D=3D ep || rp =3D=3D mp || rp =3D=3D bp) {
                       ^~~~~~~~
   lib/mpi/mpi-pow.c:108:7: note: Left side of '||' is false
   lib/mpi/mpi-pow.c:108:19: note: Assuming 'rp' is not equal to 'mp'
                   if (rp =3D=3D ep || rp =3D=3D mp || rp =3D=3D bp) {
                                   ^~~~~~~~
   lib/mpi/mpi-pow.c:108:7: note: Left side of '||' is false
                   if (rp =3D=3D ep || rp =3D=3D mp || rp =3D=3D bp) {
                       ^
   lib/mpi/mpi-pow.c:108:31: note: Assuming 'rp' is not equal to 'bp'
                   if (rp =3D=3D ep || rp =3D=3D mp || rp =3D=3D bp) {
                                               ^~~~~~~~
   lib/mpi/mpi-pow.c:108:3: note: Taking false branch
                   if (rp =3D=3D ep || rp =3D=3D mp || rp =3D=3D bp) {
                   ^
   lib/mpi/mpi-pow.c:114:8: note: Assuming the condition is false
                           if (mpi_resize(res, size) < 0)
                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   lib/mpi/mpi-pow.c:114:4: note: Taking false branch
                           if (mpi_resize(res, size) < 0)
                           ^
   lib/mpi/mpi-pow.c:144:2: note: Assuming '_i' is >=3D 'bsize'
           MPN_COPY(rp, bp, bsize);
           ^
   lib/mpi/mpi-internal.h:65:16: note: expanded from macro 'MPN_COPY'
                   for (_i =3D 0; _i < (n); _i++)    \
                                ^~~~~~~~
   lib/mpi/mpi-pow.c:144:2: note: Loop condition is false. Execution contin=
ues on line 144
           MPN_COPY(rp, bp, bsize);
           ^
   lib/mpi/mpi-internal.h:65:3: note: expanded from macro 'MPN_COPY'
                   for (_i =3D 0; _i < (n); _i++)    \
                   ^
   lib/mpi/mpi-pow.c:144:2: note: Loop condition is false.  Exiting loop
           MPN_COPY(rp, bp, bsize);
           ^
   lib/mpi/mpi-internal.h:63:2: note: expanded from macro 'MPN_COPY'

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
--===============8497069949873910593==--

