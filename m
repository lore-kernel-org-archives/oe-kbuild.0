Content-Type: multipart/mixed; boundary="===============5020227136943105348=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/arm/mach-ep93xx/clock.c:154:2: warning: Use of memory after it is freed [clang-analyzer-unix.Malloc]
Date: Thu, 16 Dec 2021 14:54:56 +0800
Message-ID: <202112161446.ILUdUWQk-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5020227136943105348==
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
head:   5472f14a37421d1bca3dddf33cabd3bd6dbefbbc
commit: 9645ccc7bd7a16cd73c3be9dee70cd702b03be37 ep93xx: clock: convert in-=
place to COMMON_CLK
date:   8 weeks ago
:::::: branch date: 2 days ago
:::::: commit date: 8 weeks ago
config: arm-randconfig-c002-20211209 (https://download.01.org/0day-ci/archi=
ve/20211216/202112161446.ILUdUWQk-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 097a1c=
b1d5ebb3a0ec4bcaed8ba3ff6a8e33c00a)
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
           ^~~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:55:30: note: expanded from macro '__WRITE_O=
NCE'
           *(volatile typeof(x) *)&(x) =3D (val);                          =
  \
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
   init/initramfs.c:97:11: warning: Access to field 'major' results in a de=
reference of a null pointer (loaded from variable 'q') [clang-analyzer-core=
.NullDereference]
           q->major =3D major;
                    ^
   init/initramfs.c:341:6: note: Assuming the condition is false
           if (strcmp(collected, "TRAILER!!!") =3D=3D 0) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   init/initramfs.c:341:2: note: Taking false branch
           if (strcmp(collected, "TRAILER!!!") =3D=3D 0) {
           ^
   init/initramfs.c:346:6: note: Assuming the condition is true
           if (S_ISREG(mode)) {
               ^
   include/uapi/linux/stat.h:22:21: note: expanded from macro 'S_ISREG'
   #define S_ISREG(m)      (((m) & S_IFMT) =3D=3D S_IFREG)
                            ^~~~~~~~~~~~~~~~~~~~~~~~~
   init/initramfs.c:346:2: note: Taking true branch
           if (S_ISREG(mode)) {
           ^
   init/initramfs.c:347:12: note: Calling 'maybe_link'
                   int ml =3D maybe_link();
                            ^~~~~~~~~~~~
   init/initramfs.c:324:6: note: Assuming 'nlink' is >=3D 2
           if (nlink >=3D 2) {
               ^~~~~~~~~~
   init/initramfs.c:324:2: note: Taking true branch
           if (nlink >=3D 2) {
           ^
   init/initramfs.c:325:15: note: Calling 'find_link'
                   char *old =3D find_link(major, minor, ino, mode, collect=
ed);
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   init/initramfs.c:83:2: note: Loop condition is false. Execution continue=
s on line 94
           for (p =3D head + hash(major, minor, ino); *p; p =3D &(*p)->next=
) {
           ^
   init/initramfs.c:94:6: note: Calling 'kmalloc'
           q =3D kmalloc(sizeof(struct hash), GFP_KERNEL);
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:579:2: note: Taking false branch
           if (__builtin_constant_p(size)) {
           ^
   include/linux/slab.h:596:2: note: Returning pointer
           return __kmalloc(size, flags);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   init/initramfs.c:94:6: note: Returning from 'kmalloc'
           q =3D kmalloc(sizeof(struct hash), GFP_KERNEL);
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   init/initramfs.c:94:2: note: Value assigned to 'q'
           q =3D kmalloc(sizeof(struct hash), GFP_KERNEL);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   init/initramfs.c:95:6: note: Assuming 'q' is null
           if (!q)
               ^~
   init/initramfs.c:95:2: note: Taking true branch
           if (!q)
           ^
   init/initramfs.c:97:11: note: Access to field 'major' results in a deref=
erence of a null pointer (loaded from variable 'q')
           q->major =3D major;
           ~        ^
   init/initramfs.c:101:2: warning: Call to function 'strcpy' is insecure a=
s it does not provide bounding of the memory buffer. Replace unbounded copy=
 functions with analogous functions that support length arguments such as '=
strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(q->name, name);
           ^~~~~~
   init/initramfs.c:101:2: note: Call to function 'strcpy' is insecure as i=
t does not provide bounding of the memory buffer. Replace unbounded copy fu=
nctions with analogous functions that support length arguments such as 'str=
lcpy'. CWE-119
           strcpy(q->name, name);
           ^~~~~~
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
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
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
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
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
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
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
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
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
   9 warnings generated.
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
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
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
   10 warnings generated.
   drivers/clk/actions/owl-pll.c:28:9: warning: Although the value stored t=
o 'mul' is used in the enclosing expression, the value is never actually re=
ad from 'mul' [clang-analyzer-deadcode.DeadStores]
           return mul &=3D mul_mask(pll_hw);
                  ^
   drivers/clk/actions/owl-pll.c:28:9: note: Although the value stored to '=
mul' is used in the enclosing expression, the value is never actually read =
from 'mul'
   Suppressed 9 warnings (8 in non-user code, 1 with check filters).
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
   include/linux/math64.h:92:15: warning: Division by zero [clang-analyzer-=
core.DivideZero]
           *remainder =3D do_div(dividend, divisor);
                        ^
   include/asm-generic/div64.h:235:25: note: expanded from macro 'do_div'
--
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
   drivers/leds/led-core.c:464:9: note: Taking false branch
           } else if (init_data->default_label) {
                  ^
   drivers/leds/led-core.c:471:13: note: Assuming the condition is true
           } else if (is_of_node(fwnode)) {
                      ^~~~~~~~~~~~~~~~~~
   drivers/leds/led-core.c:471:9: note: Taking true branch
           } else if (is_of_node(fwnode)) {
                  ^
   drivers/leds/led-core.c:472:30: note: Assuming the condition is false
                   strscpy(led_classdev_name, to_of_node(fwnode)->name,
                                              ^
   include/linux/of.h:164:3: note: expanded from macro 'to_of_node'
                   is_of_node(__to_of_node_fwnode) ?                       \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/leds/led-core.c:472:30: note: '?' condition is false
                   strscpy(led_classdev_name, to_of_node(fwnode)->name,
                                              ^
   include/linux/of.h:164:3: note: expanded from macro 'to_of_node'
                   is_of_node(__to_of_node_fwnode) ?                       \
                   ^
   drivers/leds/led-core.c:472:30: note: Access to field 'name' results in =
a dereference of a null pointer
                   strscpy(led_classdev_name, to_of_node(fwnode)->name,
                                              ^
   include/linux/of.h:161:2: note: expanded from macro 'to_of_node'
           ({                                                              \
           ^
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
>> drivers/gpu/drm/tegra/fb.c:126:14: warning: Assigned value is garbage or=
 undefined [clang-analyzer-core.uninitialized.Assign]
                   fb->obj[i] =3D &planes[i]->gem;
                              ^
   drivers/gpu/drm/tegra/fb.c:150:14: note: Assuming 'i' is >=3D field 'num=
_planes'
           for (i =3D 0; i < info->num_planes; i++) {
                       ^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/tegra/fb.c:150:2: note: Loop condition is false. Executi=
on continues on line 174
           for (i =3D 0; i < info->num_planes; i++) {
           ^
   drivers/gpu/drm/tegra/fb.c:174:7: note: Calling 'tegra_fb_alloc'
           fb =3D tegra_fb_alloc(drm, cmd, planes, i);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/tegra/fb.c:119:7: note: Calling 'kzalloc'
           fb =3D kzalloc(sizeof(*fb), GFP_KERNEL);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:721:9: note: Calling 'kmalloc'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:579:2: note: Taking false branch
           if (__builtin_constant_p(size)) {
           ^
   include/linux/slab.h:596:2: note: Returning pointer, which participates =
in a condition later
           return __kmalloc(size, flags);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:721:9: note: Returning from 'kmalloc'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:721:2: note: Returning pointer, which participates =
in a condition later
           return kmalloc(size, flags | __GFP_ZERO);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/tegra/fb.c:119:7: note: Returning from 'kzalloc'
           fb =3D kzalloc(sizeof(*fb), GFP_KERNEL);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/tegra/fb.c:120:6: note: Assuming 'fb' is non-null
           if (!fb)
               ^~~
   drivers/gpu/drm/tegra/fb.c:120:2: note: Taking false branch
           if (!fb)
           ^
   drivers/gpu/drm/tegra/fb.c:125:7: note: The value 0 is assigned to 'i'
           for (i =3D 0; i < fb->format->num_planes; i++)
                ^~~~~
   drivers/gpu/drm/tegra/fb.c:125:14: note: Assuming 'i' is < field 'num_pl=
anes'
           for (i =3D 0; i < fb->format->num_planes; i++)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/tegra/fb.c:125:2: note: Loop condition is true.  Enterin=
g loop body
           for (i =3D 0; i < fb->format->num_planes; i++)
           ^
   drivers/gpu/drm/tegra/fb.c:126:14: note: Assigned value is garbage or un=
defined
                   fb->obj[i] =3D &planes[i]->gem;
                              ^ ~~~~~~~~~~~~~~~
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
   drivers/gpu/drm/etnaviv/etnaviv_gem.c:60:21: warning: Value stored to 'd=
ev' during its initialization is never read [clang-analyzer-deadcode.DeadSt=
ores]
           struct drm_device *dev =3D etnaviv_obj->base.dev;
                              ^~~   ~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/etnaviv/etnaviv_gem.c:60:21: note: Value stored to 'dev'=
 during its initialization is never read
           struct drm_device *dev =3D etnaviv_obj->base.dev;
                              ^~~   ~~~~~~~~~~~~~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/gpu/drm/etnaviv/etnaviv_gpu.c:1400:3: warning: Array subscript i=
s undefined [clang-analyzer-core.uninitialized.ArraySubscript]
                   gpu->event[event[2]].sync_point =3D &sync_point_perfmon_=
sample_post;
                   ^          ~~~~~~~~
   drivers/gpu/drm/etnaviv/etnaviv_gpu.c:1344:6: note: Assuming field 'runt=
ime_resumed' is true
           if (!submit->runtime_resumed) {
               ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/etnaviv/etnaviv_gpu.c:1344:2: note: Taking false branch
           if (!submit->runtime_resumed) {
           ^
   drivers/gpu/drm/etnaviv/etnaviv_gpu.c:1360:6: note: Assuming field 'nr_p=
mrs' is 0
           if (submit->nr_pmrs)
               ^~~~~~~~~~~~~~~
   drivers/gpu/drm/etnaviv/etnaviv_gpu.c:1360:2: note: Taking false branch
           if (submit->nr_pmrs)
           ^
   drivers/gpu/drm/etnaviv/etnaviv_gpu.c:1363:8: note: Calling 'event_alloc'
           ret =3D event_alloc(gpu, nr_events, event);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/etnaviv/etnaviv_gpu.c:1158:2: note: Loop condition is tr=
ue.  Entering loop body
           for (i =3D 0; i < nr_events; i++) {
           ^
   drivers/gpu/drm/etnaviv/etnaviv_gpu.c:1163:7: note: Assuming 'ret' is no=
t equal to 0
                   if (!ret) {
                       ^~~~
   drivers/gpu/drm/etnaviv/etnaviv_gpu.c:1163:3: note: Taking false branch
                   if (!ret) {
                   ^
   drivers/gpu/drm/etnaviv/etnaviv_gpu.c:1158:2: note: Loop condition is fa=
lse. Execution continues on line 1172
           for (i =3D 0; i < nr_events; i++) {
--
           usbhs_lock(priv, flags);
           ^
   drivers/usb/renesas_usbhs/common.h:294:26: note: expanded from macro 'us=
bhs_lock'
   #define usbhs_lock(p, f) spin_lock_irqsave(usbhs_priv_to_lock(p), f)
                            ^
   include/linux/spinlock.h:393:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:276:2: note: expanded from macro 'raw_spin_lock=
_irqsave'
           do {                                            \
           ^
   drivers/usb/renesas_usbhs/mod.c:199:2: note: Loop condition is false.  E=
xiting loop
           usbhs_lock(priv, flags);
           ^
   drivers/usb/renesas_usbhs/common.h:294:26: note: expanded from macro 'us=
bhs_lock'
   #define usbhs_lock(p, f) spin_lock_irqsave(usbhs_priv_to_lock(p), f)
                            ^
   include/linux/spinlock.h:391:43: note: expanded from macro 'spin_lock_ir=
qsave'
   #define spin_lock_irqsave(lock, flags)                          \
                                                                   ^
   drivers/usb/renesas_usbhs/mod.c:203:2: note: Taking false branch
           if (usbhs_mod_is_host(priv)) {
           ^
   drivers/usb/renesas_usbhs/mod.c:211:6: note: Assuming 'mod' is null
           if (mod) {
               ^~~
   drivers/usb/renesas_usbhs/mod.c:211:2: note: Taking false branch
           if (mod) {
           ^
   drivers/usb/renesas_usbhs/mod.c:226:6: note: Assuming the condition is t=
rue
           if (priv->irqflags & IRQF_SHARED) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/renesas_usbhs/mod.c:226:2: note: Taking true branch
           if (priv->irqflags & IRQF_SHARED) {
           ^
   drivers/usb/renesas_usbhs/mod.c:227:7: note: Assuming the condition is t=
rue
                   if (!(intenb0 & state->intsts0) &&
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/renesas_usbhs/mod.c:227:7: note: Left side of '&&' is true
   drivers/usb/renesas_usbhs/mod.c:227:7: note: Left side of '&&' is true
   drivers/usb/renesas_usbhs/mod.c:229:7: note: Branch condition evaluates =
to a garbage value
                       !(state->bempsts) &&
                       ^~~~~~~~~~~~~~~~~
   drivers/usb/renesas_usbhs/mod.c:271:3: warning: 3rd function call argume=
nt is an uninitialized value [clang-analyzer-core.CallAndMessage]
                   usbhs_write(priv, BRDYSTS, ~irq_state.brdysts);
                   ^                          ~~~~~~~~~~~~~~~~~~
   drivers/usb/renesas_usbhs/mod.c:247:2: note: Taking false branch
           if (usbhs_status_get_each_irq(priv, &irq_state) < 0)
           ^
   drivers/usb/renesas_usbhs/mod.c:262:2: note: Taking false branch
           if (usbhs_mod_is_host(priv))
           ^
   drivers/usb/renesas_usbhs/mod.c:270:6: note: Assuming the condition is t=
rue
           if (irq_state.intsts0 & BRDY)
               ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/renesas_usbhs/mod.c:270:2: note: Taking true branch
           if (irq_state.intsts0 & BRDY)
           ^
   drivers/usb/renesas_usbhs/mod.c:271:3: note: 3rd function call argument =
is an uninitialized value
                   usbhs_write(priv, BRDYSTS, ~irq_state.brdysts);
                   ^                          ~~~~~~~~~~~~~~~~~~
   drivers/usb/renesas_usbhs/mod.c:272:2: warning: 3rd function call argume=
nt is an uninitialized value [clang-analyzer-core.CallAndMessage]
           usbhs_write(priv, NRDYSTS, ~irq_state.nrdysts);
           ^                          ~~~~~~~~~~~~~~~~~~
   drivers/usb/renesas_usbhs/mod.c:247:2: note: Taking false branch
           if (usbhs_status_get_each_irq(priv, &irq_state) < 0)
           ^
   drivers/usb/renesas_usbhs/mod.c:262:2: note: Taking false branch
           if (usbhs_mod_is_host(priv))
           ^
   drivers/usb/renesas_usbhs/mod.c:270:6: note: Assuming the condition is f=
alse
           if (irq_state.intsts0 & BRDY)
               ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/renesas_usbhs/mod.c:270:2: note: Taking false branch
           if (irq_state.intsts0 & BRDY)
           ^
   drivers/usb/renesas_usbhs/mod.c:272:2: note: 3rd function call argument =
is an uninitialized value
           usbhs_write(priv, NRDYSTS, ~irq_state.nrdysts);
           ^                          ~~~~~~~~~~~~~~~~~~
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
>> drivers/gpu/drm/sun4i/sun4i_tcon.c:1426:2: warning: Value stored to 'id'=
 is never read [clang-analyzer-deadcode.DeadStores]
           id =3D sun4i_tcon_of_get_id_from_port(port);
           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/sun4i/sun4i_tcon.c:1426:2: note: Value stored to 'id' is=
 never read
           id =3D sun4i_tcon_of_get_id_from_port(port);
           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   drivers/gpu/drm/sun4i/sun4i_tv.c:491:3: warning: Call to function 'strcp=
y' is insecure as it does not provide bounding of the memory buffer. Replac=
e unbounded copy functions with analogous functions that support length arg=
uments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strc=
py]
                   strcpy(mode->name, tv_mode->name);
                   ^~~~~~
   drivers/gpu/drm/sun4i/sun4i_tv.c:491:3: note: Call to function 'strcpy' =
is insecure as it does not provide bounding of the memory buffer. Replace u=
nbounded copy functions with analogous functions that support length argume=
nts such as 'strlcpy'. CWE-119
                   strcpy(mode->name, tv_mode->name);
                   ^~~~~~
   Suppressed 9 warnings (8 in non-user code, 1 with check filters).
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
   10 warnings generated.
   drivers/regulator/mt6380-regulator.c:200:6: warning: Assigned value is g=
arbage or undefined [clang-analyzer-core.uninitialized.Assign]
           val <<=3D ffs(info->modeset_mask) - 1;
               ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/mt6380-regulator.c:189:2: note: Control jumps to 'case=
 1:'  at line 193
           switch (mode) {
           ^
   drivers/regulator/mt6380-regulator.c:195:3: note:  Execution continues o=
n line 200
                   break;
                   ^
   drivers/regulator/mt6380-regulator.c:200:6: note: Assigned value is garb=
age or undefined
           val <<=3D ffs(info->modeset_mask) - 1;
               ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/mt6380-regulator.c:220:6: warning: Assigned value is g=
arbage or undefined [clang-analyzer-core.uninitialized.Assign]
           val >>=3D ffs(info->modeset_mask) - 1;
               ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/mt6380-regulator.c:216:6: note: Assuming 'ret' is >=3D=
 0
           if (ret < 0)
               ^~~~~~~
   drivers/regulator/mt6380-regulator.c:216:2: note: Taking false branch
           if (ret < 0)
           ^
   drivers/regulator/mt6380-regulator.c:220:6: note: Assigned value is garb=
age or undefined
           val >>=3D ffs(info->modeset_mask) - 1;
               ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   12 warnings generated.
   drivers/usb/typec/tcpm/tcpm.c:297:8: warning: Excessive padding in 'stru=
ct tcpm_port' (44 padding bytes, where 4 is optimal). =

   Optimal fields order: =

   delayed_runtime, =

   state_machine_timer, =

   vdm_state_machine_timer, =

   enable_frs_timer, =

   send_discover_timer, =

   dev, =

   wq, =

   typec_port, =

   tcpc, =

   role_sw, =

   vconn_role, =

   pwr_role, =

   data_role, =

   pwr_opmode, =

   partner, =

   cc_req, =

   src_rp, =

   cc1, =

   cc2, =

   polarity, =

   port_type, =

--
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/lpass-rx-macro.c:1509:7: note: Taking false branch
           else if (e->reg =3D=3D CDC_RX_RX1_RX_PATH_CFG1)
                ^
   sound/soc/codecs/lpass-rx-macro.c:1513:6: note: Assuming 'val' is 0
           if (val)
               ^~~
   sound/soc/codecs/lpass-rx-macro.c:1513:2: note: Taking false branch
           if (val)
           ^
   sound/soc/codecs/lpass-rx-macro.c:1518:3: note: 2nd function call argume=
nt is an uninitialized value
                   snd_soc_component_update_bits(component, look_ahead_dly_=
reg,
                   ^                                        ~~~~~~~~~~~~~~~=
~~~
   sound/soc/codecs/lpass-rx-macro.c:2224:6: warning: Branch condition eval=
uates to a garbage value [clang-analyzer-core.uninitialized.Branch]
           if (hd2_enable_reg && SND_SOC_DAPM_EVENT_ON(event)) {
               ^
   sound/soc/codecs/lpass-rx-macro.c:2617:2: note: Control jumps to 'case 1=
:'  at line 2618
           switch (event) {
           ^
   sound/soc/codecs/lpass-rx-macro.c:2619:3: note: Calling 'rx_macro_enable=
_interp_clk'
                   rx_macro_enable_interp_clk(component, event, w->shift);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/lpass-rx-macro.c:2513:6: note: Assuming 'interp_idx' is=
 not equal to INTERP_AUX
           if (interp_idx =3D=3D INTERP_AUX)
               ^~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/lpass-rx-macro.c:2513:2: note: Taking false branch
           if (interp_idx =3D=3D INTERP_AUX)
           ^
   sound/soc/codecs/lpass-rx-macro.c:2517:2: note: Taking true branch
           if (SND_SOC_DAPM_EVENT_ON(event)) {
           ^
   sound/soc/codecs/lpass-rx-macro.c:2518:7: note: Assuming the condition i=
s true
                   if (rx->main_clk_users[interp_idx] =3D=3D 0) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/lpass-rx-macro.c:2518:3: note: Taking true branch
                   if (rx->main_clk_users[interp_idx] =3D=3D 0) {
                   ^
   sound/soc/codecs/lpass-rx-macro.c:2527:8: note: Assuming field 'hph_hd2_=
mode' is true
                           if (rx->hph_hd2_mode)
                               ^~~~~~~~~~~~~~~~
   sound/soc/codecs/lpass-rx-macro.c:2527:4: note: Taking true branch
                           if (rx->hph_hd2_mode)
                           ^
   sound/soc/codecs/lpass-rx-macro.c:2528:5: note: Calling 'rx_macro_hd2_co=
ntrol'
                                   rx_macro_hd2_control(component, interp_i=
dx, event);
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~
   sound/soc/codecs/lpass-rx-macro.c:2211:21: note: 'hd2_enable_reg' declar=
ed without an initial value
           u16 hd2_scale_reg, hd2_enable_reg;
                              ^~~~~~~~~~~~~~
   sound/soc/codecs/lpass-rx-macro.c:2213:2: note: 'Default' branch taken. =
Execution continues on line 2224
           switch (interp_idx) {
           ^
   sound/soc/codecs/lpass-rx-macro.c:2224:6: note: Branch condition evaluat=
es to a garbage value
           if (hd2_enable_reg && SND_SOC_DAPM_EVENT_ON(event)) {
               ^~~~~~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   drivers/media/platform/exynos4-is/fimc-capture.c:670:16: warning: Divisi=
on by zero [clang-analyzer-core.DivideZero]
                   align_sz =3D 64/ALIGN(depth, 8);
                                ^
   drivers/media/platform/exynos4-is/fimc-capture.c:1643:6: note: Assuming =
field 'pad' is not equal to FIMC_SD_PAD_SOURCE
           if (sel->pad =3D=3D FIMC_SD_PAD_SOURCE)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/exynos4-is/fimc-capture.c:1643:2: note: Taking fa=
lse branch
           if (sel->pad =3D=3D FIMC_SD_PAD_SOURCE)
           ^
   drivers/media/platform/exynos4-is/fimc-capture.c:1647:2: note: Calling '=
fimc_capture_try_selection'
           fimc_capture_try_selection(ctx, r, V4L2_SEL_TGT_CROP);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/exynos4-is/fimc-capture.c:643:16: note: Assuming =
field 'rotation' is equal to 90
           bool rotate =3D ctx->rotation =3D=3D 90 || ctx->rotation =3D=3D =
270;
                         ^~~~~~~~~~~~~~~~~~~
   drivers/media/platform/exynos4-is/fimc-capture.c:643:36: note: Left side=
 of '||' is true
           bool rotate =3D ctx->rotation =3D=3D 90 || ctx->rotation =3D=3D =
270;
                                             ^
   drivers/media/platform/exynos4-is/fimc-capture.c:653:6: note: Assuming t=
he condition is true
           if (fimc_fmt_is_user_defined(ctx->d_frame.fmt->color)) {
               ^
   drivers/media/platform/exynos4-is/fimc-core.h:112:39: note: expanded fro=
m macro 'fimc_fmt_is_user_defined'
   #define fimc_fmt_is_user_defined(x) (!!((x) & 0x180))
                                         ^~~~~~~~~~~~~~
   drivers/media/platform/exynos4-is/fimc-capture.c:653:2: note: Taking fal=
se branch
           if (fimc_fmt_is_user_defined(ctx->d_frame.fmt->color)) {
           ^
   drivers/media/platform/exynos4-is/fimc-capture.c:659:6: note: 'target' i=
s not equal to V4L2_SEL_TGT_COMPOSE
           if (target =3D=3D V4L2_SEL_TGT_COMPOSE) {
               ^~~~~~
   drivers/media/platform/exynos4-is/fimc-capture.c:659:2: note: Taking fal=
se branch
           if (target =3D=3D V4L2_SEL_TGT_COMPOSE) {
           ^
   drivers/media/platform/exynos4-is/fimc-capture.c:670:16: note: Division =
by zero
                   align_sz =3D 64/ALIGN(depth, 8);
                              ~~^~~~~~~~~~~~~~~~
   drivers/media/platform/exynos4-is/fimc-capture.c:825:3: warning: Value s=
tored to 'ffmt' is never read [clang-analyzer-deadcode.DeadStores]
                   ffmt =3D fimc_capture_try_format(ctx, &tfmt->width, &tfm=
t->height,
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   drivers/media/platform/exynos4-is/fimc-capture.c:825:3: note: Value stor=
ed to 'ffmt' is never read
                   ffmt =3D fimc_capture_try_format(ctx, &tfmt->width, &tfm=
t->height,
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
>> drivers/media/platform/exynos4-is/fimc-capture.c:862:22: warning: Assign=
ed value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
                   fd.entry[i].length =3D plane_fmt[i].sizeimage;
                                      ^
   drivers/media/platform/exynos4-is/fimc-capture.c:1184:2: note: Taking fa=
lse branch
           if (fimc_capture_active(fimc))
           ^
   drivers/media/platform/exynos4-is/fimc-capture.c:1188:6: note: Assuming =
'ret' is >=3D 0
           if (ret < 0)
               ^~~~~~~
   drivers/media/platform/exynos4-is/fimc-capture.c:1188:2: note: Taking fa=
lse branch
           if (ret < 0)
           ^
   drivers/media/platform/exynos4-is/fimc-capture.c:1192:6: note: Assuming =
'sd' is non-null
           if (sd)
               ^~
   drivers/media/platform/exynos4-is/fimc-capture.c:1192:2: note: Taking tr=
ue branch
           if (sd)
           ^
   drivers/media/platform/exynos4-is/fimc-capture.c:1195:6: note: Assuming =
'si' is not equal to NULL
           if (si =3D=3D NULL) {
               ^~~~~~~~~~
   drivers/media/platform/exynos4-is/fimc-capture.c:1195:2: note: Taking fa=
lse branch
           if (si =3D=3D NULL) {
           ^
   drivers/media/platform/exynos4-is/fimc-capture.c:1205:6: note: Assuming =
the condition is false
           if (vc->input =3D=3D GRP_ID_FIMC_IS)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/exynos4-is/fimc-capture.c:1205:2: note: Taking fa=
lse branch
           if (vc->input =3D=3D GRP_ID_FIMC_IS)
           ^
   drivers/media/platform/exynos4-is/fimc-capture.c:1208:6: note: Assuming =
field 'user_subdev_api' is true
           if (vc->user_subdev_api) {
               ^~~~~~~~~~~~~~~~~~~
   drivers/media/platform/exynos4-is/fimc-capture.c:1208:2: note: Taking tr=
ue branch
           if (vc->user_subdev_api) {
           ^
   drivers/media/platform/exynos4-is/fimc-capture.c:1209:9: note: Calling '=
fimc_pipeline_validate'
                   ret =3D fimc_pipeline_validate(fimc);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/exynos4-is/fimc-capture.c:1101:28: note: Left sid=
e of '&&' is false
           struct fimc_pipeline *p =3D to_fimc_pipeline(vc->ve.pipe);
                                     ^
   drivers/media/platform/exynos4-is/media-dev.h:62:31: note: expanded from=
 macro 'to_fimc_pipeline'
   #define to_fimc_pipeline(_ep) container_of(_ep, struct fimc_pipeline, ep)
                                 ^
   include/linux/kernel.h:495:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/media/platform/exynos4-is/fimc-capture.c:1101:28: note: Taking f=
alse branch
           struct fimc_pipeline *p =3D to_fimc_pipeline(vc->ve.pipe);
                                     ^
   drivers/media/platform/exynos4-is/media-dev.h:62:31: note: expanded from=
 macro 'to_fimc_pipeline'
   #define to_fimc_pipeline(_ep) container_of(_ep, struct fimc_pipeline, ep)
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
           ^
   include/linux/compiler_types.h:302:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/media/platform/exynos4-is/fimc-capture.c:1101:28: note: Loop con=
dition is false.  Exiting loop
           struct fimc_pipeline *p =3D to_fimc_pipeline(vc->ve.pipe);
                                     ^
   drivers/media/platform/exynos4-is/media-dev.h:62:31: note: expanded from=
 macro 'to_fimc_pipeline'
   #define to_fimc_pipeline(_ep) container_of(_ep, struct fimc_pipeline, ep)
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
           ^
   include/linux/compiler_types.h:300:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/media/platform/exynos4-is/fimc-capture.c:1105:2: note: Loop cond=
ition is true.  Entering loop body
           while (1) {
           ^
   drivers/media/platform/exynos4-is/fimc-capture.c:1113:15: note: Assuming=
 'i' is < field 'num_pads'
                   for (i =3D 0; i < sd->entity.num_pads; i++) {
                               ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/exynos4-is/fimc-capture.c:1113:3: note: Loop cond=
ition is true.  Entering loop body
                   for (i =3D 0; i < sd->entity.num_pads; i++) {
                   ^
   drivers/media/platform/exynos4-is/fimc-capture.c:1116:8: note: Assuming =
the condition is true
                           if (p->flags & MEDIA_PAD_FL_SINK) {

vim +154 arch/arm/mach-ep93xx/clock.c

ff05c0330b9880f Hartley Sweeten 2009-05-07  125  =

9645ccc7bd7a16c Nikita Shubin   2021-10-18  126  static struct clk_hw *ep93=
xx_clk_register_gate(const char *name,
9645ccc7bd7a16c Nikita Shubin   2021-10-18  127  				    const char *parent=
_name,
9645ccc7bd7a16c Nikita Shubin   2021-10-18  128  				    void __iomem *reg,
9645ccc7bd7a16c Nikita Shubin   2021-10-18  129  				    u8 bit_idx)
9645ccc7bd7a16c Nikita Shubin   2021-10-18  130  {
9645ccc7bd7a16c Nikita Shubin   2021-10-18  131  	struct clk_init_data init;
9645ccc7bd7a16c Nikita Shubin   2021-10-18  132  	struct clk_psc *psc;
9645ccc7bd7a16c Nikita Shubin   2021-10-18  133  	struct clk *clk;
9645ccc7bd7a16c Nikita Shubin   2021-10-18  134  =

9645ccc7bd7a16c Nikita Shubin   2021-10-18  135  	psc =3D kzalloc(sizeof(*p=
sc), GFP_KERNEL);
9645ccc7bd7a16c Nikita Shubin   2021-10-18  136  	if (!psc)
9645ccc7bd7a16c Nikita Shubin   2021-10-18  137  		return ERR_PTR(-ENOMEM);
9645ccc7bd7a16c Nikita Shubin   2021-10-18  138  =

9645ccc7bd7a16c Nikita Shubin   2021-10-18  139  	init.name =3D name;
9645ccc7bd7a16c Nikita Shubin   2021-10-18  140  	init.ops =3D &clk_ep93xx_=
gate_ops;
9645ccc7bd7a16c Nikita Shubin   2021-10-18  141  	init.flags =3D CLK_SET_RA=
TE_PARENT;
9645ccc7bd7a16c Nikita Shubin   2021-10-18  142  	init.parent_names =3D (pa=
rent_name ? &parent_name : NULL);
9645ccc7bd7a16c Nikita Shubin   2021-10-18  143  	init.num_parents =3D (par=
ent_name ? 1 : 0);
9645ccc7bd7a16c Nikita Shubin   2021-10-18  144  =

9645ccc7bd7a16c Nikita Shubin   2021-10-18  145  	psc->reg =3D reg;
9645ccc7bd7a16c Nikita Shubin   2021-10-18  146  	psc->bit_idx =3D bit_idx;
9645ccc7bd7a16c Nikita Shubin   2021-10-18  147  	psc->hw.init =3D &init;
9645ccc7bd7a16c Nikita Shubin   2021-10-18  148  	psc->lock =3D &clk_lock;
9645ccc7bd7a16c Nikita Shubin   2021-10-18  149  =

9645ccc7bd7a16c Nikita Shubin   2021-10-18  150  	clk =3D clk_register(NULL=
, &psc->hw);
9645ccc7bd7a16c Nikita Shubin   2021-10-18  151  	if (IS_ERR(clk))
9645ccc7bd7a16c Nikita Shubin   2021-10-18  152  		kfree(psc);
9645ccc7bd7a16c Nikita Shubin   2021-10-18  153  =

9645ccc7bd7a16c Nikita Shubin   2021-10-18 @154  	return &psc->hw;
ff05c0330b9880f Hartley Sweeten 2009-05-07  155  }
ff05c0330b9880f Hartley Sweeten 2009-05-07  156  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5020227136943105348==--

