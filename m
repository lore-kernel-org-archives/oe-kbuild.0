Content-Type: multipart/mixed; boundary="===============7793341855028856810=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpio/gpio-rockchip.c:201:53: warning: Division by zero [clang-analyzer-core.DivideZero]
Date: Thu, 07 Apr 2022 12:59:03 +0800
Message-ID: <202204071238.S37Lu57T-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7793341855028856810==
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
head:   3e732ebf7316ac83e8562db7e64cc68aec390a18
commit: 3bcbd1a85b68e5f864029fd6f0bb0bcc8e2f1082 gpio/rockchip: support nex=
t version gpio controller
date:   8 months ago
:::::: branch date: 35 hours ago
:::::: commit date: 8 months ago
config: mips-randconfig-c004-20220404 (https://download.01.org/0day-ci/arch=
ive/20220407/202204071238.S37Lu57T-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c4a1b0=
7d0979e7ff20d7d541af666d822d66b566)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D3bcbd1a85b68e5f864029fd6f0bb0bcc8e2f1082
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 3bcbd1a85b68e5f864029fd6f0bb0bcc8e2f1082
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dmips clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^~~~~~~~~~
   include/linux/uaccess.h:192:7: note: Returning from '_copy_from_user'
                   n =3D _copy_from_user(to, from, n);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:193:2: note: Returning without writing to 'to->r=
lim_cur'
           return n;
           ^
   include/linux/uaccess.h:193:2: note: Returning zero (loaded from 'n'), w=
hich participates in a condition later
           return n;
           ^~~~~~~~
   kernel/sys.c:1691:6: note: Returning from 'copy_from_user'
           if (copy_from_user(&new_rlim, rlim, sizeof(*rlim)))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sys.c:1691:2: note: Taking false branch
           if (copy_from_user(&new_rlim, rlim, sizeof(*rlim)))
           ^
   kernel/sys.c:1693:9: note: Calling 'do_prlimit'
           return do_prlimit(current, resource, &new_rlim, NULL);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sys.c:1567:6: note: Assuming 'resource' is < RLIM_NLIMITS
           if (resource >=3D RLIM_NLIMITS)
               ^~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sys.c:1567:2: note: Taking false branch
           if (resource >=3D RLIM_NLIMITS)
           ^
   kernel/sys.c:1569:6: note: 'new_rlim' is non-null
           if (new_rlim) {
               ^~~~~~~~
   kernel/sys.c:1569:2: note: Taking true branch
           if (new_rlim) {
           ^
   kernel/sys.c:1570:26: note: The left operand of '>' is a garbage value
                   if (new_rlim->rlim_cur > new_rlim->rlim_max)
                       ~~~~~~~~~~~~~~~~~~ ^
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
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
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   fs/iomap/buffered-io.c:1039:6: warning: Value stored to 'start' during i=
ts initialization is never read [clang-analyzer-deadcode.DeadStores]
           u64 start =3D bio->bi_iter.bi_sector;
               ^~~~~   ~~~~~~~~~~~~~~~~~~~~~~
   fs/iomap/buffered-io.c:1039:6: note: Value stored to 'start' during its =
initialization is never read
           u64 start =3D bio->bi_iter.bi_sector;
               ^~~~~   ~~~~~~~~~~~~~~~~~~~~~~
   fs/iomap/buffered-io.c:1040:9: warning: Value stored to 'offset' during =
its initialization is never read [clang-analyzer-deadcode.DeadStores]
           loff_t offset =3D ioend->io_offset;
                  ^~~~~~   ~~~~~~~~~~~~~~~~
   fs/iomap/buffered-io.c:1040:9: note: Value stored to 'offset' during its=
 initialization is never read
           loff_t offset =3D ioend->io_offset;
                  ^~~~~~   ~~~~~~~~~~~~~~~~
   Suppressed 7 warnings (7 in non-user code).
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
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
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
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
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
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
>> drivers/gpio/gpio-rockchip.c:201:53: warning: Division by zero [clang-an=
alyzer-core.DivideZero]
                   max_debounce =3D (GENMASK(23, 0) + 1) * 2 * 1000000 / fr=
eq;
                                                                     ^
   drivers/gpio/gpio-rockchip.c:272:2: note: Control jumps to 'case PIN_CON=
FIG_INPUT_DEBOUNCE:'  at line 273
           switch (param) {
           ^
   drivers/gpio/gpio-rockchip.c:274:3: note: Calling 'rockchip_gpio_set_deb=
ounce'
                   rockchip_gpio_set_debounce(gc, offset, true);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
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
   8 warnings generated.
   Suppressed 8 warnings (5 in non-user code, 3 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (11 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.

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
--===============7793341855028856810==--

