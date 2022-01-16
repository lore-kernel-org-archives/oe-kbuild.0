Content-Type: multipart/mixed; boundary="===============3286523817460376432=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/clk/mmp/clk-mix.c:193:3: warning: Value stored to 'fc_req' is never read [clang-analyzer-deadcode.DeadStores]
Date: Mon, 17 Jan 2022 03:12:06 +0800
Message-ID: <202201170345.hJQcladh-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3286523817460376432==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Arnd Bergmann <arnd@arndb.de>
CC: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
CC: Nick Desaulniers <ndesaulniers@google.com>
CC: Ard Biesheuvel <ardb@kernel.org>

Hi Arnd,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   4d66020dcef83314092f2c8c89152a8d122627e2
commit: 8b5bd5adf9e6d073e538e2e9de810f2f25379c3b ARM: 9137/1: disallow CONF=
IG_THUMB with ARMv4
date:   3 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 3 months ago
config: arm-randconfig-c002-20220116 (https://download.01.org/0day-ci/archi=
ve/20220117/202201170345.hJQcladh-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 650fc4=
0b6d8d9a5869b4fca525d5f237b0ee2803)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D8b5bd5adf9e6d073e538e2e9de810f2f25379c3b
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 8b5bd5adf9e6d073e538e2e9de810f2f25379c3b
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
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
   mm/damon/core.c:202:4: note: Left side of '&&' is false
                           damon_for_each_target_safe(t, next, ctx)
                           ^
   include/linux/damon.h:224:2: note: expanded from macro 'damon_for_each_t=
arget_safe'
           list_for_each_entry_safe(t, next, &(ctx)->adaptive_targets, list)
           ^
   include/linux/list.h:715:13: note: expanded from macro 'list_for_each_en=
try_safe'
           for (pos =3D list_first_entry(head, typeof(*pos), member),      =
  \
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
   mm/damon/core.c:202:4: note: Taking false branch
                           damon_for_each_target_safe(t, next, ctx)
                           ^
   include/linux/damon.h:224:2: note: expanded from macro 'damon_for_each_t=
arget_safe'
           list_for_each_entry_safe(t, next, &(ctx)->adaptive_targets, list)
           ^
   include/linux/list.h:715:13: note: expanded from macro 'list_for_each_en=
try_safe'
           for (pos =3D list_first_entry(head, typeof(*pos), member),      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:302:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   mm/damon/core.c:202:4: note: Loop condition is false.  Exiting loop
                           damon_for_each_target_safe(t, next, ctx)
                           ^
   include/linux/damon.h:224:2: note: expanded from macro 'damon_for_each_t=
arget_safe'
           list_for_each_entry_safe(t, next, &(ctx)->adaptive_targets, list)
           ^
   include/linux/list.h:715:13: note: expanded from macro 'list_for_each_en=
try_safe'
           for (pos =3D list_first_entry(head, typeof(*pos), member),      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:300:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   mm/damon/core.c:202:4: note: Use of memory after it is freed
                           damon_for_each_target_safe(t, next, ctx)
                           ^
   include/linux/damon.h:224:2: note: expanded from macro 'damon_for_each_t=
arget_safe'
           list_for_each_entry_safe(t, next, &(ctx)->adaptive_targets, list)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:716:7: note: expanded from macro 'list_for_each_ent=
ry_safe'
                   n =3D list_next_entry(pos, member);                     =
  \
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:555:2: note: expanded from macro 'list_next_entry'
           list_entry((pos)->member.next, typeof(*(pos)), member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:494:25: note: expanded from macro 'container_of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
                                  ^~~~~
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
   4 warnings generated.
>> drivers/clk/mmp/clk-mix.c:193:3: warning: Value stored to 'fc_req' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
                   fc_req &=3D ~(1 << ri->bit_fc);
                   ^         ~~~~~~~~~~~~~~~~~~
   drivers/clk/mmp/clk-mix.c:193:3: note: Value stored to 'fc_req' is never=
 read
                   fc_req &=3D ~(1 << ri->bit_fc);
                   ^         ~~~~~~~~~~~~~~~~~~
>> drivers/clk/mmp/clk-mix.c:345:21: warning: Division by zero [clang-analy=
zer-core.DivideZero]
           return parent_rate / div;
                  ~~~~~~~~~~~~^~~~~
   drivers/clk/mmp/clk-mix.c:321:28: note: Left side of '&&' is false
           struct mmp_clk_mix *mix =3D to_clk_mix(hw);
                                     ^
   drivers/clk/mmp/clk-mix.c:25:24: note: expanded from macro 'to_clk_mix'
   #define to_clk_mix(hw)  container_of(hw, struct mmp_clk_mix, hw)
                           ^
   include/linux/kernel.h:495:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/clk/mmp/clk-mix.c:321:28: note: Taking false branch
           struct mmp_clk_mix *mix =3D to_clk_mix(hw);
                                     ^
   drivers/clk/mmp/clk-mix.c:25:24: note: expanded from macro 'to_clk_mix'
   #define to_clk_mix(hw)  container_of(hw, struct mmp_clk_mix, hw)
                           ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:302:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/clk/mmp/clk-mix.c:321:28: note: Loop condition is false.  Exitin=
g loop
           struct mmp_clk_mix *mix =3D to_clk_mix(hw);
                                     ^
   drivers/clk/mmp/clk-mix.c:25:24: note: expanded from macro 'to_clk_mix'
   #define to_clk_mix(hw)  container_of(hw, struct mmp_clk_mix, hw)
                           ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:300:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/clk/mmp/clk-mix.c:328:6: note: Assuming field 'lock' is null
           if (mix->lock)
               ^~~~~~~~~
   drivers/clk/mmp/clk-mix.c:328:2: note: Taking false branch
           if (mix->lock)
           ^
   drivers/clk/mmp/clk-mix.c:331:6: note: Assuming field 'type' is not equa=
l to MMP_CLK_MIX_TYPE_V1
           if (mix->type =3D=3D MMP_CLK_MIX_TYPE_V1
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/mmp/clk-mix.c:331:6: note: Left side of '||' is false
   drivers/clk/mmp/clk-mix.c:332:6: note: Assuming field 'type' is not equa=
l to MMP_CLK_MIX_TYPE_V2
                   || mix->type =3D=3D MMP_CLK_MIX_TYPE_V2)
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/mmp/clk-mix.c:331:2: note: Taking false branch
           if (mix->type =3D=3D MMP_CLK_MIX_TYPE_V1
           ^
   drivers/clk/mmp/clk-mix.c:337:11: note: Field 'lock' is null
           if (mix->lock)
                    ^
   drivers/clk/mmp/clk-mix.c:337:2: note: Taking false branch
           if (mix->lock)
           ^
   drivers/clk/mmp/clk-mix.c:343:8: note: Calling '_get_div'
           div =3D _get_div(mix, MMP_CLK_BITS_GET_VAL(mux_div, width, shift=
));
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/mmp/clk-mix.c:50:6: note: Assuming the condition is false
           if (mix->div_flags & CLK_DIVIDER_ONE_BASED)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/mmp/clk-mix.c:50:2: note: Taking false branch
           if (mix->div_flags & CLK_DIVIDER_ONE_BASED)
           ^
   drivers/clk/mmp/clk-mix.c:52:6: note: Assuming the condition is false
           if (mix->div_flags & CLK_DIVIDER_POWER_OF_TWO)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/mmp/clk-mix.c:52:2: note: Taking false branch
           if (mix->div_flags & CLK_DIVIDER_POWER_OF_TWO)
           ^
   drivers/clk/mmp/clk-mix.c:54:6: note: Assuming field 'div_table' is non-=
null
           if (mix->div_table) {
               ^~~~~~~~~~~~~~
   drivers/clk/mmp/clk-mix.c:54:2: note: Taking true branch
           if (mix->div_table) {
           ^
   drivers/clk/mmp/clk-mix.c:55:3: note: Loop condition is false. Execution=
 continues on line 58
                   for (clkt =3D mix->div_table; clkt->div; clkt++)
                   ^
   drivers/clk/mmp/clk-mix.c:58:13: note: Field 'div' is equal to 0
--
               ^
   drivers/pci/controller/dwc/pci-imx6.c:843:24: note: Left side of '&&' is=
 false
           struct dw_pcie *pci =3D to_dw_pcie_from_pp(pp);
                                 ^
   drivers/pci/controller/dwc/pcie-designware.h:280:34: note: expanded from=
 macro 'to_dw_pcie_from_pp'
   #define to_dw_pcie_from_pp(port) container_of((port), struct dw_pcie, pp)
                                    ^
   include/linux/kernel.h:495:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/pci/controller/dwc/pci-imx6.c:843:24: note: Taking false branch
           struct dw_pcie *pci =3D to_dw_pcie_from_pp(pp);
                                 ^
   drivers/pci/controller/dwc/pcie-designware.h:280:34: note: expanded from=
 macro 'to_dw_pcie_from_pp'
   #define to_dw_pcie_from_pp(port) container_of((port), struct dw_pcie, pp)
                                    ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:302:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/pci/controller/dwc/pci-imx6.c:843:24: note: Loop condition is fa=
lse.  Exiting loop
           struct dw_pcie *pci =3D to_dw_pcie_from_pp(pp);
                                 ^
   drivers/pci/controller/dwc/pcie-designware.h:280:34: note: expanded from=
 macro 'to_dw_pcie_from_pp'
   #define to_dw_pcie_from_pp(port) container_of((port), struct dw_pcie, pp)
                                    ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:300:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/pci/controller/dwc/pci-imx6.c:849:2: note: Calling 'imx6_setup_p=
hy_mpll'
           imx6_setup_phy_mpll(imx6_pcie);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/controller/dwc/pci-imx6.c:680:2: note: 'val' declared withou=
t an initial value
           u16 val;
           ^~~~~~~
   drivers/pci/controller/dwc/pci-imx6.c:682:6: note: Assuming the conditio=
n is false
           if (!(imx6_pcie->drvdata->flags & IMX6_PCIE_FLAG_IMX6_PHY))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/controller/dwc/pci-imx6.c:682:2: note: Taking false branch
           if (!(imx6_pcie->drvdata->flags & IMX6_PCIE_FLAG_IMX6_PHY))
           ^
   drivers/pci/controller/dwc/pci-imx6.c:685:2: note: Control jumps to 'cas=
e 200000000:'  at line 696
           switch (phy_rate) {
           ^
   drivers/pci/controller/dwc/pci-imx6.c:699:3: note:  Execution continues =
on line 706
                   break;
                   ^
   drivers/pci/controller/dwc/pci-imx6.c:706:2: note: Calling 'pcie_phy_rea=
d'
           pcie_phy_read(imx6_pcie, PCIE_PHY_MPLL_OVRD_IN_LO, &val);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/controller/dwc/pci-imx6.c:197:6: note: Assuming 'ret' is not=
 equal to 0
           if (ret)
               ^~~
   drivers/pci/controller/dwc/pci-imx6.c:197:2: note: Taking true branch
           if (ret)
           ^
   drivers/pci/controller/dwc/pci-imx6.c:198:3: note: Returning without wri=
ting to '*data'
                   return ret;
                   ^
   drivers/pci/controller/dwc/pci-imx6.c:706:2: note: Returning from 'pcie_=
phy_read'
           pcie_phy_read(imx6_pcie, PCIE_PHY_MPLL_OVRD_IN_LO, &val);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/controller/dwc/pci-imx6.c:707:6: note: The left expression o=
f the compound assignment is an uninitialized value. The computed value wil=
l also be garbage
           val &=3D ~(PCIE_PHY_MPLL_MULTIPLIER_MASK <<
           ~~~ ^
   drivers/pci/controller/dwc/pci-imx6.c:1135:2: warning: Value stored to '=
ret' is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D of_property_read_u32(node, "fsl,max-link-speed", &pci->l=
ink_gen);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   drivers/pci/controller/dwc/pci-imx6.c:1135:2: note: Value stored to 'ret=
' is never read
           ret =3D of_property_read_u32(node, "fsl,max-link-speed", &pci->l=
ink_gen);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
>> drivers/pci/controller/pci-rcar-gen2.c:225:3: warning: Value stored to '=
window_size' is never read [clang-analyzer-deadcode.DeadStores]
                   window_size =3D SZ_256M;
                   ^
   drivers/pci/controller/pci-rcar-gen2.c:225:3: note: Value stored to 'win=
dow_size' is never read
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   include/linux/log2.h:57:13: warning: The result of the left shift is und=
efined due to shifting by '32', which is greater or equal to the width of t=
ype 'unsigned long' [clang-analyzer-core.UndefinedBinaryOperatorResult]
           return 1UL << fls_long(n - 1);
                      ^
   drivers/pci/controller/pcie-rcar.c:79:6: note: Assuming 'size' is > 128
           if (size > 128)
               ^~~~~~~~~~
   drivers/pci/controller/pcie-rcar.c:79:2: note: Taking true branch
           if (size > 128)
           ^
   drivers/pci/controller/pcie-rcar.c:80:11: note: '?' condition is false
                   mask =3D (roundup_pow_of_two(size) / SZ_128) - 1;
                           ^
   include/linux/log2.h:176:2: note: expanded from macro 'roundup_pow_of_tw=
o'
           __builtin_constant_p(n) ? (             \
           ^
   drivers/pci/controller/pcie-rcar.c:80:11: note: Calling '__roundup_pow_o=
f_two'
                   mask =3D (roundup_pow_of_two(size) / SZ_128) - 1;
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
   include/asm-generic/bitops/fls.h:17:7: note: 'x' is not equal to 0, whic=
h participates in a condition later
           if (!x)
                ^
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
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   kernel/debug/gdbstub.c:412:21: warning: The left operand of '!=3D' is a =
garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
                   if (!lzero || *id !=3D 0) {
                                     ^
   kernel/debug/gdbstub.c:965:6: note: Assuming 'kgdb_connected' is 0
--
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
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
   4 warnings generated.
   include/linux/fsnotify_backend.h:259:18: warning: Access to field 'dentr=
y' results in a dereference of a null pointer (loaded from variable 'data')=
 [clang-analyzer-core.NullDereference]
                   return d_inode(((const struct path *)data)->dentry);
                                  ^
   fs/notify/fsnotify.c:184:22: note: Assuming 'path' is null
           struct mount *mnt =3D path ? real_mount(path->mnt) : NULL;
                               ^~~~
   fs/notify/fsnotify.c:184:22: note: '?' condition is false
   fs/notify/fsnotify.c:199:6: note: Assuming field 'i_fsnotify_marks' is n=
on-null
           if (!inode->i_fsnotify_marks && !inode->i_sb->s_fsnotify_marks &&
               ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/notify/fsnotify.c:199:31: note: Left side of '&&' is false
           if (!inode->i_fsnotify_marks && !inode->i_sb->s_fsnotify_marks &&
                                        ^
   fs/notify/fsnotify.c:204:18: note: Calling 'fsnotify_event_needs_parent'
           parent_needed =3D fsnotify_event_needs_parent(inode, mnt, mask);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/notify/fsnotify.c:152:6: note: Assuming the condition is true
           if (mask & FS_ISDIR)
               ^~~~~~~~~~~~~~~
   fs/notify/fsnotify.c:152:2: note: Taking true branch
           if (mask & FS_ISDIR)
           ^
   fs/notify/fsnotify.c:153:3: note: Returning zero, which participates in =
a condition later
                   return false;
                   ^~~~~~~~~~~~
   fs/notify/fsnotify.c:204:18: note: Returning from 'fsnotify_event_needs_=
parent'
           parent_needed =3D fsnotify_event_needs_parent(inode, mnt, mask);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/notify/fsnotify.c:205:6: note: Assuming 'parent_watched' is true
           if (!parent_watched && !parent_needed)
               ^~~~~~~~~~~~~~~
   fs/notify/fsnotify.c:205:22: note: Left side of '&&' is false
           if (!parent_watched && !parent_needed)
                               ^
   fs/notify/fsnotify.c:212:15: note: 'parent_watched' is true
           if (unlikely(parent_watched && !p_mask))
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   fs/notify/fsnotify.c:212:15: note: Left side of '&&' is true
           if (unlikely(parent_watched && !p_mask))
                        ^
   fs/notify/fsnotify.c:212:33: note: Assuming 'p_mask' is not equal to 0
           if (unlikely(parent_watched && !p_mask))
                                          ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   fs/notify/fsnotify.c:212:2: note: Taking false branch
           if (unlikely(parent_watched && !p_mask))
           ^
   fs/notify/fsnotify.c:220:6: note: 'parent_needed' is false
           if (parent_needed || parent_interested) {
               ^~~~~~~~~~~~~
   fs/notify/fsnotify.c:220:6: note: Left side of '||' is false
   fs/notify/fsnotify.c:220:23: note: Assuming 'parent_interested' is true
           if (parent_needed || parent_interested) {
                                ^~~~~~~~~~~~~~~~~
   fs/notify/fsnotify.c:220:2: note: Taking true branch
           if (parent_needed || parent_interested) {
           ^
   fs/notify/fsnotify.c:222:45: note: Passing null pointer value via 1st pa=
rameter 'data'
                   WARN_ON_ONCE(inode !=3D fsnotify_data_inode(data, data_t=
ype));
                                                             ^
   include/asm-generic/bug.h:179:41: note: expanded from macro 'WARN_ON_ONC=
E'
   #define WARN_ON_ONCE(condition) WARN_ON(condition)
                                           ^~~~~~~~~
   include/asm-generic/bug.h:166:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   fs/notify/fsnotify.c:222:25: note: Calling 'fsnotify_data_inode'
                   WARN_ON_ONCE(inode !=3D fsnotify_data_inode(data, data_t=
ype));
                                         ^
   include/asm-generic/bug.h:179:41: note: expanded from macro 'WARN_ON_ONC=
E'
   #define WARN_ON_ONCE(condition) WARN_ON(condition)
                                           ^~~~~~~~~
   include/asm-generic/bug.h:166:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   include/linux/fsnotify_backend.h:255:2: note: Control jumps to 'case FSN=
OTIFY_EVENT_PATH:'  at line 258
           switch (data_type) {
           ^
   include/linux/fsnotify_backend.h:259:18: note: Access to field 'dentry' =
results in a dereference of a null pointer (loaded from variable 'data')
                   return d_inode(((const struct path *)data)->dentry);
                                  ^                     ~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
>> drivers/clk/clk-vt8500.c:301:2: warning: Value stored to 'rc' is never r=
ead [clang-analyzer-deadcode.DeadStores]
           rc =3D of_clk_add_hw_provider(node, of_clk_hw_simple_get, hw);
           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/clk-vt8500.c:301:2: note: Value stored to 'rc' is never read
           rc =3D of_clk_add_hw_provider(node, of_clk_hw_simple_get, hw);
           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/clk-vt8500.c:715:2: warning: Value stored to 'rc' is never r=
ead [clang-analyzer-deadcode.DeadStores]
           rc =3D of_clk_add_hw_provider(node, of_clk_hw_simple_get, hw);
           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/clk-vt8500.c:715:2: note: Value stored to 'rc' is never read
           rc =3D of_clk_add_hw_provider(node, of_clk_hw_simple_get, hw);
           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   4 warnings generated.
   drivers/clk/actions/owl-pll.c:28:9: warning: Although the value stored t=
o 'mul' is used in the enclosing expression, the value is never actually re=
ad from 'mul' [clang-analyzer-deadcode.DeadStores]
           return mul &=3D mul_mask(pll_hw);
                  ^
   drivers/clk/actions/owl-pll.c:28:9: note: Although the value stored to '=
mul' is used in the enclosing expression, the value is never actually read =
from 'mul'
   Suppressed 3 warnings (2 in non-user code, 1 with check filters).
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
   4 warnings generated.
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
--
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/math.h:144:28: note: expanded from macro '__abs_choose_exp=
r'
           ({ signed type __x =3D (x); __x < 0 ? -__x : __x; }), other)
                                     ^~~~~~~
   include/linux/math.h:144:54: note: expanded from macro '__abs_choose_exp=
r'
           ({ signed type __x =3D (x); __x < 0 ? -__x : __x; }), other)
                                                               ^~~~~
   include/linux/math.h:144:54: note: expanded from macro '__abs_choose_exp=
r'
           ({ signed type __x =3D (x); __x < 0 ? -__x : __x; }), other)
                                                               ^~~~~
   drivers/gpu/drm/nouveau/nvkm/subdev/clk/nv50.c:410:7: note: '?' conditio=
n is false
                   if (abs(vdec - freq) <=3D abs(vdec - out)) {
                       ^
   include/linux/math.h:133:3: note: expanded from macro 'abs'
                   __abs_choose_expr(x, int,                               \
                   ^
   include/linux/math.h:144:28: note: expanded from macro '__abs_choose_exp=
r'
           ({ signed type __x =3D (x); __x < 0 ? -__x : __x; }), other)
                                     ^
   drivers/gpu/drm/nouveau/nvkm/subdev/clk/nv50.c:410:27: note: Assuming '_=
_x' is < 0
                   if (abs(vdec - freq) <=3D abs(vdec - out)) {
                                           ^
   include/linux/math.h:133:3: note: expanded from macro 'abs'
                   __abs_choose_expr(x, int,                               \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/math.h:144:28: note: expanded from macro '__abs_choose_exp=
r'
           ({ signed type __x =3D (x); __x < 0 ? -__x : __x; }), other)
                                     ^~~~~~~
   include/linux/math.h:144:54: note: expanded from macro '__abs_choose_exp=
r'
           ({ signed type __x =3D (x); __x < 0 ? -__x : __x; }), other)
                                                               ^~~~~
   include/linux/math.h:144:54: note: expanded from macro '__abs_choose_exp=
r'
           ({ signed type __x =3D (x); __x < 0 ? -__x : __x; }), other)
                                                               ^~~~~
   drivers/gpu/drm/nouveau/nvkm/subdev/clk/nv50.c:410:27: note: '?' conditi=
on is true
                   if (abs(vdec - freq) <=3D abs(vdec - out)) {
                                           ^
   include/linux/math.h:133:3: note: expanded from macro 'abs'
                   __abs_choose_expr(x, int,                               \
                   ^
   include/linux/math.h:144:28: note: expanded from macro '__abs_choose_exp=
r'
           ({ signed type __x =3D (x); __x < 0 ? -__x : __x; }), other)
                                     ^
   drivers/gpu/drm/nouveau/nvkm/subdev/clk/nv50.c:410:7: note: Assuming the=
 condition is false
                   if (abs(vdec - freq) <=3D abs(vdec - out)) {
                       ^
   include/linux/math.h:131:16: note: expanded from macro 'abs'
   #define abs(x)  __abs_choose_expr(x, long long,                         \
                   ^
   include/linux/math.h:141:43: note: expanded from macro '__abs_choose_exp=
r'
   #define __abs_choose_expr(x, type, other) __builtin_choose_expr(        \
                                             ^
   drivers/gpu/drm/nouveau/nvkm/subdev/clk/nv50.c:410:3: note: Taking false=
 branch
                   if (abs(vdec - freq) <=3D abs(vdec - out)) {
                   ^
   drivers/gpu/drm/nouveau/nvkm/subdev/clk/nv50.c:416:16: note: The result =
of the left shift is undefined because the left operand is negative
                           divsv |=3D P2 << 8;
                                    ~~ ^
   Suppressed 3 warnings (3 in non-user code).
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
   4 warnings generated.
   Suppressed 4 warnings (3 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
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
   6 warnings generated.
>> drivers/dma/stm32-dma.c:1094:23: warning: Dereference of null pointer [c=
lang-analyzer-core.NullDereference]
                   return (dma_smar =3D=3D sg_req->chan_reg.dma_sm0ar);
                                       ^
   drivers/dma/stm32-dma.c:1179:6: note: 'status' is not equal to DMA_COMPL=
ETE
           if (status =3D=3D DMA_COMPLETE || !state)
               ^~~~~~
   drivers/dma/stm32-dma.c:1179:6: note: Left side of '||' is false
   drivers/dma/stm32-dma.c:1179:33: note: 'state' is non-null
           if (status =3D=3D DMA_COMPLETE || !state)
                                          ^~~~~
   drivers/dma/stm32-dma.c:1179:2: note: Taking false branch
           if (status =3D=3D DMA_COMPLETE || !state)
           ^
   drivers/dma/stm32-dma.c:1182:2: note: Loop condition is false.  Exiting =
loop
           spin_lock_irqsave(&chan->vchan.lock, flags);
           ^
   include/linux/spinlock.h:393:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:254:2: note: expanded from macro 'raw_spin_lock=
_irqsave'
           do {                                            \
           ^
   drivers/dma/stm32-dma.c:1182:2: note: Loop condition is false.  Exiting =
loop
           spin_lock_irqsave(&chan->vchan.lock, flags);
           ^
   include/linux/spinlock.h:391:43: note: expanded from macro 'spin_lock_ir=
qsave'
   #define spin_lock_irqsave(lock, flags)                          \
                                                                   ^
   drivers/dma/stm32-dma.c:1183:10: note: Value assigned to field 'desc'
           vdesc =3D vchan_find_desc(&chan->vchan, cookie);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/dma/stm32-dma.c:1184:6: note: Assuming field 'desc' is null
           if (chan->desc && cookie =3D=3D chan->desc->vdesc.tx.cookie)
               ^~~~~~~~~~
   drivers/dma/stm32-dma.c:1184:17: note: Left side of '&&' is false
           if (chan->desc && cookie =3D=3D chan->desc->vdesc.tx.cookie)
                          ^
   drivers/dma/stm32-dma.c:1187:11: note: Assuming 'vdesc' is non-null
           else if (vdesc)
                    ^~~~~
   drivers/dma/stm32-dma.c:1187:7: note: Taking true branch
           else if (vdesc)
                ^
   drivers/dma/stm32-dma.c:1188:13: note: Calling 'stm32_dma_desc_residue'
                   residue =3D stm32_dma_desc_residue(chan,
                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/dma/stm32-dma.c:1137:12: note: Calling 'stm32_dma_get_remaining_=
bytes'
           residue =3D stm32_dma_get_remaining_bytes(chan);
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/dma/stm32-dma.c:1057:36: note: Calling 'stm32_dma_get_dev'
           struct stm32_dma_device *dmadev =3D stm32_dma_get_dev(chan);
                                             ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/dma/stm32-dma.c:223:9: note: Left side of '&&' is false
           return container_of(chan->vchan.chan.device, struct stm32_dma_de=
vice,
                  ^
   include/linux/kernel.h:495:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/dma/stm32-dma.c:223:9: note: Taking false branch
           return container_of(chan->vchan.chan.device, struct stm32_dma_de=
vice,
                  ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:302:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/dma/stm32-dma.c:223:9: note: Loop condition is false.  Exiting l=
oop
           return container_of(chan->vchan.chan.device, struct stm32_dma_de=
vice,
                  ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:300:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/dma/stm32-dma.c:223:2: note: Returning without writing to 'chan-=
>desc'
           return container_of(chan->vchan.chan.device, struct stm32_dma_de=
vice,
           ^
   drivers/dma/stm32-dma.c:1057:36: note: Returning from 'stm32_dma_get_dev'
           struct stm32_dma_device *dmadev =3D stm32_dma_get_dev(chan);
                                             ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/dma/stm32-dma.c:1063:2: note: Returning without writing to 'chan=
->desc'
--
                                                            ^~~~~~~~~~~~~~~
   drivers/gpu/drm/radeon/r600.c:1658:2: note: Taking false branch
           if (G_000E50_SEM_BUSY(tmp))
           ^
   drivers/gpu/drm/radeon/r600.c:1661:6: note: Assuming the condition is fa=
lse
           if (G_000E50_GRBM_RQ_PENDING(tmp))
               ^
   drivers/gpu/drm/radeon/r600d.h:1827:40: note: expanded from macro 'G_000=
E50_GRBM_RQ_PENDING'
   #define         G_000E50_GRBM_RQ_PENDING(x)             (((x) >> 5) & 1)
                                                            ^~~~~~~~~~~~~~
   drivers/gpu/drm/radeon/r600.c:1661:2: note: Taking false branch
           if (G_000E50_GRBM_RQ_PENDING(tmp))
           ^
   drivers/gpu/drm/radeon/r600.c:1664:6: note: Assuming the condition is fa=
lse
           if (G_000E50_VMC_BUSY(tmp))
               ^
   drivers/gpu/drm/radeon/r600d.h:1830:34: note: expanded from macro 'G_000=
E50_VMC_BUSY'
   #define         G_000E50_VMC_BUSY(x)                    (((x) >> 8) & 1)
                                                            ^~~~~~~~~~~~~~
   drivers/gpu/drm/radeon/r600.c:1664:2: note: Taking false branch
           if (G_000E50_VMC_BUSY(tmp))
           ^
   drivers/gpu/drm/radeon/r600.c:1667:6: note: Assuming the condition is fa=
lse
           if (G_000E50_MCB_BUSY(tmp) | G_000E50_MCDZ_BUSY(tmp) |
               ^
   drivers/gpu/drm/radeon/r600d.h:1831:33: note: expanded from macro 'G_000=
E50_MCB_BUSY'
   #define         G_000E50_MCB_BUSY(x)                    (((x) >> 9) & 1)
                                                           ^
   drivers/gpu/drm/radeon/r600.c:1667:2: note: Taking false branch
           if (G_000E50_MCB_BUSY(tmp) | G_000E50_MCDZ_BUSY(tmp) |
           ^
   drivers/gpu/drm/radeon/r600.c:1672:6: note: Calling 'r600_is_display_hun=
g'
           if (r600_is_display_hung(rdev))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/radeon/r600.c:1592:14: note: Assuming 'i' is < field 'nu=
m_crtc'
           for (i =3D 0; i < rdev->num_crtc; i++) {
                       ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/radeon/r600.c:1592:2: note: Loop condition is true.  Ent=
ering loop body
           for (i =3D 0; i < rdev->num_crtc; i++) {
           ^
   drivers/gpu/drm/radeon/r600.c:1593:7: note: Assuming the condition is fa=
lse
                   if (RREG32(AVIVO_D1CRTC_CONTROL + crtc_offsets[i]) & AVI=
VO_CRTC_EN) {
                       ^
   drivers/gpu/drm/radeon/radeon.h:2545:21: note: expanded from macro 'RREG=
32'
   #define RREG32(reg) r100_mm_rreg(rdev, (reg), false)
                       ^
   drivers/gpu/drm/radeon/r600.c:1593:3: note: Taking false branch
                   if (RREG32(AVIVO_D1CRTC_CONTROL + crtc_offsets[i]) & AVI=
VO_CRTC_EN) {
                   ^
   drivers/gpu/drm/radeon/r600.c:1592:14: note: Assuming 'i' is < field 'nu=
m_crtc'
           for (i =3D 0; i < rdev->num_crtc; i++) {
                       ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/radeon/r600.c:1592:2: note: Loop condition is true.  Ent=
ering loop body
           for (i =3D 0; i < rdev->num_crtc; i++) {
           ^
   drivers/gpu/drm/radeon/r600.c:1593:7: note: Assuming the condition is fa=
lse
                   if (RREG32(AVIVO_D1CRTC_CONTROL + crtc_offsets[i]) & AVI=
VO_CRTC_EN) {
                       ^
   drivers/gpu/drm/radeon/radeon.h:2545:21: note: expanded from macro 'RREG=
32'
   #define RREG32(reg) r100_mm_rreg(rdev, (reg), false)
                       ^
   drivers/gpu/drm/radeon/r600.c:1593:3: note: Taking false branch
                   if (RREG32(AVIVO_D1CRTC_CONTROL + crtc_offsets[i]) & AVI=
VO_CRTC_EN) {
                   ^
   drivers/gpu/drm/radeon/r600.c:1592:34: note: The value 2 is assigned to =
'i'
           for (i =3D 0; i < rdev->num_crtc; i++) {
                                           ^~~
   drivers/gpu/drm/radeon/r600.c:1592:14: note: Assuming 'i' is < field 'nu=
m_crtc'
           for (i =3D 0; i < rdev->num_crtc; i++) {
                       ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/radeon/r600.c:1592:2: note: Loop condition is true.  Ent=
ering loop body
           for (i =3D 0; i < rdev->num_crtc; i++) {
           ^
   drivers/gpu/drm/radeon/r600.c:1593:35: note: The right operand of '+' is=
 a garbage value due to array index out of bounds
                   if (RREG32(AVIVO_D1CRTC_CONTROL + crtc_offsets[i]) & AVI=
VO_CRTC_EN) {
                                                   ^
   drivers/gpu/drm/radeon/radeon.h:2545:41: note: expanded from macro 'RREG=
32'
   #define RREG32(reg) r100_mm_rreg(rdev, (reg), false)
                                           ^~~
   drivers/gpu/drm/radeon/r600.c:1794:3: warning: Value stored to 'tmp' is =
never read [clang-analyzer-deadcode.DeadStores]
                   tmp =3D RREG32(R_008020_GRBM_SOFT_RESET);
                   ^
   drivers/gpu/drm/radeon/r600.c:1794:3: note: Value stored to 'tmp' is nev=
er read
   drivers/gpu/drm/radeon/r600.c:1808:3: warning: Value stored to 'tmp' is =
never read [clang-analyzer-deadcode.DeadStores]
                   tmp =3D RREG32(SRBM_SOFT_RESET);
                   ^
   drivers/gpu/drm/radeon/r600.c:1808:3: note: Value stored to 'tmp' is nev=
er read
   drivers/gpu/drm/radeon/r600.c:1861:2: warning: Value stored to 'tmp' is =
never read [clang-analyzer-deadcode.DeadStores]
           tmp =3D RREG32(BIF_SCRATCH0);
           ^
   drivers/gpu/drm/radeon/r600.c:1861:2: note: Value stored to 'tmp' is nev=
er read
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   drivers/gpu/drm/mgag200/mgag200_mode.c:98:2: warning: Value stored to 's=
tatus' is never read [clang-analyzer-deadcode.DeadStores]
           status =3D 0;
           ^        ~
   drivers/gpu/drm/mgag200/mgag200_mode.c:98:2: note: Value stored to 'stat=
us' is never read
           status =3D 0;
           ^        ~
>> drivers/gpu/drm/mgag200/mgag200_mode.c:220:21: warning: Value stored to =
'dev' during its initialization is never read [clang-analyzer-deadcode.Dead=
Stores]
           struct drm_device *dev =3D &mdev->base;
                              ^~~   ~~~~~~~~~~~
   drivers/gpu/drm/mgag200/mgag200_mode.c:220:21: note: Value stored to 'de=
v' during its initialization is never read
           struct drm_device *dev =3D &mdev->base;
                              ^~~   ~~~~~~~~~~~
   drivers/gpu/drm/mgag200/mgag200_mode.c:480:21: warning: Value stored to =
'dev' during its initialization is never read [clang-analyzer-deadcode.Dead=
Stores]
           struct drm_device *dev =3D &mdev->base;
                              ^~~   ~~~~~~~~~~~
   drivers/gpu/drm/mgag200/mgag200_mode.c:480:21: note: Value stored to 'de=
v' during its initialization is never read
           struct drm_device *dev =3D &mdev->base;
                              ^~~   ~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/gpu/drm/mgag200/mgag200_pll.c:204:14: warning: Although the valu=
e stored to 's' is used in the enclosing expression, the value is never act=
ually read from 's' [clang-analyzer-deadcode.DeadStores]
           m =3D n =3D p =3D s =3D 0;
                       ^   ~
   drivers/gpu/drm/mgag200/mgag200_pll.c:204:14: note: Although the value s=
tored to 's' is used in the enclosing expression, the value is never actual=
ly read from 's'
           m =3D n =3D p =3D s =3D 0;
                       ^   ~
   drivers/gpu/drm/mgag200/mgag200_pll.c:953:21: warning: Value stored to '=
dev' during its initialization is never read [clang-analyzer-deadcode.DeadS=
tores]
           struct drm_device *dev =3D &mdev->base;
                              ^~~   ~~~~~~~~~~~
   drivers/gpu/drm/mgag200/mgag200_pll.c:953:21: note: Value stored to 'dev=
' during its initialization is never read
           struct drm_device *dev =3D &mdev->base;
                              ^~~   ~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/gpu/drm/nouveau/nvif/object.c:38:48: warning: The left operand o=
f '=3D=3D' is a garbage value [clang-analyzer-core.UndefinedBinaryOperatorR=
esult]
           if (size >=3D sizeof(*args) && args->v0.version =3D=3D 0) {
                                                         ^
   drivers/gpu/drm/nouveau/nvif/object.c:132:12: note: Calling 'nvif_object=
_ioctl'
           int ret =3D nvif_object_ioctl(object, &args, sizeof(args), NULL);
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/nvif/object.c:38:6: note: Left side of '&&' is t=
rue
           if (size >=3D sizeof(*args) && args->v0.version =3D=3D 0) {
               ^
   drivers/gpu/drm/nouveau/nvif/object.c:38:48: note: The left operand of '=
=3D=3D' is a garbage value
           if (size >=3D sizeof(*args) && args->v0.version =3D=3D 0) {
                                        ~~~~~~~~~~~~~~~~ ^
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/gpu/drm/ttm/ttm_bo_vm.c:343:11: warning: Access to field 'pages'=
 results in a dereference of a null pointer (loaded from variable 'ttm') [c=
lang-analyzer-core.NullDereference]
                           page =3D ttm->pages[page_offset];
                                  ^
   drivers/gpu/drm/ttm/ttm_bo_vm.c:427:6: note: 'ret' is 0
           if (ret)
               ^~~
   drivers/gpu/drm/ttm/ttm_bo_vm.c:427:2: note: Taking false branch
           if (ret)
           ^
   drivers/gpu/drm/ttm/ttm_bo_vm.c:431:6: note: Assuming the condition is t=
rue
           if (drm_dev_enter(ddev, &idx)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/ttm/ttm_bo_vm.c:431:2: note: Taking true branch
           if (drm_dev_enter(ddev, &idx)) {
           ^
   drivers/gpu/drm/ttm/ttm_bo_vm.c:432:9: note: Calling 'ttm_bo_vm_fault_re=
served'
                   ret =3D ttm_bo_vm_fault_reserved(vmf, prot, TTM_BO_VM_NU=
M_PREFAULT, 1);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~
   drivers/gpu/drm/ttm/ttm_bo_vm.c:287:2: note: 'ttm' initialized to a null=
 pointer value
           struct ttm_tt *ttm =3D NULL;
           ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/ttm/ttm_bo_vm.c:299:2: note: Taking false branch
           if (unlikely(ret !=3D 0))
           ^
   drivers/gpu/drm/ttm/ttm_bo_vm.c:303:15: note: Assuming 'err' is equal to=
 0
           if (unlikely(err !=3D 0))
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   drivers/gpu/drm/ttm/ttm_bo_vm.c:303:2: note: Taking false branch
           if (unlikely(err !=3D 0))
           ^
   drivers/gpu/drm/ttm/ttm_bo_vm.c:311:15: note: Assuming 'page_offset' is =
< field 'num_pages'
           if (unlikely(page_offset >=3D bo->resource->num_pages))
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   drivers/gpu/drm/ttm/ttm_bo_vm.c:311:2: note: Taking false branch
           if (unlikely(page_offset >=3D bo->resource->num_pages))
           ^
   drivers/gpu/drm/ttm/ttm_bo_vm.c:315:6: note: Assuming field 'is_iomem' i=
s true
           if (!bo->resource->bus.is_iomem) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/ttm/ttm_bo_vm.c:315:2: note: Taking false branch
           if (!bo->resource->bus.is_iomem) {
--
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/dma/amba-pl08x.c:587:6: warning: Access to field 'ftdmac020' res=
ults in a dereference of a null pointer (loaded from variable 'ch') [clang-=
analyzer-core.NullDereference]
           if (ch->ftdmac020) {
               ^
   drivers/dma/amba-pl08x.c:2210:2: note: Value assigned to field 'phychan'
           spin_lock_irqsave(&plchan->vc.lock, flags);
           ^
   include/linux/spinlock.h:393:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:256:11: note: expanded from macro 'raw_spin_loc=
k_irqsave'
                   flags =3D _raw_spin_lock_irqsave(lock);   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/dma/amba-pl08x.c:2210:2: note: Loop condition is false.  Exiting=
 loop
           spin_lock_irqsave(&plchan->vc.lock, flags);
           ^
   include/linux/spinlock.h:393:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:254:2: note: expanded from macro 'raw_spin_lock=
_irqsave'
           do {                                            \
           ^
   drivers/dma/amba-pl08x.c:2210:2: note: Loop condition is false.  Exiting=
 loop
           spin_lock_irqsave(&plchan->vc.lock, flags);
           ^
   include/linux/spinlock.h:391:43: note: expanded from macro 'spin_lock_ir=
qsave'
   #define spin_lock_irqsave(lock, flags)                          \
                                                                   ^
   drivers/dma/amba-pl08x.c:2211:6: note: Assuming field 'phychan' is null
           if (!plchan->phychan && !plchan->at) {
               ^~~~~~~~~~~~~~~~
   drivers/dma/amba-pl08x.c:2211:6: note: Left side of '&&' is true
   drivers/dma/amba-pl08x.c:2211:26: note: Assuming field 'at' is non-null
           if (!plchan->phychan && !plchan->at) {
                                   ^~~~~~~~~~~
   drivers/dma/amba-pl08x.c:2211:2: note: Taking false branch
           if (!plchan->phychan && !plchan->at) {
           ^
   drivers/dma/amba-pl08x.c:2216:23: note: Passing null pointer value via 1=
st parameter 'ch'
           pl08x_pause_phy_chan(plchan->phychan);
                                ^~~~~~~~~~~~~~~
   drivers/dma/amba-pl08x.c:2216:2: note: Calling 'pl08x_pause_phy_chan'
           pl08x_pause_phy_chan(plchan->phychan);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/dma/amba-pl08x.c:587:6: note: Access to field 'ftdmac020' result=
s in a dereference of a null pointer (loaded from variable 'ch')
           if (ch->ftdmac020) {
               ^~
   drivers/dma/amba-pl08x.c:615:6: warning: Access to field 'ftdmac020' res=
ults in a dereference of a null pointer (loaded from variable 'ch') [clang-=
analyzer-core.NullDereference]
           if (ch->ftdmac020) {
               ^
   drivers/dma/amba-pl08x.c:2233:2: note: Value assigned to field 'phychan'
           spin_lock_irqsave(&plchan->vc.lock, flags);
           ^
   include/linux/spinlock.h:393:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:256:11: note: expanded from macro 'raw_spin_loc=
k_irqsave'
                   flags =3D _raw_spin_lock_irqsave(lock);   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/dma/amba-pl08x.c:2233:2: note: Loop condition is false.  Exiting=
 loop
           spin_lock_irqsave(&plchan->vc.lock, flags);
           ^
   include/linux/spinlock.h:393:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:254:2: note: expanded from macro 'raw_spin_lock=
_irqsave'
           do {                                            \
           ^
   drivers/dma/amba-pl08x.c:2233:2: note: Loop condition is false.  Exiting=
 loop
           spin_lock_irqsave(&plchan->vc.lock, flags);
           ^
   include/linux/spinlock.h:391:43: note: expanded from macro 'spin_lock_ir=
qsave'
   #define spin_lock_irqsave(lock, flags)                          \
                                                                   ^
   drivers/dma/amba-pl08x.c:2234:6: note: Assuming field 'phychan' is null
           if (!plchan->phychan && !plchan->at) {
               ^~~~~~~~~~~~~~~~
   drivers/dma/amba-pl08x.c:2234:6: note: Left side of '&&' is true
   drivers/dma/amba-pl08x.c:2234:26: note: Assuming field 'at' is non-null
           if (!plchan->phychan && !plchan->at) {
                                   ^~~~~~~~~~~
   drivers/dma/amba-pl08x.c:2234:2: note: Taking false branch
           if (!plchan->phychan && !plchan->at) {
           ^
   drivers/dma/amba-pl08x.c:2239:24: note: Passing null pointer value via 1=
st parameter 'ch'
           pl08x_resume_phy_chan(plchan->phychan);
                                 ^~~~~~~~~~~~~~~
   drivers/dma/amba-pl08x.c:2239:2: note: Calling 'pl08x_resume_phy_chan'
           pl08x_resume_phy_chan(plchan->phychan);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/dma/amba-pl08x.c:615:6: note: Access to field 'ftdmac020' result=
s in a dereference of a null pointer (loaded from variable 'ch')
           if (ch->ftdmac020) {
               ^~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
>> drivers/video/fbdev/vt8500lcdfb.c:280:2: warning: Value stored to 'ret' =
is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D -ENOMEM;
           ^     ~~~~~~~
   drivers/video/fbdev/vt8500lcdfb.c:280:2: note: Value stored to 'ret' is =
never read
           ret =3D -ENOMEM;
           ^     ~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/video/fbdev/s1d13xxxfb.c:681:2: warning: Value stored to 'is_dua=
l' is never read [clang-analyzer-deadcode.DeadStores]
           is_dual =3D (panel & 0x02) !=3D 0;
           ^         ~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/s1d13xxxfb.c:681:2: note: Value stored to 'is_dual' =
is never read
           is_dual =3D (panel & 0x02) !=3D 0;
           ^         ~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/s1d13xxxfb.c:683:2: warning: Value stored to 'lcd_bp=
p' is never read [clang-analyzer-deadcode.DeadStores]
           lcd_bpp =3D s1d13xxxfb_width_tab[is_tft][(panel >> 4) & 3];
           ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/s1d13xxxfb.c:683:2: note: Value stored to 'lcd_bpp' =
is never read
           lcd_bpp =3D s1d13xxxfb_width_tab[is_tft][(panel >> 4) & 3];
           ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/video/fbdev/s3c-fb.c:492:16: warning: Value stored to 'buf' duri=
ng its initialization is never read [clang-analyzer-deadcode.DeadStores]
           void __iomem *buf =3D regs;
                         ^~~   ~~~~
   drivers/video/fbdev/s3c-fb.c:492:16: note: Value stored to 'buf' during =
its initialization is never read
           void __iomem *buf =3D regs;
                         ^~~   ~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/video/fbdev/sm501fb.c:1965:5: warning: Call to function 'strcpy'=
 is insecure as it does not provide bounding of the memory buffer. Replace =
unbounded copy functions with analogous functions that support length argum=
ents such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                                   strcpy(fb_mode, cp);
                                   ^~~~~~
   drivers/video/fbdev/sm501fb.c:1965:5: note: Call to function 'strcpy' is=
 insecure as it does not provide bounding of the memory buffer. Replace unb=
ounded copy functions with analogous functions that support length argument=
s such as 'strlcpy'. CWE-119
                                   strcpy(fb_mode, cp);
                                   ^~~~~~
   Suppressed 3 warnings (3 in non-user code).
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
   4 warnings generated.
   drivers/video/fbdev/riva/fbdev.c:499:4: warning: Value stored to 'tmp' i=
s never read [clang-analyzer-deadcode.DeadStores]
                           tmp =3D 0;
                           ^     ~
   drivers/video/fbdev/riva/fbdev.c:499:4: note: Value stored to 'tmp' is n=
ever read
                           tmp =3D 0;
                           ^     ~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   kernel/kallsyms.c:436:3: warning: Call to function 'strcpy' is insecure =
as it does not provide bounding of the memory buffer. Replace unbounded cop=
y functions with analogous functions that support length arguments such as =
'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(buffer, name);
                   ^~~~~~
   kernel/kallsyms.c:436:3: note: Call to function 'strcpy' is insecure as =
it does not provide bounding of the memory buffer. Replace unbounded copy f=
unctions with analogous functions that support length arguments such as 'st=
rlcpy'. CWE-119
                   strcpy(buffer, name);
                   ^~~~~~
   Suppressed 4 warnings (3 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   kernel/kexec_core.c:771:4: warning: Value stored to 'addr' is never read=
 [clang-analyzer-deadcode.DeadStores]
                           addr =3D old_addr;
                           ^      ~~~~~~~~
   kernel/kexec_core.c:771:4: note: Value stored to 'addr' is never read
                           addr =3D old_addr;
                           ^      ~~~~~~~~
   kernel/kexec_core.c:791:2: warning: Value stored to 'result' is never re=
ad [clang-analyzer-deadcode.DeadStores]
           result =3D 0;
           ^        ~
   kernel/kexec_core.c:791:2: note: Value stored to 'result' is never read
           result =3D 0;
           ^        ~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   arch/arm/include/asm/atomic.h:223:1: warning: Access to field 'counter' =
results in a dereference of a null pointer (loaded from variable 'v') [clan=
g-analyzer-core.NullDereference]
   ATOMIC_OPS(add, +=3D, add)
   ^
   arch/arm/include/asm/atomic.h:221:2: note: expanded from macro 'ATOMIC_O=
PS'
           ATOMIC_FETCH_OP(op, c_op, asm_op)
--
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:300:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/base/regmap/regmap-debugfs.c:76:3: note: Memory is released
                   kfree(c);
                   ^~~~~~~~
   drivers/base/regmap/regmap-debugfs.c:71:2: note: Loop condition is true.=
  Entering loop body
           while (!list_empty(&map->debugfs_off_cache)) {
           ^
   drivers/base/regmap/regmap-debugfs.c:72:7: note: Left side of '&&' is fa=
lse
                   c =3D list_first_entry(&map->debugfs_off_cache,
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
   drivers/base/regmap/regmap-debugfs.c:72:7: note: Taking false branch
                   c =3D list_first_entry(&map->debugfs_off_cache,
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
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:302:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/base/regmap/regmap-debugfs.c:72:7: note: Loop condition is false=
.  Exiting loop
                   c =3D list_first_entry(&map->debugfs_off_cache,
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
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:300:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/base/regmap/regmap-debugfs.c:75:3: note: Calling 'list_del'
                   list_del(&c->list);
                   ^~~~~~~~~~~~~~~~~~
   include/linux/list.h:146:2: note: Calling '__list_del_entry'
           __list_del_entry(entry);
           ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:132:2: note: Taking false branch
           if (!__list_del_entry_valid(entry))
           ^
   include/linux/list.h:135:13: note: Use of memory after it is freed
           __list_del(entry->prev, entry->next);
                      ^~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
>> drivers/gpu/drm/exynos/exynos_drm_dsi.c:670:3: warning: Value stored to =
'esc_clk' is never read [clang-analyzer-deadcode.DeadStores]
                   esc_clk =3D byte_clk / esc_div;
                   ^         ~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/exynos/exynos_drm_dsi.c:670:3: note: Value stored to 'es=
c_clk' is never read
                   esc_clk =3D byte_clk / esc_div;
                   ^         ~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/exynos/exynos_drm_dsi.c:1060:4: warning: Value stored to=
 'length' is never read [clang-analyzer-deadcode.DeadStores]
                           length =3D xfer->rx_len;
                           ^        ~~~~~~~~~~~~
   drivers/gpu/drm/exynos/exynos_drm_dsi.c:1060:4: note: Value stored to 'l=
ength' is never read
                           length =3D xfer->rx_len;
                           ^        ~~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   drivers/gpu/drm/exynos/exynos_mixer.c:464:9: warning: The result of the =
left shift is undefined because the left operand is negative [clang-analyze=
r-core.UndefinedBinaryOperatorResult]
                                       MXR_LAYER_CFG_GRP0_MASK);
                                       ^
   drivers/gpu/drm/exynos/regs-mixer.h:153:34: note: expanded from macro 'M=
XR_LAYER_CFG_GRP0_MASK'
   #define MXR_LAYER_CFG_GRP0_MASK         MXR_LAYER_CFG_GRP0_VAL(~0)
                                           ^
   drivers/gpu/drm/exynos/regs-mixer.h:152:35: note: expanded from macro 'M=
XR_LAYER_CFG_GRP0_VAL'
   #define MXR_LAYER_CFG_GRP0_VAL(x)       MXR_MASK_VAL(x, 7, 4)
                                           ^
   drivers/gpu/drm/exynos/regs-mixer.h:70:10: note: expanded from macro 'MX=
R_MASK_VAL'
           (((val) << (low_bit)) & MXR_MASK(high_bit, low_bit))
                   ^
   drivers/gpu/drm/exynos/exynos_mixer.c:1031:6: note: Assuming the conditi=
on is false
           if (!test_bit(MXR_BIT_POWERED, &ctx->flags))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/exynos/exynos_mixer.c:1031:2: note: Taking false branch
           if (!test_bit(MXR_BIT_POWERED, &ctx->flags))
           ^
   drivers/gpu/drm/exynos/exynos_mixer.c:1037:2: note: Loop condition is tr=
ue.  Entering loop body
           for (i =3D 0; i < MIXER_WIN_NR; i++)
           ^
   drivers/gpu/drm/exynos/exynos_mixer.c:1038:3: note: Calling 'mixer_disab=
le_plane'
                   mixer_disable_plane(crtc, &ctx->planes[i]);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/exynos/exynos_mixer.c:973:6: note: Assuming the conditio=
n is false
           if (!test_bit(MXR_BIT_POWERED, &mixer_ctx->flags))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/exynos/exynos_mixer.c:973:2: note: Taking false branch
           if (!test_bit(MXR_BIT_POWERED, &mixer_ctx->flags))
           ^
   drivers/gpu/drm/exynos/exynos_mixer.c:976:2: note: Loop condition is fal=
se.  Exiting loop
           spin_lock_irqsave(&mixer_ctx->reg_slock, flags);
           ^
   include/linux/spinlock.h:393:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:254:2: note: expanded from macro 'raw_spin_lock=
_irqsave'
           do {                                            \
           ^
   drivers/gpu/drm/exynos/exynos_mixer.c:976:2: note: Loop condition is fal=
se.  Exiting loop
           spin_lock_irqsave(&mixer_ctx->reg_slock, flags);
           ^
   include/linux/spinlock.h:391:43: note: expanded from macro 'spin_lock_ir=
qsave'
   #define spin_lock_irqsave(lock, flags)                          \
                                                                   ^
   drivers/gpu/drm/exynos/exynos_mixer.c:977:2: note: Calling 'mixer_cfg_la=
yer'
           mixer_cfg_layer(mixer_ctx, plane->index, 0, false);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/exynos/exynos_mixer.c:457:12: note: 'enable' is false
           u32 val =3D enable ? ~0 : 0;
                     ^~~~~~
   drivers/gpu/drm/exynos/exynos_mixer.c:457:12: note: '?' condition is fal=
se
   drivers/gpu/drm/exynos/exynos_mixer.c:459:2: note: Control jumps to 'cas=
e 0:'  at line 460
           switch (win) {
           ^
   drivers/gpu/drm/exynos/exynos_mixer.c:464:9: note: The result of the lef=
t shift is undefined because the left operand is negative
                                       MXR_LAYER_CFG_GRP0_MASK);
                                       ^
   drivers/gpu/drm/exynos/regs-mixer.h:153:34: note: expanded from macro 'M=
XR_LAYER_CFG_GRP0_MASK'
   #define MXR_LAYER_CFG_GRP0_MASK         MXR_LAYER_CFG_GRP0_VAL(~0)
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/exynos/regs-mixer.h:152:35: note: expanded from macro 'M=
XR_LAYER_CFG_GRP0_VAL'
   #define MXR_LAYER_CFG_GRP0_VAL(x)       MXR_MASK_VAL(x, 7, 4)
                                           ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/exynos/regs-mixer.h:70:10: note: expanded from macro 'MX=
R_MASK_VAL'
           (((val) << (low_bit)) & MXR_MASK(high_bit, low_bit))
             ~~~~~ ^
   drivers/gpu/drm/exynos/exynos_mixer.c:470:9: warning: The result of the =
left shift is undefined because the left operand is negative [clang-analyze=
r-core.UndefinedBinaryOperatorResult]
                                       MXR_LAYER_CFG_GRP1_MASK);
                                       ^
   drivers/gpu/drm/exynos/regs-mixer.h:151:34: note: expanded from macro 'M=
XR_LAYER_CFG_GRP1_MASK'
   #define MXR_LAYER_CFG_GRP1_MASK         MXR_LAYER_CFG_GRP1_VAL(~0)
                                           ^
   drivers/gpu/drm/exynos/regs-mixer.h:150:35: note: expanded from macro 'M=
XR_LAYER_CFG_GRP1_VAL'
   #define MXR_LAYER_CFG_GRP1_VAL(x)       MXR_MASK_VAL(x, 11, 8)
                                           ^
   drivers/gpu/drm/exynos/regs-mixer.h:70:10: note: expanded from macro 'MX=
R_MASK_VAL'
           (((val) << (low_bit)) & MXR_MASK(high_bit, low_bit))
                   ^
   drivers/gpu/drm/exynos/exynos_mixer.c:1031:6: note: Assuming the conditi=
on is false
           if (!test_bit(MXR_BIT_POWERED, &ctx->flags))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/exynos/exynos_mixer.c:1031:2: note: Taking false branch
           if (!test_bit(MXR_BIT_POWERED, &ctx->flags))
           ^
   drivers/gpu/drm/exynos/exynos_mixer.c:1037:2: note: Loop condition is tr=
ue.  Entering loop body
--
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
   drivers/hwmon/tmp513.c:277:9: note: '?' condition is true
                   val =3D clamp_val(val, MIN_TEMP_LIMIT, MAX_TEMP_LIMIT);
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
                   ^
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^
   drivers/hwmon/tmp513.c:278:12: note: Left side of '||' is false
                   regval =3D DIV_ROUND_CLOSEST(val * 10, 625) << TMP51X_TE=
MP_SHIFT;
                            ^
   include/linux/math.h:89:3: note: expanded from macro 'DIV_ROUND_CLOSEST'
           (((typeof(x))-1) > 0 ||                         \
            ^
   drivers/hwmon/tmp513.c:278:12: note: Left side of '||' is false
                   regval =3D DIV_ROUND_CLOSEST(val * 10, 625) << TMP51X_TE=
MP_SHIFT;
                            ^
   include/linux/math.h:89:3: note: expanded from macro 'DIV_ROUND_CLOSEST'
           (((typeof(x))-1) > 0 ||                         \
            ^
   drivers/hwmon/tmp513.c:278:12: note: '?' condition is false
                   regval =3D DIV_ROUND_CLOSEST(val * 10, 625) << TMP51X_TE=
MP_SHIFT;
                            ^
   include/linux/math.h:89:2: note: expanded from macro 'DIV_ROUND_CLOSEST'
           (((typeof(x))-1) > 0 ||                         \
           ^
   drivers/hwmon/tmp513.c:278:45: note: The result of the left shift is und=
efined because the left operand is negative
                   regval =3D DIV_ROUND_CLOSEST(val * 10, 625) << TMP51X_TE=
MP_SHIFT;
                                                             ^
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
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
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
>> net/sysctl_net.c:146:4: warning: Value stored to 'where' is never read [=
clang-analyzer-deadcode.DeadStores]
                           where =3D "module";
                           ^       ~~~~~~~~
   net/sysctl_net.c:146:4: note: Value stored to 'where' is never read
                           where =3D "module";
                           ^       ~~~~~~~~
   net/sysctl_net.c:148:4: warning: Value stored to 'where' is never read [=
clang-analyzer-deadcode.DeadStores]
                           where =3D "kernel";
                           ^       ~~~~~~~~
   net/sysctl_net.c:148:4: note: Value stored to 'where' is never read
                           where =3D "kernel";
                           ^       ~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/gpu/drm/panel/panel-innolux-p079zca.c:459:3: warning: Value stor=
ed to 'err' is never read [clang-analyzer-deadcode.DeadStores]
                   err =3D PTR_ERR(innolux->enable_gpio);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/panel/panel-innolux-p079zca.c:459:3: note: Value stored =
to 'err' is never read
                   err =3D PTR_ERR(innolux->enable_gpio);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   net/socket.c:585:3: warning: Value stored to 'buffer' is never read [cla=
ng-analyzer-deadcode.DeadStores]
                   buffer +=3D len;
                   ^         ~~~
   net/socket.c:585:3: note: Value stored to 'buffer' is never read
                   buffer +=3D len;
                   ^         ~~~
   net/socket.c:2126:21: warning: Value stored to 'sk' during its initializ=
ation is never read [clang-analyzer-deadcode.DeadStores]
           const struct sock *sk =3D sock->sk;
                              ^~   ~~~~~~~~
   net/socket.c:2126:21: note: Value stored to 'sk' during its initializati=
on is never read
           const struct sock *sk =3D sock->sk;
                              ^~   ~~~~~~~~
   net/socket.c:2213:3: warning: Value stored to 'max_optlen' is never read=
 [clang-analyzer-deadcode.DeadStores]
                   max_optlen =3D BPF_CGROUP_GETSOCKOPT_MAX_OPTLEN(optlen);
                   ^
   net/socket.c:2213:3: note: Value stored to 'max_optlen' is never read
   net/socket.c:2461:3: warning: Address of stack memory associated with lo=
cal variable 'address' is still referred to by the stack variable 'msg_sys'=
 upon returning to the caller.  This will be a dangling reference [clang-an=
alyzer-core.StackAddressEscape]
                   return err;
                   ^
   net/socket.c:2575:1: note: Calling '__do_sys_sendmmsg'
   SYSCALL_DEFINE4(sendmmsg, int, fd, struct mmsghdr __user *, mmsg,
   ^
   include/linux/syscalls.h:219:36: note: expanded from macro 'SYSCALL_DEFI=
NE4'
   #define SYSCALL_DEFINE4(name, ...) SYSCALL_DEFINEx(4, _##name, __VA_ARGS=
__)
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   include/linux/syscalls.h:227:2: note: expanded from macro 'SYSCALL_DEFIN=
Ex'
           __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:248:14: note: expanded from macro '__SYSCALL_DE=
FINEx'
                   long ret =3D __do_sys##name(__MAP(x,__SC_CAST,__VA_ARGS_=
_));\
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: expanded from here
   net/socket.c:2578:9: note: Calling '__sys_sendmmsg'
           return __sys_sendmmsg(fd, mmsg, vlen, flags, true);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/socket.c:2519:6: note: 'forbid_cmsg_compat' is true
           if (forbid_cmsg_compat && (flags & MSG_CMSG_COMPAT))
               ^~~~~~~~~~~~~~~~~~
   net/socket.c:2519:6: note: Left side of '&&' is true
   net/socket.c:2519:2: note: Taking false branch
           if (forbid_cmsg_compat && (flags & MSG_CMSG_COMPAT))
           ^
   net/socket.c:2522:6: note: Assuming 'vlen' is <=3D UIO_MAXIOV
           if (vlen > UIO_MAXIOV)
               ^~~~~~~~~~~~~~~~~
   net/socket.c:2522:2: note: Taking false branch
           if (vlen > UIO_MAXIOV)
--
                                   ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletim=
e_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
           ^
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:302:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   include/linux/atomic/atomic-instrumented.h:28:9: note: Loop condition is=
 false.  Exiting loop
           return arch_atomic_read(v);
                  ^
   arch/arm/include/asm/atomic.h:25:29: note: expanded from macro 'arch_ato=
mic_read'
   #define arch_atomic_read(v)     READ_ONCE((v)->counter)
                                   ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletim=
e_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
           ^
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:300:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   include/linux/atomic/atomic-instrumented.h:28:9: note: Use of memory aft=
er it is freed
           return arch_atomic_read(v);
                  ^
   arch/arm/include/asm/atomic.h:25:29: note: expanded from macro 'arch_ato=
mic_read'
   #define arch_atomic_read(v)     READ_ONCE((v)->counter)
                                   ^~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:50:2: note: expanded from macro 'READ_ONCE'
           __READ_ONCE(x);                                                 \
           ^~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:44:24: note: expanded from macro '__READ_ON=
CE'
   #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(=
x))
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   net/lapb/lapb_iface.c:202:2: warning: Use of memory after it is freed [c=
lang-analyzer-unix.Malloc]
           lapb_put(lapb);
           ^        ~~~~
   net/lapb/lapb_iface.c:179:6: note: Assuming 'lapb' is non-null
           if (!lapb)
               ^~~~~
   net/lapb/lapb_iface.c:179:2: note: Taking false branch
           if (!lapb)
           ^
   net/lapb/lapb_iface.c:184:9: note: Assuming the condition is false
           while (refcount_read(&lapb->refcnt) > 2)
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/lapb/lapb_iface.c:184:2: note: Loop condition is false. Execution co=
ntinues on line 187
           while (refcount_read(&lapb->refcnt) > 2)
           ^
   net/lapb/lapb_iface.c:200:2: note: Calling '__lapb_remove_cb'
           __lapb_remove_cb(lapb);
           ^~~~~~~~~~~~~~~~~~~~~~
   net/lapb/lapb_iface.c:66:6: note: Assuming field 'next' is non-null
           if (lapb->node.next) {
               ^~~~~~~~~~~~~~~
   net/lapb/lapb_iface.c:66:2: note: Taking true branch
           if (lapb->node.next) {
           ^
   net/lapb/lapb_iface.c:68:3: note: Calling 'lapb_put'
                   lapb_put(lapb);
                   ^~~~~~~~~~~~~~
   net/lapb/lapb_iface.c:57:2: note: Taking true branch
           if (refcount_dec_and_test(&lapb->refcnt))
           ^
   net/lapb/lapb_iface.c:58:3: note: Calling 'lapb_free_cb'
                   lapb_free_cb(lapb);
                   ^~~~~~~~~~~~~~~~~~
   net/lapb/lapb_iface.c:47:2: note: Memory is released
           kfree(lapb);
           ^~~~~~~~~~~
   net/lapb/lapb_iface.c:58:3: note: Returning; memory was released via 1st=
 parameter
                   lapb_free_cb(lapb);
                   ^~~~~~~~~~~~~~~~~~
   net/lapb/lapb_iface.c:68:3: note: Returning; memory was released via 1st=
 parameter
                   lapb_put(lapb);
                   ^~~~~~~~~~~~~~
   net/lapb/lapb_iface.c:200:2: note: Returning; memory was released via 1s=
t parameter
           __lapb_remove_cb(lapb);
           ^~~~~~~~~~~~~~~~~~~~~~
   net/lapb/lapb_iface.c:202:2: note: Use of memory after it is freed
           lapb_put(lapb);
           ^        ~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
>> drivers/i2c/busses/i2c-qcom-geni.c:170:6: warning: Value stored to 'm_cm=
d' during its initialization is never read [clang-analyzer-deadcode.DeadSto=
res]
           u32 m_cmd =3D readl_relaxed(gi2c->se.base + SE_GENI_M_CMD0);
               ^~~~~
   drivers/i2c/busses/i2c-qcom-geni.c:170:6: note: Value stored to 'm_cmd' =
during its initialization is never read
           u32 m_cmd =3D readl_relaxed(gi2c->se.base + SE_GENI_M_CMD0);
               ^~~~~
>> drivers/i2c/busses/i2c-qcom-geni.c:171:6: warning: Value stored to 'm_st=
at' during its initialization is never read [clang-analyzer-deadcode.DeadSt=
ores]
           u32 m_stat =3D readl_relaxed(gi2c->se.base + SE_GENI_M_IRQ_STATU=
S);
               ^~~~~~
   drivers/i2c/busses/i2c-qcom-geni.c:171:6: note: Value stored to 'm_stat'=
 during its initialization is never read
           u32 m_stat =3D readl_relaxed(gi2c->se.base + SE_GENI_M_IRQ_STATU=
S);
               ^~~~~~
>> drivers/i2c/busses/i2c-qcom-geni.c:172:6: warning: Value stored to 'geni=
_s' during its initialization is never read [clang-analyzer-deadcode.DeadSt=
ores]
           u32 geni_s =3D readl_relaxed(gi2c->se.base + SE_GENI_STATUS);
               ^~~~~~
   drivers/i2c/busses/i2c-qcom-geni.c:172:6: note: Value stored to 'geni_s'=
 during its initialization is never read
           u32 geni_s =3D readl_relaxed(gi2c->se.base + SE_GENI_STATUS);
               ^~~~~~
>> drivers/i2c/busses/i2c-qcom-geni.c:173:6: warning: Value stored to 'geni=
_ios' during its initialization is never read [clang-analyzer-deadcode.Dead=
Stores]
           u32 geni_ios =3D readl_relaxed(gi2c->se.base + SE_GENI_IOS);
               ^~~~~~~~
   drivers/i2c/busses/i2c-qcom-geni.c:173:6: note: Value stored to 'geni_io=
s' during its initialization is never read
           u32 geni_ios =3D readl_relaxed(gi2c->se.base + SE_GENI_IOS);
               ^~~~~~~~
>> drivers/i2c/busses/i2c-qcom-geni.c:178:3: warning: Value stored to 'rx_s=
t' is never read [clang-analyzer-deadcode.DeadStores]
                   rx_st =3D readl_relaxed(gi2c->se.base + SE_DMA_RX_IRQ_ST=
AT);
                   ^
   drivers/i2c/busses/i2c-qcom-geni.c:178:3: note: Value stored to 'rx_st' =
is never read
>> drivers/i2c/busses/i2c-qcom-geni.c:179:3: warning: Value stored to 'tx_s=
t' is never read [clang-analyzer-deadcode.DeadStores]
                   tx_st =3D readl_relaxed(gi2c->se.base + SE_DMA_TX_IRQ_ST=
AT);
                   ^
   drivers/i2c/busses/i2c-qcom-geni.c:179:3: note: Value stored to 'tx_st' =
is never read
   drivers/i2c/busses/i2c-qcom-geni.c:181:3: warning: Value stored to 'rx_s=
t' is never read [clang-analyzer-deadcode.DeadStores]
                   rx_st =3D readl_relaxed(gi2c->se.base + SE_GENI_RX_FIFO_=
STATUS);
                   ^
   drivers/i2c/busses/i2c-qcom-geni.c:181:3: note: Value stored to 'rx_st' =
is never read
   drivers/i2c/busses/i2c-qcom-geni.c:182:3: warning: Value stored to 'tx_s=
t' is never read [clang-analyzer-deadcode.DeadStores]
                   tx_st =3D readl_relaxed(gi2c->se.base + SE_GENI_TX_FIFO_=
STATUS);
                   ^
   drivers/i2c/busses/i2c-qcom-geni.c:182:3: note: Value stored to 'tx_st' =
is never read
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/media/mc/mc-request.c:190:23: warning: Value stored to 'mdev' du=
ring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct media_device *mdev =3D req->mdev;
                                ^~~~   ~~~~~~~~~
   drivers/media/mc/mc-request.c:190:23: note: Value stored to 'mdev' durin=
g its initialization is never read
           struct media_device *mdev =3D req->mdev;
                                ^~~~   ~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/media/dvb-core/dvb_ca_en50221.c:760:19: warning: The left operan=
d of '&' is a garbage value [clang-analyzer-core.UndefinedBinaryOperatorRes=
ult]
                   buf[0], (buf[1] & 0x80) =3D=3D 0, bytes_read);
                                   ^
   drivers/media/dvb-core/dvb_ca_en50221.c:40:53: note: expanded from macro=
 'dprintk'
                   printk(KERN_DEBUG pr_fmt("%s: " fmt), __func__, ##arg);\
                                                                     ^~~
   include/linux/printk.h:446:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                              ^~~~~~~~~~~
   include/linux/printk.h:418:19: note: expanded from macro 'printk_index_w=
rap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                                   ^~~~~~~~~~~
   drivers/media/dvb-core/dvb_ca_en50221.c:640:2: note: Assuming 'dvb_ca_en=
50221_debug' is 0
           dprintk("%s\n", __func__);
           ^
   drivers/media/dvb-core/dvb_ca_en50221.c:39:6: note: expanded from macro =
'dprintk'
           if (dvb_ca_en50221_debug)                                       \
               ^~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-core/dvb_ca_en50221.c:640:2: note: Taking false branch
           dprintk("%s\n", __func__);
           ^
   drivers/media/dvb-core/dvb_ca_en50221.c:39:2: note: expanded from macro =
'dprintk'
           if (dvb_ca_en50221_debug)                                       \
           ^
   drivers/media/dvb-core/dvb_ca_en50221.c:640:2: note: Loop condition is f=
alse.  Exiting loop
           dprintk("%s\n", __func__);
           ^
   drivers/media/dvb-core/dvb_ca_en50221.c:38:30: note: expanded from macro=
 'dprintk'
   #define dprintk(fmt, arg...) do {                                       \
                                ^
   drivers/media/dvb-core/dvb_ca_en50221.c:643:6: note: Assuming 'ebuf' is =
non-null
           if (!ebuf) {
               ^~~~~
   drivers/media/dvb-core/dvb_ca_en50221.c:643:2: note: Taking false branch
           if (!ebuf) {
           ^
   drivers/media/dvb-core/dvb_ca_en50221.c:659:6: note: Assuming field 'rea=
d_data' is null
           if (ca->pub->read_data &&
               ^~~~~~~~~~~~~~~~~~
   drivers/media/dvb-core/dvb_ca_en50221.c:659:25: note: Left side of '&&' =
is false
           if (ca->pub->read_data &&
                                  ^
   drivers/media/dvb-core/dvb_ca_en50221.c:675:7: note: Assuming 'status' i=
s >=3D 0
                   if (status < 0)
                       ^~~~~~~~~~
   drivers/media/dvb-core/dvb_ca_en50221.c:675:3: note: Taking false branch
                   if (status < 0)
                   ^
   drivers/media/dvb-core/dvb_ca_en50221.c:677:7: note: Assuming the condit=
ion is false
                   if (!(status & STATUSREG_DA)) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-core/dvb_ca_en50221.c:677:3: note: Taking false branch
                   if (!(status & STATUSREG_DA)) {
--
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
   drivers/hwmon/max31730.c:219:8: note: '__UNIQUE_ID___x304' is < '__UNIQU=
E_ID___y305'
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
                   ^
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^
   drivers/hwmon/max31730.c:219:2: note: The value -128000 is assigned to '=
val'
           val =3D clamp_val(val, MAX31730_TEMP_MIN, MAX31730_TEMP_MAX);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/max31730.c:220:30: note: The result of the left shift is u=
ndefined because the left operand is negative
           val =3D DIV_ROUND_CLOSEST(val << 4, 1000) << 4;
                                       ^
   include/linux/math.h:87:18: note: expanded from macro 'DIV_ROUND_CLOSEST'
           typeof(x) __x =3D x;                              \
                           ^
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/iommu/sun50i-iommu.c:510:3: warning: Value stored to 'dte' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
                   dte =3D old_dte;
                   ^     ~~~~~~~
   drivers/iommu/sun50i-iommu.c:510:3: note: Value stored to 'dte' is never=
 read
                   dte =3D old_dte;
                   ^     ~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
>> drivers/gpu/drm/drm_gem_vram_helper.c:396:21: warning: Value stored to '=
dev' during its initialization is never read [clang-analyzer-deadcode.DeadS=
tores]
           struct drm_device *dev =3D gbo->bo.base.dev;
                              ^~~   ~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_gem_vram_helper.c:396:21: note: Value stored to 'dev=
' during its initialization is never read
           struct drm_device *dev =3D gbo->bo.base.dev;
                              ^~~   ~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_gem_vram_helper.c:564:21: warning: Value stored to '=
dev' during its initialization is never read [clang-analyzer-deadcode.DeadS=
tores]
           struct drm_device *dev =3D bo->base.dev;
                              ^~~   ~~~~~~~~~~~~
   drivers/gpu/drm/drm_gem_vram_helper.c:564:21: note: Value stored to 'dev=
' during its initialization is never read
           struct drm_device *dev =3D bo->base.dev;
                              ^~~   ~~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   lib/test_lockup.c:231:32: warning: The right operand of '-' is a garbage=
 value [clang-analyzer-core.UndefinedBinaryOperatorResult]
                   s64 cur_wait =3D local_clock() - wait_start;
                                                ^ ~~~~~~~~~~
   lib/test_lockup.c:171:2: note: 'wait_start' declared without an initial =
value
           u64 wait_start;
           ^~~~~~~~~~~~~~
   lib/test_lockup.c:173:6: note: Assuming 'measure_lock_wait' is false
           if (measure_lock_wait)
               ^~~~~~~~~~~~~~~~~
   lib/test_lockup.c:173:2: note: Taking false branch
           if (measure_lock_wait)
           ^
   lib/test_lockup.c:176:6: note: Assuming 'lock_mutex_ptr' is not equal to=
 0
           if (lock_mutex_ptr && master) {
               ^~~~~~~~~~~~~~
   lib/test_lockup.c:176:6: note: Left side of '&&' is true
   lib/test_lockup.c:176:24: note: Assuming 'master' is true
           if (lock_mutex_ptr && master) {
                                 ^~~~~~
   lib/test_lockup.c:176:2: note: Taking true branch
           if (lock_mutex_ptr && master) {
           ^
   lib/test_lockup.c:177:7: note: Assuming 'verbose' is false
                   if (verbose)
                       ^~~~~~~
   lib/test_lockup.c:177:3: note: Taking false branch
                   if (verbose)
                   ^
   lib/test_lockup.c:182:6: note: Assuming 'lock_rwsem_ptr' is 0
           if (lock_rwsem_ptr && master) {
               ^~~~~~~~~~~~~~
   lib/test_lockup.c:182:21: note: Left side of '&&' is false
           if (lock_rwsem_ptr && master) {
                              ^
   lib/test_lockup.c:192:6: note: Assuming 'lock_mmap_sem' is false
           if (lock_mmap_sem && master) {
               ^~~~~~~~~~~~~
   lib/test_lockup.c:192:20: note: Left side of '&&' is false
           if (lock_mmap_sem && master) {
                             ^
   lib/test_lockup.c:201:6: note: Assuming 'test_disable_irq' is false
           if (test_disable_irq)
               ^~~~~~~~~~~~~~~~
   lib/test_lockup.c:201:2: note: Taking false branch
           if (test_disable_irq)
           ^
   lib/test_lockup.c:204:6: note: Assuming 'disable_softirq' is false
           if (disable_softirq)
               ^~~~~~~~~~~~~~~
   lib/test_lockup.c:204:2: note: Taking false branch
           if (disable_softirq)
           ^
   lib/test_lockup.c:207:6: note: Assuming 'disable_preempt' is false
           if (disable_preempt)
               ^~~~~~~~~~~~~~~
   lib/test_lockup.c:207:2: note: Taking false branch
           if (disable_preempt)
           ^
   lib/test_lockup.c:210:6: note: Assuming 'lock_rcu' is false
           if (lock_rcu)
               ^~~~~~~~
   lib/test_lockup.c:210:2: note: Taking false branch
           if (lock_rcu)
           ^
   lib/test_lockup.c:213:6: note: Assuming 'lock_spinlock_ptr' is 0
           if (lock_spinlock_ptr && master) {
               ^~~~~~~~~~~~~~~~~
   lib/test_lockup.c:213:24: note: Left side of '&&' is false
           if (lock_spinlock_ptr && master) {
                                 ^
   lib/test_lockup.c:220:6: note: Assuming 'lock_rwlock_ptr' is 0
           if (lock_rwlock_ptr && master) {
               ^~~~~~~~~~~~~~~
   lib/test_lockup.c:220:22: note: Left side of '&&' is false
           if (lock_rwlock_ptr && master) {
                               ^
   lib/test_lockup.c:230:6: note: Assuming 'measure_lock_wait' is true
--
   5 warnings generated.
   drivers/misc/bcm-vk/bcm_vk_msg.c:543:17: warning: Value stored to 'dev' =
during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D &vk->pdev->dev;
                          ^~~   ~~~~~~~~~~~~~~
   drivers/misc/bcm-vk/bcm_vk_msg.c:543:17: note: Value stored to 'dev' dur=
ing its initialization is never read
           struct device *dev =3D &vk->pdev->dev;
                          ^~~   ~~~~~~~~~~~~~~
   drivers/misc/bcm-vk/bcm_vk_msg.c:731:17: warning: Value stored to 'dev' =
during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D &vk->pdev->dev;
                          ^~~   ~~~~~~~~~~~~~~
   drivers/misc/bcm-vk/bcm_vk_msg.c:731:17: note: Value stored to 'dev' dur=
ing its initialization is never read
           struct device *dev =3D &vk->pdev->dev;
                          ^~~   ~~~~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
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
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (3 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
>> drivers/nvmem/sunxi_sid.c:107:2: warning: Null pointer passed as 1st arg=
ument to memory copy function [clang-analyzer-unix.cstring.NullArg]
           memcpy(val, &word, bytes);
           ^      ~~~
   drivers/nvmem/sunxi_sid.c:89:9: note: Assuming 'bytes' is >=3D 4
           while (bytes >=3D 4) {
                  ^~~~~~~~~~
   drivers/nvmem/sunxi_sid.c:89:2: note: Loop condition is true.  Entering =
loop body
           while (bytes >=3D 4) {
           ^
   drivers/nvmem/sunxi_sid.c:90:9: note: Calling 'sun8i_sid_register_readou=
t'
                   ret =3D sun8i_sid_register_readout(sid, offset, val);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvmem/sunxi_sid.c:61:2: note: Loop condition is false.  Exiting =
loop
           writel(reg_val, sid->base + SUN8I_SID_PRCTL);
           ^
   arch/arm/include/asm/io.h:308:25: note: expanded from macro 'writel'
   #define writel(v,c)             ({ __iowmb(); writel_relaxed(v,c); })
                                      ^
   arch/arm/include/asm/io.h:167:20: note: expanded from macro '__iowmb'
   #define __iowmb()               wmb()
                                   ^
   arch/arm/include/asm/barrier.h:66:16: note: expanded from macro 'wmb'
   #define wmb()           __arm_heavy_mb(st)
                           ^
   arch/arm/include/asm/barrier.h:58:30: note: expanded from macro '__arm_h=
eavy_mb'
   #define __arm_heavy_mb(x...) do { dsb(x); arm_heavy_mb(); } while (0)
                                ^
   drivers/nvmem/sunxi_sid.c:63:8: note: '__sleep_us' is not equal to 0
           ret =3D readl_poll_timeout(sid->base + SUN8I_SID_PRCTL, reg_val,
                 ^
   include/linux/iopoll.h:156:2: note: expanded from macro 'readl_poll_time=
out'
           readx_poll_timeout(readl, addr, val, cond, delay_us, timeout_us)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/iopoll.h:121:2: note: expanded from macro 'readx_poll_time=
out'
           read_poll_timeout(op, val, cond, sleep_us, timeout_us, false, ad=
dr)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   include/linux/iopoll.h:42:17: note: expanded from macro 'read_poll_timeo=
ut'
           might_sleep_if((__sleep_us) !=3D 0); \
                          ^~~~~~~~~~~~
   include/linux/kernel.h:183:39: note: expanded from macro 'might_sleep_if'
   #define might_sleep_if(cond) do { if (cond) might_sleep(); } while (0)
                                         ^~~~
   drivers/nvmem/sunxi_sid.c:63:8: note: Taking true branch
           ret =3D readl_poll_timeout(sid->base + SUN8I_SID_PRCTL, reg_val,
                 ^
   include/linux/iopoll.h:156:2: note: expanded from macro 'readl_poll_time=
out'
           readx_poll_timeout(readl, addr, val, cond, delay_us, timeout_us)
           ^
   include/linux/iopoll.h:121:2: note: expanded from macro 'readx_poll_time=
out'
           read_poll_timeout(op, val, cond, sleep_us, timeout_us, false, ad=
dr)
           ^
   include/linux/iopoll.h:42:2: note: expanded from macro 'read_poll_timeou=
t'
           might_sleep_if((__sleep_us) !=3D 0); \
           ^
   include/linux/kernel.h:183:35: note: expanded from macro 'might_sleep_if'
   #define might_sleep_if(cond) do { if (cond) might_sleep(); } while (0)
                                     ^
   drivers/nvmem/sunxi_sid.c:63:8: note: Loop condition is false.  Exiting =
loop
           ret =3D readl_poll_timeout(sid->base + SUN8I_SID_PRCTL, reg_val,
                 ^
   include/linux/iopoll.h:156:2: note: expanded from macro 'readl_poll_time=
out'
           readx_poll_timeout(readl, addr, val, cond, delay_us, timeout_us)
           ^
   include/linux/iopoll.h:121:2: note: expanded from macro 'readx_poll_time=
out'
           read_poll_timeout(op, val, cond, sleep_us, timeout_us, false, ad=
dr)
           ^
   include/linux/iopoll.h:42:2: note: expanded from macro 'read_poll_timeou=
t'
           might_sleep_if((__sleep_us) !=3D 0); \
           ^
   include/linux/kernel.h:183:45: note: expanded from macro 'might_sleep_if'
   #define might_sleep_if(cond) do { if (cond) might_sleep(); } while (0)
                                               ^
   include/linux/kernel.h:132:45: note: expanded from macro 'might_sleep'
           do { __might_sleep(__FILE__, __LINE__, 0); might_resched(); } wh=
ile (0)
                                                      ^
   include/linux/kernel.h:109:26: note: expanded from macro 'might_resched'
   # define might_resched() do { } while (0)
                            ^
   drivers/nvmem/sunxi_sid.c:63:8: note: Loop condition is false.  Exiting =
loop
           ret =3D readl_poll_timeout(sid->base + SUN8I_SID_PRCTL, reg_val,
                 ^
   include/linux/iopoll.h:156:2: note: expanded from macro 'readl_poll_time=
out'
           readx_poll_timeout(readl, addr, val, cond, delay_us, timeout_us)
           ^
   include/linux/iopoll.h:121:2: note: expanded from macro 'readx_poll_time=
out'
           read_poll_timeout(op, val, cond, sleep_us, timeout_us, false, ad=
dr)
           ^
   include/linux/iopoll.h:42:2: note: expanded from macro 'read_poll_timeou=
t'
           might_sleep_if((__sleep_us) !=3D 0); \
           ^
   include/linux/kernel.h:183:45: note: expanded from macro 'might_sleep_if'
   #define might_sleep_if(cond) do { if (cond) might_sleep(); } while (0)
                                               ^
   include/linux/kernel.h:132:2: note: expanded from macro 'might_sleep'
           do { __might_sleep(__FILE__, __LINE__, 0); might_resched(); } wh=
ile (0)
           ^
   drivers/nvmem/sunxi_sid.c:63:8: note: Loop condition is false.  Exiting =
loop
           ret =3D readl_poll_timeout(sid->base + SUN8I_SID_PRCTL, reg_val,
                 ^
   include/linux/iopoll.h:156:2: note: expanded from macro 'readl_poll_time=
out'
           readx_poll_timeout(readl, addr, val, cond, delay_us, timeout_us)
--
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/media/dvb-frontends/stv6111.c:473:2: warning: Value stored to 'i=
cp' is never read [clang-analyzer-deadcode.DeadStores]
           icp =3D 0;
           ^     ~
   drivers/media/dvb-frontends/stv6111.c:473:2: note: Value stored to 'icp'=
 is never read
           icp =3D 0;
           ^     ~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/media/dvb-frontends/sp2.c:208:14: warning: Value stored to 's' d=
uring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct sp2 *s =3D en50221->data;
                       ^   ~~~~~~~~~~~~~
   drivers/media/dvb-frontends/sp2.c:208:14: note: Value stored to 's' duri=
ng its initialization is never read
           struct sp2 *s =3D en50221->data;
                       ^   ~~~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   drivers/media/dvb-frontends/tda10071.c:42:21: warning: Value stored to '=
client' during its initialization is never read [clang-analyzer-deadcode.De=
adStores]
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/dvb-frontends/tda10071.c:42:21: note: Value stored to 'cli=
ent' during its initialization is never read
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/dvb-frontends/tda10071.c:92:21: warning: Value stored to '=
client' during its initialization is never read [clang-analyzer-deadcode.De=
adStores]
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/dvb-frontends/tda10071.c:92:21: note: Value stored to 'cli=
ent' during its initialization is never read
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/dvb-frontends/tda10071.c:137:21: warning: Value stored to =
'client' during its initialization is never read [clang-analyzer-deadcode.D=
eadStores]
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/dvb-frontends/tda10071.c:137:21: note: Value stored to 'cl=
ient' during its initialization is never read
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/dvb-frontends/tda10071.c:183:21: warning: Value stored to =
'client' during its initialization is never read [clang-analyzer-deadcode.D=
eadStores]
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/dvb-frontends/tda10071.c:183:21: note: Value stored to 'cl=
ient' during its initialization is never read
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/dvb-frontends/tda10071.c:243:21: warning: Value stored to =
'client' during its initialization is never read [clang-analyzer-deadcode.D=
eadStores]
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/dvb-frontends/tda10071.c:243:21: note: Value stored to 'cl=
ient' during its initialization is never read
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/dvb-frontends/tda10071.c:303:21: warning: Value stored to =
'client' during its initialization is never read [clang-analyzer-deadcode.D=
eadStores]
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/dvb-frontends/tda10071.c:303:21: note: Value stored to 'cl=
ient' during its initialization is never read
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/dvb-frontends/tda10071.c:366:21: warning: Value stored to =
'client' during its initialization is never read [clang-analyzer-deadcode.D=
eadStores]
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/dvb-frontends/tda10071.c:366:21: note: Value stored to 'cl=
ient' during its initialization is never read
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/dvb-frontends/tda10071.c:550:21: warning: Value stored to =
'client' during its initialization is never read [clang-analyzer-deadcode.D=
eadStores]
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/dvb-frontends/tda10071.c:550:21: note: Value stored to 'cl=
ient' during its initialization is never read
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/dvb-frontends/tda10071.c:696:21: warning: Value stored to =
'client' during its initialization is never read [clang-analyzer-deadcode.D=
eadStores]
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/dvb-frontends/tda10071.c:696:21: note: Value stored to 'cl=
ient' during its initialization is never read
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/dvb-frontends/tda10071.c:1041:21: warning: Value stored to=
 'client' during its initialization is never read [clang-analyzer-deadcode.=
DeadStores]
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/dvb-frontends/tda10071.c:1041:21: note: Value stored to 'c=
lient' during its initialization is never read
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
>> drivers/mtd/maps/pismo.c:246:11: warning: Array access (via field 'cs_ad=
drs') results in a null pointer dereference [clang-analyzer-core.NullDerefe=
rence]
                                         pdata->cs_addrs[i]);
                                         ^      ~~~~~~~~
   drivers/mtd/maps/pismo.c:214:2: note: 'pdata' initialized here
           struct pismo_pdata *pdata =3D client->dev.platform_data;
           ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/maps/pismo.c:219:7: note: Calling 'i2c_check_functionality'
           if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/i2c.h:900:9: note: Assuming the condition is true
           return (func & i2c_get_functionality(adap)) =3D=3D func;
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/i2c.h:900:2: note: Returning the value 1, which participat=
es in a condition later
           return (func & i2c_get_functionality(adap)) =3D=3D func;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/maps/pismo.c:219:7: note: Returning from 'i2c_check_function=
ality'
           if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/maps/pismo.c:219:2: note: Taking false branch
           if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
           ^
   drivers/mtd/maps/pismo.c:224:10: note: Calling 'kzalloc'
           pismo =3D kzalloc(sizeof(*pismo), GFP_KERNEL);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:721:9: note: Calling 'kmalloc'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:579:2: note: Taking false branch
           if (__builtin_constant_p(size)) {
           ^
   include/linux/slab.h:596:2: note: Returning pointer, which participates =
in a condition later
           return __kmalloc(size, flags);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:721:9: note: Returning from 'kmalloc'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:721:2: note: Returning pointer, which participates =
in a condition later
           return kmalloc(size, flags | __GFP_ZERO);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/maps/pismo.c:224:10: note: Returning from 'kzalloc'
           pismo =3D kzalloc(sizeof(*pismo), GFP_KERNEL);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/maps/pismo.c:225:6: note: Assuming 'pismo' is non-null
           if (!pismo)
               ^~~~~~
   drivers/mtd/maps/pismo.c:225:2: note: Taking false branch
           if (!pismo)
           ^
   drivers/mtd/maps/pismo.c:229:6: note: Assuming 'pdata' is null
           if (pdata) {
               ^~~~~
   drivers/mtd/maps/pismo.c:229:2: note: Taking false branch
           if (pdata) {
           ^
   drivers/mtd/maps/pismo.c:236:6: note: 'ret' is >=3D 0
           if (ret < 0) {
               ^~~
   drivers/mtd/maps/pismo.c:236:2: note: Taking false branch
           if (ret < 0) {
           ^
   drivers/mtd/maps/pismo.c:241:2: note: Left side of '&&' is true
           dev_info(&client->dev, "%.15s board found\n", eeprom.board);
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
   include/linux/printk.h:413:2: note: expanded from macro 'printk_index_su=
bsys_emit'
           __printk_index_emit(fmt, level, subsys_fmt_prefix)
           ^
   include/linux/printk.h:370:7: note: expanded from macro '__printk_index_=
emit'
                   if (__builtin_constant_p(_fmt) && __builtin_constant_p(_=
level)) { \
                       ^
   drivers/mtd/maps/pismo.c:241:2: note: Taking true branch
           dev_info(&client->dev, "%.15s board found\n", eeprom.board);
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
   include/linux/printk.h:413:2: note: expanded from macro 'printk_index_su=
bsys_emit'
           __printk_index_emit(fmt, level, subsys_fmt_prefix)
           ^
   include/linux/printk.h:370:3: note: expanded from macro '__printk_index_=
emit'
                   if (__builtin_constant_p(_fmt) && __builtin_constant_p(_=
level)) { \
                   ^
   drivers/mtd/maps/pismo.c:241:2: note: '?' condition is true
           dev_info(&client->dev, "%.15s board found\n", eeprom.board);
           ^
   include/linux/dev_printk.h:150:2: note: expanded from macro 'dev_info'
           dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), #=
#__VA_ARGS__)
--
           ^
   arch/arm/include/asm/io.h:308:25: note: expanded from macro 'writel'
   #define writel(v,c)             ({ __iowmb(); writel_relaxed(v,c); })
                                      ^
   arch/arm/include/asm/io.h:167:20: note: expanded from macro '__iowmb'
   #define __iowmb()               wmb()
                                   ^
   arch/arm/include/asm/barrier.h:66:16: note: expanded from macro 'wmb'
   #define wmb()           __arm_heavy_mb(st)
                           ^
   arch/arm/include/asm/barrier.h:58:30: note: expanded from macro '__arm_h=
eavy_mb'
   #define __arm_heavy_mb(x...) do { dsb(x); arm_heavy_mb(); } while (0)
                                ^
   drivers/mtd/nand/raw/pl35x-nand-controller.c:620:14: note: Field 'addr_c=
ycles' is <=3D 4
           if (plnand->addr_cycles > 4)
                       ^
   drivers/mtd/nand/raw/pl35x-nand-controller.c:620:2: note: Taking false b=
ranch
           if (plnand->addr_cycles > 4)
           ^
   drivers/mtd/nand/raw/pl35x-nand-controller.c:624:9: note: '?' condition =
is true
           ndelay(PSEC_TO_NSEC(sdr->tRR_min));
                  ^
   include/linux/mtd/rawnand.h:769:25: note: expanded from macro 'PSEC_TO_N=
SEC'
   #define PSEC_TO_NSEC(x) __DIVIDE(x, 1000)
                           ^
   include/linux/mtd/rawnand.h:765:25: note: expanded from macro '__DIVIDE'
           (__typeof__(dividend))(sizeof(dividend) <=3D sizeof(unsigned lon=
g) ?      \
                                  ^
   drivers/mtd/nand/raw/pl35x-nand-controller.c:626:6: note: Assuming 'ret'=
 is 0
           if (ret)
               ^~~
   drivers/mtd/nand/raw/pl35x-nand-controller.c:626:2: note: Taking false b=
ranch
           if (ret)
           ^
   drivers/mtd/nand/raw/pl35x-nand-controller.c:633:6: note: 'ret' is 0
           if (ret)
               ^~~
   drivers/mtd/nand/raw/pl35x-nand-controller.c:633:2: note: Taking false b=
ranch
           if (ret)
           ^
   drivers/mtd/nand/raw/pl35x-nand-controller.c:641:6: note: Assuming 'ret'=
 is 0
           if (ret)
               ^~~
   drivers/mtd/nand/raw/pl35x-nand-controller.c:641:2: note: Taking false b=
ranch
           if (ret)
           ^
   drivers/mtd/nand/raw/pl35x-nand-controller.c:647:9: note: Calling 'pl35x=
_nand_recover_data_hwecc'
           return pl35x_nand_recover_data_hwecc(nfc, chip, buf, nfc->ecc_bu=
f);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   drivers/mtd/nand/raw/pl35x-nand-controller.c:478:18: note: Assuming 'chu=
nk' is < field 'steps'
           for (chunk =3D 0; chunk < chip->ecc.steps;
                           ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/raw/pl35x-nand-controller.c:478:2: note: Loop condition=
 is true.  Entering loop body
           for (chunk =3D 0; chunk < chip->ecc.steps;
           ^
   drivers/mtd/nand/raw/pl35x-nand-controller.c:483:7: note: Assuming the c=
ondition is false
                   if (!PL35X_SMC_ECC_VALUE_IS_VALID(ecc_value))
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/raw/pl35x-nand-controller.c:483:3: note: Taking false b=
ranch
                   if (!PL35X_SMC_ECC_VALUE_IS_VALID(ecc_value))
                   ^
   drivers/mtd/nand/raw/pl35x-nand-controller.c:486:7: note: Assuming the c=
ondition is false
                   if (PL35X_SMC_ECC_VALUE_HAS_FAILED(ecc_value)) {
                       ^
   drivers/mtd/nand/raw/pl35x-nand-controller.c:85:46: note: expanded from =
macro 'PL35X_SMC_ECC_VALUE_HAS_FAILED'
   #define   PL35X_SMC_ECC_VALUE_HAS_FAILED(x) ((x) & BIT(28))
                                                ^~~~~~~~~~~~~
   drivers/mtd/nand/raw/pl35x-nand-controller.c:486:3: note: Taking false b=
ranch
                   if (PL35X_SMC_ECC_VALUE_HAS_FAILED(ecc_value)) {
                   ^
   drivers/mtd/nand/raw/pl35x-nand-controller.c:491:3: note: Calling 'pl35x=
_nand_ecc_reg_to_array'
                   pl35x_nand_ecc_reg_to_array(chip, ecc_value, calc_ecc);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/raw/pl35x-nand-controller.c:446:21: note: Assuming 'ecc=
_byte' is < field 'bytes'
           for (ecc_byte =3D 0; ecc_byte < chip->ecc.bytes; ecc_byte++)
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/raw/pl35x-nand-controller.c:446:2: note: Loop condition=
 is true.  Entering loop body
           for (ecc_byte =3D 0; ecc_byte < chip->ecc.bytes; ecc_byte++)
           ^
   drivers/mtd/nand/raw/pl35x-nand-controller.c:446:21: note: Assuming 'ecc=
_byte' is < field 'bytes'
           for (ecc_byte =3D 0; ecc_byte < chip->ecc.bytes; ecc_byte++)
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/raw/pl35x-nand-controller.c:446:2: note: Loop condition=
 is true.  Entering loop body
           for (ecc_byte =3D 0; ecc_byte < chip->ecc.bytes; ecc_byte++)
           ^
   drivers/mtd/nand/raw/pl35x-nand-controller.c:446:21: note: Assuming 'ecc=
_byte' is >=3D field 'bytes'
           for (ecc_byte =3D 0; ecc_byte < chip->ecc.bytes; ecc_byte++)
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/raw/pl35x-nand-controller.c:446:2: note: Loop condition=
 is false. Execution continues on line 446
           for (ecc_byte =3D 0; ecc_byte < chip->ecc.bytes; ecc_byte++)
           ^
   drivers/mtd/nand/raw/pl35x-nand-controller.c:491:3: note: Returning from=
 'pl35x_nand_ecc_reg_to_array'
                   pl35x_nand_ecc_reg_to_array(chip, ecc_value, calc_ecc);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/raw/pl35x-nand-controller.c:492:11: note: Calling 'pl35=
x_nand_correct_data'
                   stats =3D pl35x_nand_correct_data(nfc, data, read_ecc, c=
alc_ecc);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   drivers/mtd/nand/raw/pl35x-nand-controller.c:411:54: note: The left oper=
and of '<<' is a garbage value
           calc_ecc_upper =3D ((calc_ecc[1] >> 4) | (calc_ecc[2] << 4)) &
                                                   ~~~~~~~~~~~ ^
>> drivers/mtd/nand/raw/pl35x-nand-controller.c:1126:2: warning: Undefined =
or garbage value returned to caller [clang-analyzer-core.uninitialized.Unde=
fReturn]
           return ret;
           ^
   drivers/mtd/nand/raw/pl35x-nand-controller.c:1132:33: note: Left side of=
 '&&' is false
           struct amba_device *smc_amba =3D to_amba_device(smc_dev);
                                          ^
   include/linux/amba/bus.h:103:27: note: expanded from macro 'to_amba_devi=
ce'
   #define to_amba_device(d)       container_of(d, struct amba_device, dev)
                                   ^
   include/linux/kernel.h:495:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/mtd/nand/raw/pl35x-nand-controller.c:1132:33: note: Taking false=
 branch
           struct amba_device *smc_amba =3D to_amba_device(smc_dev);
                                          ^
   include/linux/amba/bus.h:103:27: note: expanded from macro 'to_amba_devi=
ce'
   #define to_amba_device(d)       container_of(d, struct amba_device, dev)
                                   ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:302:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/mtd/nand/raw/pl35x-nand-controller.c:1132:33: note: Loop conditi=
on is false.  Exiting loop
           struct amba_device *smc_amba =3D to_amba_device(smc_dev);
                                          ^
   include/linux/amba/bus.h:103:27: note: expanded from macro 'to_amba_devi=
ce'
   #define to_amba_device(d)       container_of(d, struct amba_device, dev)
                                   ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:300:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/mtd/nand/raw/pl35x-nand-controller.c:1137:6: note: Assuming 'nfc=
' is non-null
           if (!nfc)
               ^~~~
   drivers/mtd/nand/raw/pl35x-nand-controller.c:1137:2: note: Taking false =
branch
           if (!nfc)
           ^
   drivers/mtd/nand/raw/pl35x-nand-controller.c:1146:2: note: Taking false =
branch
           if (IS_ERR(nfc->conf_regs))
           ^
   drivers/mtd/nand/raw/pl35x-nand-controller.c:1150:2: note: Taking false =
branch
           if (IS_ERR(nfc->io_regs))
           ^
   drivers/mtd/nand/raw/pl35x-nand-controller.c:1154:6: note: 'ret' is 0
           if (ret)
               ^~~
   drivers/mtd/nand/raw/pl35x-nand-controller.c:1154:2: note: Taking false =
branch
           if (ret)
           ^
   drivers/mtd/nand/raw/pl35x-nand-controller.c:1157:8: note: Calling 'pl35=
x_nand_chips_init'
           ret =3D pl35x_nand_chips_init(nfc);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/raw/pl35x-nand-controller.c:1109:2: note: 'ret' declare=
d without an initial value
           int ret;
           ^~~~~~~
   drivers/mtd/nand/raw/pl35x-nand-controller.c:1111:6: note: Assuming 'nch=
ips' is not equal to 0
           if (!nchips || nchips > PL35X_NAND_MAX_CS) {
               ^~~~~~~
   drivers/mtd/nand/raw/pl35x-nand-controller.c:1111:6: note: Left side of =
'||' is false
   drivers/mtd/nand/raw/pl35x-nand-controller.c:1111:17: note: Assuming 'nc=
hips' is <=3D PL35X_NAND_MAX_CS
           if (!nchips || nchips > PL35X_NAND_MAX_CS) {
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/raw/pl35x-nand-controller.c:1111:2: note: Taking false =
branch
           if (!nchips || nchips > PL35X_NAND_MAX_CS) {
           ^
   drivers/mtd/nand/raw/pl35x-nand-controller.c:1117:29: note: Assuming 'na=
nd_np' is equal to null
           for_each_child_of_node(np, nand_np) {
                                      ^
   include/linux/of.h:1301:48: note: expanded from macro 'for_each_child_of=
_node'
           for (child =3D of_get_next_child(parent, NULL); child !=3D NULL;=
 \
                                                         ^~~~~~~~~~~~~
   drivers/mtd/nand/raw/pl35x-nand-controller.c:1117:2: note: Loop conditio=
n is false. Execution continues on line 1126
           for_each_child_of_node(np, nand_np) {
           ^
   include/linux/of.h:1301:2: note: expanded from macro 'for_each_child_of_=
node'
           for (child =3D of_get_next_child(parent, NULL); child !=3D NULL;=
 \
           ^
   drivers/mtd/nand/raw/pl35x-nand-controller.c:1126:2: note: Undefined or =
garbage value returned to caller
--
                                 ^
   drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c:216:12: note: Calling 'kzall=
oc'
           primary =3D kzalloc(sizeof(*primary), GFP_KERNEL);
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:721:9: note: Calling 'kmalloc'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:579:2: note: Taking false branch
           if (__builtin_constant_p(size)) {
           ^
   include/linux/slab.h:596:2: note: Returning pointer, which participates =
in a condition later
           return __kmalloc(size, flags);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:721:9: note: Returning from 'kmalloc'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:721:2: note: Returning pointer, which participates =
in a condition later
           return kmalloc(size, flags | __GFP_ZERO);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c:216:12: note: Returning from=
 'kzalloc'
           primary =3D kzalloc(sizeof(*primary), GFP_KERNEL);
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c:217:6: note: Assuming 'prima=
ry' is non-null
           if (!primary) {
               ^~~~~~~~
   drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c:217:2: note: Taking false br=
anch
           if (!primary) {
           ^
   drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c:228:6: note: Assuming 'ret' =
is not equal to 0
           if (ret) {
               ^~~
   drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c:228:2: note: Taking true bra=
nch
           if (ret) {
           ^
   drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c:230:3: note: Null pointer va=
lue stored to 'primary'
                   primary =3D NULL;
                   ^~~~~~~~~~~~~~
   drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c:232:23: note: Passing null p=
ointer value via 1st parameter 'plane'
           drm_plane_helper_add(primary, &fsl_dcu_drm_plane_helper_funcs);
                                ^~~~~~~
   drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c:232:2: note: Calling 'drm_pl=
ane_helper_add'
           drm_plane_helper_add(primary, &fsl_dcu_drm_plane_helper_funcs);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_modeset_helper_vtables.h:1359:24: note: Access to field =
'helper_private' results in a dereference of a null pointer (loaded from va=
riable 'plane')
           plane->helper_private =3D funcs;
           ~~~~~                 ^
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (3 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
>> drivers/gpu/drm/sun4i/sun4i_tcon.c:1426:2: warning: Value stored to 'id'=
 is never read [clang-analyzer-deadcode.DeadStores]
           id =3D sun4i_tcon_of_get_id_from_port(port);
           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/sun4i/sun4i_tcon.c:1426:2: note: Value stored to 'id' is=
 never read
           id =3D sun4i_tcon_of_get_id_from_port(port);
           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/media/dvb-core/dvb_frontend.c:355:23: warning: Value stored to '=
fe' during its initialization is never read [clang-analyzer-deadcode.DeadSt=
ores]
           struct dvb_frontend *fe =3D fepriv->dvbdev->priv;
                                ^~   ~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-core/dvb_frontend.c:355:23: note: Value stored to 'fe'=
 during its initialization is never read
           struct dvb_frontend *fe =3D fepriv->dvbdev->priv;
                                ^~   ~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-core/dvb_frontend.c:1582:3: warning: Value stored to '=
len' is never read [clang-analyzer-deadcode.DeadStores]
                   len =3D 1;
                   ^     ~
   drivers/media/dvb-core/dvb_frontend.c:1582:3: note: Value stored to 'len=
' is never read
                   len =3D 1;
                   ^     ~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/media/cec/core/cec-adap.c:420:3: warning: Use of memory after it=
 is freed [clang-analyzer-unix.Malloc]
                   cec_data_cancel(data, CEC_TX_STATUS_ABORTED);
                   ^
   drivers/media/cec/core/cec-adap.c:1664:6: note: Assuming field 'unregist=
ered' is false
           if (adap->devnode.unregistered)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/cec/core/cec-adap.c:1664:2: note: Taking false branch
           if (adap->devnode.unregistered)
           ^
   drivers/media/cec/core/cec-adap.c:1667:6: note: Assuming 'log_addrs' is =
null
           if (!log_addrs || log_addrs->num_log_addrs =3D=3D 0) {
               ^~~~~~~~~~
   drivers/media/cec/core/cec-adap.c:1667:17: note: Left side of '||' is tr=
ue
           if (!log_addrs || log_addrs->num_log_addrs =3D=3D 0) {
                          ^
   drivers/media/cec/core/cec-adap.c:1668:3: note: Calling 'cec_adap_unconf=
igure'
                   cec_adap_unconfigure(adap);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/cec/core/cec-adap.c:1326:6: note: Assuming field 'needs_hp=
d' is true
           if (!adap->needs_hpd ||
               ^~~~~~~~~~~~~~~~
   drivers/media/cec/core/cec-adap.c:1326:6: note: Left side of '||' is fal=
se
   drivers/media/cec/core/cec-adap.c:1327:6: note: Assuming field 'phys_add=
r' is not equal to CEC_PHYS_ADDR_INVALID
               adap->phys_addr !=3D CEC_PHYS_ADDR_INVALID)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/cec/core/cec-adap.c:1326:2: note: Taking true branch
           if (!adap->needs_hpd ||
           ^
   drivers/media/cec/core/cec-adap.c:1328:3: note: Assuming the condition i=
s false
                   WARN_ON(adap->ops->adap_log_addr(adap, CEC_LOG_ADDR_INVA=
LID));
                   ^
   include/asm-generic/bug.h:166:23: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                ^~~~~~~~~~~~
   drivers/media/cec/core/cec-adap.c:1332:2: note: Calling 'cec_flush'
           cec_flush(adap);
           ^~~~~~~~~~~~~~~
   drivers/media/cec/core/cec-adap.c:417:2: note: Loop condition is true.  =
Entering loop body
           while (!list_empty(&adap->transmit_queue)) {
           ^
   drivers/media/cec/core/cec-adap.c:418:10: note: Left side of '&&' is fal=
se
                   data =3D list_first_entry(&adap->transmit_queue,
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
   drivers/media/cec/core/cec-adap.c:418:10: note: Taking false branch
                   data =3D list_first_entry(&adap->transmit_queue,
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
--
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   security/keys/encrypted-keys/encrypted.c:357:2: note: Taking false branch
           if (derived_buf_len < HASH_SIZE)
           ^
   security/keys/encrypted-keys/encrypted.c:360:16: note: Calling 'kzalloc'
           derived_buf =3D kzalloc(derived_buf_len, GFP_KERNEL);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:721:9: note: Memory is allocated
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   security/keys/encrypted-keys/encrypted.c:360:16: note: Returned allocate=
d memory
           derived_buf =3D kzalloc(derived_buf_len, GFP_KERNEL);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   security/keys/encrypted-keys/encrypted.c:361:6: note: Assuming 'derived_=
buf' is non-null
           if (!derived_buf)
               ^~~~~~~~~~~~
   security/keys/encrypted-keys/encrypted.c:361:2: note: Taking false branch
           if (!derived_buf)
           ^
   security/keys/encrypted-keys/encrypted.c:364:6: note: 'key_type' is 1
           if (key_type)
               ^~~~~~~~
   security/keys/encrypted-keys/encrypted.c:364:2: note: Taking true branch
           if (key_type)
           ^
   security/keys/encrypted-keys/encrypted.c:374:2: note: Potential leak of =
memory pointed to by 'derived_buf'
           return ret;
           ^
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/soc/fsl/dpio/qbman-portal.c:657:3: warning: Value stored to 'p' =
is never read [clang-analyzer-deadcode.DeadStores]
                   p =3D s->addr_cena + QBMAN_CENA_SWP_EQCR_CI;
                   ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/soc/fsl/dpio/qbman-portal.c:657:3: note: Value stored to 'p' is =
never read
                   p =3D s->addr_cena + QBMAN_CENA_SWP_EQCR_CI;
                   ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/soc/fsl/dpio/qbman-portal.c:818:3: warning: Value stored to 'p' =
is never read [clang-analyzer-deadcode.DeadStores]
                   p =3D s->addr_cena + QBMAN_CENA_SWP_EQCR_CI;
                   ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/soc/fsl/dpio/qbman-portal.c:818:3: note: Value stored to 'p' is =
never read
                   p =3D s->addr_cena + QBMAN_CENA_SWP_EQCR_CI;
                   ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
>> drivers/i2c/busses/i2c-aspeed.c:253:2: warning: Value stored to 'command=
' is never read [clang-analyzer-deadcode.DeadStores]
           command =3D readl(bus->base + ASPEED_I2C_CMD_REG);
           ^
   drivers/i2c/busses/i2c-aspeed.c:253:2: note: Value stored to 'command' i=
s never read
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   drivers/nfc/fdp/fdp.c:163:17: warning: Value stored to 'dev' during its =
initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D &info->phy->i2c_dev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nfc/fdp/fdp.c:163:17: note: Value stored to 'dev' during its ini=
tialization is never read
           struct device *dev =3D &info->phy->i2c_dev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nfc/fdp/fdp.c:586:17: warning: Value stored to 'dev' during its =
initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D &info->phy->i2c_dev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nfc/fdp/fdp.c:586:17: note: Value stored to 'dev' during its ini=
tialization is never read
           struct device *dev =3D &info->phy->i2c_dev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nfc/fdp/fdp.c:599:17: warning: Value stored to 'dev' during its =
initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D &info->phy->i2c_dev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nfc/fdp/fdp.c:599:17: note: Value stored to 'dev' during its ini=
tialization is never read
           struct device *dev =3D &info->phy->i2c_dev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nfc/fdp/fdp.c:612:17: warning: Value stored to 'dev' during its =
initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D &info->phy->i2c_dev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nfc/fdp/fdp.c:612:17: note: Value stored to 'dev' during its ini=
tialization is never read
           struct device *dev =3D &info->phy->i2c_dev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/nfc/pn544/i2c.c:492:2: warning: Value stored to 'client' is neve=
r read [clang-analyzer-deadcode.DeadStores]
           client =3D phy->i2c_dev;
           ^        ~~~~~~~~~~~~
   drivers/nfc/pn544/i2c.c:492:2: note: Value stored to 'client' is never r=
ead
           client =3D phy->i2c_dev;
           ^        ~~~~~~~~~~~~
   drivers/nfc/pn544/i2c.c:531:2: warning: Call to function 'strcpy' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(phy->firmware_name, firmware_name);
           ^~~~~~
   drivers/nfc/pn544/i2c.c:531:2: note: Call to function 'strcpy' is insecu=
re as it does not provide bounding of the memory buffer. Replace unbounded =
copy functions with analogous functions that support length arguments such =
as 'strlcpy'. CWE-119
           strcpy(phy->firmware_name, firmware_name);
           ^~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/parport/parport_pc.c:2462:3: warning: Value stored to 'ppcontrol=
' is never read [clang-analyzer-deadcode.DeadStores]
                   ppcontrol =3D tmp2;
                   ^           ~~~~
   drivers/parport/parport_pc.c:2462:3: note: Value stored to 'ppcontrol' i=
s never read
                   ppcontrol =3D tmp2;
                   ^           ~~~~
   drivers/parport/parport_pc.c:3153:13: warning: Assigned value is garbage=
 or undefined [clang-analyzer-core.uninitialized.Assign]
                   irqval[i] =3D val;
                             ^
   drivers/parport/parport_pc.c:3268:6: note: Calling 'parse_parport_params'
           if (parse_parport_params())
               ^~~~~~~~~~~~~~~~~~~~~~
   drivers/parport/parport_pc.c:3143:2: note: 'val' declared without an ini=
tial value
           int val;
           ^~~~~~~
   drivers/parport/parport_pc.c:3146:6: note: Assuming 'init_mode' is null
           if (init_mode)
               ^~~~~~~~~
   drivers/parport/parport_pc.c:3146:2: note: Taking false branch
--
           ^
   drivers/char/ipmi/ipmb_dev_int.c:147:6: note: Calling 'copy_from_user'
           if (copy_from_user(&msg, buf, count))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:191:2: note: Taking true branch
           if (likely(check_copy_size(to, n, false)))
           ^
   include/linux/uaccess.h:192:7: note: Calling '_copy_from_user'
                   n =3D _copy_from_user(to, from, n);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:157:6: note: Left side of '&&' is true
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
               ^
   include/linux/uaccess.h:157:33: note: Assuming the condition is false
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
                                          ^
   include/linux/compiler.h:77:20: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:157:2: note: Taking false branch
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
           ^
   include/linux/uaccess.h:161:6: note: Assuming 'res' is 0, which particip=
ates in a condition later
           if (unlikely(res))
               ^
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   include/linux/uaccess.h:161:2: note: Taking false branch
           if (unlikely(res))
           ^
   include/linux/uaccess.h:163:2: note: Returning zero (loaded from 'res'),=
 which participates in a condition later
           return res;
           ^~~~~~~~~~
   include/linux/uaccess.h:192:7: note: Returning from '_copy_from_user'
                   n =3D _copy_from_user(to, from, n);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:193:2: note: Returning zero (loaded from 'n'), w=
hich participates in a condition later
           return n;
           ^~~~~~~~
   drivers/char/ipmi/ipmb_dev_int.c:147:6: note: Returning from 'copy_from_=
user'
           if (copy_from_user(&msg, buf, count))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/ipmi/ipmb_dev_int.c:147:2: note: Taking false branch
           if (copy_from_user(&msg, buf, count))
           ^
   drivers/char/ipmi/ipmb_dev_int.c:150:12: note: The right operand of '<' =
is a garbage value
           if (count < msg[0])
                     ^ ~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/i2c/busses/i2c-rk3x.c:897:2: warning: Value stored to 't_low_ns'=
 is never read [clang-analyzer-deadcode.DeadStores]
           t_low_ns =3D div_u64(((u64)calc.div_low + 1) * 8 * 1000000000, c=
lk_rate);
           ^          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   drivers/i2c/busses/i2c-rk3x.c:897:2: note: Value stored to 't_low_ns' is=
 never read
           t_low_ns =3D div_u64(((u64)calc.div_low + 1) * 8 * 1000000000, c=
lk_rate);
           ^          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   drivers/i2c/busses/i2c-rk3x.c:898:2: warning: Value stored to 't_high_ns=
' is never read [clang-analyzer-deadcode.DeadStores]
           t_high_ns =3D div_u64(((u64)calc.div_high + 1) * 8 * 1000000000,
           ^           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/i2c/busses/i2c-rk3x.c:898:2: note: Value stored to 't_high_ns' i=
s never read
           t_high_ns =3D div_u64(((u64)calc.div_high + 1) * 8 * 1000000000,
           ^           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
>> drivers/i2c/busses/i2c-rcar.c:412:17: warning: Value stored to 'dev' dur=
ing its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D rcar_i2c_priv_to_dev(priv);
                          ^~~
   drivers/i2c/busses/i2c-rcar.c:412:17: note: Value stored to 'dev' during=
 its initialization is never read
           struct device *dev =3D rcar_i2c_priv_to_dev(priv);
                          ^~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   drivers/phy/rockchip/phy-rockchip-inno-hdmi.c:624:16: warning: Value sto=
red to 'tmdsclock' during its initialization is never read [clang-analyzer-=
deadcode.DeadStores]
           unsigned long tmdsclock =3D inno_hdmi_phy_get_tmdsclk(inno, rate=
);
                         ^~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/phy/rockchip/phy-rockchip-inno-hdmi.c:624:16: note: Value stored=
 to 'tmdsclock' during its initialization is never read
           unsigned long tmdsclock =3D inno_hdmi_phy_get_tmdsclk(inno, rate=
);
                         ^~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/phy/rockchip/phy-rockchip-inno-hdmi.c:742:3: warning: Value stor=
ed to 'no_c' is never read [clang-analyzer-deadcode.DeadStores]
                   no_c =3D 1 << no_c;
                   ^      ~~~~~~~~~
   drivers/phy/rockchip/phy-rockchip-inno-hdmi.c:742:3: note: Value stored =
to 'no_c' is never read
                   no_c =3D 1 << no_c;
                   ^      ~~~~~~~~~
   drivers/phy/rockchip/phy-rockchip-inno-hdmi.c:778:16: warning: Value sto=
red to 'tmdsclock' during its initialization is never read [clang-analyzer-=
deadcode.DeadStores]
           unsigned long tmdsclock =3D inno_hdmi_phy_get_tmdsclk(inno, rate=
);
                         ^~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/phy/rockchip/phy-rockchip-inno-hdmi.c:778:16: note: Value stored=
 to 'tmdsclock' during its initialization is never read
           unsigned long tmdsclock =3D inno_hdmi_phy_get_tmdsclk(inno, rate=
);
                         ^~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   drivers/most/configfs.c:173:2: warning: Call to function 'strcpy' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(mdev_link->direction, page);
           ^~~~~~
   drivers/most/configfs.c:173:2: note: Call to function 'strcpy' is insecu=
re as it does not provide bounding of the memory buffer. Replace unbounded =
copy functions with analogous functions that support length arguments such =
as 'strlcpy'. CWE-119
           strcpy(mdev_link->direction, page);
--
           ^
   drivers/misc/fastrpc.c:410:25: note: Dereference of null pointer
                   ctx->olaps[i].start =3D ctx->args[i].ptr;
                                         ^~~~~~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c:74:17: warning: Value s=
tored to 'dev' during its initialization is never read [clang-analyzer-dead=
code.DeadStores]
           struct device *dev =3D ctx->dev;
                          ^~~   ~~~~~~~~
   drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c:74:17: note: Value stor=
ed to 'dev' during its initialization is never read
           struct device *dev =3D ctx->dev;
                          ^~~   ~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/nfc/st-nci/i2c.c:169:2: warning: Value stored to 'client' is nev=
er read [clang-analyzer-deadcode.DeadStores]
           client =3D phy->i2c_dev;
           ^        ~~~~~~~~~~~~
   drivers/nfc/st-nci/i2c.c:169:2: note: Value stored to 'client' is never =
read
           client =3D phy->i2c_dev;
           ^        ~~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/nfc/nxp-nci/firmware.c:214:2: warning: Call to function 'strcpy'=
 is insecure as it does not provide bounding of the memory buffer. Replace =
unbounded copy functions with analogous functions that support length argum=
ents such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(fw_info->name, firmware_name);
           ^~~~~~
   drivers/nfc/nxp-nci/firmware.c:214:2: note: Call to function 'strcpy' is=
 insecure as it does not provide bounding of the memory buffer. Replace unb=
ounded copy functions with analogous functions that support length argument=
s such as 'strlcpy'. CWE-119
           strcpy(fw_info->name, firmware_name);
           ^~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
>> fs/overlayfs/inode.c:452:16: warning: Value stored to 'realinode' during=
 its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct inode *realinode =3D ovl_inode_real(inode);
                         ^~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~
   fs/overlayfs/inode.c:452:16: note: Value stored to 'realinode' during it=
s initialization is never read
           struct inode *realinode =3D ovl_inode_real(inode);
                         ^~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~
   include/linux/dcache.h:526:9: warning: Access to field 'd_inode' results=
 in a dereference of a null pointer (loaded from variable 'dentry') [clang-=
analyzer-core.NullDereference]
           return dentry->d_inode;
                  ^
   fs/overlayfs/inode.c:1099:28: note: Assuming 'upperdentry' is null
           struct inode *realinode =3D upperdentry ? d_inode(upperdentry) :=
 NULL;
                                     ^~~~~~~~~~~
   fs/overlayfs/inode.c:1099:28: note: '?' condition is false
   fs/overlayfs/inode.c:1101:31: note: Assuming 'lowerpath' is null
           struct dentry *lowerdentry =3D lowerpath ? lowerpath->dentry : N=
ULL;
                                        ^~~~~~~~~
   fs/overlayfs/inode.c:1101:31: note: '?' condition is false
   fs/overlayfs/inode.c:1101:2: note: 'lowerdentry' initialized to a null p=
ointer value
           struct dentry *lowerdentry =3D lowerpath ? lowerpath->dentry : N=
ULL;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/overlayfs/inode.c:1104:13: note: 'bylower' is false
           int fsid =3D bylower ? lowerpath->layer->fsid : 0;
                      ^~~~~~~
   fs/overlayfs/inode.c:1104:13: note: '?' condition is false
   fs/overlayfs/inode.c:1107:12: note: Assuming field 'newinode' is null
           int err =3D oip->newinode ? -EEXIST : -ENOMEM;
                     ^~~~~~~~~~~~~
   fs/overlayfs/inode.c:1107:12: note: '?' condition is false
   fs/overlayfs/inode.c:1109:7: note: 'realinode' is null
           if (!realinode)
                ^~~~~~~~~
   fs/overlayfs/inode.c:1109:2: note: Taking true branch
           if (!realinode)
           ^
   fs/overlayfs/inode.c:1110:23: note: Passing null pointer value via 1st p=
arameter 'dentry'
                   realinode =3D d_inode(lowerdentry);
                                       ^~~~~~~~~~~
   fs/overlayfs/inode.c:1110:15: note: Calling 'd_inode'
                   realinode =3D d_inode(lowerdentry);
                               ^~~~~~~~~~~~~~~~~~~~
   include/linux/dcache.h:526:9: note: Access to field 'd_inode' results in=
 a dereference of a null pointer (loaded from variable 'dentry')
           return dentry->d_inode;
                  ^~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/media/dvb-frontends/nxt6000.c:420:2: warning: Value stored to 'v=
al' is never read [clang-analyzer-deadcode.DeadStores]
           val =3D nxt6000_readreg(state, RF_AGC_STATUS);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/nxt6000.c:420:2: note: Value stored to 'val'=
 is never read
           val =3D nxt6000_readreg(state, RF_AGC_STATUS);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (3 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   lib/bch.c:1123:27: warning: The result of the left shift is undefined be=
cause the right operand is negative [clang-analyzer-core.UndefinedBinaryOpe=
ratorResult]
           const unsigned int k =3D 1 << deg(poly);
                                    ^  ~~~~~~~~~
   lib/bch.c:1123:30: note: Calling 'deg'
           const unsigned int k =3D 1 << deg(poly);
                                       ^~~~~~~~~
   lib/bch.c:345:2: note: Returning the value -1
           return fls(poly)-1;
           ^~~~~~~~~~~~~~~~~~
   lib/bch.c:1123:30: note: Returning from 'deg'
           const unsigned int k =3D 1 << deg(poly);
                                       ^~~~~~~~~
   lib/bch.c:1123:27: note: The result of the left shift is undefined becau=
se the right operand is negative
           const unsigned int k =3D 1 << deg(poly);
                                    ^  ~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
--
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
   drivers/hwmon/lm75.h:27:14: note: '__UNIQUE_ID___x172' is < '__UNIQUE_ID=
___y173'
           int ntemp =3D clamp_val(temp, LM75_TEMP_MIN, LM75_TEMP_MAX);
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
   drivers/hwmon/lm75.h:27:14: note: '?' condition is true
           int ntemp =3D clamp_val(temp, LM75_TEMP_MIN, LM75_TEMP_MAX);
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
                   ^
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^
   drivers/hwmon/lm75.h:29:12: note: 'ntemp' is < 0
           ntemp +=3D (ntemp < 0 ? -250 : 250);
                     ^~~~~
   drivers/hwmon/lm75.h:29:12: note: '?' condition is true
   drivers/hwmon/lm75.h:30:29: note: The result of the left shift is undefi=
ned because the left operand is negative
           return (u16)((ntemp / 500) << 7);
                        ~~~~~~~~~~~~~ ^
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
>> drivers/cpufreq/armada-37xx-cpufreq.c:158:3: warning: Value stored to 'v=
al' is never read [clang-analyzer-deadcode.DeadStores]
                   val =3D ARMADA_37XX_NB_CLK_SEL_TBG << ARMADA_37XX_NB_CLK=
_SEL_OFF;
                   ^
   drivers/cpufreq/armada-37xx-cpufreq.c:158:3: note: Value stored to 'val'=
 is never read
>> drivers/cpufreq/armada-37xx-cpufreq.c:159:3: warning: Value stored to 'm=
ask' is never read [clang-analyzer-deadcode.DeadStores]
                   mask =3D (ARMADA_37XX_NB_CLK_SEL_MASK
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/cpufreq/armada-37xx-cpufreq.c:159:3: note: Value stored to 'mask=
' is never read
                   mask =3D (ARMADA_37XX_NB_CLK_SEL_MASK
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   drivers/gpu/drm/tegra/dc.c:1861:2: warning: Value stored to 'old_dc_stat=
e' is never read [clang-analyzer-deadcode.DeadStores]
           old_dc_state =3D to_const_dc_state(old_crtc_state);
           ^              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/tegra/dc.c:1861:2: note: Value stored to 'old_dc_state' =
is never read
           old_dc_state =3D to_const_dc_state(old_crtc_state);
           ^              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/tegra/dc.c:1862:2: warning: Value stored to 'new_dc_stat=
e' is never read [clang-analyzer-deadcode.DeadStores]
           new_dc_state =3D to_const_dc_state(crtc->state);
           ^              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/tegra/dc.c:1862:2: note: Value stored to 'new_dc_state' =
is never read
           new_dc_state =3D to_const_dc_state(crtc->state);
           ^              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/tegra/dc.c:2150:2: warning: Value stored to 'value' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           value =3D tegra_dc_readl(dc, DC_CMD_STATE_CONTROL);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/tegra/dc.c:2150:2: note: Value stored to 'value' is neve=
r read
           value =3D tegra_dc_readl(dc, DC_CMD_STATE_CONTROL);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/tegra/dc.c:2154:2: warning: Value stored to 'value' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           value =3D tegra_dc_readl(dc, DC_CMD_STATE_CONTROL);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/tegra/dc.c:2154:2: note: Value stored to 'value' is neve=
r read
           value =3D tegra_dc_readl(dc, DC_CMD_STATE_CONTROL);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/tegra/dc.c:2243:2: warning: Value stored to 'old_state' =
is never read [clang-analyzer-deadcode.DeadStores]
           old_state =3D drm_atomic_get_old_crtc_state(state, crtc);
           ^           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/tegra/dc.c:2243:2: note: Value stored to 'old_state' is =
never read
           old_state =3D drm_atomic_get_old_crtc_state(state, crtc);
           ^           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 6 warnings (3 in non-user code, 3 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   drivers/gpu/drm/tegra/hda.c:53:3: warning: Value stored to 'bits' is nev=
er read [clang-analyzer-deadcode.DeadStores]
                   bits =3D (format & AC_FMT_BITS_MASK) >> AC_FMT_BITS_SHIF=
T;
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/tegra/hda.c:53:3: note: Value stored to 'bits' is never =
read
                   bits =3D (format & AC_FMT_BITS_MASK) >> AC_FMT_BITS_SHIF=
T;
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/leds/leds-pca955x.c:594:9: warning: Access to field 'name' resul=
ts in a dereference of a null pointer [clang-analyzer-core.NullDereference]
                                   if (to_of_node(init_data.fwnode)->name[0=
] =3D=3D
                                       ^
   include/linux/of.h:161:2: note: expanded from macro 'to_of_node'
           ({                                                              \
           ^
   drivers/leds/leds-pca955x.c:499:6: note: Assuming 'md' is non-null
           if (md) {
               ^~
   drivers/leds/leds-pca955x.c:499:2: note: Taking true branch
           if (md) {
           ^
   drivers/leds/leds-pca955x.c:516:6: note: Assuming 'pdata' is non-null
           if (!pdata) {
               ^~~~~~
   drivers/leds/leds-pca955x.c:516:2: note: Taking false branch
--
           ^          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/habanalabs/gaudi/gaudi.c:3738:28: warning: Although the val=
ue stored to 'qman_offset' is used in the enclosing expression, the value i=
s never actually read from 'qman_offset' [clang-analyzer-deadcode.DeadStore=
s]
           for (i =3D GAUDI_PCI_DMA_1, qman_offset =3D 0 ; i < GAUDI_HBM_DM=
A_1 ; i++) {
                                     ^             ~
   drivers/misc/habanalabs/gaudi/gaudi.c:3738:28: note: Although the value =
stored to 'qman_offset' is used in the enclosing expression, the value is n=
ever actually read from 'qman_offset'
           for (i =3D GAUDI_PCI_DMA_1, qman_offset =3D 0 ; i < GAUDI_HBM_DM=
A_1 ; i++) {
                                     ^             ~
   drivers/misc/habanalabs/gaudi/gaudi.c:5248:6: warning: Value stored to '=
dst_addr' during its initialization is never read [clang-analyzer-deadcode.=
DeadStores]
           u64 dst_addr =3D (le64_to_cpu(user_dma_pkt->dst_addr) &
               ^~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/habanalabs/gaudi/gaudi.c:5248:6: note: Value stored to 'dst=
_addr' during its initialization is never read
           u64 dst_addr =3D (le64_to_cpu(user_dma_pkt->dst_addr) &
               ^~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/misc/habanalabs/gaudi/gaudi_coresight.c:770:31: warning: Value s=
tored to 'input' during its initialization is never read [clang-analyzer-de=
adcode.DeadStores]
           struct hl_debug_params_spmu *input =3D params->input;
                                        ^~~~~   ~~~~~~~~~~~~~
   drivers/misc/habanalabs/gaudi/gaudi_coresight.c:770:31: note: Value stor=
ed to 'input' during its initialization is never read
           struct hl_debug_params_spmu *input =3D params->input;
                                        ^~~~~   ~~~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (3 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/gpu/drm/tiny/simpledrm.c:719:21: warning: Value stored to 'dev' =
during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct drm_device *dev =3D &sdev->dev;
                              ^~~   ~~~~~~~~~~
   drivers/gpu/drm/tiny/simpledrm.c:719:21: note: Value stored to 'dev' dur=
ing its initialization is never read
           struct drm_device *dev =3D &sdev->dev;
                              ^~~   ~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
>> drivers/gpu/drm/xlnx/zynqmp_dp.c:994:11: warning: Array access (from var=
iable 'buf') results in a null pointer dereference [clang-analyzer-core.Nul=
lDereference]
                           buf[i] =3D zynqmp_dp_read(dp, ZYNQMP_DP_AUX_REPL=
Y_DATA);
                                  ^
   drivers/gpu/drm/xlnx/zynqmp_dp.c:1003:25: note: Left side of '&&' is fal=
se
           struct zynqmp_dp *dp =3D container_of(aux, struct zynqmp_dp, aux=
);
                                  ^
   include/linux/kernel.h:495:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/gpu/drm/xlnx/zynqmp_dp.c:1003:25: note: Taking false branch
           struct zynqmp_dp *dp =3D container_of(aux, struct zynqmp_dp, aux=
);
                                  ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:302:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/gpu/drm/xlnx/zynqmp_dp.c:1003:25: note: Loop condition is false.=
  Exiting loop
           struct zynqmp_dp *dp =3D container_of(aux, struct zynqmp_dp, aux=
);
                                  ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:300:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/gpu/drm/xlnx/zynqmp_dp.c:1009:9: note: Assuming 'iter' is 0
           iter =3D iter ? iter : 1;
                  ^~~~
   drivers/gpu/drm/xlnx/zynqmp_dp.c:1009:9: note: '?' condition is false
   drivers/gpu/drm/xlnx/zynqmp_dp.c:1011:2: note: Loop condition is true.  =
Entering loop body
           for (i =3D 0; i < iter; i++) {
           ^
   drivers/gpu/drm/xlnx/zynqmp_dp.c:1013:13: note: Passing value via 4th pa=
rameter 'buf'
                                                  msg->buffer, msg->size,
                                                  ^~~~~~~~~~~
   drivers/gpu/drm/xlnx/zynqmp_dp.c:1012:9: note: Calling 'zynqmp_dp_aux_cm=
d_submit'
                   ret =3D zynqmp_dp_aux_cmd_submit(dp, msg->request, msg->=
address,
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   drivers/gpu/drm/xlnx/zynqmp_dp.c:949:18: note: Assuming the condition is=
 true
           bool is_read =3D (cmd & AUX_READ_BIT) ? true : false;
                           ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/xlnx/zynqmp_dp.c:949:17: note: '?' condition is true
           bool is_read =3D (cmd & AUX_READ_BIT) ? true : false;
                          ^
   drivers/gpu/drm/xlnx/zynqmp_dp.c:953:6: note: Assuming the condition is =
false
           if (reg & ZYNQMP_DP_INTERRUPT_SIGNAL_STATE_REQUEST)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/xlnx/zynqmp_dp.c:953:2: note: Taking false branch
           if (reg & ZYNQMP_DP_INTERRUPT_SIGNAL_STATE_REQUEST)
           ^
   drivers/gpu/drm/xlnx/zynqmp_dp.c:957:7: note: 'is_read' is true
           if (!is_read)
                ^~~~~~~
   drivers/gpu/drm/xlnx/zynqmp_dp.c:957:2: note: Taking false branch
           if (!is_read)
           ^
   drivers/gpu/drm/xlnx/zynqmp_dp.c:963:6: note: Assuming 'buf' is null
           if (!buf || !bytes)
               ^~~~
   drivers/gpu/drm/xlnx/zynqmp_dp.c:963:11: note: Left side of '||' is true
           if (!buf || !bytes)
                    ^
   drivers/gpu/drm/xlnx/zynqmp_dp.c:970:2: note: Loop condition is true.  E=
ntering loop body
           for (i =3D 0; ; i++) {
           ^
   drivers/gpu/drm/xlnx/zynqmp_dp.c:972:7: note: Assuming the condition is =
true
                   if (reg & ZYNQMP_DP_INTERRUPT_SIGNAL_STATE_REPLY)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/xlnx/zynqmp_dp.c:972:3: note: Taking true branch
                   if (reg & ZYNQMP_DP_INTERRUPT_SIGNAL_STATE_REPLY)
                   ^
   drivers/gpu/drm/xlnx/zynqmp_dp.c:973:4: note:  Execution continues on li=
ne 982
                           break;
                           ^
   drivers/gpu/drm/xlnx/zynqmp_dp.c:983:6: note: 'reply' is non-null
           if (reply)
               ^~~~~
   drivers/gpu/drm/xlnx/zynqmp_dp.c:983:2: note: Taking true branch
           if (reply)
           ^
   drivers/gpu/drm/xlnx/zynqmp_dp.c:986:6: note: 'is_read' is true
--
           ^
   drivers/iio/adc/meson_saradc.c:1239:2: note: Taking false branch
           if (IS_ERR(priv->core_clk)) {
           ^
   drivers/iio/adc/meson_saradc.c:1245:2: note: Taking false branch
           if (IS_ERR(priv->adc_clk)) {
           ^
   drivers/iio/adc/meson_saradc.c:1255:2: note: Taking false branch
           if (IS_ERR(priv->adc_sel_clk)) {
           ^
   drivers/iio/adc/meson_saradc.c:1265:6: note: Assuming field 'adc_clk' is=
 null
           if (!priv->adc_clk) {
               ^~~~~~~~~~~~~~
   drivers/iio/adc/meson_saradc.c:1265:2: note: Taking true branch
           if (!priv->adc_clk) {
           ^
   drivers/iio/adc/meson_saradc.c:1267:7: note: 'ret' is 0
                   if (ret)
                       ^~~
   drivers/iio/adc/meson_saradc.c:1267:3: note: Taking false branch
                   if (ret)
                   ^
   drivers/iio/adc/meson_saradc.c:1272:2: note: Taking false branch
           if (IS_ERR(priv->vref)) {
           ^
   drivers/iio/adc/meson_saradc.c:1279:6: note: Assuming field 'temperature=
_trimming_bits' is not equal to 0
           if (priv->param->temperature_trimming_bits) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/meson_saradc.c:1279:2: note: Taking true branch
           if (priv->param->temperature_trimming_bits) {
           ^
   drivers/iio/adc/meson_saradc.c:1281:7: note: 'ret' is 0
                   if (ret)
                       ^~~
   drivers/iio/adc/meson_saradc.c:1281:3: note: Taking false branch
                   if (ret)
                   ^
   drivers/iio/adc/meson_saradc.c:1285:6: note: Assuming field 'temperature=
_sensor_calibrated' is true
           if (priv->temperature_sensor_calibrated) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/meson_saradc.c:1285:2: note: Taking true branch
           if (priv->temperature_sensor_calibrated) {
           ^
   drivers/iio/adc/meson_saradc.c:1296:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   drivers/iio/adc/meson_saradc.c:1296:2: note: Taking false branch
           if (ret)
           ^
   drivers/iio/adc/meson_saradc.c:1300:6: note: 'ret' is 0
           if (ret)
               ^~~
   drivers/iio/adc/meson_saradc.c:1300:2: note: Taking false branch
           if (ret)
           ^
   drivers/iio/adc/meson_saradc.c:1303:8: note: Calling 'meson_sar_adc_cali=
b'
           ret =3D meson_sar_adc_calib(indio_dev);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/meson_saradc.c:1027:31: note: 'value0' declared without =
an initial value
           int ret, nominal0, nominal1, value0, value1;
                                        ^~~~~~
   drivers/iio/adc/meson_saradc.c:1035:8: note: Calling 'meson_sar_adc_get_=
sample'
           ret =3D meson_sar_adc_get_sample(indio_dev,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/meson_saradc.c:555:6: note: Assuming field 'type' is not=
 equal to IIO_TEMP
           if (chan->type =3D=3D IIO_TEMP && !priv->temperature_sensor_cali=
brated)
               ^~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/meson_saradc.c:555:29: note: Left side of '&&' is false
           if (chan->type =3D=3D IIO_TEMP && !priv->temperature_sensor_cali=
brated)
                                      ^
   drivers/iio/adc/meson_saradc.c:559:6: note: Assuming 'ret' is not equal =
to 0
           if (ret)
               ^~~
   drivers/iio/adc/meson_saradc.c:559:2: note: Taking true branch
           if (ret)
           ^
   drivers/iio/adc/meson_saradc.c:560:3: note: Returning without writing to=
 '*val'
                   return ret;
                   ^
   drivers/iio/adc/meson_saradc.c:1035:8: note: Returning from 'meson_sar_a=
dc_get_sample'
           ret =3D meson_sar_adc_get_sample(indio_dev,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/meson_saradc.c:1038:6: note: Assuming 'ret' is >=3D 0
           if (ret < 0)
               ^~~~~~~
   drivers/iio/adc/meson_saradc.c:1038:2: note: Taking false branch
           if (ret < 0)
           ^
   drivers/iio/adc/meson_saradc.c:1046:6: note: Assuming 'ret' is >=3D 0
           if (ret < 0)
               ^~~~~~~
   drivers/iio/adc/meson_saradc.c:1046:2: note: Taking false branch
           if (ret < 0)
           ^
   drivers/iio/adc/meson_saradc.c:1049:13: note: The right operand of '<=3D=
' is a garbage value
           if (value1 <=3D value0) {
                      ^  ~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
>> drivers/gpu/drm/tegra/hub.c:243:17: warning: Value stored to 'dev' durin=
g its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D dc->dev;
                          ^~~   ~~~~~~~
   drivers/gpu/drm/tegra/hub.c:243:17: note: Value stored to 'dev' during i=
ts initialization is never read
           struct device *dev =3D dc->dev;
                          ^~~   ~~~~~~~
   drivers/gpu/drm/tegra/hub.c:381:2: warning: Value stored to 'value' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           value =3D tegra_plane_readl(plane, DC_WIN_CORE_IHUB_WGRP_FETCH_M=
ETER);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/gpu/drm/tegra/hub.c:381:2: note: Value stored to 'value' is neve=
r read
           value =3D tegra_plane_readl(plane, DC_WIN_CORE_IHUB_WGRP_FETCH_M=
ETER);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/gpu/drm/tegra/hub.c:395:2: warning: Value stored to 'value' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           value =3D tegra_plane_readl(plane, DC_WIN_CORE_PRECOMP_WGRP_PIPE=
_METER);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   drivers/gpu/drm/tegra/hub.c:395:2: note: Value stored to 'value' is neve=
r read
           value =3D tegra_plane_readl(plane, DC_WIN_CORE_PRECOMP_WGRP_PIPE=
_METER);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   drivers/gpu/drm/tegra/hub.c:400:2: warning: Value stored to 'value' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           value =3D tegra_plane_readl(plane, DC_WIN_CORE_IHUB_WGRP_POOL_CO=
NFIG);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/gpu/drm/tegra/hub.c:400:2: note: Value stored to 'value' is neve=
r read
           value =3D tegra_plane_readl(plane, DC_WIN_CORE_IHUB_WGRP_POOL_CO=
NFIG);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/gpu/drm/tegra/hub.c:588:3: warning: Value stored to 'value' is n=
ever read [clang-analyzer-deadcode.DeadStores]
                   value =3D HORIZONTAL_TAPS_5 | VERTICAL_TAPS_5;
                   ^
   drivers/gpu/drm/tegra/hub.c:588:3: note: Value stored to 'value' is neve=
r read
   drivers/gpu/drm/tegra/hub.c:593:4: warning: Value stored to 'value' is n=
ever read [clang-analyzer-deadcode.DeadStores]
                           value =3D HORIZONTAL_TAPS_2 | VERTICAL_TAPS_2;
                           ^
   drivers/gpu/drm/tegra/hub.c:593:4: note: Value stored to 'value' is neve=
r read
   drivers/gpu/drm/tegra/hub.c:891:2: warning: Value stored to 'value' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           value =3D tegra_dc_readl(dc, DC_DISP_IHUB_COMMON_DISPLAY_FETCH_M=
ETER);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/gpu/drm/tegra/hub.c:891:2: note: Value stored to 'value' is neve=
r read
           value =3D tegra_dc_readl(dc, DC_DISP_IHUB_COMMON_DISPLAY_FETCH_M=
ETER);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/crypto/atmel-tdes.c:683:17: warning: Value stored to 'dev' durin=
g its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D ctx->dd->dev;
                          ^~~   ~~~~~~~~~~~~
   drivers/crypto/atmel-tdes.c:683:17: note: Value stored to 'dev' during i=
ts initialization is never read
           struct device *dev =3D ctx->dd->dev;
                          ^~~   ~~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   drivers/crypto/ccree/cc_driver.c:105:17: warning: Value stored to 'dev' =
during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D drvdata_to_dev(drvdata);
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/ccree/cc_driver.c:105:17: note: Value stored to 'dev' dur=
ing its initialization is never read
           struct device *dev =3D drvdata_to_dev(drvdata);
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/ccree/cc_driver.c:231:3: warning: Value stored to 'axi_er=
r' is never read [clang-analyzer-deadcode.DeadStores]
                   axi_err =3D cc_ioread(drvdata, CC_REG(AXIM_MON_ERR));
                   ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/ccree/cc_driver.c:231:3: note: Value stored to 'axi_err' =
is never read
                   axi_err =3D cc_ioread(drvdata, CC_REG(AXIM_MON_ERR));
                   ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/ccree/cc_driver.c:275:17: warning: Value stored to 'dev' =
during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D drvdata_to_dev(drvdata);
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/ccree/cc_driver.c:275:17: note: Value stored to 'dev' dur=
ing its initialization is never read
           struct device *dev =3D drvdata_to_dev(drvdata);
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 10 warnings (5 in non-user code, 5 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/i2c/busses/i2c-davinci.c:258:36: warning: Value stored to 'pdata=
' during its initialization is never read [clang-analyzer-deadcode.DeadStor=
es]
           struct davinci_i2c_platform_data *pdata =3D dev->pdata;
                                             ^~~~~   ~~~~~~~~~~
   drivers/i2c/busses/i2c-davinci.c:258:36: note: Value stored to 'pdata' d=
uring its initialization is never read
           struct davinci_i2c_platform_data *pdata =3D dev->pdata;
                                             ^~~~~   ~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
--
                                   dev_err(bus->dev,
                                   ^
   include/linux/dev_printk.h:144:2: note: expanded from macro 'dev_err'
           dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##_=
_VA_ARGS__)
           ^
   include/linux/dev_printk.h:109:3: note: expanded from macro 'dev_printk_=
index_wrap'
                   dev_printk_index_emit(level, fmt);                      \
                   ^
   include/linux/dev_printk.h:105:2: note: expanded from macro 'dev_printk_=
index_emit'
           printk_index_subsys_emit("%s %s: ", level, fmt)
           ^
   include/linux/printk.h:413:2: note: expanded from macro 'printk_index_su=
bsys_emit'
           __printk_index_emit(fmt, level, subsys_fmt_prefix)
           ^
   include/linux/printk.h:369:2: note: expanded from macro '__printk_index_=
emit'
           do {                                                            \
           ^
   drivers/soundwire/stream.c:820:5: note: Control jumps to line 847
                                   goto error;
                                   ^
   drivers/soundwire/stream.c:847:2: note: Left side of '&&' is false
           list_for_each_entry(m_rt, &stream->master_list, stream_node) {
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
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
   drivers/soundwire/stream.c:847:2: note: Taking false branch
           list_for_each_entry(m_rt, &stream->master_list, stream_node) {
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:302:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/soundwire/stream.c:847:2: note: Loop condition is false.  Exitin=
g loop
           list_for_each_entry(m_rt, &stream->master_list, stream_node) {
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:300:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/soundwire/stream.c:847:2: note: Loop condition is true.  Enterin=
g loop body
           list_for_each_entry(m_rt, &stream->master_list, stream_node) {
           ^
   include/linux/list.h:628:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   drivers/soundwire/stream.c:849:22: note: Field 'msg' is non-null
                   if (bus->defer_msg.msg) {
                                      ^
   drivers/soundwire/stream.c:849:3: note: Taking true branch
                   if (bus->defer_msg.msg) {
                   ^
   drivers/soundwire/stream.c:850:10: note: Use of memory after it is freed
                           kfree(bus->defer_msg.msg->buf);
                                 ^~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
>> drivers/crypto/mxs-dcp.c:302:22: warning: Value stored to 'src' during i=
ts initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct scatterlist *src =3D req->src;
                               ^~~   ~~~~~~~~
   drivers/crypto/mxs-dcp.c:302:22: note: Value stored to 'src' during its =
initialization is never read
           struct scatterlist *src =3D req->src;
                               ^~~   ~~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   drivers/crypto/s5p-sss.c:1313:22: warning: Value stored to 'dd' during i=
ts initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct s5p_aes_dev *dd =3D ctx->dd;
                               ^~   ~~~~~~~
   drivers/crypto/s5p-sss.c:1313:22: note: Value stored to 'dd' during its =
initialization is never read
           struct s5p_aes_dev *dd =3D ctx->dd;
                               ^~   ~~~~~~~
   drivers/crypto/s5p-sss.c:1339:10: warning: Use of memory after it is fre=
ed [clang-analyzer-unix.Malloc]
           ctx->sg =3D NULL;
                   ^
   drivers/crypto/s5p-sss.c:1642:9: note: '?' condition is false
           return s5p_hash_init(req) ?: s5p_hash_finup(req);
                  ^
   drivers/crypto/s5p-sss.c:1642:31: note: Calling 's5p_hash_finup'
           return s5p_hash_init(req) ?: s5p_hash_finup(req);
                                        ^~~~~~~~~~~~~~~~~~~
   drivers/crypto/s5p-sss.c:1576:9: note: Calling 's5p_hash_update'
           err1 =3D s5p_hash_update(req);
                  ^~~~~~~~~~~~~~~~~~~~
   drivers/crypto/s5p-sss.c:1509:6: note: Assuming field 'nbytes' is not eq=
ual to 0
           if (!req->nbytes)
               ^~~~~~~~~~~~
   drivers/crypto/s5p-sss.c:1509:2: note: Taking false branch
           if (!req->nbytes)
           ^
   drivers/crypto/s5p-sss.c:1512:6: note: Assuming the condition is false
           if (ctx->bufcnt + req->nbytes <=3D BUFLEN) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/s5p-sss.c:1512:2: note: Taking false branch
           if (ctx->bufcnt + req->nbytes <=3D BUFLEN) {
           ^
   drivers/crypto/s5p-sss.c:1519:9: note: Calling 's5p_hash_enqueue'
           return s5p_hash_enqueue(req, true); /* HASH_OP_UPDATE */
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/s5p-sss.c:1493:9: note: Calling 's5p_hash_handle_queue'
           return s5p_hash_handle_queue(tctx->dd, req);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/s5p-sss.c:1380:2: note: Loop condition is false.  Exiting=
 loop
           spin_lock_irqsave(&dd->hash_lock, flags);
           ^
   include/linux/spinlock.h:393:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:254:2: note: expanded from macro 'raw_spin_lock=
_irqsave'
           do {                                            \
           ^
   drivers/crypto/s5p-sss.c:1380:2: note: Loop condition is false.  Exiting=
 loop
           spin_lock_irqsave(&dd->hash_lock, flags);
           ^
   include/linux/spinlock.h:391:43: note: expanded from macro 'spin_lock_ir=
qsave'
   #define spin_lock_irqsave(lock, flags)                          \
                                                                   ^
   drivers/crypto/s5p-sss.c:1381:6: note: 'req' is non-null
           if (req)
               ^~~
   drivers/crypto/s5p-sss.c:1381:2: note: Taking true branch
           if (req)
           ^
   drivers/crypto/s5p-sss.c:1384:6: note: Assuming the condition is false
           if (test_bit(HASH_FLAGS_BUSY, &dd->hash_flags)) {
               ^
   include/asm-generic/bitops/non-atomic.h:120:18: note: expanded from macr=
o 'test_bit'
   #define test_bit arch_test_bit
                    ^
   drivers/crypto/s5p-sss.c:1384:2: note: Taking false branch
           if (test_bit(HASH_FLAGS_BUSY, &dd->hash_flags)) {
           ^
   drivers/crypto/s5p-sss.c:1391:6: note: Assuming 'async_req' is non-null
           if (async_req)
               ^~~~~~~~~
   drivers/crypto/s5p-sss.c:1391:2: note: Taking true branch
           if (async_req)
           ^
   drivers/crypto/s5p-sss.c:1392:3: note: '?' condition is true
                   set_bit(HASH_FLAGS_BUSY, &dd->hash_flags);
                   ^
   arch/arm/include/asm/bitops.h:189:25: note: expanded from macro 'set_bit'
   #define set_bit(nr,p)                   ATOMIC_BITOP(set_bit,nr,p)
                                           ^
   arch/arm/include/asm/bitops.h:181:3: note: expanded from macro 'ATOMIC_B=
ITOP'
           (__builtin_constant_p(nr) ? ____atomic_##name(nr, p) : _##name(n=
r,p))
            ^
   drivers/crypto/s5p-sss.c:1396:7: note: 'async_req' is non-null
           if (!async_req)
                ^~~~~~~~~
   drivers/crypto/s5p-sss.c:1396:2: note: Taking false branch
           if (!async_req)
           ^
   drivers/crypto/s5p-sss.c:1399:6: note: Assuming 'backlog' is null
           if (backlog)
               ^~~~~~~
   drivers/crypto/s5p-sss.c:1399:2: note: Taking false branch
           if (backlog)
--
   include/linux/spinlock.h:393:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:254:2: note: expanded from macro 'raw_spin_lock=
_irqsave'
           do {                                            \
           ^
   net/mac80211/tx.c:4656:2: note: Loop condition is false.  Exiting loop
           spin_lock_irqsave(&local->queue_stop_reason_lock, flags);
           ^
   include/linux/spinlock.h:391:43: note: expanded from macro 'spin_lock_ir=
qsave'
   #define spin_lock_irqsave(lock, flags)                          \
                                                                   ^
   net/mac80211/tx.c:4657:14: note: Assuming 'i' is < field 'queues'
           for (i =3D 0; i < local->hw.queues; i++) {
                       ^~~~~~~~~~~~~~~~~~~~
   net/mac80211/tx.c:4657:2: note: Loop condition is true.  Entering loop b=
ody
           for (i =3D 0; i < local->hw.queues; i++) {
           ^
   net/mac80211/tx.c:4662:7: note: Assuming the condition is true
                   if (local->queue_stop_reasons[i] ||
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/tx.c:4662:36: note: Left side of '||' is true
                   if (local->queue_stop_reasons[i] ||
                                                    ^
   net/mac80211/tx.c:4664:4: note:  Execution continues on line 4657
                           continue;
                           ^
   net/mac80211/tx.c:4657:14: note: Assuming 'i' is < field 'queues'
           for (i =3D 0; i < local->hw.queues; i++) {
                       ^~~~~~~~~~~~~~~~~~~~
   net/mac80211/tx.c:4657:2: note: Loop condition is true.  Entering loop b=
ody
           for (i =3D 0; i < local->hw.queues; i++) {
           ^
   net/mac80211/tx.c:4662:7: note: Assuming the condition is true
                   if (local->queue_stop_reasons[i] ||
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/tx.c:4662:36: note: Left side of '||' is true
                   if (local->queue_stop_reasons[i] ||
                                                    ^
   net/mac80211/tx.c:4664:4: note:  Execution continues on line 4657
                           continue;
                           ^
   net/mac80211/tx.c:4657:14: note: Assuming 'i' is < field 'queues'
           for (i =3D 0; i < local->hw.queues; i++) {
                       ^~~~~~~~~~~~~~~~~~~~
   net/mac80211/tx.c:4657:2: note: Loop condition is true.  Entering loop b=
ody
           for (i =3D 0; i < local->hw.queues; i++) {
           ^
   net/mac80211/tx.c:4662:7: note: Assuming the condition is false
                   if (local->queue_stop_reasons[i] ||
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/tx.c:4662:7: note: Left side of '||' is false
   net/mac80211/tx.c:4663:7: note: Assuming the condition is false
                       skb_queue_empty(&local->pending[i]))
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/tx.c:4662:3: note: Taking false branch
                   if (local->queue_stop_reasons[i] ||
                   ^
   net/mac80211/tx.c:4666:3: note: Loop condition is true.  Entering loop b=
ody
                   while (!skb_queue_empty(&local->pending[i])) {
                   ^
   net/mac80211/tx.c:4670:16: note: Assuming field 'vif' is non-null
                           if (WARN_ON(!info->control.vif)) {
                                       ^
   include/asm-generic/bug.h:166:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   net/mac80211/tx.c:4670:4: note: Taking false branch
                           if (WARN_ON(!info->control.vif)) {
                           ^
   net/mac80211/tx.c:4678:11: note: Calling 'ieee80211_tx_pending_skb'
                           txok =3D ieee80211_tx_pending_skb(local, skb);
                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/tx.c:4610:6: note: Assuming the condition is false
           if (info->control.flags & IEEE80211_TX_INTCFL_NEED_TXPROCESSING)=
 {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/tx.c:4610:2: note: Taking false branch
           if (info->control.flags & IEEE80211_TX_INTCFL_NEED_TXPROCESSING)=
 {
           ^
   net/mac80211/tx.c:4618:13: note: Assuming the condition is false
           } else if (info->flags & IEEE80211_TX_CTL_HW_80211_ENCAP) {
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/tx.c:4618:9: note: Taking false branch
           } else if (info->flags & IEEE80211_TX_CTL_HW_80211_ENCAP) {
                  ^
   net/mac80211/tx.c:4631:3: note: Calling '__skb_queue_head_init'
                   __skb_queue_head_init(&skbs);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/tx.c:4631:3: note: Returning from '__skb_queue_head_init'
                   __skb_queue_head_init(&skbs);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/tx.c:4632:3: note: Calling '__skb_queue_tail'
                   __skb_queue_tail(&skbs, skb);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/skbuff.h:2081:2: note: Calling '__skb_queue_before'
           __skb_queue_before(list, (struct sk_buff *)list, newsk);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/skbuff.h:2048:2: note: 2nd function call argument is an un=
initialized value
           __skb_insert(newsk, next->prev, next, list);
           ^                   ~~~~~~~~~~
>> net/mac80211/tx.c:665:24: warning: Value stored to 'hdr' during its init=
ialization is never read [clang-analyzer-deadcode.DeadStores]
           struct ieee80211_hdr *hdr =3D (void *)tx->skb->data;
                                 ^~~   ~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/tx.c:665:24: note: Value stored to 'hdr' during its initial=
ization is never read
           struct ieee80211_hdr *hdr =3D (void *)tx->skb->data;
                                 ^~~   ~~~~~~~~~~~~~~~~~~~~~
>> net/mac80211/tx.c:670:7: warning: Value stored to 'encap' during its ini=
tialization is never read [clang-analyzer-deadcode.DeadStores]
           bool encap =3D info->flags & IEEE80211_TX_CTL_HW_80211_ENCAP;
                ^~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/tx.c:670:7: note: Value stored to 'encap' during its initia=
lization is never read
           bool encap =3D info->flags & IEEE80211_TX_CTL_HW_80211_ENCAP;
                ^~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/tx.c:2596:4: warning: Null pointer passed as 2nd argument t=
o memory copy function [clang-analyzer-unix.cstring.NullArg]
                           memcpy(hdr.addr1, sta->sta.addr, ETH_ALEN);
                           ^                 ~~~~~~~~~~~~~
   net/mac80211/tx.c:2578:2: note: Taking true branch
           if (IS_ERR(sta))
           ^
   net/mac80211/tx.c:2591:2: note: Control jumps to 'case NL80211_IFTYPE_AP=
_VLAN:'  at line 2592
           switch (sdata->vif.type) {
           ^
   net/mac80211/tx.c:2593:7: note: Assuming field 'use_4addr' is true
                   if (sdata->wdev.use_4addr) {
                       ^~~~~~~~~~~~~~~~~~~~~
   net/mac80211/tx.c:2593:3: note: Taking true branch
                   if (sdata->wdev.use_4addr) {
                   ^
   net/mac80211/tx.c:2596:4: note: Null pointer passed as 2nd argument to m=
emory copy function
                           memcpy(hdr.addr1, sta->sta.addr, ETH_ALEN);
                           ^                 ~~~~~~~~~~~~~
   net/mac80211/tx.c:3476:11: warning: Dereference of null pointer [clang-a=
nalyzer-core.NullDereference]
                   switch (key->conf.cipher) {
                           ^
   net/mac80211/tx.c:5751:6: note: Assuming 'skb' is non-null
           if (!skb)
               ^~~~
   net/mac80211/tx.c:5751:2: note: Taking false branch
           if (!skb)
           ^
   net/mac80211/tx.c:5754:2: note: Calling 'skb_reserve'
           skb_reserve(skb, local->hw.extra_tx_headroom);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/skbuff.h:2414:1: note: Returning without writing to 'skb->=
.sk', which participates in a condition later
   }
   ^
   net/mac80211/tx.c:5754:2: note: Returning from 'skb_reserve'
           skb_reserve(skb, local->hw.extra_tx_headroom);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/tx.c:5763:2: note: Calling '__ieee80211_subif_start_xmit'
           __ieee80211_subif_start_xmit(skb, skb->dev, 0,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/tx.c:4166:6: note: Assuming the condition is false
           if (unlikely(skb->len < ETH_HLEN)) {
               ^
   include/linux/compiler.h:78:22: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/tx.c:4166:2: note: Taking false branch
           if (unlikely(skb->len < ETH_HLEN)) {
           ^
   net/mac80211/tx.c:4173:2: note: Taking false branch
           if (ieee80211_lookup_ra_sta(sdata, skb, &sta))
           ^
   net/mac80211/tx.c:4176:2: note: Taking false branch
           if (IS_ERR(sta))
           ^
   net/mac80211/tx.c:4179:6: note: Assuming field 'wake_tx_queue' is null
           if (local->ops->wake_tx_queue) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/tx.c:4179:2: note: Taking false branch
           if (local->ops->wake_tx_queue) {
           ^
   net/mac80211/tx.c:4187:6: note: 'sta' is non-null
           if (sta) {
               ^~~
   net/mac80211/tx.c:4187:2: note: Taking true branch
           if (sta) {
           ^
   net/mac80211/tx.c:4192:13: note: Left side of '||' is false
                   fast_tx =3D rcu_dereference(sta->fast_tx);
                             ^
   include/linux/rcupdate.h:596:28: note: expanded from macro 'rcu_derefere=
nce'
   #define rcu_dereference(p) rcu_dereference_check(p, 0)
                              ^
   include/linux/rcupdate.h:528:2: note: expanded from macro 'rcu_dereferen=
ce_check'
           __rcu_dereference_check((p), (c) || rcu_read_lock_held(), __rcu)
           ^
   include/linux/rcupdate.h:389:48: note: expanded from macro '__rcu_derefe=
rence_check'
           typeof(*p) *________p1 =3D (typeof(*p) *__force)READ_ONCE(p); \
                                                         ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:290:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   net/mac80211/tx.c:4192:13: note: Left side of '||' is false
                   fast_tx =3D rcu_dereference(sta->fast_tx);
                             ^
   include/linux/rcupdate.h:596:28: note: expanded from macro 'rcu_derefere=
nce'
   #define rcu_dereference(p) rcu_dereference_check(p, 0)
                              ^
   include/linux/rcupdate.h:528:2: note: expanded from macro 'rcu_dereferen=
ce_check'
           __rcu_dereference_check((p), (c) || rcu_read_lock_held(), __rcu)
--
   drivers/mtd/nand/raw/nand_base.c:1715:3: note: Taking false branch
                   if (!len)
                   ^
   drivers/mtd/nand/raw/nand_base.c:1718:9: note: Calling 'nand_exec_op'
                   ret =3D nand_exec_op(chip, &op);
                         ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/raw/internals.h:136:7: note: Calling 'nand_has_exec_op'
           if (!nand_has_exec_op(chip))
                ^~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/raw/internals.h:117:13: note: Field 'controller' is non=
-null, which participates in a condition later
           if (!chip->controller || !chip->controller->ops ||
                      ^
   drivers/mtd/nand/raw/internals.h:117:6: note: Left side of '||' is false
           if (!chip->controller || !chip->controller->ops ||
               ^
   drivers/mtd/nand/raw/internals.h:117:46: note: Field 'ops' is non-null, =
which participates in a condition later
           if (!chip->controller || !chip->controller->ops ||
                                                       ^
   drivers/mtd/nand/raw/internals.h:117:6: note: Left side of '||' is false
           if (!chip->controller || !chip->controller->ops ||
               ^
   drivers/mtd/nand/raw/internals.h:118:30: note: Field 'exec_op' is non-nu=
ll, which participates in a condition later
               !chip->controller->ops->exec_op)
                                       ^
   drivers/mtd/nand/raw/internals.h:117:2: note: Taking false branch
           if (!chip->controller || !chip->controller->ops ||
           ^
   drivers/mtd/nand/raw/internals.h:121:2: note: Returning the value 1, whi=
ch participates in a condition later
           return true;
           ^~~~~~~~~~~
   drivers/mtd/nand/raw/internals.h:136:7: note: Returning from 'nand_has_e=
xec_op'
           if (!nand_has_exec_op(chip))
                ^~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/raw/internals.h:136:2: note: Taking false branch
           if (!nand_has_exec_op(chip))
           ^
   drivers/mtd/nand/raw/internals.h:139:14: note: Assuming the condition is=
 false
           if (WARN_ON(op->cs >=3D nanddev_ntargets(&chip->base)))
                       ^
   include/asm-generic/bug.h:166:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   drivers/mtd/nand/raw/internals.h:139:2: note: Taking false branch
           if (WARN_ON(op->cs >=3D nanddev_ntargets(&chip->base)))
           ^
   drivers/mtd/nand/raw/internals.h:142:2: note: Returning value, which par=
ticipates in a condition later
           return chip->controller->ops->exec_op(chip, op, false);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/raw/nand_base.c:1718:9: note: Returning from 'nand_exec=
_op'
                   ret =3D nand_exec_op(chip, &op);
                         ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/raw/nand_base.c:1719:7: note: Assuming 'ret' is 0, whic=
h participates in a condition later
                   if (!ret && len && nand_interface_is_nvddr(conf)) {
                       ^~~~
   drivers/mtd/nand/raw/nand_base.c:1719:7: note: Left side of '&&' is true
   drivers/mtd/nand/raw/nand_base.c:1719:15: note: 'len' is 2
                   if (!ret && len && nand_interface_is_nvddr(conf)) {
                               ^~~
   drivers/mtd/nand/raw/nand_base.c:1719:7: note: Left side of '&&' is true
                   if (!ret && len && nand_interface_is_nvddr(conf)) {
                       ^
   drivers/mtd/nand/raw/nand_base.c:1719:3: note: Taking false branch
                   if (!ret && len && nand_interface_is_nvddr(conf)) {
                   ^
   drivers/mtd/nand/raw/nand_base.c:1726:3: note: Returning without writing=
 to '*'
                   return ret;
                   ^
   drivers/mtd/nand/raw/nand_base.c:1726:3: note: Returning zero (loaded fr=
om 'ret'), which participates in a condition later
                   return ret;
                   ^~~~~~~~~~
   drivers/mtd/nand/raw/nand_base.c:5415:9: note: Returning from 'nand_read=
id_op'
                   ret =3D nand_readid_op(chip, 0, id, sizeof(id));
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/raw/nand_base.c:5416:7: note: 'ret' is 0
                   if (ret)
                       ^~~
   drivers/mtd/nand/raw/nand_base.c:5416:3: note: Taking false branch
                   if (ret)
                   ^
   drivers/mtd/nand/raw/nand_base.c:5419:19: note: The right operand of '!=
=3D' is a garbage value
                   if (nand_maf_id !=3D id[0] || nand_dev_id !=3D id[1]) {
                                   ^  ~~~~~
   drivers/mtd/nand/raw/nand_base.c:5613:22: warning: Value stored to 'nand=
dev' during its initialization is never read [clang-analyzer-deadcode.DeadS=
tores]
           struct nand_device *nanddev =3D mtd_to_nanddev(mtd);
                               ^~~~~~~   ~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/raw/nand_base.c:5613:22: note: Value stored to 'nanddev=
' during its initialization is never read
           struct nand_device *nanddev =3D mtd_to_nanddev(mtd);
                               ^~~~~~~   ~~~~~~~~~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/video/fbdev/via/viafbdev.c:147:2: warning: Call to function 'str=
cpy' is insecure as it does not provide bounding of the memory buffer. Repl=
ace unbounded copy functions with analogous functions that support length a=
rguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.st=
rcpy]
           strcpy(fix->id, viafb_name);
           ^~~~~~
   drivers/video/fbdev/via/viafbdev.c:147:2: note: Call to function 'strcpy=
' is insecure as it does not provide bounding of the memory buffer. Replace=
 unbounded copy functions with analogous functions that support length argu=
ments such as 'strlcpy'. CWE-119
           strcpy(fix->id, viafb_name);
           ^~~~~~
>> drivers/video/fbdev/via/viafbdev.c:1801:19: warning: Assigned value is g=
arbage or undefined [clang-analyzer-core.uninitialized.Assign]
           default_var.yres =3D default_yres;
                            ^ ~~~~~~~~~~~~
   drivers/video/fbdev/via/viafbdev.c:1723:20: note: 'default_yres' declare=
d without an initial value
           u32 default_xres, default_yres;
                             ^~~~~~~~~~~~
   drivers/video/fbdev/via/viafbdev.c:1728:2: note: Taking false branch
           DEBUG_MSG(KERN_INFO "VIAFB PCI Probe!!\n");
           ^
   drivers/video/fbdev/via/debug.h:19:30: note: expanded from macro 'DEBUG_=
MSG'
   #define DEBUG_MSG(f, a...)   no_printk(f, ## a)
                                ^
   include/linux/printk.h:131:2: note: expanded from macro 'no_printk'
           if (0)                                          \
           ^
   drivers/video/fbdev/via/viafbdev.c:1738:6: note: Assuming 'viafbinfo' is=
 non-null
           if (!viafbinfo)
               ^~~~~~~~~~
   drivers/video/fbdev/via/viafbdev.c:1738:2: note: Taking false branch
           if (!viafbinfo)
           ^
   drivers/video/fbdev/via/viafbdev.c:1752:6: note: Assuming 'viafb_dual_fb=
' is 0
           if (viafb_dual_fb)
               ^~~~~~~~~~~~~
   drivers/video/fbdev/via/viafbdev.c:1752:2: note: Taking false branch
           if (viafb_dual_fb)
           ^
   drivers/video/fbdev/via/viafbdev.c:1776:6: note: Assuming 'viafb_accel' =
is 0
           if (viafb_accel && !viafb_setup_engine(viafbinfo)) {
               ^~~~~~~~~~~
   drivers/video/fbdev/via/viafbdev.c:1776:18: note: Left side of '&&' is f=
alse
           if (viafb_accel && !viafb_setup_engine(viafbinfo)) {
                           ^
   drivers/video/fbdev/via/viafbdev.c:1785:6: note: Assuming 'viafb_second_=
size' is 0
           if (viafb_second_size && (viafb_second_size < 8)) {
               ^~~~~~~~~~~~~~~~~
   drivers/video/fbdev/via/viafbdev.c:1785:24: note: Left side of '&&' is f=
alse
           if (viafb_second_size && (viafb_second_size < 8)) {
                                 ^
   drivers/video/fbdev/via/viafbdev.c:1794:2: note: Calling 'parse_mode'
           parse_mode(viafb_mode, viaparinfo->shared->iga1_devices,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/via/viafbdev.c:1630:6: note: Assuming 'str' is non-n=
ull
           if (!str) {
               ^~~~
   drivers/video/fbdev/via/viafbdev.c:1630:2: note: Taking false branch
           if (!str) {
           ^
   drivers/video/fbdev/via/viafbdev.c:1652:6: note: Assuming the condition =
is true
           if (ptr[0] !=3D 'x')
               ^~~~~~~~~~~~~
   drivers/video/fbdev/via/viafbdev.c:1652:2: note: Taking true branch
           if (ptr[0] !=3D 'x')
           ^
   drivers/video/fbdev/via/viafbdev.c:1653:3: note: Returning without writi=
ng to '*yres'
                   return -EINVAL;
                   ^
   drivers/video/fbdev/via/viafbdev.c:1794:2: note: Returning from 'parse_m=
ode'
           parse_mode(viafb_mode, viaparinfo->shared->iga1_devices,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/via/viafbdev.c:1796:6: note: Assuming 'viafb_SAMM_ON=
' is not equal to 1
           if (viafb_SAMM_ON =3D=3D 1)
               ^~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/via/viafbdev.c:1796:2: note: Taking false branch
           if (viafb_SAMM_ON =3D=3D 1)
           ^
   drivers/video/fbdev/via/viafbdev.c:1801:19: note: Assigned value is garb=
age or undefined
           default_var.yres =3D default_yres;
                            ^ ~~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   drivers/video/fbdev/via/hw.c:1068:4: warning: Value stored to 'iga1_disp=
lay_queue_expire_num' is never read [clang-analyzer-deadcode.DeadStores]
                           iga1_display_queue_expire_num =3D
                           ^
   drivers/video/fbdev/via/hw.c:1068:4: note: Value stored to 'iga1_display=
_queue_expire_num' is never read
   drivers/video/fbdev/via/hw.c:1447:3: warning: Passed-by-value struct arg=
ument contains uninitialized data (e.g., field: 'multiplier') [clang-analyz=
er-core.CallAndMessage]
                   clock.set_primary_pll(config);
                   ^
   drivers/video/fbdev/via/hw.c:1836:7: note: Assuming field 'gfx_chip_name=
' is not equal to UNICHROME_CLE266
           if ((viaparinfo->chip_info->gfx_chip_name =3D=3D UNICHROME_CLE266
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/via/hw.c:1836:7: note: Left side of '||' is false
   drivers/video/fbdev/via/hw.c:1837:6: note: Assuming field 'gfx_chip_name=
' is not equal to UNICHROME_K400
                   || viaparinfo->chip_info->gfx_chip_name =3D=3D UNICHROME=
_K400)
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/via/hw.c:1838:3: note: Left side of '&&' is false
                   && viafbinfo->var.xres =3D=3D 1024 && viafbinfo->var.yre=
s =3D=3D 768) {
                   ^
   drivers/video/fbdev/via/hw.c:1849:26: note: Assuming 'viafb_dual_fb' is 0
           via_set_secondary_pitch(viafb_dual_fb ? viafbinfo1->fix.line_len=
gth
                                   ^~~~~~~~~~~~~
   drivers/video/fbdev/via/hw.c:1849:26: note: '?' condition is false
   drivers/video/fbdev/via/hw.c:1852:32: note: Assuming 'viafb_dual_fb' is 0
           via_set_secondary_color_depth(viafb_dual_fb ? viaparinfo1->depth
                                         ^~~~~~~~~~~~~
   drivers/video/fbdev/via/hw.c:1852:32: note: '?' condition is false
   drivers/video/fbdev/via/hw.c:1856:6: note: Assuming field 'iga2_devices'=
 is 0
           if (viaparinfo->shared->iga2_devices)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/via/hw.c:1856:2: note: Taking false branch
--
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletim=
e_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
           ^
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:300:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   include/linux/skbuff.h:1860:6: note: Assuming 'skb' is equal to 'list_'
           if (skb =3D=3D (struct sk_buff *)list_)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/skbuff.h:1860:2: note: Taking true branch
           if (skb =3D=3D (struct sk_buff *)list_)
           ^
   include/linux/skbuff.h:1862:2: note: Returning null pointer (loaded from=
 'skb'), which participates in a condition later
           return skb;
           ^~~~~~~~~~
   net/mac80211/rx.c:1109:25: note: Returning from 'skb_peek_tail'
           struct sk_buff *tail =3D skb_peek_tail(frames);
                                  ^~~~~~~~~~~~~~~~~~~~~
   net/mac80211/rx.c:1112:6: note: Assuming the condition is false
           if (tid_agg_rx->reorder_buf_filtered & BIT_ULL(index))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/rx.c:1112:2: note: Taking false branch
           if (tid_agg_rx->reorder_buf_filtered & BIT_ULL(index))
           ^
   net/mac80211/rx.c:1115:7: note: 'tail' is null
           if (!tail)
                ^~~~
   net/mac80211/rx.c:1115:2: note: Taking true branch
           if (!tail)
           ^
   net/mac80211/rx.c:1116:3: note: Returning without writing to 'tid_agg_rx=
->stored_mpdu_num', which participates in a condition later
                   return false;
                   ^
   net/mac80211/rx.c:1116:3: note: Returning without writing to 'tid_agg_rx=
->buf_size'
   net/mac80211/rx.c:1116:3: note: Returning zero, which participates in a =
condition later
                   return false;
                   ^~~~~~~~~~~~
   net/mac80211/rx.c:1194:7: note: Returning from 'ieee80211_rx_reorder_rea=
dy'
           if (!ieee80211_rx_reorder_ready(tid_agg_rx, index) &&
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/rx.c:1194:6: note: Left side of '&&' is true
           if (!ieee80211_rx_reorder_ready(tid_agg_rx, index) &&
               ^
   net/mac80211/rx.c:1195:6: note: Assuming field 'stored_mpdu_num' is not =
equal to 0
               tid_agg_rx->stored_mpdu_num) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/rx.c:1194:2: note: Taking true branch
           if (!ieee80211_rx_reorder_ready(tid_agg_rx, index) &&
           ^
   net/mac80211/rx.c:1201:48: note: Assuming 'j' is equal to 'index'
                   for (j =3D (index + 1) % tid_agg_rx->buf_size; j !=3D in=
dex;
                                                                ^~~~~~~~~~
   net/mac80211/rx.c:1201:3: note: Loop condition is false. Execution conti=
nues on line 1236
                   for (j =3D (index + 1) % tid_agg_rx->buf_size; j !=3D in=
dex;
                   ^
   net/mac80211/rx.c:1236:18: note: Field 'stored_mpdu_num' is not equal to=
 0
           if (tid_agg_rx->stored_mpdu_num) {
                           ^
   net/mac80211/rx.c:1236:2: note: Taking true branch
           if (tid_agg_rx->stored_mpdu_num) {
           ^
   net/mac80211/rx.c:1239:10: note: Assuming the condition is true
                   for (; j !=3D (index - 1) % tid_agg_rx->buf_size;
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/rx.c:1239:3: note: Loop condition is true.  Entering loop b=
ody
                   for (; j !=3D (index - 1) % tid_agg_rx->buf_size;
                   ^
   net/mac80211/rx.c:1241:8: note: Calling 'ieee80211_rx_reorder_ready'
                           if (ieee80211_rx_reorder_ready(tid_agg_rx, j))
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/rx.c:1112:2: note: Taking false branch
           if (tid_agg_rx->reorder_buf_filtered & BIT_ULL(index))
           ^
   net/mac80211/rx.c:1115:6: note: Assuming 'tail' is null, which participa=
tes in a condition later
           if (!tail)
               ^~~~~
   net/mac80211/rx.c:1115:2: note: Taking true branch
           if (!tail)
           ^
   net/mac80211/rx.c:1116:3: note: Returning without writing to 'tid_agg_rx=
->buf_size'
                   return false;
                   ^
   net/mac80211/rx.c:1116:3: note: Returning zero, which participates in a =
condition later
                   return false;
                   ^~~~~~~~~~~~
   net/mac80211/rx.c:1241:8: note: Returning from 'ieee80211_rx_reorder_rea=
dy'
                           if (ieee80211_rx_reorder_ready(tid_agg_rx, j))
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/rx.c:1241:4: note: Taking false branch
                           if (ieee80211_rx_reorder_ready(tid_agg_rx, j))
                           ^
   net/mac80211/rx.c:1240:20: note: Division by zero
                        j =3D (j + 1) % tid_agg_rx->buf_size) {
                            ~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
>> net/mac80211/rx.c:5009:2: warning: Assigned value is garbage or undefine=
d [clang-analyzer-core.uninitialized.Assign]
           list_for_each_entry_safe(skb, tmp, &list, list) {
           ^
   include/linux/list.h:716:7: note: expanded from macro 'list_for_each_ent=
ry_safe'
                   n =3D list_next_entry(pos, member);                     =
  \
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:555:2: note: expanded from macro 'list_next_entry'
           list_entry((pos)->member.next, typeof(*(pos)), member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:494:2: note: expanded from macro 'container_of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
           ^              ~~~~~~~~~~~~~
   net/mac80211/rx.c:5001:2: note: Calling 'ieee80211_rx_list'
           ieee80211_rx_list(hw, pubsta, skb, &list);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/rx.c:4876:2: note: Assuming '__ret_warn_on' is not equal to=
 0
           WARN_ON_ONCE(softirq_count() =3D=3D 0);
           ^
   include/asm-generic/bug.h:179:33: note: expanded from macro 'WARN_ON_ONC=
E'
   #define WARN_ON_ONCE(condition) WARN_ON(condition)
                                   ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:167:2: note: expanded from macro 'WARN_ON'
           unlikely(__ret_warn_on);                                        \
           ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   net/mac80211/rx.c:4878:14: note: Assuming field 'band' is >=3D NUM_NL802=
11_BANDS
           if (WARN_ON(status->band >=3D NUM_NL80211_BANDS))
                       ^
   include/asm-generic/bug.h:166:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   net/mac80211/rx.c:4878:2: note: Taking true branch
           if (WARN_ON(status->band >=3D NUM_NL80211_BANDS))
           ^
   net/mac80211/rx.c:4879:3: note: Control jumps to line 4984
                   goto drop;
                   ^
   net/mac80211/rx.c:5001:2: note: Returning from 'ieee80211_rx_list'
           ieee80211_rx_list(hw, pubsta, skb, &list);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/rx.c:5004:6: note: Assuming 'napi' is non-null
           if (!napi) {
               ^~~~~
   net/mac80211/rx.c:5004:2: note: Taking false branch
           if (!napi) {
           ^
   net/mac80211/rx.c:5009:2: note: Left side of '&&' is false
           list_for_each_entry_safe(skb, tmp, &list, list) {
           ^
   include/linux/list.h:715:13: note: expanded from macro 'list_for_each_en=
try_safe'
           for (pos =3D list_first_entry(head, typeof(*pos), member),      =
  \
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
   net/mac80211/rx.c:5009:2: note: Taking false branch
           list_for_each_entry_safe(skb, tmp, &list, list) {
           ^
   include/linux/list.h:715:13: note: expanded from macro 'list_for_each_en=
try_safe'
           for (pos =3D list_first_entry(head, typeof(*pos), member),      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:302:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   net/mac80211/rx.c:5009:2: note: Loop condition is false.  Exiting loop
           list_for_each_entry_safe(skb, tmp, &list, list) {
           ^
   include/linux/list.h:715:13: note: expanded from macro 'list_for_each_en=
try_safe'
           for (pos =3D list_first_entry(head, typeof(*pos), member),      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
--
                     ^~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:180:46: note: expanded from macro 'WARN_ONCE'
   #define WARN_ONCE(condition, format...) WARN(condition, format)
                                                ^~~~~~~~~
   include/asm-generic/bug.h:173:25: note: expanded from macro 'WARN'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   net/core/dev.c:8190:2: note: Taking false branch
           ASSERT_RTNL();
           ^
   include/linux/rtnetlink.h:110:2: note: expanded from macro 'ASSERT_RTNL'
           WARN_ONCE(!rtnl_is_locked(), \
           ^
   include/asm-generic/bug.h:180:41: note: expanded from macro 'WARN_ONCE'
   #define WARN_ONCE(condition, format...) WARN(condition, format)
                                           ^
   include/asm-generic/bug.h:174:2: note: expanded from macro 'WARN'
           no_printk(format);                                              \
           ^
   include/linux/printk.h:131:2: note: expanded from macro 'no_printk'
           if (0)                                          \
           ^
   net/core/dev.c:8192:28: note: Assuming pointer value is null
           changeupper_info.master =3D netdev_master_upper_dev_get(dev) =3D=
=3D upper_dev;
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   net/core/dev.c:8197:46: note: Passing null pointer value via 2nd paramet=
er 'upper_dev'
           __netdev_adjacent_dev_unlink_neighbour(dev, upper_dev);
                                                       ^~~~~~~~~
   net/core/dev.c:8197:2: note: Calling '__netdev_adjacent_dev_unlink_neigh=
bour'
           __netdev_adjacent_dev_unlink_neighbour(dev, upper_dev);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/core/dev.c:8047:42: note: Passing null pointer value via 2nd paramet=
er 'upper_dev'
           __netdev_adjacent_dev_unlink_lists(dev, upper_dev, 1,
                                                   ^~~~~~~~~
   net/core/dev.c:8047:2: note: Calling '__netdev_adjacent_dev_unlink_lists'
           __netdev_adjacent_dev_unlink_lists(dev, upper_dev, 1,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/core/dev.c:8030:36: note: Passing null pointer value via 2nd paramet=
er 'adj_dev'
           __netdev_adjacent_dev_remove(dev, upper_dev, ref_nr, up_list);
                                             ^~~~~~~~~
   net/core/dev.c:8030:2: note: Calling '__netdev_adjacent_dev_remove'
           __netdev_adjacent_dev_remove(dev, upper_dev, ref_nr, up_list);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/core/dev.c:7968:2: note: Taking false branch
           pr_debug("Remove adjacency: dev %s adj_dev %s ref_nr %d\n",
           ^
   include/linux/printk.h:576:2: note: expanded from macro 'pr_debug'
           no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:131:2: note: expanded from macro 'no_printk'
           if (0)                                          \
           ^
   net/core/dev.c:7973:6: note: Assuming 'adj' is non-null
           if (!adj) {
               ^~~~
   net/core/dev.c:7973:2: note: Taking false branch
           if (!adj) {
           ^
   net/core/dev.c:7980:6: note: Assuming 'ref_nr' is >=3D field 'ref_nr'
           if (adj->ref_nr > ref_nr) {
               ^~~~~~~~~~~~~~~~~~~~
   net/core/dev.c:7980:2: note: Taking false branch
           if (adj->ref_nr > ref_nr) {
           ^
   net/core/dev.c:7988:6: note: Assuming field 'master' is false
           if (adj->master)
               ^~~~~~~~~~~
   net/core/dev.c:7988:2: note: Taking false branch
           if (adj->master)
           ^
   net/core/dev.c:7991:41: note: Passing null pointer value via 2nd paramet=
er 'adj_dev'
           if (netdev_adjacent_is_neigh_list(dev, adj_dev, dev_list))
                                                  ^~~~~~~
   net/core/dev.c:7991:6: note: Calling 'netdev_adjacent_is_neigh_list'
           if (netdev_adjacent_is_neigh_list(dev, adj_dev, dev_list))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/core/dev.c:7894:43: note: Left side of '||' is true
           return (dev_list =3D=3D &dev->adj_list.upper ||
                                                    ^
   net/core/dev.c:7896:32: note: Passing null pointer value via 1st paramet=
er 'dev'
                   net_eq(dev_net(dev), dev_net(adj_dev));
                                                ^~~~~~~
   net/core/dev.c:7896:24: note: Calling 'dev_net'
                   net_eq(dev_net(dev), dev_net(adj_dev));
                                        ^~~~~~~~~~~~~~~~
   include/linux/netdevice.h:2432:19: note: Passing null pointer value via =
1st parameter 'pnet'
           return read_pnet(&dev->nd_net);
                            ^~~~~~~~~~~~
   include/linux/netdevice.h:2432:9: note: Calling 'read_pnet'
           return read_pnet(&dev->nd_net);
                  ^~~~~~~~~~~~~~~~~~~~~~~
   include/net/net_namespace.h:327:9: note: Access to field 'net' results i=
n a dereference of a null pointer (loaded from variable 'pnet')
           return pnet->net;
                  ^~~~
   net/core/dev.c:958:2: warning: Call to function 'strcpy' is insecure as =
it does not provide bounding of the memory buffer. Replace unbounded copy f=
unctions with analogous functions that support length arguments such as 'st=
rlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(name, dev->name);
           ^~~~~~
   net/core/dev.c:958:2: note: Call to function 'strcpy' is insecure as it =
does not provide bounding of the memory buffer. Replace unbounded copy func=
tions with analogous functions that support length arguments such as 'strlc=
py'. CWE-119
           strcpy(name, dev->name);
           ^~~~~~
>> net/core/dev.c:3191:4: warning: Value stored to 'name' is never read [cl=
ang-analyzer-deadcode.DeadStores]
                           name =3D dev_driver_string(dev->dev.parent);
                           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/core/dev.c:3191:4: note: Value stored to 'name' is never read
                           name =3D dev_driver_string(dev->dev.parent);
                           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/core/dev.c:3193:4: warning: Value stored to 'name' is never read [cl=
ang-analyzer-deadcode.DeadStores]
                           name =3D netdev_name(dev);
                           ^      ~~~~~~~~~~~~~~~~
   net/core/dev.c:3193:4: note: Value stored to 'name' is never read
                           name =3D netdev_name(dev);
                           ^      ~~~~~~~~~~~~~~~~
   net/core/dev.c:5996:2: warning: Null pointer passed as 2nd argument to m=
emory copy function [clang-analyzer-unix.cstring.NullArg]
           memcpy(skb_tail_pointer(skb), NAPI_GRO_CB(skb)->frag0, grow);
           ^
   net/core/dev.c:6327:24: note: Calling 'napi_frags_skb'
           struct sk_buff *skb =3D napi_frags_skb(napi);
                                 ^~~~~~~~~~~~~~~~~~~~
   net/core/dev.c:6298:15: note: Calling 'skb_gro_header_hard'
           if (unlikely(skb_gro_header_hard(skb, hlen))) {
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   net/core/dev.c:6298:15: note: Returning from 'skb_gro_header_hard'
           if (unlikely(skb_gro_header_hard(skb, hlen))) {
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   net/core/dev.c:6298:2: note: Taking true branch
           if (unlikely(skb_gro_header_hard(skb, hlen))) {
           ^
   net/core/dev.c:6299:9: note: Calling 'skb_gro_header_slow'
                   eth =3D skb_gro_header_slow(skb, hlen, 0);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/netdevice.h:3045:7: note: Calling 'pskb_may_pull'
           if (!pskb_may_pull(skb, hlen))
                ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/skbuff.h:2356:13: note: Assuming the condition is true
           if (likely(len <=3D skb_headlen(skb)))
                      ^
   include/linux/compiler.h:77:40: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                               ^
   include/linux/skbuff.h:2356:2: note: Taking true branch
           if (likely(len <=3D skb_headlen(skb)))
           ^
   include/linux/netdevice.h:3045:7: note: Returning from 'pskb_may_pull'
           if (!pskb_may_pull(skb, hlen))
                ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/netdevice.h:3045:2: note: Taking false branch
           if (!pskb_may_pull(skb, hlen))
           ^
   include/linux/netdevice.h:3048:2: note: Calling 'skb_gro_frag0_invalidat=
e'
           skb_gro_frag0_invalidate(skb);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/netdevice.h:3038:2: note: Null pointer value stored to fie=
ld 'frag0'
           NAPI_GRO_CB(skb)->frag0 =3D NULL;
           ^
   include/linux/netdevice.h:2590:26: note: expanded from macro 'NAPI_GRO_C=
B'
   #define NAPI_GRO_CB(skb) ((struct napi_gro_cb *)(skb)->cb)
                            ^
   include/linux/netdevice.h:3048:2: note: Returning from 'skb_gro_frag0_in=
validate'
           skb_gro_frag0_invalidate(skb);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/core/dev.c:6299:9: note: Returning from 'skb_gro_header_slow'
                   eth =3D skb_gro_header_slow(skb, hlen, 0);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/core/dev.c:6300:16: note: Assuming 'eth' is non-null
                   if (unlikely(!eth)) {
                                ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   net/core/dev.c:6300:3: note: Taking false branch
                   if (unlikely(!eth)) {
                   ^
   net/core/dev.c:6312:2: note: Calling '__skb_pull'
           __skb_pull(skb, hlen);
           ^~~~~~~~~~~~~~~~~~~~~
   include/linux/skbuff.h:2329:9: note: Assuming field 'len' is >=3D field =
'data_len'
           BUG_ON(skb->len < skb->data_len);
                  ^
   include/asm-generic/bug.h:161:45: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                               ^~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/skbuff.h:2329:2: note: Taking false branch
           BUG_ON(skb->len < skb->data_len);
           ^
   include/asm-generic/bug.h:161:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                  ^
   include/linux/skbuff.h:2329:2: note: Loop condition is false.  Exiting l=
oop
           BUG_ON(skb->len < skb->data_len);
           ^
   include/asm-generic/bug.h:161:27: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
--
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
   18 warnings generated.
   init/main.c:647:3: warning: Call to function 'strcpy' is insecure as it =
does not provide bounding of the memory buffer. Replace unbounded copy func=
tions with analogous functions that support length arguments such as 'strlc=
py'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(saved_command_line, extra_command_line);
                   ^~~~~~
   init/main.c:647:3: note: Call to function 'strcpy' is insecure as it doe=
s not provide bounding of the memory buffer. Replace unbounded copy functio=
ns with analogous functions that support length arguments such as 'strlcpy'=
. CWE-119
                   strcpy(saved_command_line, extra_command_line);
                   ^~~~~~
   init/main.c:648:3: warning: Call to function 'strcpy' is insecure as it =
does not provide bounding of the memory buffer. Replace unbounded copy func=
tions with analogous functions that support length arguments such as 'strlc=
py'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(static_command_line, extra_command_line);
                   ^~~~~~
   init/main.c:648:3: note: Call to function 'strcpy' is insecure as it doe=
s not provide bounding of the memory buffer. Replace unbounded copy functio=
ns with analogous functions that support length arguments such as 'strlcpy'=
. CWE-119
                   strcpy(static_command_line, extra_command_line);
                   ^~~~~~
   init/main.c:650:2: warning: Call to function 'strcpy' is insecure as it =
does not provide bounding of the memory buffer. Replace unbounded copy func=
tions with analogous functions that support length arguments such as 'strlc=
py'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(saved_command_line + xlen, boot_command_line);
           ^~~~~~
   init/main.c:650:2: note: Call to function 'strcpy' is insecure as it doe=
s not provide bounding of the memory buffer. Replace unbounded copy functio=
ns with analogous functions that support length arguments such as 'strlcpy'=
. CWE-119
           strcpy(saved_command_line + xlen, boot_command_line);
           ^~~~~~
   init/main.c:651:2: warning: Call to function 'strcpy' is insecure as it =
does not provide bounding of the memory buffer. Replace unbounded copy func=
tions with analogous functions that support length arguments such as 'strlc=
py'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(static_command_line + xlen, command_line);
           ^~~~~~
   init/main.c:651:2: note: Call to function 'strcpy' is insecure as it doe=
s not provide bounding of the memory buffer. Replace unbounded copy functio=
ns with analogous functions that support length arguments such as 'strlcpy'=
. CWE-119
           strcpy(static_command_line + xlen, command_line);
           ^~~~~~
   init/main.c:663:4: warning: Call to function 'strcpy' is insecure as it =
does not provide bounding of the memory buffer. Replace unbounded copy func=
tions with analogous functions that support length arguments such as 'strlc=
py'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                           strcpy(saved_command_line + len, extra_init_args=
);
                           ^~~~~~
   init/main.c:663:4: note: Call to function 'strcpy' is insecure as it doe=
s not provide bounding of the memory buffer. Replace unbounded copy functio=
ns with analogous functions that support length arguments such as 'strlcpy'=
. CWE-119
                           strcpy(saved_command_line + len, extra_init_args=
);
                           ^~~~~~
   init/main.c:665:4: warning: Call to function 'strcpy' is insecure as it =
does not provide bounding of the memory buffer. Replace unbounded copy func=
tions with analogous functions that support length arguments such as 'strlc=
py'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                           strcpy(saved_command_line + len,
                           ^~~~~~
   init/main.c:665:4: note: Call to function 'strcpy' is insecure as it doe=
s not provide bounding of the memory buffer. Replace unbounded copy functio=
ns with analogous functions that support length arguments such as 'strlcpy'=
. CWE-119
                           strcpy(saved_command_line + len,
                           ^~~~~~
   init/main.c:669:4: warning: Call to function 'strcpy' is insecure as it =
does not provide bounding of the memory buffer. Replace unbounded copy func=
tions with analogous functions that support length arguments such as 'strlc=
py'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                           strcpy(saved_command_line + len, " -- ");
                           ^~~~~~
   init/main.c:669:4: note: Call to function 'strcpy' is insecure as it doe=
s not provide bounding of the memory buffer. Replace unbounded copy functio=
ns with analogous functions that support length arguments such as 'strlcpy'=
. CWE-119
                           strcpy(saved_command_line + len, " -- ");
                           ^~~~~~
   init/main.c:671:4: warning: Call to function 'strcpy' is insecure as it =
does not provide bounding of the memory buffer. Replace unbounded copy func=
tions with analogous functions that support length arguments such as 'strlc=
py'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                           strcpy(saved_command_line + len, extra_init_args=
);
                           ^~~~~~
   init/main.c:671:4: note: Call to function 'strcpy' is insecure as it doe=
s not provide bounding of the memory buffer. Replace unbounded copy functio=
ns with analogous functions that support length arguments such as 'strlcpy'=
. CWE-119
                           strcpy(saved_command_line + len, extra_init_args=
);
                           ^~~~~~
   init/main.c:1191:4: warning: Call to function 'strcpy' is insecure as it=
 does not provide bounding of the memory buffer. Replace unbounded copy fun=
ctions with analogous functions that support length arguments such as 'strl=
cpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                           strcpy(entry->buf, str_entry);
                           ^~~~~~
   init/main.c:1191:4: note: Call to function 'strcpy' is insecure as it do=
es not provide bounding of the memory buffer. Replace unbounded copy functi=
ons with analogous functions that support length arguments such as 'strlcpy=
'. CWE-119
                           strcpy(entry->buf, str_entry);
                           ^~~~~~
   init/main.c:1391:3: warning: Call to function 'strcpy' is insecure as it=
 does not provide bounding of the memory buffer. Replace unbounded copy fun=
ctions with analogous functions that support length arguments such as 'strl=
cpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(command_line, saved_command_line);
                   ^~~~~~
   init/main.c:1391:3: note: Call to function 'strcpy' is insecure as it do=
es not provide bounding of the memory buffer. Replace unbounded copy functi=
ons with analogous functions that support length arguments such as 'strlcpy=
'. CWE-119
                   strcpy(command_line, saved_command_line);
                   ^~~~~~
   Suppressed 8 warnings (5 in non-user code, 3 with check filters).
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
   4 warnings generated.
>> drivers/clk/mmp/clk-mix.c:193:3: warning: Value stored to 'fc_req' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
                   fc_req &=3D ~(1 << ri->bit_fc);
                   ^         ~~~~~~~~~~~~~~~~~~
   drivers/clk/mmp/clk-mix.c:193:3: note: Value stored to 'fc_req' is never=
 read
                   fc_req &=3D ~(1 << ri->bit_fc);
                   ^         ~~~~~~~~~~~~~~~~~~
>> drivers/clk/mmp/clk-mix.c:345:21: warning: Division by zero [clang-analy=
zer-core.DivideZero]
           return parent_rate / div;
                  ~~~~~~~~~~~~^~~~~
   drivers/clk/mmp/clk-mix.c:321:28: note: Left side of '&&' is false
           struct mmp_clk_mix *mix =3D to_clk_mix(hw);
                                     ^
   drivers/clk/mmp/clk-mix.c:25:24: note: expanded from macro 'to_clk_mix'
   #define to_clk_mix(hw)  container_of(hw, struct mmp_clk_mix, hw)
                           ^
   include/linux/kernel.h:495:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/clk/mmp/clk-mix.c:321:28: note: Taking false branch
           struct mmp_clk_mix *mix =3D to_clk_mix(hw);
                                     ^
   drivers/clk/mmp/clk-mix.c:25:24: note: expanded from macro 'to_clk_mix'
   #define to_clk_mix(hw)  container_of(hw, struct mmp_clk_mix, hw)
                           ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:302:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/clk/mmp/clk-mix.c:321:28: note: Loop condition is false.  Exitin=
g loop
           struct mmp_clk_mix *mix =3D to_clk_mix(hw);
                                     ^
   drivers/clk/mmp/clk-mix.c:25:24: note: expanded from macro 'to_clk_mix'
   #define to_clk_mix(hw)  container_of(hw, struct mmp_clk_mix, hw)
                           ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:300:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/clk/mmp/clk-mix.c:328:6: note: Assuming field 'lock' is null
           if (mix->lock)
               ^~~~~~~~~
   drivers/clk/mmp/clk-mix.c:328:2: note: Taking false branch
           if (mix->lock)
           ^
   drivers/clk/mmp/clk-mix.c:331:6: note: Assuming field 'type' is not equa=
l to MMP_CLK_MIX_TYPE_V1
           if (mix->type =3D=3D MMP_CLK_MIX_TYPE_V1
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/mmp/clk-mix.c:331:6: note: Left side of '||' is false
   drivers/clk/mmp/clk-mix.c:332:6: note: Assuming field 'type' is not equa=
l to MMP_CLK_MIX_TYPE_V2
                   || mix->type =3D=3D MMP_CLK_MIX_TYPE_V2)
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/mmp/clk-mix.c:331:2: note: Taking false branch
           if (mix->type =3D=3D MMP_CLK_MIX_TYPE_V1
           ^
   drivers/clk/mmp/clk-mix.c:337:11: note: Field 'lock' is null
           if (mix->lock)
                    ^
   drivers/clk/mmp/clk-mix.c:337:2: note: Taking false branch
           if (mix->lock)
           ^
   drivers/clk/mmp/clk-mix.c:343:8: note: Calling '_get_div'
           div =3D _get_div(mix, MMP_CLK_BITS_GET_VAL(mux_div, width, shift=
));
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/mmp/clk-mix.c:50:6: note: Assuming the condition is false
           if (mix->div_flags & CLK_DIVIDER_ONE_BASED)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/mmp/clk-mix.c:50:2: note: Taking false branch
           if (mix->div_flags & CLK_DIVIDER_ONE_BASED)
           ^
   drivers/clk/mmp/clk-mix.c:52:6: note: Assuming the condition is false
           if (mix->div_flags & CLK_DIVIDER_POWER_OF_TWO)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/mmp/clk-mix.c:52:2: note: Taking false branch
           if (mix->div_flags & CLK_DIVIDER_POWER_OF_TWO)
           ^
   drivers/clk/mmp/clk-mix.c:54:6: note: Assuming field 'div_table' is non-=
null
           if (mix->div_table) {
               ^~~~~~~~~~~~~~
   drivers/clk/mmp/clk-mix.c:54:2: note: Taking true branch
           if (mix->div_table) {
           ^
   drivers/clk/mmp/clk-mix.c:55:3: note: Loop condition is false. Execution=
 continues on line 58
                   for (clkt =3D mix->div_table; clkt->div; clkt++)
                   ^
   drivers/clk/mmp/clk-mix.c:58:13: note: Field 'div' is equal to 0
                   if (clkt->div =3D=3D 0)
                             ^
   drivers/clk/mmp/clk-mix.c:58:3: note: Taking true branch
                   if (clkt->div =3D=3D 0)
                   ^
   drivers/clk/mmp/clk-mix.c:59:4: note: Returning zero
                           return 0;
                           ^~~~~~~~
   drivers/clk/mmp/clk-mix.c:343:8: note: Returning from '_get_div'
           div =3D _get_div(mix, MMP_CLK_BITS_GET_VAL(mux_div, width, shift=
));
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/mmp/clk-mix.c:343:2: note: The value 0 is assigned to 'div'
           div =3D _get_div(mix, MMP_CLK_BITS_GET_VAL(mux_div, width, shift=
));
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/mmp/clk-mix.c:345:21: note: Division by zero
           return parent_rate / div;
                  ~~~~~~~~~~~~^~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
>> drivers/pci/controller/pci-rcar-gen2.c:225:3: warning: Value stored to '=
window_size' is never read [clang-analyzer-deadcode.DeadStores]
                   window_size =3D SZ_256M;
                   ^
   drivers/pci/controller/pci-rcar-gen2.c:225:3: note: Value stored to 'win=
dow_size' is never read
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   include/linux/log2.h:57:13: warning: The result of the left shift is und=
efined due to shifting by '32', which is greater or equal to the width of t=
ype 'unsigned long' [clang-analyzer-core.UndefinedBinaryOperatorResult]
           return 1UL << fls_long(n - 1);
                      ^
   drivers/pci/controller/pcie-rcar.c:79:6: note: Assuming 'size' is > 128
           if (size > 128)
               ^~~~~~~~~~
   drivers/pci/controller/pcie-rcar.c:79:2: note: Taking true branch
           if (size > 128)
           ^
   drivers/pci/controller/pcie-rcar.c:80:11: note: '?' condition is false
                   mask =3D (roundup_pow_of_two(size) / SZ_128) - 1;
                           ^
   include/linux/log2.h:176:2: note: expanded from macro 'roundup_pow_of_tw=
o'
           __builtin_constant_p(n) ? (             \
           ^
   drivers/pci/controller/pcie-rcar.c:80:11: note: Calling '__roundup_pow_o=
f_two'
                   mask =3D (roundup_pow_of_two(size) / SZ_128) - 1;
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
   include/asm-generic/bitops/fls.h:17:7: note: 'x' is not equal to 0, whic=
h participates in a condition later
           if (!x)
                ^
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
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   drivers/pci/controller/dwc/pci-imx6.c:279:6: warning: The left expressio=
n of the compound assignment is an uninitialized value. The computed value =
will also be garbage [clang-analyzer-core.uninitialized.Assign]
--
           ^
   drivers/pinctrl/samsung/pinctrl-samsung.c:1060:3: note: Loop condition i=
s false.  Exiting loop
                   raw_spin_lock_init(&bank->slock);
                   ^
   include/linux/spinlock.h:103:39: note: expanded from macro 'raw_spin_loc=
k_init'
   # define raw_spin_lock_init(lock)                                       \
                                                                           ^
   drivers/pinctrl/samsung/pinctrl-samsung.c:1065:19: note: Assigned value =
is garbage or undefined
                   bank->eint_base =3D virt_base[0];
                                   ^ ~~~~~~~~~~~~
   drivers/pinctrl/samsung/pinctrl-samsung.c:1073:15: warning: Assigned val=
ue is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
           d->virt_base =3D virt_base[0];
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
 >=3D field 'nr_banks'
           for (i =3D 0; i < ctrl->nr_banks; ++i, ++bdata, ++bank) {
                       ^~~~~~~~~~~~~~~~~~
   drivers/pinctrl/samsung/pinctrl-samsung.c:1050:2: note: Loop condition i=
s false. Execution continues on line 1073
           for (i =3D 0; i < ctrl->nr_banks; ++i, ++bdata, ++bank) {
           ^
   drivers/pinctrl/samsung/pinctrl-samsung.c:1073:15: note: Assigned value =
is garbage or undefined
           d->virt_base =3D virt_base[0];
                        ^ ~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
>> drivers/clk/clk-vt8500.c:301:2: warning: Value stored to 'rc' is never r=
ead [clang-analyzer-deadcode.DeadStores]
           rc =3D of_clk_add_hw_provider(node, of_clk_hw_simple_get, hw);
           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/clk-vt8500.c:301:2: note: Value stored to 'rc' is never read
           rc =3D of_clk_add_hw_provider(node, of_clk_hw_simple_get, hw);
           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/clk-vt8500.c:715:2: warning: Value stored to 'rc' is never r=
ead [clang-analyzer-deadcode.DeadStores]
           rc =3D of_clk_add_hw_provider(node, of_clk_hw_simple_get, hw);
           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/clk-vt8500.c:715:2: note: Value stored to 'rc' is never read
           rc =3D of_clk_add_hw_provider(node, of_clk_hw_simple_get, hw);
           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   4 warnings generated.
   drivers/clk/actions/owl-pll.c:28:9: warning: Although the value stored t=
o 'mul' is used in the enclosing expression, the value is never actually re=
ad from 'mul' [clang-analyzer-deadcode.DeadStores]
           return mul &=3D mul_mask(pll_hw);
                  ^
   drivers/clk/actions/owl-pll.c:28:9: note: Although the value stored to '=
mul' is used in the enclosing expression, the value is never actually read =
from 'mul'
   Suppressed 3 warnings (2 in non-user code, 1 with check filters).
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
   kernel/rcu/refscale.c:619:4: warning: Call to function 'strcat' is insec=
ure as it does not provide bounding of the memory buffer. Replace unbounded=
 copy functions with analogous functions that support length arguments such=
 as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                           strcat(buf, "\n");
                           ^~~~~~
   kernel/rcu/refscale.c:619:4: note: Call to function 'strcat' is insecure=
 as it does not provide bounding of the memory buffer. Replace unbounded co=
py functions with analogous functions that support length arguments such as=
 'strlcat'. CWE-119
                           strcat(buf, "\n");
                           ^~~~~~
   kernel/rcu/refscale.c:620:3: warning: Call to function 'strcat' is insec=
ure as it does not provide bounding of the memory buffer. Replace unbounded=
 copy functions with analogous functions that support length arguments such=
 as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcat(buf, buf1);
                   ^~~~~~
   kernel/rcu/refscale.c:620:3: note: Call to function 'strcat' is insecure=
 as it does not provide bounding of the memory buffer. Replace unbounded co=
py functions with analogous functions that support length arguments such as=
 'strlcat'. CWE-119
                   strcat(buf, buf1);
                   ^~~~~~
   kernel/rcu/refscale.c:624:2: warning: Call to function 'strcat' is insec=
ure as it does not provide bounding of the memory buffer. Replace unbounded=
 copy functions with analogous functions that support length arguments such=
 as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcat(buf, "\n");
           ^~~~~~
   kernel/rcu/refscale.c:624:2: note: Call to function 'strcat' is insecure=
 as it does not provide bounding of the memory buffer. Replace unbounded co=
py functions with analogous functions that support length arguments such as=
 'strlcat'. CWE-119
           strcat(buf, "\n");
           ^~~~~~
   kernel/rcu/refscale.c:703:3: warning: Call to function 'strcat' is insec=
ure as it does not provide bounding of the memory buffer. Replace unbounded=
 copy functions with analogous functions that support length arguments such=
 as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcat(buf, "\n");
                   ^~~~~~
   kernel/rcu/refscale.c:703:3: note: Call to function 'strcat' is insecure=
 as it does not provide bounding of the memory buffer. Replace unbounded co=
py functions with analogous functions that support length arguments such as=
 'strlcat'. CWE-119
                   strcat(buf, "\n");
                   ^~~~~~
   kernel/rcu/refscale.c:704:3: warning: Call to function 'strcat' is insec=
ure as it does not provide bounding of the memory buffer. Replace unbounded=
 copy functions with analogous functions that support length arguments such=
 as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcat(buf, "Runs\tTime(ns)\n");
                   ^~~~~~
   kernel/rcu/refscale.c:704:3: note: Call to function 'strcat' is insecure=
 as it does not provide bounding of the memory buffer. Replace unbounded co=
py functions with analogous functions that support length arguments such as=
 'strlcat'. CWE-119
                   strcat(buf, "Runs\tTime(ns)\n");
                   ^~~~~~
   kernel/rcu/refscale.c:715:3: warning: Call to function 'strcat' is insec=
ure as it does not provide bounding of the memory buffer. Replace unbounded=
 copy functions with analogous functions that support length arguments such=
 as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcat(buf, buf1);
                   ^~~~~~
   kernel/rcu/refscale.c:715:3: note: Call to function 'strcat' is insecure=
 as it does not provide bounding of the memory buffer. Replace unbounded co=
py functions with analogous functions that support length arguments such as=
 'strlcat'. CWE-119
                   strcat(buf, buf1);
                   ^~~~~~
   Suppressed 3 warnings (3 in non-user code).
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
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
--
   include/drm/drm_drv.h:581:2: note: Returning the value 1, which particip=
ates in a condition later
           return drm_core_check_all_features(dev, feature);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_bufs.c:1122:7: note: Returning from 'drm_core_check_=
feature'
           if (!drm_core_check_feature(dev, DRIVER_SG))
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_bufs.c:1122:2: note: Taking false branch
           if (!drm_core_check_feature(dev, DRIVER_SG))
           ^
   drivers/gpu/drm/drm_bufs.c:1125:6: note: Assuming 'dma' is non-null
           if (!dma)
               ^~~~
   drivers/gpu/drm/drm_bufs.c:1125:2: note: Taking false branch
           if (!dma)
           ^
   drivers/gpu/drm/drm_bufs.c:1128:6: note: Assuming the condition is false
           if (!capable(CAP_SYS_ADMIN))
               ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_bufs.c:1128:2: note: Taking false branch
           if (!capable(CAP_SYS_ADMIN))
           ^
   drivers/gpu/drm/drm_bufs.c:1132:10: note: '?' condition is false
           order =3D order_base_2(request->size);
                   ^
   include/linux/log2.h:219:2: note: expanded from macro 'order_base_2'
           __builtin_constant_p(n) ? (             \
           ^
   drivers/gpu/drm/drm_bufs.c:1132:10: note: Calling '__order_base_2'
           order =3D order_base_2(request->size);
                   ^
   include/linux/log2.h:222:2: note: expanded from macro 'order_base_2'
           __order_base_2(n)                       \
           ^~~~~~~~~~~~~~~~~
   include/linux/log2.h:201:9: note: Assuming 'n' is > 1
           return n > 1 ? ilog2(n - 1) + 1 : 0;
                  ^~~~~
   include/linux/log2.h:201:9: note: '?' condition is true
   include/linux/log2.h:201:17: note: '?' condition is false
           return n > 1 ? ilog2(n - 1) + 1 : 0;
                          ^
   include/linux/log2.h:158:2: note: expanded from macro 'ilog2'
           __builtin_constant_p(n) ?       \
           ^
   include/linux/log2.h:201:17: note: '?' condition is true
           return n > 1 ? ilog2(n - 1) + 1 : 0;
                          ^
   include/linux/log2.h:161:2: note: expanded from macro 'ilog2'
           (sizeof(n) <=3D 4) ?              \
           ^
   include/linux/log2.h:201:2: note: Returning the value 32
           return n > 1 ? ilog2(n - 1) + 1 : 0;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_bufs.c:1132:10: note: Returning from '__order_base_2'
           order =3D order_base_2(request->size);
                   ^
   include/linux/log2.h:222:2: note: expanded from macro 'order_base_2'
           __order_base_2(n)                       \
           ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_bufs.c:1132:2: note: The value 32 is assigned to 'or=
der'
           order =3D order_base_2(request->size);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_bufs.c:1133:11: note: The result of the left shift i=
s undefined due to shifting by '32', which is greater or equal to the width=
 of type 'int'
           size =3D 1 << order;
                    ^  ~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgk104.c:1284:8: warning: Altho=
ugh the value stored to 'data' is used in the enclosing expression, the val=
ue is never actually read from 'data' [clang-analyzer-deadcode.DeadStores]
           if (!(data =3D nvbios_M0205Ep(bios, i, &ver, &hdr, &cnt, &len, &=
M0205E)))
                 ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgk104.c:1284:8: note: Although=
 the value stored to 'data' is used in the enclosing expression, the value =
is never actually read from 'data'
           if (!(data =3D nvbios_M0205Ep(bios, i, &ver, &hdr, &cnt, &len, &=
M0205E)))
                 ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgk104.c:1300:8: warning: Altho=
ugh the value stored to 'data' is used in the enclosing expression, the val=
ue is never actually read from 'data' [clang-analyzer-deadcode.DeadStores]
           if (!(data =3D nvbios_M0205Sp(bios, i, ramcfg, &ver, &hdr, &M020=
5S)))
                 ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgk104.c:1300:8: note: Although=
 the value stored to 'data' is used in the enclosing expression, the value =
is never actually read from 'data'
           if (!(data =3D nvbios_M0205Sp(bios, i, ramcfg, &ver, &hdr, &M020=
5S)))
                 ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgk104.c:1305:8: warning: Altho=
ugh the value stored to 'data' is used in the enclosing expression, the val=
ue is never actually read from 'data' [clang-analyzer-deadcode.DeadStores]
           if (!(data =3D nvbios_M0209Ep(bios, i, &ver, &hdr, &cnt, &len, &=
M0209E)))
                 ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgk104.c:1305:8: note: Although=
 the value stored to 'data' is used in the enclosing expression, the value =
is never actually read from 'data'
           if (!(data =3D nvbios_M0209Ep(bios, i, &ver, &hdr, &cnt, &len, &=
M0209E)))
                 ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgk104.c:1309:8: warning: Altho=
ugh the value stored to 'data' is used in the enclosing expression, the val=
ue is never actually read from 'data' [clang-analyzer-deadcode.DeadStores]
           if (!(data =3D nvbios_M0209Sp(bios, i, 0, &ver, &hdr, value)))
                 ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgk104.c:1309:8: note: Although=
 the value stored to 'data' is used in the enclosing expression, the value =
is never actually read from 'data'
           if (!(data =3D nvbios_M0209Sp(bios, i, 0, &ver, &hdr, value)))
                 ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgk104.c:1317:9: warning: Altho=
ugh the value stored to 'data' is used in the enclosing expression, the val=
ue is never actually read from 'data' [clang-analyzer-deadcode.DeadStores]
                   if (!(data =3D nvbios_M0209Sp(bios, M0209E.v03, 0, &ver,=
 &hdr,
                         ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgk104.c:1317:9: note: Although=
 the value stored to 'data' is used in the enclosing expression, the value =
is never actually read from 'data'
                   if (!(data =3D nvbios_M0209Sp(bios, M0209E.v03, 0, &ver,=
 &hdr,
                         ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
>> drivers/dma/stm32-dma.c:1094:23: warning: Dereference of null pointer [c=
lang-analyzer-core.NullDereference]
                   return (dma_smar =3D=3D sg_req->chan_reg.dma_sm0ar);
                                       ^
   drivers/dma/stm32-dma.c:1179:6: note: 'status' is not equal to DMA_COMPL=
ETE
           if (status =3D=3D DMA_COMPLETE || !state)
               ^~~~~~
   drivers/dma/stm32-dma.c:1179:6: note: Left side of '||' is false
   drivers/dma/stm32-dma.c:1179:33: note: 'state' is non-null
           if (status =3D=3D DMA_COMPLETE || !state)
                                          ^~~~~
   drivers/dma/stm32-dma.c:1179:2: note: Taking false branch
           if (status =3D=3D DMA_COMPLETE || !state)
           ^
   drivers/dma/stm32-dma.c:1182:2: note: Loop condition is false.  Exiting =
loop
           spin_lock_irqsave(&chan->vchan.lock, flags);
           ^
   include/linux/spinlock.h:393:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:254:2: note: expanded from macro 'raw_spin_lock=
_irqsave'
           do {                                            \
           ^
   drivers/dma/stm32-dma.c:1182:2: note: Loop condition is false.  Exiting =
loop
           spin_lock_irqsave(&chan->vchan.lock, flags);
           ^
   include/linux/spinlock.h:391:43: note: expanded from macro 'spin_lock_ir=
qsave'
   #define spin_lock_irqsave(lock, flags)                          \
                                                                   ^
   drivers/dma/stm32-dma.c:1183:10: note: Value assigned to field 'desc'
           vdesc =3D vchan_find_desc(&chan->vchan, cookie);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/dma/stm32-dma.c:1184:6: note: Assuming field 'desc' is null
           if (chan->desc && cookie =3D=3D chan->desc->vdesc.tx.cookie)
               ^~~~~~~~~~
   drivers/dma/stm32-dma.c:1184:17: note: Left side of '&&' is false
           if (chan->desc && cookie =3D=3D chan->desc->vdesc.tx.cookie)
                          ^
   drivers/dma/stm32-dma.c:1187:11: note: Assuming 'vdesc' is non-null
           else if (vdesc)
                    ^~~~~
   drivers/dma/stm32-dma.c:1187:7: note: Taking true branch
           else if (vdesc)
                ^
   drivers/dma/stm32-dma.c:1188:13: note: Calling 'stm32_dma_desc_residue'
                   residue =3D stm32_dma_desc_residue(chan,
                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/dma/stm32-dma.c:1137:12: note: Calling 'stm32_dma_get_remaining_=
bytes'
           residue =3D stm32_dma_get_remaining_bytes(chan);
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/dma/stm32-dma.c:1057:36: note: Calling 'stm32_dma_get_dev'
           struct stm32_dma_device *dmadev =3D stm32_dma_get_dev(chan);
                                             ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/dma/stm32-dma.c:223:9: note: Left side of '&&' is false
           return container_of(chan->vchan.chan.device, struct stm32_dma_de=
vice,
                  ^
   include/linux/kernel.h:495:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/dma/stm32-dma.c:223:9: note: Taking false branch
           return container_of(chan->vchan.chan.device, struct stm32_dma_de=
vice,
                  ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:302:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/dma/stm32-dma.c:223:9: note: Loop condition is false.  Exiting l=
oop
           return container_of(chan->vchan.chan.device, struct stm32_dma_de=
vice,
                  ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:300:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/dma/stm32-dma.c:223:2: note: Returning without writing to 'chan-=
>desc'
           return container_of(chan->vchan.chan.device, struct stm32_dma_de=
vice,
           ^
   drivers/dma/stm32-dma.c:1057:36: note: Returning from 'stm32_dma_get_dev'
           struct stm32_dma_device *dmadev =3D stm32_dma_get_dev(chan);
                                             ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/dma/stm32-dma.c:1063:2: note: Returning without writing to 'chan=
->desc'
--
           ^
   include/linux/list.h:716:7: note: expanded from macro 'list_for_each_ent=
ry_safe'
                   n =3D list_next_entry(pos, member);                     =
  \
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:555:2: note: expanded from macro 'list_next_entry'
           list_entry((pos)->member.next, typeof(*(pos)), member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:494:25: note: expanded from macro 'container_of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
                                  ^~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
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
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (3 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   drivers/gpu/drm/mgag200/mgag200_mode.c:98:2: warning: Value stored to 's=
tatus' is never read [clang-analyzer-deadcode.DeadStores]
           status =3D 0;
           ^        ~
   drivers/gpu/drm/mgag200/mgag200_mode.c:98:2: note: Value stored to 'stat=
us' is never read
           status =3D 0;
           ^        ~
>> drivers/gpu/drm/mgag200/mgag200_mode.c:220:21: warning: Value stored to =
'dev' during its initialization is never read [clang-analyzer-deadcode.Dead=
Stores]
           struct drm_device *dev =3D &mdev->base;
                              ^~~   ~~~~~~~~~~~
   drivers/gpu/drm/mgag200/mgag200_mode.c:220:21: note: Value stored to 'de=
v' during its initialization is never read
           struct drm_device *dev =3D &mdev->base;
                              ^~~   ~~~~~~~~~~~
   drivers/gpu/drm/mgag200/mgag200_mode.c:480:21: warning: Value stored to =
'dev' during its initialization is never read [clang-analyzer-deadcode.Dead=
Stores]
           struct drm_device *dev =3D &mdev->base;
                              ^~~   ~~~~~~~~~~~
   drivers/gpu/drm/mgag200/mgag200_mode.c:480:21: note: Value stored to 'de=
v' during its initialization is never read
           struct drm_device *dev =3D &mdev->base;
                              ^~~   ~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/gpu/drm/mgag200/mgag200_pll.c:204:14: warning: Although the valu=
e stored to 's' is used in the enclosing expression, the value is never act=
ually read from 's' [clang-analyzer-deadcode.DeadStores]
           m =3D n =3D p =3D s =3D 0;
                       ^   ~
   drivers/gpu/drm/mgag200/mgag200_pll.c:204:14: note: Although the value s=
tored to 's' is used in the enclosing expression, the value is never actual=
ly read from 's'
           m =3D n =3D p =3D s =3D 0;
                       ^   ~
   drivers/gpu/drm/mgag200/mgag200_pll.c:953:21: warning: Value stored to '=
dev' during its initialization is never read [clang-analyzer-deadcode.DeadS=
tores]
           struct drm_device *dev =3D &mdev->base;
                              ^~~   ~~~~~~~~~~~
   drivers/gpu/drm/mgag200/mgag200_pll.c:953:21: note: Value stored to 'dev=
' during its initialization is never read
           struct drm_device *dev =3D &mdev->base;
                              ^~~   ~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   drivers/bus/mhi/core/boot.c:28:17: warning: Value stored to 'dev' during=
 its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D &mhi_cntrl->mhi_dev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/bus/mhi/core/boot.c:28:17: note: Value stored to 'dev' during it=
s initialization is never read
           struct device *dev =3D &mhi_cntrl->mhi_dev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/bus/mhi/core/boot.c:121:3: warning: Value stored to 'ee' is neve=
r read [clang-analyzer-deadcode.DeadStores]
                   ee =3D mhi_get_exec_env(mhi_cntrl);
                   ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/bus/mhi/core/boot.c:121:3: note: Value stored to 'ee' is never r=
ead
                   ee =3D mhi_get_exec_env(mhi_cntrl);
                   ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/bus/mhi/core/boot.c:143:2: warning: Value stored to 'ret' is nev=
er read [clang-analyzer-deadcode.DeadStores]
           ret =3D mhi_read_reg(mhi_cntrl, base, BHIE_RXVECSTATUS_OFFS, &rx=
_status);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   drivers/bus/mhi/core/boot.c:143:2: note: Value stored to 'ret' is never =
read
           ret =3D mhi_read_reg(mhi_cntrl, base, BHIE_RXVECSTATUS_OFFS, &rx=
_status);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   drivers/bus/mhi/core/boot.c:158:17: warning: Value stored to 'dev' durin=
g its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D &mhi_cntrl->mhi_dev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/bus/mhi/core/boot.c:158:17: note: Value stored to 'dev' during i=
ts initialization is never read
           struct device *dev =3D &mhi_cntrl->mhi_dev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/bus/mhi/core/boot.c:183:17: warning: Value stored to 'dev' durin=
g its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D &mhi_cntrl->mhi_dev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/bus/mhi/core/boot.c:183:17: note: Value stored to 'dev' during i=
ts initialization is never read
           struct device *dev =3D &mhi_cntrl->mhi_dev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/phy/phy-core.c:307:2: warning: Value stored to 'ret' is never re=
ad [clang-analyzer-deadcode.DeadStores]
           ret =3D 0; /* Override possible ret =3D=3D -ENOTSUPP */
           ^     ~
   drivers/phy/phy-core.c:307:2: note: Value stored to 'ret' is never read
           ret =3D 0; /* Override possible ret =3D=3D -ENOTSUPP */
           ^     ~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   fs/fscache/object.c:450:25: warning: Value stored to 'cookie' during its=
 initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct fscache_cookie *cookie =3D object->cookie;
                                  ^~~~~~   ~~~~~~~~~~~~~~
   fs/fscache/object.c:450:25: note: Value stored to 'cookie' during its in=
itialization is never read
           struct fscache_cookie *cookie =3D object->cookie;
--
   drivers/dma/amba-pl08x.c:2211:26: note: Assuming field 'at' is non-null
           if (!plchan->phychan && !plchan->at) {
                                   ^~~~~~~~~~~
   drivers/dma/amba-pl08x.c:2211:2: note: Taking false branch
           if (!plchan->phychan && !plchan->at) {
           ^
   drivers/dma/amba-pl08x.c:2216:23: note: Passing null pointer value via 1=
st parameter 'ch'
           pl08x_pause_phy_chan(plchan->phychan);
                                ^~~~~~~~~~~~~~~
   drivers/dma/amba-pl08x.c:2216:2: note: Calling 'pl08x_pause_phy_chan'
           pl08x_pause_phy_chan(plchan->phychan);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/dma/amba-pl08x.c:587:6: note: Access to field 'ftdmac020' result=
s in a dereference of a null pointer (loaded from variable 'ch')
           if (ch->ftdmac020) {
               ^~
   drivers/dma/amba-pl08x.c:615:6: warning: Access to field 'ftdmac020' res=
ults in a dereference of a null pointer (loaded from variable 'ch') [clang-=
analyzer-core.NullDereference]
           if (ch->ftdmac020) {
               ^
   drivers/dma/amba-pl08x.c:2233:2: note: Value assigned to field 'phychan'
           spin_lock_irqsave(&plchan->vc.lock, flags);
           ^
   include/linux/spinlock.h:393:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:256:11: note: expanded from macro 'raw_spin_loc=
k_irqsave'
                   flags =3D _raw_spin_lock_irqsave(lock);   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/dma/amba-pl08x.c:2233:2: note: Loop condition is false.  Exiting=
 loop
           spin_lock_irqsave(&plchan->vc.lock, flags);
           ^
   include/linux/spinlock.h:393:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:254:2: note: expanded from macro 'raw_spin_lock=
_irqsave'
           do {                                            \
           ^
   drivers/dma/amba-pl08x.c:2233:2: note: Loop condition is false.  Exiting=
 loop
           spin_lock_irqsave(&plchan->vc.lock, flags);
           ^
   include/linux/spinlock.h:391:43: note: expanded from macro 'spin_lock_ir=
qsave'
   #define spin_lock_irqsave(lock, flags)                          \
                                                                   ^
   drivers/dma/amba-pl08x.c:2234:6: note: Assuming field 'phychan' is null
           if (!plchan->phychan && !plchan->at) {
               ^~~~~~~~~~~~~~~~
   drivers/dma/amba-pl08x.c:2234:6: note: Left side of '&&' is true
   drivers/dma/amba-pl08x.c:2234:26: note: Assuming field 'at' is non-null
           if (!plchan->phychan && !plchan->at) {
                                   ^~~~~~~~~~~
   drivers/dma/amba-pl08x.c:2234:2: note: Taking false branch
           if (!plchan->phychan && !plchan->at) {
           ^
   drivers/dma/amba-pl08x.c:2239:24: note: Passing null pointer value via 1=
st parameter 'ch'
           pl08x_resume_phy_chan(plchan->phychan);
                                 ^~~~~~~~~~~~~~~
   drivers/dma/amba-pl08x.c:2239:2: note: Calling 'pl08x_resume_phy_chan'
           pl08x_resume_phy_chan(plchan->phychan);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/dma/amba-pl08x.c:615:6: note: Access to field 'ftdmac020' result=
s in a dereference of a null pointer (loaded from variable 'ch')
           if (ch->ftdmac020) {
               ^~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/video/fbdev/riva/fbdev.c:499:4: warning: Value stored to 'tmp' i=
s never read [clang-analyzer-deadcode.DeadStores]
                           tmp =3D 0;
                           ^     ~
   drivers/video/fbdev/riva/fbdev.c:499:4: note: Value stored to 'tmp' is n=
ever read
                           tmp =3D 0;
                           ^     ~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
>> drivers/video/fbdev/vt8500lcdfb.c:280:2: warning: Value stored to 'ret' =
is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D -ENOMEM;
           ^     ~~~~~~~
   drivers/video/fbdev/vt8500lcdfb.c:280:2: note: Value stored to 'ret' is =
never read
           ret =3D -ENOMEM;
           ^     ~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/video/fbdev/s1d13xxxfb.c:681:2: warning: Value stored to 'is_dua=
l' is never read [clang-analyzer-deadcode.DeadStores]
           is_dual =3D (panel & 0x02) !=3D 0;
           ^         ~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/s1d13xxxfb.c:681:2: note: Value stored to 'is_dual' =
is never read
           is_dual =3D (panel & 0x02) !=3D 0;
           ^         ~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/s1d13xxxfb.c:683:2: warning: Value stored to 'lcd_bp=
p' is never read [clang-analyzer-deadcode.DeadStores]
           lcd_bpp =3D s1d13xxxfb_width_tab[is_tft][(panel >> 4) & 3];
           ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/s1d13xxxfb.c:683:2: note: Value stored to 'lcd_bpp' =
is never read
           lcd_bpp =3D s1d13xxxfb_width_tab[is_tft][(panel >> 4) & 3];
           ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/video/fbdev/s3c-fb.c:492:16: warning: Value stored to 'buf' duri=
ng its initialization is never read [clang-analyzer-deadcode.DeadStores]
           void __iomem *buf =3D regs;
                         ^~~   ~~~~
   drivers/video/fbdev/s3c-fb.c:492:16: note: Value stored to 'buf' during =
its initialization is never read
           void __iomem *buf =3D regs;
                         ^~~   ~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/video/fbdev/sm501fb.c:1965:5: warning: Call to function 'strcpy'=
 is insecure as it does not provide bounding of the memory buffer. Replace =
unbounded copy functions with analogous functions that support length argum=
ents such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                                   strcpy(fb_mode, cp);
                                   ^~~~~~
   drivers/video/fbdev/sm501fb.c:1965:5: note: Call to function 'strcpy' is=
 insecure as it does not provide bounding of the memory buffer. Replace unb=
ounded copy functions with analogous functions that support length argument=
s such as 'strlcpy'. CWE-119
                                   strcpy(fb_mode, cp);
                                   ^~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   kernel/kallsyms.c:436:3: warning: Call to function 'strcpy' is insecure =
as it does not provide bounding of the memory buffer. Replace unbounded cop=
y functions with analogous functions that support length arguments such as =
'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(buffer, name);
                   ^~~~~~
   kernel/kallsyms.c:436:3: note: Call to function 'strcpy' is insecure as =
it does not provide bounding of the memory buffer. Replace unbounded copy f=
unctions with analogous functions that support length arguments such as 'st=
rlcpy'. CWE-119
                   strcpy(buffer, name);
                   ^~~~~~
   Suppressed 4 warnings (3 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   kernel/kexec_core.c:771:4: warning: Value stored to 'addr' is never read=
 [clang-analyzer-deadcode.DeadStores]
                           addr =3D old_addr;
                           ^      ~~~~~~~~
   kernel/kexec_core.c:771:4: note: Value stored to 'addr' is never read
                           addr =3D old_addr;
                           ^      ~~~~~~~~
   kernel/kexec_core.c:791:2: warning: Value stored to 'result' is never re=
ad [clang-analyzer-deadcode.DeadStores]
           result =3D 0;
           ^        ~
   kernel/kexec_core.c:791:2: note: Value stored to 'result' is never read
           result =3D 0;
           ^        ~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   arch/arm/include/asm/atomic.h:223:1: warning: Access to field 'counter' =
results in a dereference of a null pointer (loaded from variable 'v') [clan=
g-analyzer-core.NullDereference]
   ATOMIC_OPS(add, +=3D, add)
   ^
   arch/arm/include/asm/atomic.h:221:2: note: expanded from macro 'ATOMIC_O=
PS'
           ATOMIC_FETCH_OP(op, c_op, asm_op)
           ^
   arch/arm/include/asm/atomic.h:193:8: note: expanded from macro 'ATOMIC_F=
ETCH_OP'
           val =3D v->counter;                                             =
  \
                 ^
   kernel/cgroup/cgroup.c:6248:6: note: Assuming field 'pid' is 0
           if (likely(child->pid)) {
               ^
   include/linux/compiler.h:77:38: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                             ^~~~
   kernel/cgroup/cgroup.c:6248:2: note: Taking false branch
           if (likely(child->pid)) {
--
   drivers/mtd/lpddr/lpddr_cmds.c:446:21: note: 'len' is >=3D field 'bankwi=
dth'
                   if (!word_gap && (len < map_bankwidth(map)))
                                     ^~~
   drivers/mtd/lpddr/lpddr_cmds.c:446:3: note: Taking false branch
                   if (!word_gap && (len < map_bankwidth(map)))
                   ^
   drivers/mtd/lpddr/lpddr_cmds.c:454:7: note: Assuming 'len' is not equal =
to 0
                   if (!len || word_gap =3D=3D map_bankwidth(map)) {
                       ^~~~
   drivers/mtd/lpddr/lpddr_cmds.c:454:7: note: Left side of '||' is false
   drivers/mtd/lpddr/lpddr_cmds.c:454:15: note: Assuming 'word_gap' is not =
equal to field 'bankwidth'
                   if (!len || word_gap =3D=3D map_bankwidth(map)) {
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/lpddr/lpddr_cmds.c:454:3: note: Taking false branch
                   if (!len || word_gap =3D=3D map_bankwidth(map)) {
                   ^
   drivers/mtd/lpddr/lpddr_cmds.c:461:7: note: Assuming 'vec_seek' is equal=
 to field 'iov_len'
                   if (vec_seek =3D=3D vec->iov_len) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/lpddr/lpddr_cmds.c:461:3: note: Taking true branch
                   if (vec_seek =3D=3D vec->iov_len) {
                   ^
   drivers/mtd/lpddr/lpddr_cmds.c:438:2: note: Loop condition is true. Exec=
ution continues on line 439
           do {
           ^
   drivers/mtd/lpddr/lpddr_cmds.c:441:24: note: The left operand of '-' is =
a garbage value
                   if (n > vec->iov_len - vec_seek)
                           ~~~~~~~~~~~~ ^
   include/linux/mtd/pfow.h:107:30: warning: The result of the left shift i=
s undefined due to shifting by '32', which is greater or equal to the width=
 of type 'int' [clang-analyzer-core.UndefinedBinaryOperatorResult]
           map_write(map, CMD(adr & ((1<<bits_per_chip) - 1)),
                                       ^
   drivers/mtd/lpddr/lpddr_cmds.c:758:9: note: Calling 'do_xxlock'
           return do_xxlock(mtd, ofs, len, DO_XXLOCK_UNLOCK);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/lpddr/lpddr_cmds.c:726:6: note: 'ret' is 0
           if (ret) {
               ^~~
   drivers/mtd/lpddr/lpddr_cmds.c:726:2: note: Taking false branch
           if (ret) {
           ^
   drivers/mtd/lpddr/lpddr_cmds.c:731:6: note: 'thunk' is not equal to DO_X=
XLOCK_LOCK
           if (thunk =3D=3D DO_XXLOCK_LOCK) {
               ^~~~~
   drivers/mtd/lpddr/lpddr_cmds.c:731:2: note: Taking false branch
           if (thunk =3D=3D DO_XXLOCK_LOCK) {
           ^
   drivers/mtd/lpddr/lpddr_cmds.c:734:13: note: 'thunk' is equal to DO_XXLO=
CK_UNLOCK
           } else if (thunk =3D=3D DO_XXLOCK_UNLOCK) {
                      ^~~~~
   drivers/mtd/lpddr/lpddr_cmds.c:734:9: note: Taking true branch
           } else if (thunk =3D=3D DO_XXLOCK_UNLOCK) {
                  ^
   drivers/mtd/lpddr/lpddr_cmds.c:735:3: note: Calling 'send_pfow_command'
                   send_pfow_command(map, LPDDR_UNLOCK_BLOCK, adr, adr + le=
n, NULL);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/linux/mtd/pfow.h:104:2: note: 'bits_per_chip' initialized here
           int bits_per_chip =3D map_bankwidth(map) * 8;
           ^~~~~~~~~~~~~~~~~
   include/linux/mtd/pfow.h:107:30: note: The result of the left shift is u=
ndefined due to shifting by '32', which is greater or equal to the width of=
 type 'int'
           map_write(map, CMD(adr & ((1<<bits_per_chip) - 1)),
                                       ^
   include/linux/mtd/qinfo.h:86:32: note: expanded from macro 'CMD'
   #define CMD(x) lpddr_build_cmd(x, map)
                                  ^
   include/linux/mtd/map.h:455:58: note: expanded from macro 'map_write'
   #define map_write(map, datum, ofs) inline_map_write(map, datum, ofs)
                                                            ^~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
>> drivers/gpu/drm/exynos/exynos_drm_dsi.c:670:3: warning: Value stored to =
'esc_clk' is never read [clang-analyzer-deadcode.DeadStores]
                   esc_clk =3D byte_clk / esc_div;
                   ^         ~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/exynos/exynos_drm_dsi.c:670:3: note: Value stored to 'es=
c_clk' is never read
                   esc_clk =3D byte_clk / esc_div;
                   ^         ~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/exynos/exynos_drm_dsi.c:1060:4: warning: Value stored to=
 'length' is never read [clang-analyzer-deadcode.DeadStores]
                           length =3D xfer->rx_len;
                           ^        ~~~~~~~~~~~~
   drivers/gpu/drm/exynos/exynos_drm_dsi.c:1060:4: note: Value stored to 'l=
ength' is never read
                           length =3D xfer->rx_len;
                           ^        ~~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   drivers/gpu/drm/exynos/exynos_mixer.c:464:9: warning: The result of the =
left shift is undefined because the left operand is negative [clang-analyze=
r-core.UndefinedBinaryOperatorResult]
                                       MXR_LAYER_CFG_GRP0_MASK);
                                       ^
   drivers/gpu/drm/exynos/regs-mixer.h:153:34: note: expanded from macro 'M=
XR_LAYER_CFG_GRP0_MASK'
   #define MXR_LAYER_CFG_GRP0_MASK         MXR_LAYER_CFG_GRP0_VAL(~0)
                                           ^
   drivers/gpu/drm/exynos/regs-mixer.h:152:35: note: expanded from macro 'M=
XR_LAYER_CFG_GRP0_VAL'
   #define MXR_LAYER_CFG_GRP0_VAL(x)       MXR_MASK_VAL(x, 7, 4)
                                           ^
   drivers/gpu/drm/exynos/regs-mixer.h:70:10: note: expanded from macro 'MX=
R_MASK_VAL'
           (((val) << (low_bit)) & MXR_MASK(high_bit, low_bit))
                   ^
   drivers/gpu/drm/exynos/exynos_mixer.c:1031:6: note: Assuming the conditi=
on is false
           if (!test_bit(MXR_BIT_POWERED, &ctx->flags))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/exynos/exynos_mixer.c:1031:2: note: Taking false branch
           if (!test_bit(MXR_BIT_POWERED, &ctx->flags))
           ^
   drivers/gpu/drm/exynos/exynos_mixer.c:1037:2: note: Loop condition is tr=
ue.  Entering loop body
           for (i =3D 0; i < MIXER_WIN_NR; i++)
           ^
   drivers/gpu/drm/exynos/exynos_mixer.c:1038:3: note: Calling 'mixer_disab=
le_plane'
                   mixer_disable_plane(crtc, &ctx->planes[i]);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/exynos/exynos_mixer.c:973:6: note: Assuming the conditio=
n is false
           if (!test_bit(MXR_BIT_POWERED, &mixer_ctx->flags))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/exynos/exynos_mixer.c:973:2: note: Taking false branch
           if (!test_bit(MXR_BIT_POWERED, &mixer_ctx->flags))
           ^
   drivers/gpu/drm/exynos/exynos_mixer.c:976:2: note: Loop condition is fal=
se.  Exiting loop
           spin_lock_irqsave(&mixer_ctx->reg_slock, flags);
           ^
   include/linux/spinlock.h:393:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:254:2: note: expanded from macro 'raw_spin_lock=
_irqsave'
           do {                                            \
           ^
   drivers/gpu/drm/exynos/exynos_mixer.c:976:2: note: Loop condition is fal=
se.  Exiting loop
           spin_lock_irqsave(&mixer_ctx->reg_slock, flags);
           ^
   include/linux/spinlock.h:391:43: note: expanded from macro 'spin_lock_ir=
qsave'
   #define spin_lock_irqsave(lock, flags)                          \
                                                                   ^
   drivers/gpu/drm/exynos/exynos_mixer.c:977:2: note: Calling 'mixer_cfg_la=
yer'
           mixer_cfg_layer(mixer_ctx, plane->index, 0, false);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/exynos/exynos_mixer.c:457:12: note: 'enable' is false
           u32 val =3D enable ? ~0 : 0;
                     ^~~~~~
   drivers/gpu/drm/exynos/exynos_mixer.c:457:12: note: '?' condition is fal=
se
   drivers/gpu/drm/exynos/exynos_mixer.c:459:2: note: Control jumps to 'cas=
e 0:'  at line 460
           switch (win) {
           ^
   drivers/gpu/drm/exynos/exynos_mixer.c:464:9: note: The result of the lef=
t shift is undefined because the left operand is negative
                                       MXR_LAYER_CFG_GRP0_MASK);
                                       ^
   drivers/gpu/drm/exynos/regs-mixer.h:153:34: note: expanded from macro 'M=
XR_LAYER_CFG_GRP0_MASK'
   #define MXR_LAYER_CFG_GRP0_MASK         MXR_LAYER_CFG_GRP0_VAL(~0)
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/exynos/regs-mixer.h:152:35: note: expanded from macro 'M=
XR_LAYER_CFG_GRP0_VAL'
   #define MXR_LAYER_CFG_GRP0_VAL(x)       MXR_MASK_VAL(x, 7, 4)
                                           ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/exynos/regs-mixer.h:70:10: note: expanded from macro 'MX=
R_MASK_VAL'
           (((val) << (low_bit)) & MXR_MASK(high_bit, low_bit))
             ~~~~~ ^
   drivers/gpu/drm/exynos/exynos_mixer.c:470:9: warning: The result of the =
left shift is undefined because the left operand is negative [clang-analyze=
r-core.UndefinedBinaryOperatorResult]
                                       MXR_LAYER_CFG_GRP1_MASK);
                                       ^
   drivers/gpu/drm/exynos/regs-mixer.h:151:34: note: expanded from macro 'M=
XR_LAYER_CFG_GRP1_MASK'
   #define MXR_LAYER_CFG_GRP1_MASK         MXR_LAYER_CFG_GRP1_VAL(~0)
                                           ^
   drivers/gpu/drm/exynos/regs-mixer.h:150:35: note: expanded from macro 'M=
XR_LAYER_CFG_GRP1_VAL'
   #define MXR_LAYER_CFG_GRP1_VAL(x)       MXR_MASK_VAL(x, 11, 8)
                                           ^
   drivers/gpu/drm/exynos/regs-mixer.h:70:10: note: expanded from macro 'MX=
R_MASK_VAL'
           (((val) << (low_bit)) & MXR_MASK(high_bit, low_bit))
                   ^
   drivers/gpu/drm/exynos/exynos_mixer.c:1031:6: note: Assuming the conditi=
on is false
           if (!test_bit(MXR_BIT_POWERED, &ctx->flags))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/exynos/exynos_mixer.c:1031:2: note: Taking false branch
           if (!test_bit(MXR_BIT_POWERED, &ctx->flags))
           ^
   drivers/gpu/drm/exynos/exynos_mixer.c:1037:2: note: Loop condition is tr=
ue.  Entering loop body
--
           ^
   drivers/nvmem/core.c:1433:7: note: Returning from '__nvmem_cell_read'
           rc =3D __nvmem_cell_read(nvmem, cell, buf, len);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvmem/core.c:1434:6: note: 'rc' is not equal to 0
           if (rc) {
               ^~
   drivers/nvmem/core.c:1434:2: note: Taking true branch
           if (rc) {
           ^
   drivers/nvmem/core.c:1634:8: note: Returning from 'nvmem_cell_read'
           buf =3D nvmem_cell_read(cell, len);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvmem/core.c:1636:6: note: Calling 'IS_ERR'
           if (IS_ERR(buf))
               ^~~~~~~~~~~
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
   drivers/nvmem/core.c:1636:6: note: Returning from 'IS_ERR'
           if (IS_ERR(buf))
               ^~~~~~~~~~~
   drivers/nvmem/core.c:1636:2: note: Taking false branch
           if (IS_ERR(buf))
           ^
   drivers/nvmem/core.c:1643:6: note: Assuming 'nbits' is 0
           if (nbits)
               ^~~~~
   drivers/nvmem/core.c:1643:2: note: Taking false branch
           if (nbits)
           ^
   drivers/nvmem/core.c:1646:11: note: The left operand of '>' is a garbage=
 value
           if (*len > max_len) {
               ~~~~ ^
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/gpu/drm/exynos/exynos_drm_plane.c:148:2: warning: Value stored t=
o 'exynos_state' is never read [clang-analyzer-deadcode.DeadStores]
           exynos_state =3D to_exynos_plane_state(plane->state);
           ^              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/exynos/exynos_drm_plane.c:148:2: note: Value stored to '=
exynos_state' is never read
           exynos_state =3D to_exynos_plane_state(plane->state);
           ^              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/gpu/drm/exynos/exynos_drm_dma.c:87:29: warning: Value stored to =
'priv' during its initialization is never read [clang-analyzer-deadcode.Dea=
dStores]
           struct exynos_drm_private *priv =3D drm_dev->dev_private;
                                      ^~~~   ~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/exynos/exynos_drm_dma.c:87:29: note: Value stored to 'pr=
iv' during its initialization is never read
           struct exynos_drm_private *priv =3D drm_dev->dev_private;
                                      ^~~~   ~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/exynos/exynos_drm_dma.c:138:29: warning: Value stored to=
 'priv' during its initialization is never read [clang-analyzer-deadcode.De=
adStores]
           struct exynos_drm_private *priv =3D drm->dev_private;
                                      ^~~~   ~~~~~~~~~~~~~~~~
   drivers/gpu/drm/exynos/exynos_drm_dma.c:138:29: note: Value stored to 'p=
riv' during its initialization is never read
           struct exynos_drm_private *priv =3D drm->dev_private;
                                      ^~~~   ~~~~~~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
>> drivers/i2c/busses/i2c-qcom-geni.c:170:6: warning: Value stored to 'm_cm=
d' during its initialization is never read [clang-analyzer-deadcode.DeadSto=
res]
           u32 m_cmd =3D readl_relaxed(gi2c->se.base + SE_GENI_M_CMD0);
               ^~~~~
   drivers/i2c/busses/i2c-qcom-geni.c:170:6: note: Value stored to 'm_cmd' =
during its initialization is never read
           u32 m_cmd =3D readl_relaxed(gi2c->se.base + SE_GENI_M_CMD0);
               ^~~~~
>> drivers/i2c/busses/i2c-qcom-geni.c:171:6: warning: Value stored to 'm_st=
at' during its initialization is never read [clang-analyzer-deadcode.DeadSt=
ores]
           u32 m_stat =3D readl_relaxed(gi2c->se.base + SE_GENI_M_IRQ_STATU=
S);
               ^~~~~~
   drivers/i2c/busses/i2c-qcom-geni.c:171:6: note: Value stored to 'm_stat'=
 during its initialization is never read
           u32 m_stat =3D readl_relaxed(gi2c->se.base + SE_GENI_M_IRQ_STATU=
S);
               ^~~~~~
>> drivers/i2c/busses/i2c-qcom-geni.c:172:6: warning: Value stored to 'geni=
_s' during its initialization is never read [clang-analyzer-deadcode.DeadSt=
ores]
           u32 geni_s =3D readl_relaxed(gi2c->se.base + SE_GENI_STATUS);
               ^~~~~~
   drivers/i2c/busses/i2c-qcom-geni.c:172:6: note: Value stored to 'geni_s'=
 during its initialization is never read
           u32 geni_s =3D readl_relaxed(gi2c->se.base + SE_GENI_STATUS);
               ^~~~~~
>> drivers/i2c/busses/i2c-qcom-geni.c:173:6: warning: Value stored to 'geni=
_ios' during its initialization is never read [clang-analyzer-deadcode.Dead=
Stores]
           u32 geni_ios =3D readl_relaxed(gi2c->se.base + SE_GENI_IOS);
               ^~~~~~~~
   drivers/i2c/busses/i2c-qcom-geni.c:173:6: note: Value stored to 'geni_io=
s' during its initialization is never read
           u32 geni_ios =3D readl_relaxed(gi2c->se.base + SE_GENI_IOS);
               ^~~~~~~~
>> drivers/i2c/busses/i2c-qcom-geni.c:178:3: warning: Value stored to 'rx_s=
t' is never read [clang-analyzer-deadcode.DeadStores]
                   rx_st =3D readl_relaxed(gi2c->se.base + SE_DMA_RX_IRQ_ST=
AT);
                   ^
   drivers/i2c/busses/i2c-qcom-geni.c:178:3: note: Value stored to 'rx_st' =
is never read
>> drivers/i2c/busses/i2c-qcom-geni.c:179:3: warning: Value stored to 'tx_s=
t' is never read [clang-analyzer-deadcode.DeadStores]
                   tx_st =3D readl_relaxed(gi2c->se.base + SE_DMA_TX_IRQ_ST=
AT);
                   ^
   drivers/i2c/busses/i2c-qcom-geni.c:179:3: note: Value stored to 'tx_st' =
is never read
   drivers/i2c/busses/i2c-qcom-geni.c:181:3: warning: Value stored to 'rx_s=
t' is never read [clang-analyzer-deadcode.DeadStores]
                   rx_st =3D readl_relaxed(gi2c->se.base + SE_GENI_RX_FIFO_=
STATUS);
                   ^
   drivers/i2c/busses/i2c-qcom-geni.c:181:3: note: Value stored to 'rx_st' =
is never read
   drivers/i2c/busses/i2c-qcom-geni.c:182:3: warning: Value stored to 'tx_s=
t' is never read [clang-analyzer-deadcode.DeadStores]
                   tx_st =3D readl_relaxed(gi2c->se.base + SE_GENI_TX_FIFO_=
STATUS);
                   ^
   drivers/i2c/busses/i2c-qcom-geni.c:182:3: note: Value stored to 'tx_st' =
is never read
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/phy/rockchip/phy-rockchip-inno-csidphy.c:275:9: warning: The res=
ult of the right shift is undefined due to shifting by '32', which is great=
er or equal to the width of type 'unsigned long' [clang-analyzer-core.Undef=
inedBinaryOperatorResult]
                         GENMASK(priv->config.lanes - 1, 0));
                         ^
   include/linux/bits.h:38:31: note: expanded from macro 'GENMASK'
           (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
                                        ^~~~~~~~~~~~~~~
   include/linux/bits.h:36:11: note: expanded from macro '__GENMASK'
            (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
                    ^  ~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/phy/rockchip/phy-rockchip-inno-csidphy.c:220:6: note: Assuming '=
ret' is >=3D 0
           if (ret < 0)
               ^~~~~~~
   drivers/phy/rockchip/phy-rockchip-inno-csidphy.c:220:2: note: Taking fal=
se branch
           if (ret < 0)
           ^
   drivers/phy/rockchip/phy-rockchip-inno-csidphy.c:224:6: note: 'ret' is >=
=3D 0
           if (ret < 0) {
               ^~~
   drivers/phy/rockchip/phy-rockchip-inno-csidphy.c:224:2: note: Taking fal=
se branch
           if (ret < 0) {
           ^
   drivers/phy/rockchip/phy-rockchip-inno-csidphy.c:230:6: note: Assuming f=
ield 'pwrctl_offset' is < 0
           if (drv_data->pwrctl_offset >=3D 0)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/phy/rockchip/phy-rockchip-inno-csidphy.c:230:2: note: Taking fal=
se branch
           if (drv_data->pwrctl_offset >=3D 0)
           ^
   drivers/phy/rockchip/phy-rockchip-inno-csidphy.c:236:8: note: Taking fal=
se branch
           val =3D FIELD_PREP(CSIDPHY_CTRL_LANE_ENABLE_MASK, GENMASK(priv->=
config.lanes - 1, 0)) |
                 ^
   include/linux/bitfield.h:94:3: note: expanded from macro 'FIELD_PREP'
                   __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
                   ^
   include/linux/bitfield.h:46:3: note: expanded from macro '__BF_FIELD_CHE=
CK'
                   BUILD_BUG_ON_MSG(!__builtin_constant_p(_mask),          \
                   ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:302:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/phy/rockchip/phy-rockchip-inno-csidphy.c:236:8: note: Loop condi=
tion is false.  Exiting loop
           val =3D FIELD_PREP(CSIDPHY_CTRL_LANE_ENABLE_MASK, GENMASK(priv->=
config.lanes - 1, 0)) |
                 ^
   include/linux/bitfield.h:94:3: note: expanded from macro 'FIELD_PREP'
                   __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
                   ^
   include/linux/bitfield.h:46:3: note: expanded from macro '__BF_FIELD_CHE=
CK'
                   BUILD_BUG_ON_MSG(!__builtin_constant_p(_mask),          \
                   ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:300:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/phy/rockchip/phy-rockchip-inno-csidphy.c:236:8: note: Taking fal=
se branch
           val =3D FIELD_PREP(CSIDPHY_CTRL_LANE_ENABLE_MASK, GENMASK(priv->=
config.lanes - 1, 0)) |
                 ^
   include/linux/bitfield.h:94:3: note: expanded from macro 'FIELD_PREP'
                   __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
                   ^
   include/linux/bitfield.h:48:3: note: expanded from macro '__BF_FIELD_CHE=
CK'
                   BUILD_BUG_ON_MSG((_mask) =3D=3D 0, _pfx "mask is zero");=
    \
                   ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
--
   drivers/firmware/qemu_fw_cfg.c:597:10: note: Calling 'kzalloc'
           entry =3D kzalloc(sizeof(*entry), GFP_KERNEL);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:721:9: note: Calling 'kmalloc'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:579:2: note: Taking false branch
           if (__builtin_constant_p(size)) {
           ^
   include/linux/slab.h:596:2: note: Returning pointer, which participates =
in a condition later
           return __kmalloc(size, flags);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:721:9: note: Returning from 'kmalloc'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:721:2: note: Returning pointer, which participates =
in a condition later
           return kmalloc(size, flags | __GFP_ZERO);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/firmware/qemu_fw_cfg.c:597:10: note: Returning from 'kzalloc'
           entry =3D kzalloc(sizeof(*entry), GFP_KERNEL);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/firmware/qemu_fw_cfg.c:598:6: note: Assuming 'entry' is non-null
           if (!entry)
               ^~~~~~
   drivers/firmware/qemu_fw_cfg.c:598:2: note: Taking false branch
           if (!entry)
           ^
   drivers/firmware/qemu_fw_cfg.c:609:6: note: Assuming 'err' is 0
           if (err) {
               ^~~
   drivers/firmware/qemu_fw_cfg.c:609:2: note: Taking false branch
           if (err) {
           ^
   drivers/firmware/qemu_fw_cfg.c:616:6: note: Assuming 'err' is 0
           if (err)
               ^~~
   drivers/firmware/qemu_fw_cfg.c:616:2: note: Taking false branch
           if (err)
           ^
   drivers/firmware/qemu_fw_cfg.c:620:2: note: Calling 'fw_cfg_build_symlin=
k'
           fw_cfg_build_symlink(fw_cfg_fname_kset, &entry->kobj, entry->nam=
e);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   drivers/firmware/qemu_fw_cfg.c:496:2: note: 'ret' declared without an in=
itial value
           int ret;
           ^~~~~~~
   drivers/firmware/qemu_fw_cfg.c:501:6: note: Assuming 'dir' is non-null
           if (!dir || !target || !name || !*name)
               ^~~~
   drivers/firmware/qemu_fw_cfg.c:501:6: note: Left side of '||' is false
   drivers/firmware/qemu_fw_cfg.c:501:15: note: 'target' is non-null
           if (!dir || !target || !name || !*name)
                        ^~~~~~
   drivers/firmware/qemu_fw_cfg.c:501:6: note: Left side of '||' is false
           if (!dir || !target || !name || !*name)
               ^
   drivers/firmware/qemu_fw_cfg.c:501:26: note: 'name' is non-null
           if (!dir || !target || !name || !*name)
                                   ^~~~
   drivers/firmware/qemu_fw_cfg.c:501:6: note: Left side of '||' is false
           if (!dir || !target || !name || !*name)
               ^
   drivers/firmware/qemu_fw_cfg.c:501:34: note: Assuming the condition is f=
alse
           if (!dir || !target || !name || !*name)
                                           ^~~~~~
   drivers/firmware/qemu_fw_cfg.c:501:2: note: Taking false branch
           if (!dir || !target || !name || !*name)
           ^
   drivers/firmware/qemu_fw_cfg.c:506:6: note: Assuming 'name_copy' is non-=
null
           if (!name_copy)
               ^~~~~~~~~~
   drivers/firmware/qemu_fw_cfg.c:506:2: note: Taking false branch
           if (!name_copy)
           ^
   drivers/firmware/qemu_fw_cfg.c:510:10: note: Assuming 'tok' is non-null
           while ((tok =3D strsep(&p, "/")) && *tok) {
                   ^~~
   drivers/firmware/qemu_fw_cfg.c:510:9: note: Left side of '&&' is true
           while ((tok =3D strsep(&p, "/")) && *tok) {
                  ^
   drivers/firmware/qemu_fw_cfg.c:510:2: note: Loop condition is false. Exe=
cution continues on line 558
           while ((tok =3D strsep(&p, "/")) && *tok) {
           ^
   drivers/firmware/qemu_fw_cfg.c:559:2: note: Undefined or garbage value r=
eturned to caller
           return ret;
           ^      ~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (3 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
>> drivers/nvmem/sunxi_sid.c:107:2: warning: Null pointer passed as 1st arg=
ument to memory copy function [clang-analyzer-unix.cstring.NullArg]
           memcpy(val, &word, bytes);
           ^      ~~~
   drivers/nvmem/sunxi_sid.c:89:9: note: Assuming 'bytes' is >=3D 4
           while (bytes >=3D 4) {
                  ^~~~~~~~~~
   drivers/nvmem/sunxi_sid.c:89:2: note: Loop condition is true.  Entering =
loop body
           while (bytes >=3D 4) {
           ^
   drivers/nvmem/sunxi_sid.c:90:9: note: Calling 'sun8i_sid_register_readou=
t'
                   ret =3D sun8i_sid_register_readout(sid, offset, val);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvmem/sunxi_sid.c:61:2: note: Loop condition is false.  Exiting =
loop
           writel(reg_val, sid->base + SUN8I_SID_PRCTL);
           ^
   arch/arm/include/asm/io.h:308:25: note: expanded from macro 'writel'
   #define writel(v,c)             ({ __iowmb(); writel_relaxed(v,c); })
                                      ^
   arch/arm/include/asm/io.h:167:20: note: expanded from macro '__iowmb'
   #define __iowmb()               wmb()
                                   ^
   arch/arm/include/asm/barrier.h:66:16: note: expanded from macro 'wmb'
   #define wmb()           __arm_heavy_mb(st)
                           ^
   arch/arm/include/asm/barrier.h:58:30: note: expanded from macro '__arm_h=
eavy_mb'
   #define __arm_heavy_mb(x...) do { dsb(x); arm_heavy_mb(); } while (0)
                                ^
   drivers/nvmem/sunxi_sid.c:63:8: note: '__sleep_us' is not equal to 0
           ret =3D readl_poll_timeout(sid->base + SUN8I_SID_PRCTL, reg_val,
                 ^
   include/linux/iopoll.h:156:2: note: expanded from macro 'readl_poll_time=
out'
           readx_poll_timeout(readl, addr, val, cond, delay_us, timeout_us)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/iopoll.h:121:2: note: expanded from macro 'readx_poll_time=
out'
           read_poll_timeout(op, val, cond, sleep_us, timeout_us, false, ad=
dr)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   include/linux/iopoll.h:42:17: note: expanded from macro 'read_poll_timeo=
ut'
           might_sleep_if((__sleep_us) !=3D 0); \
                          ^~~~~~~~~~~~
   include/linux/kernel.h:183:39: note: expanded from macro 'might_sleep_if'
   #define might_sleep_if(cond) do { if (cond) might_sleep(); } while (0)
                                         ^~~~
   drivers/nvmem/sunxi_sid.c:63:8: note: Taking true branch
           ret =3D readl_poll_timeout(sid->base + SUN8I_SID_PRCTL, reg_val,
                 ^
   include/linux/iopoll.h:156:2: note: expanded from macro 'readl_poll_time=
out'
           readx_poll_timeout(readl, addr, val, cond, delay_us, timeout_us)
           ^
   include/linux/iopoll.h:121:2: note: expanded from macro 'readx_poll_time=
out'
           read_poll_timeout(op, val, cond, sleep_us, timeout_us, false, ad=
dr)
           ^
   include/linux/iopoll.h:42:2: note: expanded from macro 'read_poll_timeou=
t'
           might_sleep_if((__sleep_us) !=3D 0); \
           ^
   include/linux/kernel.h:183:35: note: expanded from macro 'might_sleep_if'
   #define might_sleep_if(cond) do { if (cond) might_sleep(); } while (0)
                                     ^
   drivers/nvmem/sunxi_sid.c:63:8: note: Loop condition is false.  Exiting =
loop
           ret =3D readl_poll_timeout(sid->base + SUN8I_SID_PRCTL, reg_val,
                 ^
   include/linux/iopoll.h:156:2: note: expanded from macro 'readl_poll_time=
out'
           readx_poll_timeout(readl, addr, val, cond, delay_us, timeout_us)
           ^
   include/linux/iopoll.h:121:2: note: expanded from macro 'readx_poll_time=
out'
           read_poll_timeout(op, val, cond, sleep_us, timeout_us, false, ad=
dr)
           ^
   include/linux/iopoll.h:42:2: note: expanded from macro 'read_poll_timeou=
t'
           might_sleep_if((__sleep_us) !=3D 0); \
           ^
   include/linux/kernel.h:183:45: note: expanded from macro 'might_sleep_if'
   #define might_sleep_if(cond) do { if (cond) might_sleep(); } while (0)
                                               ^
   include/linux/kernel.h:132:45: note: expanded from macro 'might_sleep'
           do { __might_sleep(__FILE__, __LINE__, 0); might_resched(); } wh=
ile (0)
                                                      ^
   include/linux/kernel.h:109:26: note: expanded from macro 'might_resched'
   # define might_resched() do { } while (0)
                            ^
   drivers/nvmem/sunxi_sid.c:63:8: note: Loop condition is false.  Exiting =
loop
           ret =3D readl_poll_timeout(sid->base + SUN8I_SID_PRCTL, reg_val,
                 ^
   include/linux/iopoll.h:156:2: note: expanded from macro 'readl_poll_time=
out'
           readx_poll_timeout(readl, addr, val, cond, delay_us, timeout_us)
           ^
   include/linux/iopoll.h:121:2: note: expanded from macro 'readx_poll_time=
out'
           read_poll_timeout(op, val, cond, sleep_us, timeout_us, false, ad=
dr)
           ^
   include/linux/iopoll.h:42:2: note: expanded from macro 'read_poll_timeou=
t'
           might_sleep_if((__sleep_us) !=3D 0); \
           ^
   include/linux/kernel.h:183:45: note: expanded from macro 'might_sleep_if'
   #define might_sleep_if(cond) do { if (cond) might_sleep(); } while (0)
                                               ^
   include/linux/kernel.h:132:2: note: expanded from macro 'might_sleep'
           do { __might_sleep(__FILE__, __LINE__, 0); might_resched(); } wh=
ile (0)
           ^
   drivers/nvmem/sunxi_sid.c:63:8: note: Loop condition is false.  Exiting =
loop
           ret =3D readl_poll_timeout(sid->base + SUN8I_SID_PRCTL, reg_val,
                 ^
   include/linux/iopoll.h:156:2: note: expanded from macro 'readl_poll_time=
out'
           readx_poll_timeout(readl, addr, val, cond, delay_us, timeout_us)
--
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
                            ^~~~~~~~~~
   drivers/gpu/drm/sti/sti_hqvdp.c:1042:10: note: '?' condition is false
           dst_h =3D clamp_val(new_plane_state->crtc_h, 0, mode->vdisplay -=
 dst_y);
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
                   ^
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^
   drivers/gpu/drm/sti/sti_hqvdp.c:1042:2: note: The value 0 is assigned to=
 'dst_h'
           dst_h =3D clamp_val(new_plane_state->crtc_h, 0, mode->vdisplay -=
 dst_y);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   drivers/gpu/drm/sti/sti_hqvdp.c:1049:6: note: Assuming field 'clock' is =
not equal to 0
           if (mode->clock && !sti_hqvdp_check_hw_scaling(hqvdp, mode,
               ^~~~~~~~~~~
   drivers/gpu/drm/sti/sti_hqvdp.c:1049:6: note: Left side of '&&' is true
   drivers/gpu/drm/sti/sti_hqvdp.c:1051:21: note: Passing the value 0 via 6=
th parameter 'dst_h'
                                                          dst_w, dst_h)) {
                                                                 ^~~~~
   drivers/gpu/drm/sti/sti_hqvdp.c:1049:22: note: Calling 'sti_hqvdp_check_=
hw_scaling'
           if (mode->clock && !sti_hqvdp_check_hw_scaling(hqvdp, mode,
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/sti/sti_hqvdp.c:741:9: note: Assuming '__UNIQUE_ID___x32=
9' is > '__UNIQUE_ID___y330'
           lfw /=3D max(src_w, dst_w) * mode->clock / 1000;
                  ^
   include/linux/minmax.h:52:19: note: expanded from macro 'max'
   #define max(x, y)       __careful_cmp(x, y, >)
                           ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^~~~~~~~~~
   drivers/gpu/drm/sti/sti_hqvdp.c:741:9: note: '?' condition is true
           lfw /=3D max(src_w, dst_w) * mode->clock / 1000;
                  ^
   include/linux/minmax.h:52:19: note: expanded from macro 'max'
   #define max(x, y)       __careful_cmp(x, y, >)
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
   drivers/gpu/drm/sti/sti_hqvdp.c:743:11: note: Division by zero
           inv_zy =3D DIV_ROUND_UP(src_h, dst_h);
                    ^
   include/linux/math.h:36:22: note: expanded from macro 'DIV_ROUND_UP'
   #define DIV_ROUND_UP __KERNEL_DIV_ROUND_UP
                        ^
   include/uapi/linux/const.h:34:54: note: expanded from macro '__KERNEL_DI=
V_ROUND_UP'
   #define __KERNEL_DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
                                        ~~~~~~~~~~~~~~~~^~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/iommu/sun50i-iommu.c:510:3: warning: Value stored to 'dte' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
                   dte =3D old_dte;
                   ^     ~~~~~~~
   drivers/iommu/sun50i-iommu.c:510:3: note: Value stored to 'dte' is never=
 read
                   dte =3D old_dte;
                   ^     ~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
>> drivers/gpu/drm/drm_gem_vram_helper.c:396:21: warning: Value stored to '=
dev' during its initialization is never read [clang-analyzer-deadcode.DeadS=
tores]
           struct drm_device *dev =3D gbo->bo.base.dev;
                              ^~~   ~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_gem_vram_helper.c:396:21: note: Value stored to 'dev=
' during its initialization is never read
           struct drm_device *dev =3D gbo->bo.base.dev;
                              ^~~   ~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_gem_vram_helper.c:564:21: warning: Value stored to '=
dev' during its initialization is never read [clang-analyzer-deadcode.DeadS=
tores]
           struct drm_device *dev =3D bo->base.dev;
                              ^~~   ~~~~~~~~~~~~
   drivers/gpu/drm/drm_gem_vram_helper.c:564:21: note: Value stored to 'dev=
' during its initialization is never read
           struct drm_device *dev =3D bo->base.dev;
                              ^~~   ~~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   lib/test_lockup.c:231:32: warning: The right operand of '-' is a garbage=
 value [clang-analyzer-core.UndefinedBinaryOperatorResult]
                   s64 cur_wait =3D local_clock() - wait_start;
                                                ^ ~~~~~~~~~~
   lib/test_lockup.c:171:2: note: 'wait_start' declared without an initial =
value
           u64 wait_start;
           ^~~~~~~~~~~~~~
   lib/test_lockup.c:173:6: note: Assuming 'measure_lock_wait' is false
           if (measure_lock_wait)
               ^~~~~~~~~~~~~~~~~
   lib/test_lockup.c:173:2: note: Taking false branch
           if (measure_lock_wait)
           ^
   lib/test_lockup.c:176:6: note: Assuming 'lock_mutex_ptr' is not equal to=
 0
           if (lock_mutex_ptr && master) {
               ^~~~~~~~~~~~~~
   lib/test_lockup.c:176:6: note: Left side of '&&' is true
   lib/test_lockup.c:176:24: note: Assuming 'master' is true
           if (lock_mutex_ptr && master) {
                                 ^~~~~~
   lib/test_lockup.c:176:2: note: Taking true branch
           if (lock_mutex_ptr && master) {
           ^
   lib/test_lockup.c:177:7: note: Assuming 'verbose' is false
                   if (verbose)
                       ^~~~~~~
   lib/test_lockup.c:177:3: note: Taking false branch
                   if (verbose)
                   ^
   lib/test_lockup.c:182:6: note: Assuming 'lock_rwsem_ptr' is 0
           if (lock_rwsem_ptr && master) {
               ^~~~~~~~~~~~~~
   lib/test_lockup.c:182:21: note: Left side of '&&' is false
           if (lock_rwsem_ptr && master) {
                              ^
   lib/test_lockup.c:192:6: note: Assuming 'lock_mmap_sem' is false
           if (lock_mmap_sem && master) {
               ^~~~~~~~~~~~~
   lib/test_lockup.c:192:20: note: Left side of '&&' is false
           if (lock_mmap_sem && master) {
                             ^
   lib/test_lockup.c:201:6: note: Assuming 'test_disable_irq' is false
           if (test_disable_irq)
               ^~~~~~~~~~~~~~~~
   lib/test_lockup.c:201:2: note: Taking false branch
           if (test_disable_irq)
           ^
   lib/test_lockup.c:204:6: note: Assuming 'disable_softirq' is false
           if (disable_softirq)
               ^~~~~~~~~~~~~~~
   lib/test_lockup.c:204:2: note: Taking false branch
           if (disable_softirq)
           ^
   lib/test_lockup.c:207:6: note: Assuming 'disable_preempt' is false
           if (disable_preempt)
               ^~~~~~~~~~~~~~~
   lib/test_lockup.c:207:2: note: Taking false branch
           if (disable_preempt)
           ^
   lib/test_lockup.c:210:6: note: Assuming 'lock_rcu' is false
           if (lock_rcu)
               ^~~~~~~~
   lib/test_lockup.c:210:2: note: Taking false branch
           if (lock_rcu)
           ^
   lib/test_lockup.c:213:6: note: Assuming 'lock_spinlock_ptr' is 0
           if (lock_spinlock_ptr && master) {
               ^~~~~~~~~~~~~~~~~
   lib/test_lockup.c:213:24: note: Left side of '&&' is false
           if (lock_spinlock_ptr && master) {
                                 ^
   lib/test_lockup.c:220:6: note: Assuming 'lock_rwlock_ptr' is 0
           if (lock_rwlock_ptr && master) {
               ^~~~~~~~~~~~~~~
   lib/test_lockup.c:220:22: note: Left side of '&&' is false
           if (lock_rwlock_ptr && master) {
                               ^
   lib/test_lockup.c:230:6: note: Assuming 'measure_lock_wait' is true
--
                   ^
   include/linux/minmax.h:112:27: note: expanded from macro 'max_t'
   #define max_t(type, x, y)       __careful_cmp((type)(x), (type)(y), >)
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^~~~~~~~~~
   drivers/gpu/drm/rcar-du/rcar_lvds.c:187:10: note: '?' condition is false
           m_min =3D max_t(unsigned int, 1, DIV_ROUND_UP(fin, 24000000));
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
   drivers/gpu/drm/rcar-du/rcar_lvds.c:188:10: note: Assuming '__UNIQUE_ID_=
__x326' is >=3D '__UNIQUE_ID___y327'
           m_max =3D min_t(unsigned int, 8, fin / 12000000);
                   ^
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
                            ^~~~~~~~~~
   drivers/gpu/drm/rcar-du/rcar_lvds.c:188:10: note: '?' condition is false
           m_max =3D min_t(unsigned int, 8, fin / 12000000);
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
   drivers/gpu/drm/rcar-du/rcar_lvds.c:190:18: note: Assuming 'm' is > 'm_m=
ax'
           for (m =3D m_min; m <=3D m_max; ++m) {
                           ^~~~~~~~~~
   drivers/gpu/drm/rcar-du/rcar_lvds.c:190:2: note: Loop condition is false=
. Execution continues on line 252
           for (m =3D m_min; m <=3D m_max; ++m) {
           ^
   drivers/gpu/drm/rcar-du/rcar_lvds.c:252:28: note: Division by zero
           output =3D fin * pll->pll_n / pll->pll_m / (1 << pll->pll_e)
                    ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
   drivers/gpu/drm/rcar-du/rcar_lvds.c:254:2: warning: Value stored to 'err=
or' is never read [clang-analyzer-deadcode.DeadStores]
           error =3D (long)(output - target) * 10000 / (long)target;
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/rcar-du/rcar_lvds.c:254:2: note: Value stored to 'error'=
 is never read
           error =3D (long)(output - target) * 10000 / (long)target;
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
>> net/sysctl_net.c:146:4: warning: Value stored to 'where' is never read [=
clang-analyzer-deadcode.DeadStores]
                           where =3D "module";
                           ^       ~~~~~~~~
   net/sysctl_net.c:146:4: note: Value stored to 'where' is never read
                           where =3D "module";
                           ^       ~~~~~~~~
   net/sysctl_net.c:148:4: warning: Value stored to 'where' is never read [=
clang-analyzer-deadcode.DeadStores]
                           where =3D "kernel";
                           ^       ~~~~~~~~
   net/sysctl_net.c:148:4: note: Value stored to 'where' is never read
                           where =3D "kernel";
                           ^       ~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   drivers/regulator/max8998.c:285:4: warning: Value stored to 'ret' is nev=
er read [clang-analyzer-deadcode.DeadStores]
                           ret =3D max8998_get_voltage_register(rdev, &reg,
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/max8998.c:285:4: note: Value stored to 'ret' is never =
read
                           ret =3D max8998_get_voltage_register(rdev, &reg,
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/max8998.c:412:6: warning: Assigned value is garbage or=
 undefined [clang-analyzer-core.uninitialized.Assign]
           sel <<=3D ffs(rdev->desc->csel_mask) - 1;
               ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/max8998.c:382:6: note: Assuming 'n_currents' is not eq=
ual to 0
           if (n_currents =3D=3D 0)
               ^~~~~~~~~~~~~~~
   drivers/regulator/max8998.c:382:2: note: Taking false branch
           if (n_currents =3D=3D 0)
           ^
   drivers/regulator/max8998.c:385:6: note: Assuming field 'curr_table' is =
non-null
           if (rdev->desc->curr_table) {
               ^~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/max8998.c:385:2: note: Taking true branch
           if (rdev->desc->curr_table) {
           ^
   drivers/regulator/max8998.c:390:7: note: Assuming 'ascend' is false
                   if (ascend) {
                       ^~~~~~
   drivers/regulator/max8998.c:390:3: note: Taking false branch
                   if (ascend) {
                   ^
   drivers/regulator/max8998.c:399:16: note: 'i' is < 'n_currents'
                           for (i =3D 0; i < n_currents; i++) {
                                       ^
   drivers/regulator/max8998.c:399:4: note: Loop condition is true.  Enteri=
ng loop body
                           for (i =3D 0; i < n_currents; i++) {
                           ^
   drivers/regulator/max8998.c:400:9: note: Assuming the condition is true
                                   if (min_uA <=3D curr_table[i] &&
                                       ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/max8998.c:400:9: note: Left side of '&&' is true
   drivers/regulator/max8998.c:401:9: note: Assuming the condition is true
                                       curr_table[i] <=3D max_uA) {
                                       ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/max8998.c:400:5: note: Taking true branch
                                   if (min_uA <=3D curr_table[i] &&
                                   ^
   drivers/regulator/max8998.c:403:6: note:  Execution continues on line 409
                                           break;
                                           ^
   drivers/regulator/max8998.c:409:6: note: 'sel' is >=3D 0
           if (sel < 0)
               ^~~
   drivers/regulator/max8998.c:409:2: note: Taking false branch
           if (sel < 0)
           ^
   drivers/regulator/max8998.c:412:6: note: Assigned value is garbage or un=
defined
           sel <<=3D ffs(rdev->desc->csel_mask) - 1;
               ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/max8998.c:430:6: warning: Assigned value is garbage or=
 undefined [clang-analyzer-core.uninitialized.Assign]
           val >>=3D ffs(rdev->desc->csel_mask) - 1;
               ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/max8998.c:426:6: note: Assuming 'ret' is equal to 0
--
           ^
   drivers/media/dvb-frontends/dib8000.c:2766:2: note: Loop condition is fa=
lse.  Exiting loop
           dprintk("%dkhz tuner offset (frequency =3D %dHz & current_rf =3D=
 %dHz) total_dds_offset_hz =3D %d\n", c->frequency - current_rf, c->frequen=
cy, current_rf, total_dds_offset_khz);
           ^
   drivers/media/dvb-frontends/dib8000.c:34:30: note: expanded from macro '=
dprintk'
   #define dprintk(fmt, arg...) do {                                       \
                                ^
   drivers/media/dvb-frontends/dib8000.c:2769:2: note: Calling 'dib8000_set=
_dds'
           dib8000_set_dds(state, total_dds_offset_khz);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/dib8000.c:2698:23: note: Assuming '__x' is >=
=3D 0
           u32 abs_offset_khz =3D abs(offset_khz);
                                ^
   include/linux/math.h:133:3: note: expanded from macro 'abs'
                   __abs_choose_expr(x, int,                               \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/math.h:144:28: note: expanded from macro '__abs_choose_exp=
r'
           ({ signed type __x =3D (x); __x < 0 ? -__x : __x; }), other)
                                     ^~~~~~~
   include/linux/math.h:144:54: note: expanded from macro '__abs_choose_exp=
r'
           ({ signed type __x =3D (x); __x < 0 ? -__x : __x; }), other)
                                                               ^~~~~
   include/linux/math.h:144:54: note: expanded from macro '__abs_choose_exp=
r'
           ({ signed type __x =3D (x); __x < 0 ? -__x : __x; }), other)
                                                               ^~~~~
   drivers/media/dvb-frontends/dib8000.c:2698:23: note: '?' condition is fa=
lse
           u32 abs_offset_khz =3D abs(offset_khz);
                                ^
   include/linux/math.h:133:3: note: expanded from macro 'abs'
                   __abs_choose_expr(x, int,                               \
                   ^
   include/linux/math.h:144:28: note: expanded from macro '__abs_choose_exp=
r'
           ({ signed type __x =3D (x); __x < 0 ? -__x : __x; }), other)
                                     ^
   drivers/media/dvb-frontends/dib8000.c:2700:15: note: Assuming the condit=
ion is false
           u8 invert =3D !!(state->cfg.pll->ifreq & (1 << 25));
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/dib8000.c:2703:6: note: Assuming field 'revi=
sion' is equal to 32912
           if (state->revision =3D=3D 0x8090) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/dib8000.c:2703:2: note: Taking true branch
           if (state->revision =3D=3D 0x8090) {
           ^
   drivers/media/dvb-frontends/dib8000.c:2705:33: note: Calling 'dib8000_re=
ad32'
                   unit_khz_dds_val =3D (1<<26) / (dib8000_read32(state, 23=
) / 1000);
                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/dib8000.c:216:6: note: Assuming the conditio=
n is true
           if (mutex_lock_interruptible(&state->i2c_buffer_lock) < 0) {
               ^
   include/linux/mutex.h:188:40: note: expanded from macro 'mutex_lock_inte=
rruptible'
   #define mutex_lock_interruptible(lock) mutex_lock_interruptible_nested(l=
ock, 0)
                                          ^
   drivers/media/dvb-frontends/dib8000.c:216:2: note: Taking true branch
           if (mutex_lock_interruptible(&state->i2c_buffer_lock) < 0) {
           ^
   drivers/media/dvb-frontends/dib8000.c:217:3: note: Assuming 'debug' is 0
                   dprintk("could not acquire lock\n");
                   ^
   drivers/media/dvb-frontends/dib8000.c:35:6: note: expanded from macro 'd=
printk'
           if (debug)                                                      \
               ^~~~~
   drivers/media/dvb-frontends/dib8000.c:217:3: note: Taking false branch
                   dprintk("could not acquire lock\n");
                   ^
   drivers/media/dvb-frontends/dib8000.c:35:2: note: expanded from macro 'd=
printk'
           if (debug)                                                      \
           ^
   drivers/media/dvb-frontends/dib8000.c:217:3: note: Loop condition is fal=
se.  Exiting loop
                   dprintk("could not acquire lock\n");
                   ^
   drivers/media/dvb-frontends/dib8000.c:34:30: note: expanded from macro '=
dprintk'
   #define dprintk(fmt, arg...) do {                                       \
                                ^
   drivers/media/dvb-frontends/dib8000.c:218:3: note: Returning zero
                   return 0;
                   ^~~~~~~~
   drivers/media/dvb-frontends/dib8000.c:2705:33: note: Returning from 'dib=
8000_read32'
                   unit_khz_dds_val =3D (1<<26) / (dib8000_read32(state, 23=
) / 1000);
                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/dib8000.c:2705:30: note: Division by zero
                   unit_khz_dds_val =3D (1<<26) / (dib8000_read32(state, 23=
) / 1000);
                                      ~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
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
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
>> drivers/mtd/maps/pismo.c:246:11: warning: Array access (via field 'cs_ad=
drs') results in a null pointer dereference [clang-analyzer-core.NullDerefe=
rence]
                                         pdata->cs_addrs[i]);
                                         ^      ~~~~~~~~
   drivers/mtd/maps/pismo.c:214:2: note: 'pdata' initialized here
           struct pismo_pdata *pdata =3D client->dev.platform_data;
           ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/maps/pismo.c:219:7: note: Calling 'i2c_check_functionality'
           if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/i2c.h:900:9: note: Assuming the condition is true
           return (func & i2c_get_functionality(adap)) =3D=3D func;
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/i2c.h:900:2: note: Returning the value 1, which participat=
es in a condition later
           return (func & i2c_get_functionality(adap)) =3D=3D func;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/maps/pismo.c:219:7: note: Returning from 'i2c_check_function=
ality'
           if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/maps/pismo.c:219:2: note: Taking false branch
           if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
           ^
   drivers/mtd/maps/pismo.c:224:10: note: Calling 'kzalloc'
           pismo =3D kzalloc(sizeof(*pismo), GFP_KERNEL);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:721:9: note: Calling 'kmalloc'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:579:2: note: Taking false branch
           if (__builtin_constant_p(size)) {
           ^
   include/linux/slab.h:596:2: note: Returning pointer, which participates =
in a condition later
           return __kmalloc(size, flags);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:721:9: note: Returning from 'kmalloc'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:721:2: note: Returning pointer, which participates =
in a condition later
           return kmalloc(size, flags | __GFP_ZERO);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/maps/pismo.c:224:10: note: Returning from 'kzalloc'
           pismo =3D kzalloc(sizeof(*pismo), GFP_KERNEL);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/maps/pismo.c:225:6: note: Assuming 'pismo' is non-null
           if (!pismo)
               ^~~~~~
   drivers/mtd/maps/pismo.c:225:2: note: Taking false branch
           if (!pismo)
           ^
   drivers/mtd/maps/pismo.c:229:6: note: Assuming 'pdata' is null
           if (pdata) {
               ^~~~~
   drivers/mtd/maps/pismo.c:229:2: note: Taking false branch
           if (pdata) {
           ^
   drivers/mtd/maps/pismo.c:236:6: note: 'ret' is >=3D 0
           if (ret < 0) {
               ^~~
   drivers/mtd/maps/pismo.c:236:2: note: Taking false branch
           if (ret < 0) {
           ^
   drivers/mtd/maps/pismo.c:241:2: note: Left side of '&&' is true
           dev_info(&client->dev, "%.15s board found\n", eeprom.board);
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
   include/linux/printk.h:413:2: note: expanded from macro 'printk_index_su=
bsys_emit'
           __printk_index_emit(fmt, level, subsys_fmt_prefix)
           ^
   include/linux/printk.h:370:7: note: expanded from macro '__printk_index_=
emit'
                   if (__builtin_constant_p(_fmt) && __builtin_constant_p(_=
level)) { \
                       ^
   drivers/mtd/maps/pismo.c:241:2: note: Taking true branch
           dev_info(&client->dev, "%.15s board found\n", eeprom.board);
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
   include/linux/printk.h:413:2: note: expanded from macro 'printk_index_su=
bsys_emit'
           __printk_index_emit(fmt, level, subsys_fmt_prefix)
           ^
   include/linux/printk.h:370:3: note: expanded from macro '__printk_index_=
emit'
                   if (__builtin_constant_p(_fmt) && __builtin_constant_p(_=
level)) { \
                   ^
   drivers/mtd/maps/pismo.c:241:2: note: '?' condition is true
           dev_info(&client->dev, "%.15s board found\n", eeprom.board);
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
   include/linux/printk.h:413:2: note: expanded from macro 'printk_index_su=
bsys_emit'
           __printk_index_emit(fmt, level, subsys_fmt_prefix)
           ^
   include/linux/printk.h:379:12: note: expanded from macro '__printk_index=
_emit'
                                   .fmt =3D __builtin_constant_p(_fmt) ? (_=
fmt) : NULL, \
                                          ^
   drivers/mtd/maps/pismo.c:241:2: note: '?' condition is true
           dev_info(&client->dev, "%.15s board found\n", eeprom.board);
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
   include/linux/printk.h:413:2: note: expanded from macro 'printk_index_su=
bsys_emit'
           __printk_index_emit(fmt, level, subsys_fmt_prefix)
           ^
   include/linux/printk.h:383:14: note: expanded from macro '__printk_index=
_emit'
                                   .level =3D __builtin_constant_p(_level) =
? (_level) : NULL, \
                                            ^
   drivers/mtd/maps/pismo.c:241:2: note: Loop condition is false.  Exiting =
loop
           dev_info(&client->dev, "%.15s board found\n", eeprom.board);
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
   include/linux/printk.h:413:2: note: expanded from macro 'printk_index_su=
bsys_emit'
           __printk_index_emit(fmt, level, subsys_fmt_prefix)
           ^
   include/linux/printk.h:369:2: note: expanded from macro '__printk_index_=
emit'
           do {                                                            \
           ^
   drivers/mtd/maps/pismo.c:243:2: note: Loop condition is true.  Entering =
loop body
           for (i =3D 0; i < ARRAY_SIZE(eeprom.cs); i++)
           ^
   drivers/mtd/maps/pismo.c:244:7: note: Assuming field 'type' is not equal=
 to 255
                   if (eeprom.cs[i].type !=3D 0xff)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/maps/pismo.c:244:3: note: Taking true branch
                   if (eeprom.cs[i].type !=3D 0xff)
                   ^
   drivers/mtd/maps/pismo.c:246:11: note: Array access (via field 'cs_addrs=
') results in a null pointer dereference
                                         pdata->cs_addrs[i]);
                                         ^      ~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
>> drivers/i2c/busses/i2c-aspeed.c:253:2: warning: Value stored to 'command=
' is never read [clang-analyzer-deadcode.DeadStores]
           command =3D readl(bus->base + ASPEED_I2C_CMD_REG);
           ^
   drivers/i2c/busses/i2c-aspeed.c:253:2: note: Value stored to 'command' i=
s never read
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/mfd/vx855.c:89:2: warning: Value stored to 'ret' is never read [=
clang-analyzer-deadcode.DeadStores]
           ret =3D mfd_add_devices(&pdev->dev, -1, vx855_cells, ARRAY_SIZE(=
vx855_cells),
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~
   drivers/mfd/vx855.c:89:2: note: Value stored to 'ret' is never read
           ret =3D mfd_add_devices(&pdev->dev, -1, vx855_cells, ARRAY_SIZE(=
vx855_cells),
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   net/nfc/llcp_core.c:585:2: warning: Value stored to 'gb_cur' is never re=
ad [clang-analyzer-deadcode.DeadStores]
           gb_cur +=3D miux_length;
           ^         ~~~~~~~~~~~
   net/nfc/llcp_core.c:585:2: note: Value stored to 'gb_cur' is never read
           gb_cur +=3D miux_length;
           ^         ~~~~~~~~~~~
   net/nfc/llcp_core.c:1416:2: warning: Value stored to 'dsap' is never rea=
d [clang-analyzer-deadcode.DeadStores]
           dsap =3D nfc_llcp_dsap(skb);
           ^      ~~~~~~~~~~~~~~~~~~
   net/nfc/llcp_core.c:1416:2: note: Value stored to 'dsap' is never read
           dsap =3D nfc_llcp_dsap(skb);
           ^      ~~~~~~~~~~~~~~~~~~
   net/nfc/llcp_core.c:1417:2: warning: Value stored to 'ssap' is never rea=
d [clang-analyzer-deadcode.DeadStores]
           ssap =3D nfc_llcp_ssap(skb);
           ^      ~~~~~~~~~~~~~~~~~~
   net/nfc/llcp_core.c:1417:2: note: Value stored to 'ssap' is never read
           ssap =3D nfc_llcp_ssap(skb);
           ^      ~~~~~~~~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   net/nfc/llcp_commands.c:448:2: warning: 3rd function call argument is an=
 uninitialized value [clang-analyzer-core.CallAndMessage]
           llcp_add_tlv(skb, service_name_tlv, service_name_tlv_length);
           ^                                   ~~~~~~~~~~~~~~~~~~~~~~~
   net/nfc/llcp_commands.c:397:5: note: 'service_name_tlv_length' declared =
without an initial value
           u8 service_name_tlv_length, miux_tlv_length,  rw_tlv_length, rw;
              ^~~~~~~~~~~~~~~~~~~~~~~
   net/nfc/llcp_commands.c:402:2: note: Taking false branch
           pr_debug("Sending CONNECT\n");
           ^
   include/linux/printk.h:576:2: note: expanded from macro 'pr_debug'
           no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:131:2: note: expanded from macro 'no_printk'
           if (0)                                          \
           ^
   net/nfc/llcp_commands.c:405:6: note: Assuming 'local' is not equal to NU=
LL
           if (local =3D=3D NULL)
               ^~~~~~~~~~~~~
   net/nfc/llcp_commands.c:405:2: note: Taking false branch
           if (local =3D=3D NULL)
           ^
   net/nfc/llcp_commands.c:408:6: note: Assuming field 'service_name' is eq=
ual to NULL
           if (sock->service_name !=3D NULL) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   net/nfc/llcp_commands.c:408:2: note: Taking false branch
           if (sock->service_name !=3D NULL) {
           ^
   net/nfc/llcp_commands.c:421:9: note: Assuming the condition is false
           miux =3D be16_to_cpu(sock->miux) > LLCP_MAX_MIUX ?
                  ^
   include/linux/byteorder/generic.h:97:21: note: expanded from macro 'be16=
_to_cpu'
   #define be16_to_cpu __be16_to_cpu
                       ^
   include/uapi/linux/byteorder/little_endian.h:42:26: note: expanded from =
macro '__be16_to_cpu'
   #define __be16_to_cpu(x) __swab16((__force __u16)(__be16)(x))
                            ^
   include/uapi/linux/swab.h:102:21: note: expanded from macro '__swab16'
   #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
                       ^
   net/nfc/llcp_commands.c:421:9: note: '?' condition is false
--
           ^
   arch/arm/include/asm/io.h:308:25: note: expanded from macro 'writel'
   #define writel(v,c)             ({ __iowmb(); writel_relaxed(v,c); })
                                      ^
   arch/arm/include/asm/io.h:167:20: note: expanded from macro '__iowmb'
   #define __iowmb()               wmb()
                                   ^
   arch/arm/include/asm/barrier.h:66:16: note: expanded from macro 'wmb'
   #define wmb()           __arm_heavy_mb(st)
                           ^
   arch/arm/include/asm/barrier.h:58:30: note: expanded from macro '__arm_h=
eavy_mb'
   #define __arm_heavy_mb(x...) do { dsb(x); arm_heavy_mb(); } while (0)
                                ^
   drivers/mtd/nand/raw/pl35x-nand-controller.c:620:14: note: Field 'addr_c=
ycles' is <=3D 4
           if (plnand->addr_cycles > 4)
                       ^
   drivers/mtd/nand/raw/pl35x-nand-controller.c:620:2: note: Taking false b=
ranch
           if (plnand->addr_cycles > 4)
           ^
   drivers/mtd/nand/raw/pl35x-nand-controller.c:624:9: note: '?' condition =
is true
           ndelay(PSEC_TO_NSEC(sdr->tRR_min));
                  ^
   include/linux/mtd/rawnand.h:769:25: note: expanded from macro 'PSEC_TO_N=
SEC'
   #define PSEC_TO_NSEC(x) __DIVIDE(x, 1000)
                           ^
   include/linux/mtd/rawnand.h:765:25: note: expanded from macro '__DIVIDE'
           (__typeof__(dividend))(sizeof(dividend) <=3D sizeof(unsigned lon=
g) ?      \
                                  ^
   drivers/mtd/nand/raw/pl35x-nand-controller.c:626:6: note: Assuming 'ret'=
 is 0
           if (ret)
               ^~~
   drivers/mtd/nand/raw/pl35x-nand-controller.c:626:2: note: Taking false b=
ranch
           if (ret)
           ^
   drivers/mtd/nand/raw/pl35x-nand-controller.c:633:6: note: 'ret' is 0
           if (ret)
               ^~~
   drivers/mtd/nand/raw/pl35x-nand-controller.c:633:2: note: Taking false b=
ranch
           if (ret)
           ^
   drivers/mtd/nand/raw/pl35x-nand-controller.c:641:6: note: Assuming 'ret'=
 is 0
           if (ret)
               ^~~
   drivers/mtd/nand/raw/pl35x-nand-controller.c:641:2: note: Taking false b=
ranch
           if (ret)
           ^
   drivers/mtd/nand/raw/pl35x-nand-controller.c:647:9: note: Calling 'pl35x=
_nand_recover_data_hwecc'
           return pl35x_nand_recover_data_hwecc(nfc, chip, buf, nfc->ecc_bu=
f);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   drivers/mtd/nand/raw/pl35x-nand-controller.c:478:18: note: Assuming 'chu=
nk' is < field 'steps'
           for (chunk =3D 0; chunk < chip->ecc.steps;
                           ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/raw/pl35x-nand-controller.c:478:2: note: Loop condition=
 is true.  Entering loop body
           for (chunk =3D 0; chunk < chip->ecc.steps;
           ^
   drivers/mtd/nand/raw/pl35x-nand-controller.c:483:7: note: Assuming the c=
ondition is false
                   if (!PL35X_SMC_ECC_VALUE_IS_VALID(ecc_value))
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/raw/pl35x-nand-controller.c:483:3: note: Taking false b=
ranch
                   if (!PL35X_SMC_ECC_VALUE_IS_VALID(ecc_value))
                   ^
   drivers/mtd/nand/raw/pl35x-nand-controller.c:486:7: note: Assuming the c=
ondition is false
                   if (PL35X_SMC_ECC_VALUE_HAS_FAILED(ecc_value)) {
                       ^
   drivers/mtd/nand/raw/pl35x-nand-controller.c:85:46: note: expanded from =
macro 'PL35X_SMC_ECC_VALUE_HAS_FAILED'
   #define   PL35X_SMC_ECC_VALUE_HAS_FAILED(x) ((x) & BIT(28))
                                                ^~~~~~~~~~~~~
   drivers/mtd/nand/raw/pl35x-nand-controller.c:486:3: note: Taking false b=
ranch
                   if (PL35X_SMC_ECC_VALUE_HAS_FAILED(ecc_value)) {
                   ^
   drivers/mtd/nand/raw/pl35x-nand-controller.c:491:3: note: Calling 'pl35x=
_nand_ecc_reg_to_array'
                   pl35x_nand_ecc_reg_to_array(chip, ecc_value, calc_ecc);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/raw/pl35x-nand-controller.c:446:21: note: Assuming 'ecc=
_byte' is < field 'bytes'
           for (ecc_byte =3D 0; ecc_byte < chip->ecc.bytes; ecc_byte++)
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/raw/pl35x-nand-controller.c:446:2: note: Loop condition=
 is true.  Entering loop body
           for (ecc_byte =3D 0; ecc_byte < chip->ecc.bytes; ecc_byte++)
           ^
   drivers/mtd/nand/raw/pl35x-nand-controller.c:446:21: note: Assuming 'ecc=
_byte' is < field 'bytes'
           for (ecc_byte =3D 0; ecc_byte < chip->ecc.bytes; ecc_byte++)
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/raw/pl35x-nand-controller.c:446:2: note: Loop condition=
 is true.  Entering loop body
           for (ecc_byte =3D 0; ecc_byte < chip->ecc.bytes; ecc_byte++)
           ^
   drivers/mtd/nand/raw/pl35x-nand-controller.c:446:21: note: Assuming 'ecc=
_byte' is >=3D field 'bytes'
           for (ecc_byte =3D 0; ecc_byte < chip->ecc.bytes; ecc_byte++)
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/raw/pl35x-nand-controller.c:446:2: note: Loop condition=
 is false. Execution continues on line 446
           for (ecc_byte =3D 0; ecc_byte < chip->ecc.bytes; ecc_byte++)
           ^
   drivers/mtd/nand/raw/pl35x-nand-controller.c:491:3: note: Returning from=
 'pl35x_nand_ecc_reg_to_array'
                   pl35x_nand_ecc_reg_to_array(chip, ecc_value, calc_ecc);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/raw/pl35x-nand-controller.c:492:11: note: Calling 'pl35=
x_nand_correct_data'
                   stats =3D pl35x_nand_correct_data(nfc, data, read_ecc, c=
alc_ecc);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   drivers/mtd/nand/raw/pl35x-nand-controller.c:411:54: note: The left oper=
and of '<<' is a garbage value
           calc_ecc_upper =3D ((calc_ecc[1] >> 4) | (calc_ecc[2] << 4)) &
                                                   ~~~~~~~~~~~ ^
>> drivers/mtd/nand/raw/pl35x-nand-controller.c:1126:2: warning: Undefined =
or garbage value returned to caller [clang-analyzer-core.uninitialized.Unde=
fReturn]
           return ret;
           ^
   drivers/mtd/nand/raw/pl35x-nand-controller.c:1132:33: note: Left side of=
 '&&' is false
           struct amba_device *smc_amba =3D to_amba_device(smc_dev);
                                          ^
   include/linux/amba/bus.h:103:27: note: expanded from macro 'to_amba_devi=
ce'
   #define to_amba_device(d)       container_of(d, struct amba_device, dev)
                                   ^
   include/linux/kernel.h:495:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/mtd/nand/raw/pl35x-nand-controller.c:1132:33: note: Taking false=
 branch
           struct amba_device *smc_amba =3D to_amba_device(smc_dev);
                                          ^
   include/linux/amba/bus.h:103:27: note: expanded from macro 'to_amba_devi=
ce'
   #define to_amba_device(d)       container_of(d, struct amba_device, dev)
                                   ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:302:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/mtd/nand/raw/pl35x-nand-controller.c:1132:33: note: Loop conditi=
on is false.  Exiting loop
           struct amba_device *smc_amba =3D to_amba_device(smc_dev);
                                          ^
   include/linux/amba/bus.h:103:27: note: expanded from macro 'to_amba_devi=
ce'
   #define to_amba_device(d)       container_of(d, struct amba_device, dev)
                                   ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:300:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/mtd/nand/raw/pl35x-nand-controller.c:1137:6: note: Assuming 'nfc=
' is non-null
           if (!nfc)
               ^~~~
   drivers/mtd/nand/raw/pl35x-nand-controller.c:1137:2: note: Taking false =
branch
           if (!nfc)
           ^
   drivers/mtd/nand/raw/pl35x-nand-controller.c:1146:2: note: Taking false =
branch
           if (IS_ERR(nfc->conf_regs))
           ^
   drivers/mtd/nand/raw/pl35x-nand-controller.c:1150:2: note: Taking false =
branch
           if (IS_ERR(nfc->io_regs))
           ^
   drivers/mtd/nand/raw/pl35x-nand-controller.c:1154:6: note: 'ret' is 0
           if (ret)
               ^~~
   drivers/mtd/nand/raw/pl35x-nand-controller.c:1154:2: note: Taking false =
branch
           if (ret)
           ^
   drivers/mtd/nand/raw/pl35x-nand-controller.c:1157:8: note: Calling 'pl35=
x_nand_chips_init'
           ret =3D pl35x_nand_chips_init(nfc);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/raw/pl35x-nand-controller.c:1109:2: note: 'ret' declare=
d without an initial value
           int ret;
           ^~~~~~~
   drivers/mtd/nand/raw/pl35x-nand-controller.c:1111:6: note: Assuming 'nch=
ips' is not equal to 0
           if (!nchips || nchips > PL35X_NAND_MAX_CS) {
               ^~~~~~~
   drivers/mtd/nand/raw/pl35x-nand-controller.c:1111:6: note: Left side of =
'||' is false
   drivers/mtd/nand/raw/pl35x-nand-controller.c:1111:17: note: Assuming 'nc=
hips' is <=3D PL35X_NAND_MAX_CS
           if (!nchips || nchips > PL35X_NAND_MAX_CS) {
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/raw/pl35x-nand-controller.c:1111:2: note: Taking false =
branch
           if (!nchips || nchips > PL35X_NAND_MAX_CS) {
           ^
   drivers/mtd/nand/raw/pl35x-nand-controller.c:1117:29: note: Assuming 'na=
nd_np' is equal to null
           for_each_child_of_node(np, nand_np) {
                                      ^
   include/linux/of.h:1301:48: note: expanded from macro 'for_each_child_of=
_node'
           for (child =3D of_get_next_child(parent, NULL); child !=3D NULL;=
 \
                                                         ^~~~~~~~~~~~~
   drivers/mtd/nand/raw/pl35x-nand-controller.c:1117:2: note: Loop conditio=
n is false. Execution continues on line 1126
           for_each_child_of_node(np, nand_np) {
           ^
   include/linux/of.h:1301:2: note: expanded from macro 'for_each_child_of_=
node'
           for (child =3D of_get_next_child(parent, NULL); child !=3D NULL;=
 \
           ^
   drivers/mtd/nand/raw/pl35x-nand-controller.c:1126:2: note: Undefined or =
garbage value returned to caller
--
   drivers/gpu/drm/mcde/mcde_display.c:254:2: note: Control jumps to 'case =
909202777:'  at line 318
           switch (format) {
           ^
   drivers/gpu/drm/mcde/mcde_display.c:321:3: note:  Execution continues on=
 line 327
                   break;
                   ^
   drivers/gpu/drm/mcde/mcde_display.c:327:2: note: Loop condition is false=
.  Exiting loop
           writel(val, mcde->regs + conf);
           ^
   arch/arm/include/asm/io.h:308:25: note: expanded from macro 'writel'
   #define writel(v,c)             ({ __iowmb(); writel_relaxed(v,c); })
                                      ^
   arch/arm/include/asm/io.h:167:20: note: expanded from macro '__iowmb'
   #define __iowmb()               wmb()
                                   ^
   arch/arm/include/asm/barrier.h:66:16: note: expanded from macro 'wmb'
   #define wmb()           __arm_heavy_mb(st)
                           ^
   arch/arm/include/asm/barrier.h:58:30: note: expanded from macro '__arm_h=
eavy_mb'
   #define __arm_heavy_mb(x...) do { dsb(x); arm_heavy_mb(); } while (0)
                                ^
   drivers/gpu/drm/mcde/mcde_display.c:332:2: note: Loop condition is false=
.  Exiting loop
           writel(val, mcde->regs + cr);
           ^
   arch/arm/include/asm/io.h:308:25: note: expanded from macro 'writel'
   #define writel(v,c)             ({ __iowmb(); writel_relaxed(v,c); })
                                      ^
   arch/arm/include/asm/io.h:167:20: note: expanded from macro '__iowmb'
   #define __iowmb()               wmb()
                                   ^
   arch/arm/include/asm/barrier.h:66:16: note: expanded from macro 'wmb'
   #define wmb()           __arm_heavy_mb(st)
                           ^
   arch/arm/include/asm/barrier.h:58:30: note: expanded from macro '__arm_h=
eavy_mb'
   #define __arm_heavy_mb(x...) do { dsb(x); arm_heavy_mb(); } while (0)
                                ^
   drivers/gpu/drm/mcde/mcde_display.c:334:2: note: Returning without writi=
ng to 'mcde->dpi_output', which participates in a condition later
           return 0;
           ^
   drivers/gpu/drm/mcde/mcde_display.c:1204:2: note: Returning from 'mcde_c=
onfigure_extsrc'
           mcde_configure_extsrc(mcde, MCDE_EXTSRC_0, format);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/mcde/mcde_display.c:1220:6: note: Assuming field 'dpi_ou=
tput' is false
           if (mcde->dpi_output) {
               ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/mcde/mcde_display.c:1220:2: note: Taking false branch
           if (mcde->dpi_output) {
           ^
   drivers/gpu/drm/mcde/mcde_display.c:1252:3: note: 3rd function call argu=
ment is an uninitialized value
                   mcde_configure_dsi_formatter(mcde, MCDE_DSI_FORMATTER_0,
                   ^
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   8 warnings generated.
   drivers/video/fbdev/nvidia/nvidia.c:124:4: warning: Value stored to 'tmp=
' is never read [clang-analyzer-deadcode.DeadStores]
                           tmp =3D 0;
                           ^     ~
   drivers/video/fbdev/nvidia/nvidia.c:124:4: note: Value stored to 'tmp' i=
s never read
                           tmp =3D 0;
                           ^     ~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
>> fs/overlayfs/inode.c:452:16: warning: Value stored to 'realinode' during=
 its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct inode *realinode =3D ovl_inode_real(inode);
                         ^~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~
   fs/overlayfs/inode.c:452:16: note: Value stored to 'realinode' during it=
s initialization is never read
           struct inode *realinode =3D ovl_inode_real(inode);
                         ^~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~
   include/linux/dcache.h:526:9: warning: Access to field 'd_inode' results=
 in a dereference of a null pointer (loaded from variable 'dentry') [clang-=
analyzer-core.NullDereference]
           return dentry->d_inode;
                  ^
   fs/overlayfs/inode.c:1099:28: note: Assuming 'upperdentry' is null
           struct inode *realinode =3D upperdentry ? d_inode(upperdentry) :=
 NULL;
                                     ^~~~~~~~~~~
   fs/overlayfs/inode.c:1099:28: note: '?' condition is false
   fs/overlayfs/inode.c:1101:31: note: Assuming 'lowerpath' is null
           struct dentry *lowerdentry =3D lowerpath ? lowerpath->dentry : N=
ULL;
                                        ^~~~~~~~~
   fs/overlayfs/inode.c:1101:31: note: '?' condition is false
   fs/overlayfs/inode.c:1101:2: note: 'lowerdentry' initialized to a null p=
ointer value
           struct dentry *lowerdentry =3D lowerpath ? lowerpath->dentry : N=
ULL;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/overlayfs/inode.c:1104:13: note: 'bylower' is false
           int fsid =3D bylower ? lowerpath->layer->fsid : 0;
                      ^~~~~~~
   fs/overlayfs/inode.c:1104:13: note: '?' condition is false
   fs/overlayfs/inode.c:1107:12: note: Assuming field 'newinode' is null
           int err =3D oip->newinode ? -EEXIST : -ENOMEM;
                     ^~~~~~~~~~~~~
   fs/overlayfs/inode.c:1107:12: note: '?' condition is false
   fs/overlayfs/inode.c:1109:7: note: 'realinode' is null
           if (!realinode)
                ^~~~~~~~~
   fs/overlayfs/inode.c:1109:2: note: Taking true branch
           if (!realinode)
           ^
   fs/overlayfs/inode.c:1110:23: note: Passing null pointer value via 1st p=
arameter 'dentry'
                   realinode =3D d_inode(lowerdentry);
                                       ^~~~~~~~~~~
   fs/overlayfs/inode.c:1110:15: note: Calling 'd_inode'
                   realinode =3D d_inode(lowerdentry);
                               ^~~~~~~~~~~~~~~~~~~~
   include/linux/dcache.h:526:9: note: Access to field 'd_inode' results in=
 a dereference of a null pointer (loaded from variable 'dentry')
           return dentry->d_inode;
                  ^~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/media/dvb-frontends/si21xx.c:830:2: warning: Value stored to 'st=
atus' is never read [clang-analyzer-deadcode.DeadStores]
           status |=3D si21_writeregs(state, PLL_DIVISOR_REG, &regs[0], 0x0=
4);
           ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/si21xx.c:830:2: note: Value stored to 'statu=
s' is never read
           status |=3D si21_writeregs(state, PLL_DIVISOR_REG, &regs[0], 0x0=
4);
           ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 4 warnings (3 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   net/ethtool/ioctl.c:2094:4: warning: Called function pointer is null (nu=
ll dereference) [clang-analyzer-core.CallAndMessage]
                           ops->get_ethtool_phy_stats(dev, &stats, data);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ethtool/ioctl.c:2064:6: note: Assuming 'phydev' is non-null
           if (!phydev && (!ops->get_ethtool_phy_stats || !ops->get_sset_co=
unt))
               ^~~~~~~
   net/ethtool/ioctl.c:2064:14: note: Left side of '&&' is false
           if (!phydev && (!ops->get_ethtool_phy_stats || !ops->get_sset_co=
unt))
                       ^
   net/ethtool/ioctl.c:2067:11: note: Field 'phydev' is non-null
           if (dev->phydev && !ops->get_ethtool_phy_stats &&
                    ^
   net/ethtool/ioctl.c:2067:6: note: Left side of '&&' is true
           if (dev->phydev && !ops->get_ethtool_phy_stats &&
               ^
   net/ethtool/ioctl.c:2067:21: note: Assuming field 'get_ethtool_phy_stats=
' is null
           if (dev->phydev && !ops->get_ethtool_phy_stats &&
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ethtool/ioctl.c:2067:6: note: Left side of '&&' is true
           if (dev->phydev && !ops->get_ethtool_phy_stats &&
               ^
   net/ethtool/ioctl.c:2068:6: note: Assuming 'phy_ops' is null
               phy_ops && phy_ops->get_sset_count)
               ^~~~~~~
   net/ethtool/ioctl.c:2068:14: note: Left side of '&&' is false
               phy_ops && phy_ops->get_sset_count)
                       ^
   net/ethtool/ioctl.c:2072:6: note: Assuming 'n_stats' is >=3D 0
           if (n_stats < 0)
               ^~~~~~~~~~~
   net/ethtool/ioctl.c:2072:2: note: Taking false branch
           if (n_stats < 0)
           ^
   net/ethtool/ioctl.c:2074:6: note: Assuming the condition is false
           if (n_stats > S32_MAX / sizeof(u64))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ethtool/ioctl.c:2074:2: note: Taking false branch
--
                      ^~~~~~~~~
   drivers/firewire/core-cdev.c:1482:3: note: Left side of '&&' is false
                   container_of(packet, struct outbound_phy_packet_event, p=
);
                   ^
   include/linux/kernel.h:495:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/firewire/core-cdev.c:1482:3: note: Taking false branch
                   container_of(packet, struct outbound_phy_packet_event, p=
);
                   ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:302:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/firewire/core-cdev.c:1482:3: note: Loop condition is false.  Exi=
ting loop
                   container_of(packet, struct outbound_phy_packet_event, p=
);
                   ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:300:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/firewire/core-cdev.c:1484:2: note: Control jumps to 'case 14:'  =
at line 1493
           switch (status) {
           ^
   drivers/firewire/core-cdev.c:1493:63: note:  Execution continues on line=
 1497
           case ACK_TYPE_ERROR:    e->phy_packet.rcode =3D RCODE_TYPE_ERROR=
; break;
                                                                           ^
   drivers/firewire/core-cdev.c:1499:2: note: Calling 'queue_event'
           queue_event(e->client, &e->event, &e->phy_packet,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/firewire/core-cdev.c:281:2: note: Loop condition is false.  Exit=
ing loop
           spin_lock_irqsave(&client->lock, flags);
           ^
   include/linux/spinlock.h:393:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:254:2: note: expanded from macro 'raw_spin_lock=
_irqsave'
           do {                                            \
           ^
   drivers/firewire/core-cdev.c:281:2: note: Loop condition is false.  Exit=
ing loop
           spin_lock_irqsave(&client->lock, flags);
           ^
   include/linux/spinlock.h:391:43: note: expanded from macro 'spin_lock_ir=
qsave'
   #define spin_lock_irqsave(lock, flags)                          \
                                                                   ^
   drivers/firewire/core-cdev.c:282:6: note: Assuming field 'in_shutdown' i=
s true
           if (client->in_shutdown)
               ^~~~~~~~~~~~~~~~~~~
   drivers/firewire/core-cdev.c:282:2: note: Taking true branch
           if (client->in_shutdown)
           ^
   drivers/firewire/core-cdev.c:283:3: note: Memory is released
                   kfree(event);
                   ^~~~~~~~~~~~
   drivers/firewire/core-cdev.c:1499:2: note: Returning; memory was released
           queue_event(e->client, &e->event, &e->phy_packet,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/firewire/core-cdev.c:1501:13: note: Use of memory after it is fr=
eed
           client_put(e->client);
                      ^~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
>> drivers/gpu/drm/sun4i/sun4i_tcon.c:1426:2: warning: Value stored to 'id'=
 is never read [clang-analyzer-deadcode.DeadStores]
           id =3D sun4i_tcon_of_get_id_from_port(port);
           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/sun4i/sun4i_tcon.c:1426:2: note: Value stored to 'id' is=
 never read
           id =3D sun4i_tcon_of_get_id_from_port(port);
           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/gpu/drm/sun4i/sun4i_tv.c:491:3: warning: Call to function 'strcp=
y' is insecure as it does not provide bounding of the memory buffer. Replac=
e unbounded copy functions with analogous functions that support length arg=
uments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strc=
py]
                   strcpy(mode->name, tv_mode->name);
                   ^~~~~~
   drivers/gpu/drm/sun4i/sun4i_tv.c:491:3: note: Call to function 'strcpy' =
is insecure as it does not provide bounding of the memory buffer. Replace u=
nbounded copy functions with analogous functions that support length argume=
nts such as 'strlcpy'. CWE-119
                   strcpy(mode->name, tv_mode->name);
                   ^~~~~~
   Suppressed 4 warnings (3 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c:149:2: warning: Value stored to '=
val' is never read [clang-analyzer-deadcode.DeadStores]
           val =3D readl(hdmi->base + SUN4I_HDMI_PAD_CTRL1_REG);
           ^
   drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c:149:2: note: Value stored to 'val=
' is never read
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   drivers/phy/rockchip/phy-rockchip-inno-hdmi.c:624:16: warning: Value sto=
red to 'tmdsclock' during its initialization is never read [clang-analyzer-=
deadcode.DeadStores]
           unsigned long tmdsclock =3D inno_hdmi_phy_get_tmdsclk(inno, rate=
);
                         ^~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/phy/rockchip/phy-rockchip-inno-hdmi.c:624:16: note: Value stored=
 to 'tmdsclock' during its initialization is never read
           unsigned long tmdsclock =3D inno_hdmi_phy_get_tmdsclk(inno, rate=
);
                         ^~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/phy/rockchip/phy-rockchip-inno-hdmi.c:742:3: warning: Value stor=
ed to 'no_c' is never read [clang-analyzer-deadcode.DeadStores]
                   no_c =3D 1 << no_c;
                   ^      ~~~~~~~~~
   drivers/phy/rockchip/phy-rockchip-inno-hdmi.c:742:3: note: Value stored =
to 'no_c' is never read
                   no_c =3D 1 << no_c;
                   ^      ~~~~~~~~~
   drivers/phy/rockchip/phy-rockchip-inno-hdmi.c:778:16: warning: Value sto=
red to 'tmdsclock' during its initialization is never read [clang-analyzer-=
deadcode.DeadStores]
           unsigned long tmdsclock =3D inno_hdmi_phy_get_tmdsclk(inno, rate=
);
                         ^~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/phy/rockchip/phy-rockchip-inno-hdmi.c:778:16: note: Value stored=
 to 'tmdsclock' during its initialization is never read
           unsigned long tmdsclock =3D inno_hdmi_phy_get_tmdsclk(inno, rate=
);
                         ^~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/media/cec/platform/meson/ao-cec.c:432:10: warning: The left oper=
and of '!=3D' is a garbage value [clang-analyzer-core.UndefinedBinaryOperat=
orResult]
--
                     ^
   include/linux/bitfield.h:94:3: note: expanded from macro 'FIELD_PREP'
                   __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
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
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:302:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/media/cec/platform/meson/ao-cec.c:248:12: note: Loop condition i=
s false.  Exiting loop
           u32 reg =3D FIELD_PREP(CEC_RW_ADDR, address);
                     ^
   include/linux/bitfield.h:94:3: note: expanded from macro 'FIELD_PREP'
                   __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
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
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:300:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/media/cec/platform/meson/ao-cec.c:251:6: note: 'res' is non-null
           if (res && *res)
               ^~~
   drivers/media/cec/platform/meson/ao-cec.c:251:6: note: Left side of '&&'=
 is true
   drivers/media/cec/platform/meson/ao-cec.c:251:2: note: Taking true branch
           if (res && *res)
           ^
   drivers/media/cec/platform/meson/ao-cec.c:252:3: note: Returning without=
 writing to '*data'
                   return;
                   ^
   drivers/media/cec/platform/meson/ao-cec.c:448:3: note: Returning from 'm=
eson_ao_cec_read'
                   meson_ao_cec_read(ao_cec, CEC_RX_MSG_0_HEADER + i, &byte=
, &ret);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   drivers/media/cec/platform/meson/ao-cec.c:450:25: note: Assigned value i=
s garbage or undefined
                   ao_cec->rx_msg.msg[i] =3D byte;
                                         ^ ~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/i2c/busses/i2c-rk3x.c:897:2: warning: Value stored to 't_low_ns'=
 is never read [clang-analyzer-deadcode.DeadStores]
           t_low_ns =3D div_u64(((u64)calc.div_low + 1) * 8 * 1000000000, c=
lk_rate);
           ^          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   drivers/i2c/busses/i2c-rk3x.c:897:2: note: Value stored to 't_low_ns' is=
 never read
           t_low_ns =3D div_u64(((u64)calc.div_low + 1) * 8 * 1000000000, c=
lk_rate);
           ^          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   drivers/i2c/busses/i2c-rk3x.c:898:2: warning: Value stored to 't_high_ns=
' is never read [clang-analyzer-deadcode.DeadStores]
           t_high_ns =3D div_u64(((u64)calc.div_high + 1) * 8 * 1000000000,
           ^           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/i2c/busses/i2c-rk3x.c:898:2: note: Value stored to 't_high_ns' i=
s never read
           t_high_ns =3D div_u64(((u64)calc.div_high + 1) * 8 * 1000000000,
           ^           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
>> drivers/i2c/busses/i2c-rcar.c:412:17: warning: Value stored to 'dev' dur=
ing its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D rcar_i2c_priv_to_dev(priv);
                          ^~~
   drivers/i2c/busses/i2c-rcar.c:412:17: note: Value stored to 'dev' during=
 its initialization is never read
           struct device *dev =3D rcar_i2c_priv_to_dev(priv);
                          ^~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/clk/clk-max9485.c:199:9: warning: Access to field 'out' results =
in a dereference of a null pointer (loaded from variable 'prev') [clang-ana=
lyzer-core.NullDereference]
           return prev->out;
                  ^~~~
   drivers/clk/clk-max9485.c:165:36: note: 'prev' initialized to a null poi=
nter value
           const struct max9485_rate *curr, *prev =3D NULL;
                                             ^~~~
   drivers/clk/clk-max9485.c:167:29: note: Assuming field 'out' is equal to=
 0
           for (curr =3D max9485_rates; curr->out !=3D 0; curr++) {
                                      ^~~~~~~~~~~~~~
   drivers/clk/clk-max9485.c:167:2: note: Loop condition is false. Executio=
n continues on line 199
           for (curr =3D max9485_rates; curr->out !=3D 0; curr++) {
           ^
   drivers/clk/clk-max9485.c:199:9: note: Access to field 'out' results in =
a dereference of a null pointer (loaded from variable 'prev')
           return prev->out;
                  ^~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
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
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/regulator/qcom_spmi-regulator.c:401:8: warning: Excessive paddin=
g in 'struct spmi_regulator_data' (4 padding bytes, where 0 is optimal). =

   Optimal fields order: =

   name, =

   supply, =

   ocp, =

   base, =

   force_type, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
--
           ^
   drivers/gpu/drm/savage/savage_bci.c:987:9: note: Calling 'savage_freelis=
t_get'
                   buf =3D savage_freelist_get(dev);
                         ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/savage/savage_bci.c:256:2: note: Field 'status_ptr' is n=
on-null
           UPDATE_EVENT_COUNTER();
           ^
   drivers/gpu/drm/savage/savage_drv.h:562:16: note: expanded from macro 'U=
PDATE_EVENT_COUNTER'
           if (dev_priv->status_ptr) {                     \
                         ^
   drivers/gpu/drm/savage/savage_bci.c:256:2: note: Taking true branch
           UPDATE_EVENT_COUNTER();
           ^
   drivers/gpu/drm/savage/savage_drv.h:562:2: note: expanded from macro 'UP=
DATE_EVENT_COUNTER'
           if (dev_priv->status_ptr) {                     \
           ^
   drivers/gpu/drm/savage/savage_bci.c:256:2: note: 'count' is >=3D field '=
event_counter'
           UPDATE_EVENT_COUNTER();
           ^
   drivers/gpu/drm/savage/savage_drv.h:566:7: note: expanded from macro 'UP=
DATE_EVENT_COUNTER'
                   if (count < dev_priv->event_counter)    \
                       ^~~~~
   drivers/gpu/drm/savage/savage_bci.c:256:2: note: Taking false branch
           UPDATE_EVENT_COUNTER();
           ^
   drivers/gpu/drm/savage/savage_drv.h:566:3: note: expanded from macro 'UP=
DATE_EVENT_COUNTER'
                   if (count < dev_priv->event_counter)    \
                   ^
   drivers/gpu/drm/savage/savage_bci.c:256:2: note: Loop condition is false=
.  Exiting loop
           UPDATE_EVENT_COUNTER();
           ^
   drivers/gpu/drm/savage/savage_drv.h:561:33: note: expanded from macro 'U=
PDATE_EVENT_COUNTER'
   #define UPDATE_EVENT_COUNTER( ) do {                    \
                                   ^
   drivers/gpu/drm/savage/savage_bci.c:257:16: note: Field 'status_ptr' is =
non-null
           if (dev_priv->status_ptr)
                         ^
   drivers/gpu/drm/savage/savage_bci.c:257:2: note: Taking true branch
           if (dev_priv->status_ptr)
           ^
   drivers/gpu/drm/savage/savage_bci.c:262:6: note: 'event' is <=3D field '=
event_counter'
           if (event > dev_priv->event_counter)
               ^~~~~
   drivers/gpu/drm/savage/savage_bci.c:262:2: note: Taking false branch
           if (event > dev_priv->event_counter)
           ^
   drivers/gpu/drm/savage/savage_bci.c:268:12: note: Field 'buf' is non-null
           if (tail->buf && (TEST_AGE(&tail->age, event, wrap) || event =3D=
=3D 0)) {
                     ^
   drivers/gpu/drm/savage/savage_bci.c:268:6: note: Left side of '&&' is tr=
ue
           if (tail->buf && (TEST_AGE(&tail->age, event, wrap) || event =3D=
=3D 0)) {
               ^
   drivers/gpu/drm/savage/savage_bci.c:268:20: note: 'wrap' is > field 'wra=
p'
           if (tail->buf && (TEST_AGE(&tail->age, event, wrap) || event =3D=
=3D 0)) {
                             ^
   drivers/gpu/drm/savage/savage_drv.h:578:18: note: expanded from macro 'T=
EST_AGE'
           ( (age)->wrap < (w) || ( (age)->wrap =3D=3D (w) && (age)->event =
<=3D (e) ) )
                           ^~~
   drivers/gpu/drm/savage/savage_bci.c:268:20: note: Left side of '||' is t=
rue
           if (tail->buf && (TEST_AGE(&tail->age, event, wrap) || event =3D=
=3D 0)) {
                             ^
   drivers/gpu/drm/savage/savage_drv.h:578:22: note: expanded from macro 'T=
EST_AGE'
           ( (age)->wrap < (w) || ( (age)->wrap =3D=3D (w) && (age)->event =
<=3D (e) ) )
                               ^
   drivers/gpu/drm/savage/savage_bci.c:270:3: note: 'prev' initialized to a=
 null pointer value
                   drm_savage_buf_priv_t *prev =3D tail->prev;
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/savage/savage_bci.c:271:14: note: Access to field 'next'=
 results in a dereference of a null pointer (loaded from variable 'prev')
                   prev->next =3D next;
                   ~~~~       ^
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
>> drivers/cpufreq/armada-37xx-cpufreq.c:158:3: warning: Value stored to 'v=
al' is never read [clang-analyzer-deadcode.DeadStores]
                   val =3D ARMADA_37XX_NB_CLK_SEL_TBG << ARMADA_37XX_NB_CLK=
_SEL_OFF;
                   ^
   drivers/cpufreq/armada-37xx-cpufreq.c:158:3: note: Value stored to 'val'=
 is never read
>> drivers/cpufreq/armada-37xx-cpufreq.c:159:3: warning: Value stored to 'm=
ask' is never read [clang-analyzer-deadcode.DeadStores]
                   mask =3D (ARMADA_37XX_NB_CLK_SEL_MASK
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/cpufreq/armada-37xx-cpufreq.c:159:3: note: Value stored to 'mask=
' is never read
                   mask =3D (ARMADA_37XX_NB_CLK_SEL_MASK
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c:74:17: warning: Value s=
tored to 'dev' during its initialization is never read [clang-analyzer-dead=
code.DeadStores]
           struct device *dev =3D ctx->dev;
                          ^~~   ~~~~~~~~
   drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c:74:17: note: Value stor=
ed to 'dev' during its initialization is never read
           struct device *dev =3D ctx->dev;
                          ^~~   ~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/regulator/bcm590xx-regulator.c:140:8: warning: Excessive padding=
 in 'struct bcm590xx_info' (6 padding bytes, where 2 is optimal). =

   Optimal fields order: =

   name, =

   vin_name, =

   volt_table, =

   linear_ranges, =

   n_voltages, =

   n_linear_ranges, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct bcm590xx_info {
   ~~~~~~~^~~~~~~~~~~~~~~
   drivers/regulator/bcm590xx-regulator.c:140:8: note: Excessive padding in=
 'struct bcm590xx_info' (6 padding bytes, where 2 is optimal). Optimal fiel=
ds order: name, vin_name, volt_table, linear_ranges, n_voltages, n_linear_r=
anges, consider reordering the fields or adding explicit padding members
   struct bcm590xx_info {
   ~~~~~~~^~~~~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/regulator/bd9571mwv-regulator.c:91:6: warning: Assigned value is=
 garbage or undefined [clang-analyzer-core.uninitialized.Assign]
           val >>=3D ffs(rdev->desc->vsel_mask) - 1;
               ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/bd9571mwv-regulator.c:83:6: note: Assuming 'ret' is >=
=3D 0
           if (ret < 0)
               ^~~~~~~
   drivers/regulator/bd9571mwv-regulator.c:83:2: note: Taking false branch
           if (ret < 0)
           ^
--
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
   drivers/hwmon/adc128d818.c:217:11: note: '?' condition is false
           regval =3D clamp_val(DIV_ROUND_CLOSEST(val, 1000), -128, 127);
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
   drivers/hwmon/adc128d818.c:217:11: note: '__UNIQUE_ID___x310' is < '__UN=
IQUE_ID___y311'
           regval =3D clamp_val(DIV_ROUND_CLOSEST(val, 1000), -128, 127);
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
   drivers/hwmon/adc128d818.c:217:11: note: '?' condition is true
           regval =3D clamp_val(DIV_ROUND_CLOSEST(val, 1000), -128, 127);
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
                   ^
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^
   drivers/hwmon/adc128d818.c:217:2: note: The value -128 is assigned to 'r=
egval'
           regval =3D clamp_val(DIV_ROUND_CLOSEST(val, 1000), -128, 127);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/adc128d818.c:218:29: note: The result of the left shift is=
 undefined because the left operand is negative
           data->temp[index] =3D regval << 1;
                               ~~~~~~ ^
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/gpu/drm/tiny/simpledrm.c:719:21: warning: Value stored to 'dev' =
during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct drm_device *dev =3D &sdev->dev;
                              ^~~   ~~~~~~~~~~
   drivers/gpu/drm/tiny/simpledrm.c:719:21: note: Value stored to 'dev' dur=
ing its initialization is never read
           struct drm_device *dev =3D &sdev->dev;
                              ^~~   ~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
>> drivers/gpu/drm/xlnx/zynqmp_dp.c:994:11: warning: Array access (from var=
iable 'buf') results in a null pointer dereference [clang-analyzer-core.Nul=
lDereference]
                           buf[i] =3D zynqmp_dp_read(dp, ZYNQMP_DP_AUX_REPL=
Y_DATA);
                                  ^
   drivers/gpu/drm/xlnx/zynqmp_dp.c:1003:25: note: Left side of '&&' is fal=
se
           struct zynqmp_dp *dp =3D container_of(aux, struct zynqmp_dp, aux=
);
                                  ^
   include/linux/kernel.h:495:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/gpu/drm/xlnx/zynqmp_dp.c:1003:25: note: Taking false branch
           struct zynqmp_dp *dp =3D container_of(aux, struct zynqmp_dp, aux=
);
                                  ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:302:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/gpu/drm/xlnx/zynqmp_dp.c:1003:25: note: Loop condition is false.=
  Exiting loop
           struct zynqmp_dp *dp =3D container_of(aux, struct zynqmp_dp, aux=
);
                                  ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:300:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/gpu/drm/xlnx/zynqmp_dp.c:1009:9: note: Assuming 'iter' is 0
           iter =3D iter ? iter : 1;
                  ^~~~
   drivers/gpu/drm/xlnx/zynqmp_dp.c:1009:9: note: '?' condition is false
   drivers/gpu/drm/xlnx/zynqmp_dp.c:1011:2: note: Loop condition is true.  =
Entering loop body
           for (i =3D 0; i < iter; i++) {
           ^
   drivers/gpu/drm/xlnx/zynqmp_dp.c:1013:13: note: Passing value via 4th pa=
rameter 'buf'
                                                  msg->buffer, msg->size,
                                                  ^~~~~~~~~~~
   drivers/gpu/drm/xlnx/zynqmp_dp.c:1012:9: note: Calling 'zynqmp_dp_aux_cm=
d_submit'
                   ret =3D zynqmp_dp_aux_cmd_submit(dp, msg->request, msg->=
address,
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   drivers/gpu/drm/xlnx/zynqmp_dp.c:949:18: note: Assuming the condition is=
 true
           bool is_read =3D (cmd & AUX_READ_BIT) ? true : false;
                           ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/xlnx/zynqmp_dp.c:949:17: note: '?' condition is true
           bool is_read =3D (cmd & AUX_READ_BIT) ? true : false;
                          ^
   drivers/gpu/drm/xlnx/zynqmp_dp.c:953:6: note: Assuming the condition is =
false
           if (reg & ZYNQMP_DP_INTERRUPT_SIGNAL_STATE_REQUEST)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/xlnx/zynqmp_dp.c:953:2: note: Taking false branch
           if (reg & ZYNQMP_DP_INTERRUPT_SIGNAL_STATE_REQUEST)
           ^
   drivers/gpu/drm/xlnx/zynqmp_dp.c:957:7: note: 'is_read' is true
           if (!is_read)
                ^~~~~~~
   drivers/gpu/drm/xlnx/zynqmp_dp.c:957:2: note: Taking false branch
           if (!is_read)
           ^
   drivers/gpu/drm/xlnx/zynqmp_dp.c:963:6: note: Assuming 'buf' is null
           if (!buf || !bytes)
               ^~~~
   drivers/gpu/drm/xlnx/zynqmp_dp.c:963:11: note: Left side of '||' is true
           if (!buf || !bytes)
                    ^
   drivers/gpu/drm/xlnx/zynqmp_dp.c:970:2: note: Loop condition is true.  E=
ntering loop body
           for (i =3D 0; ; i++) {
           ^
   drivers/gpu/drm/xlnx/zynqmp_dp.c:972:7: note: Assuming the condition is =
true
                   if (reg & ZYNQMP_DP_INTERRUPT_SIGNAL_STATE_REPLY)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/xlnx/zynqmp_dp.c:972:3: note: Taking true branch
                   if (reg & ZYNQMP_DP_INTERRUPT_SIGNAL_STATE_REPLY)
                   ^
   drivers/gpu/drm/xlnx/zynqmp_dp.c:973:4: note:  Execution continues on li=
ne 982
                           break;
                           ^
   drivers/gpu/drm/xlnx/zynqmp_dp.c:983:6: note: 'reply' is non-null
           if (reply)
               ^~~~~
   drivers/gpu/drm/xlnx/zynqmp_dp.c:983:2: note: Taking true branch
           if (reply)
           ^
   drivers/gpu/drm/xlnx/zynqmp_dp.c:986:6: note: 'is_read' is true
--
           ^
   drivers/media/dvb-frontends/atbm8830.c:358:2: note: Calling 'atbm8830_re=
ad_reg'
           atbm8830_read_reg(priv, REG_FRAME_ERR_CNT + 1, &t);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/atbm8830.c:65:6: note: Assuming 'ret' is not=
 equal to 1
           if (ret !=3D 1) {
               ^~~~~~~~
   drivers/media/dvb-frontends/atbm8830.c:65:2: note: Taking true branch
           if (ret !=3D 1) {
           ^
   drivers/media/dvb-frontends/atbm8830.c:66:3: note: Assuming 'debug' is 0
                   dprintk("%s: error reg=3D0x%04x, ret=3D%i\n", __func__, =
reg, ret);
                   ^
   drivers/media/dvb-frontends/atbm8830.c:17:7: note: expanded from macro '=
dprintk'
                   if (debug) \
                       ^~~~~
   drivers/media/dvb-frontends/atbm8830.c:66:3: note: Taking false branch
                   dprintk("%s: error reg=3D0x%04x, ret=3D%i\n", __func__, =
reg, ret);
                   ^
   drivers/media/dvb-frontends/atbm8830.c:17:3: note: expanded from macro '=
dprintk'
                   if (debug) \
                   ^
   drivers/media/dvb-frontends/atbm8830.c:66:3: note: Loop condition is fal=
se.  Exiting loop
                   dprintk("%s: error reg=3D0x%04x, ret=3D%i\n", __func__, =
reg, ret);
                   ^
   drivers/media/dvb-frontends/atbm8830.c:16:2: note: expanded from macro '=
dprintk'
           do { \
           ^
   drivers/media/dvb-frontends/atbm8830.c:67:3: note: Returning without wri=
ting to '*p_data'
                   return -EIO;
                   ^
   drivers/media/dvb-frontends/atbm8830.c:358:2: note: Returning from 'atbm=
8830_read_reg'
           atbm8830_read_reg(priv, REG_FRAME_ERR_CNT + 1, &t);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/atbm8830.c:359:16: note: The left operand of=
 '&' is a garbage value
           frame_err =3D t & 0x7F;
                       ~ ^
   drivers/media/dvb-frontends/atbm8830.c:382:10: warning: The left operand=
 of '&' is a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResu=
lt]
           pwm =3D t & 0x03;
                 ~ ^
   drivers/media/dvb-frontends/atbm8830.c:376:2: note: 't' declared without=
 an initial value
           u8 t;
           ^~~~
   drivers/media/dvb-frontends/atbm8830.c:378:2: note: Assuming 'debug' is 0
           dprintk("%s\n", __func__);
           ^
   drivers/media/dvb-frontends/atbm8830.c:17:7: note: expanded from macro '=
dprintk'
                   if (debug) \
                       ^~~~~
   drivers/media/dvb-frontends/atbm8830.c:378:2: note: Taking false branch
           dprintk("%s\n", __func__);
           ^
   drivers/media/dvb-frontends/atbm8830.c:17:3: note: expanded from macro '=
dprintk'
                   if (debug) \
                   ^
   drivers/media/dvb-frontends/atbm8830.c:378:2: note: Loop condition is fa=
lse.  Exiting loop
           dprintk("%s\n", __func__);
           ^
   drivers/media/dvb-frontends/atbm8830.c:16:2: note: expanded from macro '=
dprintk'
           do { \
           ^
   drivers/media/dvb-frontends/atbm8830.c:381:2: note: Calling 'atbm8830_re=
ad_reg'
           atbm8830_read_reg(priv, REG_AGC_PWM_VAL + 1, &t);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/atbm8830.c:65:6: note: Assuming 'ret' is not=
 equal to 1
           if (ret !=3D 1) {
               ^~~~~~~~
   drivers/media/dvb-frontends/atbm8830.c:65:2: note: Taking true branch
           if (ret !=3D 1) {
           ^
   drivers/media/dvb-frontends/atbm8830.c:66:3: note: Assuming 'debug' is 0
                   dprintk("%s: error reg=3D0x%04x, ret=3D%i\n", __func__, =
reg, ret);
                   ^
   drivers/media/dvb-frontends/atbm8830.c:17:7: note: expanded from macro '=
dprintk'
                   if (debug) \
                       ^~~~~
   drivers/media/dvb-frontends/atbm8830.c:66:3: note: Taking false branch
                   dprintk("%s: error reg=3D0x%04x, ret=3D%i\n", __func__, =
reg, ret);
                   ^
   drivers/media/dvb-frontends/atbm8830.c:17:3: note: expanded from macro '=
dprintk'
                   if (debug) \
                   ^
   drivers/media/dvb-frontends/atbm8830.c:66:3: note: Loop condition is fal=
se.  Exiting loop
                   dprintk("%s: error reg=3D0x%04x, ret=3D%i\n", __func__, =
reg, ret);
                   ^
   drivers/media/dvb-frontends/atbm8830.c:16:2: note: expanded from macro '=
dprintk'
           do { \
           ^
   drivers/media/dvb-frontends/atbm8830.c:67:3: note: Returning without wri=
ting to '*p_data'
                   return -EIO;
                   ^
   drivers/media/dvb-frontends/atbm8830.c:381:2: note: Returning from 'atbm=
8830_read_reg'
           atbm8830_read_reg(priv, REG_AGC_PWM_VAL + 1, &t);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/atbm8830.c:382:10: note: The left operand of=
 '&' is a garbage value
           pwm =3D t & 0x03;
                 ~ ^
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
>> drivers/gpu/drm/tegra/hub.c:243:17: warning: Value stored to 'dev' durin=
g its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D dc->dev;
                          ^~~   ~~~~~~~
   drivers/gpu/drm/tegra/hub.c:243:17: note: Value stored to 'dev' during i=
ts initialization is never read
           struct device *dev =3D dc->dev;
                          ^~~   ~~~~~~~
   drivers/gpu/drm/tegra/hub.c:381:2: warning: Value stored to 'value' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           value =3D tegra_plane_readl(plane, DC_WIN_CORE_IHUB_WGRP_FETCH_M=
ETER);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/gpu/drm/tegra/hub.c:381:2: note: Value stored to 'value' is neve=
r read
           value =3D tegra_plane_readl(plane, DC_WIN_CORE_IHUB_WGRP_FETCH_M=
ETER);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/gpu/drm/tegra/hub.c:395:2: warning: Value stored to 'value' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           value =3D tegra_plane_readl(plane, DC_WIN_CORE_PRECOMP_WGRP_PIPE=
_METER);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   drivers/gpu/drm/tegra/hub.c:395:2: note: Value stored to 'value' is neve=
r read
           value =3D tegra_plane_readl(plane, DC_WIN_CORE_PRECOMP_WGRP_PIPE=
_METER);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   drivers/gpu/drm/tegra/hub.c:400:2: warning: Value stored to 'value' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           value =3D tegra_plane_readl(plane, DC_WIN_CORE_IHUB_WGRP_POOL_CO=
NFIG);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/gpu/drm/tegra/hub.c:400:2: note: Value stored to 'value' is neve=
r read
           value =3D tegra_plane_readl(plane, DC_WIN_CORE_IHUB_WGRP_POOL_CO=
NFIG);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/gpu/drm/tegra/hub.c:588:3: warning: Value stored to 'value' is n=
ever read [clang-analyzer-deadcode.DeadStores]
                   value =3D HORIZONTAL_TAPS_5 | VERTICAL_TAPS_5;
                   ^
   drivers/gpu/drm/tegra/hub.c:588:3: note: Value stored to 'value' is neve=
r read
   drivers/gpu/drm/tegra/hub.c:593:4: warning: Value stored to 'value' is n=
ever read [clang-analyzer-deadcode.DeadStores]
                           value =3D HORIZONTAL_TAPS_2 | VERTICAL_TAPS_2;
                           ^
   drivers/gpu/drm/tegra/hub.c:593:4: note: Value stored to 'value' is neve=
r read
   drivers/gpu/drm/tegra/hub.c:891:2: warning: Value stored to 'value' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           value =3D tegra_dc_readl(dc, DC_DISP_IHUB_COMMON_DISPLAY_FETCH_M=
ETER);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/gpu/drm/tegra/hub.c:891:2: note: Value stored to 'value' is neve=
r read
           value =3D tegra_dc_readl(dc, DC_DISP_IHUB_COMMON_DISPLAY_FETCH_M=
ETER);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/firewire/ohci.c:1398:4: warning: 2nd function call argument is a=
n uninitialized value [clang-analyzer-core.CallAndMessage]
                           dma_unmap_single(ohci->card.device, payload_bus,
                           ^
   include/linux/dma-mapping.h:407:38: note: expanded from macro 'dma_unmap=
_single'
   #define dma_unmap_single(d, a, s, r) dma_unmap_single_attrs(d, a, s, r, =
0)
                                        ^
   drivers/firewire/ohci.c:2538:2: note: Calling 'at_context_transmit'
           at_context_transmit(&ohci->at_response_ctx, packet);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/firewire/ohci.c:1631:2: note: Loop condition is false.  Exiting =
loop
           spin_lock_irqsave(&ctx->ohci->lock, flags);
           ^
   include/linux/spinlock.h:393:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:254:2: note: expanded from macro 'raw_spin_lock=
_irqsave'
           do {                                            \
           ^
   drivers/firewire/ohci.c:1631:2: note: Loop condition is false.  Exiting =
loop
           spin_lock_irqsave(&ctx->ohci->lock, flags);
           ^
   include/linux/spinlock.h:391:43: note: expanded from macro 'spin_lock_ir=
qsave'
   #define spin_lock_irqsave(lock, flags)                          \
                                                                   ^
   drivers/firewire/ohci.c:1633:6: note: Assuming the condition is false
           if (HEADER_GET_DESTINATION(packet->header[0]) =3D=3D ctx->ohci->=
node_id &&
               ^
   drivers/firewire/ohci.c:1506:35: note: expanded from macro 'HEADER_GET_D=
ESTINATION'
   #define HEADER_GET_DESTINATION(q)       (((q) >> 16) & 0xffff)
                                           ^
   drivers/firewire/ohci.c:1633:70: note: Left side of '&&' is false
           if (HEADER_GET_DESTINATION(packet->header[0]) =3D=3D ctx->ohci->=
node_id &&
                                                                           =
    ^
   drivers/firewire/ohci.c:1640:8: note: Calling 'at_context_queue_packet'
           ret =3D at_context_queue_packet(ctx, packet);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/firewire/ohci.c:1288:20: note: 'payload_bus' declared without an=
 initial value
           dma_addr_t d_bus, payload_bus;
                             ^~~~~~~~~~~
   drivers/firewire/ohci.c:1295:6: note: Assuming 'd' is not equal to NULL
           if (d =3D=3D NULL) {
               ^~~~~~~~~
   drivers/firewire/ohci.c:1295:2: note: Taking false branch
           if (d =3D=3D NULL) {
           ^
   drivers/firewire/ohci.c:1311:2: note: Control jumps to 'case 10:'  at li=
ne 1346
           switch (tcode) {
           ^
   drivers/firewire/ohci.c:1351:3: note:  Execution continues on line 1359
                   break;
                   ^
   drivers/firewire/ohci.c:1359:2: note: Taking false branch
           BUILD_BUG_ON(sizeof(struct driver_data) > sizeof(struct descript=
or));
           ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
           BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
           ^
--
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   net/decnet/dn_route.c:1118:16: note: Left side of '&&' is false
                   BUG_ON(neigh && neigh->dev !=3D dev_out);
                                ^
   net/decnet/dn_route.c:1118:3: note: Taking false branch
                   BUG_ON(neigh && neigh->dev !=3D dev_out);
                   ^
   include/asm-generic/bug.h:161:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                  ^
   net/decnet/dn_route.c:1118:3: note: Loop condition is false.  Exiting lo=
op
                   BUG_ON(neigh && neigh->dev !=3D dev_out);
                   ^
   include/asm-generic/bug.h:161:27: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                             ^
   net/decnet/dn_route.c:1122:7: note: 'neigh' is null
                   if (neigh)
                       ^~~~~
   net/decnet/dn_route.c:1122:3: note: Taking false branch
                   if (neigh)
                   ^
   net/decnet/dn_route.c:1124:7: note: 'gateway' is equal to 0
                   if (gateway =3D=3D 0)
                       ^~~~~~~
   net/decnet/dn_route.c:1124:3: note: Taking true branch
                   if (gateway =3D=3D 0)
                   ^
   net/decnet/dn_route.c:1126:7: note: Assuming field 'saddr' is not equal =
to 0
                   if (fld.saddr =3D=3D 0) {
                       ^~~~~~~~~~~~~~
   net/decnet/dn_route.c:1126:3: note: Taking false branch
                   if (fld.saddr =3D=3D 0) {
                   ^
   net/decnet/dn_route.c:1135:3: note: Control jumps to line 1175
                   goto make_route;
                   ^
   net/decnet/dn_route.c:1175:6: note: Assuming the condition is false
           if (dev_out->flags & IFF_LOOPBACK)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/decnet/dn_route.c:1175:2: note: Taking false branch
           if (dev_out->flags & IFF_LOOPBACK)
           ^
   net/decnet/dn_route.c:1179:6: note: Assuming 'rt' is not equal to NULL
           if (rt =3D=3D NULL)
               ^~~~~~~~~~
   net/decnet/dn_route.c:1179:2: note: Taking false branch
           if (rt =3D=3D NULL)
           ^
   net/decnet/dn_route.c:1192:22: note: Assuming 'gateway' is not equal to 0
           rt->rt_gateway    =3D gateway ? gateway : fld.daddr;
                               ^~~~~~~
   net/decnet/dn_route.c:1192:22: note: '?' condition is true
   net/decnet/dn_route.c:1205:2: note: Taking false branch
           if (flags & RTCF_LOCAL)
           ^
   net/decnet/dn_route.c:1208:8: note: Calling 'dn_rt_set_next_hop'
           err =3D dn_rt_set_next_hop(rt, &res);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/decnet/dn_route.c:875:6: note: 'fi' is null
           if (fi) {
               ^~
   net/decnet/dn_route.c:875:2: note: Taking false branch
           if (fi) {
           ^
   net/decnet/dn_route.c:883:6: note: Assuming 'dev' is equal to NULL
           if (dev !=3D NULL && rt->n =3D=3D NULL) {
               ^~~~~~~~~~~
   net/decnet/dn_route.c:883:18: note: Left side of '&&' is false
           if (dev !=3D NULL && rt->n =3D=3D NULL) {
                           ^
   net/decnet/dn_route.c:890:39: note: Access to field 'mtu' results in a d=
ereference of a null pointer (loaded from field 'dev')
           if (dst_metric(&rt->dst, RTAX_MTU) > rt->dst.dev->mtu)
                                                ^       ~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
>> drivers/crypto/mxs-dcp.c:302:22: warning: Value stored to 'src' during i=
ts initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct scatterlist *src =3D req->src;
                               ^~~   ~~~~~~~~
   drivers/crypto/mxs-dcp.c:302:22: note: Value stored to 'src' during its =
initialization is never read
           struct scatterlist *src =3D req->src;
                               ^~~   ~~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   drivers/crypto/s5p-sss.c:1313:22: warning: Value stored to 'dd' during i=
ts initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct s5p_aes_dev *dd =3D ctx->dd;
                               ^~   ~~~~~~~
   drivers/crypto/s5p-sss.c:1313:22: note: Value stored to 'dd' during its =
initialization is never read
           struct s5p_aes_dev *dd =3D ctx->dd;
                               ^~   ~~~~~~~
   drivers/crypto/s5p-sss.c:1339:10: warning: Use of memory after it is fre=
ed [clang-analyzer-unix.Malloc]
           ctx->sg =3D NULL;
                   ^
   drivers/crypto/s5p-sss.c:1642:9: note: '?' condition is false
           return s5p_hash_init(req) ?: s5p_hash_finup(req);
                  ^
   drivers/crypto/s5p-sss.c:1642:31: note: Calling 's5p_hash_finup'
           return s5p_hash_init(req) ?: s5p_hash_finup(req);
                                        ^~~~~~~~~~~~~~~~~~~
   drivers/crypto/s5p-sss.c:1576:9: note: Calling 's5p_hash_update'
           err1 =3D s5p_hash_update(req);
                  ^~~~~~~~~~~~~~~~~~~~
   drivers/crypto/s5p-sss.c:1509:6: note: Assuming field 'nbytes' is not eq=
ual to 0
           if (!req->nbytes)
               ^~~~~~~~~~~~
   drivers/crypto/s5p-sss.c:1509:2: note: Taking false branch
           if (!req->nbytes)
           ^
   drivers/crypto/s5p-sss.c:1512:6: note: Assuming the condition is false
           if (ctx->bufcnt + req->nbytes <=3D BUFLEN) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/s5p-sss.c:1512:2: note: Taking false branch
           if (ctx->bufcnt + req->nbytes <=3D BUFLEN) {
           ^
   drivers/crypto/s5p-sss.c:1519:9: note: Calling 's5p_hash_enqueue'
           return s5p_hash_enqueue(req, true); /* HASH_OP_UPDATE */
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/s5p-sss.c:1493:9: note: Calling 's5p_hash_handle_queue'
           return s5p_hash_handle_queue(tctx->dd, req);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/s5p-sss.c:1380:2: note: Loop condition is false.  Exiting=
 loop
           spin_lock_irqsave(&dd->hash_lock, flags);
           ^
   include/linux/spinlock.h:393:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:254:2: note: expanded from macro 'raw_spin_lock=
_irqsave'
           do {                                            \
           ^
   drivers/crypto/s5p-sss.c:1380:2: note: Loop condition is false.  Exiting=
 loop
           spin_lock_irqsave(&dd->hash_lock, flags);
           ^
   include/linux/spinlock.h:391:43: note: expanded from macro 'spin_lock_ir=
qsave'
   #define spin_lock_irqsave(lock, flags)                          \
                                                                   ^
   drivers/crypto/s5p-sss.c:1381:6: note: 'req' is non-null
           if (req)
               ^~~
   drivers/crypto/s5p-sss.c:1381:2: note: Taking true branch
           if (req)
           ^
   drivers/crypto/s5p-sss.c:1384:6: note: Assuming the condition is false
           if (test_bit(HASH_FLAGS_BUSY, &dd->hash_flags)) {
               ^
   include/asm-generic/bitops/non-atomic.h:120:18: note: expanded from macr=
o 'test_bit'
   #define test_bit arch_test_bit
                    ^
   drivers/crypto/s5p-sss.c:1384:2: note: Taking false branch
           if (test_bit(HASH_FLAGS_BUSY, &dd->hash_flags)) {
           ^
   drivers/crypto/s5p-sss.c:1391:6: note: Assuming 'async_req' is non-null
           if (async_req)
               ^~~~~~~~~
   drivers/crypto/s5p-sss.c:1391:2: note: Taking true branch
           if (async_req)
           ^
   drivers/crypto/s5p-sss.c:1392:3: note: '?' condition is true
                   set_bit(HASH_FLAGS_BUSY, &dd->hash_flags);
                   ^
   arch/arm/include/asm/bitops.h:189:25: note: expanded from macro 'set_bit'
   #define set_bit(nr,p)                   ATOMIC_BITOP(set_bit,nr,p)
                                           ^
   arch/arm/include/asm/bitops.h:181:3: note: expanded from macro 'ATOMIC_B=
ITOP'
           (__builtin_constant_p(nr) ? ____atomic_##name(nr, p) : _##name(n=
r,p))
            ^
   drivers/crypto/s5p-sss.c:1396:7: note: 'async_req' is non-null
           if (!async_req)
                ^~~~~~~~~
   drivers/crypto/s5p-sss.c:1396:2: note: Taking false branch
           if (!async_req)
           ^
   drivers/crypto/s5p-sss.c:1399:6: note: Assuming 'backlog' is null
           if (backlog)
               ^~~~~~~
   drivers/crypto/s5p-sss.c:1399:2: note: Taking false branch
           if (backlog)
--
   include/linux/spinlock.h:393:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:254:2: note: expanded from macro 'raw_spin_lock=
_irqsave'
           do {                                            \
           ^
   net/mac80211/tx.c:4656:2: note: Loop condition is false.  Exiting loop
           spin_lock_irqsave(&local->queue_stop_reason_lock, flags);
           ^
   include/linux/spinlock.h:391:43: note: expanded from macro 'spin_lock_ir=
qsave'
   #define spin_lock_irqsave(lock, flags)                          \
                                                                   ^
   net/mac80211/tx.c:4657:14: note: Assuming 'i' is < field 'queues'
           for (i =3D 0; i < local->hw.queues; i++) {
                       ^~~~~~~~~~~~~~~~~~~~
   net/mac80211/tx.c:4657:2: note: Loop condition is true.  Entering loop b=
ody
           for (i =3D 0; i < local->hw.queues; i++) {
           ^
   net/mac80211/tx.c:4662:7: note: Assuming the condition is true
                   if (local->queue_stop_reasons[i] ||
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/tx.c:4662:36: note: Left side of '||' is true
                   if (local->queue_stop_reasons[i] ||
                                                    ^
   net/mac80211/tx.c:4664:4: note:  Execution continues on line 4657
                           continue;
                           ^
   net/mac80211/tx.c:4657:14: note: Assuming 'i' is < field 'queues'
           for (i =3D 0; i < local->hw.queues; i++) {
                       ^~~~~~~~~~~~~~~~~~~~
   net/mac80211/tx.c:4657:2: note: Loop condition is true.  Entering loop b=
ody
           for (i =3D 0; i < local->hw.queues; i++) {
           ^
   net/mac80211/tx.c:4662:7: note: Assuming the condition is true
                   if (local->queue_stop_reasons[i] ||
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/tx.c:4662:36: note: Left side of '||' is true
                   if (local->queue_stop_reasons[i] ||
                                                    ^
   net/mac80211/tx.c:4664:4: note:  Execution continues on line 4657
                           continue;
                           ^
   net/mac80211/tx.c:4657:14: note: Assuming 'i' is < field 'queues'
           for (i =3D 0; i < local->hw.queues; i++) {
                       ^~~~~~~~~~~~~~~~~~~~
   net/mac80211/tx.c:4657:2: note: Loop condition is true.  Entering loop b=
ody
           for (i =3D 0; i < local->hw.queues; i++) {
           ^
   net/mac80211/tx.c:4662:7: note: Assuming the condition is false
                   if (local->queue_stop_reasons[i] ||
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/tx.c:4662:7: note: Left side of '||' is false
   net/mac80211/tx.c:4663:7: note: Assuming the condition is false
                       skb_queue_empty(&local->pending[i]))
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/tx.c:4662:3: note: Taking false branch
                   if (local->queue_stop_reasons[i] ||
                   ^
   net/mac80211/tx.c:4666:3: note: Loop condition is true.  Entering loop b=
ody
                   while (!skb_queue_empty(&local->pending[i])) {
                   ^
   net/mac80211/tx.c:4670:16: note: Assuming field 'vif' is non-null
                           if (WARN_ON(!info->control.vif)) {
                                       ^
   include/asm-generic/bug.h:166:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   net/mac80211/tx.c:4670:4: note: Taking false branch
                           if (WARN_ON(!info->control.vif)) {
                           ^
   net/mac80211/tx.c:4678:11: note: Calling 'ieee80211_tx_pending_skb'
                           txok =3D ieee80211_tx_pending_skb(local, skb);
                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/tx.c:4610:6: note: Assuming the condition is false
           if (info->control.flags & IEEE80211_TX_INTCFL_NEED_TXPROCESSING)=
 {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/tx.c:4610:2: note: Taking false branch
           if (info->control.flags & IEEE80211_TX_INTCFL_NEED_TXPROCESSING)=
 {
           ^
   net/mac80211/tx.c:4618:13: note: Assuming the condition is false
           } else if (info->flags & IEEE80211_TX_CTL_HW_80211_ENCAP) {
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/tx.c:4618:9: note: Taking false branch
           } else if (info->flags & IEEE80211_TX_CTL_HW_80211_ENCAP) {
                  ^
   net/mac80211/tx.c:4631:3: note: Calling '__skb_queue_head_init'
                   __skb_queue_head_init(&skbs);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/tx.c:4631:3: note: Returning from '__skb_queue_head_init'
                   __skb_queue_head_init(&skbs);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/tx.c:4632:3: note: Calling '__skb_queue_tail'
                   __skb_queue_tail(&skbs, skb);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/skbuff.h:2081:2: note: Calling '__skb_queue_before'
           __skb_queue_before(list, (struct sk_buff *)list, newsk);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/skbuff.h:2048:2: note: 2nd function call argument is an un=
initialized value
           __skb_insert(newsk, next->prev, next, list);
           ^                   ~~~~~~~~~~
>> net/mac80211/tx.c:665:24: warning: Value stored to 'hdr' during its init=
ialization is never read [clang-analyzer-deadcode.DeadStores]
           struct ieee80211_hdr *hdr =3D (void *)tx->skb->data;
                                 ^~~   ~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/tx.c:665:24: note: Value stored to 'hdr' during its initial=
ization is never read
           struct ieee80211_hdr *hdr =3D (void *)tx->skb->data;
                                 ^~~   ~~~~~~~~~~~~~~~~~~~~~
>> net/mac80211/tx.c:670:7: warning: Value stored to 'encap' during its ini=
tialization is never read [clang-analyzer-deadcode.DeadStores]
           bool encap =3D info->flags & IEEE80211_TX_CTL_HW_80211_ENCAP;
                ^~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/tx.c:670:7: note: Value stored to 'encap' during its initia=
lization is never read
           bool encap =3D info->flags & IEEE80211_TX_CTL_HW_80211_ENCAP;
                ^~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/tx.c:2596:4: warning: Null pointer passed as 2nd argument t=
o memory copy function [clang-analyzer-unix.cstring.NullArg]
                           memcpy(hdr.addr1, sta->sta.addr, ETH_ALEN);
                           ^                 ~~~~~~~~~~~~~
   net/mac80211/tx.c:2578:2: note: Taking true branch
           if (IS_ERR(sta))
           ^
   net/mac80211/tx.c:2591:2: note: Control jumps to 'case NL80211_IFTYPE_AP=
_VLAN:'  at line 2592
           switch (sdata->vif.type) {
           ^
   net/mac80211/tx.c:2593:7: note: Assuming field 'use_4addr' is true
                   if (sdata->wdev.use_4addr) {
                       ^~~~~~~~~~~~~~~~~~~~~
   net/mac80211/tx.c:2593:3: note: Taking true branch
                   if (sdata->wdev.use_4addr) {
                   ^
   net/mac80211/tx.c:2596:4: note: Null pointer passed as 2nd argument to m=
emory copy function
                           memcpy(hdr.addr1, sta->sta.addr, ETH_ALEN);
                           ^                 ~~~~~~~~~~~~~
   net/mac80211/tx.c:3476:11: warning: Dereference of null pointer [clang-a=
nalyzer-core.NullDereference]
                   switch (key->conf.cipher) {
                           ^
   net/mac80211/tx.c:5751:6: note: Assuming 'skb' is non-null
           if (!skb)
               ^~~~
   net/mac80211/tx.c:5751:2: note: Taking false branch
           if (!skb)
           ^
   net/mac80211/tx.c:5754:2: note: Calling 'skb_reserve'
           skb_reserve(skb, local->hw.extra_tx_headroom);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/skbuff.h:2414:1: note: Returning without writing to 'skb->=
.sk', which participates in a condition later
   }
   ^
   net/mac80211/tx.c:5754:2: note: Returning from 'skb_reserve'
           skb_reserve(skb, local->hw.extra_tx_headroom);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/tx.c:5763:2: note: Calling '__ieee80211_subif_start_xmit'
           __ieee80211_subif_start_xmit(skb, skb->dev, 0,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/tx.c:4166:6: note: Assuming the condition is false
           if (unlikely(skb->len < ETH_HLEN)) {
               ^
   include/linux/compiler.h:78:22: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/tx.c:4166:2: note: Taking false branch
           if (unlikely(skb->len < ETH_HLEN)) {
           ^
   net/mac80211/tx.c:4173:2: note: Taking false branch
           if (ieee80211_lookup_ra_sta(sdata, skb, &sta))
           ^
   net/mac80211/tx.c:4176:2: note: Taking false branch
           if (IS_ERR(sta))
           ^
   net/mac80211/tx.c:4179:6: note: Assuming field 'wake_tx_queue' is null
           if (local->ops->wake_tx_queue) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/tx.c:4179:2: note: Taking false branch
           if (local->ops->wake_tx_queue) {
           ^
   net/mac80211/tx.c:4187:6: note: 'sta' is non-null
           if (sta) {
               ^~~
   net/mac80211/tx.c:4187:2: note: Taking true branch
           if (sta) {
           ^
   net/mac80211/tx.c:4192:13: note: Left side of '||' is false
                   fast_tx =3D rcu_dereference(sta->fast_tx);
                             ^
   include/linux/rcupdate.h:596:28: note: expanded from macro 'rcu_derefere=
nce'
   #define rcu_dereference(p) rcu_dereference_check(p, 0)
                              ^
   include/linux/rcupdate.h:528:2: note: expanded from macro 'rcu_dereferen=
ce_check'
           __rcu_dereference_check((p), (c) || rcu_read_lock_held(), __rcu)
           ^
   include/linux/rcupdate.h:389:48: note: expanded from macro '__rcu_derefe=
rence_check'
           typeof(*p) *________p1 =3D (typeof(*p) *__force)READ_ONCE(p); \
                                                         ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:290:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   net/mac80211/tx.c:4192:13: note: Left side of '||' is false
                   fast_tx =3D rcu_dereference(sta->fast_tx);
                             ^
   include/linux/rcupdate.h:596:28: note: expanded from macro 'rcu_derefere=
nce'
   #define rcu_dereference(p) rcu_dereference_check(p, 0)
                              ^
   include/linux/rcupdate.h:528:2: note: expanded from macro 'rcu_dereferen=
ce_check'
           __rcu_dereference_check((p), (c) || rcu_read_lock_held(), __rcu)
--
                   ^
   net/can/j1939/main.c:150:28: note: Loop condition is false.  Exiting loop
           struct j1939_priv *priv =3D container_of(kref, struct j1939_priv=
, kref);
                                     ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:300:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   net/can/j1939/main.c:153:2: note: Taking false branch
           netdev_dbg(priv->ndev, "%s: 0x%p\n", __func__, priv);
           ^
   include/linux/netdevice.h:5333:2: note: expanded from macro 'netdev_dbg'
           if (0)                                                  \
           ^
   net/can/j1939/main.c:155:2: note: Assuming '__ret_warn_on' is not equal =
to 0
           WARN_ON_ONCE(!list_empty(&priv->active_session_list));
           ^
   include/asm-generic/bug.h:179:33: note: expanded from macro 'WARN_ON_ONC=
E'
   #define WARN_ON_ONCE(condition) WARN_ON(condition)
                                   ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:167:2: note: expanded from macro 'WARN_ON'
           unlikely(__ret_warn_on);                                        \
           ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   net/can/j1939/main.c:156:2: note: Assuming '__ret_warn_on' is not equal =
to 0
           WARN_ON_ONCE(!list_empty(&priv->ecus));
           ^
   include/asm-generic/bug.h:179:33: note: expanded from macro 'WARN_ON_ONC=
E'
   #define WARN_ON_ONCE(condition) WARN_ON(condition)
                                   ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:167:2: note: expanded from macro 'WARN_ON'
           unlikely(__ret_warn_on);                                        \
           ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   net/can/j1939/main.c:157:2: note: Assuming '__ret_warn_on' is not equal =
to 0
           WARN_ON_ONCE(!list_empty(&priv->j1939_socks));
           ^
   include/asm-generic/bug.h:179:33: note: expanded from macro 'WARN_ON_ONC=
E'
   #define WARN_ON_ONCE(condition) WARN_ON(condition)
                                   ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:167:2: note: expanded from macro 'WARN_ON'
           unlikely(__ret_warn_on);                                        \
           ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   net/can/j1939/main.c:160:2: note: Memory is released
           kfree(priv);
           ^~~~~~~~~~~
   include/linux/kref.h:65:3: note: Returning; memory was released
                   release(kref);
                   ^~~~~~~~~~~~~
   net/can/j1939/main.c:165:2: note: Returning; memory was released
           kref_put(&priv->kref, __j1939_priv_release);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/can/j1939/main.c:182:3: note: Returning; memory was released via 1st=
 parameter
                   j1939_priv_put(priv);
                   ^~~~~~~~~~~~~~~~~~~~
   net/can/j1939/main.c:281:8: note: Returning; memory was released via 1st=
 parameter
           ret =3D j1939_can_rx_register(priv);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/can/j1939/main.c:282:6: note: 'ret' is < 0
           if (ret < 0)
               ^~~
   net/can/j1939/main.c:282:2: note: Taking true branch
           if (ret < 0)
           ^
   net/can/j1939/main.c:283:3: note: Control jumps to line 288
                   goto out_priv_put;
                   ^
   net/can/j1939/main.c:290:2: note: Attempt to free released memory
           kfree(priv);
           ^~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/video/fbdev/via/viafbdev.c:147:2: warning: Call to function 'str=
cpy' is insecure as it does not provide bounding of the memory buffer. Repl=
ace unbounded copy functions with analogous functions that support length a=
rguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.st=
rcpy]
           strcpy(fix->id, viafb_name);
           ^~~~~~
   drivers/video/fbdev/via/viafbdev.c:147:2: note: Call to function 'strcpy=
' is insecure as it does not provide bounding of the memory buffer. Replace=
 unbounded copy functions with analogous functions that support length argu=
ments such as 'strlcpy'. CWE-119
           strcpy(fix->id, viafb_name);
           ^~~~~~
>> drivers/video/fbdev/via/viafbdev.c:1801:19: warning: Assigned value is g=
arbage or undefined [clang-analyzer-core.uninitialized.Assign]
           default_var.yres =3D default_yres;
                            ^ ~~~~~~~~~~~~
   drivers/video/fbdev/via/viafbdev.c:1723:20: note: 'default_yres' declare=
d without an initial value
           u32 default_xres, default_yres;
                             ^~~~~~~~~~~~
   drivers/video/fbdev/via/viafbdev.c:1728:2: note: Taking false branch
           DEBUG_MSG(KERN_INFO "VIAFB PCI Probe!!\n");
           ^
   drivers/video/fbdev/via/debug.h:19:30: note: expanded from macro 'DEBUG_=
MSG'
   #define DEBUG_MSG(f, a...)   no_printk(f, ## a)
                                ^
   include/linux/printk.h:131:2: note: expanded from macro 'no_printk'
           if (0)                                          \
           ^
   drivers/video/fbdev/via/viafbdev.c:1738:6: note: Assuming 'viafbinfo' is=
 non-null
           if (!viafbinfo)
               ^~~~~~~~~~
   drivers/video/fbdev/via/viafbdev.c:1738:2: note: Taking false branch
           if (!viafbinfo)
           ^
   drivers/video/fbdev/via/viafbdev.c:1752:6: note: Assuming 'viafb_dual_fb=
' is 0
           if (viafb_dual_fb)
               ^~~~~~~~~~~~~
   drivers/video/fbdev/via/viafbdev.c:1752:2: note: Taking false branch
           if (viafb_dual_fb)
           ^
   drivers/video/fbdev/via/viafbdev.c:1776:6: note: Assuming 'viafb_accel' =
is 0
           if (viafb_accel && !viafb_setup_engine(viafbinfo)) {
               ^~~~~~~~~~~
   drivers/video/fbdev/via/viafbdev.c:1776:18: note: Left side of '&&' is f=
alse
           if (viafb_accel && !viafb_setup_engine(viafbinfo)) {
                           ^
   drivers/video/fbdev/via/viafbdev.c:1785:6: note: Assuming 'viafb_second_=
size' is 0
           if (viafb_second_size && (viafb_second_size < 8)) {
               ^~~~~~~~~~~~~~~~~
   drivers/video/fbdev/via/viafbdev.c:1785:24: note: Left side of '&&' is f=
alse
           if (viafb_second_size && (viafb_second_size < 8)) {
                                 ^
   drivers/video/fbdev/via/viafbdev.c:1794:2: note: Calling 'parse_mode'
           parse_mode(viafb_mode, viaparinfo->shared->iga1_devices,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/via/viafbdev.c:1630:6: note: Assuming 'str' is non-n=
ull
           if (!str) {
               ^~~~
   drivers/video/fbdev/via/viafbdev.c:1630:2: note: Taking false branch
           if (!str) {
           ^
   drivers/video/fbdev/via/viafbdev.c:1652:6: note: Assuming the condition =
is true
           if (ptr[0] !=3D 'x')
               ^~~~~~~~~~~~~
   drivers/video/fbdev/via/viafbdev.c:1652:2: note: Taking true branch
           if (ptr[0] !=3D 'x')
           ^
   drivers/video/fbdev/via/viafbdev.c:1653:3: note: Returning without writi=
ng to '*yres'
                   return -EINVAL;
                   ^
   drivers/video/fbdev/via/viafbdev.c:1794:2: note: Returning from 'parse_m=
ode'
           parse_mode(viafb_mode, viaparinfo->shared->iga1_devices,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/via/viafbdev.c:1796:6: note: Assuming 'viafb_SAMM_ON=
' is not equal to 1
           if (viafb_SAMM_ON =3D=3D 1)
               ^~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/via/viafbdev.c:1796:2: note: Taking false branch
           if (viafb_SAMM_ON =3D=3D 1)
           ^
   drivers/video/fbdev/via/viafbdev.c:1801:19: note: Assigned value is garb=
age or undefined
           default_var.yres =3D default_yres;
                            ^ ~~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/mtd/nand/onenand/onenand_bbt.c:72:12: warning: Although the valu=
e stored to 'ooblen' is used in the enclosing expression, the value is neve=
r actually read from 'ooblen' [clang-analyzer-deadcode.DeadStores]
           scanlen =3D ooblen =3D 0;
                     ^        ~
   drivers/mtd/nand/onenand/onenand_bbt.c:72:12: note: Although the value s=
tored to 'ooblen' is used in the enclosing expression, the value is never a=
ctually read from 'ooblen'
           scanlen =3D ooblen =3D 0;
                     ^        ~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/mtd/nand/onenand/generic.c:66:2: warning: Value stored to 'err' =
is never read [clang-analyzer-deadcode.DeadStores]
           err =3D mtd_device_register(&info->mtd, pdata ? pdata->parts : N=
ULL,
           ^
   drivers/mtd/nand/onenand/generic.c:66:2: note: Value stored to 'err' is =
never read
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   drivers/mtd/nand/raw/nand_base.c:371:16: warning: The left operand of '&=
' is a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           return status & NAND_STATUS_WP ? 0 : 1;
                         ^
   drivers/mtd/nand/raw/nand_base.c:5954:27: note: Left side of '&&' is fal=
se
           struct nand_chip *chip =3D container_of(nand, struct nand_chip,
                                    ^
   include/linux/kernel.h:495:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/mtd/nand/raw/nand_base.c:5954:27: note: Taking false branch
--
                     ^~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:180:46: note: expanded from macro 'WARN_ONCE'
   #define WARN_ONCE(condition, format...) WARN(condition, format)
                                                ^~~~~~~~~
   include/asm-generic/bug.h:173:25: note: expanded from macro 'WARN'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   net/core/dev.c:8190:2: note: Taking false branch
           ASSERT_RTNL();
           ^
   include/linux/rtnetlink.h:110:2: note: expanded from macro 'ASSERT_RTNL'
           WARN_ONCE(!rtnl_is_locked(), \
           ^
   include/asm-generic/bug.h:180:41: note: expanded from macro 'WARN_ONCE'
   #define WARN_ONCE(condition, format...) WARN(condition, format)
                                           ^
   include/asm-generic/bug.h:174:2: note: expanded from macro 'WARN'
           no_printk(format);                                              \
           ^
   include/linux/printk.h:131:2: note: expanded from macro 'no_printk'
           if (0)                                          \
           ^
   net/core/dev.c:8192:28: note: Assuming pointer value is null
           changeupper_info.master =3D netdev_master_upper_dev_get(dev) =3D=
=3D upper_dev;
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   net/core/dev.c:8197:46: note: Passing null pointer value via 2nd paramet=
er 'upper_dev'
           __netdev_adjacent_dev_unlink_neighbour(dev, upper_dev);
                                                       ^~~~~~~~~
   net/core/dev.c:8197:2: note: Calling '__netdev_adjacent_dev_unlink_neigh=
bour'
           __netdev_adjacent_dev_unlink_neighbour(dev, upper_dev);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/core/dev.c:8047:42: note: Passing null pointer value via 2nd paramet=
er 'upper_dev'
           __netdev_adjacent_dev_unlink_lists(dev, upper_dev, 1,
                                                   ^~~~~~~~~
   net/core/dev.c:8047:2: note: Calling '__netdev_adjacent_dev_unlink_lists'
           __netdev_adjacent_dev_unlink_lists(dev, upper_dev, 1,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/core/dev.c:8030:36: note: Passing null pointer value via 2nd paramet=
er 'adj_dev'
           __netdev_adjacent_dev_remove(dev, upper_dev, ref_nr, up_list);
                                             ^~~~~~~~~
   net/core/dev.c:8030:2: note: Calling '__netdev_adjacent_dev_remove'
           __netdev_adjacent_dev_remove(dev, upper_dev, ref_nr, up_list);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/core/dev.c:7968:2: note: Taking false branch
           pr_debug("Remove adjacency: dev %s adj_dev %s ref_nr %d\n",
           ^
   include/linux/printk.h:576:2: note: expanded from macro 'pr_debug'
           no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:131:2: note: expanded from macro 'no_printk'
           if (0)                                          \
           ^
   net/core/dev.c:7973:6: note: Assuming 'adj' is non-null
           if (!adj) {
               ^~~~
   net/core/dev.c:7973:2: note: Taking false branch
           if (!adj) {
           ^
   net/core/dev.c:7980:6: note: Assuming 'ref_nr' is >=3D field 'ref_nr'
           if (adj->ref_nr > ref_nr) {
               ^~~~~~~~~~~~~~~~~~~~
   net/core/dev.c:7980:2: note: Taking false branch
           if (adj->ref_nr > ref_nr) {
           ^
   net/core/dev.c:7988:6: note: Assuming field 'master' is false
           if (adj->master)
               ^~~~~~~~~~~
   net/core/dev.c:7988:2: note: Taking false branch
           if (adj->master)
           ^
   net/core/dev.c:7991:41: note: Passing null pointer value via 2nd paramet=
er 'adj_dev'
           if (netdev_adjacent_is_neigh_list(dev, adj_dev, dev_list))
                                                  ^~~~~~~
   net/core/dev.c:7991:6: note: Calling 'netdev_adjacent_is_neigh_list'
           if (netdev_adjacent_is_neigh_list(dev, adj_dev, dev_list))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/core/dev.c:7894:43: note: Left side of '||' is true
           return (dev_list =3D=3D &dev->adj_list.upper ||
                                                    ^
   net/core/dev.c:7896:32: note: Passing null pointer value via 1st paramet=
er 'dev'
                   net_eq(dev_net(dev), dev_net(adj_dev));
                                                ^~~~~~~
   net/core/dev.c:7896:24: note: Calling 'dev_net'
                   net_eq(dev_net(dev), dev_net(adj_dev));
                                        ^~~~~~~~~~~~~~~~
   include/linux/netdevice.h:2432:19: note: Passing null pointer value via =
1st parameter 'pnet'
           return read_pnet(&dev->nd_net);
                            ^~~~~~~~~~~~
   include/linux/netdevice.h:2432:9: note: Calling 'read_pnet'
           return read_pnet(&dev->nd_net);
                  ^~~~~~~~~~~~~~~~~~~~~~~
   include/net/net_namespace.h:327:9: note: Access to field 'net' results i=
n a dereference of a null pointer (loaded from variable 'pnet')
           return pnet->net;
                  ^~~~
   net/core/dev.c:958:2: warning: Call to function 'strcpy' is insecure as =
it does not provide bounding of the memory buffer. Replace unbounded copy f=
unctions with analogous functions that support length arguments such as 'st=
rlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(name, dev->name);
           ^~~~~~
   net/core/dev.c:958:2: note: Call to function 'strcpy' is insecure as it =
does not provide bounding of the memory buffer. Replace unbounded copy func=
tions with analogous functions that support length arguments such as 'strlc=
py'. CWE-119
           strcpy(name, dev->name);
           ^~~~~~
>> net/core/dev.c:3191:4: warning: Value stored to 'name' is never read [cl=
ang-analyzer-deadcode.DeadStores]
                           name =3D dev_driver_string(dev->dev.parent);
                           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/core/dev.c:3191:4: note: Value stored to 'name' is never read
                           name =3D dev_driver_string(dev->dev.parent);
                           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/core/dev.c:3193:4: warning: Value stored to 'name' is never read [cl=
ang-analyzer-deadcode.DeadStores]
                           name =3D netdev_name(dev);
                           ^      ~~~~~~~~~~~~~~~~
   net/core/dev.c:3193:4: note: Value stored to 'name' is never read
                           name =3D netdev_name(dev);
                           ^      ~~~~~~~~~~~~~~~~
   net/core/dev.c:5996:2: warning: Null pointer passed as 2nd argument to m=
emory copy function [clang-analyzer-unix.cstring.NullArg]
           memcpy(skb_tail_pointer(skb), NAPI_GRO_CB(skb)->frag0, grow);
           ^
   net/core/dev.c:6327:24: note: Calling 'napi_frags_skb'
           struct sk_buff *skb =3D napi_frags_skb(napi);
                                 ^~~~~~~~~~~~~~~~~~~~
   net/core/dev.c:6298:15: note: Calling 'skb_gro_header_hard'
           if (unlikely(skb_gro_header_hard(skb, hlen))) {
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   net/core/dev.c:6298:15: note: Returning from 'skb_gro_header_hard'
           if (unlikely(skb_gro_header_hard(skb, hlen))) {
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   net/core/dev.c:6298:2: note: Taking true branch
           if (unlikely(skb_gro_header_hard(skb, hlen))) {
           ^
   net/core/dev.c:6299:9: note: Calling 'skb_gro_header_slow'
                   eth =3D skb_gro_header_slow(skb, hlen, 0);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/netdevice.h:3045:7: note: Calling 'pskb_may_pull'
           if (!pskb_may_pull(skb, hlen))
                ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/skbuff.h:2356:13: note: Assuming the condition is true
           if (likely(len <=3D skb_headlen(skb)))
                      ^
   include/linux/compiler.h:77:40: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                               ^
   include/linux/skbuff.h:2356:2: note: Taking true branch
           if (likely(len <=3D skb_headlen(skb)))
           ^
   include/linux/netdevice.h:3045:7: note: Returning from 'pskb_may_pull'
           if (!pskb_may_pull(skb, hlen))
                ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/netdevice.h:3045:2: note: Taking false branch
           if (!pskb_may_pull(skb, hlen))
           ^
   include/linux/netdevice.h:3048:2: note: Calling 'skb_gro_frag0_invalidat=
e'
           skb_gro_frag0_invalidate(skb);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/netdevice.h:3038:2: note: Null pointer value stored to fie=
ld 'frag0'
           NAPI_GRO_CB(skb)->frag0 =3D NULL;
           ^
   include/linux/netdevice.h:2590:26: note: expanded from macro 'NAPI_GRO_C=
B'
   #define NAPI_GRO_CB(skb) ((struct napi_gro_cb *)(skb)->cb)
                            ^
   include/linux/netdevice.h:3048:2: note: Returning from 'skb_gro_frag0_in=
validate'
           skb_gro_frag0_invalidate(skb);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/core/dev.c:6299:9: note: Returning from 'skb_gro_header_slow'
                   eth =3D skb_gro_header_slow(skb, hlen, 0);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/core/dev.c:6300:16: note: Assuming 'eth' is non-null
                   if (unlikely(!eth)) {
                                ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   net/core/dev.c:6300:3: note: Taking false branch
                   if (unlikely(!eth)) {
                   ^
   net/core/dev.c:6312:2: note: Calling '__skb_pull'
           __skb_pull(skb, hlen);
           ^~~~~~~~~~~~~~~~~~~~~
   include/linux/skbuff.h:2329:9: note: Assuming field 'len' is >=3D field =
'data_len'
           BUG_ON(skb->len < skb->data_len);
                  ^
   include/asm-generic/bug.h:161:45: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                               ^~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/skbuff.h:2329:2: note: Taking false branch
           BUG_ON(skb->len < skb->data_len);
           ^
   include/asm-generic/bug.h:161:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                  ^
   include/linux/skbuff.h:2329:2: note: Loop condition is false.  Exiting l=
oop
           BUG_ON(skb->len < skb->data_len);
           ^
   include/asm-generic/bug.h:161:27: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
--
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletim=
e_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
           ^
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:300:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   include/linux/skbuff.h:1860:6: note: Assuming 'skb' is equal to 'list_'
           if (skb =3D=3D (struct sk_buff *)list_)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/skbuff.h:1860:2: note: Taking true branch
           if (skb =3D=3D (struct sk_buff *)list_)
           ^
   include/linux/skbuff.h:1862:2: note: Returning null pointer (loaded from=
 'skb'), which participates in a condition later
           return skb;
           ^~~~~~~~~~
   net/mac80211/rx.c:1109:25: note: Returning from 'skb_peek_tail'
           struct sk_buff *tail =3D skb_peek_tail(frames);
                                  ^~~~~~~~~~~~~~~~~~~~~
   net/mac80211/rx.c:1112:6: note: Assuming the condition is false
           if (tid_agg_rx->reorder_buf_filtered & BIT_ULL(index))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/rx.c:1112:2: note: Taking false branch
           if (tid_agg_rx->reorder_buf_filtered & BIT_ULL(index))
           ^
   net/mac80211/rx.c:1115:7: note: 'tail' is null
           if (!tail)
                ^~~~
   net/mac80211/rx.c:1115:2: note: Taking true branch
           if (!tail)
           ^
   net/mac80211/rx.c:1116:3: note: Returning without writing to 'tid_agg_rx=
->stored_mpdu_num', which participates in a condition later
                   return false;
                   ^
   net/mac80211/rx.c:1116:3: note: Returning without writing to 'tid_agg_rx=
->buf_size'
   net/mac80211/rx.c:1116:3: note: Returning zero, which participates in a =
condition later
                   return false;
                   ^~~~~~~~~~~~
   net/mac80211/rx.c:1194:7: note: Returning from 'ieee80211_rx_reorder_rea=
dy'
           if (!ieee80211_rx_reorder_ready(tid_agg_rx, index) &&
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/rx.c:1194:6: note: Left side of '&&' is true
           if (!ieee80211_rx_reorder_ready(tid_agg_rx, index) &&
               ^
   net/mac80211/rx.c:1195:6: note: Assuming field 'stored_mpdu_num' is not =
equal to 0
               tid_agg_rx->stored_mpdu_num) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/rx.c:1194:2: note: Taking true branch
           if (!ieee80211_rx_reorder_ready(tid_agg_rx, index) &&
           ^
   net/mac80211/rx.c:1201:48: note: Assuming 'j' is equal to 'index'
                   for (j =3D (index + 1) % tid_agg_rx->buf_size; j !=3D in=
dex;
                                                                ^~~~~~~~~~
   net/mac80211/rx.c:1201:3: note: Loop condition is false. Execution conti=
nues on line 1236
                   for (j =3D (index + 1) % tid_agg_rx->buf_size; j !=3D in=
dex;
                   ^
   net/mac80211/rx.c:1236:18: note: Field 'stored_mpdu_num' is not equal to=
 0
           if (tid_agg_rx->stored_mpdu_num) {
                           ^
   net/mac80211/rx.c:1236:2: note: Taking true branch
           if (tid_agg_rx->stored_mpdu_num) {
           ^
   net/mac80211/rx.c:1239:10: note: Assuming the condition is true
                   for (; j !=3D (index - 1) % tid_agg_rx->buf_size;
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/rx.c:1239:3: note: Loop condition is true.  Entering loop b=
ody
                   for (; j !=3D (index - 1) % tid_agg_rx->buf_size;
                   ^
   net/mac80211/rx.c:1241:8: note: Calling 'ieee80211_rx_reorder_ready'
                           if (ieee80211_rx_reorder_ready(tid_agg_rx, j))
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/rx.c:1112:2: note: Taking false branch
           if (tid_agg_rx->reorder_buf_filtered & BIT_ULL(index))
           ^
   net/mac80211/rx.c:1115:6: note: Assuming 'tail' is null, which participa=
tes in a condition later
           if (!tail)
               ^~~~~
   net/mac80211/rx.c:1115:2: note: Taking true branch
           if (!tail)
           ^
   net/mac80211/rx.c:1116:3: note: Returning without writing to 'tid_agg_rx=
->buf_size'
                   return false;
                   ^
   net/mac80211/rx.c:1116:3: note: Returning zero, which participates in a =
condition later
                   return false;
                   ^~~~~~~~~~~~
   net/mac80211/rx.c:1241:8: note: Returning from 'ieee80211_rx_reorder_rea=
dy'
                           if (ieee80211_rx_reorder_ready(tid_agg_rx, j))
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/rx.c:1241:4: note: Taking false branch
                           if (ieee80211_rx_reorder_ready(tid_agg_rx, j))
                           ^
   net/mac80211/rx.c:1240:20: note: Division by zero
                        j =3D (j + 1) % tid_agg_rx->buf_size) {
                            ~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
>> net/mac80211/rx.c:5009:2: warning: Assigned value is garbage or undefine=
d [clang-analyzer-core.uninitialized.Assign]
           list_for_each_entry_safe(skb, tmp, &list, list) {
           ^
   include/linux/list.h:716:7: note: expanded from macro 'list_for_each_ent=
ry_safe'
                   n =3D list_next_entry(pos, member);                     =
  \
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:555:2: note: expanded from macro 'list_next_entry'
           list_entry((pos)->member.next, typeof(*(pos)), member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:494:2: note: expanded from macro 'container_of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
           ^              ~~~~~~~~~~~~~
   net/mac80211/rx.c:5001:2: note: Calling 'ieee80211_rx_list'
           ieee80211_rx_list(hw, pubsta, skb, &list);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/rx.c:4876:2: note: Assuming '__ret_warn_on' is not equal to=
 0
           WARN_ON_ONCE(softirq_count() =3D=3D 0);
           ^
   include/asm-generic/bug.h:179:33: note: expanded from macro 'WARN_ON_ONC=
E'
   #define WARN_ON_ONCE(condition) WARN_ON(condition)
                                   ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:167:2: note: expanded from macro 'WARN_ON'
           unlikely(__ret_warn_on);                                        \
           ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   net/mac80211/rx.c:4878:14: note: Assuming field 'band' is >=3D NUM_NL802=
11_BANDS
           if (WARN_ON(status->band >=3D NUM_NL80211_BANDS))
                       ^
   include/asm-generic/bug.h:166:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   net/mac80211/rx.c:4878:2: note: Taking true branch
           if (WARN_ON(status->band >=3D NUM_NL80211_BANDS))
           ^
   net/mac80211/rx.c:4879:3: note: Control jumps to line 4984
                   goto drop;
                   ^
   net/mac80211/rx.c:5001:2: note: Returning from 'ieee80211_rx_list'
           ieee80211_rx_list(hw, pubsta, skb, &list);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/rx.c:5004:6: note: Assuming 'napi' is non-null
           if (!napi) {
               ^~~~~
   net/mac80211/rx.c:5004:2: note: Taking false branch
           if (!napi) {
           ^
   net/mac80211/rx.c:5009:2: note: Left side of '&&' is false
           list_for_each_entry_safe(skb, tmp, &list, list) {
           ^
   include/linux/list.h:715:13: note: expanded from macro 'list_for_each_en=
try_safe'
           for (pos =3D list_first_entry(head, typeof(*pos), member),      =
  \
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
   net/mac80211/rx.c:5009:2: note: Taking false branch
           list_for_each_entry_safe(skb, tmp, &list, list) {
           ^
   include/linux/list.h:715:13: note: expanded from macro 'list_for_each_en=
try_safe'
           for (pos =3D list_first_entry(head, typeof(*pos), member),      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:302:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   net/mac80211/rx.c:5009:2: note: Loop condition is false.  Exiting loop
           list_for_each_entry_safe(skb, tmp, &list, list) {
           ^
   include/linux/list.h:715:13: note: expanded from macro 'list_for_each_en=
try_safe'
           for (pos =3D list_first_entry(head, typeof(*pos), member),      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)

vim +/fc_req +193 drivers/clk/mmp/clk-mix.c

ee81f4ee2a3632 Chao Xie        2014-10-31  133  =

ee81f4ee2a3632 Chao Xie        2014-10-31  134  static int _set_rate(struct=
 mmp_clk_mix *mix, u32 mux_val, u32 div_val,
ee81f4ee2a3632 Chao Xie        2014-10-31  135  			unsigned int change_mux,=
 unsigned int change_div)
ee81f4ee2a3632 Chao Xie        2014-10-31  136  {
ee81f4ee2a3632 Chao Xie        2014-10-31  137  	struct mmp_clk_mix_reg_inf=
o *ri =3D &mix->reg_info;
ee81f4ee2a3632 Chao Xie        2014-10-31  138  	u8 width, shift;
ee81f4ee2a3632 Chao Xie        2014-10-31  139  	u32 mux_div, fc_req;
ee81f4ee2a3632 Chao Xie        2014-10-31  140  	int ret, timeout =3D 50;
ee81f4ee2a3632 Chao Xie        2014-10-31  141  	unsigned long flags =3D 0;
ee81f4ee2a3632 Chao Xie        2014-10-31  142  =

ee81f4ee2a3632 Chao Xie        2014-10-31  143  	if (!change_mux && !change=
_div)
ee81f4ee2a3632 Chao Xie        2014-10-31  144  		return -EINVAL;
ee81f4ee2a3632 Chao Xie        2014-10-31  145  =

ee81f4ee2a3632 Chao Xie        2014-10-31  146  	if (mix->lock)
ee81f4ee2a3632 Chao Xie        2014-10-31  147  		spin_lock_irqsave(mix->lo=
ck, flags);
ee81f4ee2a3632 Chao Xie        2014-10-31  148  =

ee81f4ee2a3632 Chao Xie        2014-10-31  149  	if (mix->type =3D=3D MMP_C=
LK_MIX_TYPE_V1
ee81f4ee2a3632 Chao Xie        2014-10-31  150  		|| mix->type =3D=3D MMP_C=
LK_MIX_TYPE_V2)
ee81f4ee2a3632 Chao Xie        2014-10-31  151  		mux_div =3D readl(ri->reg=
_clk_ctrl);
ee81f4ee2a3632 Chao Xie        2014-10-31  152  	else
ee81f4ee2a3632 Chao Xie        2014-10-31  153  		mux_div =3D readl(ri->reg=
_clk_sel);
ee81f4ee2a3632 Chao Xie        2014-10-31  154  =

ee81f4ee2a3632 Chao Xie        2014-10-31  155  	if (change_div) {
ee81f4ee2a3632 Chao Xie        2014-10-31  156  		width =3D ri->width_div;
ee81f4ee2a3632 Chao Xie        2014-10-31  157  		shift =3D ri->shift_div;
ee81f4ee2a3632 Chao Xie        2014-10-31  158  		mux_div &=3D ~MMP_CLK_BIT=
S_MASK(width, shift);
ee81f4ee2a3632 Chao Xie        2014-10-31  159  		mux_div |=3D MMP_CLK_BITS=
_SET_VAL(div_val, width, shift);
ee81f4ee2a3632 Chao Xie        2014-10-31  160  	}
ee81f4ee2a3632 Chao Xie        2014-10-31  161  =

ee81f4ee2a3632 Chao Xie        2014-10-31  162  	if (change_mux) {
ee81f4ee2a3632 Chao Xie        2014-10-31  163  		width =3D ri->width_mux;
ee81f4ee2a3632 Chao Xie        2014-10-31  164  		shift =3D ri->shift_mux;
ee81f4ee2a3632 Chao Xie        2014-10-31  165  		mux_div &=3D ~MMP_CLK_BIT=
S_MASK(width, shift);
ee81f4ee2a3632 Chao Xie        2014-10-31  166  		mux_div |=3D MMP_CLK_BITS=
_SET_VAL(mux_val, width, shift);
ee81f4ee2a3632 Chao Xie        2014-10-31  167  	}
ee81f4ee2a3632 Chao Xie        2014-10-31  168  =

ee81f4ee2a3632 Chao Xie        2014-10-31  169  	if (mix->type =3D=3D MMP_C=
LK_MIX_TYPE_V1) {
ee81f4ee2a3632 Chao Xie        2014-10-31  170  		writel(mux_div, ri->reg_c=
lk_ctrl);
ee81f4ee2a3632 Chao Xie        2014-10-31  171  	} else if (mix->type =3D=
=3D MMP_CLK_MIX_TYPE_V2) {
ee81f4ee2a3632 Chao Xie        2014-10-31  172  		mux_div |=3D (1 << ri->bi=
t_fc);
ee81f4ee2a3632 Chao Xie        2014-10-31  173  		writel(mux_div, ri->reg_c=
lk_ctrl);
ee81f4ee2a3632 Chao Xie        2014-10-31  174  =

ee81f4ee2a3632 Chao Xie        2014-10-31  175  		do {
ee81f4ee2a3632 Chao Xie        2014-10-31  176  			fc_req =3D readl(ri->reg=
_clk_ctrl);
ee81f4ee2a3632 Chao Xie        2014-10-31  177  			timeout--;
ee81f4ee2a3632 Chao Xie        2014-10-31  178  			if (!(fc_req & (1 << ri-=
>bit_fc)))
ee81f4ee2a3632 Chao Xie        2014-10-31  179  				break;
ee81f4ee2a3632 Chao Xie        2014-10-31  180  		} while (timeout);
ee81f4ee2a3632 Chao Xie        2014-10-31  181  =

ee81f4ee2a3632 Chao Xie        2014-10-31  182  		if (timeout =3D=3D 0) {
ee81f4ee2a3632 Chao Xie        2014-10-31  183  			pr_err("%s:%s cannot do =
frequency change\n",
aef28cb6b3b22f Stephen Boyd    2015-07-30  184  				__func__, clk_hw_get_na=
me(&mix->hw));
ee81f4ee2a3632 Chao Xie        2014-10-31  185  			ret =3D -EBUSY;
ee81f4ee2a3632 Chao Xie        2014-10-31  186  			goto error;
ee81f4ee2a3632 Chao Xie        2014-10-31  187  		}
ee81f4ee2a3632 Chao Xie        2014-10-31  188  	} else {
ee81f4ee2a3632 Chao Xie        2014-10-31  189  		fc_req =3D readl(ri->reg_=
clk_ctrl);
ee81f4ee2a3632 Chao Xie        2014-10-31  190  		fc_req |=3D 1 << ri->bit_=
fc;
ee81f4ee2a3632 Chao Xie        2014-10-31  191  		writel(fc_req, ri->reg_cl=
k_ctrl);
ee81f4ee2a3632 Chao Xie        2014-10-31  192  		writel(mux_div, ri->reg_c=
lk_sel);
ee81f4ee2a3632 Chao Xie        2014-10-31 @193  		fc_req &=3D ~(1 << ri->bi=
t_fc);
ee81f4ee2a3632 Chao Xie        2014-10-31  194  	}
ee81f4ee2a3632 Chao Xie        2014-10-31  195  =

ee81f4ee2a3632 Chao Xie        2014-10-31  196  	ret =3D 0;
ee81f4ee2a3632 Chao Xie        2014-10-31  197  error:
ee81f4ee2a3632 Chao Xie        2014-10-31  198  	if (mix->lock)
ee81f4ee2a3632 Chao Xie        2014-10-31  199  		spin_unlock_irqrestore(mi=
x->lock, flags);
ee81f4ee2a3632 Chao Xie        2014-10-31  200  =

ee81f4ee2a3632 Chao Xie        2014-10-31  201  	return ret;
ee81f4ee2a3632 Chao Xie        2014-10-31  202  }
ee81f4ee2a3632 Chao Xie        2014-10-31  203  =

0817b62cc037a5 Boris Brezillon 2015-07-07  204  static int mmp_clk_mix_dete=
rmine_rate(struct clk_hw *hw,
0817b62cc037a5 Boris Brezillon 2015-07-07  205  				      struct clk_rate_r=
equest *req)
ee81f4ee2a3632 Chao Xie        2014-10-31  206  {
ee81f4ee2a3632 Chao Xie        2014-10-31  207  	struct mmp_clk_mix *mix =
=3D to_clk_mix(hw);
ee81f4ee2a3632 Chao Xie        2014-10-31  208  	struct mmp_clk_mix_clk_tab=
le *item;
aef28cb6b3b22f Stephen Boyd    2015-07-30  209  	struct clk_hw *parent, *pa=
rent_best;
ee81f4ee2a3632 Chao Xie        2014-10-31  210  	unsigned long parent_rate,=
 mix_rate, mix_rate_best, parent_rate_best;
ee81f4ee2a3632 Chao Xie        2014-10-31  211  	unsigned long gap, gap_bes=
t;
ee81f4ee2a3632 Chao Xie        2014-10-31  212  	u32 div_val_max;
ee81f4ee2a3632 Chao Xie        2014-10-31  213  	unsigned int div;
ee81f4ee2a3632 Chao Xie        2014-10-31  214  	int i, j;
ee81f4ee2a3632 Chao Xie        2014-10-31  215  =

ee81f4ee2a3632 Chao Xie        2014-10-31  216  =

ee81f4ee2a3632 Chao Xie        2014-10-31  217  	mix_rate_best =3D 0;
ee81f4ee2a3632 Chao Xie        2014-10-31  218  	parent_rate_best =3D 0;
57d866e606ddf2 Boris Brezillon 2015-07-09  219  	gap_best =3D ULONG_MAX;
ee81f4ee2a3632 Chao Xie        2014-10-31  220  	parent_best =3D NULL;
ee81f4ee2a3632 Chao Xie        2014-10-31  221  =

ee81f4ee2a3632 Chao Xie        2014-10-31  222  	if (mix->table) {
ee81f4ee2a3632 Chao Xie        2014-10-31  223  		for (i =3D 0; i < mix->ta=
ble_size; i++) {
ee81f4ee2a3632 Chao Xie        2014-10-31  224  			item =3D &mix->table[i];
ee81f4ee2a3632 Chao Xie        2014-10-31  225  			if (item->valid =3D=3D 0)
ee81f4ee2a3632 Chao Xie        2014-10-31  226  				continue;
aef28cb6b3b22f Stephen Boyd    2015-07-30  227  			parent =3D clk_hw_get_pa=
rent_by_index(hw,
ee81f4ee2a3632 Chao Xie        2014-10-31  228  							item->parent_index);
aef28cb6b3b22f Stephen Boyd    2015-07-30  229  			parent_rate =3D clk_hw_g=
et_rate(parent);
ee81f4ee2a3632 Chao Xie        2014-10-31  230  			mix_rate =3D parent_rate=
 / item->divisor;
0817b62cc037a5 Boris Brezillon 2015-07-07  231  			gap =3D abs(mix_rate - r=
eq->rate);
7a3aad90d331de Markus Elfring  2017-09-27  232  			if (!parent_best || gap =
< gap_best) {
ee81f4ee2a3632 Chao Xie        2014-10-31  233  				parent_best =3D parent;
ee81f4ee2a3632 Chao Xie        2014-10-31  234  				parent_rate_best =3D pa=
rent_rate;
ee81f4ee2a3632 Chao Xie        2014-10-31  235  				mix_rate_best =3D mix_r=
ate;
ee81f4ee2a3632 Chao Xie        2014-10-31  236  				gap_best =3D gap;
ee81f4ee2a3632 Chao Xie        2014-10-31  237  				if (gap_best =3D=3D 0)
ee81f4ee2a3632 Chao Xie        2014-10-31  238  					goto found;
ee81f4ee2a3632 Chao Xie        2014-10-31  239  			}
ee81f4ee2a3632 Chao Xie        2014-10-31  240  		}
ee81f4ee2a3632 Chao Xie        2014-10-31  241  	} else {
497295afb5ab07 Stephen Boyd    2015-06-25  242  		for (i =3D 0; i < clk_hw_=
get_num_parents(hw); i++) {
aef28cb6b3b22f Stephen Boyd    2015-07-30  243  			parent =3D clk_hw_get_pa=
rent_by_index(hw, i);
aef28cb6b3b22f Stephen Boyd    2015-07-30  244  			parent_rate =3D clk_hw_g=
et_rate(parent);
ee81f4ee2a3632 Chao Xie        2014-10-31  245  			div_val_max =3D _get_max=
div(mix);
ee81f4ee2a3632 Chao Xie        2014-10-31  246  			for (j =3D 0; j < div_va=
l_max; j++) {
ee81f4ee2a3632 Chao Xie        2014-10-31  247  				div =3D _get_div(mix, j=
);
ee81f4ee2a3632 Chao Xie        2014-10-31  248  				mix_rate =3D parent_rat=
e / div;
0817b62cc037a5 Boris Brezillon 2015-07-07  249  				gap =3D abs(mix_rate - =
req->rate);
7a3aad90d331de Markus Elfring  2017-09-27  250  				if (!parent_best || gap=
 < gap_best) {
ee81f4ee2a3632 Chao Xie        2014-10-31  251  					parent_best =3D parent;
ee81f4ee2a3632 Chao Xie        2014-10-31  252  					parent_rate_best =3D p=
arent_rate;
ee81f4ee2a3632 Chao Xie        2014-10-31  253  					mix_rate_best =3D mix_=
rate;
ee81f4ee2a3632 Chao Xie        2014-10-31  254  					gap_best =3D gap;
ee81f4ee2a3632 Chao Xie        2014-10-31  255  					if (gap_best =3D=3D 0)
ee81f4ee2a3632 Chao Xie        2014-10-31  256  						goto found;
ee81f4ee2a3632 Chao Xie        2014-10-31  257  				}
ee81f4ee2a3632 Chao Xie        2014-10-31  258  			}
ee81f4ee2a3632 Chao Xie        2014-10-31  259  		}
ee81f4ee2a3632 Chao Xie        2014-10-31  260  	}
ee81f4ee2a3632 Chao Xie        2014-10-31  261  =

ee81f4ee2a3632 Chao Xie        2014-10-31  262  found:
57d866e606ddf2 Boris Brezillon 2015-07-09  263  	if (!parent_best)
57d866e606ddf2 Boris Brezillon 2015-07-09  264  		return -EINVAL;
57d866e606ddf2 Boris Brezillon 2015-07-09  265  =

0817b62cc037a5 Boris Brezillon 2015-07-07  266  	req->best_parent_rate =3D =
parent_rate_best;
aef28cb6b3b22f Stephen Boyd    2015-07-30  267  	req->best_parent_hw =3D pa=
rent_best;
0817b62cc037a5 Boris Brezillon 2015-07-07  268  	req->rate =3D mix_rate_bes=
t;
ee81f4ee2a3632 Chao Xie        2014-10-31  269  =

0817b62cc037a5 Boris Brezillon 2015-07-07  270  	return 0;
ee81f4ee2a3632 Chao Xie        2014-10-31  271  }
ee81f4ee2a3632 Chao Xie        2014-10-31  272  =

ee81f4ee2a3632 Chao Xie        2014-10-31  273  static int mmp_clk_mix_set_=
rate_and_parent(struct clk_hw *hw,
ee81f4ee2a3632 Chao Xie        2014-10-31  274  						unsigned long rate,
ee81f4ee2a3632 Chao Xie        2014-10-31  275  						unsigned long parent_=
rate,
ee81f4ee2a3632 Chao Xie        2014-10-31  276  						u8 index)
ee81f4ee2a3632 Chao Xie        2014-10-31  277  {
ee81f4ee2a3632 Chao Xie        2014-10-31  278  	struct mmp_clk_mix *mix =
=3D to_clk_mix(hw);
ee81f4ee2a3632 Chao Xie        2014-10-31  279  	unsigned int div;
ee81f4ee2a3632 Chao Xie        2014-10-31  280  	u32 div_val, mux_val;
ee81f4ee2a3632 Chao Xie        2014-10-31  281  =

ee81f4ee2a3632 Chao Xie        2014-10-31  282  	div =3D parent_rate / rate;
ee81f4ee2a3632 Chao Xie        2014-10-31  283  	div_val =3D _get_div_val(m=
ix, div);
ee81f4ee2a3632 Chao Xie        2014-10-31  284  	mux_val =3D _get_mux_val(m=
ix, index);
ee81f4ee2a3632 Chao Xie        2014-10-31  285  =

ee81f4ee2a3632 Chao Xie        2014-10-31  286  	return _set_rate(mix, mux_=
val, div_val, 1, 1);
ee81f4ee2a3632 Chao Xie        2014-10-31  287  }
ee81f4ee2a3632 Chao Xie        2014-10-31  288  =

ee81f4ee2a3632 Chao Xie        2014-10-31  289  static u8 mmp_clk_mix_get_p=
arent(struct clk_hw *hw)
ee81f4ee2a3632 Chao Xie        2014-10-31  290  {
ee81f4ee2a3632 Chao Xie        2014-10-31  291  	struct mmp_clk_mix *mix =
=3D to_clk_mix(hw);
ee81f4ee2a3632 Chao Xie        2014-10-31  292  	struct mmp_clk_mix_reg_inf=
o *ri =3D &mix->reg_info;
ee81f4ee2a3632 Chao Xie        2014-10-31  293  	unsigned long flags =3D 0;
ee81f4ee2a3632 Chao Xie        2014-10-31  294  	u32 mux_div =3D 0;
ee81f4ee2a3632 Chao Xie        2014-10-31  295  	u8 width, shift;
ee81f4ee2a3632 Chao Xie        2014-10-31  296  	u32 mux_val;
ee81f4ee2a3632 Chao Xie        2014-10-31  297  =

ee81f4ee2a3632 Chao Xie        2014-10-31  298  	if (mix->lock)
ee81f4ee2a3632 Chao Xie        2014-10-31  299  		spin_lock_irqsave(mix->lo=
ck, flags);
ee81f4ee2a3632 Chao Xie        2014-10-31  300  =

ee81f4ee2a3632 Chao Xie        2014-10-31  301  	if (mix->type =3D=3D MMP_C=
LK_MIX_TYPE_V1
ee81f4ee2a3632 Chao Xie        2014-10-31  302  		|| mix->type =3D=3D MMP_C=
LK_MIX_TYPE_V2)
ee81f4ee2a3632 Chao Xie        2014-10-31  303  		mux_div =3D readl(ri->reg=
_clk_ctrl);
ee81f4ee2a3632 Chao Xie        2014-10-31  304  	else
ee81f4ee2a3632 Chao Xie        2014-10-31  305  		mux_div =3D readl(ri->reg=
_clk_sel);
ee81f4ee2a3632 Chao Xie        2014-10-31  306  =

ee81f4ee2a3632 Chao Xie        2014-10-31  307  	if (mix->lock)
ee81f4ee2a3632 Chao Xie        2014-10-31  308  		spin_unlock_irqrestore(mi=
x->lock, flags);
ee81f4ee2a3632 Chao Xie        2014-10-31  309  =

ee81f4ee2a3632 Chao Xie        2014-10-31  310  	width =3D mix->reg_info.wi=
dth_mux;
ee81f4ee2a3632 Chao Xie        2014-10-31  311  	shift =3D mix->reg_info.sh=
ift_mux;
ee81f4ee2a3632 Chao Xie        2014-10-31  312  =

ee81f4ee2a3632 Chao Xie        2014-10-31  313  	mux_val =3D MMP_CLK_BITS_G=
ET_VAL(mux_div, width, shift);
ee81f4ee2a3632 Chao Xie        2014-10-31  314  =

ee81f4ee2a3632 Chao Xie        2014-10-31  315  	return _get_mux(mix, mux_v=
al);
ee81f4ee2a3632 Chao Xie        2014-10-31  316  }
ee81f4ee2a3632 Chao Xie        2014-10-31  317  =

ee81f4ee2a3632 Chao Xie        2014-10-31  318  static unsigned long mmp_cl=
k_mix_recalc_rate(struct clk_hw *hw,
ee81f4ee2a3632 Chao Xie        2014-10-31  319  					unsigned long parent_r=
ate)
ee81f4ee2a3632 Chao Xie        2014-10-31  320  {
ee81f4ee2a3632 Chao Xie        2014-10-31  321  	struct mmp_clk_mix *mix =
=3D to_clk_mix(hw);
ee81f4ee2a3632 Chao Xie        2014-10-31  322  	struct mmp_clk_mix_reg_inf=
o *ri =3D &mix->reg_info;
ee81f4ee2a3632 Chao Xie        2014-10-31  323  	unsigned long flags =3D 0;
ee81f4ee2a3632 Chao Xie        2014-10-31  324  	u32 mux_div =3D 0;
ee81f4ee2a3632 Chao Xie        2014-10-31  325  	u8 width, shift;
ee81f4ee2a3632 Chao Xie        2014-10-31  326  	unsigned int div;
ee81f4ee2a3632 Chao Xie        2014-10-31  327  =

ee81f4ee2a3632 Chao Xie        2014-10-31  328  	if (mix->lock)
ee81f4ee2a3632 Chao Xie        2014-10-31  329  		spin_lock_irqsave(mix->lo=
ck, flags);
ee81f4ee2a3632 Chao Xie        2014-10-31  330  =

ee81f4ee2a3632 Chao Xie        2014-10-31  331  	if (mix->type =3D=3D MMP_C=
LK_MIX_TYPE_V1
ee81f4ee2a3632 Chao Xie        2014-10-31  332  		|| mix->type =3D=3D MMP_C=
LK_MIX_TYPE_V2)
ee81f4ee2a3632 Chao Xie        2014-10-31  333  		mux_div =3D readl(ri->reg=
_clk_ctrl);
ee81f4ee2a3632 Chao Xie        2014-10-31  334  	else
ee81f4ee2a3632 Chao Xie        2014-10-31  335  		mux_div =3D readl(ri->reg=
_clk_sel);
ee81f4ee2a3632 Chao Xie        2014-10-31  336  =

ee81f4ee2a3632 Chao Xie        2014-10-31  337  	if (mix->lock)
ee81f4ee2a3632 Chao Xie        2014-10-31  338  		spin_unlock_irqrestore(mi=
x->lock, flags);
ee81f4ee2a3632 Chao Xie        2014-10-31  339  =

ee81f4ee2a3632 Chao Xie        2014-10-31  340  	width =3D mix->reg_info.wi=
dth_div;
ee81f4ee2a3632 Chao Xie        2014-10-31  341  	shift =3D mix->reg_info.sh=
ift_div;
ee81f4ee2a3632 Chao Xie        2014-10-31  342  =

ee81f4ee2a3632 Chao Xie        2014-10-31  343  	div =3D _get_div(mix, MMP_=
CLK_BITS_GET_VAL(mux_div, width, shift));
ee81f4ee2a3632 Chao Xie        2014-10-31  344  =

ee81f4ee2a3632 Chao Xie        2014-10-31 @345  	return parent_rate / div;
ee81f4ee2a3632 Chao Xie        2014-10-31  346  }
ee81f4ee2a3632 Chao Xie        2014-10-31  347  =


:::::: The code at line 193 was first introduced by commit
:::::: ee81f4ee2a3632a2d7928f680c4af8243a18762f clk: mmp: add clock type mix

:::::: TO: Chao Xie <chao.xie@marvell.com>
:::::: CC: Michael Turquette <mturquette@linaro.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3286523817460376432==--

