Content-Type: multipart/mixed; boundary="===============3582903840524226196=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 2/2] clk: si5351: Add clock output phase offset
Date: Fri, 10 Dec 2021 10:02:12 +0800
Message-ID: <202112100907.ZZ6U3zni-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3582903840524226196==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20211208154605.72476-1-renner@efe-gmbh.de>
References: <20211208154605.72476-1-renner@efe-gmbh.de>
TO: Jens Renner <renner@efe-gmbh.de>
TO: linux-clk(a)vger.kernel.org
CC: mturquette(a)baylibre.com
CC: sboyd(a)kernel.org
CC: sebastian.hesselbarth(a)gmail.com
CC: s.hauer(a)pengutronix.de
CC: devicetree(a)vger.kernel.org
CC: robh+dt(a)kernel.org
CC: renner(a)efe-gmbh.de

Hi Jens,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on clk/clk-next]
[also build test WARNING on linus/master v5.16-rc4 next-20211208]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Jens-Renner/clk-si5351-Add=
-phase-offset-for-clock-output/20211208-234754
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-n=
ext
:::::: branch date: 34 hours ago
:::::: commit date: 34 hours ago
config: arm-randconfig-c002-20211207 (https://download.01.org/0day-ci/archi=
ve/20211210/202112100907.ZZ6U3zni-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 097a1c=
b1d5ebb3a0ec4bcaed8ba3ff6a8e33c00a)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/0day-ci/linux/commit/2e4aec73925b427049ef0fd8c=
d48e660eaff48fb
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Jens-Renner/clk-si5351-Add-phase-o=
ffset-for-clock-output/20211208-234754
        git checkout 2e4aec73925b427049ef0fd8cd48e660eaff48fb
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           *max_sys_div =3D min_t(u16, *max_sys_div,
                          ^
   include/linux/minmax.h:104:27: note: expanded from macro 'min_t'
   #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)
                                   ^
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^
   drivers/media/i2c/ccs-pll.c:282:2: note: Taking false branch
           dev_dbg(dev, "max_sys_div: min_vt_pix_clk_freq_hz: %u\n", *max_s=
ys_div);
           ^
   include/linux/dev_printk.h:155:2: note: expanded from macro 'dev_dbg'
           dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/dynamic_debug.h:166:2: note: expanded from macro 'dynamic_=
dev_dbg'
           _dynamic_func_call(fmt,__dynamic_dev_dbg,               \
           ^
   include/linux/dynamic_debug.h:152:2: note: expanded from macro '_dynamic=
_func_call'
           __dynamic_func_call(__UNIQUE_ID(ddebug), fmt, func, ##__VA_ARGS_=
_)
           ^
   include/linux/dynamic_debug.h:133:2: note: expanded from macro '__dynami=
c_func_call'
           if (DYNAMIC_DEBUG_BRANCH(id))                   \
           ^
   drivers/media/i2c/ccs-pll.c:282:2: note: Loop condition is false.  Exiti=
ng loop
           dev_dbg(dev, "max_sys_div: min_vt_pix_clk_freq_hz: %u\n", *max_s=
ys_div);
           ^
   include/linux/dev_printk.h:155:2: note: expanded from macro 'dev_dbg'
           dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/dynamic_debug.h:166:2: note: expanded from macro 'dynamic_=
dev_dbg'
           _dynamic_func_call(fmt,__dynamic_dev_dbg,               \
           ^
   include/linux/dynamic_debug.h:152:2: note: expanded from macro '_dynamic=
_func_call'
           __dynamic_func_call(__UNIQUE_ID(ddebug), fmt, func, ##__VA_ARGS_=
_)
           ^
   include/linux/dynamic_debug.h:131:49: note: expanded from macro '__dynam=
ic_func_call'
   #define __dynamic_func_call(id, fmt, func, ...) do {    \
                                                   ^
   drivers/media/i2c/ccs-pll.c:520:2: note: Returning from 'ccs_pll_find_vt=
_sys_div'
           ccs_pll_find_vt_sys_div(dev, lim, pll, pll_fr, min_vt_div,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/ccs-pll.c:528:28: note: Assuming 'vt_div' is <=3D 'max=
_vt_div'
           for (vt_div =3D min_vt_div; vt_div <=3D max_vt_div; vt_div++) {
                                     ^~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/ccs-pll.c:528:2: note: Loop condition is true.  Enteri=
ng loop body
           for (vt_div =3D min_vt_div; vt_div <=3D max_vt_div; vt_div++) {
           ^
   drivers/media/i2c/ccs-pll.c:529:23: note: Assuming the condition is false
                   u16 __max_sys_div =3D vt_div & 1 ? 1 : max_sys_div;
                                       ^~~~~~~~~~
   drivers/media/i2c/ccs-pll.c:529:23: note: '?' condition is false
   drivers/media/i2c/ccs-pll.c:531:31: note: Assuming 'sys_div' is > '__max=
_sys_div'
                   for (sys_div =3D min_sys_div; sys_div <=3D __max_sys_div;
                                               ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/ccs-pll.c:531:3: note: Loop condition is false. Execut=
ion continues on line 558
                   for (sys_div =3D min_sys_div; sys_div <=3D __max_sys_div;
                   ^
   drivers/media/i2c/ccs-pll.c:558:3: note: Taking false branch
                   if (best_pix_div < SHRT_MAX >> 1)
                   ^
   drivers/media/i2c/ccs-pll.c:528:28: note: Assuming 'vt_div' is <=3D 'max=
_vt_div'
           for (vt_div =3D min_vt_div; vt_div <=3D max_vt_div; vt_div++) {
                                     ^~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/ccs-pll.c:528:2: note: Loop condition is true.  Enteri=
ng loop body
           for (vt_div =3D min_vt_div; vt_div <=3D max_vt_div; vt_div++) {
           ^
   drivers/media/i2c/ccs-pll.c:529:23: note: Assuming the condition is true
                   u16 __max_sys_div =3D vt_div & 1 ? 1 : max_sys_div;
                                       ^~~~~~~~~~
   drivers/media/i2c/ccs-pll.c:529:23: note: '?' condition is true
   drivers/media/i2c/ccs-pll.c:531:8: note: The value of 'min_sys_div' is a=
ssigned to 'sys_div'
                   for (sys_div =3D min_sys_div; sys_div <=3D __max_sys_div;
                        ^~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/ccs-pll.c:531:31: note: Assuming 'sys_div' is <=3D '__=
max_sys_div'
                   for (sys_div =3D min_sys_div; sys_div <=3D __max_sys_div;
                                               ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/ccs-pll.c:531:3: note: Loop condition is true.  Enteri=
ng loop body
                   for (sys_div =3D min_sys_div; sys_div <=3D __max_sys_div;
                   ^
   drivers/media/i2c/ccs-pll.c:536:14: note: Division by zero
                           pix_div =3D DIV_ROUND_UP(vt_div, sys_div);
                                     ^
   include/linux/math.h:36:22: note: expanded from macro 'DIV_ROUND_UP'
   #define DIV_ROUND_UP __KERNEL_DIV_ROUND_UP
                        ^
   include/uapi/linux/const.h:34:54: note: expanded from macro '__KERNEL_DI=
V_ROUND_UP'
   #define __KERNEL_DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
                                        ~~~~~~~~~~~~~~~~^~~~~
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
>> drivers/clk/clk-si5351.c:775:3: warning: Value stored to 'reg' is never =
read [clang-analyzer-deadcode.DeadStores]
                   reg =3D si5351_set_bits(hwdata->drvdata,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/clk-si5351.c:775:3: note: Value stored to 'reg' is never read
                   reg =3D si5351_set_bits(hwdata->drvdata,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   drivers/tty/serial/fsl_lpuart.c:1276:33: warning: The result of the left=
 shift is undefined because the right operand is negative [clang-analyzer-c=
ore.UndefinedBinaryOperatorResult]
           sport->rx_dma_rng_buf_len =3D (1 << (fls(sport->rx_dma_rng_buf_l=
en) - 1));
                                          ^
   drivers/tty/serial/fsl_lpuart.c:2859:6: note: Assuming field 'suspended'=
 is 0
           if (sport->port.suspended && !irq_wake)
               ^~~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/fsl_lpuart.c:2859:28: note: Left side of '&&' is false
           if (sport->port.suspended && !irq_wake)
                                     ^
   drivers/tty/serial/fsl_lpuart.c:2862:2: note: Taking false branch
           if (lpuart_is_32(sport))
           ^
   drivers/tty/serial/fsl_lpuart.c:2867:6: note: Assuming field 'lpuart_dma=
_rx_use' is true
           if (sport->lpuart_dma_rx_use) {
               ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/fsl_lpuart.c:2867:2: note: Taking true branch
           if (sport->lpuart_dma_rx_use) {
           ^
   drivers/tty/serial/fsl_lpuart.c:2868:7: note: Assuming 'irq_wake' is true
                   if (irq_wake) {
                       ^~~~~~~~
   drivers/tty/serial/fsl_lpuart.c:2868:3: note: Taking true branch
                   if (irq_wake) {
                   ^
   drivers/tty/serial/fsl_lpuart.c:2869:9: note: Calling 'lpuart_start_rx_d=
ma'
                           if (!lpuart_start_rx_dma(sport))
                                ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/fsl_lpuart.c:1267:9: note: Assuming the condition is =
false
           bits =3D (termios->c_cflag & CSIZE) =3D=3D CS7 ? 9 : 10;
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/fsl_lpuart.c:1267:9: note: '?' condition is false
   drivers/tty/serial/fsl_lpuart.c:1268:6: note: Assuming the condition is =
false
           if (termios->c_cflag & PARENB)
               ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/fsl_lpuart.c:1268:2: note: Taking false branch
           if (termios->c_cflag & PARENB)
           ^
   drivers/tty/serial/fsl_lpuart.c:1276:33: note: The result of the left sh=
ift is undefined because the right operand is negative
           sport->rx_dma_rng_buf_len =3D (1 << (fls(sport->rx_dma_rng_buf_l=
en) - 1));
                                          ^  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   include/asm-generic/bitops/non-atomic.h:22:6: warning: The left expressi=
on of the compound assignment is an uninitialized value. The computed value=
 will also be garbage [clang-analyzer-core.uninitialized.Assign]
           *p  |=3D mask;
               ^
   drivers/tty/serial/serial_mctrl_gpio.c:52:6: note: Assuming 'gpios' is n=
ot equal to NULL
           if (gpios =3D=3D NULL)
               ^~~~~~~~~~~~~
   drivers/tty/serial/serial_mctrl_gpio.c:52:2: note: Taking false branch
           if (gpios =3D=3D NULL)
           ^
   drivers/tty/serial/serial_mctrl_gpio.c:55:2: note: Loop condition is tru=
e.  Entering loop body
           for (i =3D 0; i < UART_GPIO_MAX; i++)
           ^
   drivers/tty/serial/serial_mctrl_gpio.c:56:7: note: Assuming the conditio=
n is true
                   if (gpios->gpio[i] && mctrl_gpio_flags_is_dir_out(i)) {
                       ^~~~~~~~~~~~~~
   drivers/tty/serial/serial_mctrl_gpio.c:56:7: note: Left side of '&&' is =
true
   drivers/tty/serial/serial_mctrl_gpio.c:56:25: note: Assuming the conditi=
on is true
                   if (gpios->gpio[i] && mctrl_gpio_flags_is_dir_out(i)) {
                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/serial_mctrl_gpio.c:56:3: note: Taking true branch
                   if (gpios->gpio[i] && mctrl_gpio_flags_is_dir_out(i)) {
                   ^
   drivers/tty/serial/serial_mctrl_gpio.c:58:4: note: Calling '__assign_bit'
                           __assign_bit(count, values,
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitops.h:251:6: note: Assuming 'value' is true
           if (value)
               ^~~~~
   include/linux/bitops.h:251:2: note: Taking true branch
           if (value)
           ^
   include/linux/bitops.h:252:3: note: Calling 'arch___set_bit'
                   __set_bit(nr, addr);
                   ^
   include/asm-generic/bitops/non-atomic.h:24:19: note: expanded from macro=
 '__set_bit'
   #define __set_bit arch___set_bit
                     ^
   include/asm-generic/bitops/non-atomic.h:22:6: note: The left expression =
of the compound assignment is an uninitialized value. The computed value wi=
ll also be garbage
           *p  |=3D mask;
           ~~  ^
   include/asm-generic/bitops/non-atomic.h:32:5: warning: The left expressi=
on of the compound assignment is an uninitialized value. The computed value=
 will also be garbage [clang-analyzer-core.uninitialized.Assign]
           *p &=3D ~mask;
              ^
   drivers/tty/serial/serial_mctrl_gpio.c:52:6: note: Assuming 'gpios' is n=
ot equal to NULL
           if (gpios =3D=3D NULL)
               ^~~~~~~~~~~~~
   drivers/tty/serial/serial_mctrl_gpio.c:52:2: note: Taking false branch
           if (gpios =3D=3D NULL)

vim +/reg +775 drivers/clk/clk-si5351.c

9abd5f0555df6cd Sebastian Hesselbarth 2013-04-11  754  =

9abd5f0555df6cd Sebastian Hesselbarth 2013-04-11  755  static int si5351_ms=
ynth_set_rate(struct clk_hw *hw, unsigned long rate,
9abd5f0555df6cd Sebastian Hesselbarth 2013-04-11  756  				  unsigned long =
parent_rate)
9abd5f0555df6cd Sebastian Hesselbarth 2013-04-11  757  {
9abd5f0555df6cd Sebastian Hesselbarth 2013-04-11  758  	struct si5351_hw_da=
ta *hwdata =3D
9abd5f0555df6cd Sebastian Hesselbarth 2013-04-11  759  		container_of(hw, s=
truct si5351_hw_data, hw);
9abd5f0555df6cd Sebastian Hesselbarth 2013-04-11  760  	u8 reg =3D si5351_m=
synth_params_address(hwdata->num);
9abd5f0555df6cd Sebastian Hesselbarth 2013-04-11  761  	int divby4 =3D 0;
9abd5f0555df6cd Sebastian Hesselbarth 2013-04-11  762  =

9abd5f0555df6cd Sebastian Hesselbarth 2013-04-11  763  	/* write multisynth=
 parameters */
9abd5f0555df6cd Sebastian Hesselbarth 2013-04-11  764  	si5351_write_parame=
ters(hwdata->drvdata, reg, &hwdata->params);
9abd5f0555df6cd Sebastian Hesselbarth 2013-04-11  765  =

9abd5f0555df6cd Sebastian Hesselbarth 2013-04-11  766  	if (rate > SI5351_M=
ULTISYNTH_DIVBY4_FREQ)
9abd5f0555df6cd Sebastian Hesselbarth 2013-04-11  767  		divby4 =3D 1;
9abd5f0555df6cd Sebastian Hesselbarth 2013-04-11  768  =

9abd5f0555df6cd Sebastian Hesselbarth 2013-04-11  769  	/* enable/disable i=
nteger mode and divby4 on multisynth0-5 */
9abd5f0555df6cd Sebastian Hesselbarth 2013-04-11  770  	if (hwdata->num < 6=
) {
9abd5f0555df6cd Sebastian Hesselbarth 2013-04-11  771  		si5351_set_bits(hw=
data->drvdata, reg + 2,
9abd5f0555df6cd Sebastian Hesselbarth 2013-04-11  772  				SI5351_OUTPUT_CL=
K_DIVBY4,
9abd5f0555df6cd Sebastian Hesselbarth 2013-04-11  773  				(divby4) ? SI535=
1_OUTPUT_CLK_DIVBY4 : 0);
2e4aec73925b427 Jens Renner           2021-12-08  774  		/* clear existing =
phase offset */
2e4aec73925b427 Jens Renner           2021-12-08 @775  		reg =3D si5351_set=
_bits(hwdata->drvdata,
2e4aec73925b427 Jens Renner           2021-12-08  776  				SI5351_CLK0_PHAS=
E_OFFSET + hwdata->num,
2e4aec73925b427 Jens Renner           2021-12-08  777  				SI5351_CLK_PHASE=
_OFFSET_MASK, 0);
9abd5f0555df6cd Sebastian Hesselbarth 2013-04-11  778  		si5351_set_bits(hw=
data->drvdata, SI5351_CLK0_CTRL + hwdata->num,
9abd5f0555df6cd Sebastian Hesselbarth 2013-04-11  779  			SI5351_CLK_INTEGE=
R_MODE,
9abd5f0555df6cd Sebastian Hesselbarth 2013-04-11  780  			(hwdata->params.p=
2 =3D=3D 0) ? SI5351_CLK_INTEGER_MODE : 0);
9abd5f0555df6cd Sebastian Hesselbarth 2013-04-11  781  	}
9abd5f0555df6cd Sebastian Hesselbarth 2013-04-11  782  =

9abd5f0555df6cd Sebastian Hesselbarth 2013-04-11  783  	dev_dbg(&hwdata->dr=
vdata->client->dev,
9abd5f0555df6cd Sebastian Hesselbarth 2013-04-11  784  		"%s - %s: p1 =3D %=
lu, p2 =3D %lu, p3 =3D %lu, divby4 =3D %d, parent_rate =3D %lu, rate =3D %l=
u\n",
44f22a5d671ad8b Stephen Boyd          2015-08-07  785  		__func__, clk_hw_g=
et_name(hw),
9abd5f0555df6cd Sebastian Hesselbarth 2013-04-11  786  		hwdata->params.p1,=
 hwdata->params.p2, hwdata->params.p3,
9abd5f0555df6cd Sebastian Hesselbarth 2013-04-11  787  		divby4, parent_rat=
e, rate);
9abd5f0555df6cd Sebastian Hesselbarth 2013-04-11  788  =

9abd5f0555df6cd Sebastian Hesselbarth 2013-04-11  789  	return 0;
9abd5f0555df6cd Sebastian Hesselbarth 2013-04-11  790  }
9abd5f0555df6cd Sebastian Hesselbarth 2013-04-11  791  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3582903840524226196==--

