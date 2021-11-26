Content-Type: multipart/mixed; boundary="===============4489823830374338920=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/tegra/hub.c:229:17: warning: Value stored to 'dev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Fri, 26 Nov 2021 17:14:44 +0800
Message-ID: <202111261739.b4Sqm9p0-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4489823830374338920==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Arnd Bergmann <arnd@arndb.de>
CC: Shawn Guo <shawnguo@kernel.org>

Hi Arnd,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   a4849f6000e29235a2707f22e39da6b897bb9543
commit: 097530bf8cd469ef7b3d52ef00cafb64b33bacb1 ARM: imx: fix imx8m depend=
encies
date:   11 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 11 months ago
config: arm-randconfig-c002-20211012 (https://download.01.org/0day-ci/archi=
ve/20211126/202111261739.b4Sqm9p0-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project c3dcf3=
9554dbea780d6cb7e12239451ba47a2668)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D097530bf8cd469ef7b3d52ef00cafb64b33bacb1
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 097530bf8cd469ef7b3d52ef00cafb64b33bacb1
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           if (imx_ldb_ch =3D=3D &ldb->channel[1] || dual) {
                                                 ^~~~
   drivers/gpu/drm/imx/imx-ldb.c:212:2: note: Taking false branch
           if (imx_ldb_ch =3D=3D &ldb->channel[1] || dual) {
           ^
   drivers/gpu/drm/imx/imx-ldb.c:220:6: note: Assuming field 'lvds_mux' is =
non-null
           if (ldb->lvds_mux) {
               ^~~~~~~~~~~~~
   drivers/gpu/drm/imx/imx-ldb.c:220:2: note: Taking true branch
           if (ldb->lvds_mux) {
           ^
   drivers/gpu/drm/imx/imx-ldb.c:221:3: note: 'lvds_mux' initialized to a n=
ull pointer value
                   const struct bus_mux *lvds_mux =3D NULL;
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/imx/imx-ldb.c:223:7: note: Assuming the condition is fal=
se
                   if (imx_ldb_ch =3D=3D &ldb->channel[0])
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/imx/imx-ldb.c:223:3: note: Taking false branch
                   if (imx_ldb_ch =3D=3D &ldb->channel[0])
                   ^
   drivers/gpu/drm/imx/imx-ldb.c:225:12: note: Assuming the condition is fa=
lse
                   else if (imx_ldb_ch =3D=3D &ldb->channel[1])
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/imx/imx-ldb.c:225:8: note: Taking false branch
                   else if (imx_ldb_ch =3D=3D &ldb->channel[1])
                        ^
   drivers/gpu/drm/imx/imx-ldb.c:228:35: note: Access to field 'reg' result=
s in a dereference of a null pointer (loaded from variable 'lvds_mux')
                   regmap_update_bits(ldb->regmap, lvds_mux->reg, lvds_mux-=
>mask,
                                                   ^~~~~~~~
   drivers/gpu/drm/imx/imx-ldb.c:323:28: warning: Access to field 'reg' res=
ults in a dereference of a null pointer (loaded from variable 'lvds_mux') [=
clang-analyzer-core.NullDereference]
                   regmap_read(ldb->regmap, lvds_mux->reg, &mux);
                                            ^~~~~~~~
   drivers/gpu/drm/imx/imx-ldb.c:303:6: note: Assuming the condition is fal=
se
           if (imx_ldb_ch =3D=3D &ldb->channel[0] || dual)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/imx/imx-ldb.c:303:6: note: Left side of '||' is false
   drivers/gpu/drm/imx/imx-ldb.c:303:40: note: Assuming 'dual' is 0
           if (imx_ldb_ch =3D=3D &ldb->channel[0] || dual)
                                                 ^~~~
   drivers/gpu/drm/imx/imx-ldb.c:303:2: note: Taking false branch
           if (imx_ldb_ch =3D=3D &ldb->channel[0] || dual)
           ^
   drivers/gpu/drm/imx/imx-ldb.c:305:6: note: Assuming the condition is fal=
se
           if (imx_ldb_ch =3D=3D &ldb->channel[1] || dual)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/imx/imx-ldb.c:305:6: note: Left side of '||' is false
   drivers/gpu/drm/imx/imx-ldb.c:305:40: note: 'dual' is 0
           if (imx_ldb_ch =3D=3D &ldb->channel[1] || dual)
                                                 ^~~~
   drivers/gpu/drm/imx/imx-ldb.c:305:2: note: Taking false branch
           if (imx_ldb_ch =3D=3D &ldb->channel[1] || dual)
           ^
   drivers/gpu/drm/imx/imx-ldb.c:310:6: note: 'dual' is 0
           if (dual) {
               ^~~~
   drivers/gpu/drm/imx/imx-ldb.c:310:2: note: Taking false branch
           if (dual) {
           ^
   drivers/gpu/drm/imx/imx-ldb.c:315:6: note: Assuming field 'lvds_mux' is =
non-null
           if (ldb->lvds_mux) {
               ^~~~~~~~~~~~~
   drivers/gpu/drm/imx/imx-ldb.c:315:2: note: Taking true branch
           if (ldb->lvds_mux) {
           ^
   drivers/gpu/drm/imx/imx-ldb.c:316:3: note: 'lvds_mux' initialized to a n=
ull pointer value
                   const struct bus_mux *lvds_mux =3D NULL;
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/imx/imx-ldb.c:318:7: note: Assuming the condition is fal=
se
                   if (imx_ldb_ch =3D=3D &ldb->channel[0])
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/imx/imx-ldb.c:318:3: note: Taking false branch
                   if (imx_ldb_ch =3D=3D &ldb->channel[0])
                   ^
   drivers/gpu/drm/imx/imx-ldb.c:320:12: note: Assuming the condition is fa=
lse
                   else if (imx_ldb_ch =3D=3D &ldb->channel[1])
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/imx/imx-ldb.c:320:8: note: Taking false branch
                   else if (imx_ldb_ch =3D=3D &ldb->channel[1])
                        ^
   drivers/gpu/drm/imx/imx-ldb.c:323:28: note: Access to field 'reg' result=
s in a dereference of a null pointer (loaded from variable 'lvds_mux')
                   regmap_read(ldb->regmap, lvds_mux->reg, &mux);
                                            ^~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
>> drivers/gpu/drm/tegra/hub.c:229:17: warning: Value stored to 'dev' durin=
g its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D dc->dev;
                          ^~~   ~~~~~~~
   drivers/gpu/drm/tegra/hub.c:229:17: note: Value stored to 'dev' during i=
ts initialization is never read
           struct device *dev =3D dc->dev;
                          ^~~   ~~~~~~~
   drivers/gpu/drm/tegra/hub.c:299:2: warning: Value stored to 'value' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           value =3D tegra_plane_readl(plane, DC_WIN_CORE_IHUB_WGRP_FETCH_M=
ETER);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/gpu/drm/tegra/hub.c:299:2: note: Value stored to 'value' is neve=
r read
           value =3D tegra_plane_readl(plane, DC_WIN_CORE_IHUB_WGRP_FETCH_M=
ETER);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/gpu/drm/tegra/hub.c:313:2: warning: Value stored to 'value' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           value =3D tegra_plane_readl(plane, DC_WIN_CORE_PRECOMP_WGRP_PIPE=
_METER);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   drivers/gpu/drm/tegra/hub.c:313:2: note: Value stored to 'value' is neve=
r read
           value =3D tegra_plane_readl(plane, DC_WIN_CORE_PRECOMP_WGRP_PIPE=
_METER);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   drivers/gpu/drm/tegra/hub.c:318:2: warning: Value stored to 'value' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           value =3D tegra_plane_readl(plane, DC_WIN_CORE_IHUB_WGRP_POOL_CO=
NFIG);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/gpu/drm/tegra/hub.c:318:2: note: Value stored to 'value' is neve=
r read
           value =3D tegra_plane_readl(plane, DC_WIN_CORE_IHUB_WGRP_POOL_CO=
NFIG);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/gpu/drm/tegra/hub.c:693:2: warning: Value stored to 'value' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           value =3D tegra_dc_readl(dc, DC_DISP_IHUB_COMMON_DISPLAY_FETCH_M=
ETER);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/gpu/drm/tegra/hub.c:693:2: note: Value stored to 'value' is neve=
r read
           value =3D tegra_dc_readl(dc, DC_DISP_IHUB_COMMON_DISPLAY_FETCH_M=
ETER);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/clocksource/timer-atmel-tcb.c:297:66: warning: The result of the=
 left shift is undefined due to shifting by '32', which is greater or equal=
 to the width of type 'unsigned long' [clang-analyzer-core.UndefinedBinaryO=
peratorResult]
           clockevents_config_and_register(&clkevt.clkevt, clkevt.rate, 1, =
BIT(bits) - 1);
                                                                           ^
   include/vdso/bits.h:7:26: note: expanded from macro 'BIT'
   #define BIT(nr)                 (UL(1) << (nr))
                                          ^
   drivers/clocksource/timer-atmel-tcb.c:387:6: note: Assuming 'tcaddr' is =
null
           if (tcaddr)
               ^~~~~~
   drivers/clocksource/timer-atmel-tcb.c:387:2: note: Taking false branch
           if (tcaddr)
           ^
   drivers/clocksource/timer-atmel-tcb.c:391:6: note: Assuming field 'regs'=
 is non-null
           if (!tc.regs)
               ^~~~~~~~
   drivers/clocksource/timer-atmel-tcb.c:391:2: note: Taking false branch
           if (!tc.regs)
           ^
   drivers/clocksource/timer-atmel-tcb.c:395:2: note: Taking false branch
           if (IS_ERR(t0_clk))
           ^
   drivers/clocksource/timer-atmel-tcb.c:399:2: note: Taking false branch
           if (IS_ERR(tc.slow_clk))
           ^
   drivers/clocksource/timer-atmel-tcb.c:404:2: note: Taking false branch
           if (IS_ERR(tc.clk[1]))
           ^
   drivers/clocksource/timer-atmel-tcb.c:407:2: note: Taking false branch
           if (IS_ERR(tc.clk[2]))
           ^
   drivers/clocksource/timer-atmel-tcb.c:411:6: note: Assuming the conditio=
n is false
           if (tc.irq[2] <=3D 0) {
               ^~~~~~~~~~~~~~
   drivers/clocksource/timer-atmel-tcb.c:411:2: note: Taking false branch
           if (tc.irq[2] <=3D 0) {
           ^
   drivers/clocksource/timer-atmel-tcb.c:418:6: note: Assuming 'match' is n=
on-null
           if (!match)
               ^~~~~~
   drivers/clocksource/timer-atmel-tcb.c:418:2: note: Taking false branch
           if (!match)
           ^
   drivers/clocksource/timer-atmel-tcb.c:424:2: note: Loop condition is tru=
e.  Entering loop body
           for (i =3D 0; i < ARRAY_SIZE(tc.irq); i++)
           ^
   drivers/clocksource/timer-atmel-tcb.c:425:3: note: Loop condition is fal=
se.  Exiting loop
                   writel(ATMEL_TC_ALL_IRQ, tc.regs + ATMEL_TC_REG(i, IDR));
                   ^
   arch/arm/include/asm/io.h:307:25: note: expanded from macro 'writel'
   #define writel(v,c)             ({ __iowmb(); writel_relaxed(v,c); })
                                      ^
   arch/arm/include/asm/io.h:169:20: note: expanded from macro '__iowmb'
   #define __iowmb()               do { } while (0)
                                   ^
   drivers/clocksource/timer-atmel-tcb.c:424:2: note: Loop condition is tru=
e.  Entering loop body
           for (i =3D 0; i < ARRAY_SIZE(tc.irq); i++)
           ^
   drivers/clocksource/timer-atmel-tcb.c:425:3: note: Loop condition is fal=
se.  Exiting loop
                   writel(ATMEL_TC_ALL_IRQ, tc.regs + ATMEL_TC_REG(i, IDR));
                   ^
   arch/arm/include/asm/io.h:307:25: note: expanded from macro 'writel'
   #define writel(v,c)             ({ __iowmb(); writel_relaxed(v,c); })
--
           ^
   drivers/clocksource/sh_mtu2.c:430:2: note: Loop condition is true.  Ente=
ring loop body
           for (i =3D 0; i < mtu->num_channels; ++i) {
           ^
   drivers/clocksource/sh_mtu2.c:432:7: note: 'ret' is >=3D 0
                   if (ret < 0)
                       ^~~
   drivers/clocksource/sh_mtu2.c:432:3: note: Taking false branch
                   if (ret < 0)
                   ^
   drivers/clocksource/sh_mtu2.c:430:2: note: Loop condition is true.  Ente=
ring loop body
           for (i =3D 0; i < mtu->num_channels; ++i) {
           ^
   drivers/clocksource/sh_mtu2.c:432:7: note: 'ret' is >=3D 0
                   if (ret < 0)
                       ^~~
   drivers/clocksource/sh_mtu2.c:432:3: note: Taking false branch
                   if (ret < 0)
                   ^
   drivers/clocksource/sh_mtu2.c:430:2: note: Loop condition is true.  Ente=
ring loop body
           for (i =3D 0; i < mtu->num_channels; ++i) {
           ^
   drivers/clocksource/sh_mtu2.c:432:7: note: Assuming 'ret' is >=3D 0
                   if (ret < 0)
                       ^~~~~~~
   drivers/clocksource/sh_mtu2.c:432:3: note: Taking false branch
                   if (ret < 0)
                   ^
   drivers/clocksource/sh_mtu2.c:430:37: note: The value 3 is assigned to '=
i'
           for (i =3D 0; i < mtu->num_channels; ++i) {
                                              ^~~
   drivers/clocksource/sh_mtu2.c:430:14: note: Assuming 'i' is < field 'num=
_channels'
           for (i =3D 0; i < mtu->num_channels; ++i) {
                       ^~~~~~~~~~~~~~~~~~~~~
   drivers/clocksource/sh_mtu2.c:430:2: note: Loop condition is true.  Ente=
ring loop body
           for (i =3D 0; i < mtu->num_channels; ++i) {
           ^
   drivers/clocksource/sh_mtu2.c:431:50: note: Passing the value 3 via 2nd =
parameter 'index'
                   ret =3D sh_mtu2_setup_channel(&mtu->channels[i], i, mtu);
                                                                  ^
   drivers/clocksource/sh_mtu2.c:431:9: note: Calling 'sh_mtu2_setup_channe=
l'
                   ret =3D sh_mtu2_setup_channel(&mtu->channels[i], i, mtu);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clocksource/sh_mtu2.c:350:6: note: Assuming 'irq' is >=3D 0
           if (irq < 0) {
               ^~~~~~~
   drivers/clocksource/sh_mtu2.c:350:2: note: Taking false branch
           if (irq < 0) {
           ^
   drivers/clocksource/sh_mtu2.c:358:6: note: Assuming 'ret' is 0
           if (ret) {
               ^~~
   drivers/clocksource/sh_mtu2.c:358:2: note: Taking false branch
           if (ret) {
           ^
   drivers/clocksource/sh_mtu2.c:364:26: note: The right operand of '+' is =
a garbage value due to array index out of bounds
           ch->base =3D mtu->mapbase + sh_mtu2_channel_offsets[index];
                                   ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/video/fbdev/core/fbmem.c:809:3: warning: Value stored to 'dst' i=
s never read [clang-analyzer-deadcode.DeadStores]
                   dst +=3D c;
                   ^      ~
   drivers/video/fbdev/core/fbmem.c:809:3: note: Value stored to 'dst' is n=
ever read
                   dst +=3D c;
                   ^      ~
   drivers/video/fbdev/core/fbmem.c:887:3: warning: Value stored to 'src' i=
s never read [clang-analyzer-deadcode.DeadStores]
                   src +=3D c;
                   ^      ~
   drivers/video/fbdev/core/fbmem.c:887:3: note: Value stored to 'src' is n=
ever read
                   src +=3D c;
                   ^      ~
   Suppressed 3 warnings (1 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
>> drivers/usb/phy/phy-mxs-usb.c:392:6: warning: Value stored to 'phyctrl' =
during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           u32 phyctrl =3D readl(base + HW_USBPHY_CTRL);
               ^~~~~~~
   drivers/usb/phy/phy-mxs-usb.c:392:6: note: Value stored to 'phyctrl' dur=
ing its initialization is never read
           u32 phyctrl =3D readl(base + HW_USBPHY_CTRL);
               ^~~~~~~
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
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
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
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   drivers/thermal/gov_fair_share.c:101:21: warning: Division by zero [clan=
g-analyzer-core.DivideZero]
                           percentage =3D 100 / total_instance;
                                        ~~~~^~~~~~~~~~~~~~~~
   drivers/thermal/gov_fair_share.c:82:2: note: 'total_instance' initialize=
d to 0
           int total_instance =3D 0;
           ^~~~~~~~~~~~~~~~~~
   drivers/thermal/gov_fair_share.c:85:2: note: Left side of '&&' is false
           list_for_each_entry(instance, &tz->thermal_instances, tz_node) {
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
   include/linux/kernel.h:694:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/thermal/gov_fair_share.c:85:2: note: Taking false branch
           list_for_each_entry(instance, &tz->thermal_instances, tz_node) {
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
--
           ^
   drivers/dma-buf/dma-resv.c:456:10: note: Left side of '&&' is false
                   fobj =3D rcu_dereference(obj->fence);
                          ^
   include/linux/rcupdate.h:557:28: note: expanded from macro 'rcu_derefere=
nce'
   #define rcu_dereference(p) rcu_dereference_check(p, 0)
                              ^
   include/linux/rcupdate.h:499:2: note: expanded from macro 'rcu_dereferen=
ce_check'
           __rcu_dereference_check((p), (c) || rcu_read_lock_held(), __rcu)
           ^
   include/linux/rcupdate.h:361:2: note: expanded from macro '__rcu_derefer=
ence_check'
           RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_check() usage=
"); \
           ^
   include/linux/rcupdate.h:331:48: note: expanded from macro 'RCU_LOCKDEP_=
WARN'
   #define RCU_LOCKDEP_WARN(c, s) do { } while (0 && (c))
                                                  ^
   drivers/dma-buf/dma-resv.c:456:10: note: Loop condition is false.  Exiti=
ng loop
                   fobj =3D rcu_dereference(obj->fence);
                          ^
   include/linux/rcupdate.h:557:28: note: expanded from macro 'rcu_derefere=
nce'
   #define rcu_dereference(p) rcu_dereference_check(p, 0)
                              ^
   include/linux/rcupdate.h:499:2: note: expanded from macro 'rcu_dereferen=
ce_check'
           __rcu_dereference_check((p), (c) || rcu_read_lock_held(), __rcu)
           ^
   include/linux/rcupdate.h:361:2: note: expanded from macro '__rcu_derefer=
ence_check'
           RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_check() usage=
"); \
           ^
   include/linux/rcupdate.h:331:32: note: expanded from macro 'RCU_LOCKDEP_=
WARN'
   #define RCU_LOCKDEP_WARN(c, s) do { } while (0 && (c))
                                  ^
   drivers/dma-buf/dma-resv.c:457:7: note: Assuming 'fobj' is non-null
                   if (fobj)
                       ^~~~
   drivers/dma-buf/dma-resv.c:457:3: note: Taking true branch
                   if (fobj)
                   ^
   drivers/dma-buf/dma-resv.c:460:7: note: Assuming 'pfence_excl' is null
                   if (!pfence_excl && fence_excl)
                       ^~~~~~~~~~~~
   drivers/dma-buf/dma-resv.c:460:7: note: Left side of '&&' is true
   drivers/dma-buf/dma-resv.c:460:23: note: 'fence_excl' is non-null
                   if (!pfence_excl && fence_excl)
                                       ^~~~~~~~~~
   drivers/dma-buf/dma-resv.c:460:3: note: Taking true branch
                   if (!pfence_excl && fence_excl)
                   ^
   drivers/dma-buf/dma-resv.c:463:7: note: Assuming 'sz' is 0
                   if (sz) {
                       ^~
   drivers/dma-buf/dma-resv.c:463:3: note: Taking false branch
                   if (sz) {
                   ^
   drivers/dma-buf/dma-resv.c:492:7: note: 'i' is equal to 'shared_count'
                   if (i !=3D shared_count || read_seqcount_retry(&obj->seq=
, seq)) {
                       ^
   drivers/dma-buf/dma-resv.c:492:7: note: Left side of '||' is false
   drivers/dma-buf/dma-resv.c:492:3: note: Taking false branch
                   if (i !=3D shared_count || read_seqcount_retry(&obj->seq=
, seq)) {
                   ^
   drivers/dma-buf/dma-resv.c:442:2: note: Loop condition is false.  Exitin=
g loop
           do {
           ^
   drivers/dma-buf/dma-resv.c:504:6: note: 'pfence_excl' is null
           if (pfence_excl)
               ^~~~~~~~~~~
   drivers/dma-buf/dma-resv.c:504:2: note: Taking false branch
           if (pfence_excl)
           ^
   drivers/dma-buf/dma-resv.c:506:11: note: 'fence_excl' is non-null
           else if (fence_excl)
                    ^~~~~~~~~~
   drivers/dma-buf/dma-resv.c:506:7: note: Taking true branch
           else if (fence_excl)
                ^
   drivers/dma-buf/dma-resv.c:507:26: note: Array access (from variable 'sh=
ared') results in a null pointer dereference
                   shared[shared_count++] =3D fence_excl;
                   ~~~~~~                 ^
   3 warnings generated.
   drivers/gpu/drm/tegra/dc.c:1950:2: warning: Value stored to 'value' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           value =3D tegra_dc_readl(dc, DC_CMD_STATE_CONTROL);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/tegra/dc.c:1950:2: note: Value stored to 'value' is neve=
r read
           value =3D tegra_dc_readl(dc, DC_CMD_STATE_CONTROL);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/tegra/dc.c:1954:2: warning: Value stored to 'value' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           value =3D tegra_dc_readl(dc, DC_CMD_STATE_CONTROL);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/tegra/dc.c:1954:2: note: Value stored to 'value' is neve=
r read
           value =3D tegra_dc_readl(dc, DC_CMD_STATE_CONTROL);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
>> drivers/gpu/drm/tegra/hda.c:53:3: warning: Value stored to 'bits' is nev=
er read [clang-analyzer-deadcode.DeadStores]
                   bits =3D (format & AC_FMT_BITS_MASK) >> AC_FMT_BITS_SHIF=
T;
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/tegra/hda.c:53:3: note: Value stored to 'bits' is never =
read
                   bits =3D (format & AC_FMT_BITS_MASK) >> AC_FMT_BITS_SHIF=
T;
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
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
   1 warning generated.
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
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/leds/leds-blinkm.c:484:2: warning: Value stored to 'ret' is neve=
r read [clang-analyzer-deadcode.DeadStores]
           ret =3D blinkm_transfer_hw(client, BLM_STOP_SCRIPT);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/leds/leds-blinkm.c:484:2: note: Value stored to 'ret' is never r=
ead
           ret =3D blinkm_transfer_hw(client, BLM_STOP_SCRIPT);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/leds/leds-blinkm.c:485:2: warning: Value stored to 'ret' is neve=
r read [clang-analyzer-deadcode.DeadStores]
           ret =3D blinkm_transfer_hw(client, BLM_GO_RGB);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/leds/leds-blinkm.c:485:2: note: Value stored to 'ret' is never r=
ead
           ret =3D blinkm_transfer_hw(client, BLM_GO_RGB);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/leds/leds-blinkm.c:546:18: warning: The left operand of '=3D=3D'=
 is a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
                   if (tmpargs[0] =3D=3D 0x09)
                       ~~~~~~~~~~ ^
   drivers/leds/leds-blinkm.c:528:7: note: Calling 'i2c_check_functionality'
           if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_BYTE_DATA
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/i2c.h:882:9: note: Assuming the condition is true
           return (func & i2c_get_functionality(adap)) =3D=3D func;
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/i2c.h:882:2: note: Returning the value 1, which participat=
es in a condition later
           return (func & i2c_get_functionality(adap)) =3D=3D func;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/leds/leds-blinkm.c:528:7: note: Returning from 'i2c_check_functi=
onality'
           if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_BYTE_DATA
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/leds/leds-blinkm.c:528:2: note: Taking false branch
           if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_BYTE_DATA
           ^
   drivers/leds/leds-blinkm.c:537:2: note: Loop condition is true.  Enterin=
g loop body
           while (count > 0) {
           ^
   drivers/leds/leds-blinkm.c:539:7: note: Assuming 'ret' is 0
                   if (ret)
                       ^~~
   drivers/leds/leds-blinkm.c:539:3: note: Taking false branch
                   if (ret)
                   ^
   drivers/leds/leds-blinkm.c:542:9: note: Calling 'blinkm_read'
                   ret =3D blinkm_read(client, BLM_GET_ADDR, tmpargs);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/leds/leds-blinkm.c:320:14: note: Assuming 'i' is >=3D 'retlen'
           for (i =3D 0; i < retlen; i++) {
                       ^~~~~~~~~~
   drivers/leds/leds-blinkm.c:320:2: note: Loop condition is false. Executi=
on continues on line 328
           for (i =3D 0; i < retlen; i++) {
           ^
   drivers/leds/leds-blinkm.c:328:2: note: Returning without writing to '*a=
rg'
           return 0;
           ^
   drivers/leds/leds-blinkm.c:328:2: note: Returning zero, which participat=
es in a condition later
           return 0;
           ^~~~~~~~
--
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/base/regmap/regcache.c:121:2: note: Taking false branch
           if (map->cache_type =3D=3D REGCACHE_NONE) {
           ^
   drivers/base/regmap/regcache.c:130:6: note: Assuming field 'reg_defaults=
' is null
           if (config->reg_defaults && !config->num_reg_defaults) {
               ^~~~~~~~~~~~~~~~~~~~
   drivers/base/regmap/regcache.c:130:27: note: Left side of '&&' is false
           if (config->reg_defaults && !config->num_reg_defaults) {
                                    ^
   drivers/base/regmap/regcache.c:136:14: note: Assuming 'i' is < field 'nu=
m_reg_defaults'
           for (i =3D 0; i < config->num_reg_defaults; i++)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/base/regmap/regcache.c:136:2: note: Loop condition is true.  Ent=
ering loop body
           for (i =3D 0; i < config->num_reg_defaults; i++)
           ^
   drivers/base/regmap/regcache.c:137:7: note: Dereference of null pointer
                   if (config->reg_defaults[i].reg % map->reg_stride)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/gpu/drm/bridge/tc358768.c:217:13: warning: The left operand of '=
&' is a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           tmp =3D orig & ~mask;
                      ^
   drivers/gpu/drm/bridge/tc358768.c:850:6: note: Assuming field 'enabled' =
is not equal to 0
           if (!priv->enabled) {
               ^~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/tc358768.c:850:2: note: Taking false branch
           if (!priv->enabled) {
           ^
   drivers/gpu/drm/bridge/tc358768.c:856:2: note: Calling 'tc358768_update_=
bits'
           tc358768_update_bits(priv, TC358768_PP_MISC, 0x3 << 14, 0);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/tc358768.c:214:11: note: 'orig' declared without =
an initial value
           u32 tmp, orig;
                    ^~~~
   drivers/gpu/drm/bridge/tc358768.c:216:2: note: Calling 'tc358768_read'
           tc358768_read(priv, reg, &orig);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/tc358768.c:199:6: note: Assuming field 'error' is=
 not equal to 0
           if (priv->error)
               ^~~~~~~~~~~
   drivers/gpu/drm/bridge/tc358768.c:199:2: note: Taking true branch
           if (priv->error)
           ^
   drivers/gpu/drm/bridge/tc358768.c:200:3: note: Returning without writing=
 to '*val'
                   return;
                   ^
   drivers/gpu/drm/bridge/tc358768.c:216:2: note: Returning from 'tc358768_=
read'
           tc358768_read(priv, reg, &orig);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/tc358768.c:217:13: note: The left operand of '&' =
is a garbage value
           tmp =3D orig & ~mask;
                 ~~~~ ^
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c:591:5: warning: The resu=
lt of the left shift is undefined because the left operand is negative [cla=
ng-analyzer-core.UndefinedBinaryOperatorResult]
                                   ATMEL_HLCDC_LAYER_DISC_SIZE(state->disc_=
w,
                                   ^
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h:115:67: note: expanded from=
 macro 'ATMEL_HLCDC_LAYER_DISC_SIZE'
   #define ATMEL_HLCDC_LAYER_DISC_SIZE(w, h)       (((w) - 1) | (((h) - 1) =
<< 16))
                                                                           ^
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c:740:6: note: Assuming fi=
eld 'crtc' is non-null
           if (!p->state->crtc || !p->state->fb)
               ^~~~~~~~~~~~~~~
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c:740:6: note: Left side o=
f '||' is false
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c:740:25: note: Assuming f=
ield 'fb' is non-null
           if (!p->state->crtc || !p->state->fb)
                                  ^~~~~~~~~~~~~
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c:740:2: note: Taking fals=
e branch
           if (!p->state->crtc || !p->state->fb)
           ^
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c:743:6: note: Assuming fi=
eld 'visible' is true
           if (!state->base.visible) {
               ^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c:743:2: note: Taking fals=
e branch
           if (!state->base.visible) {
           ^
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c:753:2: note: Calling 'at=
mel_hlcdc_plane_update_disc_area'
           atmel_hlcdc_plane_update_disc_area(plane, state);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c:583:6: note: Assuming fi=
eld 'disc_pos' is not equal to 0
           if (!layout->disc_pos || !layout->disc_size)
               ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c:583:6: note: Left side o=
f '||' is false
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c:583:27: note: Assuming f=
ield 'disc_size' is not equal to 0
           if (!layout->disc_pos || !layout->disc_size)
                                    ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c:583:2: note: Taking fals=
e branch
           if (!layout->disc_pos || !layout->disc_size)
           ^
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c:591:5: note: The result =
of the left shift is undefined because the left operand is negative
                                   ATMEL_HLCDC_LAYER_DISC_SIZE(state->disc_=
w,
                                   ^
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h:115:67: note: expanded from=
 macro 'ATMEL_HLCDC_LAYER_DISC_SIZE'
   #define ATMEL_HLCDC_LAYER_DISC_SIZE(w, h)       (((w) - 1) | (((h) - 1) =
<< 16))
                                                                 ~~~~~~~~~ ^
>> drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c:816:39: warning: Value s=
tored to 'desc' during its initialization is never read [clang-analyzer-dea=
dcode.DeadStores]
           const struct atmel_hlcdc_layer_desc *desc =3D plane->layer.desc;
                                                ^~~~   ~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c:816:39: note: Value stor=
ed to 'desc' during its initialization is never read
           const struct atmel_hlcdc_layer_desc *desc =3D plane->layer.desc;
                                                ^~~~   ~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c:134:9: warning: The resul=
t of the left shift is undefined due to shifting '16711678' by '16', which =
is unrepresentable in the unsigned version of the return type 'int' [clang-=
analyzer-core.UndefinedBinaryOperatorResult]
           cfg |=3D ATMEL_HLCDC_CLKDIV(div);
                  ^
   include/linux/mfd/atmel-hlcdc.h:44:45: note: expanded from macro 'ATMEL_=
HLCDC_CLKDIV'
   #define ATMEL_HLCDC_CLKDIV(div)         ((div - 2) << ATMEL_HLCDC_CLKDIV=
_SHFT)
                                            ~~~~~~~~~ ^
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c:78:8: note: Calling 'clk_=
prepare_enable'
           ret =3D clk_prepare_enable(crtc->dc->hlcdc->sys_clk);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/clk.h:929:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   include/linux/clk.h:929:2: note: Taking false branch
           if (ret)
           ^
   include/linux/clk.h:932:6: note: Assuming 'ret' is 0, which participates=
 in a condition later
           if (ret)
               ^~~
   include/linux/clk.h:932:2: note: Taking false branch
           if (ret)
           ^
   include/linux/clk.h:935:2: note: Returning zero (loaded from 'ret'), whi=
ch participates in a condition later
           return ret;
           ^~~~~~~~~~
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c:78:8: note: Returning fro=
m 'clk_prepare_enable'
           ret =3D clk_prepare_enable(crtc->dc->hlcdc->sys_clk);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c:79:6: note: 'ret' is 0
           if (ret)
               ^~~
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c:79:2: note: Taking false =
branch
           if (ret)
           ^
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c:104:6: note: Assuming fie=
ld 'fixed_clksrc' is true
           if (!crtc->dc->desc->fixed_clksrc) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c:104:2: note: Taking false=
 branch
           if (!crtc->dc->desc->fixed_clksrc) {
           ^
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c:111:6: note: Assuming 'di=
v' is >=3D 2
           if (div < 2) {
               ^~~~~~~
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c:111:2: note: Taking false=
 branch
           if (div < 2) {
           ^
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c:113:13: note: Assuming th=
e condition is true
           } else if (ATMEL_HLCDC_CLKDIV(div) & ~ATMEL_HLCDC_CLKDIV_MASK) {
                      ^
   include/linux/mfd/atmel-hlcdc.h:44:34: note: expanded from macro 'ATMEL_=
HLCDC_CLKDIV'
   #define ATMEL_HLCDC_CLKDIV(div)         ((div - 2) << ATMEL_HLCDC_CLKDIV=
_SHFT)
                                           ^
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c:113:9: note: Taking true =
branch
           } else if (ATMEL_HLCDC_CLKDIV(div) & ~ATMEL_HLCDC_CLKDIV_MASK) {
                  ^
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c:118:7: note: Assuming the=
 condition is true
                   if (ATMEL_HLCDC_CLKDIV(div) & ~ATMEL_HLCDC_CLKDIV_MASK)
                       ^
   include/linux/mfd/atmel-hlcdc.h:44:34: note: expanded from macro 'ATMEL_=
HLCDC_CLKDIV'
   #define ATMEL_HLCDC_CLKDIV(div)         ((div - 2) << ATMEL_HLCDC_CLKDIV=
_SHFT)
                                           ^
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c:118:3: note: Taking true =
branch
                   if (ATMEL_HLCDC_CLKDIV(div) & ~ATMEL_HLCDC_CLKDIV_MASK)
                   ^
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c:134:9: note: The result o=
f the left shift is undefined due to shifting '16711678' by '16', which is =
unrepresentable in the unsigned version of the return type 'int'
           cfg |=3D ATMEL_HLCDC_CLKDIV(div);
                  ^
   include/linux/mfd/atmel-hlcdc.h:44:45: note: expanded from macro 'ATMEL_=
HLCDC_CLKDIV'
   #define ATMEL_HLCDC_CLKDIV(div)         ((div - 2) << ATMEL_HLCDC_CLKDIV=
_SHFT)
                                            ~~~~~~~~~ ^
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   kernel/irq/irqdomain.c:595:2: warning: Value stored to 'of_node' is neve=
r read [clang-analyzer-deadcode.DeadStores]
           of_node =3D irq_domain_get_of_node(domain);
           ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/irq/irqdomain.c:595:2: note: Value stored to 'of_node' is never r=
ead
           of_node =3D irq_domain_get_of_node(domain);
           ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
--
                                      ^~~~~~~~~
   lib/mpi/mpi-pow.c:159:33: note: Left side of '&&' is false
                   negative_result =3D (ep[0] & 1) && base->sign;
                                                 ^
   lib/mpi/mpi-pow.c:163:7: note: Calling 'count_leading_zeros'
                   c =3D count_leading_zeros(e);
                       ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/count_zeros.h:25:2: note: Taking true branch
           if (sizeof(x) =3D=3D 4)
           ^
   include/linux/count_zeros.h:26:3: note: Returning the value 32
                   return BITS_PER_LONG - fls(x);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/mpi/mpi-pow.c:163:7: note: Returning from 'count_leading_zeros'
                   c =3D count_leading_zeros(e);
                       ^~~~~~~~~~~~~~~~~~~~~~
   lib/mpi/mpi-pow.c:163:3: note: The value 32 is assigned to 'c'
                   c =3D count_leading_zeros(e);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/mpi/mpi-pow.c:164:10: note: The result of the left shift is undefine=
d due to shifting by '32', which is greater or equal to the width of type '=
mpi_limb_t'
                   e =3D (e << c) << 1;      /* shift the exp bits to the l=
eft, lose msb */
                          ^  ~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (2 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   arch/arm/kernel/traps.c:185:4: warning: Value stored to 'p' is never rea=
d [clang-analyzer-deadcode.DeadStores]
                           p +=3D sprintf(p, "bad PC value");
                           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/kernel/traps.c:185:4: note: Value stored to 'p' is never read
                           p +=3D sprintf(p, "bad PC value");
                           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 13 warnings (1 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/regulator/core.c:3671:3: warning: Value stored to 'possible_uV' =
is never read [clang-analyzer-deadcode.DeadStores]
                   possible_uV =3D desired_min_uV;
                   ^             ~~~~~~~~~~~~~~
   drivers/regulator/core.c:3671:3: note: Value stored to 'possible_uV' is =
never read
                   possible_uV =3D desired_min_uV;
                   ^             ~~~~~~~~~~~~~~
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
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
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
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
>> drivers/staging/media/omap4iss/iss_csi2.c:606:21: warning: Value stored =
to 'iss' during its initialization is never read [clang-analyzer-deadcode.D=
eadStores]
           struct iss_device *iss =3D csi2->iss;
                              ^~~   ~~~~~~~~~
   drivers/staging/media/omap4iss/iss_csi2.c:606:21: note: Value stored to =
'iss' during its initialization is never read
           struct iss_device *iss =3D csi2->iss;
                              ^~~   ~~~~~~~~~
   drivers/staging/media/omap4iss/iss_csi2.c:744:21: warning: Value stored =
to 'iss' during its initialization is never read [clang-analyzer-deadcode.D=
eadStores]
           struct iss_device *iss =3D csi2->iss;
                              ^~~   ~~~~~~~~~
   drivers/staging/media/omap4iss/iss_csi2.c:744:21: note: Value stored to =
'iss' during its initialization is never read
           struct iss_device *iss =3D csi2->iss;
                              ^~~   ~~~~~~~~~
   1 warning generated.
>> drivers/staging/media/omap4iss/iss_csiphy.c:197:3: warning: Division by =
zero [clang-analyzer-core.DivideZero]
                   / (2 * csi2->phy->used_data_lanes)
   ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/omap4iss/iss_csiphy.c:119:30: note: Left side of '=
&&' is false
           struct iss_pipeline *pipe =3D to_iss_pipeline(&csi2_subdev->enti=
ty);
                                       ^
   drivers/staging/media/omap4iss/iss_video.h:95:2: note: expanded from mac=
ro 'to_iss_pipeline'
           container_of((__e)->pipe, struct iss_pipeline, pipe)
           ^
   include/linux/kernel.h:694:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/staging/media/omap4iss/iss_csiphy.c:119:30: note: Taking false b=
ranch
           struct iss_pipeline *pipe =3D to_iss_pipeline(&csi2_subdev->enti=
ty);
                                       ^
   drivers/staging/media/omap4iss/iss_video.h:95:2: note: expanded from mac=
ro 'to_iss_pipeline'
           container_of((__e)->pipe, struct iss_pipeline, pipe)
           ^
   include/linux/kernel.h:694:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:306:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/staging/media/omap4iss/iss_csiphy.c:119:30: note: Loop condition=
 is false.  Exiting loop
           struct iss_pipeline *pipe =3D to_iss_pipeline(&csi2_subdev->enti=
ty);
                                       ^
   drivers/staging/media/omap4iss/iss_video.h:95:2: note: expanded from mac=
ro 'to_iss_pipeline'
           container_of((__e)->pipe, struct iss_pipeline, pipe)
           ^
   include/linux/kernel.h:694:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:304:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/staging/media/omap4iss/iss_csiphy.c:146:6: note: Assuming field =
'interface' is not equal to ISS_INTERFACE_CSI2A_PHY1
           if (subdevs->interface =3D=3D ISS_INTERFACE_CSI2A_PHY1) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/omap4iss/iss_csiphy.c:146:2: note: Taking false br=
anch
           if (subdevs->interface =3D=3D ISS_INTERFACE_CSI2A_PHY1) {
           ^
   drivers/staging/media/omap4iss/iss_csiphy.c:157:6: note: Assuming field =
'interface' is not equal to ISS_INTERFACE_CSI2B_PHY2
           if (subdevs->interface =3D=3D ISS_INTERFACE_CSI2B_PHY2) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/omap4iss/iss_csiphy.c:157:2: note: Taking false br=
anch
           if (subdevs->interface =3D=3D ISS_INTERFACE_CSI2B_PHY2) {
           ^
   drivers/staging/media/omap4iss/iss_csiphy.c:171:2: note: The value 0 is =
assigned to field 'used_data_lanes'
           csi2->phy->used_data_lanes =3D 0;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/omap4iss/iss_csiphy.c:174:14: note: Assuming 'i' i=
s >=3D field 'max_data_lanes'
           for (i =3D 0; i < csi2->phy->max_data_lanes; i++) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/omap4iss/iss_csiphy.c:174:2: note: Loop condition =
is false. Execution continues on line 189
           for (i =3D 0; i < csi2->phy->max_data_lanes; i++) {
           ^
   drivers/staging/media/omap4iss/iss_csiphy.c:189:6: note: Assuming field =
'pol' is <=3D 1
           if (lanes->clk.pol > 1 ||
               ^~~~~~~~~~~~~~~~~~
   drivers/staging/media/omap4iss/iss_csiphy.c:189:6: note: Left side of '|=
|' is false
   drivers/staging/media/omap4iss/iss_csiphy.c:190:6: note: Assuming the co=
ndition is false
               lanes->clk.pos > (csi2->phy->max_data_lanes + 1))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/omap4iss/iss_csiphy.c:189:2: note: Taking false br=
anch
           if (lanes->clk.pol > 1 ||
           ^
   drivers/staging/media/omap4iss/iss_csiphy.c:193:6: note: Assuming field =
'pos' is not equal to 0
           if (lanes->clk.pos =3D=3D 0 || used_lanes & (1 << lanes->clk.pos=
))
               ^~~~~~~~~~~~~~~~~~~
   drivers/staging/media/omap4iss/iss_csiphy.c:193:6: note: Left side of '|=
|' is false
   drivers/staging/media/omap4iss/iss_csiphy.c:193:2: note: Taking false br=
anch
           if (lanes->clk.pos =3D=3D 0 || used_lanes & (1 << lanes->clk.pos=
))
           ^
   drivers/staging/media/omap4iss/iss_csiphy.c:197:3: note: Division by zero
                   / (2 * csi2->phy->used_data_lanes)
   ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 warnings generated.
   drivers/rtc/rtc-rs5c372.c:564:2: warning: Value stored to 'addr' is neve=
r read [clang-analyzer-deadcode.DeadStores]
           addr   =3D RS5C_ADDR(RS5C_REG_CTRL1);
           ^
   drivers/rtc/rtc-rs5c372.c:564:2: note: Value stored to 'addr' is never r=
ead
   Suppressed 1 warnings (1 in non-user code).
--
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/mmc/host/vub300.c:1610:4: warning: Value stored to 'result' is n=
ever read [clang-analyzer-deadcode.DeadStores]
                           result =3D usb_reset_device(vub300->udev);
                           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/vub300.c:1610:4: note: Value stored to 'result' is neve=
r read
                           result =3D usb_reset_device(vub300->udev);
                           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/mmc/host/moxart-mmc.c:297:2: warning: Value stored to 'dma_time'=
 is never read [clang-analyzer-deadcode.DeadStores]
           dma_time =3D wait_for_completion_interruptible_timeout(
           ^          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/moxart-mmc.c:297:2: note: Value stored to 'dma_time' is=
 never read
           dma_time =3D wait_for_completion_interruptible_timeout(
           ^          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/moxart-mmc.c:434:4: warning: Value stored to 'pio_time'=
 is never read [clang-analyzer-deadcode.DeadStores]
                           pio_time =3D wait_for_completion_interruptible_t=
imeout(
                           ^          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   drivers/mmc/host/moxart-mmc.c:434:4: note: Value stored to 'pio_time' is=
 never read
                           pio_time =3D wait_for_completion_interruptible_t=
imeout(
                           ^          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   Suppressed 3 warnings (1 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   drivers/power/supply/twl4030_charger.c:364:2: warning: Value stored to '=
cur_reg' is never read [clang-analyzer-deadcode.DeadStores]
           cur_reg |=3D oldreg << 8;
           ^          ~~~~~~~~~~~
   drivers/power/supply/twl4030_charger.c:364:2: note: Value stored to 'cur=
_reg' is never read
           cur_reg |=3D oldreg << 8;
           ^          ~~~~~~~~~~~
   drivers/power/supply/twl4030_charger.c:383:3: warning: Value stored to '=
status' is never read [clang-analyzer-deadcode.DeadStores]
                   status =3D twl_i2c_write_u8(TWL_MODULE_MAIN_CHARGE,
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/power/supply/twl4030_charger.c:383:3: note: Value stored to 'sta=
tus' is never read
                   status =3D twl_i2c_write_u8(TWL_MODULE_MAIN_CHARGE,
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/power/supply/twl4030_charger.c:412:2: warning: Value stored to '=
curr' is never read [clang-analyzer-deadcode.DeadStores]
           curr =3D twl4030_charger_get_current();
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/power/supply/twl4030_charger.c:412:2: note: Value stored to 'cur=
r' is never read
           curr =3D twl4030_charger_get_current();
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/power/supply/twl4030_charger.c:467:4: warning: Value stored to '=
ret' is never read [clang-analyzer-deadcode.DeadStores]
                           ret =3D twl4030_clear_set_boot_bci(0, TWL4030_BC=
IAUTOUSB);
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   drivers/power/supply/twl4030_charger.c:467:4: note: Value stored to 'ret=
' is never read
                           ret =3D twl4030_clear_set_boot_bci(0, TWL4030_BC=
IAUTOUSB);
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   drivers/power/supply/twl4030_charger.c:487:4: warning: Value stored to '=
ret' is never read [clang-analyzer-deadcode.DeadStores]
                           ret =3D twl_i2c_write_u8(TWL_MODULE_MAIN_CHARGE,=
 0x33,
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/power/supply/twl4030_charger.c:487:4: note: Value stored to 'ret=
' is never read
                           ret =3D twl_i2c_write_u8(TWL_MODULE_MAIN_CHARGE,=
 0x33,
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/power/supply/twl4030_charger.c:490:4: warning: Value stored to '=
ret' is never read [clang-analyzer-deadcode.DeadStores]
                           ret =3D twl_i2c_write_u8(TWL_MODULE_MAIN_CHARGE,=
 0x2a,
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/power/supply/twl4030_charger.c:490:4: note: Value stored to 'ret=
' is never read
                           ret =3D twl_i2c_write_u8(TWL_MODULE_MAIN_CHARGE,=
 0x2a,
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/power/supply/twl4030_charger.c:493:4: warning: Value stored to '=
ret' is never read [clang-analyzer-deadcode.DeadStores]
                           ret =3D twl_i2c_write_u8(TWL_MODULE_MAIN_CHARGE,=
 0x26,
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/power/supply/twl4030_charger.c:493:4: note: Value stored to 'ret=
' is never read
                           ret =3D twl_i2c_write_u8(TWL_MODULE_MAIN_CHARGE,=
 0x26,
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/power/supply/twl4030_charger.c:496:4: warning: Value stored to '=
ret' is never read [clang-analyzer-deadcode.DeadStores]
                           ret =3D twl_i2c_write_u8(TWL_MODULE_MAIN_CHARGE,=
 0xf3,
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/power/supply/twl4030_charger.c:496:4: note: Value stored to 'ret=
' is never read
                           ret =3D twl_i2c_write_u8(TWL_MODULE_MAIN_CHARGE,=
 0xf3,
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/power/supply/twl4030_charger.c:499:4: warning: Value stored to '=
ret' is never read [clang-analyzer-deadcode.DeadStores]
                           ret =3D twl_i2c_write_u8(TWL_MODULE_MAIN_CHARGE,=
 0x9c,
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/power/supply/twl4030_charger.c:499:4: note: Value stored to 'ret=
' is never read
                           ret =3D twl_i2c_write_u8(TWL_MODULE_MAIN_CHARGE,=
 0x9c,
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   Suppressed 3 warnings (2 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
>> drivers/staging/media/omap4iss/iss_ipipeif.c:51:21: warning: Value store=
d to 'iss' during its initialization is never read [clang-analyzer-deadcode=
.DeadStores]
           struct iss_device *iss =3D to_iss_device(ipipeif);
                              ^~~
   drivers/staging/media/omap4iss/iss_ipipeif.c:51:21: note: Value stored t=
o 'iss' during its initialization is never read
           struct iss_device *iss =3D to_iss_device(ipipeif);
                              ^~~
>> drivers/staging/media/omap4iss/iss_ipipeif.c:204:2: warning: Value store=
d to 'format' is never read [clang-analyzer-deadcode.DeadStores]
           format =3D &ipipeif->formats[IPIPEIF_PAD_SOURCE_ISIF_SF];
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/omap4iss/iss_ipipeif.c:204:2: note: Value stored t=
o 'format' is never read
           format =3D &ipipeif->formats[IPIPEIF_PAD_SOURCE_ISIF_SF];
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
>> drivers/staging/media/omap4iss/iss_ipipe.c:47:21: warning: Value stored =
to 'iss' during its initialization is never read [clang-analyzer-deadcode.D=
eadStores]
           struct iss_device *iss =3D to_iss_device(ipipe);
                              ^~~
   drivers/staging/media/omap4iss/iss_ipipe.c:47:21: note: Value stored to =
'iss' during its initialization is never read
           struct iss_device *iss =3D to_iss_device(ipipe);
                              ^~~
>> drivers/staging/media/omap4iss/iss_ipipe.c:115:2: warning: Value stored =
to 'format' is never read [clang-analyzer-deadcode.DeadStores]
           format =3D &ipipe->formats[IPIPE_PAD_SOURCE_VP];
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/omap4iss/iss_ipipe.c:115:2: note: Value stored to =
'format' is never read
           format =3D &ipipe->formats[IPIPE_PAD_SOURCE_VP];
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
>> drivers/staging/media/omap4iss/iss_resizer.c:43:21: warning: Value store=
d to 'iss' during its initialization is never read [clang-analyzer-deadcode=
.DeadStores]
           struct iss_device *iss =3D to_iss_device(resizer);
                              ^~~
   drivers/staging/media/omap4iss/iss_resizer.c:43:21: note: Value stored t=
o 'iss' during its initialization is never read
           struct iss_device *iss =3D to_iss_device(resizer);
                              ^~~
   drivers/staging/media/omap4iss/iss_resizer.c:288:21: warning: Value stor=
ed to 'iss' during its initialization is never read [clang-analyzer-deadcod=
e.DeadStores]
           struct iss_device *iss =3D to_iss_device(resizer);
                              ^~~
   drivers/staging/media/omap4iss/iss_resizer.c:288:21: note: Value stored =
to 'iss' during its initialization is never read
           struct iss_device *iss =3D to_iss_device(resizer);
                              ^~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
>> drivers/staging/media/omap4iss/iss_video.c:125:13: warning: Assigned val=
ue is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
           pix->width =3D mbus->width;
                      ^
   drivers/staging/media/omap4iss/iss_video.c:853:29: note: Left side of '&=
&' is true
           struct iss_video_fh *vfh =3D to_iss_video_fh(fh);
                                      ^
   drivers/staging/media/omap4iss/iss_video.h:181:29: note: expanded from m=
acro 'to_iss_video_fh'
   #define to_iss_video_fh(fh)     container_of(fh, struct iss_video_fh, vf=
h)
                                   ^
   include/linux/kernel.h:694:19: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                            ^
   drivers/staging/media/omap4iss/iss_video.c:853:29: note: Taking false br=
anch
           struct iss_video_fh *vfh =3D to_iss_video_fh(fh);
                                      ^
   drivers/staging/media/omap4iss/iss_video.h:181:29: note: expanded from m=
acro 'to_iss_video_fh'
   #define to_iss_video_fh(fh)     container_of(fh, struct iss_video_fh, vf=
h)
                                   ^
   include/linux/kernel.h:694:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:306:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/staging/media/omap4iss/iss_video.c:853:29: note: Loop condition =
is false.  Exiting loop
           struct iss_video_fh *vfh =3D to_iss_video_fh(fh);
                                      ^
   drivers/staging/media/omap4iss/iss_video.h:181:29: note: expanded from m=
acro 'to_iss_video_fh'
   #define to_iss_video_fh(fh)     container_of(fh, struct iss_video_fh, vf=
h)
                                   ^
   include/linux/kernel.h:694:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:304:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/staging/media/omap4iss/iss_video.c:863:6: note: Assuming 'type' =
is equal to field 'type'
           if (type !=3D video->type)
               ^~~~~~~~~~~~~~~~~~~
   drivers/staging/media/omap4iss/iss_video.c:863:2: note: Taking false bra=
nch
           if (type !=3D video->type)
           ^
   drivers/staging/media/omap4iss/iss_video.c:872:9: note: Assuming field '=
pipe' is null
           pipe =3D entity->pipe
                  ^~~~~~~~~~~~
   drivers/staging/media/omap4iss/iss_video.c:872:9: note: '?' condition is=
 false
   drivers/staging/media/omap4iss/iss_video.c:879:6: note: Assuming 'ret' i=
s 0
           if (ret)
               ^~~
   drivers/staging/media/omap4iss/iss_video.c:879:2: note: Taking false bra=
nch
           if (ret)
           ^
   drivers/staging/media/omap4iss/iss_video.c:883:6: note: Assuming 'ret' i=
s 0
           if (ret)
               ^~~
   drivers/staging/media/omap4iss/iss_video.c:883:2: note: Taking false bra=
nch
           if (ret)
           ^
   drivers/staging/media/omap4iss/iss_video.c:886:6: note: Assuming field '=
set_constraints' is null
           if (video->iss->pdata->set_constraints)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/omap4iss/iss_video.c:886:2: note: Taking false bra=
nch
           if (video->iss->pdata->set_constraints)
           ^
   drivers/staging/media/omap4iss/iss_video.c:890:6: note: Assuming 'ret' i=
s >=3D 0
           if (ret < 0)
               ^~~~~~~
   drivers/staging/media/omap4iss/iss_video.c:890:2: note: Taking false bra=
nch
           if (ret < 0)
           ^
   drivers/staging/media/omap4iss/iss_video.c:894:2: note: Loop condition i=
s false. Execution continues on line 901
           while ((entity =3D media_graph_walk_next(&graph)))
           ^
   drivers/staging/media/omap4iss/iss_video.c:901:8: note: Calling 'iss_vid=
eo_check_format'
           ret =3D iss_video_check_format(video, vfh);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/omap4iss/iss_video.c:278:8: note: Calling '__iss_v=
ideo_get_format'
           ret =3D __iss_video_get_format(video, &format);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/omap4iss/iss_video.c:253:7: note: 'subdev' is non-=
null
           if (!subdev)
                ^~~~~~
   drivers/staging/media/omap4iss/iss_video.c:253:2: note: Taking false bra=
nch
           if (!subdev)
           ^
   drivers/staging/media/omap4iss/iss_video.c:261:8: note: '__sd' is non-nu=
ll
           ret =3D v4l2_subdev_call(subdev, pad, get_fmt, NULL, &fmt);
                 ^
   include/media/v4l2-subdev.h:1140:8: note: expanded from macro 'v4l2_subd=
ev_call'
                   if (!__sd)                                              \
                        ^~~~
   drivers/staging/media/omap4iss/iss_video.c:261:8: note: Taking false bra=
nch
           ret =3D v4l2_subdev_call(subdev, pad, get_fmt, NULL, &fmt);
                 ^
   include/media/v4l2-subdev.h:1140:3: note: expanded from macro 'v4l2_subd=
ev_call'
                   if (!__sd)                                              \
                   ^
   drivers/staging/media/omap4iss/iss_video.c:261:8: note: Assuming field '=
pad' is non-null
           ret =3D v4l2_subdev_call(subdev, pad, get_fmt, NULL, &fmt);
                 ^
   include/media/v4l2-subdev.h:1142:14: note: expanded from macro 'v4l2_sub=
dev_call'
                   else if (!(__sd->ops->o && __sd->ops->o->f))            \
                              ^~~~~~~~~~~~
   drivers/staging/media/omap4iss/iss_video.c:261:8: note: Left side of '&&=
' is true
           ret =3D v4l2_subdev_call(subdev, pad, get_fmt, NULL, &fmt);
                 ^
   include/media/v4l2-subdev.h:1142:14: note: expanded from macro 'v4l2_sub=
dev_call'
                   else if (!(__sd->ops->o && __sd->ops->o->f))            \
                              ^
   drivers/staging/media/omap4iss/iss_video.c:261:8: note: Assuming the con=
dition is false
           ret =3D v4l2_subdev_call(subdev, pad, get_fmt, NULL, &fmt);
                 ^
   include/media/v4l2-subdev.h:1142:12: note: expanded from macro 'v4l2_sub=
dev_call'
                   else if (!(__sd->ops->o && __sd->ops->o->f))            \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/omap4iss/iss_video.c:261:8: note: Taking false bra=
nch
           ret =3D v4l2_subdev_call(subdev, pad, get_fmt, NULL, &fmt);
                 ^
   include/media/v4l2-subdev.h:1142:8: note: expanded from macro 'v4l2_subd=
ev_call'
                   else if (!(__sd->ops->o && __sd->ops->o->f))            \
                        ^
   drivers/staging/media/omap4iss/iss_video.c:261:8: note: Assuming field '=
pad' is null
           ret =3D v4l2_subdev_call(subdev, pad, get_fmt, NULL, &fmt);
                 ^
   include/media/v4l2-subdev.h:1144:12: note: expanded from macro 'v4l2_sub=
dev_call'
                   else if (v4l2_subdev_call_wrappers.o &&                 \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/omap4iss/iss_video.c:261:8: note: Left side of '&&=
' is false
           ret =3D v4l2_subdev_call(subdev, pad, get_fmt, NULL, &fmt);
                 ^
   include/media/v4l2-subdev.h:1144:40: note: expanded from macro 'v4l2_sub=
dev_call'
                   else if (v4l2_subdev_call_wrappers.o &&                 \
                                                        ^
   drivers/staging/media/omap4iss/iss_video.c:264:6: note: Assuming 'ret' i=
s not equal to 0
           if (ret)
               ^~~
   drivers/staging/media/omap4iss/iss_video.c:264:2: note: Taking true bran=
ch
           if (ret)
           ^
   drivers/staging/media/omap4iss/iss_video.c:265:3: note: Returning withou=
t writing to 'format->width'
                   return ret;
                   ^
   drivers/staging/media/omap4iss/iss_video.c:278:8: note: Returning from '=
__iss_video_get_format'
           ret =3D __iss_video_get_format(video, &format);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/omap4iss/iss_video.c:279:6: note: Assuming 'ret' i=
s >=3D 0
           if (ret < 0)
               ^~~~~~~
   drivers/staging/media/omap4iss/iss_video.c:279:2: note: Taking false bra=
nch
           if (ret < 0)
           ^
   drivers/staging/media/omap4iss/iss_video.c:283:8: note: Calling 'iss_vid=
eo_mbus_to_pix'
           ret =3D iss_video_mbus_to_pix(video, &format, &pixfmt);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/omap4iss/iss_video.c:125:13: note: Assigned value =
is garbage or undefined
           pix->width =3D mbus->width;
                      ^ ~~~~~~~~~~~
>> drivers/staging/media/omap4iss/iss_video.c:333:20: warning: Value stored=
 to 'video' during its initialization is never read [clang-analyzer-deadcod=
e.DeadStores]
           struct iss_video *video =3D vfh->video;
                             ^~~~~   ~~~~~~~~~~
   drivers/staging/media/omap4iss/iss_video.c:333:20: note: Value stored to=
 'video' during its initialization is never read
           struct iss_video *video =3D vfh->video;
                             ^~~~~   ~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   sound/usb/caiaq/audio.c:123:17: warning: Value stored to 'dev' during it=
s initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D caiaqdev_to_dev(cdev);
                          ^~~
   sound/usb/caiaq/audio.c:123:17: note: Value stored to 'dev' during its i=
nitialization is never read
           struct device *dev =3D caiaqdev_to_dev(cdev);
                          ^~~
   sound/usb/caiaq/audio.c:144:17: warning: Value stored to 'dev' during it=
s initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D caiaqdev_to_dev(cdev);
                          ^~~
   sound/usb/caiaq/audio.c:144:17: note: Value stored to 'dev' during its i=
nitialization is never read
           struct device *dev =3D caiaqdev_to_dev(cdev);
                          ^~~
   sound/usb/caiaq/audio.c:156:17: warning: Value stored to 'dev' during it=
s initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D caiaqdev_to_dev(cdev);
                          ^~~
   sound/usb/caiaq/audio.c:156:17: note: Value stored to 'dev' during its i=
nitialization is never read
           struct device *dev =3D caiaqdev_to_dev(cdev);
                          ^~~
   sound/usb/caiaq/audio.c:191:17: warning: Value stored to 'dev' during it=
s initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D caiaqdev_to_dev(cdev);
                          ^~~
   sound/usb/caiaq/audio.c:191:17: note: Value stored to 'dev' during its i=
nitialization is never read
           struct device *dev =3D caiaqdev_to_dev(cdev);
                          ^~~
   sound/usb/caiaq/audio.c:274:17: warning: Value stored to 'dev' during it=
s initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D caiaqdev_to_dev(cdev);
                          ^~~
   sound/usb/caiaq/audio.c:274:17: note: Value stored to 'dev' during its i=
nitialization is never read
           struct device *dev =3D caiaqdev_to_dev(cdev);
                          ^~~
   sound/usb/caiaq/audio.c:874:17: warning: Value stored to 'dev' during it=
s initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D caiaqdev_to_dev(cdev);
                          ^~~
   sound/usb/caiaq/audio.c:874:17: note: Value stored to 'dev' during its i=
nitialization is never read
           struct device *dev =3D caiaqdev_to_dev(cdev);
                          ^~~
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
>> sound/usb/hiface/pcm.c:232:19: warning: Value stored to 'device' during =
its initialization is never read [clang-analyzer-deadcode.DeadStores]
                           struct device *device =3D &rt->chip->dev->dev;
                                          ^~~~~~   ~~~~~~~~~~~~~~~~~~~
   sound/usb/hiface/pcm.c:232:19: note: Value stored to 'device' during its=
 initialization is never read
                           struct device *device =3D &rt->chip->dev->dev;
                                          ^~~~~~   ~~~~~~~~~~~~~~~~~~~
   sound/usb/hiface/pcm.c:258:17: warning: Value stored to 'device' during =
its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *device =3D &urb->chip->dev->dev;
                          ^~~~~~   ~~~~~~~~~~~~~~~~~~~~
   sound/usb/hiface/pcm.c:258:17: note: Value stored to 'device' during its=
 initialization is never read
           struct device *device =3D &urb->chip->dev->dev;
                          ^~~~~~   ~~~~~~~~~~~~~~~~~~~~
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/rtc/rtc-ds3232.c:380:17: warning: Value stored to 'ds3232' durin=
g its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct ds3232 *ds3232 =3D dev_get_drvdata(dev);
                          ^~~~~~   ~~~~~~~~~~~~~~~~~~~~
   drivers/rtc/rtc-ds3232.c:380:17: note: Value stored to 'ds3232' during i=
ts initialization is never read
           struct ds3232 *ds3232 =3D dev_get_drvdata(dev);
                          ^~~~~~   ~~~~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/rpmsg/qcom_smd.c:444:24: warning: Value stored to 'edge' during =
its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct qcom_smd_edge *edge =3D channel->edge;
                                 ^~~~   ~~~~~~~~~~~~~
   drivers/rpmsg/qcom_smd.c:444:24: note: Value stored to 'edge' during its=
 initialization is never read
           struct qcom_smd_edge *edge =3D channel->edge;
                                 ^~~~   ~~~~~~~~~~~~~
   drivers/rpmsg/qcom_smd.c:809:2: warning: Undefined or garbage value retu=
rned to caller [clang-analyzer-core.uninitialized.UndefReturn]
           return ret;
           ^
   drivers/rpmsg/qcom_smd.c:972:36: note: Left side of '&&' is false
           struct qcom_smd_endpoint *qsept =3D to_smd_endpoint(ept);
                                             ^
   drivers/rpmsg/qcom_smd.c:174:28: note: expanded from macro 'to_smd_endpo=
int'
   #define to_smd_endpoint(e)      container_of(e, struct qcom_smd_endpoint=
, ept)
                                   ^
   include/linux/kernel.h:694:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/rpmsg/qcom_smd.c:972:36: note: Taking false branch
           struct qcom_smd_endpoint *qsept =3D to_smd_endpoint(ept);
                                             ^
   drivers/rpmsg/qcom_smd.c:174:28: note: expanded from macro 'to_smd_endpo=
int'
   #define to_smd_endpoint(e)      container_of(e, struct qcom_smd_endpoint=
, ept)
                                   ^
   include/linux/kernel.h:694:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:306:3: note: expanded from macro '__compi=
letime_assert'
--
   drivers/mmc/host/usdhi6rol0.c:1674:29: note: Loop condition is false.  E=
xiting loop
           struct usdhi6_host *host =3D container_of(d, struct usdhi6_host,=
 timeout_work);
                                      ^
   include/linux/kernel.h:694:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:304:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/mmc/host/usdhi6rol0.c:1676:26: note: Assuming 'mrq' is null
           struct mmc_data *data =3D mrq ? mrq->data : NULL;
                                   ^~~
   drivers/mmc/host/usdhi6rol0.c:1676:26: note: '?' condition is false
   drivers/mmc/host/usdhi6rol0.c:1676:2: note: 'data' initialized to a null=
 pointer value
           struct mmc_data *data =3D mrq ? mrq->data : NULL;
           ^~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/usdhi6rol0.c:1681:4: note: Assuming field 'dma_active' =
is false
                    host->dma_active ? "DMA" : "PIO",
                    ^
   include/linux/dev_printk.h:114:33: note: expanded from macro 'dev_warn'
           _dev_warn(dev, dev_fmt(fmt), ##__VA_ARGS__)
                                          ^~~~~~~~~~~
   drivers/mmc/host/usdhi6rol0.c:1681:4: note: '?' condition is false
                    host->dma_active ? "DMA" : "PIO",
                    ^
   drivers/mmc/host/usdhi6rol0.c:1682:16: note: 'mrq' is null
                    host->wait, mrq ? mrq->cmd->opcode : -1,
                                ^
   include/linux/dev_printk.h:114:33: note: expanded from macro 'dev_warn'
           _dev_warn(dev, dev_fmt(fmt), ##__VA_ARGS__)
                                          ^~~~~~~~~~~
   drivers/mmc/host/usdhi6rol0.c:1682:16: note: '?' condition is false
                    host->wait, mrq ? mrq->cmd->opcode : -1,
                                ^
   drivers/mmc/host/usdhi6rol0.c:1683:4: note: Calling 'usdhi6_read'
                    usdhi6_read(host, USDHI6_SD_INFO1),
                    ^
   include/linux/dev_printk.h:114:33: note: expanded from macro 'dev_warn'
           _dev_warn(dev, dev_fmt(fmt), ##__VA_ARGS__)
                                          ^~~~~~~~~~~
   drivers/mmc/host/usdhi6rol0.c:226:2: note: Taking false branch
           dev_vdbg(mmc_dev(host->mmc), "%s(0x%p + 0x%x) =3D 0x%x\n", __fun=
c__,
           ^
   include/linux/dev_printk.h:229:2: note: expanded from macro 'dev_vdbg'
           if (0)                                                          \
           ^
   drivers/mmc/host/usdhi6rol0.c:228:2: note: Returning without writing to =
'host->wait', which participates in a condition later
           return data;
           ^
   drivers/mmc/host/usdhi6rol0.c:1683:4: note: Returning from 'usdhi6_read'
                    usdhi6_read(host, USDHI6_SD_INFO1),
                    ^
   include/linux/dev_printk.h:114:33: note: expanded from macro 'dev_warn'
           _dev_warn(dev, dev_fmt(fmt), ##__VA_ARGS__)
                                          ^~~~~~~~~~~
   drivers/mmc/host/usdhi6rol0.c:1684:4: note: Calling 'usdhi6_read'
                    usdhi6_read(host, USDHI6_SD_INFO2), host->irq_status);
                    ^
   include/linux/dev_printk.h:114:33: note: expanded from macro 'dev_warn'
           _dev_warn(dev, dev_fmt(fmt), ##__VA_ARGS__)
                                          ^~~~~~~~~~~
   drivers/mmc/host/usdhi6rol0.c:226:2: note: Taking false branch
           dev_vdbg(mmc_dev(host->mmc), "%s(0x%p + 0x%x) =3D 0x%x\n", __fun=
c__,
           ^
   include/linux/dev_printk.h:229:2: note: expanded from macro 'dev_vdbg'
           if (0)                                                          \
           ^
   drivers/mmc/host/usdhi6rol0.c:228:2: note: Returning without writing to =
'host->wait', which participates in a condition later
           return data;
           ^
   drivers/mmc/host/usdhi6rol0.c:1684:4: note: Returning from 'usdhi6_read'
                    usdhi6_read(host, USDHI6_SD_INFO2), host->irq_status);
                    ^
   include/linux/dev_printk.h:114:33: note: expanded from macro 'dev_warn'
           _dev_warn(dev, dev_fmt(fmt), ##__VA_ARGS__)
                                          ^~~~~~~~~~~
   drivers/mmc/host/usdhi6rol0.c:1686:12: note: Field 'dma_active' is false
           if (host->dma_active) {
                     ^
   drivers/mmc/host/usdhi6rol0.c:1686:2: note: Taking false branch
           if (host->dma_active) {
           ^
   drivers/mmc/host/usdhi6rol0.c:1691:2: note: Control jumps to 'case USDHI=
6_WAIT_FOR_DATA_END:'  at line 1717
           switch (host->wait) {
           ^
   drivers/mmc/host/usdhi6rol0.c:1719:15: note: Access to field 'error' res=
ults in a dereference of a null pointer (loaded from variable 'data')
                   data->error =3D -ETIMEDOUT;
                   ~~~~        ^
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
>> drivers/staging/media/meson/vdec/codec_vp9.c:1422:2: warning: Use of mem=
ory after it is freed [clang-analyzer-unix.Malloc]
           list_for_each_entry_safe(tmp, n, &vp9->ref_frames_list, list) {
           ^
   include/linux/list.h:716:7: note: expanded from macro 'list_for_each_ent=
ry_safe'
                   n =3D list_next_entry(pos, member);                     =
  \
                       ^
   include/linux/list.h:555:2: note: expanded from macro 'list_next_entry'
           list_entry((pos)->member.next, typeof(*(pos)), member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:693:25: note: expanded from macro 'container_of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
                                  ^
   drivers/staging/media/meson/vdec/codec_vp9.c:2088:6: note: Assuming 'vp9=
' is non-null
           if (!vp9)
               ^~~~
   drivers/staging/media/meson/vdec/codec_vp9.c:2088:2: note: Taking false =
branch
           if (!vp9)
           ^
   drivers/staging/media/meson/vdec/codec_vp9.c:2092:6: note: Assuming 'dec=
_status' is equal to VP9_HEAD_PARSER_DONE
           if (dec_status !=3D VP9_HEAD_PARSER_DONE) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/meson/vdec/codec_vp9.c:2092:2: note: Taking false =
branch
           if (dec_status !=3D VP9_HEAD_PARSER_DONE) {
           ^
   drivers/staging/media/meson/vdec/codec_vp9.c:2099:2: note: Taking false =
branch
           pr_debug("ISR: %08X;%08X\n", dec_status, prob_status);
           ^
   include/linux/printk.h:430:2: note: expanded from macro 'pr_debug'
           no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:139:2: note: expanded from macro 'no_printk'
           if (0)                                          \
           ^
   drivers/staging/media/meson/vdec/codec_vp9.c:2102:6: note: Assuming the =
condition is false
           if ((prob_status & 0xff) =3D=3D 0xfd && vp9->cur_frame) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/meson/vdec/codec_vp9.c:2102:35: note: Left side of=
 '&&' is false
           if ((prob_status & 0xff) =3D=3D 0xfd && vp9->cur_frame) {
                                            ^
   drivers/staging/media/meson/vdec/codec_vp9.c:2127:2: note: Loop conditio=
n is true.  Entering loop body
           for (i =3D 0; i < REFS_PER_FRAME ; ++i)
           ^
   drivers/staging/media/meson/vdec/codec_vp9.c:2127:2: note: Loop conditio=
n is true.  Entering loop body
   drivers/staging/media/meson/vdec/codec_vp9.c:2127:2: note: Loop conditio=
n is true.  Entering loop body
   drivers/staging/media/meson/vdec/codec_vp9.c:2127:2: note: Loop conditio=
n is false. Execution continues on line 2130
   drivers/staging/media/meson/vdec/codec_vp9.c:2134:2: note: Taking false =
branch
           if (codec_vp9_process_rpm(vp9)) {
           ^
   drivers/staging/media/meson/vdec/codec_vp9.c:2151:2: note: Calling 'code=
c_vp9_process_frame'
           codec_vp9_process_frame(sess);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/meson/vdec/codec_vp9.c:1266:6: note: Assuming fiel=
d 'show_frame' is 0
           if (!param->p.show_frame)
               ^~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/meson/vdec/codec_vp9.c:1266:2: note: Taking true b=
ranch
           if (!param->p.show_frame)
           ^
   drivers/staging/media/meson/vdec/codec_vp9.c:1267:3: note: Calling 'code=
c_vp9_rm_noshow_frame'
                   codec_vp9_rm_noshow_frame(sess);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/meson/vdec/codec_vp9.c:1246:2: note: Left side of =
'&&' is false
           list_for_each_entry(tmp, &vp9->ref_frames_list, list) {
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
   include/linux/kernel.h:694:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/staging/media/meson/vdec/codec_vp9.c:1246:2: note: Taking false =
branch
           list_for_each_entry(tmp, &vp9->ref_frames_list, list) {
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
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:306:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/staging/media/meson/vdec/codec_vp9.c:1246:2: note: Loop conditio=
n is false.  Exiting loop
--
           ^
   sound/firewire/amdtp-stream.c:1108:6: note: Assuming field 'direction' i=
s not equal to AMDTP_IN_STREAM
           if (s->direction =3D=3D AMDTP_IN_STREAM) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/firewire/amdtp-stream.c:1108:2: note: Taking false branch
           if (s->direction =3D=3D AMDTP_IN_STREAM) {
           ^
   sound/firewire/amdtp-stream.c:1113:6: note: Assuming the condition is fa=
lse
           if (s->flags & CIP_NO_HEADER)
               ^~~~~~~~~~~~~~~~~~~~~~~~
   sound/firewire/amdtp-stream.c:1113:2: note: Taking false branch
           if (s->flags & CIP_NO_HEADER)
           ^
   sound/firewire/amdtp-stream.c:1118:17: note: Calling 'kcalloc'
           s->pkt_descs =3D kcalloc(s->queue_size, sizeof(*s->pkt_descs),
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:621:9: note: Calling 'kmalloc_array'
           return kmalloc_array(n, size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:588:2: note: Taking false branch
           if (unlikely(check_mul_overflow(n, size, &bytes)))
           ^
   include/linux/slab.h:590:30: note: Left side of '&&' is false
           if (__builtin_constant_p(n) && __builtin_constant_p(size))
                                       ^
   include/linux/slab.h:592:2: note: Returning pointer, which participates =
in a condition later
           return __kmalloc(bytes, flags);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:621:9: note: Returning from 'kmalloc_array'
           return kmalloc_array(n, size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:621:2: note: Returning pointer, which participates =
in a condition later
           return kmalloc_array(n, size, flags | __GFP_ZERO);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/firewire/amdtp-stream.c:1118:17: note: Returning from 'kcalloc'
           s->pkt_descs =3D kcalloc(s->queue_size, sizeof(*s->pkt_descs),
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/firewire/amdtp-stream.c:1120:6: note: Assuming field 'pkt_descs' i=
s non-null
           if (!s->pkt_descs) {
               ^~~~~~~~~~~~~
   sound/firewire/amdtp-stream.c:1120:2: note: Taking false branch
           if (!s->pkt_descs) {
           ^
   sound/firewire/amdtp-stream.c:1129:10: note: Field 'direction' is not eq=
ual to AMDTP_IN_STREAM
                   if (s->direction =3D=3D AMDTP_IN_STREAM) {
                          ^
   sound/firewire/amdtp-stream.c:1129:3: note: Taking false branch
                   if (s->direction =3D=3D AMDTP_IN_STREAM) {
                   ^
   sound/firewire/amdtp-stream.c:1137:8: note: Assuming 'is_irq_target' is =
true
                           if (is_irq_target) {
                               ^~~~~~~~~~~~~
   sound/firewire/amdtp-stream.c:1137:4: note: Taking true branch
                           if (is_irq_target) {
                           ^
   sound/firewire/amdtp-stream.c:1138:41: note: Division by zero
                                   sched_irq =3D !((s->packet_index + 1) %
                                                 ~~~~~~~~~~~~~~~~~~~~~~^
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
>> drivers/staging/media/meson/vdec/vdec.c:720:17: warning: Value stored to=
 'dev' during its initialization is never read [clang-analyzer-deadcode.Dea=
dStores]
           struct device *dev =3D sess->core->dev;
                          ^~~   ~~~~~~~~~~~~~~~
   drivers/staging/media/meson/vdec/vdec.c:720:17: note: Value stored to 'd=
ev' during its initialization is never read
           struct device *dev =3D sess->core->dev;
                          ^~~   ~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   sound/core/device.c:237:2: warning: Use of memory after it is freed [cla=
ng-analyzer-unix.Malloc]
           list_for_each_entry_safe_reverse(dev, next, &card->devices, list)
           ^
   include/linux/list.h:763:7: note: expanded from macro 'list_for_each_ent=
ry_safe_reverse'
                   n =3D list_prev_entry(pos, member);                     =
  \
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:563:2: note: expanded from macro 'list_prev_entry'
           list_entry((pos)->member.prev, typeof(*(pos)), member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:693:25: note: expanded from macro 'container_of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
                                  ^~~~~
   sound/core/device.c:226:17: note: Assuming 'card' is non-null
           if (snd_BUG_ON(!card))
                          ^
   include/sound/core.h:359:25: note: expanded from macro 'snd_BUG_ON'
           int __ret_warn_on =3D !!(condition); \
                                  ^~~~~~~~~
   sound/core/device.c:226:2: note: Taking false branch
           if (snd_BUG_ON(!card))
           ^
   sound/core/device.c:228:2: note: Left side of '&&' is false
           list_for_each_entry_safe_reverse(dev, next, &card->devices, list=
) {
           ^
   include/linux/list.h:762:13: note: expanded from macro 'list_for_each_en=
try_safe_reverse'
           for (pos =3D list_last_entry(head, typeof(*pos), member),       =
  \
                      ^
   include/linux/list.h:533:2: note: expanded from macro 'list_last_entry'
           list_entry((ptr)->prev, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:694:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   sound/core/device.c:228:2: note: Taking false branch
           list_for_each_entry_safe_reverse(dev, next, &card->devices, list=
) {
           ^
   include/linux/list.h:762:13: note: expanded from macro 'list_for_each_en=
try_safe_reverse'
           for (pos =3D list_last_entry(head, typeof(*pos), member),       =
  \
                      ^
   include/linux/list.h:533:2: note: expanded from macro 'list_last_entry'
           list_entry((ptr)->prev, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:306:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   sound/core/device.c:228:2: note: Loop condition is false.  Exiting loop
           list_for_each_entry_safe_reverse(dev, next, &card->devices, list=
) {
           ^
   include/linux/list.h:762:13: note: expanded from macro 'list_for_each_en=
try_safe_reverse'
           for (pos =3D list_last_entry(head, typeof(*pos), member),       =
  \
                      ^
   include/linux/list.h:533:2: note: expanded from macro 'list_last_entry'
           list_entry((ptr)->prev, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:304:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   sound/core/device.c:228:2: note: Left side of '&&' is false
           list_for_each_entry_safe_reverse(dev, next, &card->devices, list=
) {
           ^
   include/linux/list.h:763:7: note: expanded from macro 'list_for_each_ent=
ry_safe_reverse'
                   n =3D list_prev_entry(pos, member);                     =
  \
                       ^
   include/linux/list.h:563:2: note: expanded from macro 'list_prev_entry'
           list_entry((pos)->member.prev, typeof(*(pos)), member)
           ^
--
               ^~~~~~~~~
   drivers/mmc/host/mxcmmc.c:750:2: note: Taking false branch
           if (host->dma)
           ^
   drivers/mmc/host/mxcmmc.c:753:6: note: Assuming field 'data' is non-null
           if (req->data) {
               ^~~~~~~~~
   drivers/mmc/host/mxcmmc.c:753:2: note: Taking true branch
           if (req->data) {
           ^
   drivers/mmc/host/mxcmmc.c:754:11: note: Calling 'mxcmci_setup_data'
                   error =3D mxcmci_setup_data(host, req->data);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/mxcmmc.c:292:2: note: Calling 'mxcmci_writew'
           mxcmci_writew(host, nob, MMC_REG_NOB);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/mxcmmc.c:212:2: note: Taking false branch
           if (IS_ENABLED(CONFIG_PPC_MPC512x))
           ^
   drivers/mmc/host/mxcmmc.c:215:3: note: Loop condition is false.  Exiting=
 loop
                   writew(val, host->base + reg);
                   ^
   arch/arm/include/asm/io.h:306:25: note: expanded from macro 'writew'
   #define writew(v,c)             ({ __iowmb(); writew_relaxed(v,c); })
                                      ^
   arch/arm/include/asm/io.h:169:20: note: expanded from macro '__iowmb'
   #define __iowmb()               do { } while (0)
                                   ^
   drivers/mmc/host/mxcmmc.c:216:1: note: Returning without writing to 'hos=
t->do_dma', which participates in a condition later
   }
   ^
   drivers/mmc/host/mxcmmc.c:216:1: note: Returning without writing to 'hos=
t->dma'
   drivers/mmc/host/mxcmmc.c:292:2: note: Returning from 'mxcmci_writew'
           mxcmci_writew(host, nob, MMC_REG_NOB);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/mxcmmc.c:293:2: note: Calling 'mxcmci_writew'
           mxcmci_writew(host, blksz, MMC_REG_BLK_LEN);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/mxcmmc.c:212:2: note: Taking false branch
           if (IS_ENABLED(CONFIG_PPC_MPC512x))
           ^
   drivers/mmc/host/mxcmmc.c:215:3: note: Loop condition is false.  Exiting=
 loop
                   writew(val, host->base + reg);
                   ^
   arch/arm/include/asm/io.h:306:25: note: expanded from macro 'writew'
   #define writew(v,c)             ({ __iowmb(); writew_relaxed(v,c); })
                                      ^
   arch/arm/include/asm/io.h:169:20: note: expanded from macro '__iowmb'
   #define __iowmb()               do { } while (0)
                                   ^
   drivers/mmc/host/mxcmmc.c:216:1: note: Returning without writing to 'hos=
t->do_dma', which participates in a condition later
   }
   ^
   drivers/mmc/host/mxcmmc.c:216:1: note: Returning without writing to 'hos=
t->dma'
   drivers/mmc/host/mxcmmc.c:293:2: note: Returning from 'mxcmci_writew'
           mxcmci_writew(host, blksz, MMC_REG_BLK_LEN);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/mxcmmc.c:296:7: note: Calling 'mxcmci_use_dma'
           if (!mxcmci_use_dma(host))
                ^~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/mxcmmc.c:237:2: note: Returning without writing to 'hos=
t->do_dma', which participates in a condition later
           return host->do_dma;
           ^
   drivers/mmc/host/mxcmmc.c:237:2: note: Returning without writing to 'hos=
t->dma'
   drivers/mmc/host/mxcmmc.c:237:2: note: Returning value, which participat=
es in a condition later
           return host->do_dma;
           ^~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/mxcmmc.c:296:7: note: Returning from 'mxcmci_use_dma'
           if (!mxcmci_use_dma(host))
                ^~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/mxcmmc.c:296:6: note: Assuming the condition is false
           if (!mxcmci_use_dma(host))
               ^~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/mxcmmc.c:296:2: note: Taking false branch
           if (!mxcmci_use_dma(host))
           ^
   drivers/mmc/host/mxcmmc.c:299:42: note: Assuming 'i' is >=3D field 'sg_l=
en'
           for_each_sg(data->sg, sg, data->sg_len, i) {
                                                   ^
   include/linux/scatterlist.h:146:31: note: expanded from macro 'for_each_=
sg'
           for (__i =3D 0, sg =3D (sglist); __i < (nr); __i++, sg =3D sg_ne=
xt(sg))
                                        ^~~~~~~~~~
   drivers/mmc/host/mxcmmc.c:299:2: note: Loop condition is false. Executio=
n continues on line 306
           for_each_sg(data->sg, sg, data->sg_len, i) {
           ^
   include/linux/scatterlist.h:146:2: note: expanded from macro 'for_each_s=
g'
           for (__i =3D 0, sg =3D (sglist); __i < (nr); __i++, sg =3D sg_ne=
xt(sg))
           ^
   drivers/mmc/host/mxcmmc.c:306:6: note: Assuming the condition is true
           if (data->flags & MMC_DATA_READ) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/mxcmmc.c:306:2: note: Taking true branch
           if (data->flags & MMC_DATA_READ) {
           ^
   drivers/mmc/host/mxcmmc.c:316:21: note: Access to field 'device' results=
 in a dereference of a null pointer (loaded from field 'dma')
           nents =3D dma_map_sg(host->dma->device->dev, data->sg,
                              ^
   include/linux/dma-mapping.h:385:49: note: expanded from macro 'dma_map_s=
g'
   #define dma_map_sg(d, s, n, r) dma_map_sg_attrs(d, s, n, r, 0)
                                                   ^
>> drivers/mmc/host/mxcmmc.c:361:6: warning: Value stored to 'int_cntr' dur=
ing its initialization is never read [clang-analyzer-deadcode.DeadStores]
           u32 int_cntr =3D host->default_irq_mask;
               ^~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/mxcmmc.c:361:6: note: Value stored to 'int_cntr' during=
 its initialization is never read
           u32 int_cntr =3D host->default_irq_mask;
               ^~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   sound/usb/mixer_quirks.c:309:3: warning: Value stored to 'err' is never =
read [clang-analyzer-deadcode.DeadStores]
                   err =3D snd_usb_ctl_msg(chip->dev,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/usb/mixer_quirks.c:309:3: note: Value stored to 'err' is never read
                   err =3D snd_usb_ctl_msg(chip->dev,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~
   5 warnings generated.
   sound/usb/mixer_scarlett_gen2.c:895:4: warning: Value stored to 'j' is n=
ever read [clang-analyzer-deadcode.DeadStores]
                           j +=3D ports[port_type].num[SCARLETT2_PORT_OUT] -
                           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/usb/mixer_scarlett_gen2.c:895:4: note: Value stored to 'j' is neve=
r read
                           j +=3D ports[port_type].num[SCARLETT2_PORT_OUT] -
                           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/usb/mixer_scarlett_gen2.c:1424:9: warning: 5th function call argum=
ent is an uninitialized value [clang-analyzer-core.CallAndMessage]
                   err =3D scarlett2_add_new_ctl(mixer, &scarlett2_button_c=
tl,
                         ^
   sound/usb/mixer_scarlett_gen2.c:2007:6: note: Assuming field 'protocol' =
is not equal to 0
           if (!mixer->protocol)
               ^~~~~~~~~~~~~~~~
   sound/usb/mixer_scarlett_gen2.c:2007:2: note: Taking false branch
           if (!mixer->protocol)
           ^
   sound/usb/mixer_scarlett_gen2.c:2010:2: note: Control jumps to 'case 305=
496577:'  at line 2017
           switch (mixer->chip->usb_id) {
           ^
   sound/usb/mixer_scarlett_gen2.c:2019:3: note:  Execution continues on li=
ne 2024
                   break;
                   ^
   sound/usb/mixer_scarlett_gen2.c:2024:6: note: Assuming the condition is =
false
           if (!(mixer->chip->setup & SCARLETT2_ENABLE)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/usb/mixer_scarlett_gen2.c:2024:2: note: Taking false branch
           if (!(mixer->chip->setup & SCARLETT2_ENABLE)) {
           ^
   sound/usb/mixer_scarlett_gen2.c:2034:6: note: 'err' is >=3D 0
           if (err < 0)
               ^~~
   sound/usb/mixer_scarlett_gen2.c:2034:2: note: Taking false branch
           if (err < 0)
           ^
   sound/usb/mixer_scarlett_gen2.c:2039:6: note: Assuming 'err' is >=3D 0
           if (err < 0)
               ^~~~~~~
   sound/usb/mixer_scarlett_gen2.c:2039:2: note: Taking false branch
           if (err < 0)
           ^
   sound/usb/mixer_scarlett_gen2.c:2043:8: note: Calling 'scarlett2_add_lin=
e_out_ctls'
           err =3D scarlett2_add_line_out_ctls(mixer);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/usb/mixer_scarlett_gen2.c:1377:6: note: Assuming field 'line_out_h=
w_vol' is 0
           if (info->line_out_hw_vol) {
               ^~~~~~~~~~~~~~~~~~~~~
   sound/usb/mixer_scarlett_gen2.c:1377:2: note: Taking false branch
           if (info->line_out_hw_vol) {
           ^
   sound/usb/mixer_scarlett_gen2.c:1387:14: note: Assuming 'i' is >=3D 'num=
_line_out'
           for (i =3D 0; i < num_line_out; i++) {
                       ^~~~~~~~~~~~~~~~
   sound/usb/mixer_scarlett_gen2.c:1387:2: note: Loop condition is false. E=
xecution continues on line 1423
           for (i =3D 0; i < num_line_out; i++) {
           ^
   sound/usb/mixer_scarlett_gen2.c:1423:14: note: Assuming 'i' is < field '=
button_count'
           for (i =3D 0; i < private->info->button_count; i++) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/usb/mixer_scarlett_gen2.c:1423:2: note: Loop condition is true.  E=
ntering loop body
           for (i =3D 0; i < private->info->button_count; i++) {
           ^
   sound/usb/mixer_scarlett_gen2.c:1427:7: note: 'err' is >=3D 0
                   if (err < 0)
                       ^~~
   sound/usb/mixer_scarlett_gen2.c:1427:3: note: Taking false branch
                   if (err < 0)
                   ^
   sound/usb/mixer_scarlett_gen2.c:1423:14: note: Assuming 'i' is < field '=
button_count'
           for (i =3D 0; i < private->info->button_count; i++) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/usb/mixer_scarlett_gen2.c:1423:2: note: Loop condition is true.  E=
ntering loop body
           for (i =3D 0; i < private->info->button_count; i++) {
           ^
   sound/usb/mixer_scarlett_gen2.c:1427:7: note: 'err' is >=3D 0
                   if (err < 0)
                       ^~~
   sound/usb/mixer_scarlett_gen2.c:1427:3: note: Taking false branch
                   if (err < 0)
                   ^
   sound/usb/mixer_scarlett_gen2.c:1423:47: note: The value 2 is assigned t=
o 'i'
           for (i =3D 0; i < private->info->button_count; i++) {
                                                        ^~~
   sound/usb/mixer_scarlett_gen2.c:1423:14: note: Assuming 'i' is < field '=
button_count'
           for (i =3D 0; i < private->info->button_count; i++) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/usb/mixer_scarlett_gen2.c:1423:2: note: Loop condition is true.  E=
ntering loop body
--
   drivers/usb/isp1760/isp1760-hcd.c:1619:7: note: Assuming field 'status' =
is >=3D QTD_XFER_STARTED
                   if (qtd->status >=3D QTD_XFER_STARTED)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/isp1760/isp1760-hcd.c:1619:3: note: Taking true branch
                   if (qtd->status >=3D QTD_XFER_STARTED)
                   ^
   drivers/usb/isp1760/isp1760-hcd.c:1621:7: note: Calling 'last_qtd_of_urb'
                   if (last_qtd_of_urb(qtd, qh) &&
                       ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/isp1760/isp1760-hcd.c:517:6: note: Assuming the condition is=
 true
           if (list_is_last(&qtd->qtd_list, &qh->qtd_list))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/isp1760/isp1760-hcd.c:517:2: note: Taking true branch
           if (list_is_last(&qtd->qtd_list, &qh->qtd_list))
           ^
   drivers/usb/isp1760/isp1760-hcd.c:518:3: note: Returning without writing=
 to 'qh->slot'
                   return 1;
                   ^
   drivers/usb/isp1760/isp1760-hcd.c:1621:7: note: Returning from 'last_qtd=
_of_urb'
                   if (last_qtd_of_urb(qtd, qh) &&
                       ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/isp1760/isp1760-hcd.c:1621:7: note: Left side of '&&' is true
   drivers/usb/isp1760/isp1760-hcd.c:1622:7: note: Assuming field 'status' =
is < QTD_XFER_COMPLETE
                                           (qtd->status >=3D QTD_XFER_COMPL=
ETE))
                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/isp1760/isp1760-hcd.c:1621:3: note: Taking false branch
                   if (last_qtd_of_urb(qtd, qh) &&
                   ^
   drivers/usb/isp1760/isp1760-hcd.c:1625:12: note: Field 'status' is equal=
 to QTD_XFER_STARTED
                   if (qtd->status =3D=3D QTD_XFER_STARTED)
                            ^
   drivers/usb/isp1760/isp1760-hcd.c:1625:3: note: Taking true branch
                   if (qtd->status =3D=3D QTD_XFER_STARTED)
                   ^
   drivers/usb/isp1760/isp1760-hcd.c:1626:4: note: Calling 'kill_transfer'
                           kill_transfer(hcd, urb, qh);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/isp1760/isp1760-hcd.c:1582:10: note: Assuming the condition =
is true
           WARN_ON(qh->slot =3D=3D -1);
                   ^
   include/asm-generic/bug.h:188:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   drivers/usb/isp1760/isp1760-hcd.c:1586:6: note: Assuming the condition i=
s false
           if (usb_pipecontrol(urb->pipe) || usb_pipebulk(urb->pipe)) {
               ^
   include/linux/usb.h:1942:32: note: expanded from macro 'usb_pipecontrol'
   #define usb_pipecontrol(pipe)   (usb_pipetype((pipe)) =3D=3D PIPE_CONTRO=
L)
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/usb.h:1939:28: note: expanded from macro 'usb_pipetype'
   #define usb_pipetype(pipe)      (((pipe) >> 30) & 3)
                                   ^
   drivers/usb/isp1760/isp1760-hcd.c:1586:6: note: Left side of '||' is fal=
se
           if (usb_pipecontrol(urb->pipe) || usb_pipebulk(urb->pipe)) {
               ^
   include/linux/usb.h:1942:31: note: expanded from macro 'usb_pipecontrol'
   #define usb_pipecontrol(pipe)   (usb_pipetype((pipe)) =3D=3D PIPE_CONTRO=
L)
                                   ^
   drivers/usb/isp1760/isp1760-hcd.c:1586:36: note: Assuming the condition =
is false
           if (usb_pipecontrol(urb->pipe) || usb_pipebulk(urb->pipe)) {
                                             ^
   include/linux/usb.h:1943:29: note: expanded from macro 'usb_pipebulk'
   #define usb_pipebulk(pipe)      (usb_pipetype((pipe)) =3D=3D PIPE_BULK)
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/usb.h:1939:28: note: expanded from macro 'usb_pipetype'
   #define usb_pipetype(pipe)      (((pipe) >> 30) & 3)
                                   ^
   drivers/usb/isp1760/isp1760-hcd.c:1586:2: note: Taking false branch
           if (usb_pipecontrol(urb->pipe) || usb_pipebulk(urb->pipe)) {
           ^
   drivers/usb/isp1760/isp1760-hcd.c:1594:18: note: The result of the left =
shift is undefined because the right operand is negative
                   skip_map |=3D (1 << qh->slot);
                                  ^  ~~~~~~~~
   drivers/usb/isp1760/isp1760-hcd.c:2096:42: warning: Although the value s=
tored to 'temp' is used in the enclosing expression, the value is never act=
ually read from 'temp' [clang-analyzer-deadcode.DeadStores]
           reg_write32(hcd->regs, HC_HW_MODE_CTRL, temp &=3D ~HW_GLOBAL_INT=
R_EN);
                                                   ^       ~~~~~~~~~~~~~~~~=
~~
   drivers/usb/isp1760/isp1760-hcd.c:2096:42: note: Although the value stor=
ed to 'temp' is used in the enclosing expression, the value is never actual=
ly read from 'temp'
           reg_write32(hcd->regs, HC_HW_MODE_CTRL, temp &=3D ~HW_GLOBAL_INT=
R_EN);
                                                   ^       ~~~~~~~~~~~~~~~~=
~~
   drivers/usb/isp1760/isp1760-hcd.c:2108:42: warning: Although the value s=
tored to 'temp' is used in the enclosing expression, the value is never act=
ually read from 'temp' [clang-analyzer-deadcode.DeadStores]
           reg_write32(hcd->regs, HC_HW_MODE_CTRL, temp &=3D ~HW_GLOBAL_INT=
R_EN);
                                                   ^       ~~~~~~~~~~~~~~~~=
~~
   drivers/usb/isp1760/isp1760-hcd.c:2108:42: note: Although the value stor=
ed to 'temp' is used in the enclosing expression, the value is never actual=
ly read from 'temp'
           reg_write32(hcd->regs, HC_HW_MODE_CTRL, temp &=3D ~HW_GLOBAL_INT=
R_EN);
                                                   ^       ~~~~~~~~~~~~~~~~=
~~
   Suppressed 1 warnings (1 in non-user code).
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
>> sound/usb/quirks.c:591:3: warning: Value stored to 'config' is never rea=
d [clang-analyzer-deadcode.DeadStores]
                   config =3D dev->actconfig;
                   ^        ~~~~~~~~~~~~~~
   sound/usb/quirks.c:591:3: note: Value stored to 'config' is never read
                   config =3D dev->actconfig;
                   ^        ~~~~~~~~~~~~~~
   sound/usb/quirks.c:961:2: warning: Value stored to 'config' is never rea=
d [clang-analyzer-deadcode.DeadStores]
           config =3D dev->actconfig;
           ^        ~~~~~~~~~~~~~~
   sound/usb/quirks.c:961:2: note: Value stored to 'config' is never read
           config =3D dev->actconfig;
           ^        ~~~~~~~~~~~~~~
   4 warnings generated.
   sound/usb/midi.c:1296:4: warning: Value stored to 'err' is never read [c=
lang-analyzer-deadcode.DeadStores]
                           err =3D -ENOMEM;
                           ^     ~~~~~~~
   sound/usb/midi.c:1296:4: note: Value stored to 'err' is never read
                           err =3D -ENOMEM;
                           ^     ~~~~~~~
   sound/usb/midi.c:1309:4: warning: Value stored to 'err' is never read [c=
lang-analyzer-deadcode.DeadStores]
                           err =3D -ENOMEM;
                           ^     ~~~~~~~
   sound/usb/midi.c:1309:4: note: Value stored to 'err' is never read
                           err =3D -ENOMEM;
                           ^     ~~~~~~~
   sound/usb/midi.c:2268:2: warning: Call to function 'strcpy' is insecure =
as it does not provide bounding of the memory buffer. Replace unbounded cop=
y functions with analogous functions that support length arguments such as =
'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(rmidi->name, umidi->card->shortname);
           ^~~~~~
   sound/usb/midi.c:2268:2: note: Call to function 'strcpy' is insecure as =
it does not provide bounding of the memory buffer. Replace unbounded copy f=
unctions with analogous functions that support length arguments such as 'st=
rlcpy'. CWE-119
           strcpy(rmidi->name, umidi->card->shortname);
           ^~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   include/linux/list.h:135:13: warning: Use of memory after it is freed [c=
lang-analyzer-unix.Malloc]
           __list_del(entry->prev, entry->next);
                      ^
   drivers/dma/ti/omap-dma.c:1846:6: note: Assuming field 'may_lose_context=
' is 0
           if (od->cfg->may_lose_context)
               ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/dma/ti/omap-dma.c:1846:2: note: Taking false branch
           if (od->cfg->may_lose_context)
           ^
   drivers/dma/ti/omap-dma.c:1849:6: note: Assuming field 'of_node' is null
           if (pdev->dev.of_node)
               ^~~~~~~~~~~~~~~~~
   drivers/dma/ti/omap-dma.c:1849:2: note: Taking false branch
           if (pdev->dev.of_node)
           ^
   drivers/dma/ti/omap-dma.c:1857:6: note: Assuming field 'legacy' is true
           if (!od->legacy) {
               ^~~~~~~~~~~
   drivers/dma/ti/omap-dma.c:1857:2: note: Taking false branch
           if (!od->legacy) {
           ^
   drivers/dma/ti/omap-dma.c:1862:6: note: Assuming field 'll123_supported'=
 is false
           if (od->ll123_supported)
               ^~~~~~~~~~~~~~~~~~~
   drivers/dma/ti/omap-dma.c:1862:2: note: Taking false branch
           if (od->ll123_supported)
           ^
   drivers/dma/ti/omap-dma.c:1865:2: note: Calling 'omap_dma_free'
           omap_dma_free(od);
           ^~~~~~~~~~~~~~~~~
   drivers/dma/ti/omap-dma.c:1515:2: note: Loop condition is true.  Enterin=
g loop body
           while (!list_empty(&od->ddev.channels)) {
           ^
   drivers/dma/ti/omap-dma.c:1516:25: note: Left side of '&&' is false
                   struct omap_chan *c =3D list_first_entry(&od->ddev.chann=
els,
                                         ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:694:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/dma/ti/omap-dma.c:1516:25: note: Taking false branch
                   struct omap_chan *c =3D list_first_entry(&od->ddev.chann=
els,
                                         ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:694:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
--
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/staging/vc04_services/bcm2835-camera/controls.c:888:3: warning: =
Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
                   ret =3D -EINVAL;
                   ^     ~~~~~~~
   drivers/staging/vc04_services/bcm2835-camera/controls.c:888:3: note: Val=
ue stored to 'ret' is never read
                   ret =3D -EINVAL;
                   ^     ~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c:1748:3: warning: V=
alue stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
                   ret =3D disable_component(instance, component);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c:1748:3: note: Valu=
e stored to 'ret' is never read
                   ret =3D disable_component(instance, component);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   sound/firewire/dice/dice.c:61:40: warning: The result of the left shift =
is undefined because the left operand is negative [clang-analyzer-core.Unde=
finedBinaryOperatorResult]
           if (device->config_rom[3] !=3D ((vendor << 8) | category) ||
                                                 ^
   sound/firewire/dice/dice.c:201:6: note: Assuming field 'driver_data' is 0
           if (!entry->driver_data && entry->vendor_id !=3D OUI_SSL) {
               ^~~~~~~~~~~~~~~~~~~
   sound/firewire/dice/dice.c:201:6: note: Left side of '&&' is true
   sound/firewire/dice/dice.c:201:29: note: Assuming field 'vendor_id' is n=
ot equal to OUI_SSL
           if (!entry->driver_data && entry->vendor_id !=3D OUI_SSL) {
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/firewire/dice/dice.c:201:2: note: Taking true branch
           if (!entry->driver_data && entry->vendor_id !=3D OUI_SSL) {
           ^
   sound/firewire/dice/dice.c:202:9: note: Calling 'check_dice_category'
                   err =3D check_dice_category(unit);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~
   sound/firewire/dice/dice.c:34:16: note: 'vendor' initialized to -1
           int key, val, vendor =3D -1, model =3D -1;
                         ^~~~~~
   sound/firewire/dice/dice.c:44:2: note: Loop condition is false. Executio=
n continues on line 55
           while (fw_csr_iterator_next(&it, &key, &val)) {
           ^
   sound/firewire/dice/dice.c:55:6: note: 'vendor' is not equal to OUI_WEISS
           if (vendor =3D=3D OUI_WEISS)
               ^~~~~~
   sound/firewire/dice/dice.c:55:2: note: Taking false branch
           if (vendor =3D=3D OUI_WEISS)
           ^
   sound/firewire/dice/dice.c:57:11: note: 'vendor' is not equal to OUI_LOUD
           else if (vendor =3D=3D OUI_LOUD)
                    ^~~~~~
   sound/firewire/dice/dice.c:57:7: note: Taking false branch
           else if (vendor =3D=3D OUI_LOUD)
                ^
   sound/firewire/dice/dice.c:61:40: note: The result of the left shift is =
undefined because the left operand is negative
           if (device->config_rom[3] !=3D ((vendor << 8) | category) ||
                                          ~~~~~~ ^
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/staging/media/meson/vdec/vdec_helpers.c:186:6: warning: Value st=
ored to 'reg_cur' during its initialization is never read [clang-analyzer-d=
eadcode.DeadStores]
           u32 reg_cur =3D reg_base[0];
               ^~~~~~~   ~~~~~~~~~~~
   drivers/staging/media/meson/vdec/vdec_helpers.c:186:6: note: Value store=
d to 'reg_cur' during its initialization is never read
           u32 reg_cur =3D reg_base[0];
               ^~~~~~~   ~~~~~~~~~~~
>> drivers/staging/media/meson/vdec/vdec_helpers.c:274:17: warning: Value s=
tored to 'dev' during its initialization is never read [clang-analyzer-dead=
code.DeadStores]
           struct device *dev =3D sess->core->dev_dec;
                          ^~~   ~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/meson/vdec/vdec_helpers.c:274:17: note: Value stor=
ed to 'dev' during its initialization is never read
           struct device *dev =3D sess->core->dev_dec;
                          ^~~   ~~~~~~~~~~~~~~~~~~~
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/siox/siox-core.c:240:4: warning: Value stored to 'status' is nev=
er read [clang-analyzer-deadcode.DeadStores]
                           status &=3D ~SIOX_STATUS_WDG;
                           ^         ~~~~~~~~~~~~~~~~
   drivers/siox/siox-core.c:240:4: note: Value stored to 'status' is never =
read
                           status &=3D ~SIOX_STATUS_WDG;
                           ^         ~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   sound/firewire/oxfw/oxfw-hwdep.c:182:2: warning: Call to function 'strcp=
y' is insecure as it does not provide bounding of the memory buffer. Replac=
e unbounded copy functions with analogous functions that support length arg=
uments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strc=
py]
           strcpy(hwdep->name, oxfw->card->driver);
           ^~~~~~
   sound/firewire/oxfw/oxfw-hwdep.c:182:2: note: Call to function 'strcpy' =
is insecure as it does not provide bounding of the memory buffer. Replace u=
nbounded copy functions with analogous functions that support length argume=
nts such as 'strlcpy'. CWE-119
           strcpy(hwdep->name, oxfw->card->driver);
           ^~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   sound/usb/line6/pcm.c:489:2: warning: Call to function 'strcpy' is insec=
ure as it does not provide bounding of the memory buffer. Replace unbounded=
 copy functions with analogous functions that support length arguments such=
 as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(pcm->name, line6->properties->name);
           ^~~~~~
   sound/usb/line6/pcm.c:489:2: note: Call to function 'strcpy' is insecure=
 as it does not provide bounding of the memory buffer. Replace unbounded co=
py functions with analogous functions that support length arguments such as=
 'strlcpy'. CWE-119
           strcpy(pcm->name, line6->properties->name);
           ^~~~~~
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   sound/usb/line6/toneport.c:202:2: warning: Call to function 'strcpy' is =
insecure as it does not provide bounding of the memory buffer. Replace unbo=
unded copy functions with analogous functions that support length arguments=
 such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(uinfo->value.enumerated.name,
           ^~~~~~
   sound/usb/line6/toneport.c:202:2: note: Call to function 'strcpy' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcpy'. CWE-119
           strcpy(uinfo->value.enumerated.name,
           ^~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   sound/firewire/oxfw/oxfw.c:104:2: warning: Call to function 'strcpy' is =
insecure as it does not provide bounding of the memory buffer. Replace unbo=
unded copy functions with analogous functions that support length arguments=
 such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(oxfw->card->driver, d);
           ^~~~~~
   sound/firewire/oxfw/oxfw.c:104:2: note: Call to function 'strcpy' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcpy'. CWE-119
           strcpy(oxfw->card->driver, d);
           ^~~~~~
   sound/firewire/oxfw/oxfw.c:105:2: warning: Call to function 'strcpy' is =
insecure as it does not provide bounding of the memory buffer. Replace unbo=
unded copy functions with analogous functions that support length arguments=
 such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(oxfw->card->mixername, m);
           ^~~~~~
   sound/firewire/oxfw/oxfw.c:105:2: note: Call to function 'strcpy' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcpy'. CWE-119
           strcpy(oxfw->card->mixername, m);
           ^~~~~~
   sound/firewire/oxfw/oxfw.c:106:2: warning: Call to function 'strcpy' is =
insecure as it does not provide bounding of the memory buffer. Replace unbo=
unded copy functions with analogous functions that support length arguments=
 such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(oxfw->card->shortname, m);
           ^~~~~~
   sound/firewire/oxfw/oxfw.c:106:2: note: Call to function 'strcpy' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcpy'. CWE-119
           strcpy(oxfw->card->shortname, m);
           ^~~~~~
--
   7 warnings generated.
   drivers/media/tuners/mt20xx.c:253:2: warning: Value stored to 'ret' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           ret=3Dtuner_i2c_xfer_send(&priv->i2c_props,buf,1);
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/tuners/mt20xx.c:253:2: note: Value stored to 'ret' is neve=
r read
           ret=3Dtuner_i2c_xfer_send(&priv->i2c_props,buf,1);
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/tuners/mt20xx.c:263:2: warning: Value stored to 'ret' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           ret=3Dtuner_i2c_xfer_send(&priv->i2c_props,buf,4);
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/tuners/mt20xx.c:263:2: note: Value stored to 'ret' is neve=
r read
           ret=3Dtuner_i2c_xfer_send(&priv->i2c_props,buf,4);
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/tuners/mt20xx.c:265:2: warning: Value stored to 'ret' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           ret=3Dtuner_i2c_xfer_send(&priv->i2c_props,buf+5,4);
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/tuners/mt20xx.c:265:2: note: Value stored to 'ret' is neve=
r read
           ret=3Dtuner_i2c_xfer_send(&priv->i2c_props,buf+5,4);
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/tuners/mt20xx.c:383:2: warning: Value stored to 'ret' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           ret=3Dtuner_i2c_xfer_send(&priv->i2c_props,buf+1,4);
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/tuners/mt20xx.c:383:2: note: Value stored to 'ret' is neve=
r read
           ret=3Dtuner_i2c_xfer_send(&priv->i2c_props,buf+1,4);
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/tuners/mt20xx.c:391:2: warning: Value stored to 'ret' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           ret=3Dtuner_i2c_xfer_send(&priv->i2c_props,buf+5,6);
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/tuners/mt20xx.c:391:2: note: Value stored to 'ret' is neve=
r read
           ret=3Dtuner_i2c_xfer_send(&priv->i2c_props,buf+5,6);
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/tuners/mt20xx.c:395:2: warning: Value stored to 'ret' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           ret=3Dtuner_i2c_xfer_send(&priv->i2c_props,buf+12,2);
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/tuners/mt20xx.c:395:2: note: Value stored to 'ret' is neve=
r read
           ret=3Dtuner_i2c_xfer_send(&priv->i2c_props,buf+12,2);
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   sound/core/info.c:115:3: warning: Value stored to 'offset' is never read=
 [clang-analyzer-deadcode.DeadStores]
                   offset =3D entry->c.ops->llseek(entry,
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/core/info.c:115:3: note: Value stored to 'offset' is never read
                   offset =3D entry->c.ops->llseek(entry,
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
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
   3 warnings generated.
   drivers/regulator/mc13xxx-regulator-core.c:115:6: warning: Value stored =
to 'id' during its initialization is never read [clang-analyzer-deadcode.De=
adStores]
           int id =3D rdev_get_id(rdev);
               ^~   ~~~~~~~~~~~~~~~~~
   drivers/regulator/mc13xxx-regulator-core.c:115:6: note: Value stored to =
'id' during its initialization is never read
           int id =3D rdev_get_id(rdev);
               ^~   ~~~~~~~~~~~~~~~~~
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
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
>> drivers/staging/media/tegra-video/vi.c:1685:19: warning: Value stored to=
 'vi' during its initialization is never read [clang-analyzer-deadcode.Dead=
Stores]
           struct tegra_vi *vi =3D host1x_client_to_vi(client);
                            ^~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/tegra-video/vi.c:1685:19: note: Value stored to 'v=
i' during its initialization is never read
           struct tegra_vi *vi =3D host1x_client_to_vi(client);
                            ^~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   drivers/media/mc/mc-request.c:190:23: warning: Value stored to 'mdev' du=
ring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct media_device *mdev =3D req->mdev;
                                ^~~~   ~~~~~~~~~
   drivers/media/mc/mc-request.c:190:23: note: Value stored to 'mdev' durin=
g its initialization is never read
           struct media_device *mdev =3D req->mdev;
                                ^~~~   ~~~~~~~~~
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/media/v4l2-core/v4l2-dev.c:1050:2: warning: Value stored to 'ret=
' is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D video_register_media_controller(vdev);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-dev.c:1050:2: note: Value stored to 'ret' i=
s never read
           ret =3D video_register_media_controller(vdev);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/media/v4l2-core/v4l2-ioctl.c:3331:3: warning: Value stored to 'e=
rr' is never read [clang-analyzer-deadcode.DeadStores]
                   err =3D -EFAULT;
                   ^     ~~~~~~~
   drivers/media/v4l2-core/v4l2-ioctl.c:3331:3: note: Value stored to 'err'=
 is never read
                   err =3D -EFAULT;
                   ^     ~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/staging/media/imx/imx-media-csc-scaler.c:202:3: warning: Value s=
tored to 'field' is never read [clang-analyzer-deadcode.DeadStores]
                   field =3D V4L2_FIELD_NONE;
                   ^       ~~~~~~~~~~~~~~~
   drivers/staging/media/imx/imx-media-csc-scaler.c:202:3: note: Value stor=
ed to 'field' is never read
                   field =3D V4L2_FIELD_NONE;
                   ^       ~~~~~~~~~~~~~~~
>> drivers/staging/media/imx/imx-media-csc-scaler.c:801:30: warning: Value =
stored to 'priv' during its initialization is never read [clang-analyzer-de=
adcode.DeadStores]
           struct ipu_csc_scaler_priv *priv =3D video_drvdata(file);
                                       ^~~~   ~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/imx/imx-media-csc-scaler.c:801:30: note: Value sto=
red to 'priv' during its initialization is never read
           struct ipu_csc_scaler_priv *priv =3D video_drvdata(file);
                                       ^~~~   ~~~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
>> drivers/staging/media/imx/imx-media-dev-common.c:27:24: warning: Value s=
tored to 'imxmd' during its initialization is never read [clang-analyzer-de=
adcode.DeadStores]
           struct imx_media_dev *imxmd =3D notifier2dev(notifier);
                                 ^~~~~   ~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/imx/imx-media-dev-common.c:27:24: note: Value stor=
ed to 'imxmd' during its initialization is never read
           struct imx_media_dev *imxmd =3D notifier2dev(notifier);
                                 ^~~~~   ~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   include/linux/dcache.h:523:9: warning: Access to field 'd_inode' results=
 in a dereference of a null pointer (loaded from variable 'dentry') [clang-=
analyzer-core.NullDereference]
           return dentry->d_inode;
                  ^
   fs/overlayfs/inode.c:962:28: note: Assuming 'upperdentry' is null
           struct inode *realinode =3D upperdentry ? d_inode(upperdentry) :=
 NULL;
                                     ^~~~~~~~~~~
   fs/overlayfs/inode.c:962:28: note: '?' condition is false
   fs/overlayfs/inode.c:964:31: note: Assuming 'lowerpath' is null
           struct dentry *lowerdentry =3D lowerpath ? lowerpath->dentry : N=
ULL;
                                        ^~~~~~~~~
   fs/overlayfs/inode.c:964:31: note: '?' condition is false
   fs/overlayfs/inode.c:964:2: note: 'lowerdentry' initialized to a null po=
inter value
           struct dentry *lowerdentry =3D lowerpath ? lowerpath->dentry : N=
ULL;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/overlayfs/inode.c:967:13: note: 'bylower' is false
           int fsid =3D bylower ? lowerpath->layer->fsid : 0;
                      ^~~~~~~
   fs/overlayfs/inode.c:967:13: note: '?' condition is false
   fs/overlayfs/inode.c:970:12: note: Assuming field 'newinode' is null
           int err =3D oip->newinode ? -EEXIST : -ENOMEM;
                     ^~~~~~~~~~~~~
   fs/overlayfs/inode.c:970:12: note: '?' condition is false
   fs/overlayfs/inode.c:972:7: note: 'realinode' is null
           if (!realinode)
                ^~~~~~~~~
   fs/overlayfs/inode.c:972:2: note: Taking true branch
           if (!realinode)
           ^
   fs/overlayfs/inode.c:973:23: note: Passing null pointer value via 1st pa=
rameter 'dentry'
                   realinode =3D d_inode(lowerdentry);
                                       ^~~~~~~~~~~
   fs/overlayfs/inode.c:973:15: note: Calling 'd_inode'
                   realinode =3D d_inode(lowerdentry);
                               ^~~~~~~~~~~~~~~~~~~~
   include/linux/dcache.h:523:9: note: Access to field 'd_inode' results in=
 a dereference of a null pointer (loaded from variable 'dentry')
           return dentry->d_inode;
                  ^~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/media/tuners/tda18271-fe.c:473:2: warning: Value stored to 'bcal=
' is never read [clang-analyzer-deadcode.DeadStores]
--
                   delay =3D 0;
                   ^       ~
   drivers/phy/rockchip/phy-rockchip-inno-usb2.c:760:3: note: Value stored =
to 'delay' is never read
                   delay =3D 0;
                   ^       ~
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
   drivers/phy/socionext/phy-uniphier-ahci.c:123:2: warning: Value stored t=
o 'val' is never read [clang-analyzer-deadcode.DeadStores]
           val |=3D FIELD_PREP(TXCTRL1_DEEMPH_G1_MASK, 0x05);
           ^
   drivers/phy/socionext/phy-uniphier-ahci.c:123:2: note: Value stored to '=
val' is never read
   drivers/phy/socionext/phy-uniphier-ahci.c:131:2: warning: Value stored t=
o 'val' is never read [clang-analyzer-deadcode.DeadStores]
           val |=3D FIELD_PREP(RXCTRL_RX_EQ_MASK, 0x1);
           ^
   drivers/phy/socionext/phy-uniphier-ahci.c:131:2: note: Value stored to '=
val' is never read
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
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (2 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (2 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (1 in non-user code, 3 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/dma/uniphier-xdmac.c:208:2: warning: Value stored to 'val' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
           val &=3D ~XDMAC_TSS_REQ;
           ^      ~~~~~~~~~~~~~~
   drivers/dma/uniphier-xdmac.c:208:2: note: Value stored to 'val' is never=
 read
           val &=3D ~XDMAC_TSS_REQ;
           ^      ~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/soc/aspeed/aspeed-lpc-ctrl.c:72:17: warning: Value stored to 'de=
v' during its initialization is never read [clang-analyzer-deadcode.DeadSto=
res]
           struct device *dev =3D file->private_data;
                          ^~~   ~~~~~~~~~~~~~~~~~~
   drivers/soc/aspeed/aspeed-lpc-ctrl.c:72:17: note: Value stored to 'dev' =
during its initialization is never read
           struct device *dev =3D file->private_data;
                          ^~~   ~~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
>> drivers/usb/phy/phy-mxs-usb.c:392:6: warning: Value stored to 'phyctrl' =
during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           u32 phyctrl =3D readl(base + HW_USBPHY_CTRL);
               ^~~~~~~
   drivers/usb/phy/phy-mxs-usb.c:392:6: note: Value stored to 'phyctrl' dur=
ing its initialization is never read
           u32 phyctrl =3D readl(base + HW_USBPHY_CTRL);
               ^~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/video/backlight/adp8860_bl.c:230:2: warning: Value stored to 're=
t' is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D adp8860_write(client, ADP8860_ISCFR, pdata->led_fade_law=
);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/backlight/adp8860_bl.c:230:2: note: Value stored to 'ret' =
is never read
           ret =3D adp8860_write(client, ADP8860_ISCFR, pdata->led_fade_law=
);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
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
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   drivers/thermal/gov_fair_share.c:101:21: warning: Division by zero [clan=
g-analyzer-core.DivideZero]
                           percentage =3D 100 / total_instance;
                                        ~~~~^~~~~~~~~~~~~~~~
   drivers/thermal/gov_fair_share.c:82:2: note: 'total_instance' initialize=
d to 0
           int total_instance =3D 0;
           ^~~~~~~~~~~~~~~~~~
   drivers/thermal/gov_fair_share.c:85:2: note: Left side of '&&' is false
           list_for_each_entry(instance, &tz->thermal_instances, tz_node) {
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
   include/linux/kernel.h:694:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
--
           ^
   drivers/rtc/rtc-rv3028.c:505:13: note: The result of the left shift is u=
ndefined because the left operand is negative
                                    offset << 7);
                                    ~~~~~~ ^
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   lib/math/rational.c:82:35: warning: Division by zero [clang-analyzer-cor=
e.DivideZero]
                                                 (max_denominator - d0) / d=
1);
                                                                        ^
   include/linux/minmax.h:51:36: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                                            ^
   include/linux/minmax.h:44:17: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                                 ^
   include/linux/minmax.h:38:25: note: expanded from macro '__cmp_once'
                   typeof(y) unique_y =3D (y);               \
                                         ^
   lib/math/rational.c:52:7: note: The value 0 is assigned to 'd1'
           n0 =3D d1 =3D 0;
                ^~~~~~
   lib/math/rational.c:55:2: note: Loop condition is true.  Entering loop b=
ody
           for (;;) {
           ^
   lib/math/rational.c:58:7: note: Assuming 'd' is not equal to 0
                   if (d =3D=3D 0)
                       ^~~~~~
   lib/math/rational.c:58:3: note: Taking false branch
                   if (d =3D=3D 0)
                   ^
   lib/math/rational.c:80:8: note: Assuming 'n2' is > 'max_numerator'
                   if ((n2 > max_numerator) || (d2 > max_denominator)) {
                        ^~~~~~~~~~~~~~~~~~
   lib/math/rational.c:80:28: note: Left side of '||' is true
                   if ((n2 > max_numerator) || (d2 > max_denominator)) {
                                            ^
   lib/math/rational.c:82:35: note: Division by zero
                                                 (max_denominator - d0) / d=
1);
                                                                        ^
   include/linux/minmax.h:51:36: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                                            ^
   include/linux/minmax.h:44:17: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                                 ^
   include/linux/minmax.h:38:25: note: expanded from macro '__cmp_once'
                   typeof(y) unique_y =3D (y);               \
                                         ^
   1 warning generated.
   drivers/clk/sprd/pll.c:200:2: warning: Value stored to 'width' is never =
read [clang-analyzer-deadcode.DeadStores]
           width =3D pwidth(pll, PLL_KINT);
           ^
   drivers/clk/sprd/pll.c:200:2: note: Value stored to 'width' is never read
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
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
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
>> drivers/gpu/drm/tegra/hub.c:229:17: warning: Value stored to 'dev' durin=
g its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D dc->dev;
                          ^~~   ~~~~~~~
   drivers/gpu/drm/tegra/hub.c:229:17: note: Value stored to 'dev' during i=
ts initialization is never read
           struct device *dev =3D dc->dev;
                          ^~~   ~~~~~~~
   drivers/gpu/drm/tegra/hub.c:299:2: warning: Value stored to 'value' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           value =3D tegra_plane_readl(plane, DC_WIN_CORE_IHUB_WGRP_FETCH_M=
ETER);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/gpu/drm/tegra/hub.c:299:2: note: Value stored to 'value' is neve=
r read
           value =3D tegra_plane_readl(plane, DC_WIN_CORE_IHUB_WGRP_FETCH_M=
ETER);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/gpu/drm/tegra/hub.c:313:2: warning: Value stored to 'value' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           value =3D tegra_plane_readl(plane, DC_WIN_CORE_PRECOMP_WGRP_PIPE=
_METER);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   drivers/gpu/drm/tegra/hub.c:313:2: note: Value stored to 'value' is neve=
r read
           value =3D tegra_plane_readl(plane, DC_WIN_CORE_PRECOMP_WGRP_PIPE=
_METER);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   drivers/gpu/drm/tegra/hub.c:318:2: warning: Value stored to 'value' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           value =3D tegra_plane_readl(plane, DC_WIN_CORE_IHUB_WGRP_POOL_CO=
NFIG);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/gpu/drm/tegra/hub.c:318:2: note: Value stored to 'value' is neve=
r read
           value =3D tegra_plane_readl(plane, DC_WIN_CORE_IHUB_WGRP_POOL_CO=
NFIG);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/gpu/drm/tegra/hub.c:693:2: warning: Value stored to 'value' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           value =3D tegra_dc_readl(dc, DC_DISP_IHUB_COMMON_DISPLAY_FETCH_M=
ETER);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/gpu/drm/tegra/hub.c:693:2: note: Value stored to 'value' is neve=
r read
           value =3D tegra_dc_readl(dc, DC_DISP_IHUB_COMMON_DISPLAY_FETCH_M=
ETER);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
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
   7 warnings generated.
   kernel/printk/printk.c:156:3: warning: Call to function 'strcpy' is inse=
cure as it does not provide bounding of the memory buffer. Replace unbounde=
d copy functions with analogous functions that support length arguments suc=
h as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(devkmsg_log_str, "on");
                   ^~~~~~
   kernel/printk/printk.c:156:3: note: Call to function 'strcpy' is insecur=
e as it does not provide bounding of the memory buffer. Replace unbounded c=
opy functions with analogous functions that support length arguments such a=
s 'strlcpy'. CWE-119
                   strcpy(devkmsg_log_str, "on");
                   ^~~~~~
   kernel/printk/printk.c:158:3: warning: Call to function 'strcpy' is inse=
cure as it does not provide bounding of the memory buffer. Replace unbounde=
d copy functions with analogous functions that support length arguments suc=
h as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(devkmsg_log_str, "off");
                   ^~~~~~
   kernel/printk/printk.c:158:3: note: Call to function 'strcpy' is insecur=
e as it does not provide bounding of the memory buffer. Replace unbounded c=
opy functions with analogous functions that support length arguments such a=
s 'strlcpy'. CWE-119
                   strcpy(devkmsg_log_str, "off");
                   ^~~~~~
   kernel/printk/printk.c:2477:2: warning: Value stored to 'do_cond_resched=
' is never read [clang-analyzer-deadcode.DeadStores]
           do_cond_resched =3D console_may_schedule;
           ^                 ~~~~~~~~~~~~~~~~~~~~
   kernel/printk/printk.c:2477:2: note: Value stored to 'do_cond_resched' i=
s never read
           do_cond_resched =3D console_may_schedule;
           ^                 ~~~~~~~~~~~~~~~~~~~~
   Suppressed 4 warnings (2 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
--
           if (list_empty(&thread->task_busy_list))
           ^
   drivers/mailbox/mtk-cmdq-mailbox.c:416:2: note: Left side of '&&' is fal=
se
           list_for_each_entry_safe(task, tmp, &thread->task_busy_list,
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
   include/linux/kernel.h:694:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/mailbox/mtk-cmdq-mailbox.c:416:2: note: Taking false branch
           list_for_each_entry_safe(task, tmp, &thread->task_busy_list,
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
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:306:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/mailbox/mtk-cmdq-mailbox.c:416:2: note: Loop condition is false.=
  Exiting loop
           list_for_each_entry_safe(task, tmp, &thread->task_busy_list,
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
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:304:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/mailbox/mtk-cmdq-mailbox.c:416:2: note: Use of memory after it i=
s freed
           list_for_each_entry_safe(task, tmp, &thread->task_busy_list,
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
   include/linux/kernel.h:693:25: note: expanded from macro 'container_of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
                                  ^~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/gpu/drm/tegra/dc.c:1950:2: warning: Value stored to 'value' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           value =3D tegra_dc_readl(dc, DC_CMD_STATE_CONTROL);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/tegra/dc.c:1950:2: note: Value stored to 'value' is neve=
r read
           value =3D tegra_dc_readl(dc, DC_CMD_STATE_CONTROL);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/tegra/dc.c:1954:2: warning: Value stored to 'value' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           value =3D tegra_dc_readl(dc, DC_CMD_STATE_CONTROL);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/tegra/dc.c:1954:2: note: Value stored to 'value' is neve=
r read
           value =3D tegra_dc_readl(dc, DC_CMD_STATE_CONTROL);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
>> drivers/gpu/drm/tegra/hda.c:53:3: warning: Value stored to 'bits' is nev=
er read [clang-analyzer-deadcode.DeadStores]
                   bits =3D (format & AC_FMT_BITS_MASK) >> AC_FMT_BITS_SHIF=
T;
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/tegra/hda.c:53:3: note: Value stored to 'bits' is never =
read
                   bits =3D (format & AC_FMT_BITS_MASK) >> AC_FMT_BITS_SHIF=
T;
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   fs/fuse/file.c:1392:44: warning: The left operand of '<' is a garbage va=
lue [clang-analyzer-core.UndefinedBinaryOperatorResult]
           while (nbytes < *nbytesp && ap->num_pages < max_pages) {
                                                     ^
   fs/fuse/file.c:1594:2: note: Taking false branch
           if (fuse_is_bad(inode))
           ^
   fs/fuse/file.c:1597:6: note: Left side of '&&' is false
           if (FUSE_IS_DAX(inode))
               ^
   fs/fuse/fuse_i.h:1202:57: note: expanded from macro 'FUSE_IS_DAX'
   #define FUSE_IS_DAX(inode) (IS_ENABLED(CONFIG_FUSE_DAX) && IS_DAX(inode))
                                                           ^
   fs/fuse/file.c:1600:6: note: Assuming the condition is false
           if (!(ff->open_flags & FOPEN_DIRECT_IO))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/fuse/file.c:1600:2: note: Taking false branch
           if (!(ff->open_flags & FOPEN_DIRECT_IO))
           ^
   fs/fuse/file.c:1603:10: note: Calling 'fuse_direct_write_iter'
                   return fuse_direct_write_iter(iocb, from);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/fuse/file.c:1554:6: note: Assuming 'res' is > 0
           if (res > 0) {
               ^~~~~~~
   fs/fuse/file.c:1554:2: note: Taking true branch
           if (res > 0) {
           ^
   fs/fuse/file.c:1555:7: note: Left side of '&&' is true
                   if (!is_sync_kiocb(iocb) && iocb->ki_flags & IOCB_DIRECT=
) {
                       ^
   fs/fuse/file.c:1555:31: note: Assuming the condition is true
                   if (!is_sync_kiocb(iocb) && iocb->ki_flags & IOCB_DIRECT=
) {
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/fuse/file.c:1555:3: note: Taking true branch
                   if (!is_sync_kiocb(iocb) && iocb->ki_flags & IOCB_DIRECT=
) {
                   ^
   fs/fuse/file.c:1556:10: note: Calling 'fuse_direct_IO'
--
   drivers/iio/light/adux1020.c:346:2: note: Taking false branch
           if (ret < 0)
           ^
   drivers/iio/light/adux1020.c:352:6: note: Assuming 'ret' is >=3D 0
           if (ret < 0)
               ^~~~~~~
   drivers/iio/light/adux1020.c:352:2: note: Taking false branch
           if (ret < 0)
           ^
   drivers/iio/light/adux1020.c:356:2: note: Returning without writing to '=
*val'
           return regmap_update_bits(data->regmap, ADUX1020_REG_INT_MASK,
           ^
   drivers/iio/light/adux1020.c:380:10: note: Returning from 'adux1020_meas=
ure'
                           ret =3D adux1020_measure(data, ADUX1020_MODE_PRO=
X_I, buf);
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   drivers/iio/light/adux1020.c:381:8: note: Assuming 'ret' is >=3D 0
                           if (ret < 0)
                               ^~~~~~~
   drivers/iio/light/adux1020.c:381:4: note: Taking false branch
                           if (ret < 0)
                           ^
   drivers/iio/light/adux1020.c:384:9: note: Assigned value is garbage or u=
ndefined
                           *val =3D buf[0];
                                ^ ~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
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
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/of/property.c:901:19: warning: Access to field 'full_name' resul=
ts in a dereference of a null pointer [clang-analyzer-core.NullDereference]
           return kbasename(to_of_node(fwnode)->full_name);
                            ^
   include/linux/of.h:161:2: note: expanded from macro 'to_of_node'
           ({                                                              \
           ^
   drivers/of/property.c:901:19: note: '?' condition is false
           return kbasename(to_of_node(fwnode)->full_name);
                            ^
   include/linux/of.h:164:3: note: expanded from macro 'to_of_node'
                   is_of_node(__to_of_node_fwnode) ?                       \
                   ^
   drivers/of/property.c:901:19: note: Access to field 'full_name' results =
in a dereference of a null pointer
           return kbasename(to_of_node(fwnode)->full_name);
                            ^
   include/linux/of.h:161:2: note: expanded from macro 'to_of_node'
           ({                                                              \
           ^
   drivers/of/property.c:907:7: warning: Access to field 'parent' results i=
n a dereference of a null pointer [clang-analyzer-core.NullDereference]
           if (!to_of_node(fwnode)->parent)
                ^
   include/linux/of.h:161:2: note: expanded from macro 'to_of_node'
           ({                                                              \
           ^
   drivers/of/property.c:907:7: note: '?' condition is false
           if (!to_of_node(fwnode)->parent)
                ^
   include/linux/of.h:164:3: note: expanded from macro 'to_of_node'
                   is_of_node(__to_of_node_fwnode) ?                       \
                   ^
   drivers/of/property.c:907:7: note: Access to field 'parent' results in a=
 dereference of a null pointer
           if (!to_of_node(fwnode)->parent)
                ^
   include/linux/of.h:161:2: note: expanded from macro 'to_of_node'
           ({                                                              \
           ^
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
>> drivers/staging/media/omap4iss/iss_csi2.c:606:21: warning: Value stored =
to 'iss' during its initialization is never read [clang-analyzer-deadcode.D=
eadStores]
           struct iss_device *iss =3D csi2->iss;
                              ^~~   ~~~~~~~~~
   drivers/staging/media/omap4iss/iss_csi2.c:606:21: note: Value stored to =
'iss' during its initialization is never read
           struct iss_device *iss =3D csi2->iss;
                              ^~~   ~~~~~~~~~
   drivers/staging/media/omap4iss/iss_csi2.c:744:21: warning: Value stored =
to 'iss' during its initialization is never read [clang-analyzer-deadcode.D=
eadStores]
           struct iss_device *iss =3D csi2->iss;
                              ^~~   ~~~~~~~~~
   drivers/staging/media/omap4iss/iss_csi2.c:744:21: note: Value stored to =
'iss' during its initialization is never read
           struct iss_device *iss =3D csi2->iss;
                              ^~~   ~~~~~~~~~
   1 warning generated.
>> drivers/staging/media/omap4iss/iss_csiphy.c:197:3: warning: Division by =
zero [clang-analyzer-core.DivideZero]
                   / (2 * csi2->phy->used_data_lanes)
   ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/omap4iss/iss_csiphy.c:119:30: note: Left side of '=
&&' is false
           struct iss_pipeline *pipe =3D to_iss_pipeline(&csi2_subdev->enti=
ty);
                                       ^
   drivers/staging/media/omap4iss/iss_video.h:95:2: note: expanded from mac=
ro 'to_iss_pipeline'
           container_of((__e)->pipe, struct iss_pipeline, pipe)
           ^
   include/linux/kernel.h:694:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/staging/media/omap4iss/iss_csiphy.c:119:30: note: Taking false b=
ranch
           struct iss_pipeline *pipe =3D to_iss_pipeline(&csi2_subdev->enti=
ty);
                                       ^
   drivers/staging/media/omap4iss/iss_video.h:95:2: note: expanded from mac=
ro 'to_iss_pipeline'
           container_of((__e)->pipe, struct iss_pipeline, pipe)
           ^
   include/linux/kernel.h:694:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:306:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/staging/media/omap4iss/iss_csiphy.c:119:30: note: Loop condition=
 is false.  Exiting loop
           struct iss_pipeline *pipe =3D to_iss_pipeline(&csi2_subdev->enti=
ty);
                                       ^
   drivers/staging/media/omap4iss/iss_video.h:95:2: note: expanded from mac=
ro 'to_iss_pipeline'
           container_of((__e)->pipe, struct iss_pipeline, pipe)
           ^
   include/linux/kernel.h:694:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:304:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/staging/media/omap4iss/iss_csiphy.c:146:6: note: Assuming field =
'interface' is not equal to ISS_INTERFACE_CSI2A_PHY1
           if (subdevs->interface =3D=3D ISS_INTERFACE_CSI2A_PHY1) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/omap4iss/iss_csiphy.c:146:2: note: Taking false br=
anch
           if (subdevs->interface =3D=3D ISS_INTERFACE_CSI2A_PHY1) {
           ^
   drivers/staging/media/omap4iss/iss_csiphy.c:157:6: note: Assuming field =
'interface' is not equal to ISS_INTERFACE_CSI2B_PHY2
           if (subdevs->interface =3D=3D ISS_INTERFACE_CSI2B_PHY2) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/omap4iss/iss_csiphy.c:157:2: note: Taking false br=
anch
           if (subdevs->interface =3D=3D ISS_INTERFACE_CSI2B_PHY2) {
           ^
   drivers/staging/media/omap4iss/iss_csiphy.c:171:2: note: The value 0 is =
assigned to field 'used_data_lanes'
           csi2->phy->used_data_lanes =3D 0;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/omap4iss/iss_csiphy.c:174:14: note: Assuming 'i' i=
s >=3D field 'max_data_lanes'
           for (i =3D 0; i < csi2->phy->max_data_lanes; i++) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/omap4iss/iss_csiphy.c:174:2: note: Loop condition =
is false. Execution continues on line 189
           for (i =3D 0; i < csi2->phy->max_data_lanes; i++) {
           ^
   drivers/staging/media/omap4iss/iss_csiphy.c:189:6: note: Assuming field =
'pol' is <=3D 1
           if (lanes->clk.pol > 1 ||
               ^~~~~~~~~~~~~~~~~~
   drivers/staging/media/omap4iss/iss_csiphy.c:189:6: note: Left side of '|=
|' is false
   drivers/staging/media/omap4iss/iss_csiphy.c:190:6: note: Assuming the co=
ndition is false
               lanes->clk.pos > (csi2->phy->max_data_lanes + 1))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/omap4iss/iss_csiphy.c:189:2: note: Taking false br=
anch
           if (lanes->clk.pol > 1 ||
           ^
   drivers/staging/media/omap4iss/iss_csiphy.c:193:6: note: Assuming field =
'pos' is not equal to 0
           if (lanes->clk.pos =3D=3D 0 || used_lanes & (1 << lanes->clk.pos=
))
               ^~~~~~~~~~~~~~~~~~~
   drivers/staging/media/omap4iss/iss_csiphy.c:193:6: note: Left side of '|=
|' is false
   drivers/staging/media/omap4iss/iss_csiphy.c:193:2: note: Taking false br=
anch
           if (lanes->clk.pos =3D=3D 0 || used_lanes & (1 << lanes->clk.pos=
))
           ^
   drivers/staging/media/omap4iss/iss_csiphy.c:197:3: note: Division by zero
                   / (2 * csi2->phy->used_data_lanes)
   ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   3 warnings generated.
   include/asm-generic/bitops/non-atomic.h:106:16: warning: Array access (f=
rom variable 'addr') results in a null pointer dereference [clang-analyzer-=
core.NullDereference]
           return 1UL & (addr[BIT_WORD(nr)] >> (nr & (BITS_PER_LONG-1)));
                         ^
   drivers/perf/arm_pmu.c:761:24: note: Assuming '____ptr' is null
           struct arm_pmu *pmu =3D hlist_entry_safe(node, struct arm_pmu, n=
ode);
                                 ^
   include/linux/list.h:983:5: note: expanded from macro 'hlist_entry_safe'
              ____ptr ? hlist_entry(____ptr, type, member) : NULL; \
              ^~~~~~~
   drivers/perf/arm_pmu.c:761:24: note: '?' condition is false
           struct arm_pmu *pmu =3D hlist_entry_safe(node, struct arm_pmu, n=
ode);
                                 ^
   include/linux/list.h:983:5: note: expanded from macro 'hlist_entry_safe'
              ____ptr ? hlist_entry(____ptr, type, member) : NULL; \
              ^
   drivers/perf/arm_pmu.c:764:7: note: Calling 'cpumask_test_cpu'
           if (!cpumask_test_cpu(cpu, &pmu->supported_cpus))
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cpumask.h:373:38: note: Passing null pointer value via 2nd=
 parameter 'addr'
           return test_bit(cpumask_check(cpu), cpumask_bits((cpumask)));
                                               ^
   include/linux/cpumask.h:26:29: note: expanded from macro 'cpumask_bits'
   #define cpumask_bits(maskp) ((maskp)->bits)
                               ^~~~~~~~~~~~~~~
   include/linux/cpumask.h:373:9: note: Calling 'test_bit'
           return test_bit(cpumask_check(cpu), cpumask_bits((cpumask)));
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/non-atomic.h:106:16: note: Array access (from=
 variable 'addr') results in a null pointer dereference
           return 1UL & (addr[BIT_WORD(nr)] >> (nr & (BITS_PER_LONG-1)));
                         ^~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
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
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c:591:5: warning: The resu=
lt of the left shift is undefined because the left operand is negative [cla=
ng-analyzer-core.UndefinedBinaryOperatorResult]
                                   ATMEL_HLCDC_LAYER_DISC_SIZE(state->disc_=
w,
                                   ^
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h:115:67: note: expanded from=
 macro 'ATMEL_HLCDC_LAYER_DISC_SIZE'
   #define ATMEL_HLCDC_LAYER_DISC_SIZE(w, h)       (((w) - 1) | (((h) - 1) =
<< 16))
                                                                           ^
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c:740:6: note: Assuming fi=
eld 'crtc' is non-null
           if (!p->state->crtc || !p->state->fb)
               ^~~~~~~~~~~~~~~
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c:740:6: note: Left side o=
f '||' is false
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c:740:25: note: Assuming f=
ield 'fb' is non-null
           if (!p->state->crtc || !p->state->fb)
                                  ^~~~~~~~~~~~~
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c:740:2: note: Taking fals=
e branch
           if (!p->state->crtc || !p->state->fb)
           ^
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c:743:6: note: Assuming fi=
eld 'visible' is true
           if (!state->base.visible) {
               ^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c:743:2: note: Taking fals=
e branch
           if (!state->base.visible) {
           ^
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c:753:2: note: Calling 'at=
mel_hlcdc_plane_update_disc_area'
           atmel_hlcdc_plane_update_disc_area(plane, state);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c:583:6: note: Assuming fi=
eld 'disc_pos' is not equal to 0
           if (!layout->disc_pos || !layout->disc_size)
               ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c:583:6: note: Left side o=
f '||' is false
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c:583:27: note: Assuming f=
ield 'disc_size' is not equal to 0
           if (!layout->disc_pos || !layout->disc_size)
                                    ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c:583:2: note: Taking fals=
e branch
           if (!layout->disc_pos || !layout->disc_size)
           ^
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c:591:5: note: The result =
of the left shift is undefined because the left operand is negative
                                   ATMEL_HLCDC_LAYER_DISC_SIZE(state->disc_=
w,
                                   ^
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h:115:67: note: expanded from=
 macro 'ATMEL_HLCDC_LAYER_DISC_SIZE'
   #define ATMEL_HLCDC_LAYER_DISC_SIZE(w, h)       (((w) - 1) | (((h) - 1) =
<< 16))
                                                                 ~~~~~~~~~ ^
>> drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c:816:39: warning: Value s=
tored to 'desc' during its initialization is never read [clang-analyzer-dea=
dcode.DeadStores]
           const struct atmel_hlcdc_layer_desc *desc =3D plane->layer.desc;
                                                ^~~~   ~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c:816:39: note: Value stor=
ed to 'desc' during its initialization is never read
           const struct atmel_hlcdc_layer_desc *desc =3D plane->layer.desc;
                                                ^~~~   ~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/usb/musb/musb_host.c:88:15: warning: Value stored to 'musb' duri=
ng its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct musb     *musb =3D ep->musb;
                            ^~~~   ~~~~~~~~
   drivers/usb/musb/musb_host.c:88:15: note: Value stored to 'musb' during =
its initialization is never read
           struct musb     *musb =3D ep->musb;
                            ^~~~   ~~~~~~~~
   drivers/usb/musb/musb_host.c:133:3: warning: Value stored to 'csr' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
                   csr =3D musb_readw(epio, MUSB_TXCSR);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/musb/musb_host.c:133:3: note: Value stored to 'csr' is never=
 read
                   csr =3D musb_readw(epio, MUSB_TXCSR);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/musb/musb_host.c:199:17: warning: Value stored to 'mbase' du=
ring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           void __iomem            *mbase =3D  musb->mregs;
                                    ^~~~~    ~~~~~~~~~~~
   drivers/usb/musb/musb_host.c:199:17: note: Value stored to 'mbase' durin=
g its initialization is never read
           void __iomem            *mbase =3D  musb->mregs;
                                    ^~~~~    ~~~~~~~~~~~
   drivers/usb/musb/musb_host.c:764:4: warning: Value stored to 'csr' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
                           csr =3D musb_readw(epio, MUSB_TXCSR);
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/musb/musb_host.c:764:4: note: Value stored to 'csr' is never=
 read
                           csr =3D musb_readw(epio, MUSB_TXCSR);
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/musb/musb_host.c:892:3: warning: Value stored to 'csr' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
                   csr =3D musb_readw(hw_ep->regs, MUSB_RXCSR);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/musb/musb_host.c:892:3: note: Value stored to 'csr' is never=
 read
                   csr =3D musb_readw(hw_ep->regs, MUSB_RXCSR);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/musb/musb_host.c:2336:3: warning: Value stored to 'csr' is n=
ever read [clang-analyzer-deadcode.DeadStores]
                   csr =3D musb_h_flush_rxfifo(ep, 0);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/musb/musb_host.c:2336:3: note: Value stored to 'csr' is neve=
r read
                   csr =3D musb_h_flush_rxfifo(ep, 0);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/musb/musb_host.c:2354:3: warning: Value stored to 'csr' is n=
ever read [clang-analyzer-deadcode.DeadStores]
                   csr =3D musb_readw(epio, MUSB_TXCSR);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/musb/musb_host.c:2354:3: note: Value stored to 'csr' is neve=
r read
                   csr =3D musb_readw(epio, MUSB_TXCSR);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   8 warnings generated.
   fs/pipe.c:479:24: warning: Value stored to 'buf' during its initializati=
on is never read [clang-analyzer-deadcode.DeadStores]
                           struct pipe_buffer *buf =3D &pipe->bufs[head & m=
ask];
                                               ^~~   ~~~~~~~~~~~~~~~~~~~~~~=
~~
   fs/pipe.c:479:24: note: Value stored to 'buf' during its initialization =
is never read
                           struct pipe_buffer *buf =3D &pipe->bufs[head & m=
ask];
                                               ^~~   ~~~~~~~~~~~~~~~~~~~~~~=
~~
   Suppressed 7 warnings (2 in non-user code, 5 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   fs/namei.c:2439:20: warning: The left operand of '!=3D' is a garbage val=
ue [clang-analyzer-core.UndefinedBinaryOperatorResult]
           if (unlikely(type !=3D LAST_NORM)) {
                             ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   fs/namei.c:2433:2: note: 'type' declared without an initial value
           int type;
           ^~~~~~~~
   fs/namei.c:2435:13: note: Calling 'filename_parentat'
           filename =3D filename_parentat(AT_FDCWD, getname_kernel(name), 0=
, path,
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   fs/namei.c:2407:2: note: Taking false branch
           if (IS_ERR(name))
--
                     ^
   drivers/leds/led-core.c:437:2: note: Taking false branch
           if (props.label) {
           ^
   drivers/leds/led-core.c:451:19: note: Field 'function' is null
           } else if (props.function || props.color_present) {
                            ^
   drivers/leds/led-core.c:451:13: note: Left side of '||' is false
           } else if (props.function || props.color_present) {
                      ^
   drivers/leds/led-core.c:451:37: note: Field 'color_present' is false
           } else if (props.function || props.color_present) {
                                              ^
   drivers/leds/led-core.c:451:9: note: Taking false branch
           } else if (props.function || props.color_present) {
                  ^
   drivers/leds/led-core.c:470:13: note: Assuming field 'default_label' is =
null
           } else if (init_data->default_label) {
                      ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/leds/led-core.c:470:9: note: Taking false branch
           } else if (init_data->default_label) {
                  ^
   drivers/leds/led-core.c:477:13: note: Assuming the condition is true
           } else if (is_of_node(fwnode)) {
                      ^~~~~~~~~~~~~~~~~~
   drivers/leds/led-core.c:477:9: note: Taking true branch
           } else if (is_of_node(fwnode)) {
                  ^
   drivers/leds/led-core.c:478:30: note: Assuming the condition is false
                   strscpy(led_classdev_name, to_of_node(fwnode)->name,
                                              ^
   include/linux/of.h:164:3: note: expanded from macro 'to_of_node'
                   is_of_node(__to_of_node_fwnode) ?                       \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/leds/led-core.c:478:30: note: '?' condition is false
                   strscpy(led_classdev_name, to_of_node(fwnode)->name,
                                              ^
   include/linux/of.h:164:3: note: expanded from macro 'to_of_node'
                   is_of_node(__to_of_node_fwnode) ?                       \
                   ^
   drivers/leds/led-core.c:478:30: note: Access to field 'name' results in =
a dereference of a null pointer
                   strscpy(led_classdev_name, to_of_node(fwnode)->name,
                                              ^
   include/linux/of.h:161:2: note: expanded from macro 'to_of_node'
           ({                                                              \
           ^
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/rtc/rtc-sc27xx.c:373:8: warning: The result of the left shift is=
 undefined because the left operand is negative [clang-analyzer-core.Undefi=
nedBinaryOperatorResult]
                                      SPRD_RTC_POWER_STS_VALID);
                                      ^
   drivers/rtc/rtc-sc27xx.c:97:31: note: expanded from macro 'SPRD_RTC_POWE=
R_STS_VALID'
           (~SPRD_RTC_POWER_RESET_VALUE << SPRD_RTC_POWER_STS_SHIFT)
            ~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^
   drivers/rtc/rtc-sc27xx.c:358:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   drivers/rtc/rtc-sc27xx.c:358:2: note: Taking false branch
           if (ret)
           ^
   drivers/rtc/rtc-sc27xx.c:361:6: note: Assuming field 'valid' is false
           if (!rtc->valid) {
               ^~~~~~~~~~~
   drivers/rtc/rtc-sc27xx.c:361:2: note: Taking true branch
           if (!rtc->valid) {
           ^
   drivers/rtc/rtc-sc27xx.c:365:7: note: Assuming 'ret' is 0
                   if (ret)
                       ^~~
   drivers/rtc/rtc-sc27xx.c:365:3: note: Taking false branch
                   if (ret)
                   ^
   drivers/rtc/rtc-sc27xx.c:373:8: note: The result of the left shift is un=
defined because the left operand is negative
                                      SPRD_RTC_POWER_STS_VALID);
                                      ^
   drivers/rtc/rtc-sc27xx.c:97:31: note: expanded from macro 'SPRD_RTC_POWE=
R_STS_VALID'
           (~SPRD_RTC_POWER_RESET_VALUE << SPRD_RTC_POWER_STS_SHIFT)
            ~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/staging/media/imx/imx-media-csc-scaler.c:202:3: warning: Value s=
tored to 'field' is never read [clang-analyzer-deadcode.DeadStores]
                   field =3D V4L2_FIELD_NONE;
                   ^       ~~~~~~~~~~~~~~~
   drivers/staging/media/imx/imx-media-csc-scaler.c:202:3: note: Value stor=
ed to 'field' is never read
                   field =3D V4L2_FIELD_NONE;
                   ^       ~~~~~~~~~~~~~~~
>> drivers/staging/media/imx/imx-media-csc-scaler.c:801:30: warning: Value =
stored to 'priv' during its initialization is never read [clang-analyzer-de=
adcode.DeadStores]
           struct ipu_csc_scaler_priv *priv =3D video_drvdata(file);
                                       ^~~~   ~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/imx/imx-media-csc-scaler.c:801:30: note: Value sto=
red to 'priv' during its initialization is never read
           struct ipu_csc_scaler_priv *priv =3D video_drvdata(file);
                                       ^~~~   ~~~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/leds/leds-pwm.c:111:15: warning: Access to field 'name' results =
in a dereference of a null pointer [clang-analyzer-core.NullDereference]
                           led.name =3D to_of_node(fwnode)->name;
                                      ^
   include/linux/of.h:161:2: note: expanded from macro 'to_of_node'
           ({                                                              \
           ^
   drivers/leds/leds-pwm.c:141:6: note: Assuming 'count' is not equal to 0
           if (!count)
               ^~~~~~
   drivers/leds/leds-pwm.c:141:2: note: Taking false branch
           if (!count)
           ^
   drivers/leds/leds-pwm.c:146:6: note: Assuming 'priv' is non-null
           if (!priv)
               ^~~~~
   drivers/leds/leds-pwm.c:146:2: note: Taking false branch
           if (!priv)
           ^
   drivers/leds/leds-pwm.c:149:8: note: Calling 'led_pwm_create_fwnode'
           ret =3D led_pwm_create_fwnode(&pdev->dev, priv);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/leds/leds-pwm.c:108:2: note: Loop condition is true.  Entering l=
oop body
           device_for_each_child_node(dev, fwnode) {
           ^
   include/linux/property.h:111:2: note: expanded from macro 'device_for_ea=
ch_child_node'
           for (child =3D device_get_next_child_node(dev, NULL); child;    =
  \
           ^
   drivers/leds/leds-pwm.c:110:7: note: Assuming 'ret' is not equal to 0
                   if (ret && is_of_node(fwnode))
                       ^~~
   drivers/leds/leds-pwm.c:110:7: note: Left side of '&&' is true
   drivers/leds/leds-pwm.c:110:14: note: Assuming the condition is true
                   if (ret && is_of_node(fwnode))
                              ^~~~~~~~~~~~~~~~~~
   drivers/leds/leds-pwm.c:110:3: note: Taking true branch
                   if (ret && is_of_node(fwnode))
                   ^
   drivers/leds/leds-pwm.c:111:15: note: Assuming the condition is false
                           led.name =3D to_of_node(fwnode)->name;
                                      ^
   include/linux/of.h:164:3: note: expanded from macro 'to_of_node'
                   is_of_node(__to_of_node_fwnode) ?                       \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/leds/leds-pwm.c:111:15: note: '?' condition is false
                           led.name =3D to_of_node(fwnode)->name;
                                      ^
   include/linux/of.h:164:3: note: expanded from macro 'to_of_node'
                   is_of_node(__to_of_node_fwnode) ?                       \
                   ^
   drivers/leds/leds-pwm.c:111:15: note: Access to field 'name' results in =
a dereference of a null pointer
                           led.name =3D to_of_node(fwnode)->name;
                                      ^
   include/linux/of.h:161:2: note: expanded from macro 'to_of_node'
           ({                                                              \
           ^
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
--
                   ^           ~~~~~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   fs/proc/generic.c:472:4: warning: Call to function 'strcpy' is insecure =
as it does not provide bounding of the memory buffer. Replace unbounded cop=
y functions with analogous functions that support length arguments such as =
'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                           strcpy((char*)ent->data,dest);
                           ^~~~~~
   fs/proc/generic.c:472:4: note: Call to function 'strcpy' is insecure as =
it does not provide bounding of the memory buffer. Replace unbounded copy f=
unctions with analogous functions that support length arguments such as 'st=
rlcpy'. CWE-119
                           strcpy((char*)ent->data,dest);
                           ^~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (2 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
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
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   drivers/power/supply/twl4030_charger.c:364:2: warning: Value stored to '=
cur_reg' is never read [clang-analyzer-deadcode.DeadStores]
           cur_reg |=3D oldreg << 8;
           ^          ~~~~~~~~~~~
   drivers/power/supply/twl4030_charger.c:364:2: note: Value stored to 'cur=
_reg' is never read
           cur_reg |=3D oldreg << 8;
           ^          ~~~~~~~~~~~
   drivers/power/supply/twl4030_charger.c:383:3: warning: Value stored to '=
status' is never read [clang-analyzer-deadcode.DeadStores]
                   status =3D twl_i2c_write_u8(TWL_MODULE_MAIN_CHARGE,
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/power/supply/twl4030_charger.c:383:3: note: Value stored to 'sta=
tus' is never read
                   status =3D twl_i2c_write_u8(TWL_MODULE_MAIN_CHARGE,
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/power/supply/twl4030_charger.c:412:2: warning: Value stored to '=
curr' is never read [clang-analyzer-deadcode.DeadStores]
           curr =3D twl4030_charger_get_current();
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/power/supply/twl4030_charger.c:412:2: note: Value stored to 'cur=
r' is never read
           curr =3D twl4030_charger_get_current();
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/power/supply/twl4030_charger.c:467:4: warning: Value stored to '=
ret' is never read [clang-analyzer-deadcode.DeadStores]
                           ret =3D twl4030_clear_set_boot_bci(0, TWL4030_BC=
IAUTOUSB);
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   drivers/power/supply/twl4030_charger.c:467:4: note: Value stored to 'ret=
' is never read
                           ret =3D twl4030_clear_set_boot_bci(0, TWL4030_BC=
IAUTOUSB);
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   drivers/power/supply/twl4030_charger.c:487:4: warning: Value stored to '=
ret' is never read [clang-analyzer-deadcode.DeadStores]
                           ret =3D twl_i2c_write_u8(TWL_MODULE_MAIN_CHARGE,=
 0x33,
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/power/supply/twl4030_charger.c:487:4: note: Value stored to 'ret=
' is never read
                           ret =3D twl_i2c_write_u8(TWL_MODULE_MAIN_CHARGE,=
 0x33,
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/power/supply/twl4030_charger.c:490:4: warning: Value stored to '=
ret' is never read [clang-analyzer-deadcode.DeadStores]
                           ret =3D twl_i2c_write_u8(TWL_MODULE_MAIN_CHARGE,=
 0x2a,
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/power/supply/twl4030_charger.c:490:4: note: Value stored to 'ret=
' is never read
                           ret =3D twl_i2c_write_u8(TWL_MODULE_MAIN_CHARGE,=
 0x2a,
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/power/supply/twl4030_charger.c:493:4: warning: Value stored to '=
ret' is never read [clang-analyzer-deadcode.DeadStores]
                           ret =3D twl_i2c_write_u8(TWL_MODULE_MAIN_CHARGE,=
 0x26,
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/power/supply/twl4030_charger.c:493:4: note: Value stored to 'ret=
' is never read
                           ret =3D twl_i2c_write_u8(TWL_MODULE_MAIN_CHARGE,=
 0x26,
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/power/supply/twl4030_charger.c:496:4: warning: Value stored to '=
ret' is never read [clang-analyzer-deadcode.DeadStores]
                           ret =3D twl_i2c_write_u8(TWL_MODULE_MAIN_CHARGE,=
 0xf3,
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/power/supply/twl4030_charger.c:496:4: note: Value stored to 'ret=
' is never read
                           ret =3D twl_i2c_write_u8(TWL_MODULE_MAIN_CHARGE,=
 0xf3,
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/power/supply/twl4030_charger.c:499:4: warning: Value stored to '=
ret' is never read [clang-analyzer-deadcode.DeadStores]
                           ret =3D twl_i2c_write_u8(TWL_MODULE_MAIN_CHARGE,=
 0x9c,
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/power/supply/twl4030_charger.c:499:4: note: Value stored to 'ret=
' is never read
                           ret =3D twl_i2c_write_u8(TWL_MODULE_MAIN_CHARGE,=
 0x9c,
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   Suppressed 3 warnings (2 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
>> drivers/staging/media/omap4iss/iss_ipipeif.c:51:21: warning: Value store=
d to 'iss' during its initialization is never read [clang-analyzer-deadcode=
.DeadStores]
           struct iss_device *iss =3D to_iss_device(ipipeif);
                              ^~~
   drivers/staging/media/omap4iss/iss_ipipeif.c:51:21: note: Value stored t=
o 'iss' during its initialization is never read
           struct iss_device *iss =3D to_iss_device(ipipeif);
                              ^~~
>> drivers/staging/media/omap4iss/iss_ipipeif.c:204:2: warning: Value store=
d to 'format' is never read [clang-analyzer-deadcode.DeadStores]
           format =3D &ipipeif->formats[IPIPEIF_PAD_SOURCE_ISIF_SF];
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/omap4iss/iss_ipipeif.c:204:2: note: Value stored t=
o 'format' is never read
           format =3D &ipipeif->formats[IPIPEIF_PAD_SOURCE_ISIF_SF];
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
>> drivers/staging/media/omap4iss/iss_ipipe.c:47:21: warning: Value stored =
to 'iss' during its initialization is never read [clang-analyzer-deadcode.D=
eadStores]
           struct iss_device *iss =3D to_iss_device(ipipe);
                              ^~~
   drivers/staging/media/omap4iss/iss_ipipe.c:47:21: note: Value stored to =
'iss' during its initialization is never read
           struct iss_device *iss =3D to_iss_device(ipipe);
                              ^~~
>> drivers/staging/media/omap4iss/iss_ipipe.c:115:2: warning: Value stored =
to 'format' is never read [clang-analyzer-deadcode.DeadStores]
           format =3D &ipipe->formats[IPIPE_PAD_SOURCE_VP];
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/omap4iss/iss_ipipe.c:115:2: note: Value stored to =
'format' is never read
           format =3D &ipipe->formats[IPIPE_PAD_SOURCE_VP];
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
>> drivers/staging/media/omap4iss/iss_resizer.c:43:21: warning: Value store=
d to 'iss' during its initialization is never read [clang-analyzer-deadcode=
.DeadStores]
           struct iss_device *iss =3D to_iss_device(resizer);
                              ^~~
   drivers/staging/media/omap4iss/iss_resizer.c:43:21: note: Value stored t=
o 'iss' during its initialization is never read
           struct iss_device *iss =3D to_iss_device(resizer);
                              ^~~
   drivers/staging/media/omap4iss/iss_resizer.c:288:21: warning: Value stor=
ed to 'iss' during its initialization is never read [clang-analyzer-deadcod=
e.DeadStores]
           struct iss_device *iss =3D to_iss_device(resizer);
                              ^~~
   drivers/staging/media/omap4iss/iss_resizer.c:288:21: note: Value stored =
to 'iss' during its initialization is never read
           struct iss_device *iss =3D to_iss_device(resizer);
                              ^~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
>> drivers/staging/media/omap4iss/iss_video.c:125:13: warning: Assigned val=
ue is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
           pix->width =3D mbus->width;
                      ^
   drivers/staging/media/omap4iss/iss_video.c:853:29: note: Left side of '&=
&' is true
           struct iss_video_fh *vfh =3D to_iss_video_fh(fh);
                                      ^
   drivers/staging/media/omap4iss/iss_video.h:181:29: note: expanded from m=
acro 'to_iss_video_fh'
   #define to_iss_video_fh(fh)     container_of(fh, struct iss_video_fh, vf=
h)
                                   ^
   include/linux/kernel.h:694:19: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                            ^
   drivers/staging/media/omap4iss/iss_video.c:853:29: note: Taking false br=
anch
           struct iss_video_fh *vfh =3D to_iss_video_fh(fh);
                                      ^
   drivers/staging/media/omap4iss/iss_video.h:181:29: note: expanded from m=
acro 'to_iss_video_fh'
   #define to_iss_video_fh(fh)     container_of(fh, struct iss_video_fh, vf=
h)
                                   ^
   include/linux/kernel.h:694:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:306:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/staging/media/omap4iss/iss_video.c:853:29: note: Loop condition =
is false.  Exiting loop
           struct iss_video_fh *vfh =3D to_iss_video_fh(fh);
                                      ^
   drivers/staging/media/omap4iss/iss_video.h:181:29: note: expanded from m=
acro 'to_iss_video_fh'
   #define to_iss_video_fh(fh)     container_of(fh, struct iss_video_fh, vf=
h)
                                   ^
   include/linux/kernel.h:694:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:304:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/staging/media/omap4iss/iss_video.c:863:6: note: Assuming 'type' =
is equal to field 'type'
           if (type !=3D video->type)
               ^~~~~~~~~~~~~~~~~~~
   drivers/staging/media/omap4iss/iss_video.c:863:2: note: Taking false bra=
nch
           if (type !=3D video->type)
           ^
   drivers/staging/media/omap4iss/iss_video.c:872:9: note: Assuming field '=
pipe' is null
           pipe =3D entity->pipe
                  ^~~~~~~~~~~~
   drivers/staging/media/omap4iss/iss_video.c:872:9: note: '?' condition is=
 false
   drivers/staging/media/omap4iss/iss_video.c:879:6: note: Assuming 'ret' i=
s 0
           if (ret)
               ^~~
   drivers/staging/media/omap4iss/iss_video.c:879:2: note: Taking false bra=
nch
           if (ret)
           ^
   drivers/staging/media/omap4iss/iss_video.c:883:6: note: Assuming 'ret' i=
s 0
           if (ret)
               ^~~
   drivers/staging/media/omap4iss/iss_video.c:883:2: note: Taking false bra=
nch
           if (ret)
           ^
   drivers/staging/media/omap4iss/iss_video.c:886:6: note: Assuming field '=
set_constraints' is null
           if (video->iss->pdata->set_constraints)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/omap4iss/iss_video.c:886:2: note: Taking false bra=
nch
           if (video->iss->pdata->set_constraints)
           ^
   drivers/staging/media/omap4iss/iss_video.c:890:6: note: Assuming 'ret' i=
s >=3D 0
           if (ret < 0)
               ^~~~~~~
   drivers/staging/media/omap4iss/iss_video.c:890:2: note: Taking false bra=
nch
           if (ret < 0)
           ^
   drivers/staging/media/omap4iss/iss_video.c:894:2: note: Loop condition i=
s false. Execution continues on line 901
           while ((entity =3D media_graph_walk_next(&graph)))
           ^
   drivers/staging/media/omap4iss/iss_video.c:901:8: note: Calling 'iss_vid=
eo_check_format'
           ret =3D iss_video_check_format(video, vfh);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/omap4iss/iss_video.c:278:8: note: Calling '__iss_v=
ideo_get_format'
           ret =3D __iss_video_get_format(video, &format);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/omap4iss/iss_video.c:253:7: note: 'subdev' is non-=
null
           if (!subdev)
                ^~~~~~
   drivers/staging/media/omap4iss/iss_video.c:253:2: note: Taking false bra=
nch
           if (!subdev)
           ^
   drivers/staging/media/omap4iss/iss_video.c:261:8: note: '__sd' is non-nu=
ll
           ret =3D v4l2_subdev_call(subdev, pad, get_fmt, NULL, &fmt);
                 ^
   include/media/v4l2-subdev.h:1140:8: note: expanded from macro 'v4l2_subd=
ev_call'
                   if (!__sd)                                              \
                        ^~~~
   drivers/staging/media/omap4iss/iss_video.c:261:8: note: Taking false bra=
nch
           ret =3D v4l2_subdev_call(subdev, pad, get_fmt, NULL, &fmt);
                 ^
   include/media/v4l2-subdev.h:1140:3: note: expanded from macro 'v4l2_subd=
ev_call'
                   if (!__sd)                                              \
                   ^
   drivers/staging/media/omap4iss/iss_video.c:261:8: note: Assuming field '=
pad' is non-null
           ret =3D v4l2_subdev_call(subdev, pad, get_fmt, NULL, &fmt);
                 ^
   include/media/v4l2-subdev.h:1142:14: note: expanded from macro 'v4l2_sub=
dev_call'
                   else if (!(__sd->ops->o && __sd->ops->o->f))            \
                              ^~~~~~~~~~~~
   drivers/staging/media/omap4iss/iss_video.c:261:8: note: Left side of '&&=
' is true
           ret =3D v4l2_subdev_call(subdev, pad, get_fmt, NULL, &fmt);
                 ^
   include/media/v4l2-subdev.h:1142:14: note: expanded from macro 'v4l2_sub=
dev_call'
                   else if (!(__sd->ops->o && __sd->ops->o->f))            \
                              ^
   drivers/staging/media/omap4iss/iss_video.c:261:8: note: Assuming the con=
dition is false
           ret =3D v4l2_subdev_call(subdev, pad, get_fmt, NULL, &fmt);
                 ^
   include/media/v4l2-subdev.h:1142:12: note: expanded from macro 'v4l2_sub=
dev_call'
                   else if (!(__sd->ops->o && __sd->ops->o->f))            \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/omap4iss/iss_video.c:261:8: note: Taking false bra=
nch
           ret =3D v4l2_subdev_call(subdev, pad, get_fmt, NULL, &fmt);
                 ^
   include/media/v4l2-subdev.h:1142:8: note: expanded from macro 'v4l2_subd=
ev_call'
                   else if (!(__sd->ops->o && __sd->ops->o->f))            \
                        ^
   drivers/staging/media/omap4iss/iss_video.c:261:8: note: Assuming field '=
pad' is null
           ret =3D v4l2_subdev_call(subdev, pad, get_fmt, NULL, &fmt);
                 ^
   include/media/v4l2-subdev.h:1144:12: note: expanded from macro 'v4l2_sub=
dev_call'
                   else if (v4l2_subdev_call_wrappers.o &&                 \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/omap4iss/iss_video.c:261:8: note: Left side of '&&=
' is false
           ret =3D v4l2_subdev_call(subdev, pad, get_fmt, NULL, &fmt);
                 ^
   include/media/v4l2-subdev.h:1144:40: note: expanded from macro 'v4l2_sub=
dev_call'
                   else if (v4l2_subdev_call_wrappers.o &&                 \
                                                        ^
   drivers/staging/media/omap4iss/iss_video.c:264:6: note: Assuming 'ret' i=
s not equal to 0
           if (ret)
               ^~~
   drivers/staging/media/omap4iss/iss_video.c:264:2: note: Taking true bran=
ch
           if (ret)
           ^
   drivers/staging/media/omap4iss/iss_video.c:265:3: note: Returning withou=
t writing to 'format->width'
                   return ret;
                   ^
   drivers/staging/media/omap4iss/iss_video.c:278:8: note: Returning from '=
__iss_video_get_format'
           ret =3D __iss_video_get_format(video, &format);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/omap4iss/iss_video.c:279:6: note: Assuming 'ret' i=
s >=3D 0
           if (ret < 0)
               ^~~~~~~
   drivers/staging/media/omap4iss/iss_video.c:279:2: note: Taking false bra=
nch
           if (ret < 0)
           ^
   drivers/staging/media/omap4iss/iss_video.c:283:8: note: Calling 'iss_vid=
eo_mbus_to_pix'
           ret =3D iss_video_mbus_to_pix(video, &format, &pixfmt);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/omap4iss/iss_video.c:125:13: note: Assigned value =
is garbage or undefined
           pix->width =3D mbus->width;
                      ^ ~~~~~~~~~~~
>> drivers/staging/media/omap4iss/iss_video.c:333:20: warning: Value stored=
 to 'video' during its initialization is never read [clang-analyzer-deadcod=
e.DeadStores]
           struct iss_video *video =3D vfh->video;
                             ^~~~~   ~~~~~~~~~~
   drivers/staging/media/omap4iss/iss_video.c:333:20: note: Value stored to=
 'video' during its initialization is never read
           struct iss_video *video =3D vfh->video;
                             ^~~~~   ~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/mmc/core/core.c:2010:19: warning: Value stored to 'host' during =
its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct mmc_host *host =3D card->host;
                            ^~~~   ~~~~~~~~~~
   drivers/mmc/core/core.c:2010:19: note: Value stored to 'host' during its=
 initialization is never read
           struct mmc_host *host =3D card->host;
                            ^~~~   ~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   sound/core/seq/seq_prioq.c:292:16: warning: Access to field 'next' resul=
ts in a dereference of a null pointer (loaded from variable 'prev') [clang-=
analyzer-core.NullDereference]
                                   prev->next =3D cell->next;
                                   ~~~~       ^
   sound/core/seq/seq_prioq.c:279:2: note: 'prev' initialized to a null poi=
nter value
           struct snd_seq_event_cell *prev =3D NULL;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/core/seq/seq_prioq.c:283:2: note: Loop condition is false.  Exitin=
g loop
           spin_lock_irqsave(&f->lock, flags);
           ^
   include/linux/spinlock.h:384:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:250:2: note: expanded from macro 'raw_spin_lock=
_irqsave'
           do {                                            \
           ^
   sound/core/seq/seq_prioq.c:283:2: note: Loop condition is false.  Exitin=
g loop
           spin_lock_irqsave(&f->lock, flags);
           ^
   include/linux/spinlock.h:382:43: note: expanded from macro 'spin_lock_ir=
qsave'
   #define spin_lock_irqsave(lock, flags)                          \
                                                                   ^
   sound/core/seq/seq_prioq.c:285:2: note: Loop condition is true.  Enterin=
g loop body
           while (cell) {
           ^
   sound/core/seq/seq_prioq.c:287:3: note: Taking true branch
                   if (prioq_match(cell, client, timestamp)) {
                   ^
   sound/core/seq/seq_prioq.c:289:8: note: 'cell' is equal to field 'head'
                           if (cell =3D=3D f->head) {
                               ^~~~
   sound/core/seq/seq_prioq.c:289:4: note: Taking true branch
                           if (cell =3D=3D f->head) {
                           ^
   sound/core/seq/seq_prioq.c:294:8: note: Assuming 'cell' is not equal to =
field 'tail'
                           if (cell =3D=3D f->tail)
                               ^~~~~~~~~~~~~~~
   sound/core/seq/seq_prioq.c:294:4: note: Taking false branch
                           if (cell =3D=3D f->tail)
                           ^
   sound/core/seq/seq_prioq.c:299:8: note: 'freefirst' is equal to NULL
                           if (freefirst =3D=3D NULL) {
                               ^~~~~~~~~
   sound/core/seq/seq_prioq.c:299:4: note: Taking true branch
                           if (freefirst =3D=3D NULL) {
                           ^
   sound/core/seq/seq_prioq.c:285:2: note: Loop condition is true.  Enterin=
g loop body
           while (cell) {
           ^
   sound/core/seq/seq_prioq.c:287:3: note: Taking true branch
                   if (prioq_match(cell, client, timestamp)) {
                   ^
   sound/core/seq/seq_prioq.c:289:8: note: 'cell' is equal to field 'head'
                           if (cell =3D=3D f->head) {
                               ^~~~
   sound/core/seq/seq_prioq.c:289:4: note: Taking true branch
                           if (cell =3D=3D f->head) {
                           ^
   sound/core/seq/seq_prioq.c:294:8: note: Assuming 'cell' is not equal to =
field 'tail'
                           if (cell =3D=3D f->tail)
--
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/usb/image/mdc800.c:274:17: warning: Value stored to 'dev' during=
 its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D &mdc800->dev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~
   drivers/usb/image/mdc800.c:274:17: note: Value stored to 'dev' during it=
s initialization is never read
           struct device *dev =3D &mdc800->dev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~
   drivers/usb/image/mdc800.c:634:2: warning: Value stored to 'retval' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           retval=3D0;
           ^      ~
   drivers/usb/image/mdc800.c:634:2: note: Value stored to 'retval' is neve=
r read
           retval=3D0;
           ^      ~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   drivers/usb/musb/musb_core.c:316:15: warning: Value stored to 'musb' dur=
ing its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct musb *musb =3D hw_ep->musb;
                        ^~~~   ~~~~~~~~~~~
   drivers/usb/musb/musb_core.c:316:15: note: Value stored to 'musb' during=
 its initialization is never read
           struct musb *musb =3D hw_ep->musb;
                        ^~~~   ~~~~~~~~~~~
   drivers/usb/musb/musb_core.c:360:15: warning: Value stored to 'musb' dur=
ing its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct musb *musb =3D hw_ep->musb;
                        ^~~~   ~~~~~~~~~~~
   drivers/usb/musb/musb_core.c:360:15: note: Value stored to 'musb' during=
 its initialization is never read
           struct musb *musb =3D hw_ep->musb;
                        ^~~~   ~~~~~~~~~~~
   drivers/usb/musb/musb_core.c:915:4: warning: Value stored to 'int_usb' i=
s never read [clang-analyzer-deadcode.DeadStores]
                           int_usb &=3D ~MUSB_INTR_SUSPEND;
                           ^          ~~~~~~~~~~~~~~~~~~
   drivers/usb/musb/musb_core.c:915:4: note: Value stored to 'int_usb' is n=
ever read
                           int_usb &=3D ~MUSB_INTR_SUSPEND;
                           ^          ~~~~~~~~~~~~~~~~~~
   drivers/usb/musb/musb_core.c:1606:2: warning: Call to function 'strcpy' =
is insecure as it does not provide bounding of the memory buffer. Replace u=
nbounded copy functions with analogous functions that support length argume=
nts such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(aInfo, (reg & MUSB_CONFIGDATA_UTMIDW) ? "UTMI-16" : "UTMI=
-8");
           ^~~~~~
   drivers/usb/musb/musb_core.c:1606:2: note: Call to function 'strcpy' is =
insecure as it does not provide bounding of the memory buffer. Replace unbo=
unded copy functions with analogous functions that support length arguments=
 such as 'strlcpy'. CWE-119
           strcpy(aInfo, (reg & MUSB_CONFIGDATA_UTMIDW) ? "UTMI-16" : "UTMI=
-8");
           ^~~~~~
   drivers/usb/musb/musb_core.c:1608:3: warning: Call to function 'strcat' =
is insecure as it does not provide bounding of the memory buffer. Replace u=
nbounded copy functions with analogous functions that support length argume=
nts such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcat(aInfo, ", dyn FIFOs");
                   ^~~~~~
   drivers/usb/musb/musb_core.c:1608:3: note: Call to function 'strcat' is =
insecure as it does not provide bounding of the memory buffer. Replace unbo=
unded copy functions with analogous functions that support length arguments=
 such as 'strlcat'. CWE-119
                   strcat(aInfo, ", dyn FIFOs");
                   ^~~~~~
   drivers/usb/musb/musb_core.c:1612:3: warning: Call to function 'strcat' =
is insecure as it does not provide bounding of the memory buffer. Replace u=
nbounded copy functions with analogous functions that support length argume=
nts such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcat(aInfo, ", bulk combine");
                   ^~~~~~
   drivers/usb/musb/musb_core.c:1612:3: note: Call to function 'strcat' is =
insecure as it does not provide bounding of the memory buffer. Replace unbo=
unded copy functions with analogous functions that support length arguments=
 such as 'strlcat'. CWE-119
                   strcat(aInfo, ", bulk combine");
                   ^~~~~~
   drivers/usb/musb/musb_core.c:1616:3: warning: Call to function 'strcat' =
is insecure as it does not provide bounding of the memory buffer. Replace u=
nbounded copy functions with analogous functions that support length argume=
nts such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcat(aInfo, ", bulk split");
                   ^~~~~~
   drivers/usb/musb/musb_core.c:1616:3: note: Call to function 'strcat' is =
insecure as it does not provide bounding of the memory buffer. Replace unbo=
unded copy functions with analogous functions that support length arguments=
 such as 'strlcat'. CWE-119
                   strcat(aInfo, ", bulk split");
                   ^~~~~~
   drivers/usb/musb/musb_core.c:1620:3: warning: Call to function 'strcat' =
is insecure as it does not provide bounding of the memory buffer. Replace u=
nbounded copy functions with analogous functions that support length argume=
nts such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcat(aInfo, ", HB-ISO Rx");
                   ^~~~~~
   drivers/usb/musb/musb_core.c:1620:3: note: Call to function 'strcat' is =
insecure as it does not provide bounding of the memory buffer. Replace unbo=
unded copy functions with analogous functions that support length arguments=
 such as 'strlcat'. CWE-119
                   strcat(aInfo, ", HB-ISO Rx");
                   ^~~~~~
   drivers/usb/musb/musb_core.c:1624:3: warning: Call to function 'strcat' =
is insecure as it does not provide bounding of the memory buffer. Replace u=
nbounded copy functions with analogous functions that support length argume=
nts such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcat(aInfo, ", HB-ISO Tx");
                   ^~~~~~
   drivers/usb/musb/musb_core.c:1624:3: note: Call to function 'strcat' is =
insecure as it does not provide bounding of the memory buffer. Replace unbo=
unded copy functions with analogous functions that support length arguments=
 such as 'strlcat'. CWE-119
                   strcat(aInfo, ", HB-ISO Tx");
                   ^~~~~~
   drivers/usb/musb/musb_core.c:1628:3: warning: Call to function 'strcat' =
is insecure as it does not provide bounding of the memory buffer. Replace u=
nbounded copy functions with analogous functions that support length argume=
nts such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcat(aInfo, ", SoftConn");
                   ^~~~~~
   drivers/usb/musb/musb_core.c:1628:3: note: Call to function 'strcat' is =
insecure as it does not provide bounding of the memory buffer. Replace unbo=
unded copy functions with analogous functions that support length arguments=
 such as 'strlcat'. CWE-119
                   strcat(aInfo, ", SoftConn");
                   ^~~~~~
   drivers/usb/musb/musb_core.c:1634:3: warning: Value stored to 'type' is =
never read [clang-analyzer-deadcode.DeadStores]
                   type =3D "M";
                   ^      ~~~
   drivers/usb/musb/musb_core.c:1634:3: note: Value stored to 'type' is nev=
er read
                   type =3D "M";
                   ^      ~~~
   drivers/usb/musb/musb_core.c:1637:3: warning: Value stored to 'type' is =
never read [clang-analyzer-deadcode.DeadStores]
                   type =3D "";
                   ^      ~~
   drivers/usb/musb/musb_core.c:1637:3: note: Value stored to 'type' is nev=
er read
                   type =3D "";
                   ^      ~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
>> drivers/staging/media/meson/vdec/codec_vp9.c:1422:2: warning: Use of mem=
ory after it is freed [clang-analyzer-unix.Malloc]
           list_for_each_entry_safe(tmp, n, &vp9->ref_frames_list, list) {
           ^
   include/linux/list.h:716:7: note: expanded from macro 'list_for_each_ent=
ry_safe'
                   n =3D list_next_entry(pos, member);                     =
  \
                       ^
   include/linux/list.h:555:2: note: expanded from macro 'list_next_entry'
           list_entry((pos)->member.next, typeof(*(pos)), member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:693:25: note: expanded from macro 'container_of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
                                  ^
   drivers/staging/media/meson/vdec/codec_vp9.c:2088:6: note: Assuming 'vp9=
' is non-null
           if (!vp9)
               ^~~~
   drivers/staging/media/meson/vdec/codec_vp9.c:2088:2: note: Taking false =
branch
           if (!vp9)
           ^
   drivers/staging/media/meson/vdec/codec_vp9.c:2092:6: note: Assuming 'dec=
_status' is equal to VP9_HEAD_PARSER_DONE
           if (dec_status !=3D VP9_HEAD_PARSER_DONE) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/meson/vdec/codec_vp9.c:2092:2: note: Taking false =
branch
           if (dec_status !=3D VP9_HEAD_PARSER_DONE) {
           ^
   drivers/staging/media/meson/vdec/codec_vp9.c:2099:2: note: Taking false =
branch
           pr_debug("ISR: %08X;%08X\n", dec_status, prob_status);
           ^
   include/linux/printk.h:430:2: note: expanded from macro 'pr_debug'
           no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:139:2: note: expanded from macro 'no_printk'
           if (0)                                          \
           ^
   drivers/staging/media/meson/vdec/codec_vp9.c:2102:6: note: Assuming the =
condition is false
           if ((prob_status & 0xff) =3D=3D 0xfd && vp9->cur_frame) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/meson/vdec/codec_vp9.c:2102:35: note: Left side of=
 '&&' is false
           if ((prob_status & 0xff) =3D=3D 0xfd && vp9->cur_frame) {
                                            ^
   drivers/staging/media/meson/vdec/codec_vp9.c:2127:2: note: Loop conditio=
n is true.  Entering loop body
           for (i =3D 0; i < REFS_PER_FRAME ; ++i)
           ^
   drivers/staging/media/meson/vdec/codec_vp9.c:2127:2: note: Loop conditio=
n is true.  Entering loop body
   drivers/staging/media/meson/vdec/codec_vp9.c:2127:2: note: Loop conditio=
n is true.  Entering loop body
   drivers/staging/media/meson/vdec/codec_vp9.c:2127:2: note: Loop conditio=
n is false. Execution continues on line 2130
   drivers/staging/media/meson/vdec/codec_vp9.c:2134:2: note: Taking false =
branch
           if (codec_vp9_process_rpm(vp9)) {
           ^
   drivers/staging/media/meson/vdec/codec_vp9.c:2151:2: note: Calling 'code=
c_vp9_process_frame'
           codec_vp9_process_frame(sess);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/meson/vdec/codec_vp9.c:1266:6: note: Assuming fiel=
d 'show_frame' is 0
           if (!param->p.show_frame)
               ^~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/meson/vdec/codec_vp9.c:1266:2: note: Taking true b=
ranch
           if (!param->p.show_frame)
           ^
   drivers/staging/media/meson/vdec/codec_vp9.c:1267:3: note: Calling 'code=
c_vp9_rm_noshow_frame'
                   codec_vp9_rm_noshow_frame(sess);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/meson/vdec/codec_vp9.c:1246:2: note: Left side of =
'&&' is false
           list_for_each_entry(tmp, &vp9->ref_frames_list, list) {
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
   include/linux/kernel.h:694:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/staging/media/meson/vdec/codec_vp9.c:1246:2: note: Taking false =
branch
           list_for_each_entry(tmp, &vp9->ref_frames_list, list) {
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
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:306:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/staging/media/meson/vdec/codec_vp9.c:1246:2: note: Loop conditio=
n is false.  Exiting loop
--
               ^~~~~~~~~
   drivers/mmc/host/mxcmmc.c:750:2: note: Taking false branch
           if (host->dma)
           ^
   drivers/mmc/host/mxcmmc.c:753:6: note: Assuming field 'data' is non-null
           if (req->data) {
               ^~~~~~~~~
   drivers/mmc/host/mxcmmc.c:753:2: note: Taking true branch
           if (req->data) {
           ^
   drivers/mmc/host/mxcmmc.c:754:11: note: Calling 'mxcmci_setup_data'
                   error =3D mxcmci_setup_data(host, req->data);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/mxcmmc.c:292:2: note: Calling 'mxcmci_writew'
           mxcmci_writew(host, nob, MMC_REG_NOB);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/mxcmmc.c:212:2: note: Taking false branch
           if (IS_ENABLED(CONFIG_PPC_MPC512x))
           ^
   drivers/mmc/host/mxcmmc.c:215:3: note: Loop condition is false.  Exiting=
 loop
                   writew(val, host->base + reg);
                   ^
   arch/arm/include/asm/io.h:306:25: note: expanded from macro 'writew'
   #define writew(v,c)             ({ __iowmb(); writew_relaxed(v,c); })
                                      ^
   arch/arm/include/asm/io.h:169:20: note: expanded from macro '__iowmb'
   #define __iowmb()               do { } while (0)
                                   ^
   drivers/mmc/host/mxcmmc.c:216:1: note: Returning without writing to 'hos=
t->do_dma', which participates in a condition later
   }
   ^
   drivers/mmc/host/mxcmmc.c:216:1: note: Returning without writing to 'hos=
t->dma'
   drivers/mmc/host/mxcmmc.c:292:2: note: Returning from 'mxcmci_writew'
           mxcmci_writew(host, nob, MMC_REG_NOB);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/mxcmmc.c:293:2: note: Calling 'mxcmci_writew'
           mxcmci_writew(host, blksz, MMC_REG_BLK_LEN);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/mxcmmc.c:212:2: note: Taking false branch
           if (IS_ENABLED(CONFIG_PPC_MPC512x))
           ^
   drivers/mmc/host/mxcmmc.c:215:3: note: Loop condition is false.  Exiting=
 loop
                   writew(val, host->base + reg);
                   ^
   arch/arm/include/asm/io.h:306:25: note: expanded from macro 'writew'
   #define writew(v,c)             ({ __iowmb(); writew_relaxed(v,c); })
                                      ^
   arch/arm/include/asm/io.h:169:20: note: expanded from macro '__iowmb'
   #define __iowmb()               do { } while (0)
                                   ^
   drivers/mmc/host/mxcmmc.c:216:1: note: Returning without writing to 'hos=
t->do_dma', which participates in a condition later
   }
   ^
   drivers/mmc/host/mxcmmc.c:216:1: note: Returning without writing to 'hos=
t->dma'
   drivers/mmc/host/mxcmmc.c:293:2: note: Returning from 'mxcmci_writew'
           mxcmci_writew(host, blksz, MMC_REG_BLK_LEN);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/mxcmmc.c:296:7: note: Calling 'mxcmci_use_dma'
           if (!mxcmci_use_dma(host))
                ^~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/mxcmmc.c:237:2: note: Returning without writing to 'hos=
t->do_dma', which participates in a condition later
           return host->do_dma;
           ^
   drivers/mmc/host/mxcmmc.c:237:2: note: Returning without writing to 'hos=
t->dma'
   drivers/mmc/host/mxcmmc.c:237:2: note: Returning value, which participat=
es in a condition later
           return host->do_dma;
           ^~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/mxcmmc.c:296:7: note: Returning from 'mxcmci_use_dma'
           if (!mxcmci_use_dma(host))
                ^~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/mxcmmc.c:296:6: note: Assuming the condition is false
           if (!mxcmci_use_dma(host))
               ^~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/mxcmmc.c:296:2: note: Taking false branch
           if (!mxcmci_use_dma(host))
           ^
   drivers/mmc/host/mxcmmc.c:299:42: note: Assuming 'i' is >=3D field 'sg_l=
en'
           for_each_sg(data->sg, sg, data->sg_len, i) {
                                                   ^
   include/linux/scatterlist.h:146:31: note: expanded from macro 'for_each_=
sg'
           for (__i =3D 0, sg =3D (sglist); __i < (nr); __i++, sg =3D sg_ne=
xt(sg))
                                        ^~~~~~~~~~
   drivers/mmc/host/mxcmmc.c:299:2: note: Loop condition is false. Executio=
n continues on line 306
           for_each_sg(data->sg, sg, data->sg_len, i) {
           ^
   include/linux/scatterlist.h:146:2: note: expanded from macro 'for_each_s=
g'
           for (__i =3D 0, sg =3D (sglist); __i < (nr); __i++, sg =3D sg_ne=
xt(sg))
           ^
   drivers/mmc/host/mxcmmc.c:306:6: note: Assuming the condition is true
           if (data->flags & MMC_DATA_READ) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/mxcmmc.c:306:2: note: Taking true branch
           if (data->flags & MMC_DATA_READ) {
           ^
   drivers/mmc/host/mxcmmc.c:316:21: note: Access to field 'device' results=
 in a dereference of a null pointer (loaded from field 'dma')
           nents =3D dma_map_sg(host->dma->device->dev, data->sg,
                              ^
   include/linux/dma-mapping.h:385:49: note: expanded from macro 'dma_map_s=
g'
   #define dma_map_sg(d, s, n, r) dma_map_sg_attrs(d, s, n, r, 0)
                                                   ^
>> drivers/mmc/host/mxcmmc.c:361:6: warning: Value stored to 'int_cntr' dur=
ing its initialization is never read [clang-analyzer-deadcode.DeadStores]
           u32 int_cntr =3D host->default_irq_mask;
               ^~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/mxcmmc.c:361:6: note: Value stored to 'int_cntr' during=
 its initialization is never read
           u32 int_cntr =3D host->default_irq_mask;
               ^~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   drivers/media/tuners/e4000.c:12:21: warning: Value stored to 'client' du=
ring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/tuners/e4000.c:12:21: note: Value stored to 'client' durin=
g its initialization is never read
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/tuners/e4000.c:80:21: warning: Value stored to 'client' du=
ring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/tuners/e4000.c:80:21: note: Value stored to 'client' durin=
g its initialization is never read
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/tuners/e4000.c:99:21: warning: Value stored to 'client' du=
ring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/tuners/e4000.c:99:21: note: Value stored to 'client' durin=
g its initialization is never read
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/tuners/e4000.c:298:21: warning: Value stored to 'client' d=
uring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/tuners/e4000.c:298:21: note: Value stored to 'client' duri=
ng its initialization is never read
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/tuners/e4000.c:313:21: warning: Value stored to 'client' d=
uring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/tuners/e4000.c:313:21: note: Value stored to 'client' duri=
ng its initialization is never read
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/tuners/e4000.c:322:21: warning: Value stored to 'client' d=
uring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/tuners/e4000.c:322:21: note: Value stored to 'client' duri=
ng its initialization is never read
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/tuners/e4000.c:333:21: warning: Value stored to 'client' d=
uring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/tuners/e4000.c:333:21: note: Value stored to 'client' duri=
ng its initialization is never read
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/tuners/e4000.c:347:21: warning: Value stored to 'client' d=
uring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/tuners/e4000.c:347:21: note: Value stored to 'client' duri=
ng its initialization is never read
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/tuners/e4000.c:377:21: warning: Value stored to 'client' d=
uring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/tuners/e4000.c:377:21: note: Value stored to 'client' duri=
ng its initialization is never read
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/tuners/e4000.c:413:21: warning: Value stored to 'client' d=
uring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/tuners/e4000.c:413:21: note: Value stored to 'client' duri=
ng its initialization is never read
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/tuners/e4000.c:445:21: warning: Value stored to 'client' d=
uring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/tuners/e4000.c:445:21: note: Value stored to 'client' duri=
ng its initialization is never read
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/tuners/e4000.c:484:21: warning: Value stored to 'client' d=
uring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/tuners/e4000.c:484:21: note: Value stored to 'client' duri=
ng its initialization is never read
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/tuners/e4000.c:503:21: warning: Value stored to 'client' d=
uring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/tuners/e4000.c:503:21: note: Value stored to 'client' duri=
ng its initialization is never read
           struct i2c_client *client =3D dev->client;
--
   drivers/usb/isp1760/isp1760-hcd.c:1621:7: note: Returning from 'last_qtd=
_of_urb'
                   if (last_qtd_of_urb(qtd, qh) &&
                       ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/isp1760/isp1760-hcd.c:1621:7: note: Left side of '&&' is true
   drivers/usb/isp1760/isp1760-hcd.c:1622:7: note: Assuming field 'status' =
is < QTD_XFER_COMPLETE
                                           (qtd->status >=3D QTD_XFER_COMPL=
ETE))
                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/isp1760/isp1760-hcd.c:1621:3: note: Taking false branch
                   if (last_qtd_of_urb(qtd, qh) &&
                   ^
   drivers/usb/isp1760/isp1760-hcd.c:1625:12: note: Field 'status' is equal=
 to QTD_XFER_STARTED
                   if (qtd->status =3D=3D QTD_XFER_STARTED)
                            ^
   drivers/usb/isp1760/isp1760-hcd.c:1625:3: note: Taking true branch
                   if (qtd->status =3D=3D QTD_XFER_STARTED)
                   ^
   drivers/usb/isp1760/isp1760-hcd.c:1626:4: note: Calling 'kill_transfer'
                           kill_transfer(hcd, urb, qh);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/isp1760/isp1760-hcd.c:1582:10: note: Assuming the condition =
is true
           WARN_ON(qh->slot =3D=3D -1);
                   ^
   include/asm-generic/bug.h:188:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   drivers/usb/isp1760/isp1760-hcd.c:1586:6: note: Assuming the condition i=
s false
           if (usb_pipecontrol(urb->pipe) || usb_pipebulk(urb->pipe)) {
               ^
   include/linux/usb.h:1942:32: note: expanded from macro 'usb_pipecontrol'
   #define usb_pipecontrol(pipe)   (usb_pipetype((pipe)) =3D=3D PIPE_CONTRO=
L)
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/usb.h:1939:28: note: expanded from macro 'usb_pipetype'
   #define usb_pipetype(pipe)      (((pipe) >> 30) & 3)
                                   ^
   drivers/usb/isp1760/isp1760-hcd.c:1586:6: note: Left side of '||' is fal=
se
           if (usb_pipecontrol(urb->pipe) || usb_pipebulk(urb->pipe)) {
               ^
   include/linux/usb.h:1942:31: note: expanded from macro 'usb_pipecontrol'
   #define usb_pipecontrol(pipe)   (usb_pipetype((pipe)) =3D=3D PIPE_CONTRO=
L)
                                   ^
   drivers/usb/isp1760/isp1760-hcd.c:1586:36: note: Assuming the condition =
is false
           if (usb_pipecontrol(urb->pipe) || usb_pipebulk(urb->pipe)) {
                                             ^
   include/linux/usb.h:1943:29: note: expanded from macro 'usb_pipebulk'
   #define usb_pipebulk(pipe)      (usb_pipetype((pipe)) =3D=3D PIPE_BULK)
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/usb.h:1939:28: note: expanded from macro 'usb_pipetype'
   #define usb_pipetype(pipe)      (((pipe) >> 30) & 3)
                                   ^
   drivers/usb/isp1760/isp1760-hcd.c:1586:2: note: Taking false branch
           if (usb_pipecontrol(urb->pipe) || usb_pipebulk(urb->pipe)) {
           ^
   drivers/usb/isp1760/isp1760-hcd.c:1594:18: note: The result of the left =
shift is undefined because the right operand is negative
                   skip_map |=3D (1 << qh->slot);
                                  ^  ~~~~~~~~
   drivers/usb/isp1760/isp1760-hcd.c:2096:42: warning: Although the value s=
tored to 'temp' is used in the enclosing expression, the value is never act=
ually read from 'temp' [clang-analyzer-deadcode.DeadStores]
           reg_write32(hcd->regs, HC_HW_MODE_CTRL, temp &=3D ~HW_GLOBAL_INT=
R_EN);
                                                   ^       ~~~~~~~~~~~~~~~~=
~~
   drivers/usb/isp1760/isp1760-hcd.c:2096:42: note: Although the value stor=
ed to 'temp' is used in the enclosing expression, the value is never actual=
ly read from 'temp'
           reg_write32(hcd->regs, HC_HW_MODE_CTRL, temp &=3D ~HW_GLOBAL_INT=
R_EN);
                                                   ^       ~~~~~~~~~~~~~~~~=
~~
   drivers/usb/isp1760/isp1760-hcd.c:2108:42: warning: Although the value s=
tored to 'temp' is used in the enclosing expression, the value is never act=
ually read from 'temp' [clang-analyzer-deadcode.DeadStores]
           reg_write32(hcd->regs, HC_HW_MODE_CTRL, temp &=3D ~HW_GLOBAL_INT=
R_EN);
                                                   ^       ~~~~~~~~~~~~~~~~=
~~
   drivers/usb/isp1760/isp1760-hcd.c:2108:42: note: Although the value stor=
ed to 'temp' is used in the enclosing expression, the value is never actual=
ly read from 'temp'
           reg_write32(hcd->regs, HC_HW_MODE_CTRL, temp &=3D ~HW_GLOBAL_INT=
R_EN);
                                                   ^       ~~~~~~~~~~~~~~~~=
~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/platform/chrome/cros_ec_i2c.c:91:2: warning: Value stored to 're=
t' is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D cros_ec_prepare_tx(ec_dev, msg);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/platform/chrome/cros_ec_i2c.c:91:2: note: Value stored to 'ret' =
is never read
           ret =3D cros_ec_prepare_tx(ec_dev, msg);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/mailbox/imx-mailbox.c:209:19: warning: The left operand of '>' i=
s a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           if (msg.hdr.size > sizeof(msg) / 4) {
               ~~~~~~~~~~~~ ^
   drivers/mailbox/imx-mailbox.c:209:19: note: The left operand of '>' is a=
 garbage value
           if (msg.hdr.size > sizeof(msg) / 4) {
               ~~~~~~~~~~~~ ^
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
>> sound/usb/quirks.c:591:3: warning: Value stored to 'config' is never rea=
d [clang-analyzer-deadcode.DeadStores]
                   config =3D dev->actconfig;
                   ^        ~~~~~~~~~~~~~~
   sound/usb/quirks.c:591:3: note: Value stored to 'config' is never read
                   config =3D dev->actconfig;
                   ^        ~~~~~~~~~~~~~~
   sound/usb/quirks.c:961:2: warning: Value stored to 'config' is never rea=
d [clang-analyzer-deadcode.DeadStores]
           config =3D dev->actconfig;
           ^        ~~~~~~~~~~~~~~
   sound/usb/quirks.c:961:2: note: Value stored to 'config' is never read
           config =3D dev->actconfig;
           ^        ~~~~~~~~~~~~~~
   1 warning generated.
   sound/usb/mixer_quirks.c:309:3: warning: Value stored to 'err' is never =
read [clang-analyzer-deadcode.DeadStores]
                   err =3D snd_usb_ctl_msg(chip->dev,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/usb/mixer_quirks.c:309:3: note: Value stored to 'err' is never read
                   err =3D snd_usb_ctl_msg(chip->dev,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~
   5 warnings generated.
   sound/usb/mixer_scarlett_gen2.c:895:4: warning: Value stored to 'j' is n=
ever read [clang-analyzer-deadcode.DeadStores]
                           j +=3D ports[port_type].num[SCARLETT2_PORT_OUT] -
                           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/usb/mixer_scarlett_gen2.c:895:4: note: Value stored to 'j' is neve=
r read
                           j +=3D ports[port_type].num[SCARLETT2_PORT_OUT] -
                           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/usb/mixer_scarlett_gen2.c:1424:9: warning: 5th function call argum=
ent is an uninitialized value [clang-analyzer-core.CallAndMessage]
                   err =3D scarlett2_add_new_ctl(mixer, &scarlett2_button_c=
tl,
                         ^
   sound/usb/mixer_scarlett_gen2.c:2007:6: note: Assuming field 'protocol' =
is not equal to 0
           if (!mixer->protocol)
               ^~~~~~~~~~~~~~~~
   sound/usb/mixer_scarlett_gen2.c:2007:2: note: Taking false branch
           if (!mixer->protocol)
           ^
   sound/usb/mixer_scarlett_gen2.c:2010:2: note: Control jumps to 'case 305=
496577:'  at line 2017
           switch (mixer->chip->usb_id) {
           ^
   sound/usb/mixer_scarlett_gen2.c:2019:3: note:  Execution continues on li=
ne 2024
                   break;
                   ^
   sound/usb/mixer_scarlett_gen2.c:2024:6: note: Assuming the condition is =
false
           if (!(mixer->chip->setup & SCARLETT2_ENABLE)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/usb/mixer_scarlett_gen2.c:2024:2: note: Taking false branch
           if (!(mixer->chip->setup & SCARLETT2_ENABLE)) {
           ^
   sound/usb/mixer_scarlett_gen2.c:2034:6: note: 'err' is >=3D 0
           if (err < 0)
               ^~~
   sound/usb/mixer_scarlett_gen2.c:2034:2: note: Taking false branch
           if (err < 0)
           ^
   sound/usb/mixer_scarlett_gen2.c:2039:6: note: Assuming 'err' is >=3D 0
           if (err < 0)
               ^~~~~~~
   sound/usb/mixer_scarlett_gen2.c:2039:2: note: Taking false branch
           if (err < 0)
           ^
   sound/usb/mixer_scarlett_gen2.c:2043:8: note: Calling 'scarlett2_add_lin=
e_out_ctls'
           err =3D scarlett2_add_line_out_ctls(mixer);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/usb/mixer_scarlett_gen2.c:1377:6: note: Assuming field 'line_out_h=
w_vol' is 0
           if (info->line_out_hw_vol) {
               ^~~~~~~~~~~~~~~~~~~~~
   sound/usb/mixer_scarlett_gen2.c:1377:2: note: Taking false branch
           if (info->line_out_hw_vol) {
           ^
   sound/usb/mixer_scarlett_gen2.c:1387:14: note: Assuming 'i' is >=3D 'num=
_line_out'
           for (i =3D 0; i < num_line_out; i++) {
                       ^~~~~~~~~~~~~~~~
   sound/usb/mixer_scarlett_gen2.c:1387:2: note: Loop condition is false. E=
xecution continues on line 1423
           for (i =3D 0; i < num_line_out; i++) {
           ^
   sound/usb/mixer_scarlett_gen2.c:1423:14: note: Assuming 'i' is < field '=
button_count'
           for (i =3D 0; i < private->info->button_count; i++) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/usb/mixer_scarlett_gen2.c:1423:2: note: Loop condition is true.  E=
ntering loop body
           for (i =3D 0; i < private->info->button_count; i++) {
           ^
   sound/usb/mixer_scarlett_gen2.c:1427:7: note: 'err' is >=3D 0
                   if (err < 0)
                       ^~~
   sound/usb/mixer_scarlett_gen2.c:1427:3: note: Taking false branch
                   if (err < 0)
                   ^
   sound/usb/mixer_scarlett_gen2.c:1423:14: note: Assuming 'i' is < field '=
button_count'
           for (i =3D 0; i < private->info->button_count; i++) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/usb/mixer_scarlett_gen2.c:1423:2: note: Loop condition is true.  E=
ntering loop body
           for (i =3D 0; i < private->info->button_count; i++) {
           ^
   sound/usb/mixer_scarlett_gen2.c:1427:7: note: 'err' is >=3D 0
                   if (err < 0)
                       ^~~
   sound/usb/mixer_scarlett_gen2.c:1427:3: note: Taking false branch
                   if (err < 0)
                   ^
   sound/usb/mixer_scarlett_gen2.c:1423:47: note: The value 2 is assigned t=
o 'i'
           for (i =3D 0; i < private->info->button_count; i++) {
                                                        ^~~
--
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (1 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
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
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   sound/firewire/oxfw/oxfw.c:104:2: warning: Call to function 'strcpy' is =
insecure as it does not provide bounding of the memory buffer. Replace unbo=
unded copy functions with analogous functions that support length arguments=
 such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(oxfw->card->driver, d);
           ^~~~~~
   sound/firewire/oxfw/oxfw.c:104:2: note: Call to function 'strcpy' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcpy'. CWE-119
           strcpy(oxfw->card->driver, d);
           ^~~~~~
   sound/firewire/oxfw/oxfw.c:105:2: warning: Call to function 'strcpy' is =
insecure as it does not provide bounding of the memory buffer. Replace unbo=
unded copy functions with analogous functions that support length arguments=
 such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(oxfw->card->mixername, m);
           ^~~~~~
   sound/firewire/oxfw/oxfw.c:105:2: note: Call to function 'strcpy' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcpy'. CWE-119
           strcpy(oxfw->card->mixername, m);
           ^~~~~~
   sound/firewire/oxfw/oxfw.c:106:2: warning: Call to function 'strcpy' is =
insecure as it does not provide bounding of the memory buffer. Replace unbo=
unded copy functions with analogous functions that support length arguments=
 such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(oxfw->card->shortname, m);
           ^~~~~~
   sound/firewire/oxfw/oxfw.c:106:2: note: Call to function 'strcpy' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcpy'. CWE-119
           strcpy(oxfw->card->shortname, m);
           ^~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
>> sound/usb/hiface/pcm.c:232:19: warning: Value stored to 'device' during =
its initialization is never read [clang-analyzer-deadcode.DeadStores]
                           struct device *device =3D &rt->chip->dev->dev;
                                          ^~~~~~   ~~~~~~~~~~~~~~~~~~~
   sound/usb/hiface/pcm.c:232:19: note: Value stored to 'device' during its=
 initialization is never read
                           struct device *device =3D &rt->chip->dev->dev;
                                          ^~~~~~   ~~~~~~~~~~~~~~~~~~~
   sound/usb/hiface/pcm.c:258:17: warning: Value stored to 'device' during =
its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *device =3D &urb->chip->dev->dev;
                          ^~~~~~   ~~~~~~~~~~~~~~~~~~~~
   sound/usb/hiface/pcm.c:258:17: note: Value stored to 'device' during its=
 initialization is never read
           struct device *device =3D &urb->chip->dev->dev;
                          ^~~~~~   ~~~~~~~~~~~~~~~~~~~~
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   sound/usb/line6/driver.c:763:2: warning: Call to function 'strcpy' is in=
secure as it does not provide bounding of the memory buffer. Replace unboun=
ded copy functions with analogous functions that support length arguments s=
uch as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(card->id, properties->id);
           ^~~~~~
   sound/usb/line6/driver.c:763:2: note: Call to function 'strcpy' is insec=
ure as it does not provide bounding of the memory buffer. Replace unbounded=
 copy functions with analogous functions that support length arguments such=
 as 'strlcpy'. CWE-119
           strcpy(card->id, properties->id);
           ^~~~~~
   sound/usb/line6/driver.c:764:2: warning: Call to function 'strcpy' is in=
secure as it does not provide bounding of the memory buffer. Replace unboun=
ded copy functions with analogous functions that support length arguments s=
uch as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(card->driver, driver_name);
           ^~~~~~
   sound/usb/line6/driver.c:764:2: note: Call to function 'strcpy' is insec=
ure as it does not provide bounding of the memory buffer. Replace unbounded=
 copy functions with analogous functions that support length arguments such=
 as 'strlcpy'. CWE-119
           strcpy(card->driver, driver_name);
           ^~~~~~
   sound/usb/line6/driver.c:765:2: warning: Call to function 'strcpy' is in=
secure as it does not provide bounding of the memory buffer. Replace unboun=
ded copy functions with analogous functions that support length arguments s=
uch as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(card->shortname, properties->name);
           ^~~~~~
   sound/usb/line6/driver.c:765:2: note: Call to function 'strcpy' is insec=
ure as it does not provide bounding of the memory buffer. Replace unbounded=
 copy functions with analogous functions that support length arguments such=
 as 'strlcpy'. CWE-119
           strcpy(card->shortname, properties->name);
           ^~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/base/dd.c:672:2: warning: Value stored to 'calltime' is never re=
ad [clang-analyzer-deadcode.DeadStores]
           calltime =3D ktime_get();
           ^          ~~~~~~~~~~~
   drivers/base/dd.c:672:2: note: Value stored to 'calltime' is never read
           calltime =3D ktime_get();
           ^          ~~~~~~~~~~~
   drivers/base/dd.c:674:2: warning: Value stored to 'rettime' is never rea=
d [clang-analyzer-deadcode.DeadStores]
           rettime =3D ktime_get();
           ^         ~~~~~~~~~~~
   drivers/base/dd.c:674:2: note: Value stored to 'rettime' is never read
           rettime =3D ktime_get();
           ^         ~~~~~~~~~~~
   drivers/base/dd.c:1042:3: warning: Value stored to 'ret' is never read [=
clang-analyzer-deadcode.DeadStores]
                   ret =3D driver_probe_device(drv, dev);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/base/dd.c:1042:3: note: Value stored to 'ret' is never read
                   ret =3D driver_probe_device(drv, dev);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/base/platform.c:596:3: warning: Call to function 'strcpy' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(pa->name, name);
                   ^~~~~~
   drivers/base/platform.c:596:3: note: Call to function 'strcpy' is insecu=
re as it does not provide bounding of the memory buffer. Replace unbounded =
copy functions with analogous functions that support length arguments such =
as 'strlcpy'. CWE-119
                   strcpy(pa->name, name);
                   ^~~~~~
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
>> drivers/staging/media/meson/vdec/vdec.c:720:17: warning: Value stored to=
 'dev' during its initialization is never read [clang-analyzer-deadcode.Dea=
dStores]
           struct device *dev =3D sess->core->dev;
                          ^~~   ~~~~~~~~~~~~~~~
   drivers/staging/media/meson/vdec/vdec.c:720:17: note: Value stored to 'd=
ev' during its initialization is never read
           struct device *dev =3D sess->core->dev;
                          ^~~   ~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/staging/media/meson/vdec/vdec_helpers.c:186:6: warning: Value st=
ored to 'reg_cur' during its initialization is never read [clang-analyzer-d=
eadcode.DeadStores]
           u32 reg_cur =3D reg_base[0];
               ^~~~~~~   ~~~~~~~~~~~
   drivers/staging/media/meson/vdec/vdec_helpers.c:186:6: note: Value store=
d to 'reg_cur' during its initialization is never read
           u32 reg_cur =3D reg_base[0];
               ^~~~~~~   ~~~~~~~~~~~
>> drivers/staging/media/meson/vdec/vdec_helpers.c:274:17: warning: Value s=
tored to 'dev' during its initialization is never read [clang-analyzer-dead=
code.DeadStores]
           struct device *dev =3D sess->core->dev_dec;
                          ^~~   ~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/meson/vdec/vdec_helpers.c:274:17: note: Value stor=
ed to 'dev' during its initialization is never read
           struct device *dev =3D sess->core->dev_dec;
                          ^~~   ~~~~~~~~~~~~~~~~~~~
   7 warnings generated.
   drivers/media/tuners/mt20xx.c:253:2: warning: Value stored to 'ret' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           ret=3Dtuner_i2c_xfer_send(&priv->i2c_props,buf,1);
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/tuners/mt20xx.c:253:2: note: Value stored to 'ret' is neve=
r read
           ret=3Dtuner_i2c_xfer_send(&priv->i2c_props,buf,1);
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/tuners/mt20xx.c:263:2: warning: Value stored to 'ret' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           ret=3Dtuner_i2c_xfer_send(&priv->i2c_props,buf,4);
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/tuners/mt20xx.c:263:2: note: Value stored to 'ret' is neve=
r read
           ret=3Dtuner_i2c_xfer_send(&priv->i2c_props,buf,4);
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/tuners/mt20xx.c:265:2: warning: Value stored to 'ret' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           ret=3Dtuner_i2c_xfer_send(&priv->i2c_props,buf+5,4);
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/tuners/mt20xx.c:265:2: note: Value stored to 'ret' is neve=
r read
           ret=3Dtuner_i2c_xfer_send(&priv->i2c_props,buf+5,4);
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/tuners/mt20xx.c:383:2: warning: Value stored to 'ret' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           ret=3Dtuner_i2c_xfer_send(&priv->i2c_props,buf+1,4);
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/tuners/mt20xx.c:383:2: note: Value stored to 'ret' is neve=
r read
           ret=3Dtuner_i2c_xfer_send(&priv->i2c_props,buf+1,4);
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/tuners/mt20xx.c:391:2: warning: Value stored to 'ret' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           ret=3Dtuner_i2c_xfer_send(&priv->i2c_props,buf+5,6);
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/tuners/mt20xx.c:391:2: note: Value stored to 'ret' is neve=
r read
           ret=3Dtuner_i2c_xfer_send(&priv->i2c_props,buf+5,6);
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/tuners/mt20xx.c:395:2: warning: Value stored to 'ret' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           ret=3Dtuner_i2c_xfer_send(&priv->i2c_props,buf+12,2);
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/tuners/mt20xx.c:395:2: note: Value stored to 'ret' is neve=
r read
           ret=3Dtuner_i2c_xfer_send(&priv->i2c_props,buf+12,2);
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/usb/core/message.c:1703:2: warning: Value stored to 'retval' is =
never read [clang-analyzer-deadcode.DeadStores]
           retval =3D 0;
           ^        ~
   drivers/usb/core/message.c:1703:2: note: Value stored to 'retval' is nev=
er read
           retval =3D 0;
           ^        ~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/usb/core/driver.c:1679:2: warning: Value stored to 'status' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           status =3D pm_runtime_put_sync_autosuspend(&udev->dev);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/core/driver.c:1679:2: note: Value stored to 'status' is neve=
r read
           status =3D pm_runtime_put_sync_autosuspend(&udev->dev);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/core/driver.c:1741:2: warning: Value stored to 'status' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           status =3D pm_runtime_put_sync(&intf->dev);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/core/driver.c:1741:2: note: Value stored to 'status' is neve=
r read
           status =3D pm_runtime_put_sync(&intf->dev);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/core/driver.c:1769:2: warning: Value stored to 'status' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           status =3D pm_runtime_put(&intf->dev);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/core/driver.c:1769:2: note: Value stored to 'status' is neve=
r read
           status =3D pm_runtime_put(&intf->dev);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/usb/core/file.c:160:6: warning: Value stored to 'minor_base' dur=
ing its initialization is never read [clang-analyzer-deadcode.DeadStores]
           int minor_base =3D class_driver->minor_base;
               ^~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/core/file.c:160:6: note: Value stored to 'minor_base' during=
 its initialization is never read
           int minor_base =3D class_driver->minor_base;
               ^~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   sound/firewire/fireface/ff.c:31:2: warning: Call to function 'strcpy' is=
 insecure as it does not provide bounding of the memory buffer. Replace unb=
ounded copy functions with analogous functions that support length argument=
s such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(ff->card->shortname, name);
           ^~~~~~
   sound/firewire/fireface/ff.c:31:2: note: Call to function 'strcpy' is in=
secure as it does not provide bounding of the memory buffer. Replace unboun=
ded copy functions with analogous functions that support length arguments s=
uch as 'strlcpy'. CWE-119
           strcpy(ff->card->shortname, name);
           ^~~~~~
   sound/firewire/fireface/ff.c:32:2: warning: Call to function 'strcpy' is=
 insecure as it does not provide bounding of the memory buffer. Replace unb=
ounded copy functions with analogous functions that support length argument=
s such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(ff->card->mixername, name);
           ^~~~~~
   sound/firewire/fireface/ff.c:32:2: note: Call to function 'strcpy' is in=
secure as it does not provide bounding of the memory buffer. Replace unboun=
ded copy functions with analogous functions that support length arguments s=
uch as 'strlcpy'. CWE-119
           strcpy(ff->card->mixername, name);
           ^~~~~~
--
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
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   sound/firewire/fireface/ff-hwdep.c:183:2: warning: Call to function 'str=
cpy' is insecure as it does not provide bounding of the memory buffer. Repl=
ace unbounded copy functions with analogous functions that support length a=
rguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.st=
rcpy]
           strcpy(hwdep->name, ff->card->driver);
           ^~~~~~
   sound/firewire/fireface/ff-hwdep.c:183:2: note: Call to function 'strcpy=
' is insecure as it does not provide bounding of the memory buffer. Replace=
 unbounded copy functions with analogous functions that support length argu=
ments such as 'strlcpy'. CWE-119
           strcpy(hwdep->name, ff->card->driver);
           ^~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/media/tuners/tda18271-fe.c:473:2: warning: Value stored to 'bcal=
' is never read [clang-analyzer-deadcode.DeadStores]
           bcal =3D 0;
           ^      ~
   drivers/media/tuners/tda18271-fe.c:473:2: note: Value stored to 'bcal' i=
s never read
           bcal =3D 0;
           ^      ~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
>> drivers/staging/media/tegra-video/vi.c:1685:19: warning: Value stored to=
 'vi' during its initialization is never read [clang-analyzer-deadcode.Dead=
Stores]
           struct tegra_vi *vi =3D host1x_client_to_vi(client);
                            ^~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/tegra-video/vi.c:1685:19: note: Value stored to 'v=
i' during its initialization is never read
           struct tegra_vi *vi =3D host1x_client_to_vi(client);
                            ^~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   crypto/tcrypt.c:292:2: warning: Value stored to 'ret' is never read [cla=
ng-analyzer-deadcode.DeadStores]
           ret =3D crypto_aead_setauthsize(tfm, authsize);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/tcrypt.c:292:2: note: Value stored to 'ret' is never read
           ret =3D crypto_aead_setauthsize(tfm, authsize);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/tcrypt.c:614:4: warning: Value stored to 'ret' is never read [cla=
ng-analyzer-deadcode.DeadStores]
                           ret =3D crypto_aead_setkey(tfm, key, *keysize);
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/tcrypt.c:614:4: note: Value stored to 'ret' is never read
                           ret =3D crypto_aead_setkey(tfm, key, *keysize);
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   sound/firewire/oxfw/oxfw-pcm.c:443:2: warning: Call to function 'strcpy'=
 is insecure as it does not provide bounding of the memory buffer. Replace =
unbounded copy functions with analogous functions that support length argum=
ents such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(pcm->name, oxfw->card->shortname);
           ^~~~~~
   sound/firewire/oxfw/oxfw-pcm.c:443:2: note: Call to function 'strcpy' is=
 insecure as it does not provide bounding of the memory buffer. Replace unb=
ounded copy functions with analogous functions that support length argument=
s such as 'strlcpy'. CWE-119
           strcpy(pcm->name, oxfw->card->shortname);
           ^~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   sound/firewire/oxfw/oxfw-hwdep.c:182:2: warning: Call to function 'strcp=
y' is insecure as it does not provide bounding of the memory buffer. Replac=
e unbounded copy functions with analogous functions that support length arg=
uments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strc=
py]
           strcpy(hwdep->name, oxfw->card->driver);
           ^~~~~~
   sound/firewire/oxfw/oxfw-hwdep.c:182:2: note: Call to function 'strcpy' =
is insecure as it does not provide bounding of the memory buffer. Replace u=
nbounded copy functions with analogous functions that support length argume=
nts such as 'strlcpy'. CWE-119
           strcpy(hwdep->name, oxfw->card->driver);
           ^~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
>> drivers/staging/media/imx/imx-media-dev-common.c:27:24: warning: Value s=
tored to 'imxmd' during its initialization is never read [clang-analyzer-de=
adcode.DeadStores]
           struct imx_media_dev *imxmd =3D notifier2dev(notifier);
                                 ^~~~~   ~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/imx/imx-media-dev-common.c:27:24: note: Value stor=
ed to 'imxmd' during its initialization is never read
           struct imx_media_dev *imxmd =3D notifier2dev(notifier);
                                 ^~~~~   ~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/siox/siox-core.c:240:4: warning: Value stored to 'status' is nev=
er read [clang-analyzer-deadcode.DeadStores]
                           status &=3D ~SIOX_STATUS_WDG;
                           ^         ~~~~~~~~~~~~~~~~
   drivers/siox/siox-core.c:240:4: note: Value stored to 'status' is never =
read
                           status &=3D ~SIOX_STATUS_WDG;
                           ^         ~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   sound/usb/line6/toneport.c:202:2: warning: Call to function 'strcpy' is =
insecure as it does not provide bounding of the memory buffer. Replace unbo=
unded copy functions with analogous functions that support length arguments=
 such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(uinfo->value.enumerated.name,
           ^~~~~~
   sound/usb/line6/toneport.c:202:2: note: Call to function 'strcpy' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcpy'. CWE-119
           strcpy(uinfo->value.enumerated.name,
           ^~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (2 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.

vim +/dev +229 drivers/gpu/drm/tegra/hub.c

c4755fb9064f640 Thierry Reding 2017-11-13  225  =

c4755fb9064f640 Thierry Reding 2017-11-13  226  static bool tegra_dc_owns_s=
hared_plane(struct tegra_dc *dc,
1087fac18b8e3ec Thierry Reding 2017-12-14  227  				       struct tegra_pla=
ne *plane)
c4755fb9064f640 Thierry Reding 2017-11-13  228  {
c4755fb9064f640 Thierry Reding 2017-11-13 @229  	struct device *dev =3D dc-=
>dev;
c4755fb9064f640 Thierry Reding 2017-11-13  230  =

c4755fb9064f640 Thierry Reding 2017-11-13  231  	if (tegra_shared_plane_get=
_owner(plane, dc) =3D=3D dc->pipe) {
c4755fb9064f640 Thierry Reding 2017-11-13  232  		if (plane->dc =3D=3D dc)
c4755fb9064f640 Thierry Reding 2017-11-13  233  			return true;
c4755fb9064f640 Thierry Reding 2017-11-13  234  =

c4755fb9064f640 Thierry Reding 2017-11-13  235  		dev_WARN(dev, "head %u ow=
ns window %u but is not attached\n",
1087fac18b8e3ec Thierry Reding 2017-12-14  236  			 dc->pipe, plane->index);
c4755fb9064f640 Thierry Reding 2017-11-13  237  	}
c4755fb9064f640 Thierry Reding 2017-11-13  238  =

c4755fb9064f640 Thierry Reding 2017-11-13  239  	return false;
c4755fb9064f640 Thierry Reding 2017-11-13  240  }
c4755fb9064f640 Thierry Reding 2017-11-13  241  =


:::::: The code at line 229 was first introduced by commit
:::::: c4755fb9064f64083fe559e92a46df817fc5e07b drm/tegra: Add Tegra186 dis=
play hub support

:::::: TO: Thierry Reding <treding@nvidia.com>
:::::: CC: Thierry Reding <treding@nvidia.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4489823830374338920==--

