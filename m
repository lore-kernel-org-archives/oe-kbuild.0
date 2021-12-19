Content-Type: multipart/mixed; boundary="===============8115394332702656916=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 5/8] pinctrl: nuvoton: Add driver for WPCM450
Date: Sun, 19 Dec 2021 09:24:36 +0800
Message-ID: <202112190905.PgqrgXiI-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8115394332702656916==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20211207210823.1975632-6-j.neuschaefer@gmx.net>
References: <20211207210823.1975632-6-j.neuschaefer@gmx.net>
TO: "Jonathan Neusch=C3=A4fer" <j.neuschaefer@gmx.net>
TO: linux-gpio(a)vger.kernel.org
TO: devicetree(a)vger.kernel.org
CC: Linus Walleij <linus.walleij@linaro.org>
CC: Rob Herring <robh+dt@kernel.org>
CC: openbmc(a)lists.ozlabs.org
CC: Tomer Maimon <tmaimon77@gmail.com>
CC: Joel Stanley <joel@jms.id.au>
CC: linux-kernel(a)vger.kernel.org
CC: "Jonathan Neusch=C3=A4fer" <j.neuschaefer@gmx.net>

Hi "Jonathan,

I love your patch! Perhaps something to improve:

[auto build test WARNING on linusw-pinctrl/devel]
[also build test WARNING on robh/for-next linus/master v5.16-rc5 next-20211=
217]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Jonathan-Neusch-fer/Nuvoto=
n-WPCM450-pinctrl-and-GPIO-driver/20211208-051101
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctr=
l.git devel
:::::: branch date: 11 days ago
:::::: commit date: 11 days ago
config: arm-randconfig-c002-20211209 (https://download.01.org/0day-ci/archi=
ve/20211219/202112190905.PgqrgXiI-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 097a1c=
b1d5ebb3a0ec4bcaed8ba3ff6a8e33c00a)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/0day-ci/linux/commit/c08fb0aafb60234854aa86433=
da809fe5112f55e
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Jonathan-Neusch-fer/Nuvoton-WPCM45=
0-pinctrl-and-GPIO-driver/20211208-051101
        git checkout c08fb0aafb60234854aa86433da809fe5112f55e
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   include/linux/printk.h:387:14: note: expanded from macro '__printk_index=
_emit'
                                   .level =3D __builtin_constant_p(_level) =
? (_level) : NULL, \
                                            ^
   drivers/bus/intel-ixp4xx-eb.c:195:2: note: Loop condition is false.  Exi=
ting loop
           dev_info(eb->dev, "CS%d at %#08x, size %#08x, config before: %#0=
8x\n",
           ^
   include/linux/dev_printk.h:150:2: note: expanded from macro 'dev_info'
           dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), #=
#__VA_ARGS__)
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
   include/linux/printk.h:373:2: note: expanded from macro '__printk_index_=
