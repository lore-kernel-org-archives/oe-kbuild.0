Content-Type: multipart/mixed; boundary="===============6889505243059405095=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] pinctrl: stm32: prevent the use of the secure protected pins
Date: Wed, 04 May 2022 03:27:02 +0800
Message-ID: <202205040335.lyMPmxR4-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6889505243059405095==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220502153114.283618-1-fabien.dessenne@foss.st.com>
References: <20220502153114.283618-1-fabien.dessenne@foss.st.com>
TO: Fabien Dessenne <fabien.dessenne@foss.st.com>
TO: Linus Walleij <linus.walleij@linaro.org>
TO: Maxime Coquelin <mcoquelin.stm32@gmail.com>
TO: Alexandre Torgue <alexandre.torgue@foss.st.com>
TO: linux-gpio(a)vger.kernel.org
TO: linux-stm32(a)st-md-mailman.stormreply.com
TO: linux-arm-kernel(a)lists.infradead.org
TO: linux-kernel(a)vger.kernel.org
CC: Fabien Dessenne <fabien.dessenne@foss.st.com>

Hi Fabien,

I love your patch! Perhaps something to improve:

[auto build test WARNING on atorgue-stm32/stm32-next]
[also build test WARNING on linusw-pinctrl/devel v5.18-rc5 next-20220503]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Fabien-Dessenne/pinc=
trl-stm32-prevent-the-use-of-the-secure-protected-pins/20220502-233443
base:   https://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git s=
tm32-next
:::::: branch date: 28 hours ago
:::::: commit date: 28 hours ago
config: riscv-randconfig-c006-20220501 (https://download.01.org/0day-ci/arc=
hive/20220504/202205040335.lyMPmxR4-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 363b3a=
645a1e30011cc8da624f13dac5fd915628)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/39534741c9e791ea613=
038c0cc5a8fbe475430bc
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Fabien-Dessenne/pinctrl-stm32-prev=
ent-the-use-of-the-secure-protected-pins/20220502-233443
        git checkout 39534741c9e791ea613038c0cc5a8fbe475430bc
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   fs/udf/misc.c:73:4: note: Call to function 'memmove' is insecure as it d=
oes not provide security checks introduced in the C11 standard. Replace wit=
h analogous functions that support length arguments or provides boundary ch=
ecks such as 'memmove_s' in case of C11
                           memmove(&ad[size], ad, iinfo->i_lenAlloc);
                           ^
   include/linux/fortify-string.h:373:27: note: expanded from macro 'memmov=
e'
   #define memmove(p, q, s)  __fortify_memcpy_chk(p, q, s,                 \
                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:46:30: note: expanded from macro '__under=
lying_memmove'
   #define __underlying_memmove    __builtin_memmove
                                   ^~~~~~~~~~~~~~~~~
   fs/udf/misc.c:107:5: warning: Call to function 'memmove' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memmove_s' in case of C11 [clang-analyzer-security.insecu=
