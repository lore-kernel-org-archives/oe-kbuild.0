Content-Type: multipart/mixed; boundary="===============2005301716878862206=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linusw-pinctrl:devel 44/71] drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c:1562:26: warning: Value stored to 'npcm' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Thu, 17 Mar 2022 01:45:32 +0800
Message-ID: <202203170101.EdmxWKnf-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2005301716878862206==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-gpio(a)vger.kernel.org
TO: "Jonathan Neusch=C3=A4fer" <j.neuschaefer@gmx.net>
CC: Linus Walleij <linus.walleij@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctr=
l.git devel
head:   89388f8730699c259f8090ec435fb43569efe4ac
commit: a1d1e0e3d80a870cc37a6c064994b89e963d2b58 [44/71] pinctrl: nuvoton: =
Add driver for WPCM450
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: riscv-randconfig-c006-20220313 (https://download.01.org/0day-ci/arc=
hive/20220317/202203170101.EdmxWKnf-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a6b2f5=
0fb47da3baeee10b1906da6e30ac5d26ec)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinc=
trl.git/commit/?id=3Da1d1e0e3d80a870cc37a6c064994b89e963d2b58
        git remote add linusw-pinctrl https://git.kernel.org/pub/scm/linux/=
kernel/git/linusw/linux-pinctrl.git
        git fetch --no-tags linusw-pinctrl devel
        git checkout a1d1e0e3d80a870cc37a6c064994b89e963d2b58
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   lib/mpi/mpi-pow.c:71:6: note: Assuming 'mp' is non-null
           if (!mp)
               ^~~
   lib/mpi/mpi-pow.c:71:2: note: Taking false branch
           if (!mp)
           ^
   lib/mpi/mpi-pow.c:74:6: note: 'mod_shift_cnt' is 64
           if (mod_shift_cnt)
               ^~~~~~~~~~~~~
   lib/mpi/mpi-pow.c:74:2: note: Taking true branch
           if (mod_shift_cnt)
           ^
   lib/mpi/mpi-pow.c:81:6: note: Assuming 'bsize' is <=3D 'msize'
           if (bsize > msize) {    /* The base is larger than the module. R=
educe it. */
               ^~~~~~~~~~~~~
   lib/mpi/mpi-pow.c:81:2: note: Taking false branch
           if (bsize > msize) {    /* The base is larger than the module. R=
educe it. */
           ^
   lib/mpi/mpi-pow.c:98:6: note: Assuming 'bsize' is not equal to 0
           if (!bsize) {
               ^~~~~~
   lib/mpi/mpi-pow.c:98:2: note: Taking false branch
           if (!bsize) {
           ^
   lib/mpi/mpi-pow.c:104:6: note: Assuming 'size' is <=3D field 'alloced'
           if (res->alloced < size) {
               ^~~~~~~~~~~~~~~~~~~
   lib/mpi/mpi-pow.c:104:2: note: Taking false branch
           if (res->alloced < size) {
           ^
   lib/mpi/mpi-pow.c:119:7: note: Assuming 'rp' is not equal to 'bp'
                   if (rp =3D=3D bp) {
                       ^~~~~~~~
   lib/mpi/mpi-pow.c:119:3: note: Taking false branch
                   if (rp =3D=3D bp) {
                   ^
   lib/mpi/mpi-pow.c:127:7: note: Assuming 'rp' is not equal to 'ep'
                   if (rp =3D=3D ep) {
                       ^~~~~~~~
   lib/mpi/mpi-pow.c:127:3: note: Taking false branch
                   if (rp =3D=3D ep) {
                   ^
   lib/mpi/mpi-pow.c:134:7: note: Assuming 'rp' is not equal to 'mp'
                   if (rp =3D=3D mp) {
                       ^~~~~~~~
   lib/mpi/mpi-pow.c:134:3: note: Taking false branch
                   if (rp =3D=3D mp) {
                   ^
   lib/mpi/mpi-pow.c:144:2: note: Assuming '_i' is >=3D 'bsize'
           MPN_COPY(rp, bp, bsize);
           ^
   lib/mpi/mpi-internal.h:65:16: note: expanded from macro 'MPN_COPY'
                   for (_i =3D 0; _i < (n); _i++)    \
                                ^~~~~~~~
   lib/mpi/mpi-pow.c:144:2: note: Loop condition is false. Execution contin=
ues on line 144
           MPN_COPY(rp, bp, bsize);
           ^
   lib/mpi/mpi-internal.h:65:3: note: expanded from macro 'MPN_COPY'
                   for (_i =3D 0; _i < (n); _i++)    \
                   ^
   lib/mpi/mpi-pow.c:144:2: note: Loop condition is false.  Exiting loop
           MPN_COPY(rp, bp, bsize);
           ^
   lib/mpi/mpi-internal.h:63:2: note: expanded from macro 'MPN_COPY'
           do {                                    \
           ^
   lib/mpi/mpi-pow.c:156:7: note: Assuming 'xp' is non-null
                   if (!xp)
                       ^~~
   lib/mpi/mpi-pow.c:156:3: note: Taking false branch
                   if (!xp)
                   ^
   lib/mpi/mpi-pow.c:159:22: note: Assuming the condition is false
                   negative_result =3D (ep[0] & 1) && base->sign;
                                      ^~~~~~~~~
   lib/mpi/mpi-pow.c:159:33: note: Left side of '&&' is false
                   negative_result =3D (ep[0] & 1) && base->sign;
                                                 ^
   lib/mpi/mpi-pow.c:163:7: note: Calling 'count_leading_zeros'
                   c =3D count_leading_zeros(e);
                       ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/count_zeros.h:25:2: note: Taking false branch
           if (sizeof(x) =3D=3D 4)
           ^
   include/linux/count_zeros.h:28:3: note: Returning the value 64
                   return BITS_PER_LONG - fls64(x);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/mpi/mpi-pow.c:163:7: note: Returning from 'count_leading_zeros'
                   c =3D count_leading_zeros(e);
                       ^~~~~~~~~~~~~~~~~~~~~~
   lib/mpi/mpi-pow.c:163:3: note: The value 64 is assigned to 'c'
                   c =3D count_leading_zeros(e);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/mpi/mpi-pow.c:164:10: note: The result of the left shift is undefine=
d due to shifting by '64', which is greater or equal to the width of type '=
mpi_limb_t'
                   e =3D (e << c) << 1;      /* shift the exp bits to the l=
eft, lose msb */
                          ^  ~
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
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
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   lib/xarray.c:2029:18: warning: Value stored to 'node' during its initial=
ization is never read [clang-analyzer-deadcode.DeadStores]
           struct xa_node *node =3D xas->xa_node;
                           ^~~~   ~~~~~~~~~~~~
   lib/xarray.c:2029:18: note: Value stored to 'node' during its initializa=
tion is never read
           struct xa_node *node =3D xas->xa_node;
                           ^~~~   ~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   41 warnings generated.
   drivers/irqchip/irq-ts4800.c:84:17: warning: The result of the left shif=
t is undefined due to shifting by '32', which is greater or equal to the wi=
dth of type 'int' [clang-analyzer-core.UndefinedBinaryOperatorResult]
                   status &=3D ~(1 << bit);
                                 ^  ~~~
   drivers/irqchip/irq-ts4800.c:71:15: note: Loop condition is false.  Exit=
ing loop
           u16 status =3D readw(data->base + IRQ_STATUS);
                        ^
   arch/riscv/include/asm/mmio.h:139:30: note: expanded from macro 'readw'
   #define readw(c)        ({ u16 __v; __io_br(); __v =3D readw_cpu(c); __i=
o_ar(__v); __v; })
                                       ^
   arch/riscv/include/asm/mmio.h:133:19: note: expanded from macro '__io_br'
   #define __io_br()       do {} while (0)
                           ^
   drivers/irqchip/irq-ts4800.c:75:15: note: Assuming 'status' is not equal=
 to 0
           if (unlikely(status =3D=3D 0)) {
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   drivers/irqchip/irq-ts4800.c:75:2: note: Taking false branch
           if (unlikely(status =3D=3D 0)) {
           ^
   drivers/irqchip/irq-ts4800.c:81:22: note: Calling '__ffs'
                   unsigned int bit =3D __ffs(status);

vim +/npcm +1562 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c

3b588e43ee5c7a Tomer Maimon        2018-08-08  1559  =

3b588e43ee5c7a Tomer Maimon        2018-08-08  1560  static int npcm7xx_get=
_groups_count(struct pinctrl_dev *pctldev)
3b588e43ee5c7a Tomer Maimon        2018-08-08  1561  {
3b588e43ee5c7a Tomer Maimon        2018-08-08 @1562  	struct npcm7xx_pinctr=
l *npcm =3D pinctrl_dev_get_drvdata(pctldev);
3b588e43ee5c7a Tomer Maimon        2018-08-08  1563  =

9d0f18bca3b557 Jonathan Neusch=C3=A4fer 2022-02-05  1564  	dev_dbg(npcm->de=
v, "group size: %zu\n", ARRAY_SIZE(npcm7xx_groups));
3b588e43ee5c7a Tomer Maimon        2018-08-08  1565  	return ARRAY_SIZE(npc=
m7xx_groups);
3b588e43ee5c7a Tomer Maimon        2018-08-08  1566  }
3b588e43ee5c7a Tomer Maimon        2018-08-08  1567  =


:::::: The code at line 1562 was first introduced by commit
:::::: 3b588e43ee5c7ad8ccccfbfc6fc379b816c178f0 pinctrl: nuvoton: add NPCM7=
xx pinctrl and GPIO driver

:::::: TO: Tomer Maimon <tmaimon77@gmail.com>
:::::: CC: Linus Walleij <linus.walleij@linaro.org>

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2005301716878862206==--

