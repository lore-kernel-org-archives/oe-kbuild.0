Content-Type: multipart/mixed; boundary="===============1603145221676837247=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/arm/mach-ep93xx/clock.c:154:2: warning: Use of memory after it is freed [clang-analyzer-unix.Malloc]
Date: Sun, 28 Nov 2021 08:02:21 +0800
Message-ID: <202111280749.yGbKIaes-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1603145221676837247==
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
head:   86799cdfbcd2308cbad6c1dc983b81595b77b639
commit: 9645ccc7bd7a16cd73c3be9dee70cd702b03be37 ep93xx: clock: convert in-=
place to COMMON_CLK
date:   5 weeks ago
:::::: branch date: 5 hours ago
:::::: commit date: 5 weeks ago
config: arm-randconfig-c002-20211123 (https://download.01.org/0day-ci/archi=
ve/20211128/202111280749.yGbKIaes-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 49e383=
8145dff1ec91c2e67a2cb562775c8d2a08)
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
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   include/linux/uaccess.h:161:2: note: Taking true branch
           if (unlikely(res))
           ^
   include/linux/uaccess.h:192:7: note: Returning from '_copy_from_user'
                   n =3D _copy_from_user(to, from, n);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/kernel/sys_oabi-compat.c:357:10: note: Returning from 'copy_fro=