emit'
           do {                                                            \
           ^
   drivers/bus/intel-ixp4xx-eb.c:200:15: note: '?' condition is false
           cur_cssize =3D roundup_pow_of_two(cur_cssize);
                        ^
   include/linux/log2.h:176:2: note: expanded from macro 'roundup_pow_of_tw=
o'
           __builtin_constant_p(n) ? (             \
           ^
   drivers/bus/intel-ixp4xx-eb.c:200:15: note: Calling '__roundup_pow_of_tw=
o'
           cur_cssize =3D roundup_pow_of_two(cur_cssize);
                        ^
   include/linux/log2.h:180:2: note: expanded from macro 'roundup_pow_of_tw=
o'
           __roundup_pow_of_two(n)                 \
           ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/log2.h:57:16: note: Calling 'fls_long'
           return 1UL << fls_long(n - 1);
                         ^~~~~~~~~~~~~~~
   include/linux/bitops.h:188:2: note: Taking true branch
           if (sizeof(l) =3D=3D 4)
           ^
   include/linux/bitops.h:189:10: note: Calling 'fls'
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
   include/linux/bitops.h:189:10: note: Returning from 'fls'
                   return fls(l);
                          ^~~~~~
   include/linux/bitops.h:189:3: note: Returning the value 32
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
   10 warnings generated.
>> drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c:1562:26: warning: Value stored=
 to 'npcm' during its initialization is never read [clang-analyzer-deadcode=
.DeadStores]
           struct npcm7xx_pinctrl *npcm =3D pinctrl_dev_get_drvdata(pctldev=
);
                                   ^~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c:1562:26: note: Value stored to=
 'npcm' during its initialization is never read
           struct npcm7xx_pinctrl *npcm =3D pinctrl_dev_get_drvdata(pctldev=
);
                                   ^~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c:1590:26: warning: Value stored=
 to 'npcm' during its initialization is never read [clang-analyzer-deadcode=
.DeadStores]
           struct npcm7xx_pinctrl *npcm =3D pinctrl_dev_get_drvdata(pctldev=
);
                                   ^~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c:1590:26: note: Value stored to=
 'npcm' during its initialization is never read
           struct npcm7xx_pinctrl *npcm =3D pinctrl_dev_get_drvdata(pctldev=
);
                                   ^~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   drivers/pinctrl/samsung/pinctrl-samsung.c:1065:19: warning: Assigned val=
ue is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
                   bank->eint_base =3D virt_base[0];
                                   ^
   drivers/pinctrl/samsung/pinctrl-samsung.c:1102:6: note: Assuming 'drvdat=
a' is non-null
           if (!drvdata)
               ^~~~~~~~
   drivers/pinctrl/samsung/pinctrl-samsung.c:1102:2: note: Taking false bra=
nch
           if (!drvdata)
           ^
   drivers/pinctrl/samsung/pinctrl-samsung.c:1105:9: note: Calling 'samsung=
_pinctrl_get_soc_data'
           ctrl =3D samsung_pinctrl_get_soc_data(drvdata, pdev);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/samsung/pinctrl-samsung.c:1019:9: note: Calling 'samsung=
_pinctrl_get_soc_data_for_of_alias'
           ctrl =3D samsung_pinctrl_get_soc_data_for_of_alias(pdev);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/samsung/pinctrl-samsung.c:991:6: note: Assuming 'id' is =
>=3D 0
           if (id < 0) {
               ^~~~~~
   drivers/pinctrl/samsung/pinctrl-samsung.c:991:2: note: Taking false bran=
ch
           if (id < 0) {
           ^
   drivers/pinctrl/samsung/pinctrl-samsung.c:997:6: note: Assuming 'id' is =
< field 'num_ctrl'
           if (id >=3D of_data->num_ctrl) {
               ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/samsung/pinctrl-samsung.c:997:2: note: Taking false bran=
ch
           if (id >=3D of_data->num_ctrl) {
           ^
   drivers/pinctrl/samsung/pinctrl-samsung.c:1002:2: note: Returning pointe=
r, which participates in a condition later
           return &(of_data->ctrl[id]);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/samsung/pinctrl-samsung.c:1019:9: note: Returning from '=
samsung_pinctrl_get_soc_data_for_of_alias'
           ctrl =3D samsung_pinctrl_get_soc_data_for_of_alias(pdev);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/samsung/pinctrl-samsung.c:1020:6: note: Assuming 'ctrl' =
is non-null
           if (!ctrl)
               ^~~~~
   drivers/pinctrl/samsung/pinctrl-samsung.c:1020:2: note: Taking false bra=
nch
           if (!ctrl)
           ^
   drivers/pinctrl/samsung/pinctrl-samsung.c:1026:17: note: Calling 'devm_k=
calloc'
           d->pin_banks =3D devm_kcalloc(&pdev->dev, d->nr_banks,
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:223:9: note: Calling 'devm_kmalloc_array'
           return devm_kmalloc_array(dev, n, size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:215:2: note: Taking false branch
           if (unlikely(check_mul_overflow(n, size, &bytes)))
           ^
   include/linux/device.h:218:2: note: Returning pointer, which participate=
s in a condition later
           return devm_kmalloc(dev, bytes, flags);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:223:9: note: Returning from 'devm_kmalloc_array'
           return devm_kmalloc_array(dev, n, size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:223:2: note: Returning pointer, which participate=
s in a condition later
           return devm_kmalloc_array(dev, n, size, flags | __GFP_ZERO);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/samsung/pinctrl-samsung.c:1026:17: note: Returning from =
'devm_kcalloc'
           d->pin_banks =3D devm_kcalloc(&pdev->dev, d->nr_banks,
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/samsung/pinctrl-samsung.c:1028:6: note: Assuming field '=
pin_banks' is non-null
           if (!d->pin_banks)
               ^~~~~~~~~~~~~
   drivers/pinctrl/samsung/pinctrl-samsung.c:1028:2: note: Taking false bra=
nch
           if (!d->pin_banks)
           ^
   drivers/pinctrl/samsung/pinctrl-samsung.c:1031:6: note: Assuming the con=
dition is false
           if (ctrl->nr_ext_resources + 1 > SAMSUNG_PINCTRL_NUM_RESOURCES)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/samsung/pinctrl-samsung.c:1031:2: note: Taking false bra=
nch
           if (ctrl->nr_ext_resources + 1 > SAMSUNG_PINCTRL_NUM_RESOURCES)
           ^
   drivers/pinctrl/samsung/pinctrl-samsung.c:1034:14: note: Assuming the co=
ndition is false
           for (i =3D 0; i < ctrl->nr_ext_resources + 1; i++) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/samsung/pinctrl-samsung.c:1034:2: note: Loop condition i=
s false. Execution continues on line 1048
           for (i =3D 0; i < ctrl->nr_ext_resources + 1; i++) {
           ^
   drivers/pinctrl/samsung/pinctrl-samsung.c:1050:14: note: Assuming 'i' is=
 < field 'nr_banks'
           for (i =3D 0; i < ctrl->nr_banks; ++i, ++bdata, ++bank) {
                       ^~~~~~~~~~~~~~~~~~
   drivers/pinctrl/samsung/pinctrl-samsung.c:1050:2: note: Loop condition i=
s true.  Entering loop body
           for (i =3D 0; i < ctrl->nr_banks; ++i, ++bdata, ++bank) {
           ^
   drivers/pinctrl/samsung/pinctrl-samsung.c:1060:3: note: Loop condition i=
s false.  Exiting loop
                   raw_spin_lock_init(&bank->slock);

vim +/npcm +1562 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c

3b588e43ee5c7a Tomer Maimon 2018-08-08  1559  =

3b588e43ee5c7a Tomer Maimon 2018-08-08  1560  static int npcm7xx_get_groups=
_count(struct pinctrl_dev *pctldev)
3b588e43ee5c7a Tomer Maimon 2018-08-08  1561  {
3b588e43ee5c7a Tomer Maimon 2018-08-08 @1562  	struct npcm7xx_pinctrl *npcm=
 =3D pinctrl_dev_get_drvdata(pctldev);
3b588e43ee5c7a Tomer Maimon 2018-08-08  1563  =

3b588e43ee5c7a Tomer Maimon 2018-08-08  1564  	dev_dbg(npcm->dev, "group si=
ze: %d\n", ARRAY_SIZE(npcm7xx_groups));
3b588e43ee5c7a Tomer Maimon 2018-08-08  1565  	return ARRAY_SIZE(npcm7xx_gr=
oups);
3b588e43ee5c7a Tomer Maimon 2018-08-08  1566  }
3b588e43ee5c7a Tomer Maimon 2018-08-08  1567  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8115394332702656916==--

