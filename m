Content-Type: multipart/mixed; boundary="===============3215738076271945709=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/bridge/ite-it6505.c:1330:5: warning: Variable 'audio_word_length_map' can be declared with const [constVariable]
Date: Sat, 20 Aug 2022 15:41:33 +0800
Message-ID: <202208201508.pilo8lWn-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3215738076271945709==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: drivers/g=
pu/drm/bridge/ite-it6505.c:1330:5: warning: Variable 'audio_word_length_map=
' can be declared with const [constVariable]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Allen Chen <allen.chen@ite.com.tw>
CC: Robert Foss <robert.foss@linaro.org>
CC: Hermes Wu <hermes.wu@ite.com.tw>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   50cd95ac46548429e5bba7ca75cc97d11a697947
commit: b5c84a9edcd418cd055becad6a22439e7c5e3bf8 drm/bridge: add it6505 dri=
ver
date:   7 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 7 months ago
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout b5c84a9edcd418cd055becad6a22439e7c5e3bf8
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/video/fbdev/carminefb.c:404:10: warning: Shifting signed 32-bit =
value by 31 bits is implementation-defined behaviour [shiftTooManyBitsSigne=
d]
    mode |=3D CARMINE_DEN | CARMINE_L0E;
            ^
>> drivers/video/fbdev/carminefb.c:404:10: warning: Signed integer overflow=
 for expression '1<<31'. [integerOverflow]
    mode |=3D CARMINE_DEN | CARMINE_L0E;
            ^
--
>> drivers/video/fbdev/gxt4500.c:257:24: warning: Either the condition 't>=
=3D0' is redundant or there is division by zero at line 257. [zerodivcond]
       n =3D intf * postdiv / period_ps;
                          ^
   drivers/video/fbdev/gxt4500.c:262:11: note: Assuming that condition 't>=
