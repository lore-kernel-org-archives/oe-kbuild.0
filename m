Content-Type: multipart/mixed; boundary="===============4552237614559945189=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 8143/14159] drivers/pinctrl/stm32/pinctrl-stm32.c:294:24: warning: Value stored to 'pctl' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Thu, 26 May 2022 22:11:32 +0800
Message-ID: <202205262247.4wz3LUVs-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4552237614559945189==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Fabien Dessenne <fabien.dessenne@foss.st.com>
CC: Linus Walleij <linus.walleij@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   b1d84fc09a961e0a8be3d3dc6ca1b7cddc3ced87
commit: 3389b09878dddd58ef52bd0bf43cc42ea5a9ea2a [8143/14159] pinctrl: stm3=
2: prevent the use of the secure protected pins
:::::: branch date: 7 hours ago
:::::: commit date: 3 weeks ago
config: arm-randconfig-c002-20220524 (https://download.01.org/0day-ci/archi=
ve/20220526/202205262247.4wz3LUVs-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 3d5461=
91ad9d7d2ad2c7928204b9de51deafa675)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3D3389b09878dddd58ef52bd0bf43cc42ea5a9ea2a
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 3389b09878dddd58ef52bd0bf43cc42ea5a9ea2a
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   include/linux/printk.h:640:3: note: expanded from macro 'printk_ratelimi=
ted'
                   printk(fmt, ##__VA_ARGS__);                             \
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
   include/linux/hid.h:1055:3: note: '?' condition is true
                   pr_warn_ratelimited("%s: Invalid code %d type %d\n",
                   ^
   include/linux/printk.h:656:2: note: expanded from macro 'pr_warn_ratelim=
ited'
           printk_ratelimited(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:640:3: note: expanded from macro 'printk_ratelimi=
ted'
                   printk(fmt, ##__VA_ARGS__);                             \
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
   include/linux/hid.h:1055:3: note: '?' condition is true
                   pr_warn_ratelimited("%s: Invalid code %d type %d\n",
                   ^
   include/linux/printk.h:656:2: note: expanded from macro 'pr_warn_ratelim=
ited'
           printk_ratelimited(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:640:3: note: expanded from macro 'printk_ratelimi=
ted'
                   printk(fmt, ##__VA_ARGS__);                             \
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
   include/linux/hid.h:1055:3: note: Loop condition is false.  Exiting loop
                   pr_warn_ratelimited("%s: Invalid code %d type %d\n",
                   ^
   include/linux/printk.h:656:2: note: expanded from macro 'pr_warn_ratelim=
ited'
           printk_ratelimited(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:640:3: note: expanded from macro 'printk_ratelimi=
ted'
                   printk(fmt, ##__VA_ARGS__);                             \
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
   include/linux/hid.h:1056:9: note: Access to field 'name' results in a de=
reference of a null pointer (loaded from variable 'input')
                                       input->name, c, type);
                                       ^
   include/linux/printk.h:656:49: note: expanded from macro 'pr_warn_rateli=
mited'
           printk_ratelimited(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
                                                          ^~~~~~~~~~~
   include/linux/printk.h:640:17: note: expanded from macro 'printk_ratelim=
ited'
                   printk(fmt, ##__VA_ARGS__);                             \
                                 ^~~~~~~~~~~
   include/linux/printk.h:446:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                              ^~~~~~~~~~~
   include/linux/printk.h:418:19: note: expanded from macro 'printk_index_w=
rap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                                   ^~~~~~~~~~~
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   drivers/pinctrl/meson/pinctrl-meson8-pmx.c:60:25: warning: Value stored =
to 'func' during its initialization is never read [clang-analyzer-deadcode.=
DeadStores]
           struct meson_pmx_func *func =3D &pc->data->funcs[func_num];
                                  ^~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/meson/pinctrl-meson8-pmx.c:60:25: note: Value stored to =
'func' during its initialization is never read
           struct meson_pmx_func *func =3D &pc->data->funcs[func_num];
                                  ^~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   29 warnings generated.
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   29 warnings generated.
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   32 warnings generated.
>> drivers/pinctrl/stm32/pinctrl-stm32.c:294:24: warning: Value stored to '=
pctl' during its initialization is never read [clang-analyzer-deadcode.Dead=
Stores]
           struct stm32_pinctrl *pctl =3D dev_get_drvdata(bank->gpio_chip.p=
arent);
                                 ^~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/pinctrl/stm32/pinctrl-stm32.c:294:24: note: Value stored to 'pct=
l' during its initialization is never read
           struct stm32_pinctrl *pctl =3D dev_get_drvdata(bank->gpio_chip.p=
arent);
                                 ^~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/pinctrl/stm32/pinctrl-stm32.c:1422:21: warning: Passed-by-value =
struct argument contains uninitialized data (e.g., field: 'id_size') [clang=
-analyzer-core.CallAndMessage]
                   pctl->irqmux[i] =3D devm_regmap_field_alloc(dev, rm, mux=
);
                                     ^
   drivers/pinctrl/stm32/pinctrl-stm32.c:1494:6: note: Assuming 'np' is non=
-null
           if (!np)
               ^~~
   drivers/pinctrl/stm32/pinctrl-stm32.c:1494:2: note: Taking false branch
           if (!np)
           ^
   drivers/pinctrl/stm32/pinctrl-stm32.c:1498:6: note: Assuming 'match' is =
non-null
           if (!match || !match->data)
               ^~~~~~
   drivers/pinctrl/stm32/pinctrl-stm32.c:1498:6: note: Left side of '||' is=
 false
   drivers/pinctrl/stm32/pinctrl-stm32.c:1498:16: note: Assuming field 'dat=
a' is non-null
           if (!match || !match->data)
                         ^~~~~~~~~~~~
   drivers/pinctrl/stm32/pinctrl-stm32.c:1498:2: note: Taking false branch
           if (!match || !match->data)
           ^
   drivers/pinctrl/stm32/pinctrl-stm32.c:1501:6: note: Assuming the conditi=
on is false
           if (!of_find_property(np, "pins-are-numbered", NULL)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/stm32/pinctrl-stm32.c:1501:2: note: Taking false branch
           if (!of_find_property(np, "pins-are-numbered", NULL)) {
           ^
   drivers/pinctrl/stm32/pinctrl-stm32.c:1507:6: note: Assuming 'pctl' is n=
on-null
           if (!pctl)
               ^~~~~
   drivers/pinctrl/stm32/pinctrl-stm32.c:1507:2: note: Taking false branch
           if (!pctl)
           ^
   drivers/pinctrl/stm32/pinctrl-stm32.c:1514:2: note: Taking false branch
           if (IS_ERR(pctl->domain))
           ^
   drivers/pinctrl/stm32/pinctrl-stm32.c:1519:6: note: 'hwlock_id' is >=3D 0
           if (hwlock_id < 0) {
               ^~~~~~~~~
   drivers/pinctrl/stm32/pinctrl-stm32.c:1519:2: note: Taking false branch
           if (hwlock_id < 0) {
           ^
   drivers/pinctrl/stm32/pinctrl-stm32.c:1526:2: note: Loop condition is fa=
lse.  Exiting loop
           spin_lock_init(&pctl->irqmux_lock);
           ^
   include/linux/spinlock.h:339:34: note: expanded from macro 'spin_lock_in=
it'
   # define spin_lock_init(_lock)                  \
                                                   ^
   drivers/pinctrl/stm32/pinctrl-stm32.c:1532:2: note: Taking false branch
           if (!of_property_read_u32(np, "st,package", &pctl->pkg))
           ^
   drivers/pinctrl/stm32/pinctrl-stm32.c:1537:6: note: Assuming field 'pins=
' is non-null
           if (!pctl->pins)
               ^~~~~~~~~~~
   drivers/pinctrl/stm32/pinctrl-stm32.c:1537:2: note: Taking false branch
           if (!pctl->pins)
           ^
   drivers/pinctrl/stm32/pinctrl-stm32.c:1541:6: note: 'ret' is 0
           if (ret)
               ^~~
   drivers/pinctrl/stm32/pinctrl-stm32.c:1541:2: note: Taking false branch
           if (ret)
           ^
   drivers/pinctrl/stm32/pinctrl-stm32.c:1545:6: note: Assuming 'ret' is 0
           if (ret) {
               ^~~
   drivers/pinctrl/stm32/pinctrl-stm32.c:1545:2: note: Taking false branch
           if (ret) {
           ^
   drivers/pinctrl/stm32/pinctrl-stm32.c:1550:6: note: Assuming field 'doma=
in' is non-null
           if (pctl->domain) {
               ^~~~~~~~~~~~
   drivers/pinctrl/stm32/pinctrl-stm32.c:1550:2: note: Taking true branch
           if (pctl->domain) {
           ^
   drivers/pinctrl/stm32/pinctrl-stm32.c:1551:9: note: Calling 'stm32_pctrl=
_dt_setup_irq'
                   ret =3D stm32_pctrl_dt_setup_irq(pdev, pctl);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/stm32/pinctrl-stm32.c:1397:2: note: Taking false branch
           if (IS_ERR(pctl->regmap))
           ^
   drivers/pinctrl/stm32/pinctrl-stm32.c:1403:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   drivers/pinctrl/stm32/pinctrl-stm32.c:1403:2: note: Taking false branch
           if (ret)
           ^
   drivers/pinctrl/stm32/pinctrl-stm32.c:1407:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   drivers/pinctrl/stm32/pinctrl-stm32.c:1407:2: note: Taking false branch
           if (ret)
           ^
   drivers/pinctrl/stm32/pinctrl-stm32.c:1412:2: note: Loop condition is tr=
ue.  Entering loop body
           for (i =3D 0; i < STM32_GPIO_PINS_PER_BANK; i++) {
           ^
   drivers/pinctrl/stm32/pinctrl-stm32.c:1413:3: note: 'mux' initialized he=
re

vim +/pctl +294 drivers/pinctrl/stm32/pinctrl-stm32.c

acaa037970f610 Alexandre TORGUE 2017-05-29  288  =

3389b09878dddd Fabien Dessenne  2022-05-02  289  static int stm32_gpio_init=
_valid_mask(struct gpio_chip *chip,
3389b09878dddd Fabien Dessenne  2022-05-02  290  				      unsigned long *v=
alid_mask,
3389b09878dddd Fabien Dessenne  2022-05-02  291  				      unsigned int ngp=
ios)
3389b09878dddd Fabien Dessenne  2022-05-02  292  {
3389b09878dddd Fabien Dessenne  2022-05-02  293  	struct stm32_gpio_bank *b=
ank =3D gpiochip_get_data(chip);
3389b09878dddd Fabien Dessenne  2022-05-02 @294  	struct stm32_pinctrl *pct=
l =3D dev_get_drvdata(bank->gpio_chip.parent);
3389b09878dddd Fabien Dessenne  2022-05-02  295  	unsigned int i;
3389b09878dddd Fabien Dessenne  2022-05-02  296  	u32 sec;
3389b09878dddd Fabien Dessenne  2022-05-02  297  =

3389b09878dddd Fabien Dessenne  2022-05-02  298  	/* All gpio are valid per=
 default */
3389b09878dddd Fabien Dessenne  2022-05-02  299  	bitmap_fill(valid_mask, n=
gpios);
3389b09878dddd Fabien Dessenne  2022-05-02  300  =

3389b09878dddd Fabien Dessenne  2022-05-02  301  	if (bank->secure_control)=
 {
3389b09878dddd Fabien Dessenne  2022-05-02  302  		/* Tag secured pins as i=
nvalid */
3389b09878dddd Fabien Dessenne  2022-05-02  303  		sec =3D readl_relaxed(ba=
nk->base + STM32_GPIO_SECCFGR);
3389b09878dddd Fabien Dessenne  2022-05-02  304  =

3389b09878dddd Fabien Dessenne  2022-05-02  305  		for (i =3D 0; i < ngpios=
; i++) {
3389b09878dddd Fabien Dessenne  2022-05-02  306  			if (sec & BIT(i)) {
3389b09878dddd Fabien Dessenne  2022-05-02  307  				clear_bit(i, valid_mas=
k);
3389b09878dddd Fabien Dessenne  2022-05-02  308  				dev_dbg(pctl->dev, "No=
 access to gpio %d - %d\n", bank->bank_nr, i);
3389b09878dddd Fabien Dessenne  2022-05-02  309  			}
3389b09878dddd Fabien Dessenne  2022-05-02  310  		}
3389b09878dddd Fabien Dessenne  2022-05-02  311  	}
3389b09878dddd Fabien Dessenne  2022-05-02  312  =

3389b09878dddd Fabien Dessenne  2022-05-02  313  	return 0;
3389b09878dddd Fabien Dessenne  2022-05-02  314  }
3389b09878dddd Fabien Dessenne  2022-05-02  315  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4552237614559945189==--

