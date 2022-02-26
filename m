Content-Type: multipart/mixed; boundary="===============8169631209877643858=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 5483/9128] drivers/input/serio/ps2-gpio.c:223:4: warning: Value stored to 'rxflags' is never read [clang-analyzer-deadcode.DeadStores]
Date: Sat, 26 Feb 2022 20:32:39 +0800
Message-ID: <202202262056.wQXD7viD-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8169631209877643858==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Danilo Krummrich <danilokrummrich@dk-develop.de>
CC: Dmitry Torokhov <dmitry.torokhov@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   06aeb1495c39c86ccfaf1adadc1d2200179f16eb
commit: 81b9fd6941ce6fc4b4127cc184e491adb615182e [5483/9128] Input: ps2-gpi=
o - don't send rx data before the stop bit
:::::: branch date: 11 hours ago
:::::: commit date: 10 days ago
config: arm-randconfig-c002-20220223 (https://download.01.org/0day-ci/archi=
ve/20220226/202202262056.wQXD7viD-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc=
04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3D81b9fd6941ce6fc4b4127cc184e491adb615182e
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 81b9fd6941ce6fc4b4127cc184e491adb615182e
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                         ^~~~
   drivers/media/i2c/ov7670.c:1522:8: note: Calling 'ov7670_read'
           ret =3D ov7670_read(sd, REG_COM1, &com1) +
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/ov7670.c:565:6: note: Assuming field 'use_smbus' is tr=
ue
           if (info->use_smbus)
               ^~~~~~~~~~~~~~~
   drivers/media/i2c/ov7670.c:565:2: note: Taking true branch
           if (info->use_smbus)
           ^
   drivers/media/i2c/ov7670.c:566:10: note: Calling 'ov7670_read_smbus'
                   return ov7670_read_smbus(sd, reg, value);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/ov7670.c:485:6: note: Assuming 'ret' is < 0
           if (ret >=3D 0) {
               ^~~~~~~~
   drivers/media/i2c/ov7670.c:485:2: note: Taking false branch
           if (ret >=3D 0) {
           ^
   drivers/media/i2c/ov7670.c:489:2: note: Returning without writing to '*v=
alue'
           return ret;
           ^
   drivers/media/i2c/ov7670.c:566:10: note: Returning from 'ov7670_read_smb=
us'
                   return ov7670_read_smbus(sd, reg, value);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/ov7670.c:566:3: note: Returning without writing to '*v=
alue'
                   return ov7670_read_smbus(sd, reg, value);
                   ^
   drivers/media/i2c/ov7670.c:1522:8: note: Returning from 'ov7670_read'
           ret =3D ov7670_read(sd, REG_COM1, &com1) +
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/ov7670.c:1525:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   drivers/media/i2c/ov7670.c:1525:2: note: Taking false branch
           if (ret)
           ^
   drivers/media/i2c/ov7670.c:1528:15: note: The left operand of '&' is a g=
arbage value
           com1 =3D (com1 & 0xfc) | (value & 0x03);
                   ~~~~ ^
   drivers/media/i2c/ov7670.c:1530:17: warning: The left operand of '&' is =
a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           aechh =3D (aechh & 0xc0) | ((value >> 10) & 0x3f);
                          ^
   drivers/media/i2c/ov7670.c:1597:2: note: Control jumps to 'case 10094849=
:'  at line 1617
           switch (ctrl->id) {
           ^
   drivers/media/i2c/ov7670.c:1620:7: note: Assuming field 'val' is equal t=
o V4L2_EXPOSURE_MANUAL
                   if (ctrl->val =3D=3D V4L2_EXPOSURE_MANUAL) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/ov7670.c:1620:3: note: Taking true branch
                   if (ctrl->val =3D=3D V4L2_EXPOSURE_MANUAL) {
                   ^
   drivers/media/i2c/ov7670.c:1622:11: note: Calling 'ov7670_s_exp'
                           return ov7670_s_exp(sd, info->exposure->val);
                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/ov7670.c:1520:34: note: 'aechh' declared without an in=
itial value
           unsigned char com1, com8, aech, aechh;
                                           ^~~~~
   drivers/media/i2c/ov7670.c:1524:3: note: Calling 'ov7670_read'
                   ov7670_read(sd, REG_AECHH, &aechh);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/ov7670.c:565:12: note: Field 'use_smbus' is true
           if (info->use_smbus)
                     ^
   drivers/media/i2c/ov7670.c:565:2: note: Taking true branch
           if (info->use_smbus)
           ^
   drivers/media/i2c/ov7670.c:566:10: note: Calling 'ov7670_read_smbus'
                   return ov7670_read_smbus(sd, reg, value);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/ov7670.c:485:6: note: Assuming 'ret' is < 0
           if (ret >=3D 0) {
               ^~~~~~~~
   drivers/media/i2c/ov7670.c:485:2: note: Taking false branch
           if (ret >=3D 0) {
           ^
   drivers/media/i2c/ov7670.c:489:2: note: Returning without writing to '*v=
alue'
           return ret;
           ^
   drivers/media/i2c/ov7670.c:566:10: note: Returning from 'ov7670_read_smb=
us'
                   return ov7670_read_smbus(sd, reg, value);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/ov7670.c:566:3: note: Returning without writing to '*v=
alue'
                   return ov7670_read_smbus(sd, reg, value);
                   ^
   drivers/media/i2c/ov7670.c:1524:3: note: Returning from 'ov7670_read'
                   ov7670_read(sd, REG_AECHH, &aechh);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/ov7670.c:1525:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   drivers/media/i2c/ov7670.c:1525:2: note: Taking false branch
           if (ret)
           ^
   drivers/media/i2c/ov7670.c:1530:17: note: The left operand of '&' is a g=
arbage value
           aechh =3D (aechh & 0xc0) | ((value >> 10) & 0x3f);
                    ~~~~~ ^
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
>> drivers/input/serio/ps2-gpio.c:223:4: warning: Value stored to 'rxflags'=
 is never read [clang-analyzer-deadcode.DeadStores]
                           rxflags |=3D SERIO_PARITY;
                           ^
   drivers/input/serio/ps2-gpio.c:223:4: note: Value stored to 'rxflags' is=
 never read
   2 warnings generated.
   drivers/hwmon/max31730.c:220:30: warning: The result of the left shift i=
s undefined because the left operand is negative [clang-analyzer-core.Undef=
inedBinaryOperatorResult]
           val =3D DIV_ROUND_CLOSEST(val << 4, 1000) << 4;
                                       ^
   include/linux/math.h:87:18: note: expanded from macro 'DIV_ROUND_CLOSEST'
           typeof(x) __x =3D x;                              \
                           ^
   drivers/hwmon/max31730.c:192:6: note: Assuming 'type' is equal to hwmon_=
temp
           if (type !=3D hwmon_temp)
               ^~~~~~~~~~~~~~~~~~
   drivers/hwmon/max31730.c:192:2: note: Taking false branch
           if (type !=3D hwmon_temp)
           ^
   drivers/hwmon/max31730.c:195:2: note: Control jumps to 'case hwmon_temp_=
min:' @line 199
           switch (attr) {
           ^
   drivers/hwmon/max31730.c:201:3: note:  Execution continues on line 219
                   break;
                   ^
   drivers/hwmon/max31730.c:219:8: note: Assuming '__UNIQUE_ID___x234' is <=
=3D '__UNIQUE_ID___y235'
           val =3D clamp_val(val, MAX31730_TEMP_MIN, MAX31730_TEMP_MAX);
                 ^
   include/linux/minmax.h:137:32: note: expanded from macro 'clamp_val'
   #define clamp_val(val, lo, hi) clamp_t(typeof(val), val, lo, hi)
                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:124:48: note: expanded from macro 'clamp_t'
   #define clamp_t(type, val, lo, hi) min_t(type, max_t(type, val, lo), hi)
                                      ~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:112:27: note: expanded from macro 'max_t'
   #define max_t(type, x, y)       __careful_cmp((type)(x), (type)(y), >)
                                   ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/minmax.h:104:48: note: expanded from macro 'min_t'
   #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)
                                   ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~
   include/linux/minmax.h:38:14: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:31:25: note: expanded from macro '__cmp_once'
                   typeof(x) unique_x =3D (x);               \
                                         ^
   drivers/hwmon/max31730.c:219:8: note: '?' condition is false
           val =3D clamp_val(val, MAX31730_TEMP_MIN, MAX31730_TEMP_MAX);
                 ^
   include/linux/minmax.h:137:32: note: expanded from macro 'clamp_val'
   #define clamp_val(val, lo, hi) clamp_t(typeof(val), val, lo, hi)
                                  ^
   include/linux/minmax.h:124:48: note: expanded from macro 'clamp_t'
   #define clamp_t(type, val, lo, hi) min_t(type, max_t(type, val, lo), hi)
                                                  ^
   include/linux/minmax.h:112:27: note: expanded from macro 'max_t'
   #define max_t(type, x, y)       __careful_cmp((type)(x), (type)(y), >)
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
   drivers/hwmon/max31730.c:219:8: note: '__UNIQUE_ID___x236' is < '__UNIQU=
E_ID___y237'
           val =3D clamp_val(val, MAX31730_TEMP_MIN, MAX31730_TEMP_MAX);
                 ^
   include/linux/minmax.h:137:32: note: expanded from macro 'clamp_val'
   #define clamp_val(val, lo, hi) clamp_t(typeof(val), val, lo, hi)
                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:124:36: note: expanded from macro 'clamp_t'
   #define clamp_t(type, val, lo, hi) min_t(type, max_t(type, val, lo), hi)
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:104:27: note: expanded from macro 'min_t'
   #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^~~
   drivers/hwmon/max31730.c:219:8: note: '?' condition is true
           val =3D clamp_val(val, MAX31730_TEMP_MIN, MAX31730_TEMP_MAX);
                 ^
   include/linux/minmax.h:137:32: note: expanded from macro 'clamp_val'
   #define clamp_val(val, lo, hi) clamp_t(typeof(val), val, lo, hi)
                                  ^
   include/linux/minmax.h:124:36: note: expanded from macro 'clamp_t'
   #define clamp_t(type, val, lo, hi) min_t(type, max_t(type, val, lo), hi)
                                      ^
   include/linux/minmax.h:104:27: note: expanded from macro 'min_t'
   #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)
                                   ^
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))

vim +/rxflags +223 drivers/input/serio/ps2-gpio.c

9ee0a0558819e6 Danilo Krummrich 2017-08-28  161  =

9ee0a0558819e6 Danilo Krummrich 2017-08-28  162  static irqreturn_t ps2_gpi=
o_irq_rx(struct ps2_gpio_data *drvdata)
9ee0a0558819e6 Danilo Krummrich 2017-08-28  163  {
9ee0a0558819e6 Danilo Krummrich 2017-08-28  164  	unsigned char byte, cnt;
9ee0a0558819e6 Danilo Krummrich 2017-08-28  165  	int data;
9ee0a0558819e6 Danilo Krummrich 2017-08-28  166  	int rxflags =3D 0;
2fa9c57af062de Danilo Krummrich 2022-02-15  167  	s64 us_delta;
9ee0a0558819e6 Danilo Krummrich 2017-08-28  168  =

0dde5f82158b26 Danilo Krummrich 2022-02-15  169  	byte =3D drvdata->rx.byte;
0dde5f82158b26 Danilo Krummrich 2022-02-15  170  	cnt =3D drvdata->rx.cnt;
9ee0a0558819e6 Danilo Krummrich 2017-08-28  171  =

2fa9c57af062de Danilo Krummrich 2022-02-15  172  	drvdata->t_irq_now =3D kt=
ime_get();
2fa9c57af062de Danilo Krummrich 2022-02-15  173  =

2fa9c57af062de Danilo Krummrich 2022-02-15  174  	/*
2fa9c57af062de Danilo Krummrich 2022-02-15  175  	 * We need to consider sp=
urious interrupts happening right after
2fa9c57af062de Danilo Krummrich 2022-02-15  176  	 * a TX xfer finished.
2fa9c57af062de Danilo Krummrich 2022-02-15  177  	 */
2fa9c57af062de Danilo Krummrich 2022-02-15  178  	us_delta =3D ktime_us_del=
ta(drvdata->t_irq_now, drvdata->tx.t_xfer_end);
2fa9c57af062de Danilo Krummrich 2022-02-15  179  	if (unlikely(us_delta < P=
S2_IRQ_MIN_INTERVAL_US))
2fa9c57af062de Danilo Krummrich 2022-02-15  180  		goto end;
9ee0a0558819e6 Danilo Krummrich 2017-08-28  181  =

2fa9c57af062de Danilo Krummrich 2022-02-15  182  	us_delta =3D ktime_us_del=
ta(drvdata->t_irq_now, drvdata->t_irq_last);
2fa9c57af062de Danilo Krummrich 2022-02-15  183  	if (us_delta > PS2_IRQ_MA=
X_INTERVAL_US && cnt) {
9ee0a0558819e6 Danilo Krummrich 2017-08-28  184  		dev_err(drvdata->dev,
9ee0a0558819e6 Danilo Krummrich 2017-08-28  185  			"RX: timeout, probably =
we missed an interrupt\n");
9ee0a0558819e6 Danilo Krummrich 2017-08-28  186  		goto err;
2fa9c57af062de Danilo Krummrich 2022-02-15  187  	} else if (unlikely(us_de=
lta < PS2_IRQ_MIN_INTERVAL_US)) {
2fa9c57af062de Danilo Krummrich 2022-02-15  188  		/* Ignore spurious IRQs.=
 */
2fa9c57af062de Danilo Krummrich 2022-02-15  189  		goto end;
9ee0a0558819e6 Danilo Krummrich 2017-08-28  190  	}
2fa9c57af062de Danilo Krummrich 2022-02-15  191  	drvdata->t_irq_last =3D d=
rvdata->t_irq_now;
9ee0a0558819e6 Danilo Krummrich 2017-08-28  192  =

9ee0a0558819e6 Danilo Krummrich 2017-08-28  193  	data =3D gpiod_get_value(=
drvdata->gpio_data);
9ee0a0558819e6 Danilo Krummrich 2017-08-28  194  	if (unlikely(data < 0)) {
9ee0a0558819e6 Danilo Krummrich 2017-08-28  195  		dev_err(drvdata->dev, "R=
X: failed to get data gpio val: %d\n",
9ee0a0558819e6 Danilo Krummrich 2017-08-28  196  			data);
9ee0a0558819e6 Danilo Krummrich 2017-08-28  197  		goto err;
9ee0a0558819e6 Danilo Krummrich 2017-08-28  198  	}
9ee0a0558819e6 Danilo Krummrich 2017-08-28  199  =

9ee0a0558819e6 Danilo Krummrich 2017-08-28  200  	switch (cnt) {
9ee0a0558819e6 Danilo Krummrich 2017-08-28  201  	case PS2_START_BIT:
9ee0a0558819e6 Danilo Krummrich 2017-08-28  202  		/* start bit should be l=
ow */
9ee0a0558819e6 Danilo Krummrich 2017-08-28  203  		if (unlikely(data)) {
9ee0a0558819e6 Danilo Krummrich 2017-08-28  204  			dev_err(drvdata->dev, "=
RX: start bit should be low\n");
9ee0a0558819e6 Danilo Krummrich 2017-08-28  205  			goto err;
9ee0a0558819e6 Danilo Krummrich 2017-08-28  206  		}
9ee0a0558819e6 Danilo Krummrich 2017-08-28  207  		break;
9ee0a0558819e6 Danilo Krummrich 2017-08-28  208  	case PS2_DATA_BIT0:
9ee0a0558819e6 Danilo Krummrich 2017-08-28  209  	case PS2_DATA_BIT1:
9ee0a0558819e6 Danilo Krummrich 2017-08-28  210  	case PS2_DATA_BIT2:
9ee0a0558819e6 Danilo Krummrich 2017-08-28  211  	case PS2_DATA_BIT3:
9ee0a0558819e6 Danilo Krummrich 2017-08-28  212  	case PS2_DATA_BIT4:
9ee0a0558819e6 Danilo Krummrich 2017-08-28  213  	case PS2_DATA_BIT5:
9ee0a0558819e6 Danilo Krummrich 2017-08-28  214  	case PS2_DATA_BIT6:
9ee0a0558819e6 Danilo Krummrich 2017-08-28  215  	case PS2_DATA_BIT7:
9ee0a0558819e6 Danilo Krummrich 2017-08-28  216  		/* processing data bits =
*/
9ee0a0558819e6 Danilo Krummrich 2017-08-28  217  		if (data)
9ee0a0558819e6 Danilo Krummrich 2017-08-28  218  			byte |=3D (data << (cnt=
 - 1));
9ee0a0558819e6 Danilo Krummrich 2017-08-28  219  		break;
9ee0a0558819e6 Danilo Krummrich 2017-08-28  220  	case PS2_PARITY_BIT:
9ee0a0558819e6 Danilo Krummrich 2017-08-28  221  		/* check odd parity */
9ee0a0558819e6 Danilo Krummrich 2017-08-28  222  		if (!((hweight8(byte) & =
1) ^ data)) {
9ee0a0558819e6 Danilo Krummrich 2017-08-28 @223  			rxflags |=3D SERIO_PARI=
TY;
9ee0a0558819e6 Danilo Krummrich 2017-08-28  224  			dev_warn(drvdata->dev, =
"RX: parity error\n");
9ee0a0558819e6 Danilo Krummrich 2017-08-28  225  			if (!drvdata->write_ena=
ble)
9ee0a0558819e6 Danilo Krummrich 2017-08-28  226  				goto err;
9ee0a0558819e6 Danilo Krummrich 2017-08-28  227  		}
81b9fd6941ce6f Danilo Krummrich 2022-02-15  228  		break;
81b9fd6941ce6f Danilo Krummrich 2022-02-15  229  	case PS2_STOP_BIT:
81b9fd6941ce6f Danilo Krummrich 2022-02-15  230  		/* stop bit should be hi=
gh */
81b9fd6941ce6f Danilo Krummrich 2022-02-15  231  		if (unlikely(!data)) {
81b9fd6941ce6f Danilo Krummrich 2022-02-15  232  			dev_err(drvdata->dev, "=
RX: stop bit should be high\n");
81b9fd6941ce6f Danilo Krummrich 2022-02-15  233  			goto err;
81b9fd6941ce6f Danilo Krummrich 2022-02-15  234  		}
9ee0a0558819e6 Danilo Krummrich 2017-08-28  235  =

2fa9c57af062de Danilo Krummrich 2022-02-15  236  		/*
2fa9c57af062de Danilo Krummrich 2022-02-15  237  		 * Do not send spurious =
ACK's and NACK's when write fn is
9ee0a0558819e6 Danilo Krummrich 2017-08-28  238  		 * not provided.
9ee0a0558819e6 Danilo Krummrich 2017-08-28  239  		 */
9ee0a0558819e6 Danilo Krummrich 2017-08-28  240  		if (!drvdata->write_enab=
le) {
9ee0a0558819e6 Danilo Krummrich 2017-08-28  241  			if (byte =3D=3D PS2_DEV=
_RET_NACK)
9ee0a0558819e6 Danilo Krummrich 2017-08-28  242  				goto err;
9ee0a0558819e6 Danilo Krummrich 2017-08-28  243  			else if (byte =3D=3D PS=
2_DEV_RET_ACK)
9ee0a0558819e6 Danilo Krummrich 2017-08-28  244  				break;
9ee0a0558819e6 Danilo Krummrich 2017-08-28  245  		}
9ee0a0558819e6 Danilo Krummrich 2017-08-28  246  =

9ee0a0558819e6 Danilo Krummrich 2017-08-28  247  		serio_interrupt(drvdata-=
>serio, byte, rxflags);
9ee0a0558819e6 Danilo Krummrich 2017-08-28  248  		dev_dbg(drvdata->dev, "R=
X: sending byte 0x%x\n", byte);
81b9fd6941ce6f Danilo Krummrich 2022-02-15  249  =

9ee0a0558819e6 Danilo Krummrich 2017-08-28  250  		cnt =3D byte =3D 0;
2fa9c57af062de Danilo Krummrich 2022-02-15  251  =

9ee0a0558819e6 Danilo Krummrich 2017-08-28  252  		goto end; /* success */
9ee0a0558819e6 Danilo Krummrich 2017-08-28  253  	default:
9ee0a0558819e6 Danilo Krummrich 2017-08-28  254  		dev_err(drvdata->dev, "R=
X: got out of sync with the device\n");
9ee0a0558819e6 Danilo Krummrich 2017-08-28  255  		goto err;
9ee0a0558819e6 Danilo Krummrich 2017-08-28  256  	}
9ee0a0558819e6 Danilo Krummrich 2017-08-28  257  =

9ee0a0558819e6 Danilo Krummrich 2017-08-28  258  	cnt++;
9ee0a0558819e6 Danilo Krummrich 2017-08-28  259  	goto end; /* success */
9ee0a0558819e6 Danilo Krummrich 2017-08-28  260  =

9ee0a0558819e6 Danilo Krummrich 2017-08-28  261  err:
9ee0a0558819e6 Danilo Krummrich 2017-08-28  262  	cnt =3D byte =3D 0;
9ee0a0558819e6 Danilo Krummrich 2017-08-28  263  	__ps2_gpio_write(drvdata-=
>serio, PS2_CMD_RESEND);
9ee0a0558819e6 Danilo Krummrich 2017-08-28  264  end:
0dde5f82158b26 Danilo Krummrich 2022-02-15  265  	drvdata->rx.cnt =3D cnt;
0dde5f82158b26 Danilo Krummrich 2022-02-15  266  	drvdata->rx.byte =3D byte;
9ee0a0558819e6 Danilo Krummrich 2017-08-28  267  	return IRQ_HANDLED;
9ee0a0558819e6 Danilo Krummrich 2017-08-28  268  }
9ee0a0558819e6 Danilo Krummrich 2017-08-28  269  =


:::::: The code at line 223 was first introduced by commit
:::::: 9ee0a0558819e63d189426c953668fe1ce7cb637 Input: PS/2 gpio bit bangin=
g driver for serio bus

:::::: TO: Danilo Krummrich <danilokrummrich@dk-develop.de>
:::::: CC: Dmitry Torokhov <dmitry.torokhov@gmail.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8169631209877643858==--

