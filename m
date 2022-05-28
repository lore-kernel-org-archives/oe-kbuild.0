Content-Type: multipart/mixed; boundary="===============3644133898786267930=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 8120/14198] drivers/pinctrl/stm32/pinctrl-stm32.c:294:24: warning: Value stored to 'pctl' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Sun, 29 May 2022 01:56:20 +0800
Message-ID: <202205290102.UgR3L6GL-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3644133898786267930==
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
head:   d3fde8ff50ab265749704bd7fbcf70d35235421f
commit: 3389b09878dddd58ef52bd0bf43cc42ea5a9ea2a [8120/14198] pinctrl: stm3=
2: prevent the use of the secure protected pins
:::::: branch date: 35 hours ago
:::::: commit date: 3 weeks ago
config: arm-randconfig-c002-20220524 (https://download.01.org/0day-ci/archi=
ve/20220529/202205290102.UgR3L6GL-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0fbe3f=
3f486e01448121f7931a4ca29fac1504ab)
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
               ^~~~~~~~~~~~
   fs/nilfs2/btree.c:2324:2: note: Taking false branch
           if (path =3D=3D NULL)
           ^
   fs/nilfs2/btree.c:2328:6: note: 'ret' is >=3D 0
           if (ret < 0) {
               ^~~
   fs/nilfs2/btree.c:2328:2: note: Taking false branch
           if (ret < 0) {
           ^
   fs/nilfs2/btree.c:2332:8: note: Calling 'nilfs_btree_get_block'
           ret =3D nilfs_btree_get_block(btree, ptr, &bh);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/nilfs2/btree.c:534:9: note: Calling '__nilfs_btree_get_block'
           return __nilfs_btree_get_block(btree, ptr, bhp, NULL);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/nilfs2/btree.c:482:6: note: Assuming 'ret' is not equal to 0
           if (ret) {
               ^~~
   fs/nilfs2/btree.c:482:2: note: Taking true branch
           if (ret) {
           ^
   fs/nilfs2/btree.c:483:7: note: Assuming the condition is true
                   if (ret !=3D -EEXIST)
                       ^~~~~~~~~~~~~~
   fs/nilfs2/btree.c:483:3: note: Taking true branch
                   if (ret !=3D -EEXIST)
                   ^
   fs/nilfs2/btree.c:484:4: note: Returning without writing to '*bhp'
                           return ret;
                           ^
   fs/nilfs2/btree.c:534:9: note: Returning from '__nilfs_btree_get_block'
           return __nilfs_btree_get_block(btree, ptr, bhp, NULL);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/nilfs2/btree.c:534:2: note: Returning without writing to '*bhp'
           return __nilfs_btree_get_block(btree, ptr, bhp, NULL);
           ^
   fs/nilfs2/btree.c:2332:8: note: Returning from 'nilfs_btree_get_block'
           ret =3D nilfs_btree_get_block(btree, ptr, &bh);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/nilfs2/btree.c:2333:6: note: Assuming 'ret' is >=3D 0
           if (ret < 0) {
               ^~~~~~~
   fs/nilfs2/btree.c:2333:2: note: Taking false branch
           if (ret < 0) {
           ^
   fs/nilfs2/btree.c:2338:7: note: 1st function call argument is an uniniti=
alized value
           if (!buffer_dirty(bh))
                ^            ~~
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   Suppressed 17 warnings (17 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   43 warnings generated.
   kernel/kmod.c:142:8: warning: Call to function 'vsnprintf' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'vsnprintf_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           ret =3D vsnprintf(module_name, MODULE_NAME_LEN, fmt, args);
                 ^~~~~~~~~
   kernel/kmod.c:142:8: note: Call to function 'vsnprintf' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'vsnprintf_s' in case of C11
           ret =3D vsnprintf(module_name, MODULE_NAME_LEN, fmt, args);
                 ^~~~~~~~~
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   Suppressed 30 warnings (30 in non-user code).
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
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
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
--===============3644133898786267930==--

