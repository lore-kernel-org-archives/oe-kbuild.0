Content-Type: multipart/mixed; boundary="===============5419928980776214167=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/media/platform/renesas/sh_vou.c:371:24: warning: Value stored to 'vou_dev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Tue, 03 May 2022 03:45:53 +0800
Message-ID: <202205030326.MOU3KUaS-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5419928980776214167==
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
head:   672c0c5173427e6b3e2a9bbb7be51ceeec78093a
commit: ee4a77a32b39064fdab0aa2b36bbd35ebf57e077 media: platform: place Ren=
esas drivers on a separate dir
date:   7 weeks ago
:::::: branch date: 23 hours ago
:::::: commit date: 7 weeks ago
config: arm-randconfig-c002-20220427 (https://download.01.org/0day-ci/archi=
ve/20220503/202205030326.MOU3KUaS-lkp(a)intel.com/config)
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
              ^~~~~~~~~~
   drivers/media/platform/qcom/camss/camss-csiphy-2ph-1-0.c:46:5: note: Val=
ue stored to 'hw_version' during its initialization is never read
           u8 hw_version =3D readl_relaxed(csiphy->base +
              ^~~~~~~~~~
   Suppressed 1 warnings (1 with check filters).
   2 warnings generated.
   drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c:280:2: warning:=
 Value stored to 'hw_version' is never read [clang-analyzer-deadcode.DeadSt=
ores]
           hw_version |=3D readl_relaxed(csiphy->base +
           ^
   drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c:280:2: note: Va=
lue stored to 'hw_version' is never read
   Suppressed 1 warnings (1 with check filters).
   2 warnings generated.
   include/media/v4l2-subdev.h:987:10: warning: Access to field 'pads' resu=
lts in a dereference of a null pointer (loaded from variable 'state') [clan=
g-analyzer-core.NullDereference]
           return &state->pads[pad].try_fmt;
                   ^
   drivers/media/platform/qcom/camss/camss-csiphy.c:763:8: note: Calling 'c=
siphy_init_formats'
           ret =3D csiphy_init_formats(sd, NULL);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/camss/camss-csiphy.c:527:12: note: 'fh' is n=
ull
                   .which =3D fh ? V4L2_SUBDEV_FORMAT_TRY :
                            ^~
   drivers/media/platform/qcom/camss/camss-csiphy.c:527:12: note: '?' condi=
tion is false
   drivers/media/platform/qcom/camss/camss-csiphy.c:536:31: note: 'fh' is n=
ull
           return csiphy_set_format(sd, fh ? fh->state : NULL, &format);
                                        ^~
   drivers/media/platform/qcom/camss/camss-csiphy.c:536:31: note: '?' condi=
tion is false
   drivers/media/platform/qcom/camss/camss-csiphy.c:536:31: note: Passing n=
ull pointer value via 2nd parameter 'sd_state'
           return csiphy_set_format(sd, fh ? fh->state : NULL, &format);
                                        ^~
   drivers/media/platform/qcom/camss/camss-csiphy.c:536:9: note: Calling 'c=
siphy_set_format'
           return csiphy_set_format(sd, fh ? fh->state : NULL, &format);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/camss/camss-csiphy.c:491:6: note: 'format' i=
s not equal to NULL
           if (format =3D=3D NULL)
               ^~~~~~
   drivers/media/platform/qcom/camss/camss-csiphy.c:491:2: note: Taking fal=
se branch
           if (format =3D=3D NULL)
           ^
   drivers/media/platform/qcom/camss/camss-csiphy.c:499:6: note: Assuming f=
ield 'pad' is equal to MSM_CSIPHY_PAD_SINK
           if (fmt->pad =3D=3D MSM_CSIPHY_PAD_SINK) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/camss/camss-csiphy.c:499:2: note: Taking tru=
e branch
           if (fmt->pad =3D=3D MSM_CSIPHY_PAD_SINK) {
           ^
   drivers/media/platform/qcom/camss/camss-csiphy.c:500:40: note: Passing n=
ull pointer value via 2nd parameter 'sd_state'
                   format =3D __csiphy_get_format(csiphy, sd_state,
                                                        ^~~~~~~~
   drivers/media/platform/qcom/camss/camss-csiphy.c:500:12: note: Calling '=
__csiphy_get_format'
                   format =3D __csiphy_get_format(csiphy, sd_state,
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/camss/camss-csiphy.c:327:6: note: Assuming '=
which' is equal to V4L2_SUBDEV_FORMAT_TRY
           if (which =3D=3D V4L2_SUBDEV_FORMAT_TRY)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/camss/camss-csiphy.c:327:2: note: Taking tru=
e branch
           if (which =3D=3D V4L2_SUBDEV_FORMAT_TRY)
           ^
   drivers/media/platform/qcom/camss/camss-csiphy.c:328:54: note: Passing n=
ull pointer value via 2nd parameter 'state'
                   return v4l2_subdev_get_try_format(&csiphy->subdev, sd_st=
ate,
                                                                      ^~~~~=
~~~
   drivers/media/platform/qcom/camss/camss-csiphy.c:328:10: note: Calling '=
v4l2_subdev_get_try_format'
                   return v4l2_subdev_get_try_format(&csiphy->subdev, sd_st=
ate,
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   include/media/v4l2-subdev.h:985:14: note: Assuming 'pad' is < field 'num=
_pads'
           if (WARN_ON(pad >=3D sd->entity.num_pads))
                       ^
   include/asm-generic/bug.h:121:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   include/media/v4l2-subdev.h:985:6: note: Taking false branch
           if (WARN_ON(pad >=3D sd->entity.num_pads))
               ^
   include/asm-generic/bug.h:122:2: note: expanded from macro 'WARN_ON'
           if (unlikely(__ret_warn_on))                                    \
           ^
   include/media/v4l2-subdev.h:985:2: note: Taking false branch
           if (WARN_ON(pad >=3D sd->entity.num_pads))
           ^
   include/media/v4l2-subdev.h:987:10: note: Access to field 'pads' results=
 in a dereference of a null pointer (loaded from variable 'state')
           return &state->pads[pad].try_fmt;
                   ^~~~~
   Suppressed 1 warnings (1 with check filters).
   2 warnings generated.
   drivers/gpu/ipu-v3/ipu-ic.c:738:18: warning: Value stored to 'ipu' durin=
g its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct ipu_soc *ipu =3D priv->ipu;
                           ^~~   ~~~~~~~~~
   drivers/gpu/ipu-v3/ipu-ic.c:738:18: note: Value stored to 'ipu' during i=
ts initialization is never read
           struct ipu_soc *ipu =3D priv->ipu;
                           ^~~   ~~~~~~~~~
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
   include/linux/hid.h:1037:9: warning: Access to field 'name' results in a=
 dereference of a null pointer (loaded from variable 'input') [clang-analyz=
er-core.NullDereference]
                                       input->name, c, type);
                                       ^
   drivers/hid/hid-petalynx.c:41:6: note: Assuming the condition is true
           if ((usage->hid & HID_USAGE_PAGE) =3D=3D HID_UP_LOGIVENDOR) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-petalynx.c:41:2: note: Taking true branch
           if ((usage->hid & HID_USAGE_PAGE) =3D=3D HID_UP_LOGIVENDOR) {
           ^
   drivers/hid/hid-petalynx.c:42:3: note: Control jumps to 'case 90:'  at l=
ine 43
                   switch (usage->hid & HID_USAGE) {
                   ^
   drivers/hid/hid-petalynx.c:43:15: note: Calling 'hid_map_usage_clear'
                   case 0x05a: pl_map_key_clear(KEY_TEXT);         break;
                               ^
   drivers/hid/hid-petalynx.c:35:29: note: expanded from macro 'pl_map_key_=
clear'
   #define pl_map_key_clear(c)     hid_map_usage_clear(hi, usage, bit, max,=
 \
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   include/linux/hid.h:1065:2: note: Calling 'hid_map_usage'
           hid_map_usage(hidinput, usage, bit, max, type, c);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/hid.h:1008:2: note: 'input' initialized here
           struct input_dev *input =3D hidinput->input;
           ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/hid.h:1012:2: note: Control jumps to 'case 1:'  at line 10=
21
           switch (type) {
           ^
   include/linux/hid.h:1024:3: note:  Execution continues on line 1035
                   break;
                   ^
   include/linux/hid.h:1035:15: note: 'c' is <=3D 'limit'
           if (unlikely(c > limit || !bmap)) {
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/hid.h:1035:15: note: Left side of '||' is false
           if (unlikely(c > limit || !bmap)) {
                        ^
   include/linux/hid.h:1035:28: note: Assuming 'bmap' is null
           if (unlikely(c > limit || !bmap)) {
                                     ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/hid.h:1035:28: note: Assuming pointer value is null
           if (unlikely(c > limit || !bmap)) {
                                     ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/hid.h:1035:2: note: Taking true branch
           if (unlikely(c > limit || !bmap)) {
           ^
   include/linux/hid.h:1036:3: note: Assuming the condition is true
                   pr_warn_ratelimited("%s: Invalid code %d type %d\n",
                   ^
   include/linux/printk.h:656:2: note: expanded from macro 'pr_warn_ratelim=
ited'
           printk_ratelimited(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/printk.h:639:6: note: expanded from macro 'printk_ratelimi=
ted'
           if (__ratelimit(&_rs))                                          \
               ^~~~~~~~~~~~~~~~~
   include/linux/ratelimit_types.h:41:28: note: expanded from macro '__rate=
limit'
   #define __ratelimit(state) ___ratelimit(state, __func__)
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/hid.h:1036:3: note: Taking true branch
                   pr_warn_ratelimited("%s: Invalid code %d type %d\n",
                   ^
   include/linux/printk.h:656:2: note: expanded from macro 'pr_warn_ratelim=
ited'
           printk_ratelimited(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:639:2: note: expanded from macro 'printk_ratelimi=
ted'
           if (__ratelimit(&_rs))                                          \
           ^
   include/linux/hid.h:1036:3: note: Left side of '&&' is true
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
   include/linux/printk.h:370:7: note: expanded from macro '__printk_index_=
emit'
                   if (__builtin_constant_p(_fmt) && __builtin_constant_p(_=
level)) { \
                       ^

vim +/vou_dev +371 drivers/media/platform/renesas/sh_vou.c

a81fb9b223508f5 drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-=
03-17  366  =

a81fb9b223508f5 drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-=
03-17  367  /* Video IOCTLs */
a81fb9b223508f5 drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-=
03-17  368  static int sh_vou_querycap(struct file *file, void  *priv,
a81fb9b223508f5 drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-=
03-17  369  			   struct v4l2_capability *cap)
a81fb9b223508f5 drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-=
03-17  370  {
d899eddde548b9a drivers/media/platform/sh_vou.c Laurent Pinchart      2013-=
01-03 @371  	struct sh_vou_device *vou_dev =3D video_drvdata(file);
a81fb9b223508f5 drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-=
03-17  372  =

d899eddde548b9a drivers/media/platform/sh_vou.c Laurent Pinchart      2013-=
01-03  373  	dev_dbg(vou_dev->v4l2_dev.dev, "%s()\n", __func__);
a81fb9b223508f5 drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-=
03-17  374  =

c0decac19da3906 drivers/media/platform/sh_vou.c Mauro Carvalho Chehab 2018-=
09-10  375  	strscpy(cap->card, "SuperH VOU", sizeof(cap->card));
c0decac19da3906 drivers/media/platform/sh_vou.c Mauro Carvalho Chehab 2018-=
09-10  376  	strscpy(cap->driver, "sh-vou", sizeof(cap->driver));
c0decac19da3906 drivers/media/platform/sh_vou.c Mauro Carvalho Chehab 2018-=
09-10  377  	strscpy(cap->bus_info, "platform:sh-vou", sizeof(cap->bus_info=
));
a81fb9b223508f5 drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-=
03-17  378  	return 0;
a81fb9b223508f5 drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-=
03-17  379  }
a81fb9b223508f5 drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-=
03-17  380  =

a81fb9b223508f5 drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-=
03-17  381  /* Enumerate formats, that the device can accept from the user =
*/
a81fb9b223508f5 drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-=
03-17  382  static int sh_vou_enum_fmt_vid_out(struct file *file, void  *pr=
iv,
a81fb9b223508f5 drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-=
03-17  383  				   struct v4l2_fmtdesc *fmt)
a81fb9b223508f5 drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-=
03-17  384  {
d899eddde548b9a drivers/media/platform/sh_vou.c Laurent Pinchart      2013-=
01-03  385  	struct sh_vou_device *vou_dev =3D video_drvdata(file);
a81fb9b223508f5 drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-=
03-17  386  =

a81fb9b223508f5 drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-=
03-17  387  	if (fmt->index >=3D ARRAY_SIZE(vou_fmt))
a81fb9b223508f5 drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-=
03-17  388  		return -EINVAL;
a81fb9b223508f5 drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-=
03-17  389  =

d899eddde548b9a drivers/media/platform/sh_vou.c Laurent Pinchart      2013-=
01-03  390  	dev_dbg(vou_dev->v4l2_dev.dev, "%s()\n", __func__);
a81fb9b223508f5 drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-=
03-17  391  =

a81fb9b223508f5 drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-=
03-17  392  	fmt->pixelformat =3D vou_fmt[fmt->index].pfmt;
a81fb9b223508f5 drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-=
03-17  393  =

a81fb9b223508f5 drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-=
03-17  394  	return 0;
a81fb9b223508f5 drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-=
03-17  395  }
a81fb9b223508f5 drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-=
03-17  396  =

a81fb9b223508f5 drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-=
03-17  397  static int sh_vou_g_fmt_vid_out(struct file *file, void *priv,
a81fb9b223508f5 drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-=
03-17  398  				struct v4l2_format *fmt)
a81fb9b223508f5 drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-=
03-17  399  {
fd51625d6331c80 drivers/media/platform/sh_vou.c Laurent Pinchart      2013-=
01-03  400  	struct sh_vou_device *vou_dev =3D video_drvdata(file);
a81fb9b223508f5 drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-=
03-17  401  =

a81fb9b223508f5 drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-=
03-17  402  	dev_dbg(vou_dev->v4l2_dev.dev, "%s()\n", __func__);
a81fb9b223508f5 drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-=
03-17  403  =

a81fb9b223508f5 drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-=
03-17  404  	fmt->type =3D V4L2_BUF_TYPE_VIDEO_OUTPUT;
a81fb9b223508f5 drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-=
03-17  405  	fmt->fmt.pix =3D vou_dev->pix;
a81fb9b223508f5 drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-=
03-17  406  =

a81fb9b223508f5 drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-=
03-17  407  	return 0;
a81fb9b223508f5 drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-=
03-17  408  }
a81fb9b223508f5 drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-=
03-17  409  =

a81fb9b223508f5 drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-=
03-17  410  static const unsigned char vou_scale_h_num[] =3D {1, 9, 2, 9, 4=
};
a81fb9b223508f5 drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-=
03-17  411  static const unsigned char vou_scale_h_den[] =3D {1, 8, 1, 4, 1=
};
a81fb9b223508f5 drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-=
03-17  412  static const unsigned char vou_scale_h_fld[] =3D {0, 2, 1, 3};
a81fb9b223508f5 drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-=
03-17  413  static const unsigned char vou_scale_v_num[] =3D {1, 2, 4};
a81fb9b223508f5 drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-=
03-17  414  static const unsigned char vou_scale_v_den[] =3D {1, 1, 1};
a81fb9b223508f5 drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-=
03-17  415  static const unsigned char vou_scale_v_fld[] =3D {0, 1};
a81fb9b223508f5 drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-=
03-17  416  =

a81fb9b223508f5 drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-=
03-17  417  static void sh_vou_configure_geometry(struct sh_vou_device *vou=
_dev,
a81fb9b223508f5 drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-=
03-17  418  				      int pix_idx, int w_idx, int h_idx)
a81fb9b223508f5 drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-=
03-17  419  {
a81fb9b223508f5 drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-=
03-17  420  	struct sh_vou_fmt *fmt =3D vou_fmt + pix_idx;
a622cc51879f703 drivers/media/platform/sh_vou.c Mauro Carvalho Chehab 2014-=
01-13  421  	unsigned int black_left, black_top, width_max,
a81fb9b223508f5 drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-=
03-17  422  		frame_in_height, frame_out_height, frame_out_top;
a81fb9b223508f5 drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-=
03-17  423  	struct v4l2_rect *rect =3D &vou_dev->rect;
a81fb9b223508f5 drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-=
03-17  424  	struct v4l2_pix_format *pix =3D &vou_dev->pix;
a81fb9b223508f5 drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-=
03-17  425  	u32 vouvcr =3D 0, dsr_h, dsr_v;
a81fb9b223508f5 drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-=
03-17  426  =

a81fb9b223508f5 drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-=
03-17  427  	if (vou_dev->std & V4L2_STD_525_60) {
a81fb9b223508f5 drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-=
03-17  428  		width_max =3D 858;
a622cc51879f703 drivers/media/platform/sh_vou.c Mauro Carvalho Chehab 2014-=
01-13  429  		/* height_max =3D 262; */
a81fb9b223508f5 drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-=
03-17  430  	} else {
a81fb9b223508f5 drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-=
03-17  431  		width_max =3D 864;
a622cc51879f703 drivers/media/platform/sh_vou.c Mauro Carvalho Chehab 2014-=
01-13  432  		/* height_max =3D 312; */
a81fb9b223508f5 drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-=
03-17  433  	}
a81fb9b223508f5 drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-=
03-17  434  =

a81fb9b223508f5 drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-=
03-17  435  	frame_in_height =3D pix->height / 2;
a81fb9b223508f5 drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-=
03-17  436  	frame_out_height =3D rect->height / 2;
a81fb9b223508f5 drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-=
03-17  437  	frame_out_top =3D rect->top / 2;
a81fb9b223508f5 drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-=
03-17  438  =

a81fb9b223508f5 drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-=
03-17  439  	/*
a81fb9b223508f5 drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-=
03-17  440  	 * Cropping scheme: max useful image is 720x480, and the total=
 video
a81fb9b223508f5 drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-=
03-17  441  	 * area is 858x525 (NTSC) or 864x625 (PAL). AK8813 / 8814 star=
ts
a81fb9b223508f5 drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-=
03-17  442  	 * sampling data beginning with fixed 276th (NTSC) / 288th (PA=
L) clock,
a81fb9b223508f5 drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-=
03-17  443  	 * of which the first 33 / 25 clocks HSYNC must be held active=
. This
a81fb9b223508f5 drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-=
03-17  444  	 * has to be configured in CR[HW]. 1 pixel equals 2 clock peri=
ods.
a81fb9b223508f5 drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-=
03-17  445  	 * This gives CR[HW] =3D 16 / 12, VPR[HVP] =3D 138 / 144, whic=
h gives
a81fb9b223508f5 drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-=
03-17  446  	 * exactly 858 - 138 =3D 864 - 144 =3D 720! We call the out-of=
-display area,
a81fb9b223508f5 drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-=
03-17  447  	 * beyond DSR, specified on the left and top by the VPR regist=
er "black
a81fb9b223508f5 drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-=
03-17  448  	 * pixels" and out-of-image area (DPR) "background pixels." We=
 fix VPR
a81fb9b223508f5 drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-=
03-17  449  	 * at 138 / 144 : 20, because that's the HSYNC timing, that ou=
r first
a81fb9b223508f5 drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-=
03-17  450  	 * client requires, and that's exactly what leaves us 720 pixe=
ls for the
a81fb9b223508f5 drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-=
03-17  451  	 * image; we leave VPR[VVP] at default 20 for now, because the=
 client
a81fb9b223508f5 drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-=
03-17  452  	 * doesn't seem to have any special requirements for it. Other=
wise we
a81fb9b223508f5 drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-=
03-17  453  	 * could also set it to max - 240 =3D 22 / 72. Thus VPR depend=
s only on
a81fb9b223508f5 drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-=
03-17  454  	 * the selected standard, and DPR and DSR are selected accordi=
ng to
a81fb9b223508f5 drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-=
03-17  455  	 * cropping. Q: how does the client detect the first valid lin=
e? Does
a81fb9b223508f5 drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-=
03-17  456  	 * HSYNC stay inactive during invalid (black) lines?
a81fb9b223508f5 drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-=
03-17  457  	 */
a81fb9b223508f5 drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-=
03-17  458  	black_left =3D width_max - VOU_MAX_IMAGE_WIDTH;
a81fb9b223508f5 drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-=
03-17  459  	black_top =3D 20;
a81fb9b223508f5 drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-=
03-17  460  =

a81fb9b223508f5 drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-=
03-17  461  	dsr_h =3D rect->width + rect->left;
a81fb9b223508f5 drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-=
03-17  462  	dsr_v =3D frame_out_height + frame_out_top;
a81fb9b223508f5 drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-=
03-17  463  =

a81fb9b223508f5 drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-=
03-17  464  	dev_dbg(vou_dev->v4l2_dev.dev,
a81fb9b223508f5 drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-=
03-17  465  		"image %ux%u, black %u:%u, offset %u:%u, display %ux%u\n",
a81fb9b223508f5 drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-=
03-17  466  		pix->width, frame_in_height, black_left, black_top,
a81fb9b223508f5 drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-=
03-17  467  		rect->left, frame_out_top, dsr_h, dsr_v);
a81fb9b223508f5 drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-=
03-17  468  =

a81fb9b223508f5 drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-=
03-17  469  	/* VOUISR height - half of a frame height in frame mode */
a81fb9b223508f5 drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-=
03-17  470  	sh_vou_reg_ab_write(vou_dev, VOUISR, (pix->width << 16) | fram=
e_in_height);
a81fb9b223508f5 drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-=
03-17  471  	sh_vou_reg_ab_write(vou_dev, VOUVPR, (black_left << 16) | blac=
k_top);
a81fb9b223508f5 drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-=
03-17  472  	sh_vou_reg_ab_write(vou_dev, VOUDPR, (rect->left << 16) | fram=
e_out_top);
a81fb9b223508f5 drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-=
03-17  473  	sh_vou_reg_ab_write(vou_dev, VOUDSR, (dsr_h << 16) | dsr_v);
a81fb9b223508f5 drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-=
03-17  474  =

a81fb9b223508f5 drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-=
03-17  475  	/*
a81fb9b223508f5 drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-=
03-17  476  	 * if necessary, we could set VOUHIR to
a81fb9b223508f5 drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-=
03-17  477  	 * max(black_left + dsr_h, width_max) here
a81fb9b223508f5 drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-=
03-17  478  	 */
a81fb9b223508f5 drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-=
03-17  479  =

a81fb9b223508f5 drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-=
03-17  480  	if (w_idx)
a81fb9b223508f5 drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-=
03-17  481  		vouvcr |=3D (1 << 15) | (vou_scale_h_fld[w_idx - 1] << 4);
a81fb9b223508f5 drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-=
03-17  482  	if (h_idx)
a81fb9b223508f5 drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-=
03-17 @483  		vouvcr |=3D (1 << 14) | vou_scale_v_fld[h_idx - 1];
a81fb9b223508f5 drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-=
03-17  484  =

59fe916c84f891a drivers/media/platform/sh_vou.c Hans Verkuil          2019-=
06-11  485  	dev_dbg(vou_dev->v4l2_dev.dev, "0x%08x: scaling 0x%x\n",
59fe916c84f891a drivers/media/platform/sh_vou.c Hans Verkuil          2019-=
06-11  486  		fmt->pfmt, vouvcr);
a81fb9b223508f5 drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-=
03-17  487  =

a81fb9b223508f5 drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-=
03-17  488  	/* To produce a colour bar for testing set bit 23 of VOUVCR */
a81fb9b223508f5 drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-=
03-17  489  	sh_vou_reg_ab_write(vou_dev, VOUVCR, vouvcr);
a81fb9b223508f5 drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-=
03-17  490  	sh_vou_reg_ab_write(vou_dev, VOUDFR,
a81fb9b223508f5 drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-=
03-17  491  			    fmt->pkf | (fmt->yf << 8) | (fmt->rgb << 16));
a81fb9b223508f5 drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-=
03-17  492  }
a81fb9b223508f5 drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-=
03-17  493  =


:::::: The code@line 371 was first introduced by commit
:::::: d899eddde548b9a6d3a59d0600feaab377efcd3f [media] sh_vou: Use vou_dev=
 instead of vou_file wherever possible

:::::: TO: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
:::::: CC: Mauro Carvalho Chehab <mchehab@redhat.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5419928980776214167==--