=3D0' is not redundant
       if (t >=3D 0 && t < best_error) {
             ^
   drivers/video/fbdev/gxt4500.c:261:10: note: Assignment to 't-=3Dperiod_p=
s'
       t -=3D period_ps;
            ^
   drivers/video/fbdev/gxt4500.c:257:24: note: Division by zero
       n =3D intf * postdiv / period_ps;
                          ^
--
>> drivers/video/fbdev/cyber2000fb.c:339:24: warning: Either the condition =
'regno<64' is redundant or the array 'cfb->palette[256]' is accessed at ind=
ex 504, which is out of bounds. [arrayIndexOutOfBoundsCond]
      green =3D cfb->palette[regno << 3].green;
                          ^
   drivers/video/fbdev/cyber2000fb.c:325:39: note: Assuming that condition =
'regno<64' is not redundant
     if (var->green.length =3D=3D 6 && regno < 64) {
                                         ^
   drivers/video/fbdev/cyber2000fb.c:339:24: note: Array index out of bounds
      green =3D cfb->palette[regno << 3].green;
                          ^
>> drivers/gpu/drm/bridge/tc358764.c:247:31: warning: Signed integer overfl=
ow for expression '((1<<(31-20+1))-1)<<20'. [integerOverflow]
    tc358764_write(ctx, VP_CTRL, VP_CTRL_VSDELAY(15) | VP_CTRL_RGB888(1) |
                                 ^
--
>> drivers/video/fbdev/aty/aty128fb.c:2273:13: warning: Either the conditio=
n 'regno>0' is redundant or the array 'par->green[64]' is accessed at index=
 64, which is out of bounds. [arrayIndexOutOfBoundsCond]
     par->green[regno] =3D green;
               ^
   drivers/video/fbdev/aty/aty128fb.c:2265:37: note: Assuming that conditio=
n 'regno>0' is not redundant
    if (par->crtc.depth =3D=3D 16 && regno > 0) {
                                       ^
   drivers/video/fbdev/aty/aty128fb.c:2273:13: note: Array index out of bou=
nds
     par->green[regno] =3D green;
               ^
>> drivers/video/fbdev/aty/aty128fb.c:1041:5: warning: Variable 'mode_bytpp=
' can be declared with const [constVariable]
    u8 mode_bytpp[7] =3D { 0, 0, 1, 2, 2, 3, 4 };
       ^
   drivers/video/fbdev/aty/aty128fb.c:1324:16: warning: Variable 'post_conv=
' can be declared with const [constVariable]
    unsigned char post_conv[] =3D /* register values for post dividers */
                  ^
>> drivers/video/fbdev/aty/aty128fb.c:657:37: warning: Shifting signed 32-b=
it value by 31 bits is implementation-defined behaviour [shiftTooManyBitsSi=
gned]
      if (!(aty_ld_le32(GUI_STAT) & (1 << 31))) {
                                       ^
>> drivers/video/fbdev/aty/aty128fb.c:657:37: warning: Signed integer overf=
low for expression '1<<31'. [integerOverflow]
      if (!(aty_ld_le32(GUI_STAT) & (1 << 31))) {
                                       ^
   drivers/video/fbdev/aty/aty128fb.c:955:11: warning: Variable 'PostDivSet=
' can be declared with const [constVariable]
    unsigned PostDivSet[] =3D { 0, 1, 2, 4, 8, 3, 6, 12 };
             ^
>> drivers/gpu/drm/panel/panel-truly-nt35597.c:237:9: warning: Uninitialize=
d variable: ret [uninitvar]
    return ret;
           ^
   drivers/gpu/drm/panel/panel-truly-nt35597.c:230:16: note: Assuming condi=
tion is false
    for (i =3D 0; i < ARRAY_SIZE(ctx->dsi); i++) {
                  ^
   drivers/gpu/drm/panel/panel-truly-nt35597.c:237:9: note: Uninitialized v=
ariable: ret
    return ret;
           ^
--
>> drivers/video/fbdev/aty/atyfb_base.c:3977:11: warning: Same expression o=
n both sides of '&&' because 'err1' and 'err2' represent the same value. [k=
nownConditionTrueFalse]
    if (err1 && err2)
             ^
   drivers/video/fbdev/aty/atyfb_base.c:3961:13: note: 'err1' is assigned v=
alue '1' here.
    int err1 =3D 1, err2 =3D 1;
               ^
   drivers/video/fbdev/aty/atyfb_base.c:3961:23: note: 'err2' is assigned v=
alue '1' here.
    int err1 =3D 1, err2 =3D 1;
                         ^
   drivers/video/fbdev/aty/atyfb_base.c:3977:11: note: Same expression on b=
oth sides of '&&' because 'err1' and 'err2' represent the same value.
    if (err1 && err2)
             ^
>> drivers/video/fbdev/aty/atyfb_base.c:2367:5: warning: Unused variable: d=
ac_type [unusedVariable]
    u8 dac_type;
       ^
   drivers/video/fbdev/aty/atyfb_base.c:3578:5: warning: Redundant initiali=
zation for 'rc'. The initialized value is overwritten before it is read. [r=
edundantInitialization]
    rc =3D atyfb_setup_generic(pdev, info, addr);
       ^
   drivers/video/fbdev/aty/atyfb_base.c:3537:9: note: rc is initialized
    int rc =3D -ENOMEM;
           ^
   drivers/video/fbdev/aty/atyfb_base.c:3578:5: note: rc is overwritten
    rc =3D atyfb_setup_generic(pdev, info, addr);
       ^
>> drivers/gpu/drm/drm_mipi_dsi.c:307:73: warning: Parameter 'node' can be =
declared with const [constParameter]
   struct mipi_dsi_host *of_find_mipi_dsi_host_by_node(struct device_node *=
node)
                                                                           ^
--
>> drivers/gpu/drm/qxl/qxl_object.c:111:25: warning: Parameter 'surf' can b=
e declared with const [constParameter]
       struct qxl_surface *surf,
                           ^
>> drivers/gpu/drm/ttm/ttm_bo.c:1134:28: warning: Local variable 'ctx' shad=
ows outer argument [shadowArgument]
     struct ttm_operation_ctx ctx =3D { false, false };
                              ^
   drivers/gpu/drm/ttm/ttm_bo.c:1093:76: note: Shadowed declaration
   int ttm_bo_swapout(struct ttm_buffer_object *bo, struct ttm_operation_ct=
x *ctx,
                                                                           =
   ^
   drivers/gpu/drm/ttm/ttm_bo.c:1134:28: note: Shadow variable
     struct ttm_operation_ctx ctx =3D { false, false };
                              ^
--
>> drivers/video/fbdev/aty/radeon_base.c:1645:5: warning: Variable 'hsync_f=
udge_fp' can be declared with const [constVariable]
    u8 hsync_fudge_fp[] =3D {2, 2, 0, 0, 5, 5};
       ^
>> drivers/video/fbdev/aty/radeon_base.c:1644:5: warning: Variable 'hsync_a=
dj_tab' can be declared with const [constVariable]
    u8 hsync_adj_tab[] =3D {0, 0x12, 9, 9, 6, 5};
       ^
>> drivers/gpu/drm/bridge/tc358767.c:846:18: warning: Shifting signed 32-bi=
t value by 31 bits is implementation-defined behaviour [shiftTooManyBitsSig=
ned]
     dp0_syncval |=3D SYNCVAL_VS_POL_ACTIVE_LOW;
                    ^
>> drivers/gpu/drm/bridge/tc358767.c:846:18: warning: Signed integer overfl=
ow for expression '1<<31'. [integerOverflow]
     dp0_syncval |=3D SYNCVAL_VS_POL_ACTIVE_LOW;
                    ^
   drivers/gpu/drm/bridge/tc358767.c:1026:11: warning: Signed integer overf=
low for expression '15<<28'. [integerOverflow]
         (15 << 28) | /* Defer Iteration Count */
             ^
--
>> drivers/gpu/drm/bridge/ite-it6505.c:1330:5: warning: Variable 'audio_wor=
d_length_map' can be declared with const [constVariable]
    u8 audio_word_length_map[] =3D { 0x02, 0x04, 0x03, 0x0B };
       ^
>> drivers/gpu/drm/bridge/ite-it6505.c:1620:56: warning: Parameter 'lane_vo=
ltage_swing' can be declared with const [constParameter]
   static bool it6505_check_max_voltage_swing_reached(u8 *lane_voltage_swin=
g,
                                                          ^
--
   In file included from drivers/gpu/drm/radeon/radeon_object.c:
>> drivers/gpu/drm/radeon/radeon_object.c:503:8: warning: Uninitialized var=
iable: bo [uninitvar]
     if (!bo->tbo.pin_count) {
          ^
   drivers/gpu/drm/radeon/radeon_object.c:497:14: note: Assuming condition =
is false
    if (unlikely(r !=3D 0)) {
                ^
   drivers/gpu/drm/radeon/radeon_object.c:502:30: note: Assignment 'bo=3Dlo=
bj->robj', assigned value is <Uninit>
     struct radeon_bo *bo =3D lobj->robj;
                                ^
   drivers/gpu/drm/radeon/radeon_object.c:503:8: note: Uninitialized variab=
le: bo
     if (!bo->tbo.pin_count) {
          ^
>> drivers/gpu/drm/radeon/radeon_object.c:517:9: warning: Uninitialized var=
iable: allowed [uninitvar]
      if ((allowed & current_domain) !=3D 0 &&
           ^
   drivers/gpu/drm/radeon/radeon_object.c:497:14: note: Assuming condition =
is false
    if (unlikely(r !=3D 0)) {
                ^
   drivers/gpu/drm/radeon/radeon_object.c:505:22: note: Assignment 'allowed=
=3Dlobj->allowed_domains', assigned value is <Uninit>
      u32 allowed =3D lobj->allowed_domains;
                        ^
   drivers/gpu/drm/radeon/radeon_object.c:517:9: note: Uninitialized variab=
le: allowed
      if ((allowed & current_domain) !=3D 0 &&
           ^
>> drivers/gpu/drm/radeon/radeon_object.c:518:9: warning: Uninitialized var=
iable: domain [uninitvar]
          (domain & current_domain) =3D=3D 0 && /* will be moved */
           ^
   drivers/gpu/drm/radeon/radeon_object.c:497:14: note: Assuming condition =
is false
    if (unlikely(r !=3D 0)) {
                ^
   drivers/gpu/drm/radeon/radeon_object.c:504:21: note: Assignment 'domain=
=3Dlobj->preferred_domains', assigned value is <Uninit>
      u32 domain =3D lobj->preferred_domains;
                       ^
   drivers/gpu/drm/radeon/radeon_object.c:518:9: note: Uninitialized variab=
le: domain
          (domain & current_domain) =3D=3D 0 && /* will be moved */
           ^
--
>> drivers/gpu/drm/radeon/radeon_gem.c:863:43: warning: Uninitialized varia=
ble: rbo->tbo [uninitvar]
     domain =3D radeon_mem_type_to_domain(rbo->tbo.resource->mem_type);
                                             ^
--
>> drivers/pci/quirks.c:58:24: warning: Parameter 'end' can be declared wit=
h const [constParameter]
        struct pci_fixup *end)
                          ^
>> drivers/pci/quirks.c:3251:54: warning: Shifting signed 32-bit value by 3=
1 bits is implementation-defined behaviour [shiftTooManyBitsSigned]
    pci_write_config_dword(dev, VTUNCERRMSK_REG, word | VTD_MSK_SPEC_ERRORS=
);
                                                        ^
>> drivers/pci/quirks.c:3251:54: warning: Signed integer overflow for expre=
ssion '1<<31'. [integerOverflow]
    pci_write_config_dword(dev, VTUNCERRMSK_REG, word | VTD_MSK_SPEC_ERRORS=
);
                                                        ^

vim +/audio_word_length_map +1330 drivers/gpu/drm/bridge/ite-it6505.c

b5c84a9edcd418 Allen Chen 2022-01-14  1326  =

b5c84a9edcd418 Allen Chen 2022-01-14  1327  static void it6505_setup_audio_=
channel_status(struct it6505 *it6505)
b5c84a9edcd418 Allen Chen 2022-01-14  1328  {
b5c84a9edcd418 Allen Chen 2022-01-14  1329  	enum it6505_audio_sample_rate =
sample_rate =3D it6505->audio.sample_rate;
b5c84a9edcd418 Allen Chen 2022-01-14 @1330  	u8 audio_word_length_map[] =3D=
 { 0x02, 0x04, 0x03, 0x0B };
b5c84a9edcd418 Allen Chen 2022-01-14  1331  =

b5c84a9edcd418 Allen Chen 2022-01-14  1332  	/* Channel Status */
b5c84a9edcd418 Allen Chen 2022-01-14  1333  	it6505_write(it6505, REG_IEC95=
8_STS0, it6505->audio.type << 1);
b5c84a9edcd418 Allen Chen 2022-01-14  1334  	it6505_write(it6505, REG_IEC95=
8_STS1, 0x00);
b5c84a9edcd418 Allen Chen 2022-01-14  1335  	it6505_write(it6505, REG_IEC95=
8_STS2, 0x00);
b5c84a9edcd418 Allen Chen 2022-01-14  1336  	it6505_write(it6505, REG_IEC95=
8_STS3, sample_rate);
b5c84a9edcd418 Allen Chen 2022-01-14  1337  	it6505_write(it6505, REG_IEC95=
8_STS4, (~sample_rate << 4) |
b5c84a9edcd418 Allen Chen 2022-01-14  1338  		     audio_word_length_map[it=
6505->audio.word_length]);
b5c84a9edcd418 Allen Chen 2022-01-14  1339  }
b5c84a9edcd418 Allen Chen 2022-01-14  1340  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3215738076271945709==--

