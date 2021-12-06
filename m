Content-Type: multipart/mixed; boundary="===============5034603723416130510=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v1 1/3] gpio: Get rid of duplicate of_node assignment in the drivers
Date: Tue, 07 Dec 2021 03:52:48 +0800
Message-ID: <202112070345.NhvgDXl2-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5034603723416130510==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20211202210839.79140-1-andriy.shevchenko@linux.intel.com>
References: <20211202210839.79140-1-andriy.shevchenko@linux.intel.com>
TO: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
TO: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
TO: Marc Zyngier <maz@kernel.org>
TO: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>, Matti Vaittinen =
<mazziesaccount@gmail.com>
TO: Sergio Paracuellos <sergio.paracuellos@gmail.com>
TO: Chunyan Zhang <chunyan.zhang@unisoc.com>
TO: Bartosz Golaszewski <brgl@bgdev.pl>
TO: Baruch Siach <baruch@tkos.co.il>
TO: "Uwe Kleine-K=C3=B6nig" <u.kleine-koenig@pengutronix.de>
TO: Tony Lindgren <tony@atomide.com>
TO: Nicolas Saenz Julienne <nsaenz@kernel.org>

Hi Andy,

I love your patch! Perhaps something to improve:

[auto build test WARNING on thierry-reding-pwm/for-next]
[also build test WARNING on rockchip/for-next v5.16-rc4]
[cannot apply to linusw-gpio/for-next next-20211206]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Andy-Shevchenko/gpio-Get-r=
id-of-duplicate-of_node-assignment-in-the-drivers/20211203-051909
base:   https://git.kernel.org/pub/scm/linux/kernel/git/thierry.reding/linu=
x-pwm.git for-next
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm-randconfig-c002-20211205 (https://download.01.org/0day-ci/archi=
ve/20211207/202112070345.NhvgDXl2-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 6e8678=
903523019903222e4521a5e41af743cab0)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/0day-ci/linux/commit/884ea5e4f18badef51842fc94=
8d3b4f0fa538b06
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Andy-Shevchenko/gpio-Get-rid-of-du=
plicate-of_node-assignment-in-the-drivers/20211203-051909
        git checkout 884ea5e4f18badef51842fc948d3b4f0fa538b06
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                   if (!(condition))                                       \
                   ^
   drivers/net/can/spi/mcp251xfd/mcp251xfd-core.c:2729:7: note: Loop condit=
ion is false.  Exiting loop
                       FIELD_GET(MCP251XFD_REG_DEVID_ID_MASK, dev_id),
                       ^
   include/linux/bitfield.h:108:3: note: expanded from macro 'FIELD_GET'
                   __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
                   ^
   include/linux/bitfield.h:52:3: note: expanded from macro '__BF_FIELD_CHE=
