Content-Type: multipart/mixed; boundary="===============3656777868505378788=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/ata/ahci_dm816.c:47:38: warning: Division by zero [clang-analyzer-core.DivideZero]
Date: Tue, 15 Mar 2022 10:36:56 +0800
Message-ID: <202203151020.sbQ6JiM2-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3656777868505378788==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Damien Le Moal <damien.lemoal@opensource.wdc.com>
CC: Hannes Reinecke <hare@suse.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   09688c0166e76ce2fb85e86b9d99be8b0084cdf9
commit: 56e18702b0c240dc3c4fde0619e8a78f5f13be97 ata: ahci_dm816: add compi=
le test support
date:   10 weeks ago
:::::: branch date: 30 hours ago
:::::: commit date: 10 weeks ago
config: arm-randconfig-c002-20220312 (https://download.01.org/0day-ci/archi=
ve/20220315/202203151020.sbQ6JiM2-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 276ca8=
7382b8f16a65bddac700202924228982f6)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D56e18702b0c240dc3c4fde0619e8a78f5f13be97
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 56e18702b0c240dc3c4fde0619e8a78f5f13be97
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                   ^
   mm/memory.c:2557:7: note: Left side of '&&' is true
                   if (!pmd_none(*pmd) && WARN_ON_ONCE(pmd_bad(*pmd))) {
                       ^
   mm/memory.c:2557:26: note: '__ret_do_once' is false
                   if (!pmd_none(*pmd) && WARN_ON_ONCE(pmd_bad(*pmd))) {
                                          ^
   include/asm-generic/bug.h:146:2: note: expanded from macro 'WARN_ON_ONCE'
           DO_ONCE_LITE_IF(condition, WARN_ON, 1)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/once_lite.h:17:16: note: expanded from macro 'DO_ONCE_LITE=
_IF'
                   if (unlikely(__ret_do_once && !__already_done)) {       \
                                ^~~~~~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   mm/memory.c:2557:26: note: Left side of '&&' is false
                   if (!pmd_none(*pmd) && WARN_ON_ONCE(pmd_bad(*pmd))) {
                                          ^
   include/asm-generic/bug.h:146:2: note: expanded from macro 'WARN_ON_ONCE'
           DO_ONCE_LITE_IF(condition, WARN_ON, 1)
           ^
   include/linux/once_lite.h:17:30: note: expanded from macro 'DO_ONCE_LITE=
_IF'
                   if (unlikely(__ret_do_once && !__already_done)) {       \
                                              ^
   mm/memory.c:2557:26: note: Taking false branch
                   if (!pmd_none(*pmd) && WARN_ON_ONCE(pmd_bad(*pmd))) {
                                          ^
   include/asm-generic/bug.h:146:2: note: expanded from macro 'WARN_ON_ONCE'
           DO_ONCE_LITE_IF(condition, WARN_ON, 1)
           ^
   include/linux/once_lite.h:17:3: note: expanded from macro 'DO_ONCE_LITE_=
IF'
                   if (unlikely(__ret_do_once && !__already_done)) {       \
                   ^
   mm/memory.c:2557:3: note: Taking false branch
                   if (!pmd_none(*pmd) && WARN_ON_ONCE(pmd_bad(*pmd))) {
                   ^
   mm/memory.c:2562:9: note: Calling 'apply_to_pte_range'
                   err =3D apply_to_pte_range(mm, pmd, addr, next,
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/memory.c:2497:2: note: 'ptl' declared without an initial value
           spinlock_t *ptl;
           ^~~~~~~~~~~~~~~
   mm/memory.c:2499:6: note: 'create' is false
           if (create) {
               ^~~~~~
   mm/memory.c:2499:2: note: Taking false branch
           if (create) {
           ^
   mm/memory.c:2506:23: note: Assuming the condition is true
                   mapped_pte =3D pte =3D (mm =3D=3D &init_mm) ?
                                       ^~~~~~~~~~~~~~
   mm/memory.c:2506:22: note: '?' condition is true
                   mapped_pte =3D pte =3D (mm =3D=3D &init_mm) ?
                                      ^
   mm/memory.c:2511:2: note: Taking false branch
           BUG_ON(pmd_huge(*pmd));
           ^
   include/asm-generic/bug.h:65:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                  ^
   mm/memory.c:2511:2: note: Loop condition is false.  Exiting loop
           BUG_ON(pmd_huge(*pmd));
           ^
   include/asm-generic/bug.h:65:27: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                             ^
   mm/memory.c:2513:2: note: Loop condition is false.  Exiting loop
           arch_enter_lazy_mmu_mode();
           ^
   include/linux/pgtable.h:977:36: note: expanded from macro 'arch_enter_la=
zy_mmu_mode'
   #define arch_enter_lazy_mmu_mode()      do {} while (0)
                                           ^
   mm/memory.c:2515:6: note: Assuming 'fn' is null
           if (fn) {
               ^~
   mm/memory.c:2515:2: note: Taking false branch
           if (fn) {
           ^
   mm/memory.c:2526:2: note: Loop condition is false.  Exiting loop
           arch_leave_lazy_mmu_mode();
           ^
   include/linux/pgtable.h:978:36: note: expanded from macro 'arch_leave_la=
zy_mmu_mode'
   #define arch_leave_lazy_mmu_mode()      do {} while (0)
                                           ^
   mm/memory.c:2528:6: note: Assuming the condition is true
           if (mm !=3D &init_mm)
               ^~~~~~~~~~~~~~
   mm/memory.c:2528:2: note: Taking true branch
           if (mm !=3D &init_mm)
           ^
   mm/memory.c:2529:3: note: 1st function call argument is an uninitialized=
 value
                   pte_unmap_unlock(mapped_pte, ptl);
                   ^
   include/linux/mm.h:2383:2: note: expanded from macro 'pte_unmap_unlock'
           spin_unlock(ptl);                               \
           ^           ~~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
>> drivers/ata/ahci_dm816.c:47:38: warning: Division by zero [clang-analyze=
r-core.DivideZero]
           pll_multiplier =3D AHCI_DM816_PLL_OUT / (refclk_rate / 100);
                                               ^
   drivers/ata/ahci_dm816.c:148:2: note: Taking false branch
           if (IS_ERR(hpriv))
           ^
   drivers/ata/ahci_dm816.c:152:6: note: Assuming 'rc' is 0
           if (rc)
               ^~
   drivers/ata/ahci_dm816.c:152:2: note: Taking false branch
           if (rc)
           ^
   drivers/ata/ahci_dm816.c:155:7: note: Calling 'ahci_dm816_phy_init'
           rc =3D ahci_dm816_phy_init(hpriv, dev);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ata/ahci_dm816.c:72:6: note: Assuming the condition is false
           if (!hpriv->clks[1]) {
               ^~~~~~~~~~~~~~~
   drivers/ata/ahci_dm816.c:72:2: note: Taking false branch
           if (!hpriv->clks[1]) {
           ^
   drivers/ata/ahci_dm816.c:77:16: note: Calling 'clk_get_rate'
           refclk_rate =3D clk_get_rate(hpriv->clks[1]);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/clk.h:882:2: note: Returning zero
           return 0;
           ^~~~~~~~
   drivers/ata/ahci_dm816.c:77:16: note: Returning from 'clk_get_rate'
           refclk_rate =3D clk_get_rate(hpriv->clks[1]);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ata/ahci_dm816.c:77:2: note: The value 0 is assigned to 'refclk_=
rate'
           refclk_rate =3D clk_get_rate(hpriv->clks[1]);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ata/ahci_dm816.c:78:2: note: Taking false branch
           if ((refclk_rate % 100) !=3D 0) {
           ^
   drivers/ata/ahci_dm816.c:83:32: note: Passing the value 0 via 1st parame=
ter 'refclk_rate'
           mpy =3D ahci_dm816_get_mpy_bits(refclk_rate);
                                         ^~~~~~~~~~~
   drivers/ata/ahci_dm816.c:83:8: note: Calling 'ahci_dm816_get_mpy_bits'
           mpy =3D ahci_dm816_get_mpy_bits(refclk_rate);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ata/ahci_dm816.c:47:38: note: Division by zero
           pll_multiplier =3D AHCI_DM816_PLL_OUT / (refclk_rate / 100);
                                               ^
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   drivers/ata/ahci_imx.c:365:24: warning: The left operand of '>>' is a ga=
rbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           str1 =3D (mpll_test_reg >> 2) & 0x7FF;
                                 ^
   drivers/ata/ahci_imx.c:426:8: note: Calling 'sata_ahci_read_temperature'
           err =3D sata_ahci_read_temperature(dev, &temp);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ata/ahci_imx.c:332:6: note: 'mpll_test_reg' declared without an =
initial value
           u16 mpll_test_reg, rtune_ctl_reg, dac_ctl_reg, read_sum;
               ^~~~~~~~~~~~~
   drivers/ata/ahci_imx.c:343:2: note: Taking false branch
           if ((read_sum & 0xffff) !=3D 0)
           ^
   drivers/ata/ahci_imx.c:348:2: note: Taking true branch
           if ((read_sum & 0xffff) !=3D 0x5A5A)
           ^
   drivers/ata/ahci_imx.c:349:3: note: Left side of '&&' is true
                   dev_err(dev, "Read/Write REG error, 0x%x!\n", read_sum);
                   ^
   include/linux/dev_printk.h:144:2: note: expanded from macro 'dev_err'
           dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##_=
_VA_ARGS__)
           ^
   include/linux/dev_printk.h:109:3: note: expanded from macro 'dev_printk_=
index_wrap'
                   dev_printk_index_emit(level, fmt);                      \
                   ^
   include/linux/dev_printk.h:105:2: note: expanded from macro 'dev_printk_=
index_emit'
           printk_index_subsys_emit("%s %s: ", level, fmt)
           ^
   include/linux/printk.h:417:2: note: expanded from macro 'printk_index_su=
bsys_emit'
           __printk_index_emit(fmt, level, subsys_fmt_prefix)
           ^
   include/linux/printk.h:374:7: note: expanded from macro '__printk_index_=
emit'
                   if (__builtin_constant_p(_fmt) && __builtin_constant_p(_=
level)) { \
                       ^
   drivers/ata/ahci_imx.c:349:3: note: Taking true branch
                   dev_err(dev, "Read/Write REG error, 0x%x!\n", read_sum);
                   ^
   include/linux/dev_printk.h:144:2: note: expanded from macro 'dev_err'
           dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##_=
_VA_ARGS__)
           ^
   include/linux/dev_printk.h:109:3: note: expanded from macro 'dev_printk_=
index_wrap'
                   dev_printk_index_emit(level, fmt);                      \
                   ^
   include/linux/dev_printk.h:105:2: note: expanded from macro 'dev_printk_=
index_emit'
           printk_index_subsys_emit("%s %s: ", level, fmt)
           ^
   include/linux/printk.h:417:2: note: expanded from macro 'printk_index_su=
bsys_emit'
           __printk_index_emit(fmt, level, subsys_fmt_prefix)
           ^
   include/linux/printk.h:374:3: note: expanded from macro '__printk_index_=
emit'
                   if (__builtin_constant_p(_fmt) && __builtin_constant_p(_=
level)) { \
                   ^
   drivers/ata/ahci_imx.c:349:3: note: '?' condition is true
                   dev_err(dev, "Read/Write REG error, 0x%x!\n", read_sum);

vim +47 drivers/ata/ahci_dm816.c

df46e6a4c06c89 Bartosz Golaszewski 2017-03-14  36  =

df46e6a4c06c89 Bartosz Golaszewski 2017-03-14  37  static int ahci_dm816_ge=
t_mpy_bits(unsigned long refclk_rate)
df46e6a4c06c89 Bartosz Golaszewski 2017-03-14  38  {
df46e6a4c06c89 Bartosz Golaszewski 2017-03-14  39  	unsigned long pll_multi=
plier;
df46e6a4c06c89 Bartosz Golaszewski 2017-03-14  40  	int i;
df46e6a4c06c89 Bartosz Golaszewski 2017-03-14  41  =

df46e6a4c06c89 Bartosz Golaszewski 2017-03-14  42  	/*
df46e6a4c06c89 Bartosz Golaszewski 2017-03-14  43  	 * We need to determine=
 the value of the multiplier (MPY) bits.
df46e6a4c06c89 Bartosz Golaszewski 2017-03-14  44  	 * In order to include =
the 8.25 multiplier we need to first divide
df46e6a4c06c89 Bartosz Golaszewski 2017-03-14  45  	 * the refclk rate by 1=
00.
df46e6a4c06c89 Bartosz Golaszewski 2017-03-14  46  	 */
df46e6a4c06c89 Bartosz Golaszewski 2017-03-14 @47  	pll_multiplier =3D AHCI=
_DM816_PLL_OUT / (refclk_rate / 100);
df46e6a4c06c89 Bartosz Golaszewski 2017-03-14  48  =

df46e6a4c06c89 Bartosz Golaszewski 2017-03-14  49  	for (i =3D 0; i < ARRAY=
_SIZE(pll_mpy_table); i++) {
df46e6a4c06c89 Bartosz Golaszewski 2017-03-14  50  		if (pll_mpy_table[i] =
=3D=3D pll_multiplier)
df46e6a4c06c89 Bartosz Golaszewski 2017-03-14  51  			return i;
df46e6a4c06c89 Bartosz Golaszewski 2017-03-14  52  	}
df46e6a4c06c89 Bartosz Golaszewski 2017-03-14  53  =

df46e6a4c06c89 Bartosz Golaszewski 2017-03-14  54  	/*
df46e6a4c06c89 Bartosz Golaszewski 2017-03-14  55  	 * We should have divid=
ed evenly - if not, return an invalid
df46e6a4c06c89 Bartosz Golaszewski 2017-03-14  56  	 * value.
df46e6a4c06c89 Bartosz Golaszewski 2017-03-14  57  	 */
df46e6a4c06c89 Bartosz Golaszewski 2017-03-14  58  	return -1;
df46e6a4c06c89 Bartosz Golaszewski 2017-03-14  59  }
df46e6a4c06c89 Bartosz Golaszewski 2017-03-14  60  =


:::::: The code@line 47 was first introduced by commit
:::::: df46e6a4c06c89a728e59073517001510a63955b ata: ahci: add support for =
DaVinci DM816 SATA controller

:::::: TO: Bartosz Golaszewski <bgolaszewski@baylibre.com>
:::::: CC: Tejun Heo <tj@kernel.org>

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3656777868505378788==--

