Content-Type: multipart/mixed; boundary="===============0816782179136173725=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/mmc/host/litex_mmc.c:436:17: warning: Value stored to 'dev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Sun, 27 Mar 2022 13:55:39 +0800
Message-ID: <202203271355.MFL9vKJ6-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0816782179136173725==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Gabriel Somlo <gsomlo@gmail.com>
CC: Ulf Hansson <ulf.hansson@linaro.org>
CC: Kamil Rakoczy <krakoczy@antmicro.com>
CC: Maciej Dudek <mdudek@internships.antmicro.com>
CC: Paul Mackerras <paulus@ozlabs.org>
CC: Joel Stanley <joel@jms.id.au>
CC: Andy Shevchenko <andy.shevchenko@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   f022814633e1c600507b3a99691b4d624c2813f0
commit: 92e099104729d7284d37bc0f49f8a9d30f3e0521 mmc: Add driver for LiteX'=
s LiteSDCard interface
date:   4 weeks ago
:::::: branch date: 8 hours ago
:::::: commit date: 4 weeks ago
config: riscv-randconfig-c006-20220327 (https://download.01.org/0day-ci/arc=
hive/20220327/202203271355.MFL9vKJ6-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0f6d95=
01cf49ce02937099350d08f20c4af86f3d)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D92e099104729d7284d37bc0f49f8a9d30f3e0521
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 92e099104729d7284d37bc0f49f8a9d30f3e0521
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                   ^
   include/linux/printk.h:392:34: note: expanded from macro '__printk_index=
