Content-Type: multipart/mixed; boundary="===============5368488230196157596=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 1775/5842] drivers/gpu/drm/vc4/vc4_crtc.c:671:34: warning: Value stored to 'mode' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Fri, 10 Dec 2021 19:45:45 +0800
Message-ID: <202112101942.Rz6PllOT-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5368488230196157596==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Thomas Zimmermann <tzimmermann@suse.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   4eee8d0b64ecc3231040fa68ba750317ffca5c52
commit: a713ca234ea9d946235ac7248995c5fddfd9e523 [1775/5842] Merge drm/drm-=
next into drm-misc-next
:::::: branch date: 2 days ago
:::::: commit date: 3 weeks ago
config: arm-randconfig-c002-20211209 (https://download.01.org/0day-ci/archi=
ve/20211210/202112101942.Rz6PllOT-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 097a1c=
b1d5ebb3a0ec4bcaed8ba3ff6a8e33c00a)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3Da713ca234ea9d946235ac7248995c5fddfd9e523
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout a713ca234ea9d946235ac7248995c5fddfd9e523
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                   ^
   drivers/media/i2c/ov9650.c:909:2: note: Loop condition is false.  Exitin=
g loop
           v4l2_dbg(1, debug, sd, "g_ctrl: %s\n", ctrl->name);
           ^
   include/media/v4l2-common.h:72:2: note: expanded from macro 'v4l2_dbg'
           do {                                                            \
           ^
   drivers/media/i2c/ov9650.c:912:8: note: Calling '__g_volatile_ctrl'
           ret =3D __g_volatile_ctrl(ov965x, ctrl);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/ov9650.c:863:6: note: Assuming field 'power' is not eq=
ual to 0
           if (!ov965x->power)
               ^~~~~~~~~~~~~~
   drivers/media/i2c/ov9650.c:863:2: note: Taking false branch
           if (!ov965x->power)
           ^
   drivers/media/i2c/ov9650.c:866:2: note: Control jumps to 'case 9963794:'=
  at line 867
           switch (ctrl->id) {
           ^
   drivers/media/i2c/ov9650.c:868:7: note: Assuming field 'val' is not equa=
l to 0
                   if (!ctrl->val)
                       ^~~~~~~~~~
   drivers/media/i2c/ov9650.c:868:3: note: Taking false branch
                   if (!ctrl->val)
                   ^
   drivers/media/i2c/ov9650.c:871:7: note: Assuming 'ret' is >=3D 0
                   if (ret < 0)
                       ^~~~~~~
   drivers/media/i2c/ov9650.c:871:3: note: Taking false branch
                   if (ret < 0)
                   ^
   drivers/media/i2c/ov9650.c:874:7: note: Assuming 'ret' is >=3D 0
                   if (ret < 0)
                       ^~~~~~~
   drivers/media/i2c/ov9650.c:874:3: note: Taking false branch
                   if (ret < 0)
                   ^
   drivers/media/i2c/ov9650.c:877:15: note: Calling 'fls'
                   m =3D 0x01 << fls(gain >> 4);
                               ^~~~~~~~~~~~~~
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
   drivers/media/i2c/ov9650.c:877:15: note: Returning from 'fls'
                   m =3D 0x01 << fls(gain >> 4);
                               ^~~~~~~~~~~~~~
   drivers/media/i2c/ov9650.c:877:12: note: The result of the left shift is=
 undefined due to shifting by '32', which is greater or equal to the width =
of type 'int'
                   m =3D 0x01 << fls(gain >> 4);
                            ^  ~~~~~~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
>> drivers/gpu/drm/vc4/vc4_crtc.c:671:34: warning: Value stored to 'mode' d=
uring its initialization is never read [clang-analyzer-deadcode.DeadStores]
                   const struct drm_display_mode *mode =3D &crtc_state->adj=
usted_mode;
                                                  ^~~~   ~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   drivers/gpu/drm/vc4/vc4_crtc.c:671:34: note: Value stored to 'mode' duri=
ng its initialization is never read
                   const struct drm_display_mode *mode =3D &crtc_state->adj=
usted_mode;
                                                  ^~~~   ~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/gpu/drm/vc4/vc4_dsi.c:818:26: warning: Division by zero [clang-a=
nalyzer-core.DivideZero]
           pll_clock =3D parent_rate / divider;
                       ~~~~~~~~~~~~^~~~~~~~~
   drivers/gpu/drm/vc4/vc4_dsi.c:808:2: note: Loop condition is true.  Ente=
ring loop body
           for (divider =3D 1; divider < 8; divider++) {
           ^
   drivers/gpu/drm/vc4/vc4_dsi.c:809:7: note: Assuming the condition is true
                   if (parent_rate / divider < pll_clock) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/vc4/vc4_dsi.c:809:3: note: Taking true branch
                   if (parent_rate / divider < pll_clock) {
                   ^
   drivers/gpu/drm/vc4/vc4_dsi.c:810:4: note: The value 0 is assigned to 'd=
ivider'
                           divider--;
                           ^~~~~~~~~
   drivers/gpu/drm/vc4/vc4_dsi.c:811:4: note:  Execution continues on line =
818
                           break;
                           ^
   drivers/gpu/drm/vc4/vc4_dsi.c:818:26: note: Division by zero
           pll_clock =3D parent_rate / divider;
                       ~~~~~~~~~~~~^~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/hwmon/ltc2945.c:286:2: warning: Value stored to 'ret' is never r=
ead [clang-analyzer-deadcode.DeadStores]
           ret =3D regmap_update_bits(regmap, LTC2945_CONTROL, CONTROL_TEST=
_MODE,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/hwmon/ltc2945.c:286:2: note: Value stored to 'ret' is never read
           ret =3D regmap_update_bits(regmap, LTC2945_CONTROL, CONTROL_TEST=
_MODE,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/gpu/drm/msm/adreno/adreno_gpu.c:28:17: warning: Value stored to =
'dev' during its initialization is never read [clang-analyzer-deadcode.Dead=
Stores]
           struct device *dev =3D &gpu->pdev->dev;
                          ^~~   ~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/adreno/adreno_gpu.c:28:17: note: Value stored to 'de=
v' during its initialization is never read
           struct device *dev =3D &gpu->pdev->dev;
                          ^~~   ~~~~~~~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
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
   9 warnings generated.
   drivers/hid/hid-magicmouse.c:795:3: warning: Value stored to 'report' is=
 never read [clang-analyzer-deadcode.DeadStores]
                   report =3D hid_register_report(hdev, HID_INPUT_REPORT,

vim +/mode +671 drivers/gpu/drm/vc4/vc4_crtc.c

666e73587f90f4 Boris Brezillon 2018-12-06  653  =

c8b75bca92cbf0 Eric Anholt     2015-03-02  654  static int vc4_crtc_atomic_=
check(struct drm_crtc *crtc,
29b77ad7b9ca8c Maxime Ripard   2020-10-28  655  				 struct drm_atomic_stat=
e *state)
c8b75bca92cbf0 Eric Anholt     2015-03-02  656  {
29b77ad7b9ca8c Maxime Ripard   2020-10-28  657  	struct drm_crtc_state *crt=
c_state =3D drm_atomic_get_new_crtc_state(state,
29b77ad7b9ca8c Maxime Ripard   2020-10-28  658  									  crtc);
29b77ad7b9ca8c Maxime Ripard   2020-10-28  659  	struct vc4_crtc_state *vc4=
_state =3D to_vc4_crtc_state(crtc_state);
008095e065a85a Boris Brezillon 2018-07-03  660  	struct drm_connector *conn;
008095e065a85a Boris Brezillon 2018-07-03  661  	struct drm_connector_state=
 *conn_state;
16e101051f329f Maxime Ripard   2021-10-25  662  	struct drm_encoder *encode=
r;
008095e065a85a Boris Brezillon 2018-07-03  663  	int ret, i;
c8b75bca92cbf0 Eric Anholt     2015-03-02  664  =

ee6965c864e3f5 Maxime Ripard   2020-12-15  665  	ret =3D vc4_hvs_atomic_che=
ck(crtc, state);
d8dbf44f13b911 Eric Anholt     2015-12-28  666  	if (ret)
d8dbf44f13b911 Eric Anholt     2015-12-28  667  		return ret;
c8b75bca92cbf0 Eric Anholt     2015-03-02  668  =

16e101051f329f Maxime Ripard   2021-10-25  669  	encoder =3D vc4_get_crtc_e=
ncoder(crtc, crtc_state);
16e101051f329f Maxime Ripard   2021-10-25  670  	if (encoder) {
16e101051f329f Maxime Ripard   2021-10-25 @671  		const struct drm_display_=
mode *mode =3D &crtc_state->adjusted_mode;
16e101051f329f Maxime Ripard   2021-10-25  672  		struct vc4_encoder *vc4_e=
ncoder =3D to_vc4_encoder(encoder);
16e101051f329f Maxime Ripard   2021-10-25  673  =

16e101051f329f Maxime Ripard   2021-10-25  674  		mode =3D &crtc_state->adj=
usted_mode;
16e101051f329f Maxime Ripard   2021-10-25  675  		if (vc4_encoder->type =3D=
=3D VC4_ENCODER_TYPE_HDMI0) {
16e101051f329f Maxime Ripard   2021-10-25  676  			vc4_state->hvs_load =3D =
max(mode->clock * mode->hdisplay / mode->htotal + 1000,
16e101051f329f Maxime Ripard   2021-10-25  677  						  mode->clock * 9 / 1=
0) * 1000;
16e101051f329f Maxime Ripard   2021-10-25  678  		} else {
16e101051f329f Maxime Ripard   2021-10-25  679  			vc4_state->hvs_load =3D =
mode->clock * 1000;
16e101051f329f Maxime Ripard   2021-10-25  680  		}
16e101051f329f Maxime Ripard   2021-10-25  681  	}
16e101051f329f Maxime Ripard   2021-10-25  682  =

d74252bb8f0e38 Maxime Ripard   2020-11-02  683  	for_each_new_connector_in_=
state(state, conn, conn_state,
29b77ad7b9ca8c Maxime Ripard   2020-10-28  684  					i) {
008095e065a85a Boris Brezillon 2018-07-03  685  		if (conn_state->crtc !=3D=
 crtc)
008095e065a85a Boris Brezillon 2018-07-03  686  			continue;
008095e065a85a Boris Brezillon 2018-07-03  687  =

666e73587f90f4 Boris Brezillon 2018-12-06  688  		vc4_state->margins.left =
=3D conn_state->tv.margins.left;
666e73587f90f4 Boris Brezillon 2018-12-06  689  		vc4_state->margins.right =
=3D conn_state->tv.margins.right;
666e73587f90f4 Boris Brezillon 2018-12-06  690  		vc4_state->margins.top =
=3D conn_state->tv.margins.top;
666e73587f90f4 Boris Brezillon 2018-12-06  691  		vc4_state->margins.bottom=
 =3D conn_state->tv.margins.bottom;
008095e065a85a Boris Brezillon 2018-07-03  692  		break;
008095e065a85a Boris Brezillon 2018-07-03  693  	}
008095e065a85a Boris Brezillon 2018-07-03  694  =

c8b75bca92cbf0 Eric Anholt     2015-03-02  695  	return 0;
c8b75bca92cbf0 Eric Anholt     2015-03-02  696  }
c8b75bca92cbf0 Eric Anholt     2015-03-02  697  =


:::::: The code at line 671 was first introduced by commit
:::::: 16e101051f329f5f3f2dd810f3687d166580aa3a drm/vc4: Increase the core =
clock based on HVS load

:::::: TO: Maxime Ripard <maxime@cerno.tech>
:::::: CC: Maxime Ripard <maxime@cerno.tech>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5368488230196157596==--

