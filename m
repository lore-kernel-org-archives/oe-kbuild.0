Content-Type: multipart/mixed; boundary="===============0045769231008616204=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/media/platform/renesas/sh_vou.c:371:24: warning: Value stored to 'vou_dev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Thu, 05 May 2022 02:25:15 +0800
Message-ID: <202205050256.Cjt0rDwS-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0045769231008616204==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media(a)vger.kernel.org
CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   107c948d1d3e61d10aee9d0f7c3d81bbee9842af
commit: ee4a77a32b39064fdab0aa2b36bbd35ebf57e077 media: platform: place Ren=
esas drivers on a separate dir
date:   7 weeks ago
:::::: branch date: 20 hours ago
:::::: commit date: 7 weeks ago
config: arm-randconfig-c002-20220427 (https://download.01.org/0day-ci/archi=
ve/20220505/202205050256.Cjt0rDwS-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 1cddcf=
dc3c683b393df1a5c9063252eb60e52818)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dee4a77a32b39064fdab0aa2b36bbd35ebf57e077
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout ee4a77a32b39064fdab0aa2b36bbd35ebf57e077
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   drivers/nvmem/core.c:1601:8: note: Returning from 'nvmem_cell_read'
           buf =3D nvmem_cell_read(cell, &len);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvmem/core.c:1602:2: note: Taking false branch
           if (IS_ERR(buf)) {
           ^
   drivers/nvmem/core.c:1606:10: note: The left operand of '!=3D' is a garb=
age value
           if (len !=3D count) {
               ~~~ ^
   drivers/nvmem/core.c:1703:11: warning: The left operand of '>' is a garb=
age value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           if (*len > max_len) {
                    ^
   drivers/nvmem/core.c:1754:2: note: 'len' declared without an initial val=
ue
           size_t len;
           ^~~~~~~~~~
   drivers/nvmem/core.c:1758:8: note: Calling 'nvmem_cell_read_variable_com=
mon'
           buf =3D nvmem_cell_read_variable_common(dev, cell_id, sizeof(*va=
l), &len);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   drivers/nvmem/core.c:1687:2: note: Taking false branch
           if (IS_ERR(cell))
           ^
   drivers/nvmem/core.c:1691:8: note: Calling 'nvmem_cell_read'
           buf =3D nvmem_cell_read(cell, len);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvmem/core.c:1477:6: note: Assuming 'nvmem' is non-null
           if (!nvmem)
               ^~~~~~
   drivers/nvmem/core.c:1477:2: note: Taking false branch
           if (!nvmem)
           ^
   drivers/nvmem/core.c:1481:6: note: Assuming 'buf' is non-null
           if (!buf)
               ^~~~
   drivers/nvmem/core.c:1481:2: note: Taking false branch
           if (!buf)
           ^
   drivers/nvmem/core.c:1484:7: note: Calling '__nvmem_cell_read'
           rc =3D __nvmem_cell_read(nvmem, cell->entry, buf, len, cell->id);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvmem/core.c:1441:6: note: Assuming 'rc' is not equal to 0
           if (rc)
               ^~
   drivers/nvmem/core.c:1441:2: note: Taking true branch
           if (rc)
           ^
   drivers/nvmem/core.c:1484:7: note: Returning from '__nvmem_cell_read'
           rc =3D __nvmem_cell_read(nvmem, cell->entry, buf, len, cell->id);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvmem/core.c:1485:6: note: 'rc' is not equal to 0
           if (rc) {
               ^~
   drivers/nvmem/core.c:1485:2: note: Taking true branch
           if (rc) {
           ^
   drivers/nvmem/core.c:1691:8: note: Returning from 'nvmem_cell_read'
           buf =3D nvmem_cell_read(cell, len);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvmem/core.c:1693:2: note: Taking false branch
           if (IS_ERR(buf))
           ^
   drivers/nvmem/core.c:1700:6: note: Assuming 'nbits' is 0
           if (nbits)
               ^~~~~
   drivers/nvmem/core.c:1700:2: note: Taking false branch
           if (nbits)
           ^
   drivers/nvmem/core.c:1703:11: note: The left operand of '>' is a garbage=
 value
           if (*len > max_len) {
               ~~~~ ^
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   2 warnings generated.
   drivers/media/platform/qcom/venus/venc.c:877:3: warning: Value stored to=
 'ret' is never read [clang-analyzer-deadcode.DeadStores]
                   ret =3D hfi_session_set_property(inst, ptype, &en);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/venus/venc.c:877:3: note: Value stored to 'r=
et' is never read
                   ret =3D hfi_session_set_property(inst, ptype, &en);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   2 warnings generated.
   drivers/media/platform/renesas/rcar_jpu.c:1551:17: warning: Value stored=
 to 'error' during its initialization is never read [clang-analyzer-deadcod=
e.DeadStores]
                   unsigned char error =3D jpu_read(jpu, JCDERR) & JCDERR_M=
ASK;
                                 ^~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/renesas/rcar_jpu.c:1551:17: note: Value stored to=
 'error' during its initialization is never read
                   unsigned char error =3D jpu_read(jpu, JCDERR) & JCDERR_M=
ASK;
                                 ^~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 with check filters).
   5 warnings generated.
>> drivers/media/platform/renesas/sh_vou.c:371:24: warning: Value stored to=
 'vou_dev' during its initialization is never read [clang-analyzer-deadcode=
.DeadStores]
           struct sh_vou_device *vou_dev =3D video_drvdata(file);
                                 ^~~~~~~   ~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/renesas/sh_vou.c:371:24: note: Value stored to 'v=
ou_dev' during its initialization is never read
           struct sh_vou_device *vou_dev =3D video_drvdata(file);
                                 ^~~~~~~   ~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/renesas/sh_vou.c:385:24: warning: Value stored to=
 'vou_dev' during its initialization is never read [clang-analyzer-deadcode=
.DeadStores]
           struct sh_vou_device *vou_dev =3D video_drvdata(file);
                                 ^~~~~~~   ~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/renesas/sh_vou.c:385:24: note: Value stored to 'v=
ou_dev' during its initialization is never read
           struct sh_vou_device *vou_dev =3D video_drvdata(file);
                                 ^~~~~~~   ~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/renesas/sh_vou.c:483:23: warning: The right opera=
nd of '|' is a garbage value due to array index out of bounds [clang-analyz=
er-core.UndefinedBinaryOperatorResult]
                   vouvcr |=3D (1 << 14) | vou_scale_v_fld[h_idx - 1];
                                       ^
   drivers/media/platform/renesas/sh_vou.c:1234:6: note: Assuming 'vou_pdat=
a' is non-null
           if (!vou_pdata || !reg_res || irq <=3D 0) {
               ^~~~~~~~~~
   drivers/media/platform/renesas/sh_vou.c:1234:6: note: Left side of '||' =
is false
   drivers/media/platform/renesas/sh_vou.c:1234:20: note: Assuming 'reg_res=
' is non-null
           if (!vou_pdata || !reg_res || irq <=3D 0) {
                             ^~~~~~~~
   drivers/media/platform/renesas/sh_vou.c:1234:6: note: Left side of '||' =
is false
           if (!vou_pdata || !reg_res || irq <=3D 0) {
               ^
   drivers/media/platform/renesas/sh_vou.c:1234:32: note: Assuming 'irq' is=
 > 0
           if (!vou_pdata || !reg_res || irq <=3D 0) {
                                         ^~~~~~~~
   drivers/media/platform/renesas/sh_vou.c:1234:2: note: Taking false branch
           if (!vou_pdata || !reg_res || irq <=3D 0) {
           ^
   drivers/media/platform/renesas/sh_vou.c:1240:6: note: Assuming 'vou_dev'=
 is non-null
           if (!vou_dev)
               ^~~~~~~~
   drivers/media/platform/renesas/sh_vou.c:1240:2: note: Taking false branch
           if (!vou_dev)
           ^
   drivers/media/platform/renesas/sh_vou.c:1244:2: note: Loop condition is =
false.  Exiting loop
           spin_lock_init(&vou_dev->lock);
           ^
   include/linux/spinlock.h:339:34: note: expanded from macro 'spin_lock_in=
it'
   # define spin_lock_init(_lock)                  \
                                                   ^
   drivers/media/platform/renesas/sh_vou.c:1245:2: note: Loop condition is =
false.  Exiting loop
           mutex_init(&vou_dev->fop_lock);
           ^
   include/linux/mutex.h:101:32: note: expanded from macro 'mutex_init'
   #define mutex_init(mutex)                                               \
                                                                           ^
   drivers/media/platform/renesas/sh_vou.c:1268:2: note: Taking false branch
           if (IS_ERR(vou_dev->base))
           ^
   drivers/media/platform/renesas/sh_vou.c:1272:6: note: Assuming 'ret' is =
>=3D 0
           if (ret < 0)
               ^~~~~~~
   drivers/media/platform/renesas/sh_vou.c:1272:2: note: Taking false branch
           if (ret < 0)
           ^
   drivers/media/platform/renesas/sh_vou.c:1276:6: note: Assuming 'ret' is =
>=3D 0
           if (ret < 0) {
               ^~~~~~~
   drivers/media/platform/renesas/sh_vou.c:1276:2: note: Taking false branch
           if (ret < 0) {
           ^
   drivers/media/platform/renesas/sh_vou.c:1283:6: note: Assuming field 'bu=
s_fmt' is not equal to SH_VOU_BUS_8BIT
           if (vou_pdata->bus_fmt =3D=3D SH_VOU_BUS_8BIT)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/renesas/sh_vou.c:1283:2: note: Taking false branch
           if (vou_pdata->bus_fmt =3D=3D SH_VOU_BUS_8BIT)
           ^
   drivers/media/platform/renesas/sh_vou.c:1304:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   drivers/media/platform/renesas/sh_vou.c:1304:2: note: Taking false branch
           if (ret)
           ^
   drivers/media/platform/renesas/sh_vou.c:1314:6: note: Assuming 'i2c_adap=
' is non-null
           if (!i2c_adap) {
               ^~~~~~~~~
   drivers/media/platform/renesas/sh_vou.c:1314:2: note: Taking false branch
           if (!i2c_adap) {
           ^
   drivers/media/platform/renesas/sh_vou.c:1319:8: note: Calling 'sh_vou_hw=
_init'
           ret =3D sh_vou_hw_init(vou_dev);
                 ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/renesas/sh_vou.c:1095:9: note: Left side of '&&' =
is true
           while (--i && (sh_vou_reg_a_read(vou_dev, VOUSRR) & 0x101))
                  ^
   drivers/media/platform/renesas/sh_vou.c:1095:2: note: Loop condition is =
false. Execution continues on line 1098
           while (--i && (sh_vou_reg_a_read(vou_dev, VOUSRR) & 0x101))
           ^
   drivers/media/platform/renesas/sh_vou.c:1098:7: note: 'i' is 99
           if (!i)
                ^
   drivers/media/platform/renesas/sh_vou.c:1098:2: note: Taking false branch
           if (!i)
           ^
   drivers/media/platform/renesas/sh_vou.c:1101:2: note: Taking false branch
           dev_dbg(vou_dev->v4l2_dev.dev, "Reset took %dus\n", 100 - i);
           ^
   include/linux/dev_printk.h:162:2: note: expanded from macro 'dev_dbg'
           if (0)                                                          \
           ^
   drivers/media/platform/renesas/sh_vou.c:1103:6: note: Assuming the condi=
tion is false
           if (pdata->flags & SH_VOU_PCLK_FALLING)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/renesas/sh_vou.c:1103:2: note: Taking false branch
           if (pdata->flags & SH_VOU_PCLK_FALLING)
           ^
   drivers/media/platform/renesas/sh_vou.c:1105:6: note: Assuming the condi=
tion is false
           if (pdata->flags & SH_VOU_HSYNC_LOW)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/renesas/sh_vou.c:1105:2: note: Taking false branch
--
           ^
   drivers/media/platform/renesas/sh_vou.c:524:2: note: Loop condition is t=
rue.  Entering loop body
           for (i =3D ARRAY_SIZE(vou_scale_h_num) - 1; i >=3D 0; i--) {
           ^
   drivers/media/platform/renesas/sh_vou.c:529:7: note: Assuming 'found' is=
 <=3D VOU_MAX_IMAGE_WIDTH
                   if (found > VOU_MAX_IMAGE_WIDTH)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/renesas/sh_vou.c:529:3: note: Taking false branch
                   if (found > VOU_MAX_IMAGE_WIDTH)
                   ^
   drivers/media/platform/renesas/sh_vou.c:533:9: note: '__x' is >=3D 0
                   err =3D abs(found - geo->in_width);
                         ^
   include/linux/math.h:133:3: note: expanded from macro 'abs'
                   __abs_choose_expr(x, int,                               \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/math.h:144:28: note: expanded from macro '__abs_choose_exp=
r'
           ({ signed type __x =3D (x); __x < 0 ? -__x : __x; }), other)
                                     ^~~
   include/linux/math.h:144:54: note: expanded from macro '__abs_choose_exp=
r'
           ({ signed type __x =3D (x); __x < 0 ? -__x : __x; }), other)
                                                               ^~~~~
   include/linux/math.h:144:54: note: expanded from macro '__abs_choose_exp=
r'
           ({ signed type __x =3D (x); __x < 0 ? -__x : __x; }), other)
                                                               ^~~~~
   drivers/media/platform/renesas/sh_vou.c:533:9: note: '?' condition is fa=
lse
                   err =3D abs(found - geo->in_width);
                         ^
   include/linux/math.h:133:3: note: expanded from macro 'abs'
                   __abs_choose_expr(x, int,                               \
                   ^
   include/linux/math.h:144:28: note: expanded from macro '__abs_choose_exp=
r'
           ({ signed type __x =3D (x); __x < 0 ? -__x : __x; }), other)
                                     ^
   drivers/media/platform/renesas/sh_vou.c:534:7: note: Assuming 'err' is <=
 'best_err'
                   if (err < best_err) {
                       ^~~~~~~~~~~~~~
   drivers/media/platform/renesas/sh_vou.c:534:3: note: Taking true branch
                   if (err < best_err) {
                   ^
   drivers/media/platform/renesas/sh_vou.c:539:7: note: Assuming 'err' is 0
                   if (!err)
                       ^~~~
   drivers/media/platform/renesas/sh_vou.c:539:3: note: Taking true branch
                   if (!err)
                   ^
   drivers/media/platform/renesas/sh_vou.c:540:4: note:  Execution continue=
s on line 543
                           break;
                           ^
   drivers/media/platform/renesas/sh_vou.c:549:2: note: Loop condition is t=
rue.  Entering loop body
           for (i =3D ARRAY_SIZE(vou_scale_v_num) - 1; i >=3D 0; i--) {
           ^
   drivers/media/platform/renesas/sh_vou.c:554:7: note: Assuming 'found' is=
 > 'img_height_max'
                   if (found > img_height_max)
                       ^~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/renesas/sh_vou.c:554:3: note: Taking true branch
                   if (found > img_height_max)
                   ^
   drivers/media/platform/renesas/sh_vou.c:556:4: note:  Execution continue=
s on line 568
                           break;
                           ^
   drivers/media/platform/renesas/sh_vou.c:569:2: note: The value 4 is assi=
gned to 'geo.scale_idx_v', which participates in a condition later
           geo->scale_idx_v =3D idx;
           ^~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/renesas/sh_vou.c:743:3: note: Returning from 'vou=
_adjust_input'
                   vou_adjust_input(&geo, vou_dev->std);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/renesas/sh_vou.c:751:2: note: Taking false branch
           dev_dbg(vou_dev->v4l2_dev.dev, "%s(): %ux%u\n", __func__,
           ^
   include/linux/dev_printk.h:162:2: note: expanded from macro 'dev_dbg'
           if (0)                                                          \
           ^
   drivers/media/platform/renesas/sh_vou.c:758:2: note: Calling 'sh_vou_con=
figure_geometry'
           sh_vou_configure_geometry(vou_dev, pix_idx,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/renesas/sh_vou.c:427:2: note: Taking false branch
           if (vou_dev->std & V4L2_STD_525_60) {
           ^
   drivers/media/platform/renesas/sh_vou.c:464:2: note: Taking false branch
           dev_dbg(vou_dev->v4l2_dev.dev,
           ^
   include/linux/dev_printk.h:162:2: note: expanded from macro 'dev_dbg'
           if (0)                                                          \
           ^
   drivers/media/platform/renesas/sh_vou.c:480:6: note: 'w_idx' is 4
           if (w_idx)
               ^~~~~
   drivers/media/platform/renesas/sh_vou.c:480:2: note: Taking true branch
           if (w_idx)
           ^
   drivers/media/platform/renesas/sh_vou.c:482:6: note: 'h_idx' is 4
           if (h_idx)
               ^~~~~
   drivers/media/platform/renesas/sh_vou.c:482:2: note: Taking true branch
           if (h_idx)
           ^
   drivers/media/platform/renesas/sh_vou.c:483:23: note: The right operand =
of '|' is a garbage value due to array index out of bounds
                   vouvcr |=3D (1 << 14) | vou_scale_v_fld[h_idx - 1];
                                       ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/renesas/sh_vou.c:1021:6: warning: Value stored to=
 'vou_status' during its initialization is never read [clang-analyzer-deadc=
ode.DeadStores]
           u32 vou_status =3D sh_vou_reg_a_read(vou_dev, VOUSTR);
               ^~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/renesas/sh_vou.c:1021:6: note: Value stored to 'v=
ou_status' during its initialization is never read
           u32 vou_status =3D sh_vou_reg_a_read(vou_dev, VOUSTR);
               ^~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   drivers/mmc/host/sdhci.c:924:3: warning: Division by zero [clang-analyze=
r-core.DivideZero]
                   do_div(transfer_time, freq);
                   ^
   include/asm-generic/div64.h:235:25: note: expanded from macro 'do_div'
                   __rem =3D (uint32_t)(n) % __base;         \
                           ~~~~~~~~~~~~~~^~~~~~~~
   drivers/mmc/host/sdhci.c:917:19: note: Calling 'sdhci_target_timeout'
           target_timeout =3D sdhci_target_timeout(host, cmd, data);
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/sdhci.c:883:6: note: Assuming 'data' is non-null, which=
 participates in a condition later
           if (!data) {
               ^~~~~
   drivers/mmc/host/sdhci.c:883:2: note: Taking false branch
           if (!data) {
           ^
   drivers/mmc/host/sdhci.c:887:7: note: Assuming field 'clock' is 0
                   if (host->clock && data->timeout_clks) {
                       ^~~~~~~~~~~
   drivers/mmc/host/sdhci.c:887:19: note: Left side of '&&' is false
                   if (host->clock && data->timeout_clks) {
                                   ^
   drivers/mmc/host/sdhci.c:917:19: note: Returning from 'sdhci_target_time=
out'
           target_timeout =3D sdhci_target_timeout(host, cmd, data);
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/sdhci.c:920:6: note: 'data' is non-null
           if (data) {
               ^~~~
   drivers/mmc/host/sdhci.c:920:2: note: Taking true branch
           if (data) {
           ^
   drivers/mmc/host/sdhci.c:922:10: note: '?' condition is false
                   freq =3D mmc->actual_clock ? : host->clock;
                          ^
   drivers/mmc/host/sdhci.c:922:3: note: The value 0 is assigned to 'freq'
                   freq =3D mmc->actual_clock ? : host->clock;
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/sdhci.c:924:3: note: '__base' initialized to 0
                   do_div(transfer_time, freq);
                   ^
   include/asm-generic/div64.h:220:2: note: expanded from macro 'do_div'
           uint32_t __base =3D (base);                       \
           ^~~~~~~~~~~~~~~
   drivers/mmc/host/sdhci.c:924:3: note: Left side of '&&' is false
                   do_div(transfer_time, freq);
                   ^
   include/asm-generic/div64.h:223:35: note: expanded from macro 'do_div'
           if (__builtin_constant_p(__base) &&             \
                                            ^
   drivers/mmc/host/sdhci.c:924:3: note: Left side of '&&' is false
                   do_div(transfer_time, freq);
                   ^
   include/asm-generic/div64.h:227:42: note: expanded from macro 'do_div'
           } else if (__builtin_constant_p(__base) &&      \
                                                   ^
   drivers/mmc/host/sdhci.c:924:3: note: Assuming the condition is true
                   do_div(transfer_time, freq);
                   ^
   include/asm-generic/div64.h:234:20: note: expanded from macro 'do_div'
           } else if (likely(((n) >> 32) =3D=3D 0)) {          \
                      ~~~~~~~^~~~~~~~~~~~~~~~~
   include/linux/compiler.h:77:40: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                               ^
   drivers/mmc/host/sdhci.c:924:3: note: Taking true branch
                   do_div(transfer_time, freq);
                   ^
   include/asm-generic/div64.h:234:9: note: expanded from macro 'do_div'
           } else if (likely(((n) >> 32) =3D=3D 0)) {          \
                  ^
   drivers/mmc/host/sdhci.c:924:3: note: Division by zero
                   do_div(transfer_time, freq);
                   ^
   include/asm-generic/div64.h:235:25: note: expanded from macro 'do_div'
                   __rem =3D (uint32_t)(n) % __base;         \
                           ~~~~~~~~~~~~~~^~~~~~~~
   1 warning generated.
   include/asm-generic/bitops/non-atomic.h:118:16: warning: Array access (f=
rom variable 'addr') results in a null pointer dereference [clang-analyzer-=
core.NullDereference]
           return 1UL & (addr[BIT_WORD(nr)] >> (nr & (BITS_PER_LONG-1)));
                         ^
   drivers/perf/arm_pmu.c:727:24: note: Assuming '____ptr' is null
           struct arm_pmu *pmu =3D hlist_entry_safe(node, struct arm_pmu, n=
ode);
                                 ^
   include/linux/list.h:993:5: note: expanded from macro 'hlist_entry_safe'
              ____ptr ? hlist_entry(____ptr, type, member) : NULL; \
              ^~~~~~~
   drivers/perf/arm_pmu.c:727:24: note: '?' condition is false
           struct arm_pmu *pmu =3D hlist_entry_safe(node, struct arm_pmu, n=
ode);
                                 ^
   include/linux/list.h:993:5: note: expanded from macro 'hlist_entry_safe'
              ____ptr ? hlist_entry(____ptr, type, member) : NULL; \
              ^
   drivers/perf/arm_pmu.c:730:7: note: Calling 'cpumask_test_cpu'
           if (!cpumask_test_cpu(cpu, &pmu->supported_cpus))

vim +/vou_dev +371 drivers/media/platform/renesas/sh_vou.c

a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-0=
3-17  366  =

a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-0=
3-17  367  /* Video IOCTLs */
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-0=
3-17  368  static int sh_vou_querycap(struct file *file, void  *priv,
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-0=
3-17  369  			   struct v4l2_capability *cap)
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-0=
3-17  370  {
d899eddde548b9 drivers/media/platform/sh_vou.c Laurent Pinchart      2013-0=
1-03 @371  	struct sh_vou_device *vou_dev =3D video_drvdata(file);
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-0=
3-17  372  =

d899eddde548b9 drivers/media/platform/sh_vou.c Laurent Pinchart      2013-0=
1-03  373  	dev_dbg(vou_dev->v4l2_dev.dev, "%s()\n", __func__);
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-0=
3-17  374  =

c0decac19da390 drivers/media/platform/sh_vou.c Mauro Carvalho Chehab 2018-0=
9-10  375  	strscpy(cap->card, "SuperH VOU", sizeof(cap->card));
c0decac19da390 drivers/media/platform/sh_vou.c Mauro Carvalho Chehab 2018-0=
9-10  376  	strscpy(cap->driver, "sh-vou", sizeof(cap->driver));
c0decac19da390 drivers/media/platform/sh_vou.c Mauro Carvalho Chehab 2018-0=
9-10  377  	strscpy(cap->bus_info, "platform:sh-vou", sizeof(cap->bus_info)=
);
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-0=
3-17  378  	return 0;
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-0=
3-17  379  }
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-0=
3-17  380  =

a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-0=
3-17  381  /* Enumerate formats, that the device can accept from the user */
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-0=
3-17  382  static int sh_vou_enum_fmt_vid_out(struct file *file, void  *pri=
v,
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-0=
3-17  383  				   struct v4l2_fmtdesc *fmt)
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-0=
3-17  384  {
d899eddde548b9 drivers/media/platform/sh_vou.c Laurent Pinchart      2013-0=
1-03  385  	struct sh_vou_device *vou_dev =3D video_drvdata(file);
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-0=
3-17  386  =

a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-0=
3-17  387  	if (fmt->index >=3D ARRAY_SIZE(vou_fmt))
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-0=
3-17  388  		return -EINVAL;
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-0=
3-17  389  =

d899eddde548b9 drivers/media/platform/sh_vou.c Laurent Pinchart      2013-0=
1-03  390  	dev_dbg(vou_dev->v4l2_dev.dev, "%s()\n", __func__);
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-0=
3-17  391  =

a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-0=
3-17  392  	fmt->pixelformat =3D vou_fmt[fmt->index].pfmt;
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-0=
3-17  393  =

a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-0=
3-17  394  	return 0;
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-0=
3-17  395  }
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-0=
3-17  396  =

a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-0=
3-17  397  static int sh_vou_g_fmt_vid_out(struct file *file, void *priv,
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-0=
3-17  398  				struct v4l2_format *fmt)
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-0=
3-17  399  {
fd51625d6331c8 drivers/media/platform/sh_vou.c Laurent Pinchart      2013-0=
1-03  400  	struct sh_vou_device *vou_dev =3D video_drvdata(file);
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-0=
3-17  401  =

a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-0=
3-17  402  	dev_dbg(vou_dev->v4l2_dev.dev, "%s()\n", __func__);
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-0=
3-17  403  =

a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-0=
3-17  404  	fmt->type =3D V4L2_BUF_TYPE_VIDEO_OUTPUT;
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-0=
3-17  405  	fmt->fmt.pix =3D vou_dev->pix;
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-0=
3-17  406  =

a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-0=
3-17  407  	return 0;
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-0=
3-17  408  }
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-0=
3-17  409  =

a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-0=
3-17  410  static const unsigned char vou_scale_h_num[] =3D {1, 9, 2, 9, 4};
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-0=
3-17  411  static const unsigned char vou_scale_h_den[] =3D {1, 8, 1, 4, 1};
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-0=
3-17  412  static const unsigned char vou_scale_h_fld[] =3D {0, 2, 1, 3};
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-0=
3-17  413  static const unsigned char vou_scale_v_num[] =3D {1, 2, 4};
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-0=
3-17  414  static const unsigned char vou_scale_v_den[] =3D {1, 1, 1};
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-0=
3-17  415  static const unsigned char vou_scale_v_fld[] =3D {0, 1};
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-0=
3-17  416  =

a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-0=
3-17  417  static void sh_vou_configure_geometry(struct sh_vou_device *vou_=
dev,
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-0=
3-17  418  				      int pix_idx, int w_idx, int h_idx)
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-0=
3-17  419  {
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-0=
3-17  420  	struct sh_vou_fmt *fmt =3D vou_fmt + pix_idx;
a622cc51879f70 drivers/media/platform/sh_vou.c Mauro Carvalho Chehab 2014-0=
1-13  421  	unsigned int black_left, black_top, width_max,
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-0=
3-17  422  		frame_in_height, frame_out_height, frame_out_top;
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-0=
3-17  423  	struct v4l2_rect *rect =3D &vou_dev->rect;
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-0=
3-17  424  	struct v4l2_pix_format *pix =3D &vou_dev->pix;
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-0=
3-17  425  	u32 vouvcr =3D 0, dsr_h, dsr_v;
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-0=
3-17  426  =

a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-0=
3-17  427  	if (vou_dev->std & V4L2_STD_525_60) {
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-0=
3-17  428  		width_max =3D 858;
a622cc51879f70 drivers/media/platform/sh_vou.c Mauro Carvalho Chehab 2014-0=
1-13  429  		/* height_max =3D 262; */
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-0=
3-17  430  	} else {
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-0=
3-17  431  		width_max =3D 864;
a622cc51879f70 drivers/media/platform/sh_vou.c Mauro Carvalho Chehab 2014-0=
1-13  432  		/* height_max =3D 312; */
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-0=
3-17  433  	}
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-0=
3-17  434  =

a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-0=
3-17  435  	frame_in_height =3D pix->height / 2;
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-0=
3-17  436  	frame_out_height =3D rect->height / 2;
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-0=
3-17  437  	frame_out_top =3D rect->top / 2;
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-0=
3-17  438  =

a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-0=
3-17  439  	/*
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-0=
3-17  440  	 * Cropping scheme: max useful image is 720x480, and the total =
video
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-0=
3-17  441  	 * area is 858x525 (NTSC) or 864x625 (PAL). AK8813 / 8814 starts
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-0=
3-17  442  	 * sampling data beginning with fixed 276th (NTSC) / 288th (PAL=
) clock,
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-0=
3-17  443  	 * of which the first 33 / 25 clocks HSYNC must be held active.=
 This
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-0=
3-17  444  	 * has to be configured in CR[HW]. 1 pixel equals 2 clock perio=
ds.
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-0=
3-17  445  	 * This gives CR[HW] =3D 16 / 12, VPR[HVP] =3D 138 / 144, which=
 gives
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-0=
3-17  446  	 * exactly 858 - 138 =3D 864 - 144 =3D 720! We call the out-of-=
display area,
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-0=
3-17  447  	 * beyond DSR, specified on the left and top by the VPR registe=
r "black
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-0=
3-17  448  	 * pixels" and out-of-image area (DPR) "background pixels." We =
fix VPR
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-0=
3-17  449  	 * at 138 / 144 : 20, because that's the HSYNC timing, that our=
 first
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-0=
3-17  450  	 * client requires, and that's exactly what leaves us 720 pixel=
s for the
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-0=
3-17  451  	 * image; we leave VPR[VVP] at default 20 for now, because the =
client
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-0=
3-17  452  	 * doesn't seem to have any special requirements for it. Otherw=
ise we
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-0=
3-17  453  	 * could also set it to max - 240 =3D 22 / 72. Thus VPR depends=
 only on
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-0=
3-17  454  	 * the selected standard, and DPR and DSR are selected accordin=
g to
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-0=
3-17  455  	 * cropping. Q: how does the client detect the first valid line=
? Does
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-0=
3-17  456  	 * HSYNC stay inactive during invalid (black) lines?
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-0=
3-17  457  	 */
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-0=
3-17  458  	black_left =3D width_max - VOU_MAX_IMAGE_WIDTH;
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-0=
3-17  459  	black_top =3D 20;
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-0=
3-17  460  =

a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-0=
3-17  461  	dsr_h =3D rect->width + rect->left;
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-0=
3-17  462  	dsr_v =3D frame_out_height + frame_out_top;
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-0=
3-17  463  =

a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-0=
3-17  464  	dev_dbg(vou_dev->v4l2_dev.dev,
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-0=
3-17  465  		"image %ux%u, black %u:%u, offset %u:%u, display %ux%u\n",
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-0=
3-17  466  		pix->width, frame_in_height, black_left, black_top,
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-0=
3-17  467  		rect->left, frame_out_top, dsr_h, dsr_v);
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-0=
3-17  468  =

a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-0=
3-17  469  	/* VOUISR height - half of a frame height in frame mode */
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-0=
3-17  470  	sh_vou_reg_ab_write(vou_dev, VOUISR, (pix->width << 16) | frame=
_in_height);
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-0=
3-17  471  	sh_vou_reg_ab_write(vou_dev, VOUVPR, (black_left << 16) | black=
_top);
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-0=
3-17  472  	sh_vou_reg_ab_write(vou_dev, VOUDPR, (rect->left << 16) | frame=
_out_top);
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-0=
3-17  473  	sh_vou_reg_ab_write(vou_dev, VOUDSR, (dsr_h << 16) | dsr_v);
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-0=
3-17  474  =

a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-0=
3-17  475  	/*
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-0=
3-17  476  	 * if necessary, we could set VOUHIR to
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-0=
3-17  477  	 * max(black_left + dsr_h, width_max) here
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-0=
3-17  478  	 */
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-0=
3-17  479  =

a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-0=
3-17  480  	if (w_idx)
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-0=
3-17  481  		vouvcr |=3D (1 << 15) | (vou_scale_h_fld[w_idx - 1] << 4);
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-0=
3-17  482  	if (h_idx)
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-0=
3-17 @483  		vouvcr |=3D (1 << 14) | vou_scale_v_fld[h_idx - 1];
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-0=
3-17  484  =

59fe916c84f891 drivers/media/platform/sh_vou.c Hans Verkuil          2019-0=
6-11  485  	dev_dbg(vou_dev->v4l2_dev.dev, "0x%08x: scaling 0x%x\n",
59fe916c84f891 drivers/media/platform/sh_vou.c Hans Verkuil          2019-0=
6-11  486  		fmt->pfmt, vouvcr);
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-0=
3-17  487  =

a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-0=
3-17  488  	/* To produce a colour bar for testing set bit 23 of VOUVCR */
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-0=
3-17  489  	sh_vou_reg_ab_write(vou_dev, VOUVCR, vouvcr);
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-0=
3-17  490  	sh_vou_reg_ab_write(vou_dev, VOUDFR,
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-0=
3-17  491  			    fmt->pkf | (fmt->yf << 8) | (fmt->rgb << 16));
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-0=
3-17  492  }
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-0=
3-17  493  =


:::::: The code@line 371 was first introduced by commit
:::::: d899eddde548b9a6d3a59d0600feaab377efcd3f [media] sh_vou: Use vou_dev=
 instead of vou_file wherever possible

:::::: TO: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
:::::: CC: Mauro Carvalho Chehab <mchehab@redhat.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0045769231008616204==--