_emit'
   #define __printk_index_emit(...) do {} while (0)
                                    ^
   drivers/usb/gadget/function/f_fs.c:1703:10: note: Assuming the condition=
 is true
                   BUG_ON(waitqueue_active(&ffs->ev.waitq) ||
                          ^
   include/asm-generic/bug.h:161:45: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                               ^~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   drivers/usb/gadget/function/f_fs.c:1703:43: note: Left side of '||' is t=
rue
                   BUG_ON(waitqueue_active(&ffs->ev.waitq) ||
                                                           ^
   drivers/usb/gadget/function/f_fs.c:1703:3: note: Assuming the condition =
is false
                   BUG_ON(waitqueue_active(&ffs->ev.waitq) ||
                   ^
   include/asm-generic/bug.h:161:36: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                      ^~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:78:22: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/function/f_fs.c:1703:3: note: Taking false branch
                   BUG_ON(waitqueue_active(&ffs->ev.waitq) ||
                   ^
   include/asm-generic/bug.h:161:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                  ^
   drivers/usb/gadget/function/f_fs.c:1703:3: note: Loop condition is false=
.  Exiting loop
                   BUG_ON(waitqueue_active(&ffs->ev.waitq) ||
                   ^
   include/asm-generic/bug.h:161:27: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                             ^
   drivers/usb/gadget/function/f_fs.c:1708:3: note: Memory is released
                   kfree(ffs);
                   ^~~~~~~~~~
   drivers/usb/gadget/function/f_fs.c:1889:3: note: Returning; memory was r=
eleased via 1st parameter
                   ffs_data_put(ffs);
                   ^~~~~~~~~~~~~~~~~
   drivers/usb/gadget/function/f_fs.c:3605:3: note: Returning; memory was r=
eleased via 1st parameter
                   functionfs_unbind(ffs);
                   ^~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/function/f_fs.c:3608:2: note: Calling 'spinlock_check'
           spin_lock_irqsave(&func->ffs->eps_lock, flags);
           ^
   include/linux/spinlock.h:379:24: note: expanded from macro 'spin_lock_ir=
qsave'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:242:34: note: expanded from macro 'raw_spin_loc=
k_irqsave'
                   flags =3D _raw_spin_lock_irqsave(lock);   \
                                                  ^~~~
   include/linux/spinlock.h:324:2: note: Use of memory after it is freed
           return &lock->rlock;
           ^      ~~~~~~~~~~~~
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
   drivers/spi/spi-omap2-mcspi.c:1232:3: warning: Value stored to 'par_over=
ride' is never read [clang-analyzer-deadcode.DeadStores]
                   par_override =3D 0;
                   ^              ~
   drivers/spi/spi-omap2-mcspi.c:1232:3: note: Value stored to 'par_overrid=
e' is never read
                   par_override =3D 0;
                   ^              ~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/spi/spi-ti-qspi.c:864:3: warning: Value stored to 'ret' is never=
 read [clang-analyzer-deadcode.DeadStores]
                   ret =3D 0;
                   ^     ~
   drivers/spi/spi-ti-qspi.c:864:3: note: Value stored to 'ret' is never re=
ad
                   ret =3D 0;
                   ^     ~
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
>> drivers/mmc/host/litex_mmc.c:436:17: warning: Value stored to 'dev' duri=
ng its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D mmc_dev(host->mmc);
                          ^~~
   drivers/mmc/host/litex_mmc.c:436:17: note: Value stored to 'dev' during =
its initialization is never read
           struct device *dev =3D mmc_dev(host->mmc);
                          ^~~
   include/linux/log2.h:57:13: warning: The result of the left shift is und=
efined due to shifting by '32', which is greater or equal to the width of t=
ype 'unsigned long' [clang-analyzer-core.UndefinedBinaryOperatorResult]
           return 1UL << fls_long(n - 1);
                      ^
   drivers/mmc/host/litex_mmc.c:460:6: note: Assuming field 'clock' is not =
equal to field 'sd_clk'
           if (ios->clock !=3D host->sd_clk)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/litex_mmc.c:460:2: note: Taking true branch
           if (ios->clock !=3D host->sd_clk)
           ^
   drivers/mmc/host/litex_mmc.c:461:3: note: Calling 'litex_mmc_setclk'
                   litex_mmc_setclk(host, ios->clock);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/litex_mmc.c:439:8: note: Assuming 'freq' is not equal t=
o 0
           div =3D freq ? host->ref_clk / freq : 256U;
                 ^~~~
   drivers/mmc/host/litex_mmc.c:439:8: note: '?' condition is true
   drivers/mmc/host/litex_mmc.c:440:8: note: '?' condition is false
           div =3D roundup_pow_of_two(div);
                 ^
   include/linux/log2.h:176:2: note: expanded from macro 'roundup_pow_of_tw=
o'
           __builtin_constant_p(n) ? (             \
           ^
   drivers/mmc/host/litex_mmc.c:440:8: note: Calling '__roundup_pow_of_two'
           div =3D roundup_pow_of_two(div);
                 ^
   include/linux/log2.h:180:2: note: expanded from macro 'roundup_pow_of_tw=
o'
           __roundup_pow_of_two(n)                 \
           ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/log2.h:57:16: note: Calling 'fls_long'
           return 1UL << fls_long(n - 1);
                         ^~~~~~~~~~~~~~~
   include/linux/bitops.h:154:2: note: Taking true branch
           if (sizeof(l) =3D=3D 4)
           ^
   include/linux/bitops.h:155:10: note: Calling 'fls'
                   return fls(l);
                          ^~~~~~
   include/asm-generic/bitops/fls.h:15:2: note: 'r' initialized to 32
           int r =3D 32;
           ^~~~~
   include/asm-generic/bitops/fls.h:17:6: note: Assuming 'x' is not equal t=
o 0, which participates in a condition later
           if (!x)
               ^~
   include/asm-generic/bitops/fls.h:17:2: note: Taking false branch
           if (!x)
           ^
   include/asm-generic/bitops/fls.h:19:6: note: Assuming the condition is f=
alse
           if (!(x & 0xffff0000u)) {
               ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/fls.h:19:2: note: Taking false branch
           if (!(x & 0xffff0000u)) {
           ^
   include/asm-generic/bitops/fls.h:23:6: note: Assuming the condition is f=
alse
           if (!(x & 0xff000000u)) {
               ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/fls.h:23:2: note: Taking false branch
           if (!(x & 0xff000000u)) {
           ^
   include/asm-generic/bitops/fls.h:27:6: note: Assuming the condition is f=
alse
           if (!(x & 0xf0000000u)) {
               ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/fls.h:27:2: note: Taking false branch
           if (!(x & 0xf0000000u)) {
           ^
   include/asm-generic/bitops/fls.h:31:6: note: Assuming the condition is f=
alse
           if (!(x & 0xc0000000u)) {
               ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/fls.h:31:2: note: Taking false branch
           if (!(x & 0xc0000000u)) {
           ^
   include/asm-generic/bitops/fls.h:35:6: note: Assuming the condition is f=
alse
           if (!(x & 0x80000000u)) {
               ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/fls.h:35:2: note: Taking false branch
           if (!(x & 0x80000000u)) {
           ^
   include/asm-generic/bitops/fls.h:39:2: note: Returning the value 32 (loa=
ded from 'r')
           return r;
           ^~~~~~~~
   include/linux/bitops.h:155:10: note: Returning from 'fls'
                   return fls(l);
                          ^~~~~~
   include/linux/bitops.h:155:3: note: Returning the value 32
                   return fls(l);
                   ^~~~~~~~~~~~~
   include/linux/log2.h:57:16: note: Returning from 'fls_long'
           return 1UL << fls_long(n - 1);
                         ^~~~~~~~~~~~~~~
   include/linux/log2.h:57:13: note: The result of the left shift is undefi=
ned due to shifting by '32', which is greater or equal to the width of type=
 'unsigned long'
           return 1UL << fls_long(n - 1);
                      ^  ~~~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).

vim +/dev +436 drivers/mmc/host/litex_mmc.c

92e099104729d7 Gabriel Somlo 2022-01-13  433  =

92e099104729d7 Gabriel Somlo 2022-01-13  434  static void litex_mmc_setclk(=
struct litex_mmc_host *host, unsigned int freq)
92e099104729d7 Gabriel Somlo 2022-01-13  435  {
92e099104729d7 Gabriel Somlo 2022-01-13 @436  	struct device *dev =3D mmc_d=
ev(host->mmc);
92e099104729d7 Gabriel Somlo 2022-01-13  437  	u32 div;
92e099104729d7 Gabriel Somlo 2022-01-13  438  =

92e099104729d7 Gabriel Somlo 2022-01-13  439  	div =3D freq ? host->ref_clk=
 / freq : 256U;
92e099104729d7 Gabriel Somlo 2022-01-13  440  	div =3D roundup_pow_of_two(d=
iv);
92e099104729d7 Gabriel Somlo 2022-01-13  441  	div =3D clamp(div, 2U, 256U);
92e099104729d7 Gabriel Somlo 2022-01-13  442  	dev_dbg(dev, "sd_clk_freq=3D=
%d: set to %d via div=3D%d\n",
92e099104729d7 Gabriel Somlo 2022-01-13  443  		freq, host->ref_clk / div, =
div);
92e099104729d7 Gabriel Somlo 2022-01-13  444  	litex_write16(host->sdphy + =
LITEX_PHY_CLOCKERDIV, div);
92e099104729d7 Gabriel Somlo 2022-01-13  445  	host->sd_clk =3D freq;
92e099104729d7 Gabriel Somlo 2022-01-13  446  }
92e099104729d7 Gabriel Somlo 2022-01-13  447  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0816782179136173725==--

