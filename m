Content-Type: multipart/mixed; boundary="===============6858668224882111471=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpio/gpio-rockchip.c:201:53: warning: Division by zero [clang-analyzer-core.DivideZero]
Date: Mon, 21 Mar 2022 14:57:20 +0800
Message-ID: <202203211417.w5bsTTg6-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6858668224882111471==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Jianqun Xu <jay.xu@rock-chips.com>
CC: Linus Walleij <linus.walleij@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   f443e374ae131c168a065ea1748feac6b2e76613
commit: 3bcbd1a85b68e5f864029fd6f0bb0bcc8e2f1082 gpio/rockchip: support nex=
t version gpio controller
date:   7 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 7 months ago
config: arm-randconfig-c002-20220312 (https://download.01.org/0day-ci/archi=
ve/20220321/202203211417.w5bsTTg6-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 276ca8=
7382b8f16a65bddac700202924228982f6)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D3bcbd1a85b68e5f864029fd6f0bb0bcc8e2f1082
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 3bcbd1a85b68e5f864029fd6f0bb0bcc8e2f1082
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   8 warnings generated.
   block/partitions/acorn.c:285:4: warning: Value stored to 'slot' is never=
 read [clang-analyzer-deadcode.DeadStores]
                           slot =3D riscix_partition(state, start_sect, slo=
t,
                           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   block/partitions/acorn.c:285:4: note: Value stored to 'slot' is never re=
ad
                           slot =3D riscix_partition(state, start_sect, slo=
t,
                           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   block/partitions/acorn.c:291:4: warning: Value stored to 'slot' is never=
 read [clang-analyzer-deadcode.DeadStores]
                           slot =3D linux_partition(state, start_sect, slot,
                           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   block/partitions/acorn.c:291:4: note: Value stored to 'slot' is never re=
ad
                           slot =3D linux_partition(state, start_sect, slot,
                           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   drivers/misc/cardreader/rtsx_pcr.c:1254:7: warning: The left expression =
of the compound assignment is an uninitialized value. The computed value wi=
ll also be garbage [clang-analyzer-core.uninitialized.Assign]
                   val &=3D ~(1<<9);
                   ~~~ ^
   drivers/misc/cardreader/rtsx_pcr.c:1250:2: note: 'val' declared without =
an initial value
           u16 val;
           ^~~~~~~
   drivers/misc/cardreader/rtsx_pcr.c:1252:7: note: Assuming field 'device'=
 is not equal to PID_525A
           if ((PCI_PID(pcr) !=3D PID_525A) && (PCI_PID(pcr) !=3D PID_5260)=
) {
                ^
   include/linux/rtsx_pci.h:1277:24: note: expanded from macro 'PCI_PID'
   #define PCI_PID(pcr)                    ((pcr)->pci->device)
                                           ^
   drivers/misc/cardreader/rtsx_pcr.c:1252:6: note: Left side of '&&' is tr=
ue
           if ((PCI_PID(pcr) !=3D PID_525A) && (PCI_PID(pcr) !=3D PID_5260)=
) {
               ^
   drivers/misc/cardreader/rtsx_pcr.c:1252:37: note: Assuming field 'device=
' is not equal to PID_5260
           if ((PCI_PID(pcr) !=3D PID_525A) && (PCI_PID(pcr) !=3D PID_5260)=
) {
                                              ^
   include/linux/rtsx_pci.h:1277:24: note: expanded from macro 'PCI_PID'
   #define PCI_PID(pcr)                    ((pcr)->pci->device)
                                           ^
   drivers/misc/cardreader/rtsx_pcr.c:1252:2: note: Taking true branch
           if ((PCI_PID(pcr) !=3D PID_525A) && (PCI_PID(pcr) !=3D PID_5260)=
) {
           ^
   drivers/misc/cardreader/rtsx_pcr.c:1253:3: note: Calling 'rtsx_pci_read_=
phy_register'
                   rtsx_pci_read_phy_register(pcr, 0x01, &val);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/cardreader/rtsx_pcr.c:291:6: note: Assuming field 'read_phy=
' is null
           if (pcr->ops->read_phy)
               ^~~~~~~~~~~~~~~~~~
   drivers/misc/cardreader/rtsx_pcr.c:291:2: note: Taking false branch
           if (pcr->ops->read_phy)
           ^
   drivers/misc/cardreader/rtsx_pcr.c:294:9: note: Calling '__rtsx_pci_read=
_phy_register'
           return __rtsx_pci_read_phy_register(pcr, addr, val);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/cardreader/rtsx_pcr.c:265:2: note: Loop condition is true. =
 Entering loop body
           for (i =3D 0; i < 100000; i++) {
           ^
   drivers/misc/cardreader/rtsx_pcr.c:267:7: note: Assuming 'err' is < 0
                   if (err < 0)
                       ^~~~~~~
   drivers/misc/cardreader/rtsx_pcr.c:267:3: note: Taking true branch
                   if (err < 0)
                   ^
   drivers/misc/cardreader/rtsx_pcr.c:268:4: note: Returning without writin=
g to '*val'
                           return err;
                           ^
   drivers/misc/cardreader/rtsx_pcr.c:294:9: note: Returning from '__rtsx_p=
ci_read_phy_register'
           return __rtsx_pci_read_phy_register(pcr, addr, val);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/cardreader/rtsx_pcr.c:294:2: note: Returning without writin=
g to '*'
           return __rtsx_pci_read_phy_register(pcr, addr, val);
           ^
   drivers/misc/cardreader/rtsx_pcr.c:1253:3: note: Returning from 'rtsx_pc=
i_read_phy_register'
                   rtsx_pci_read_phy_register(pcr, 0x01, &val);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/cardreader/rtsx_pcr.c:1254:7: note: The left expression of =
the compound assignment is an uninitialized value. The computed value will =
also be garbage
                   val &=3D ~(1<<9);
                   ~~~ ^
   drivers/misc/cardreader/rtsx_pcr.c:1305:3: warning: Value stored to 'err=
' is never read [clang-analyzer-deadcode.DeadStores]
                   err =3D rtsx_pci_write_register(pcr, RTS5261_FW_CFG1,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/cardreader/rtsx_pcr.c:1305:3: note: Value stored to 'err' i=
s never read
                   err =3D rtsx_pci_write_register(pcr, RTS5261_FW_CFG1,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
>> drivers/gpio/gpio-rockchip.c:201:53: warning: Division by zero [clang-an=
alyzer-core.DivideZero]
                   max_debounce =3D (GENMASK(23, 0) + 1) * 2 * 1000000 / fr=
eq;
                                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
   drivers/gpio/gpio-rockchip.c:198:7: note: Calling 'IS_ERR'
           if (!IS_ERR(bank->db_clk)) {
                ^~~~~~~~~~~~~~~~~~~~
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
   drivers/gpio/gpio-rockchip.c:198:7: note: Returning from 'IS_ERR'
           if (!IS_ERR(bank->db_clk)) {
                ^~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpio-rockchip.c:198:2: note: Taking true branch
           if (!IS_ERR(bank->db_clk)) {
           ^
   drivers/gpio/gpio-rockchip.c:200:10: note: Calling 'clk_get_rate'
                   freq =3D clk_get_rate(bank->db_clk);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/clk.h:882:2: note: Returning zero
           return 0;
           ^~~~~~~~
   drivers/gpio/gpio-rockchip.c:200:10: note: Returning from 'clk_get_rate'
                   freq =3D clk_get_rate(bank->db_clk);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpio-rockchip.c:200:3: note: The value 0 is assigned to 'fr=
eq'
                   freq =3D clk_get_rate(bank->db_clk);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpio-rockchip.c:201:53: note: Division by zero
                   max_debounce =3D (GENMASK(23, 0) + 1) * 2 * 1000000 / fr=
eq;
                                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
   10 warnings generated.
   drivers/scsi/mvumi.c:516:2: warning: Value stored to 'ob_write' is never=
 read [clang-analyzer-deadcode.DeadStores]
           ob_write =3D ioread32(regs->outb_read_pointer);
           ^
   drivers/scsi/mvumi.c:516:2: note: Value stored to 'ob_write' is never re=
ad
   drivers/scsi/mvumi.c:863:3: warning: Value stored to 'hs_page3' is never=
 read [clang-analyzer-deadcode.DeadStores]
                   hs_page3 =3D (struct mvumi_hs_page3 *) hs_header;
                   ^          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/mvumi.c:863:3: note: Value stored to 'hs_page3' is never re=
ad
                   hs_page3 =3D (struct mvumi_hs_page3 *) hs_header;
                   ^          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:135:13: warning: Use of memory after it is freed [c=
lang-analyzer-unix.Malloc]
           __list_del(entry->prev, entry->next);
                      ^
   drivers/scsi/mvumi.c:2538:6: note: Assuming field 'dm_thread' is null
           if (mhba->dm_thread) {
               ^~~~~~~~~~~~~~~
   drivers/scsi/mvumi.c:2538:2: note: Taking false branch
           if (mhba->dm_thread) {
           ^
   drivers/scsi/mvumi.c:2550:2: note: Calling 'mvumi_release_fw'
           mvumi_release_fw(mhba);
           ^~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/mvumi.c:757:2: note: Calling 'mvumi_free_cmds'
           mvumi_free_cmds(mhba);
           ^~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/mvumi.c:350:2: note: Loop condition is true.  Entering loop=
 body
           while (!list_empty(&mhba->cmd_pool)) {
           ^
   drivers/scsi/mvumi.c:351:9: note: Left side of '&&' is false
                   cmd =3D list_first_entry(&mhba->cmd_pool, struct mvumi_c=
md,
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
   drivers/scsi/mvumi.c:351:9: note: Taking false branch
                   cmd =3D list_first_entry(&mhba->cmd_pool, struct mvumi_c=
md,
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
   include/linux/compiler_types.h:328:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:316:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:308:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \

vim +201 drivers/gpio/gpio-rockchip.c

936ee2675eee1f Jianqun Xu 2021-08-16  186  =

3bcbd1a85b68e5 Jianqun Xu 2021-08-16  187  static int rockchip_gpio_set_deb=
ounce(struct gpio_chip *gc,
3bcbd1a85b68e5 Jianqun Xu 2021-08-16  188  				      unsigned int offset,
3bcbd1a85b68e5 Jianqun Xu 2021-08-16  189  				      unsigned int debounce)
936ee2675eee1f Jianqun Xu 2021-08-16  190  {
936ee2675eee1f Jianqun Xu 2021-08-16  191  	struct rockchip_pin_bank *bank =
=3D gpiochip_get_data(gc);
3bcbd1a85b68e5 Jianqun Xu 2021-08-16  192  	const struct rockchip_gpio_regs=
	*reg =3D bank->gpio_regs;
3bcbd1a85b68e5 Jianqun Xu 2021-08-16  193  	unsigned long flags, div_reg, f=
req, max_debounce;
3bcbd1a85b68e5 Jianqun Xu 2021-08-16  194  	bool div_debounce_support;
3bcbd1a85b68e5 Jianqun Xu 2021-08-16  195  	unsigned int cur_div_reg;
3bcbd1a85b68e5 Jianqun Xu 2021-08-16  196  	u64 div;
3bcbd1a85b68e5 Jianqun Xu 2021-08-16  197  =

3bcbd1a85b68e5 Jianqun Xu 2021-08-16  198  	if (!IS_ERR(bank->db_clk)) {
3bcbd1a85b68e5 Jianqun Xu 2021-08-16  199  		div_debounce_support =3D true;
3bcbd1a85b68e5 Jianqun Xu 2021-08-16  200  		freq =3D clk_get_rate(bank->db=
_clk);
3bcbd1a85b68e5 Jianqun Xu 2021-08-16 @201  		max_debounce =3D (GENMASK(23, =
0) + 1) * 2 * 1000000 / freq;
3bcbd1a85b68e5 Jianqun Xu 2021-08-16  202  		if (debounce > max_debounce)
3bcbd1a85b68e5 Jianqun Xu 2021-08-16  203  			return -EINVAL;
3bcbd1a85b68e5 Jianqun Xu 2021-08-16  204  =

3bcbd1a85b68e5 Jianqun Xu 2021-08-16  205  		div =3D debounce * freq;
3bcbd1a85b68e5 Jianqun Xu 2021-08-16  206  		div_reg =3D DIV_ROUND_CLOSEST_=
ULL(div, 2 * USEC_PER_SEC) - 1;
3bcbd1a85b68e5 Jianqun Xu 2021-08-16  207  	} else {
3bcbd1a85b68e5 Jianqun Xu 2021-08-16  208  		div_debounce_support =3D false;
3bcbd1a85b68e5 Jianqun Xu 2021-08-16  209  	}
936ee2675eee1f Jianqun Xu 2021-08-16  210  =

936ee2675eee1f Jianqun Xu 2021-08-16  211  	raw_spin_lock_irqsave(&bank->sl=
ock, flags);
936ee2675eee1f Jianqun Xu 2021-08-16  212  =

3bcbd1a85b68e5 Jianqun Xu 2021-08-16  213  	/* Only the v1 needs to configu=
re div_en and div_con for dbclk */
3bcbd1a85b68e5 Jianqun Xu 2021-08-16  214  	if (debounce) {
3bcbd1a85b68e5 Jianqun Xu 2021-08-16  215  		if (div_debounce_support) {
3bcbd1a85b68e5 Jianqun Xu 2021-08-16  216  			/* Configure the max debounce=
 from consumers */
3bcbd1a85b68e5 Jianqun Xu 2021-08-16  217  			cur_div_reg =3D readl(bank->r=
eg_base +
3bcbd1a85b68e5 Jianqun Xu 2021-08-16  218  					    reg->dbclk_div_con);
3bcbd1a85b68e5 Jianqun Xu 2021-08-16  219  			if (cur_div_reg < div_reg)
3bcbd1a85b68e5 Jianqun Xu 2021-08-16  220  				writel(div_reg, bank->reg_ba=
se +
3bcbd1a85b68e5 Jianqun Xu 2021-08-16  221  				       reg->dbclk_div_con);
3bcbd1a85b68e5 Jianqun Xu 2021-08-16  222  			rockchip_gpio_writel_bit(bank=
, offset, 1,
3bcbd1a85b68e5 Jianqun Xu 2021-08-16  223  						 reg->dbclk_div_en);
3bcbd1a85b68e5 Jianqun Xu 2021-08-16  224  		}
3bcbd1a85b68e5 Jianqun Xu 2021-08-16  225  =

3bcbd1a85b68e5 Jianqun Xu 2021-08-16  226  		rockchip_gpio_writel_bit(bank,=
 offset, 1, reg->debounce);
3bcbd1a85b68e5 Jianqun Xu 2021-08-16  227  	} else {
3bcbd1a85b68e5 Jianqun Xu 2021-08-16  228  		if (div_debounce_support)
3bcbd1a85b68e5 Jianqun Xu 2021-08-16  229  			rockchip_gpio_writel_bit(bank=
, offset, 0,
3bcbd1a85b68e5 Jianqun Xu 2021-08-16  230  						 reg->dbclk_div_en);
3bcbd1a85b68e5 Jianqun Xu 2021-08-16  231  =

3bcbd1a85b68e5 Jianqun Xu 2021-08-16  232  		rockchip_gpio_writel_bit(bank,=
 offset, 0, reg->debounce);
3bcbd1a85b68e5 Jianqun Xu 2021-08-16  233  	}
936ee2675eee1f Jianqun Xu 2021-08-16  234  =

936ee2675eee1f Jianqun Xu 2021-08-16  235  	raw_spin_unlock_irqrestore(&ban=
k->slock, flags);
3bcbd1a85b68e5 Jianqun Xu 2021-08-16  236  =

3bcbd1a85b68e5 Jianqun Xu 2021-08-16  237  	/* Enable or disable dbclk at l=
ast */
3bcbd1a85b68e5 Jianqun Xu 2021-08-16  238  	if (div_debounce_support) {
3bcbd1a85b68e5 Jianqun Xu 2021-08-16  239  		if (debounce)
3bcbd1a85b68e5 Jianqun Xu 2021-08-16  240  			clk_prepare_enable(bank->db_c=
lk);
3bcbd1a85b68e5 Jianqun Xu 2021-08-16  241  		else
3bcbd1a85b68e5 Jianqun Xu 2021-08-16  242  			clk_disable_unprepare(bank->d=
b_clk);
3bcbd1a85b68e5 Jianqun Xu 2021-08-16  243  	}
3bcbd1a85b68e5 Jianqun Xu 2021-08-16  244  =

3bcbd1a85b68e5 Jianqun Xu 2021-08-16  245  	return 0;
936ee2675eee1f Jianqun Xu 2021-08-16  246  }
936ee2675eee1f Jianqun Xu 2021-08-16  247  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6858668224882111471==--

