Content-Type: multipart/mixed; boundary="===============9141494099804009149=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 9/9] drm: mxsfb: Add support for i.MX8MP LCDIF variant
Date: Tue, 01 Mar 2022 01:36:57 +0800
Message-ID: <202203010150.L57Eax3W-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============9141494099804009149==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220228004605.367040-9-marex@denx.de>
References: <20220228004605.367040-9-marex@denx.de>
TO: Marek Vasut <marex@denx.de>
TO: dri-devel(a)lists.freedesktop.org
CC: Marek Vasut <marex@denx.de>
CC: Peng Fan <peng.fan@nxp.com>
CC: Alexander Stein <alexander.stein@ew.tq-group.com>
CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC: Sam Ravnborg <sam@ravnborg.org>
CC: Robby Cai <robby.cai@nxp.com>

Hi Marek,

I love your patch! Perhaps something to improve:

[auto build test WARNING on drm-intel/for-linux-next]
[also build test WARNING on drm-exynos/exynos-drm-next next-20220225]
[cannot apply to drm/drm-next drm-tip/drm-tip tegra-drm/drm/tegra/for-next =
v5.17-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Marek-Vasut/dt-bindings-mx=
sfb-Add-compatible-for-i-MX8MP/20220228-084809
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: mips-randconfig-c004-20220227 (https://download.01.org/0day-ci/arch=
ive/20220301/202203010150.L57Eax3W-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc=
04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://github.com/0day-ci/linux/commit/d6832d6fb879aabce18d9b451=
ed1ead1da38c333
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Marek-Vasut/dt-bindings-mxsfb-Add-=
compatible-for-i-MX8MP/20220228-084809
        git checkout d6832d6fb879aabce18d9b451ed1ead1da38c333
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dmips clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
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
   5 warnings generated.
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
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   drivers/video/fbdev/riva/rivafb-i2c.c:94:2: warning: Call to function 's=
trcpy' is insecure as it does not provide bounding of the memory buffer. Re=
place unbounded copy functions with analogous functions that support length=
 arguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.=
strcpy]
           strcpy(chan->adapter.name, name);
           ^~~~~~
   drivers/video/fbdev/riva/rivafb-i2c.c:94:2: note: Call to function 'strc=
py' is insecure as it does not provide bounding of the memory buffer. Repla=
ce unbounded copy functions with analogous functions that support length ar=
guments such as 'strlcpy'. CWE-119
           strcpy(chan->adapter.name, name);
           ^~~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   drivers/iio/dac/ad5764.c:52:8: warning: Excessive padding in 'struct ad5=
764_state' (144 padding bytes, where 16 is optimal). =

   Optimal fields order: =

   data, =

   spi, =

   chip_info, =

   vref_reg, =

   lock, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct ad5764_state {
   ~~~~~~~^~~~~~~~~~~~~~
   drivers/iio/dac/ad5764.c:52:8: note: Excessive padding in 'struct ad5764=
_state' (144 padding bytes, where 16 is optimal). Optimal fields order: dat=
a, spi, chip_info, vref_reg, lock, consider reordering the fields or adding=
 explicit padding members
   struct ad5764_state {
   ~~~~~~~^~~~~~~~~~~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   drivers/iio/dac/ad5766.c:112:8: warning: Excessive padding in 'struct ad=
5766_state' (144 padding bytes, where 16 is optimal). =

   Optimal fields order: =

   data, =

   spi, =

   chip_info, =

   gpio_reset, =

   crt_range, =

   dither_source, =

   dither_scale, =

   lock, =

   dither_enable, =

   dither_invert, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct ad5766_state {
   ~~~~~~~^~~~~~~~~~~~~~
   drivers/iio/dac/ad5766.c:112:8: note: Excessive padding in 'struct ad576=
6_state' (144 padding bytes, where 16 is optimal). Optimal fields order: da=
ta, spi, chip_info, gpio_reset, crt_range, dither_source, dither_scale, loc=
k, dither_enable, dither_invert, consider reordering the fields or adding e=
xplicit padding members
   struct ad5766_state {
   ~~~~~~~^~~~~~~~~~~~~~
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
   5 warnings generated.
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
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
>> drivers/gpu/drm/mxsfb/mxsfb_kms.c:258:8: warning: The left expression of=
 the compound assignment is an uninitialized value. The computed value will=
 also be garbage [clang-analyzer-core.uninitialized.Assign]
                   ctrl |=3D CTRL_INV_HS;
                        ^
   drivers/gpu/drm/mxsfb/mxsfb_kms.c:542:6: note: Assuming field 'bridge' i=
s null
           if (mxsfb->bridge) {
               ^~~~~~~~~~~~~
   drivers/gpu/drm/mxsfb/mxsfb_kms.c:542:2: note: Taking false branch
           if (mxsfb->bridge) {
           ^
   drivers/gpu/drm/mxsfb/mxsfb_kms.c:556:7: note: 'bus_format' is 0
           if (!bus_format && mxsfb->connector->display_info.num_bus_format=
s)
                ^~~~~~~~~~
   drivers/gpu/drm/mxsfb/mxsfb_kms.c:556:6: note: Left side of '&&' is true
           if (!bus_format && mxsfb->connector->display_info.num_bus_format=
s)
               ^
   drivers/gpu/drm/mxsfb/mxsfb_kms.c:556:21: note: Assuming field 'num_bus_=
formats' is not equal to 0
           if (!bus_format && mxsfb->connector->display_info.num_bus_format=
s)
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/mxsfb/mxsfb_kms.c:556:2: note: Taking true branch
           if (!bus_format && mxsfb->connector->display_info.num_bus_format=
s)
           ^
   drivers/gpu/drm/mxsfb/mxsfb_kms.c:560:6: note: Assuming 'bus_format' is 0
           if (!bus_format)
               ^~~~~~~~~~~
   drivers/gpu/drm/mxsfb/mxsfb_kms.c:560:2: note: Taking true branch
           if (!bus_format)
           ^
   drivers/gpu/drm/mxsfb/mxsfb_kms.c:567:2: note: Calling 'mxsfb_crtc_mode_=
set_nofb'
           mxsfb_crtc_mode_set_nofb(mxsfb, bus_format);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/mxsfb/mxsfb_kms.c:466:13: note: Field 'bridge' is null
           if (mxsfb->bridge && mxsfb->bridge->timings)
                      ^
   drivers/gpu/drm/mxsfb/mxsfb_kms.c:466:20: note: Left side of '&&' is fal=
se
           if (mxsfb->bridge && mxsfb->bridge->timings)
                             ^
   drivers/gpu/drm/mxsfb/mxsfb_kms.c:476:6: note: Assuming field 'has_regsv=
8' is true
           if (mxsfb->devdata->has_regsv8) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/mxsfb/mxsfb_kms.c:476:2: note: Taking true branch
           if (mxsfb->devdata->has_regsv8) {
           ^
   drivers/gpu/drm/mxsfb/mxsfb_kms.c:479:7: note: Assuming 'err' is 0
                   if (err)
                       ^~~
   drivers/gpu/drm/mxsfb/mxsfb_kms.c:479:3: note: Taking false branch
                   if (err)
                   ^
   drivers/gpu/drm/mxsfb/mxsfb_kms.c:484:3: note: Calling 'mxsfb_v8_set_mod=
e'
                   mxsfb_v8_set_mode(mxsfb, bus_flags);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/mxsfb/mxsfb_kms.c:255:2: note: 'ctrl' declared without a=
n initial value
           u32 ctrl;
           ^~~~~~~~
   drivers/gpu/drm/mxsfb/mxsfb_kms.c:257:6: note: Assuming the condition is=
 true
           if (m->flags & DRM_MODE_FLAG_PHSYNC)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/mxsfb/mxsfb_kms.c:257:2: note: Taking true branch
           if (m->flags & DRM_MODE_FLAG_PHSYNC)
           ^
   drivers/gpu/drm/mxsfb/mxsfb_kms.c:258:8: note: The left expression of th=
e compound assignment is an uninitialized value. The computed value will al=
so be garbage
                   ctrl |=3D CTRL_INV_HS;
                   ~~~~ ^
   drivers/gpu/drm/mxsfb/mxsfb_kms.c:260:8: warning: The left expression of=
 the compound assignment is an uninitialized value. The computed value will=
 also be garbage [clang-analyzer-core.uninitialized.Assign]
                   ctrl |=3D CTRL_INV_VS;
                        ^
   drivers/gpu/drm/mxsfb/mxsfb_kms.c:542:6: note: Assuming field 'bridge' i=
s null
           if (mxsfb->bridge) {
               ^~~~~~~~~~~~~
   drivers/gpu/drm/mxsfb/mxsfb_kms.c:542:2: note: Taking false branch
           if (mxsfb->bridge) {
           ^
   drivers/gpu/drm/mxsfb/mxsfb_kms.c:556:7: note: 'bus_format' is 0
           if (!bus_format && mxsfb->connector->display_info.num_bus_format=
s)
                ^~~~~~~~~~
   drivers/gpu/drm/mxsfb/mxsfb_kms.c:556:6: note: Left side of '&&' is true
           if (!bus_format && mxsfb->connector->display_info.num_bus_format=
s)
               ^
   drivers/gpu/drm/mxsfb/mxsfb_kms.c:556:21: note: Assuming field 'num_bus_=
formats' is not equal to 0
           if (!bus_format && mxsfb->connector->display_info.num_bus_format=
s)
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/mxsfb/mxsfb_kms.c:556:2: note: Taking true branch
           if (!bus_format && mxsfb->connector->display_info.num_bus_format=
s)
           ^
   drivers/gpu/drm/mxsfb/mxsfb_kms.c:560:6: note: Assuming 'bus_format' is 0
           if (!bus_format)
               ^~~~~~~~~~~
   drivers/gpu/drm/mxsfb/mxsfb_kms.c:560:2: note: Taking true branch
           if (!bus_format)
           ^
   drivers/gpu/drm/mxsfb/mxsfb_kms.c:567:2: note: Calling 'mxsfb_crtc_mode_=
set_nofb'
           mxsfb_crtc_mode_set_nofb(mxsfb, bus_format);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/mxsfb/mxsfb_kms.c:466:13: note: Field 'bridge' is null
           if (mxsfb->bridge && mxsfb->bridge->timings)
                      ^
   drivers/gpu/drm/mxsfb/mxsfb_kms.c:466:20: note: Left side of '&&' is fal=
se
           if (mxsfb->bridge && mxsfb->bridge->timings)
                             ^
   drivers/gpu/drm/mxsfb/mxsfb_kms.c:476:6: note: Assuming field 'has_regsv=
8' is true
           if (mxsfb->devdata->has_regsv8) {

vim +258 drivers/gpu/drm/mxsfb/mxsfb_kms.c

56c727244a47cf Marek Vasut 2022-02-28  251  =

d6832d6fb879aa Marek Vasut 2022-02-28  252  static void mxsfb_v8_set_mode(s=
truct mxsfb_drm_private *mxsfb, u32 bus_flags)
d6832d6fb879aa Marek Vasut 2022-02-28  253  {
d6832d6fb879aa Marek Vasut 2022-02-28  254  	struct drm_display_mode *m =3D=
 &mxsfb->crtc.state->adjusted_mode;
d6832d6fb879aa Marek Vasut 2022-02-28  255  	u32 ctrl;
d6832d6fb879aa Marek Vasut 2022-02-28  256  =

d6832d6fb879aa Marek Vasut 2022-02-28  257  	if (m->flags & DRM_MODE_FLAG_P=
HSYNC)
d6832d6fb879aa Marek Vasut 2022-02-28 @258  		ctrl |=3D CTRL_INV_HS;
d6832d6fb879aa Marek Vasut 2022-02-28  259  	if (m->flags & DRM_MODE_FLAG_P=
VSYNC)
d6832d6fb879aa Marek Vasut 2022-02-28  260  		ctrl |=3D CTRL_INV_VS;
d6832d6fb879aa Marek Vasut 2022-02-28  261  	/* Make sure Data Enable is hi=
gh active by default */
d6832d6fb879aa Marek Vasut 2022-02-28  262  	if (!(bus_flags & DRM_BUS_FLAG=
_DE_LOW))
d6832d6fb879aa Marek Vasut 2022-02-28  263  		ctrl |=3D CTRL_INV_DE;
d6832d6fb879aa Marek Vasut 2022-02-28  264  	if (bus_flags & DRM_BUS_FLAG_P=
IXDATA_DRIVE_NEGEDGE)
d6832d6fb879aa Marek Vasut 2022-02-28  265  		ctrl |=3D CTRL_INV_PXCK;
d6832d6fb879aa Marek Vasut 2022-02-28  266  =

d6832d6fb879aa Marek Vasut 2022-02-28  267  	writel(ctrl, mxsfb->base + LCD=
C_CTRL);
d6832d6fb879aa Marek Vasut 2022-02-28  268  =

d6832d6fb879aa Marek Vasut 2022-02-28  269  	writel(DISP_SIZE_DELTA_Y(m->cr=
tc_vdisplay) |
d6832d6fb879aa Marek Vasut 2022-02-28  270  	       DISP_SIZE_DELTA_X(m->cr=
tc_hdisplay),
d6832d6fb879aa Marek Vasut 2022-02-28  271  	       mxsfb->base + LCDC_V8_D=
ISP_SIZE);
d6832d6fb879aa Marek Vasut 2022-02-28  272  =

d6832d6fb879aa Marek Vasut 2022-02-28  273  	writel(HSYN_PARA_BP_H(m->htota=
l - m->hsync_end) |
d6832d6fb879aa Marek Vasut 2022-02-28  274  	       HSYN_PARA_FP_H(m->hsync=
_start - m->hdisplay),
d6832d6fb879aa Marek Vasut 2022-02-28  275  	       mxsfb->base + LCDC_V8_H=
SYN_PARA);
d6832d6fb879aa Marek Vasut 2022-02-28  276  =

d6832d6fb879aa Marek Vasut 2022-02-28  277  	writel(VSYN_PARA_BP_V(m->vtota=
l - m->vsync_end) |
d6832d6fb879aa Marek Vasut 2022-02-28  278  	       VSYN_PARA_FP_V(m->vsync=
_start - m->vdisplay),
d6832d6fb879aa Marek Vasut 2022-02-28  279  	       mxsfb->base + LCDC_V8_V=
SYN_PARA);
d6832d6fb879aa Marek Vasut 2022-02-28  280  =

d6832d6fb879aa Marek Vasut 2022-02-28  281  	writel(VSYN_HSYN_WIDTH_PW_V(m-=
>vsync_end - m->vsync_start) |
d6832d6fb879aa Marek Vasut 2022-02-28  282  	       VSYN_HSYN_WIDTH_PW_H(m-=
>hsync_end - m->hsync_start),
d6832d6fb879aa Marek Vasut 2022-02-28  283  	       mxsfb->base + LCDC_V8_V=
SYN_HSYN_WIDTH);
d6832d6fb879aa Marek Vasut 2022-02-28  284  =

d6832d6fb879aa Marek Vasut 2022-02-28  285  	writel(CTRLDESCL0_1_HEIGHT(m->=
crtc_vdisplay) |
d6832d6fb879aa Marek Vasut 2022-02-28  286  	       CTRLDESCL0_1_WIDTH(m->c=
rtc_hdisplay),
d6832d6fb879aa Marek Vasut 2022-02-28  287  	       mxsfb->base + LCDC_V8_C=
TRLDESCL0_1);
d6832d6fb879aa Marek Vasut 2022-02-28  288  =

d6832d6fb879aa Marek Vasut 2022-02-28  289  	writel(CTRLDESCL0_3_PITCH(mxsf=
b->crtc.primary->state->fb->pitches[0]),
d6832d6fb879aa Marek Vasut 2022-02-28  290  	       mxsfb->base + LCDC_V8_C=
TRLDESCL0_3);
d6832d6fb879aa Marek Vasut 2022-02-28  291  }
d6832d6fb879aa Marek Vasut 2022-02-28  292  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============9141494099804009149==--

