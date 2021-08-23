Content-Type: multipart/mixed; boundary="===============1928002003572417543=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/soc/mediatek/mtk-devapc.c:133:13: warning: The result of the left shift is undefined due to shifting by '32', which is greater or equal to the width of type 'int' [clang-analyzer-core.UndefinedBinaryOperatorResult]
Date: Mon, 23 Aug 2021 23:44:49 +0800
Message-ID: <202108232343.38CE7J71-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1928002003572417543==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: clang-built-linux(a)googlegroups.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Neal Liu <neal.liu@mediatek.com>
CC: Matthias Brugger <matthias.bgg@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   e22ce8eb631bdc47a4a4ea7ecf4e4ba499db4f93
commit: 0890beb22618c0359f1e2652fc1e49bb5c5e876d soc: mediatek: add mt6779 =
devapc driver
date:   9 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 9 months ago
config: riscv-randconfig-c006-20210822 (attached as .config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 9e9d70=
591e72fc6762b4b9a226b68ed1307419bf)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D0890beb22618c0359f1e2652fc1e49bb5c5e876d
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 0890beb22618c0359f1e2652fc1e49bb5c5e876d
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           list_for_each_entry_safe(page, n, list, slab_list) {
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
   include/linux/compiler_types.h:319:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:307:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:299:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   mm/slab.c:1643:2: note: Loop condition is false.  Exiting loop
           list_for_each_entry_safe(page, n, list, slab_list) {
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
   include/linux/compiler_types.h:319:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:307:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:297:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   mm/slab.c:1643:2: note: Assigned value is garbage or undefined
           list_for_each_entry_safe(page, n, list, slab_list) {
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
   include/linux/kernel.h:852:2: note: expanded from macro 'container_of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
           ^              ~~~~~~~~~~~~~
   mm/slab.c:2501:3: warning: Value stored to 'objp' is never read [clang-a=
nalyzer-deadcode.DeadStores]
                   objp =3D kasan_init_slab_obj(cachep, objp);
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/slab.c:2501:3: note: Value stored to 'objp' is never read
                   objp =3D kasan_init_slab_obj(cachep, objp);
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 20 warnings (11 in non-user code, 9 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   drivers/leds/led-triggers.c:276:2: warning: Call to function 'strcpy' is=
 insecure as it does not provide bounding of the memory buffer. Replace unb=
ounded copy functions with analogous functions that support length argument=
s such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy((char *)trig->name, name);
           ^~~~~~
   drivers/leds/led-triggers.c:276:2: note: Call to function 'strcpy' is in=
secure as it does not provide bounding of the memory buffer. Replace unboun=
ded copy functions with analogous functions that support length arguments s=
uch as 'strlcpy'. CWE-119
           strcpy((char *)trig->name, name);
           ^~~~~~
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
   12 warnings generated.
   Suppressed 12 warnings (5 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   drivers/soc/aspeed/aspeed-lpc-ctrl.c:67:17: warning: Value stored to 'de=
v' during its initialization is never read [clang-analyzer-deadcode.DeadSto=
res]
           struct device *dev =3D file->private_data;
                          ^~~   ~~~~~~~~~~~~~~~~~~
   drivers/soc/aspeed/aspeed-lpc-ctrl.c:67:17: note: Value stored to 'dev' =
during its initialization is never read
           struct device *dev =3D file->private_data;
                          ^~~   ~~~~~~~~~~~~~~~~~~
   Suppressed 12 warnings (5 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (5 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
>> drivers/soc/mediatek/mtk-devapc.c:133:13: warning: The result of the lef=
t shift is undefined due to shifting by '32', which is greater or equal to =
the width of type 'int' [clang-analyzer-core.UndefinedBinaryOperatorResult]
           writel(0x1 << min_shift_group, pd_vio_shift_sel_reg);
                      ^
   drivers/soc/mediatek/mtk-devapc.c:190:9: note: Calling 'devapc_sync_vio_=
dbg'
           while (devapc_sync_vio_dbg(ctx))
                  ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/soc/mediatek/mtk-devapc.c:126:8: note: Loop condition is false. =
 Exiting loop
           val =3D readl(pd_vio_shift_sta_reg);
                 ^
   arch/riscv/include/asm/mmio.h:140:30: note: expanded from macro 'readl'
   #define readl(c)        ({ u32 __v; __io_br(); __v =3D readl_cpu(c); __i=
o_ar(__v); __v; })
                                       ^
   arch/riscv/include/asm/mmio.h:133:19: note: expanded from macro '__io_br'
   #define __io_br()       do {} while (0)
                           ^
   drivers/soc/mediatek/mtk-devapc.c:127:6: note: Assuming 'val' is not equ=
al to 0
           if (!val)
               ^~~~
   drivers/soc/mediatek/mtk-devapc.c:127:2: note: Taking false branch
           if (!val)
           ^
   drivers/soc/mediatek/mtk-devapc.c:130:20: note: Calling '__ffs'
           min_shift_group =3D __ffs(val);
                             ^~~~~~~~~~
   include/asm-generic/bitops/__ffs.h:18:6: note: Assuming the condition is=
 true
           if ((word & 0xffffffff) =3D=3D 0) {
               ^~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/__ffs.h:18:2: note: Taking true branch
           if ((word & 0xffffffff) =3D=3D 0) {
           ^
   include/asm-generic/bitops/__ffs.h:19:3: note: The value 32 is assigned =
to 'num'
                   num +=3D 32;
                   ^~~~~~~~~
   include/asm-generic/bitops/__ffs.h:23:6: note: Assuming the condition is=
 false
           if ((word & 0xffff) =3D=3D 0) {
               ^~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/__ffs.h:23:2: note: Taking false branch
           if ((word & 0xffff) =3D=3D 0) {
           ^
   include/asm-generic/bitops/__ffs.h:27:6: note: Assuming the condition is=
 false
           if ((word & 0xff) =3D=3D 0) {
               ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/__ffs.h:27:2: note: Taking false branch
           if ((word & 0xff) =3D=3D 0) {
           ^
   include/asm-generic/bitops/__ffs.h:31:6: note: Assuming the condition is=
 false
           if ((word & 0xf) =3D=3D 0) {
               ^~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/__ffs.h:31:2: note: Taking false branch
           if ((word & 0xf) =3D=3D 0) {
           ^
   include/asm-generic/bitops/__ffs.h:35:6: note: Assuming the condition is=
 false
           if ((word & 0x3) =3D=3D 0) {
               ^~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/__ffs.h:35:2: note: Taking false branch
           if ((word & 0x3) =3D=3D 0) {
           ^
   include/asm-generic/bitops/__ffs.h:39:6: note: Assuming the condition is=
 false
           if ((word & 0x1) =3D=3D 0)
               ^~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/__ffs.h:39:2: note: Taking false branch
           if ((word & 0x1) =3D=3D 0)
           ^
   include/asm-generic/bitops/__ffs.h:41:2: note: Returning the value 32 (l=
oaded from 'num')
           return num;
           ^~~~~~~~~~
   drivers/soc/mediatek/mtk-devapc.c:130:20: note: Returning from '__ffs'
           min_shift_group =3D __ffs(val);
                             ^~~~~~~~~~
   drivers/soc/mediatek/mtk-devapc.c:130:2: note: The value 32 is assigned =
to 'min_shift_group'
           min_shift_group =3D __ffs(val);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/soc/mediatek/mtk-devapc.c:133:13: note: The result of the left s=
hift is undefined due to shifting by '32', which is greater or equal to the=
 width of type 'int'
           writel(0x1 << min_shift_group, pd_vio_shift_sel_reg);
                      ^
   arch/riscv/include/asm/mmio.h:144:48: note: expanded from macro 'writel'
   #define writel(v, c)    ({ __io_bw(); writel_cpu((v), (c)); __io_aw(); })
                                                     ^
   arch/riscv/include/asm/mmio.h:93:71: note: expanded from macro 'writel_c=
pu'
   #define writel_cpu(v, c)        ((void)__raw_writel((__force u32)cpu_to_=
le32(v), (c)))
                                                                           =
     ^
   include/uapi/linux/byteorder/little_endian.h:33:51: note: expanded from =
macro '__cpu_to_le32'
   #define __cpu_to_le32(x) ((__force __le32)(__u32)(x))
                                                     ^
   drivers/soc/mediatek/mtk-devapc.c:133:13: warning: The result of the lef=
t shift is undefined due to shifting by '33', which is greater or equal to =
the width of type 'int' [clang-analyzer-core.UndefinedBinaryOperatorResult]
           writel(0x1 << min_shift_group, pd_vio_shift_sel_reg);
                      ^
   drivers/soc/mediatek/mtk-devapc.c:190:9: note: Calling 'devapc_sync_vio_=
dbg'
           while (devapc_sync_vio_dbg(ctx))
                  ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/soc/mediatek/mtk-devapc.c:126:8: note: Loop condition is false. =
 Exiting loop
           val =3D readl(pd_vio_shift_sta_reg);
                 ^
   arch/riscv/include/asm/mmio.h:140:30: note: expanded from macro 'readl'
   #define readl(c)        ({ u32 __v; __io_br(); __v =3D readl_cpu(c); __i=
o_ar(__v); __v; })
                                       ^
   arch/riscv/include/asm/mmio.h:133:19: note: expanded from macro '__io_br'
   #define __io_br()       do {} while (0)
                           ^
   drivers/soc/mediatek/mtk-devapc.c:127:6: note: Assuming 'val' is not equ=
al to 0
           if (!val)

vim +133 drivers/soc/mediatek/mtk-devapc.c

0890beb22618c0 Neal Liu 2020-10-15   98  =

0890beb22618c0 Neal Liu 2020-10-15   99  /*
0890beb22618c0 Neal Liu 2020-10-15  100   * devapc_sync_vio_dbg - do "shift=
" mechansim" to get full violation information.
0890beb22618c0 Neal Liu 2020-10-15  101   *                       shift mec=
hanism is depends on devapc hardware design.
0890beb22618c0 Neal Liu 2020-10-15  102   *                       Mediatek =
devapc set multiple slaves as a group.
0890beb22618c0 Neal Liu 2020-10-15  103   *                       When viol=
ation is triggered, violation info is kept
0890beb22618c0 Neal Liu 2020-10-15  104   *                       inside de=
vapc hardware.
0890beb22618c0 Neal Liu 2020-10-15  105   *                       Driver sh=
ould do shift mechansim to sync full violation
0890beb22618c0 Neal Liu 2020-10-15  106   *                       info to V=
IO_DBGs registers.
0890beb22618c0 Neal Liu 2020-10-15  107   *
0890beb22618c0 Neal Liu 2020-10-15  108   */
0890beb22618c0 Neal Liu 2020-10-15  109  static int devapc_sync_vio_dbg(str=
uct mtk_devapc_context *ctx)
0890beb22618c0 Neal Liu 2020-10-15  110  {
0890beb22618c0 Neal Liu 2020-10-15  111  	void __iomem *pd_vio_shift_sta_re=
g;
0890beb22618c0 Neal Liu 2020-10-15  112  	void __iomem *pd_vio_shift_sel_re=
g;
0890beb22618c0 Neal Liu 2020-10-15  113  	void __iomem *pd_vio_shift_con_re=
g;
0890beb22618c0 Neal Liu 2020-10-15  114  	int min_shift_group;
0890beb22618c0 Neal Liu 2020-10-15  115  	int ret;
0890beb22618c0 Neal Liu 2020-10-15  116  	u32 val;
0890beb22618c0 Neal Liu 2020-10-15  117  =

0890beb22618c0 Neal Liu 2020-10-15  118  	pd_vio_shift_sta_reg =3D ctx->inf=
ra_base +
0890beb22618c0 Neal Liu 2020-10-15  119  			       ctx->data->vio_shift_sta=
_offset;
0890beb22618c0 Neal Liu 2020-10-15  120  	pd_vio_shift_sel_reg =3D ctx->inf=
ra_base +
0890beb22618c0 Neal Liu 2020-10-15  121  			       ctx->data->vio_shift_sel=
_offset;
0890beb22618c0 Neal Liu 2020-10-15  122  	pd_vio_shift_con_reg =3D ctx->inf=
ra_base +
0890beb22618c0 Neal Liu 2020-10-15  123  			       ctx->data->vio_shift_con=
_offset;
0890beb22618c0 Neal Liu 2020-10-15  124  =

0890beb22618c0 Neal Liu 2020-10-15  125  	/* Find the minimum shift group w=
hich has violation */
0890beb22618c0 Neal Liu 2020-10-15  126  	val =3D readl(pd_vio_shift_sta_re=
g);
0890beb22618c0 Neal Liu 2020-10-15  127  	if (!val)
0890beb22618c0 Neal Liu 2020-10-15  128  		return false;
0890beb22618c0 Neal Liu 2020-10-15  129  =

0890beb22618c0 Neal Liu 2020-10-15  130  	min_shift_group =3D __ffs(val);
0890beb22618c0 Neal Liu 2020-10-15  131  =

0890beb22618c0 Neal Liu 2020-10-15  132  	/* Assign the group to sync */
0890beb22618c0 Neal Liu 2020-10-15 @133  	writel(0x1 << min_shift_group, pd=
_vio_shift_sel_reg);
0890beb22618c0 Neal Liu 2020-10-15  134  =

0890beb22618c0 Neal Liu 2020-10-15  135  	/* Start syncing */
0890beb22618c0 Neal Liu 2020-10-15  136  	writel(0x1, pd_vio_shift_con_reg);
0890beb22618c0 Neal Liu 2020-10-15  137  =

0890beb22618c0 Neal Liu 2020-10-15  138  	ret =3D readl_poll_timeout(pd_vio=
_shift_con_reg, val, val =3D=3D 0x3, 0,
0890beb22618c0 Neal Liu 2020-10-15  139  				 PHY_DEVAPC_TIMEOUT);
0890beb22618c0 Neal Liu 2020-10-15  140  	if (ret) {
0890beb22618c0 Neal Liu 2020-10-15  141  		dev_err(ctx->dev, "%s: Shift vio=
lation info failed\n", __func__);
0890beb22618c0 Neal Liu 2020-10-15  142  		return false;
0890beb22618c0 Neal Liu 2020-10-15  143  	}
0890beb22618c0 Neal Liu 2020-10-15  144  =

0890beb22618c0 Neal Liu 2020-10-15  145  	/* Stop syncing */
0890beb22618c0 Neal Liu 2020-10-15  146  	writel(0x0, pd_vio_shift_con_reg);
0890beb22618c0 Neal Liu 2020-10-15  147  =

0890beb22618c0 Neal Liu 2020-10-15  148  	/* Write clear */
0890beb22618c0 Neal Liu 2020-10-15  149  	writel(0x1 << min_shift_group, pd=
_vio_shift_sta_reg);
0890beb22618c0 Neal Liu 2020-10-15  150  =

0890beb22618c0 Neal Liu 2020-10-15  151  	return true;
0890beb22618c0 Neal Liu 2020-10-15  152  }
0890beb22618c0 Neal Liu 2020-10-15  153  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--===============1928002003572417543==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
1Bjs0LhcsZh0iPgPQGC/Q57xAQA=
--===============1928002003572417543==--