reAPI.DeprecatedOrUnsafeBufferHandling]
                                   memmove(&ea[offset - aal + size],
                                   ^
   include/linux/fortify-string.h:373:27: note: expanded from macro 'memmov=
e'
   #define memmove(p, q, s)  __fortify_memcpy_chk(p, q, s,                 \
                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:46:30: note: expanded from macro '__under=
lying_memmove'
   #define __underlying_memmove    __builtin_memmove
                                   ^~~~~~~~~~~~~~~~~
   fs/udf/misc.c:107:5: note: Call to function 'memmove' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memmove_s' in case of C11
                                   memmove(&ea[offset - aal + size],
                                   ^
   include/linux/fortify-string.h:373:27: note: expanded from macro 'memmov=
e'
   #define memmove(p, q, s)  __fortify_memcpy_chk(p, q, s,                 \
                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:46:30: note: expanded from macro '__under=
lying_memmove'
   #define __underlying_memmove    __builtin_memmove
                                   ^~~~~~~~~~~~~~~~~
   fs/udf/misc.c:117:5: warning: Call to function 'memmove' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memmove_s' in case of C11 [clang-analyzer-security.insecu=
reAPI.DeprecatedOrUnsafeBufferHandling]
                                   memmove(&ea[offset - ial + size],
                                   ^
   include/linux/fortify-string.h:373:27: note: expanded from macro 'memmov=
e'
   #define memmove(p, q, s)  __fortify_memcpy_chk(p, q, s,                 \
                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:46:30: note: expanded from macro '__under=
lying_memmove'
   #define __underlying_memmove    __builtin_memmove
                                   ^~~~~~~~~~~~~~~~~
   fs/udf/misc.c:117:5: note: Call to function 'memmove' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memmove_s' in case of C11
                                   memmove(&ea[offset - ial + size],
                                   ^
   include/linux/fortify-string.h:373:27: note: expanded from macro 'memmov=
e'
   #define memmove(p, q, s)  __fortify_memcpy_chk(p, q, s,                 \
                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:46:30: note: expanded from macro '__under=
lying_memmove'
   #define __underlying_memmove    __builtin_memmove
                                   ^~~~~~~~~~~~~~~~~
   fs/udf/misc.c:128:5: warning: Call to function 'memmove' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memmove_s' in case of C11 [clang-analyzer-security.insecu=
reAPI.DeprecatedOrUnsafeBufferHandling]
                                   memmove(&ea[offset - aal + size],
                                   ^
   include/linux/fortify-string.h:373:27: note: expanded from macro 'memmov=
e'
   #define memmove(p, q, s)  __fortify_memcpy_chk(p, q, s,                 \
                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:46:30: note: expanded from macro '__under=
lying_memmove'
   #define __underlying_memmove    __builtin_memmove
                                   ^~~~~~~~~~~~~~~~~
   fs/udf/misc.c:128:5: note: Call to function 'memmove' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memmove_s' in case of C11
                                   memmove(&ea[offset - aal + size],
                                   ^
   include/linux/fortify-string.h:373:27: note: expanded from macro 'memmov=
e'
   #define memmove(p, q, s)  __fortify_memcpy_chk(p, q, s,                 \
                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:46:30: note: expanded from macro '__under=
lying_memmove'
   #define __underlying_memmove    __builtin_memmove
                                   ^~~~~~~~~~~~~~~~~
   Suppressed 50 warnings (50 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   38 warnings generated.
   Suppressed 38 warnings (38 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   39 warnings generated.
   Suppressed 39 warnings (38 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   40 warnings generated.
>> drivers/pinctrl/stm32/pinctrl-stm32.c:304:24: warning: Value stored to '=
pctl' during its initialization is never read [clang-analyzer-deadcode.Dead=
Stores]
           struct stm32_pinctrl *pctl =3D dev_get_drvdata(bank->gpio_chip.p=
arent);
                                 ^~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/pinctrl/stm32/pinctrl-stm32.c:304:24: note: Value stored to 'pct=
l' during its initialization is never read
           struct stm32_pinctrl *pctl =3D dev_get_drvdata(bank->gpio_chip.p=
arent);
                                 ^~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/pinctrl/stm32/pinctrl-stm32.c:1419:21: warning: Passed-by-value =
struct argument contains uninitialized data (e.g., field: 'id_size') [clang=
-analyzer-core.CallAndMessage]
                   pctl->irqmux[i] =3D devm_regmap_field_alloc(dev, rm, mux=
);
                                     ^
   drivers/pinctrl/stm32/pinctrl-stm32.c:1489:6: note: Assuming 'np' is non=
-null
           if (!np)
               ^~~
   drivers/pinctrl/stm32/pinctrl-stm32.c:1489:2: note: Taking false branch
           if (!np)
           ^
   drivers/pinctrl/stm32/pinctrl-stm32.c:1493:6: note: Assuming 'match' is =
non-null
           if (!match || !match->data)
               ^~~~~~
   drivers/pinctrl/stm32/pinctrl-stm32.c:1493:6: note: Left side of '||' is=
 false
   drivers/pinctrl/stm32/pinctrl-stm32.c:1493:16: note: Assuming field 'dat=
a' is non-null
           if (!match || !match->data)
                         ^~~~~~~~~~~~
   drivers/pinctrl/stm32/pinctrl-stm32.c:1493:2: note: Taking false branch
           if (!match || !match->data)
           ^
   drivers/pinctrl/stm32/pinctrl-stm32.c:1496:6: note: Assuming the conditi=
on is false
           if (!of_find_property(np, "pins-are-numbered", NULL)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/stm32/pinctrl-stm32.c:1496:2: note: Taking false branch
           if (!of_find_property(np, "pins-are-numbered", NULL)) {
           ^
   drivers/pinctrl/stm32/pinctrl-stm32.c:1502:6: note: Assuming 'pctl' is n=
on-null
           if (!pctl)
               ^~~~~
   drivers/pinctrl/stm32/pinctrl-stm32.c:1502:2: note: Taking false branch
           if (!pctl)
           ^
   drivers/pinctrl/stm32/pinctrl-stm32.c:1509:2: note: Taking false branch
           if (IS_ERR(pctl->domain))
           ^
   drivers/pinctrl/stm32/pinctrl-stm32.c:1514:6: note: 'hwlock_id' is >=3D 0
           if (hwlock_id < 0) {
               ^~~~~~~~~
   drivers/pinctrl/stm32/pinctrl-stm32.c:1514:2: note: Taking false branch
           if (hwlock_id < 0) {
           ^
   drivers/pinctrl/stm32/pinctrl-stm32.c:1521:2: note: Loop condition is fa=
lse.  Exiting loop
           spin_lock_init(&pctl->irqmux_lock);
           ^
   include/linux/spinlock.h:329:35: note: expanded from macro 'spin_lock_in=
it'
   # define spin_lock_init(lock)                                   \
                                                                   ^
   drivers/pinctrl/stm32/pinctrl-stm32.c:1527:2: note: Taking false branch
           if (!of_property_read_u32(np, "st,package", &pctl->pkg))
           ^
   drivers/pinctrl/stm32/pinctrl-stm32.c:1532:6: note: Assuming field 'pins=
' is non-null
           if (!pctl->pins)
               ^~~~~~~~~~~
   drivers/pinctrl/stm32/pinctrl-stm32.c:1532:2: note: Taking false branch
           if (!pctl->pins)
           ^
   drivers/pinctrl/stm32/pinctrl-stm32.c:1536:6: note: 'ret' is 0
           if (ret)
               ^~~
   drivers/pinctrl/stm32/pinctrl-stm32.c:1536:2: note: Taking false branch
           if (ret)
           ^
   drivers/pinctrl/stm32/pinctrl-stm32.c:1540:6: note: Assuming 'ret' is 0
           if (ret) {
               ^~~
   drivers/pinctrl/stm32/pinctrl-stm32.c:1540:2: note: Taking false branch
           if (ret) {
           ^
   drivers/pinctrl/stm32/pinctrl-stm32.c:1545:6: note: Assuming field 'doma=
in' is non-null
           if (pctl->domain) {
               ^~~~~~~~~~~~
   drivers/pinctrl/stm32/pinctrl-stm32.c:1545:2: note: Taking true branch
           if (pctl->domain) {
           ^
   drivers/pinctrl/stm32/pinctrl-stm32.c:1546:9: note: Calling 'stm32_pctrl=
_dt_setup_irq'
                   ret =3D stm32_pctrl_dt_setup_irq(pdev, pctl);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/stm32/pinctrl-stm32.c:1394:2: note: Taking false branch
           if (IS_ERR(pctl->regmap))
           ^
   drivers/pinctrl/stm32/pinctrl-stm32.c:1400:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   drivers/pinctrl/stm32/pinctrl-stm32.c:1400:2: note: Taking false branch
           if (ret)
           ^
   drivers/pinctrl/stm32/pinctrl-stm32.c:1404:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   drivers/pinctrl/stm32/pinctrl-stm32.c:1404:2: note: Taking false branch
           if (ret)
           ^
   drivers/pinctrl/stm32/pinctrl-stm32.c:1409:2: note: Loop condition is tr=
ue.  Entering loop body
           for (i =3D 0; i < STM32_GPIO_PINS_PER_BANK; i++) {
           ^
   drivers/pinctrl/stm32/pinctrl-stm32.c:1410:3: note: 'mux' initialized he=
re

vim +/pctl +304 drivers/pinctrl/stm32/pinctrl-stm32.c

acaa037970f610 Alexandre TORGUE 2017-05-29  298  =

39534741c9e791 Fabien Dessenne  2022-05-02  299  static int stm32_gpio_init=
_valid_mask(struct gpio_chip *chip,
39534741c9e791 Fabien Dessenne  2022-05-02  300  				      unsigned long *v=
alid_mask,
39534741c9e791 Fabien Dessenne  2022-05-02  301  				      unsigned int ngp=
ios)
39534741c9e791 Fabien Dessenne  2022-05-02  302  {
39534741c9e791 Fabien Dessenne  2022-05-02  303  	struct stm32_gpio_bank *b=
ank =3D gpiochip_get_data(chip);
39534741c9e791 Fabien Dessenne  2022-05-02 @304  	struct stm32_pinctrl *pct=
l =3D dev_get_drvdata(bank->gpio_chip.parent);
39534741c9e791 Fabien Dessenne  2022-05-02  305  	unsigned int i;
39534741c9e791 Fabien Dessenne  2022-05-02  306  	u32 sec;
39534741c9e791 Fabien Dessenne  2022-05-02  307  =

39534741c9e791 Fabien Dessenne  2022-05-02  308  	/* All gpio are valid per=
 default */
39534741c9e791 Fabien Dessenne  2022-05-02  309  	bitmap_fill(valid_mask, n=
gpios);
39534741c9e791 Fabien Dessenne  2022-05-02  310  =

39534741c9e791 Fabien Dessenne  2022-05-02  311  	if (bank->secure_control)=
 {
39534741c9e791 Fabien Dessenne  2022-05-02  312  		/* Tag secured pins as i=
nvalid */
39534741c9e791 Fabien Dessenne  2022-05-02  313  		sec =3D readl_relaxed(ba=
nk->base + STM32_GPIO_SECCFGR);
39534741c9e791 Fabien Dessenne  2022-05-02  314  =

39534741c9e791 Fabien Dessenne  2022-05-02  315  		for (i =3D 0; i < ngpios=
; i++) {
39534741c9e791 Fabien Dessenne  2022-05-02  316  			if (sec & BIT(i)) {
39534741c9e791 Fabien Dessenne  2022-05-02  317  				clear_bit(i, valid_mas=
k);
39534741c9e791 Fabien Dessenne  2022-05-02  318  				dev_dbg(pctl->dev, "No=
 access to gpio %d - %d\n", bank->bank_nr, i);
39534741c9e791 Fabien Dessenne  2022-05-02  319  			}
39534741c9e791 Fabien Dessenne  2022-05-02  320  		}
39534741c9e791 Fabien Dessenne  2022-05-02  321  	}
39534741c9e791 Fabien Dessenne  2022-05-02  322  =

39534741c9e791 Fabien Dessenne  2022-05-02  323  	return 0;
39534741c9e791 Fabien Dessenne  2022-05-02  324  }
39534741c9e791 Fabien Dessenne  2022-05-02  325  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6889505243059405095==--