m_user'
                   err |=3D copy_from_user(&osb, tsops, sizeof(osb));
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/kernel/sys_oabi-compat.c:355:14: note: Assuming 'i' is < 'nsops'
           for (i =3D 0; i < nsops; i++) {
                       ^~~~~~~~~
   arch/arm/kernel/sys_oabi-compat.c:355:2: note: Loop condition is true.  =
Entering loop body
           for (i =3D 0; i < nsops; i++) {
           ^
   arch/arm/kernel/sys_oabi-compat.c:357:10: note: Calling 'copy_from_user'
                   err |=3D copy_from_user(&osb, tsops, sizeof(osb));
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:191:2: note: Taking true branch
           if (likely(check_copy_size(to, n, false)))
           ^
   include/linux/uaccess.h:192:7: note: Calling '_copy_from_user'
                   n =3D _copy_from_user(to, from, n);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:157:6: note: Left side of '&&' is true
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
               ^
   include/linux/uaccess.h:157:33: note: Assuming the condition is false
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
                                          ^
   include/linux/compiler.h:77:20: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:157:2: note: Taking false branch
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
           ^
   include/linux/uaccess.h:161:2: note: Taking true branch
           if (unlikely(res))
           ^
   include/linux/uaccess.h:192:7: note: Returning from '_copy_from_user'
                   n =3D _copy_from_user(to, from, n);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/kernel/sys_oabi-compat.c:357:10: note: Returning from 'copy_fro=
m_user'
                   err |=3D copy_from_user(&osb, tsops, sizeof(osb));
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/kernel/sys_oabi-compat.c:360:3: note: Uninitialized value store=
d to 'osb.sem_num'
                   sops[i].sem_flg =3D osb.sem_flg;
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/kernel/sys_oabi-compat.c:355:14: note: Assuming 'i' is < 'nsops'
           for (i =3D 0; i < nsops; i++) {
                       ^~~~~~~~~
   arch/arm/kernel/sys_oabi-compat.c:355:2: note: Loop condition is true.  =
Entering loop body
           for (i =3D 0; i < nsops; i++) {
           ^
   arch/arm/kernel/sys_oabi-compat.c:357:10: note: Calling 'copy_from_user'
                   err |=3D copy_from_user(&osb, tsops, sizeof(osb));
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:191:6: note: Assuming the condition is true
           if (likely(check_copy_size(to, n, false)))
               ^
   include/linux/compiler.h:77:38: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                             ^~~~
   include/linux/uaccess.h:191:2: note: Taking false branch
           if (likely(check_copy_size(to, n, false)))
           ^
   include/linux/uaccess.h:193:2: note: Returning without writing to 'to->s=
em_num'
           return n;
           ^
   arch/arm/kernel/sys_oabi-compat.c:357:10: note: Returning from 'copy_fro=
m_user'
                   err |=3D copy_from_user(&osb, tsops, sizeof(osb));
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/kernel/sys_oabi-compat.c:358:19: note: Assigned value is garbag=
e or undefined
                   sops[i].sem_num =3D osb.sem_num;
                                   ^ ~~~~~~~~~~~
   Suppressed 23 warnings (9 in non-user code, 14 with check filters).
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
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
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
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
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
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   security/smack/smackfs.c:1194:3: warning: Value stored to 'm' is never r=
ead [clang-analyzer-deadcode.DeadStores]
                   m =3D BEBITS;
                   ^
   security/smack/smackfs.c:1194:3: note: Value stored to 'm' is never read
   security/smack/smackfs.c:2312:9: warning: 1st function call argument is =
an uninitialized value [clang-analyzer-core.CallAndMessage]
                   res =3D smk_access(rule.smk_subject, rule.smk_object,
                         ^
   security/smack/smackfs.c:2340:9: note: Calling 'smk_user_access'
           return smk_user_access(file, buf, count, ppos, SMK_FIXED24_FMT);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   security/smack/smackfs.c:2297:6: note: Calling 'IS_ERR'
           if (IS_ERR(data))
               ^~~~~~~~~~~~
   include/linux/err.h:36:9: note: Assuming the condition is false
           return IS_ERR_VALUE((unsigned long)ptr);
                  ^
   include/linux/err.h:22:34: note: expanded from macro 'IS_ERR_VALUE'
   #define IS_ERR_VALUE(x) unlikely((unsigned long)(void *)(x) >=3D (unsign=
ed long)-MAX_ERRNO)
                           ~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/err.h:36:2: note: Returning zero, which participates in a =
condition later
           return IS_ERR_VALUE((unsigned long)ptr);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   security/smack/smackfs.c:2297:6: note: Returning from 'IS_ERR'
           if (IS_ERR(data))
               ^~~~~~~~~~~~
   security/smack/smackfs.c:2297:2: note: Taking false branch
           if (IS_ERR(data))
           ^
   security/smack/smackfs.c:2300:6: note: 'format' is equal to SMK_FIXED24_=
FMT
           if (format =3D=3D SMK_FIXED24_FMT) {
               ^~~~~~
   security/smack/smackfs.c:2300:2: note: Taking true branch
           if (format =3D=3D SMK_FIXED24_FMT) {
           ^
   security/smack/smackfs.c:2301:7: note: Assuming the condition is false
                   if (count < SMK_LOADLEN)
                       ^~~~~~~~~~~~~~~~~~~
   security/smack/smackfs.c:2301:3: note: Taking false branch
                   if (count < SMK_LOADLEN)
                   ^
   security/smack/smackfs.c:2303:9: note: Calling 'smk_parse_rule'
                   res =3D smk_parse_rule(data, &rule, 0);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   security/smack/smackfs.c:372:7: note: Calling 'smk_fill_rule'
           rc =3D smk_fill_rule(data, data + SMK_LABELLEN,
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   security/smack/smackfs.c:322:6: note: 'import' is 0
           if (import) {
               ^~~~~~
   security/smack/smackfs.c:322:2: note: Taking false branch
           if (import) {
           ^
   security/smack/smackfs.c:332:3: note: Taking true branch
                   if (IS_ERR(cp))
                   ^
   security/smack/smackfs.c:333:4: note: Returning without writing to 'rule=
->smk_subject'
                           return PTR_ERR(cp);
                           ^
   security/smack/smackfs.c:372:7: note: Returning from 'smk_fill_rule'
           rc =3D smk_fill_rule(data, data + SMK_LABELLEN,
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   security/smack/smackfs.c:375:2: note: Returning without writing to 'rule=
->smk_subject'
           return rc;
           ^
   security/smack/smackfs.c:2303:9: note: Returning from 'smk_parse_rule'
                   res =3D smk_parse_rule(data, &rule, 0);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   security/smack/smackfs.c:2311:6: note: 'res' is >=3D 0
           if (res >=3D 0)
               ^~~
   security/smack/smackfs.c:2311:2: note: Taking true branch
           if (res >=3D 0)
           ^
   security/smack/smackfs.c:2312:9: note: 1st function call argument is an =
uninitialized value
                   res =3D smk_access(rule.smk_subject, rule.smk_object,
                         ^          ~~~~~~~~~~~~~~~~
   security/smack/smackfs.c:2312:9: warning: 2nd function call argument is =
an uninitialized value [clang-analyzer-core.CallAndMessage]
                   res =3D smk_access(rule.smk_subject, rule.smk_object,
                         ^
   security/smack/smackfs.c:2340:9: note: Calling 'smk_user_access'
           return smk_user_access(file, buf, count, ppos, SMK_FIXED24_FMT);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   security/smack/smackfs.c:2297:6: note: Calling 'IS_ERR'
--
           ^
   include/linux/rcupdate.h:587:2: note: expanded from macro 'rcu_dereferen=
ce_protected'
           __rcu_dereference_protected((p), (c), __rcu)
           ^
   include/linux/rcupdate.h:396:2: note: expanded from macro '__rcu_derefer=
ence_protected'
           RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_protected() u=
sage"); \
           ^
   include/linux/rcupdate.h:318:11: note: expanded from macro 'RCU_LOCKDEP_=
WARN'
                   if ((c) && debug_lockdep_rcu_enabled() && !__warned) {  \
                           ^
   security/keys/process_keys.c:78:35: note: Loop condition is false.  Exit=
ing loop
           struct user_namespace *user_ns =3D current_user_ns();
                                            ^
   include/linux/cred.h:395:28: note: expanded from macro 'current_user_ns'
   #define current_user_ns()       (current_cred_xxx(user_ns))
                                    ^
   include/linux/cred.h:378:2: note: expanded from macro 'current_cred_xxx'
           current_cred()->xxx;                    \
           ^
   include/linux/cred.h:299:2: note: expanded from macro 'current_cred'
           rcu_dereference_protected(current->cred, 1)
           ^
   include/linux/rcupdate.h:587:2: note: expanded from macro 'rcu_dereferen=
ce_protected'
           __rcu_dereference_protected((p), (c), __rcu)
           ^
   include/linux/rcupdate.h:396:2: note: expanded from macro '__rcu_derefer=
ence_protected'
           RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_protected() u=
sage"); \
           ^
   include/linux/rcupdate.h:316:2: note: expanded from macro 'RCU_LOCKDEP_W=
ARN'
           do {                                                            \
           ^
   security/keys/process_keys.c:88:2: note: Taking false branch
           kenter("%u", uid);
           ^
   security/keys/internal.h:34:2: note: expanded from macro 'kenter'
           no_printk(KERN_DEBUG "=3D=3D> %s("FMT")\n", __func__, ##__VA_ARG=
S__)
           ^
   include/linux/printk.h:131:2: note: expanded from macro 'no_printk'
           if (0)                                          \
           ^
   security/keys/process_keys.c:91:2: note: Taking true branch
           if (IS_ERR(reg_keyring))
           ^
   security/keys/process_keys.c:92:3: note: Returning without writing to '*=
_user_session_keyring'
                   return PTR_ERR(reg_keyring);
                   ^
   security/keys/process_keys.c:704:9: note: Returning from 'look_up_user_k=
eyrings'
                   ret =3D look_up_user_keyrings(NULL, &key);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   security/keys/process_keys.c:705:7: note: 'ret' is >=3D 0
                   if (ret < 0)
                       ^~~
   security/keys/process_keys.c:705:3: note: Taking false branch
                   if (ret < 0)
                   ^
   security/keys/process_keys.c:707:13: note: 1st function call argument is=
 an uninitialized value
                   key_ref =3D make_key_ref(key, 1);
                             ^            ~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/clk/socfpga/clk-periph.c:69:41: warning: The right operand of '+=
' is a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           periph_clk->hw.reg =3D clk_mgr_base_addr + reg;
                                                  ^
   drivers/clk/socfpga/clk-periph.c:108:2: note: Calling '__socfpga_periph_=
init'
           __socfpga_periph_init(node, &periclk_ops);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/socfpga/clk-periph.c:53:2: note: 'reg' declared without an i=
nitial value
           u32 reg;
           ^~~~~~~
   drivers/clk/socfpga/clk-periph.c:63:2: note: Calling 'of_property_read_u=
32'
           of_property_read_u32(node, "reg", &reg);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/of.h:1256:9: note: Calling 'of_property_read_u32_array'
           return of_property_read_u32_array(np, propname, out_value, 1);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/of.h:752:2: note: Returning without writing to '*out_value=
s'
           return -ENOSYS;
           ^
   include/linux/of.h:1256:9: note: Returning from 'of_property_read_u32_ar=
ray'
           return of_property_read_u32_array(np, propname, out_value, 1);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/of.h:1256:2: note: Returning without writing to '*out_valu=
e'
           return of_property_read_u32_array(np, propname, out_value, 1);
           ^
   drivers/clk/socfpga/clk-periph.c:63:2: note: Returning from 'of_property=
_read_u32'
           of_property_read_u32(node, "reg", &reg);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/socfpga/clk-periph.c:66:14: note: Assuming 'periph_clk' is n=
on-null
           if (WARN_ON(!periph_clk))
                       ^
   include/asm-generic/bug.h:166:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   drivers/clk/socfpga/clk-periph.c:66:2: note: Taking false branch
           if (WARN_ON(!periph_clk))
           ^
   drivers/clk/socfpga/clk-periph.c:69:41: note: The right operand of '+' i=
s a garbage value
           periph_clk->hw.reg =3D clk_mgr_base_addr + reg;
                                                  ^ ~~~
>> drivers/clk/socfpga/clk-periph.c:103:2: warning: Value stored to 'rc' is=
 never read [clang-analyzer-deadcode.DeadStores]
           rc =3D of_clk_add_provider(node, of_clk_src_simple_get, hw_clk);
           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/socfpga/clk-periph.c:103:2: note: Value stored to 'rc' is ne=
ver read
           rc =3D of_clk_add_provider(node, of_clk_src_simple_get, hw_clk);
           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
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
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   lib/assoc_array.c:97:3: warning: Value stored to 'cursor' is never read =
[clang-analyzer-deadcode.DeadStores]
                   cursor =3D parent;
                   ^        ~~~~~~
   lib/assoc_array.c:97:3: note: Value stored to 'cursor' is never read
                   cursor =3D parent;
                   ^        ~~~~~~
   lib/assoc_array.c:409:3: warning: Value stored to 'cursor' is never read=
 [clang-analyzer-deadcode.DeadStores]
                   cursor =3D parent;
                   ^        ~~~~~~
   lib/assoc_array.c:409:3: note: Value stored to 'cursor' is never read
                   cursor =3D parent;
                   ^        ~~~~~~
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
   3 warnings generated.
   drivers/clk/ingenic/cgu.c:512:10: warning: Division by zero [clang-analy=
zer-core.DivideZero]
                   rate =3D DIV_ROUND_UP(parent_rate, div);
                          ^
   include/linux/math.h:36:22: note: expanded from macro 'DIV_ROUND_UP'
   #define DIV_ROUND_UP __KERNEL_DIV_ROUND_UP
                        ^
   include/uapi/linux/const.h:34:54: note: expanded from macro '__KERNEL_DI=
V_ROUND_UP'
   #define __KERNEL_DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
                                        ~~~~~~~~~~~~~~~~^~~~~
   drivers/clk/ingenic/cgu.c:502:36: note: Left side of '&&' is false
           struct ingenic_clk *ingenic_clk =3D to_ingenic_clk(hw);
                                             ^
   drivers/clk/ingenic/cgu.h:210:29: note: expanded from macro 'to_ingenic_=
clk'
   #define to_ingenic_clk(_hw) container_of(_hw, struct ingenic_clk, hw)
                               ^
   include/linux/kernel.h:495:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/clk/ingenic/cgu.c:502:36: note: Taking false branch
           struct ingenic_clk *ingenic_clk =3D to_ingenic_clk(hw);
                                             ^
   drivers/clk/ingenic/cgu.h:210:29: note: expanded from macro 'to_ingenic_=
clk'
   #define to_ingenic_clk(_hw) container_of(_hw, struct ingenic_clk, hw)
                               ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
--
           for (;;) {
           ^
   drivers/gpu/drm/drm_file.c:584:7: note: Assuming the condition is true
                   if (!list_empty(&file_priv->event_list)) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_file.c:584:3: note: Taking true branch
                   if (!list_empty(&file_priv->event_list)) {
                   ^
   drivers/gpu/drm/drm_file.c:585:8: note: Left side of '&&' is false
                           e =3D list_first_entry(&file_priv->event_list,
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
   drivers/gpu/drm/drm_file.c:585:8: note: Taking false branch
                           e =3D list_first_entry(&file_priv->event_list,
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
   drivers/gpu/drm/drm_file.c:585:8: note: Loop condition is false.  Exitin=
g loop
                           e =3D list_first_entry(&file_priv->event_list,
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
   drivers/gpu/drm/drm_file.c:587:30: note: Use of memory after it is freed
                           file_priv->event_space +=3D e->event->length;
                                                     ^~~~~~~~
   Suppressed 9 warnings (9 in non-user code).
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
   4 warnings generated.
>> drivers/clk/socfpga/clk-gate.c:37:10: warning: Although the value stored=
 to 'l4_src' is used in the enclosing expression, the value is never actual=
ly read from 'l4_src' [clang-analyzer-deadcode.DeadStores]
                   return l4_src &=3D 0x1;
                          ^         ~~~
   drivers/clk/socfpga/clk-gate.c:37:10: note: Although the value stored to=
 'l4_src' is used in the enclosing expression, the value is never actually =
read from 'l4_src'
                   return l4_src &=3D 0x1;
                          ^         ~~~
>> drivers/clk/socfpga/clk-gate.c:46:10: warning: Although the value stored=
 to 'perpll_src' is used in the enclosing expression, the value is never ac=
tually read from 'perpll_src' [clang-analyzer-deadcode.DeadStores]
                   return perpll_src &=3D 0x3;
                          ^             ~~~
   drivers/clk/socfpga/clk-gate.c:46:10: note: Although the value stored to=
 'perpll_src' is used in the enclosing expression, the value is never actua=
lly read from 'perpll_src'
                   return perpll_src &=3D 0x3;
                          ^             ~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
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
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
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
   11 warnings generated.
   crypto/testmgr.c:286:8: warning: Excessive padding in 'struct testvec_co=
nfig' (8 padding bytes, where 0 is optimal). =

   Optimal fields order: =

   name, =

   req_flags, =

   iv_offset, =

   key_offset, =

   finalization_type, =

   src_divs, =

   dst_divs, =

   inplace, =

   iv_offset_relative_to_alignmask, =

   key_offset_relative_to_alignmask, =

   nosimd, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct testvec_config {
   ~~~~~~~^~~~~~~~~~~~~~~~
   crypto/testmgr.c:286:8: note: Excessive padding in 'struct testvec_confi=
g' (8 padding bytes, where 0 is optimal). Optimal fields order: name, req_f=
lags, iv_offset, key_offset, finalization_type, src_divs, dst_divs, inplace=
, iv_offset_relative_to_alignmask, key_offset_relative_to_alignmask, nosimd=
, consider reordering the fields or adding explicit padding members
   struct testvec_config {
   ~~~~~~~^~~~~~~~~~~~~~~~
   crypto/testmgr.c:601:25: warning: Access to field 'offset' results in a =
dereference of an undefined pointer value (loaded from field 'div') [clang-=
analyzer-core.NullDereference]
                   unsigned int offset =3D partitions[i].div->offset;
                                         ^
   crypto/testmgr.c:2697:19: note: Assuming 'enc' is 0
           const char *op =3D enc ? "encryption" : "decryption";
                            ^~~
   crypto/testmgr.c:2697:19: note: '?' condition is false
   crypto/testmgr.c:2702:5: note: Assuming field 'iv_offset_relative_to_ali=
gnmask' is false
                    (cfg->iv_offset_relative_to_alignmask ? alignmask : 0);
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/testmgr.c:2702:5: note: '?' condition is false
   crypto/testmgr.c:2707:6: note: Assuming field 'wk' is 0
           if (vec->wk)
               ^~~~~~~
   crypto/testmgr.c:2707:2: note: Taking false branch
           if (vec->wk)
           ^
   crypto/testmgr.c:2712:8: note: 'err' is equal to 0
           err =3D do_setkey(crypto_skcipher_setkey, tfm, vec->key, vec->kl=
en,
                 ^
   crypto/testmgr.c:809:6: note: expanded from macro 'do_setkey'
           if (err =3D=3D 0) {                                             =
    \
               ^~~
   crypto/testmgr.c:2712:8: note: Taking true branch
           err =3D do_setkey(crypto_skcipher_setkey, tfm, vec->key, vec->kl=
en,
                 ^
   crypto/testmgr.c:809:2: note: expanded from macro 'do_setkey'
           if (err =3D=3D 0) {                                             =
    \
           ^
   crypto/testmgr.c:2714:6: note: Assuming 'err' is 0
           if (err) {
               ^~~
   crypto/testmgr.c:2714:2: note: Taking false branch
           if (err) {
           ^
   crypto/testmgr.c:2722:6: note: Assuming field 'setkey_error' is 0
           if (vec->setkey_error) {
               ^~~~~~~~~~~~~~~~~
   crypto/testmgr.c:2722:2: note: Taking false branch
           if (vec->setkey_error) {
           ^
   crypto/testmgr.c:2729:6: note: Assuming 'ivsize' is 0
           if (ivsize) {
               ^~~~~~
   crypto/testmgr.c:2729:2: note: Taking false branch
           if (ivsize) {
           ^
   crypto/testmgr.c:2739:7: note: Assuming field 'generates_iv' is false
                   if (vec->generates_iv) {
                       ^~~~~~~~~~~~~~~~~
   crypto/testmgr.c:2739:3: note: Taking false branch
                   if (vec->generates_iv) {
                   ^
   crypto/testmgr.c:2748:19: note: 'enc' is 0
           input.iov_base =3D enc ? (void *)vec->ptext : (void *)vec->ctext;

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
--===============1603145221676837247==--