CK'
                   BUILD_BUG_ON_MSG((_mask) > (typeof(_reg))~0ull,         \
                   ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:335:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:323:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:307:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/net/can/spi/mcp251xfd/mcp251xfd-core.c:2729:7: note: Assuming th=
e condition is false
                       FIELD_GET(MCP251XFD_REG_DEVID_ID_MASK, dev_id),
                       ^
   include/linux/bitfield.h:108:3: note: expanded from macro 'FIELD_GET'
                   __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:54:3: note: expanded from macro '__BF_FIELD_CHE=
CK'
                   __BUILD_BUG_ON_NOT_POWER_OF_2((_mask) +                 \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:21:15: note: expanded from macro '__BUILD_BUG_=
ON_NOT_POWER_OF_2'
           BUILD_BUG_ON(((n) & ((n) - 1)) !=3D 0)
           ~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:335:22: note: expanded from macro 'compil=
etime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   include/linux/compiler_types.h:323:23: note: expanded from macro '_compi=
letime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:315:9: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
   drivers/net/can/spi/mcp251xfd/mcp251xfd-core.c:2729:7: note: Taking fals=
e branch
                       FIELD_GET(MCP251XFD_REG_DEVID_ID_MASK, dev_id),
                       ^
   include/linux/bitfield.h:108:3: note: expanded from macro 'FIELD_GET'
                   __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
                   ^
   include/linux/bitfield.h:54:3: note: expanded from macro '__BF_FIELD_CHE=
CK'
                   __BUILD_BUG_ON_NOT_POWER_OF_2((_mask) +                 \
                   ^
   include/linux/build_bug.h:21:2: note: expanded from macro '__BUILD_BUG_O=
N_NOT_POWER_OF_2'
           BUILD_BUG_ON(((n) & ((n) - 1)) !=3D 0)
           ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:335:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:323:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:315:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/net/can/spi/mcp251xfd/mcp251xfd-core.c:2729:7: note: Loop condit=
ion is false.  Exiting loop
                       FIELD_GET(MCP251XFD_REG_DEVID_ID_MASK, dev_id),
                       ^
   include/linux/bitfield.h:108:3: note: expanded from macro 'FIELD_GET'
                   __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
                   ^
   include/linux/bitfield.h:54:3: note: expanded from macro '__BF_FIELD_CHE=
CK'
                   __BUILD_BUG_ON_NOT_POWER_OF_2((_mask) +                 \
                   ^
   include/linux/build_bug.h:21:2: note: expanded from macro '__BUILD_BUG_O=
N_NOT_POWER_OF_2'
           BUILD_BUG_ON(((n) & ((n) - 1)) !=3D 0)
           ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:335:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:323:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:307:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/net/can/spi/mcp251xfd/mcp251xfd-core.c:2729:7: note: The left op=
erand of '&' is a garbage value
                       FIELD_GET(MCP251XFD_REG_DEVID_ID_MASK, dev_id),
                       ^
   include/linux/bitfield.h:109:27: note: expanded from macro 'FIELD_GET'
                   (typeof(_mask))(((_reg) & (_mask)) >> __bf_shf(_mask)); \
                                     ~~~~  ^
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   2 warnings generated.
>> drivers/gpio/gpio-rda.c:200:22: warning: Value stored to 'np' during its=
 initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device_node *np =3D pdev->dev.of_node;
                               ^~   ~~~~~~~~~~~~~~~~~
   drivers/gpio/gpio-rda.c:200:22: note: Value stored to 'np' during its in=
itialization is never read
           struct device_node *np =3D pdev->dev.of_node;
                               ^~   ~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 with check filters).
   2 warnings generated.
   drivers/misc/enclosure.c:186:2: warning: Call to function 'strcpy' is in=
secure as it does not provide bounding of the memory buffer. Replace unboun=
ded copy functions with analogous functions that support length arguments s=
uch as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(name, "enclosure_device:");
           ^~~~~~
   drivers/misc/enclosure.c:186:2: note: Call to function 'strcpy' is insec=
ure as it does not provide bounding of the memory buffer. Replace unbounded=
 copy functions with analogous functions that support length arguments such=
 as 'strlcpy'. CWE-119
           strcpy(name, "enclosure_device:");
           ^~~~~~
   drivers/misc/enclosure.c:187:2: warning: Call to function 'strcat' is in=
secure as it does not provide bounding of the memory buffer. Replace unboun=
ded copy functions with analogous functions that support length arguments s=
uch as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcat(name, dev_name(&cdev->cdev));
           ^~~~~~
   drivers/misc/enclosure.c:187:2: note: Call to function 'strcat' is insec=
ure as it does not provide bounding of the memory buffer. Replace unbounded=
 copy functions with analogous functions that support length arguments such=
 as 'strlcat'. CWE-119
           strcat(name, dev_name(&cdev->cdev));
           ^~~~~~
   1 warning generated.
   drivers/misc/gehc-achc.c:152:2: warning: Undefined or garbage value retu=
rned to caller [clang-analyzer-core.uninitialized.UndefReturn]
           return ret;
           ^      ~~~
   drivers/misc/gehc-achc.c:142:2: note: 'ret' declared without an initial =
value
           int ret;
           ^~~~~~~
   drivers/misc/gehc-achc.c:145:14: note: Assuming 'i' is >=3D 'retries'
           for (i =3D 0; i < retries; i++) {
                       ^~~~~~~~~~~
   drivers/misc/gehc-achc.c:145:2: note: Loop condition is false. Execution=
 continues on line 152
           for (i =3D 0; i < retries; i++) {
           ^
   drivers/misc/gehc-achc.c:152:2: note: Undefined or garbage value returne=
d to caller
           return ret;
           ^      ~~~
   1 warning generated.
   drivers/misc/eeprom/at25.c:467:44: warning: The left operand of '&' is a=
 garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           at25->nvmem_config.read_only =3D chip.flags & EE_READONLY;
                                          ~~~~~~~~~~ ^
   drivers/misc/eeprom/at25.c:389:6: note: Assuming 'match' is non-null
           if (match && !strcmp(match->compatible, "cypress,fm25"))
               ^~~~~
   drivers/misc/eeprom/at25.c:389:6: note: Left side of '&&' is true
   drivers/misc/eeprom/at25.c:389:2: note: Taking true branch
           if (match && !strcmp(match->compatible, "cypress,fm25"))
           ^
   drivers/misc/eeprom/at25.c:393:6: note: Assuming field 'platform_data' i=
s null
           if (!spi->dev.platform_data) {
               ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/eeprom/at25.c:393:2: note: Taking true branch
           if (!spi->dev.platform_data) {
           ^
   drivers/misc/eeprom/at25.c:394:8: note: 'is_fram' is true
                   if (!is_fram) {
                        ^~~~~~~
   drivers/misc/eeprom/at25.c:394:3: note: Taking false branch
                   if (!is_fram) {
                   ^
   drivers/misc/eeprom/at25.c:407:6: note: 'sr' is >=3D 0
           if (sr < 0 || sr & AT25_SR_nRDY) {
               ^~
   drivers/misc/eeprom/at25.c:407:6: note: Left side of '||' is false
   drivers/misc/eeprom/at25.c:407:16: note: Assuming the condition is false
           if (sr < 0 || sr & AT25_SR_nRDY) {
                         ^~~~~~~~~~~~~~~~~
   drivers/misc/eeprom/at25.c:407:2: note: Taking false branch
           if (sr < 0 || sr & AT25_SR_nRDY) {
           ^
   drivers/misc/eeprom/at25.c:413:6: note: Assuming 'at25' is non-null
           if (!at25)
               ^~~~~
   drivers/misc/eeprom/at25.c:413:2: note: Taking false branch
           if (!at25)
           ^
   drivers/misc/eeprom/at25.c:416:2: note: Loop condition is false.  Exitin=
g loop
           mutex_init(&at25->lock);
           ^
   include/linux/mutex.h:101:32: note: expanded from macro 'mutex_init'
   #define mutex_init(mutex)                                               \
                                                                           ^
   drivers/misc/eeprom/at25.c:421:6: note: 'is_fram' is true
           if (is_fram) {
               ^~~~~~~
   drivers/misc/eeprom/at25.c:421:2: note: Taking true branch
           if (is_fram) {
           ^
   drivers/misc/eeprom/at25.c:424:7: note: Assuming the condition is false
                   if (id[6] !=3D 0xc2) {
                       ^~~~~~~~~~~~~
   drivers/misc/eeprom/at25.c:424:3: note: Taking false branch
                   if (id[6] !=3D 0xc2) {
                   ^
   drivers/misc/eeprom/at25.c:430:7: note: Assuming the condition is false
                   if (id[7] < 0x21 || id[7] > 0x26) {
                       ^~~~~~~~~~~~
   drivers/misc/eeprom/at25.c:430:7: note: Left side of '||' is false
   drivers/misc/eeprom/at25.c:430:23: note: Assuming the condition is false
                   if (id[7] < 0x21 || id[7] > 0x26) {
                                       ^~~~~~~~~~~~
   drivers/misc/eeprom/at25.c:430:3: note: Taking false branch

vim +/np +200 drivers/gpio/gpio-rda.c

d57eb825e0dc6f Manivannan Sadhasivam 2019-10-21  197  =

d57eb825e0dc6f Manivannan Sadhasivam 2019-10-21  198  static int rda_gpio_p=
robe(struct platform_device *pdev)
d57eb825e0dc6f Manivannan Sadhasivam 2019-10-21  199  {
d57eb825e0dc6f Manivannan Sadhasivam 2019-10-21 @200  	struct device_node *=
np =3D pdev->dev.of_node;
d57eb825e0dc6f Manivannan Sadhasivam 2019-10-21  201  	struct device *dev =
=3D &pdev->dev;
d57eb825e0dc6f Manivannan Sadhasivam 2019-10-21  202  	struct gpio_irq_chip=
 *girq;
d57eb825e0dc6f Manivannan Sadhasivam 2019-10-21  203  	struct rda_gpio *rda=
_gpio;
d57eb825e0dc6f Manivannan Sadhasivam 2019-10-21  204  	u32 ngpios;
d57eb825e0dc6f Manivannan Sadhasivam 2019-10-21  205  	int ret;
d57eb825e0dc6f Manivannan Sadhasivam 2019-10-21  206  =

d57eb825e0dc6f Manivannan Sadhasivam 2019-10-21  207  	rda_gpio =3D devm_kz=
alloc(dev, sizeof(*rda_gpio), GFP_KERNEL);
d57eb825e0dc6f Manivannan Sadhasivam 2019-10-21  208  	if (!rda_gpio)
d57eb825e0dc6f Manivannan Sadhasivam 2019-10-21  209  		return -ENOMEM;
d57eb825e0dc6f Manivannan Sadhasivam 2019-10-21  210  =

d57eb825e0dc6f Manivannan Sadhasivam 2019-10-21  211  	ret =3D device_prope=
rty_read_u32(dev, "ngpios", &ngpios);
d57eb825e0dc6f Manivannan Sadhasivam 2019-10-21  212  	if (ret < 0)
d57eb825e0dc6f Manivannan Sadhasivam 2019-10-21  213  		return ret;
d57eb825e0dc6f Manivannan Sadhasivam 2019-10-21  214  =

d57eb825e0dc6f Manivannan Sadhasivam 2019-10-21  215  	/*
d57eb825e0dc6f Manivannan Sadhasivam 2019-10-21  216  	 * Not all ports hav=
e interrupt capability. For instance, on
d57eb825e0dc6f Manivannan Sadhasivam 2019-10-21  217  	 * RDA8810PL, GPIOC =
doesn't support interrupt. So we must handle
d57eb825e0dc6f Manivannan Sadhasivam 2019-10-21  218  	 * those also.
d57eb825e0dc6f Manivannan Sadhasivam 2019-10-21  219  	 */
d57eb825e0dc6f Manivannan Sadhasivam 2019-10-21  220  	rda_gpio->irq =3D pl=
atform_get_irq(pdev, 0);
d57eb825e0dc6f Manivannan Sadhasivam 2019-10-21  221  =

d57eb825e0dc6f Manivannan Sadhasivam 2019-10-21  222  	rda_gpio->base =3D d=
evm_platform_ioremap_resource(pdev, 0);
d57eb825e0dc6f Manivannan Sadhasivam 2019-10-21  223  	if (IS_ERR(rda_gpio-=
>base))
d57eb825e0dc6f Manivannan Sadhasivam 2019-10-21  224  		return PTR_ERR(rda_=
gpio->base);
d57eb825e0dc6f Manivannan Sadhasivam 2019-10-21  225  =

d57eb825e0dc6f Manivannan Sadhasivam 2019-10-21  226  	spin_lock_init(&rda_=
gpio->lock);
d57eb825e0dc6f Manivannan Sadhasivam 2019-10-21  227  =

d57eb825e0dc6f Manivannan Sadhasivam 2019-10-21  228  	ret =3D bgpio_init(&=
rda_gpio->chip, dev, 4,
d57eb825e0dc6f Manivannan Sadhasivam 2019-10-21  229  			 rda_gpio->base + =
RDA_GPIO_VAL,
d57eb825e0dc6f Manivannan Sadhasivam 2019-10-21  230  			 rda_gpio->base + =
RDA_GPIO_SET,
d57eb825e0dc6f Manivannan Sadhasivam 2019-10-21  231  			 rda_gpio->base + =
RDA_GPIO_CLR,
d57eb825e0dc6f Manivannan Sadhasivam 2019-10-21  232  			 rda_gpio->base + =
RDA_GPIO_OEN_SET_OUT,
d57eb825e0dc6f Manivannan Sadhasivam 2019-10-21  233  			 rda_gpio->base + =
RDA_GPIO_OEN_SET_IN,
d57eb825e0dc6f Manivannan Sadhasivam 2019-10-21  234  			 BGPIOF_READ_OUTPU=
T_REG_SET);
d57eb825e0dc6f Manivannan Sadhasivam 2019-10-21  235  	if (ret) {
d57eb825e0dc6f Manivannan Sadhasivam 2019-10-21  236  		dev_err(dev, "bgpio=
_init failed\n");
d57eb825e0dc6f Manivannan Sadhasivam 2019-10-21  237  		return ret;
d57eb825e0dc6f Manivannan Sadhasivam 2019-10-21  238  	}
d57eb825e0dc6f Manivannan Sadhasivam 2019-10-21  239  =

d57eb825e0dc6f Manivannan Sadhasivam 2019-10-21  240  	rda_gpio->chip.label=
 =3D dev_name(dev);
d57eb825e0dc6f Manivannan Sadhasivam 2019-10-21  241  	rda_gpio->chip.ngpio=
 =3D ngpios;
d57eb825e0dc6f Manivannan Sadhasivam 2019-10-21  242  	rda_gpio->chip.base =
=3D -1;
d57eb825e0dc6f Manivannan Sadhasivam 2019-10-21  243  =

d57eb825e0dc6f Manivannan Sadhasivam 2019-10-21  244  	if (rda_gpio->irq >=
=3D 0) {
d57eb825e0dc6f Manivannan Sadhasivam 2019-10-21  245  		rda_gpio->irq_chip.=
name =3D "rda-gpio",
d57eb825e0dc6f Manivannan Sadhasivam 2019-10-21  246  		rda_gpio->irq_chip.=
irq_ack =3D rda_gpio_irq_ack,
d57eb825e0dc6f Manivannan Sadhasivam 2019-10-21  247  		rda_gpio->irq_chip.=
irq_mask =3D rda_gpio_irq_mask,
d57eb825e0dc6f Manivannan Sadhasivam 2019-10-21  248  		rda_gpio->irq_chip.=
irq_unmask =3D rda_gpio_irq_unmask,
d57eb825e0dc6f Manivannan Sadhasivam 2019-10-21  249  		rda_gpio->irq_chip.=
irq_set_type =3D rda_gpio_irq_set_type,
d57eb825e0dc6f Manivannan Sadhasivam 2019-10-21  250  		rda_gpio->irq_chip.=
flags =3D IRQCHIP_SKIP_SET_WAKE,
d57eb825e0dc6f Manivannan Sadhasivam 2019-10-21  251  =

d57eb825e0dc6f Manivannan Sadhasivam 2019-10-21  252  		girq =3D &rda_gpio-=
>chip.irq;
d57eb825e0dc6f Manivannan Sadhasivam 2019-10-21  253  		girq->chip =3D &rda=
_gpio->irq_chip;
d57eb825e0dc6f Manivannan Sadhasivam 2019-10-21  254  		girq->handler =3D h=
andle_bad_irq;
d57eb825e0dc6f Manivannan Sadhasivam 2019-10-21  255  		girq->default_type =
=3D IRQ_TYPE_NONE;
d57eb825e0dc6f Manivannan Sadhasivam 2019-10-21  256  		girq->parent_handle=
r =3D rda_gpio_irq_handler;
d57eb825e0dc6f Manivannan Sadhasivam 2019-10-21  257  		girq->parent_handle=
r_data =3D rda_gpio;
d57eb825e0dc6f Manivannan Sadhasivam 2019-10-21  258  		girq->num_parents =
=3D 1;
d57eb825e0dc6f Manivannan Sadhasivam 2019-10-21  259  		girq->parents =3D d=
evm_kcalloc(dev, 1,
d57eb825e0dc6f Manivannan Sadhasivam 2019-10-21  260  					     sizeof(*gir=
q->parents),
d57eb825e0dc6f Manivannan Sadhasivam 2019-10-21  261  					     GFP_KERNEL);
d57eb825e0dc6f Manivannan Sadhasivam 2019-10-21  262  		if (!girq->parents)
d57eb825e0dc6f Manivannan Sadhasivam 2019-10-21  263  			return -ENOMEM;
d57eb825e0dc6f Manivannan Sadhasivam 2019-10-21  264  		girq->parents[0] =
=3D rda_gpio->irq;
d57eb825e0dc6f Manivannan Sadhasivam 2019-10-21  265  	}
d57eb825e0dc6f Manivannan Sadhasivam 2019-10-21  266  =

d57eb825e0dc6f Manivannan Sadhasivam 2019-10-21  267  	platform_set_drvdata=
(pdev, rda_gpio);
d57eb825e0dc6f Manivannan Sadhasivam 2019-10-21  268  =

d57eb825e0dc6f Manivannan Sadhasivam 2019-10-21  269  	return devm_gpiochip=
_add_data(dev, &rda_gpio->chip, rda_gpio);
d57eb825e0dc6f Manivannan Sadhasivam 2019-10-21  270  }
d57eb825e0dc6f Manivannan Sadhasivam 2019-10-21  271  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5034603723416130510==--

