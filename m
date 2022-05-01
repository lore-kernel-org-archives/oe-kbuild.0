Content-Type: multipart/mixed; boundary="===============6094581564845673514=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/tegra/fb.c:126:14: warning: Assigned value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
Date: Sun, 01 May 2022 12:19:30 +0800
Message-ID: <202205011237.q3yv0vew-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6094581564845673514==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Kees Cook <keescook@chromium.org>
CC: Daniel Vetter <daniel.vetter@ffwll.ch>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   57ae8a492116910bad2b3497ffe555b3a4b4180f
commit: f611b1e7624ccdbd495c19e9805629e22265aa16 drm: Avoid circular depend=
encies for CONFIG_FB
date:   11 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 11 months ago
config: arm-randconfig-c002-20220501 (https://download.01.org/0day-ci/archi=
ve/20220501/202205011237.q3yv0vew-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 400775=
649969b9baf3bc2a510266e7912bb16ae9)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Df611b1e7624ccdbd495c19e9805629e22265aa16
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout f611b1e7624ccdbd495c19e9805629e22265aa16
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
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
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c:426:2: warning: 4th =
function call argument is an uninitialized value [clang-analyzer-core.CallA=
ndMessage]
           dev_err(mhdp->dev, "HDCP authentication failed (%d tries/%d)\n",
           ^
   include/linux/dev_printk.h:112:2: note: expanded from macro 'dev_err'
           _dev_err(dev, dev_fmt(fmt), ##__VA_ARGS__)
           ^
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c:535:8: note: Calling=
 '_cdns_mhdp_hdcp_enable'
           ret =3D _cdns_mhdp_hdcp_enable(mhdp, content_type);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c:406:6: note: 'ret' d=
eclared without an initial value
           int ret, tries =3D 3;
               ^~~
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c:409:2: note: Loop co=
ndition is true.  Entering loop body
           for (i =3D 0; i < tries; i++) {
           ^
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c:410:7: note: Assumin=
g 'content_type' is not equal to DRM_MODE_HDCP_CONTENT_TYPE0
                   if (content_type =3D=3D DRM_MODE_HDCP_CONTENT_TYPE0 ||
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c:410:7: note: Left si=
de of '||' is false
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c:411:7: note: Assumin=
g 'content_type' is not equal to DRM_MODE_HDCP_CONTENT_TYPE1
                       content_type =3D=3D DRM_MODE_HDCP_CONTENT_TYPE1) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c:410:3: note: Taking =
false branch
                   if (content_type =3D=3D DRM_MODE_HDCP_CONTENT_TYPE0 ||
                   ^
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c:418:7: note: 'conten=
t_type' is not equal to DRM_MODE_HDCP_CONTENT_TYPE0
                   if (content_type =3D=3D DRM_MODE_HDCP_CONTENT_TYPE0) {
                       ^~~~~~~~~~~~
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c:418:3: note: Taking =
false branch
                   if (content_type =3D=3D DRM_MODE_HDCP_CONTENT_TYPE0) {
                   ^
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c:409:2: note: Loop co=
ndition is true.  Entering loop body
           for (i =3D 0; i < tries; i++) {
           ^
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c:410:7: note: 'conten=
t_type' is not equal to DRM_MODE_HDCP_CONTENT_TYPE0
                   if (content_type =3D=3D DRM_MODE_HDCP_CONTENT_TYPE0 ||
                       ^~~~~~~~~~~~
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c:410:7: note: Left si=
de of '||' is false
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c:411:7: note: 'conten=
t_type' is not equal to DRM_MODE_HDCP_CONTENT_TYPE1
                       content_type =3D=3D DRM_MODE_HDCP_CONTENT_TYPE1) {
                       ^~~~~~~~~~~~
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c:410:3: note: Taking =
false branch
                   if (content_type =3D=3D DRM_MODE_HDCP_CONTENT_TYPE0 ||
                   ^
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c:418:7: note: 'conten=
t_type' is not equal to DRM_MODE_HDCP_CONTENT_TYPE0
                   if (content_type =3D=3D DRM_MODE_HDCP_CONTENT_TYPE0) {
                       ^~~~~~~~~~~~
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c:418:3: note: Taking =
false branch
                   if (content_type =3D=3D DRM_MODE_HDCP_CONTENT_TYPE0) {
                   ^
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c:409:2: note: Loop co=
ndition is true.  Entering loop body
           for (i =3D 0; i < tries; i++) {
           ^
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c:410:7: note: 'conten=
t_type' is not equal to DRM_MODE_HDCP_CONTENT_TYPE0
                   if (content_type =3D=3D DRM_MODE_HDCP_CONTENT_TYPE0 ||
                       ^~~~~~~~~~~~
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c:410:7: note: Left si=
de of '||' is false
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c:411:7: note: 'conten=
t_type' is not equal to DRM_MODE_HDCP_CONTENT_TYPE1
                       content_type =3D=3D DRM_MODE_HDCP_CONTENT_TYPE1) {
                       ^~~~~~~~~~~~
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c:410:3: note: Taking =
false branch
                   if (content_type =3D=3D DRM_MODE_HDCP_CONTENT_TYPE0 ||
                   ^
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c:418:7: note: 'conten=
t_type' is not equal to DRM_MODE_HDCP_CONTENT_TYPE0
                   if (content_type =3D=3D DRM_MODE_HDCP_CONTENT_TYPE0) {
                       ^~~~~~~~~~~~
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c:418:3: note: Taking =
false branch
                   if (content_type =3D=3D DRM_MODE_HDCP_CONTENT_TYPE0) {
                   ^
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c:409:2: note: Loop co=
ndition is false. Execution continues on line 426
           for (i =3D 0; i < tries; i++) {
           ^
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c:426:2: note: 4th fun=
ction call argument is an uninitialized value
           dev_err(mhdp->dev, "HDCP authentication failed (%d tries/%d)\n",
           ^
   include/linux/dev_printk.h:112:2: note: expanded from macro 'dev_err'
           _dev_err(dev, dev_fmt(fmt), ##__VA_ARGS__)
           ^                             ~~~~~~~~~~~
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (1 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
>> drivers/gpu/drm/tegra/fb.c:126:14: warning: Assigned value is garbage or=
 undefined [clang-analyzer-core.uninitialized.Assign]
                   fb->obj[i] =3D &planes[i]->gem;
                              ^
   drivers/gpu/drm/tegra/fb.c:150:14: note: Assuming 'i' is >=3D field 'num=
_planes'
           for (i =3D 0; i < info->num_planes; i++) {
                       ^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/tegra/fb.c:150:2: note: Loop condition is false. Executi=
on continues on line 174
           for (i =3D 0; i < info->num_planes; i++) {
           ^
   drivers/gpu/drm/tegra/fb.c:174:7: note: Calling 'tegra_fb_alloc'
           fb =3D tegra_fb_alloc(drm, cmd, planes, i);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/tegra/fb.c:119:7: note: Calling 'kzalloc'
           fb =3D kzalloc(sizeof(*fb), GFP_KERNEL);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:686:9: note: Calling 'kmalloc'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:544:2: note: Taking false branch
           if (__builtin_constant_p(size)) {
           ^
   include/linux/slab.h:561:2: note: Returning pointer, which participates =
in a condition later
           return __kmalloc(size, flags);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:686:9: note: Returning from 'kmalloc'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:686:2: note: Returning pointer, which participates =
in a condition later
           return kmalloc(size, flags | __GFP_ZERO);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/tegra/fb.c:119:7: note: Returning from 'kzalloc'
           fb =3D kzalloc(sizeof(*fb), GFP_KERNEL);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/tegra/fb.c:120:6: note: Assuming 'fb' is non-null
           if (!fb)
               ^~~
   drivers/gpu/drm/tegra/fb.c:120:2: note: Taking false branch
           if (!fb)
           ^
   drivers/gpu/drm/tegra/fb.c:125:7: note: The value 0 is assigned to 'i'
           for (i =3D 0; i < fb->format->num_planes; i++)
                ^~~~~
   drivers/gpu/drm/tegra/fb.c:125:14: note: Assuming 'i' is < field 'num_pl=
anes'
           for (i =3D 0; i < fb->format->num_planes; i++)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/tegra/fb.c:125:2: note: Loop condition is true.  Enterin=
g loop body
           for (i =3D 0; i < fb->format->num_planes; i++)
           ^
   drivers/gpu/drm/tegra/fb.c:126:14: note: Assigned value is garbage or un=
defined
                   fb->obj[i] =3D &planes[i]->gem;
                              ^ ~~~~~~~~~~~~~~~
   3 warnings generated.
   kernel/kallsyms.c:420:3: warning: Call to function 'strcpy' is insecure =
as it does not provide bounding of the memory buffer. Replace unbounded cop=
y functions with analogous functions that support length arguments such as =
'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(buffer, name);
                   ^~~~~~
   kernel/kallsyms.c:420:3: note: Call to function 'strcpy' is insecure as =
it does not provide bounding of the memory buffer. Replace unbounded copy f=
unctions with analogous functions that support length arguments such as 'st=
rlcpy'. CWE-119
                   strcpy(buffer, name);
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
   2 warnings generated.
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   drivers/gpu/drm/sun4i/sun4i_tcon.c:1426:2: warning: Value stored to 'id'=
 is never read [clang-analyzer-deadcode.DeadStores]
           id =3D sun4i_tcon_of_get_id_from_port(port);
           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/sun4i/sun4i_tcon.c:1426:2: note: Value stored to 'id' is=
 never read
           id =3D sun4i_tcon_of_get_id_from_port(port);
           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 warnings generated.
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
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   drivers/iio/pressure/dlhl60d.c:45:8: warning: Excessive padding in 'stru=
ct dlh_state' (32 padding bytes, where 0 is optimal). =

   Optimal fields order: =

   rx_buf, =

   use_interrupt, =

   client, =

   info, =

   completion, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct dlh_state {
   ~~~~~~~^~~~~~~~~~~
   drivers/iio/pressure/dlhl60d.c:45:8: note: Excessive padding in 'struct =
dlh_state' (32 padding bytes, where 0 is optimal). Optimal fields order: rx=
_buf, use_interrupt, client, info, completion, consider reordering the fiel=
ds or adding explicit padding members
   struct dlh_state {
   ~~~~~~~^~~~~~~~~~~
   2 warnings generated.
   drivers/pinctrl/pinctrl-rockchip.c:159:8: warning: Excessive padding in =
'struct rockchip_pin_bank' (9 padding bytes, where 1 is optimal). =

   Optimal fields order: =


vim +126 drivers/gpu/drm/tegra/fb.c

de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen 2013-03-22  109  =

dbc33c7d65536b drivers/gpu/drm/tegra/fb.c  Daniel Stone    2018-03-30  110 =
 static struct drm_framebuffer *tegra_fb_alloc(struct drm_device *drm,
1eb83451ba55d7 drivers/gpu/drm/tegra/fb.c  Ville Syrj=C3=A4l=C3=A4   2015-1=
1-11  111  					      const struct drm_mode_fb_cmd2 *mode_cmd,
de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen 2013-03-22  112 =
 					      struct tegra_bo **planes,
de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen 2013-03-22  113 =
 					      unsigned int num_planes)
de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen 2013-03-22  114 =
 {
dbc33c7d65536b drivers/gpu/drm/tegra/fb.c  Daniel Stone    2018-03-30  115 =
 	struct drm_framebuffer *fb;
de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen 2013-03-22  116 =
 	unsigned int i;
de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen 2013-03-22  117 =
 	int err;
de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen 2013-03-22  118  =

de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen 2013-03-22  119 =
 	fb =3D kzalloc(sizeof(*fb), GFP_KERNEL);
de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen 2013-03-22  120 =
 	if (!fb)
de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen 2013-03-22  121 =
 		return ERR_PTR(-ENOMEM);
de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen 2013-03-22  122  =

dbc33c7d65536b drivers/gpu/drm/tegra/fb.c  Daniel Stone    2018-03-30  123 =
 	drm_helper_mode_fill_fb_struct(drm, fb, mode_cmd);
de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen 2013-03-22  124  =

dbc33c7d65536b drivers/gpu/drm/tegra/fb.c  Daniel Stone    2018-03-30  125 =
 	for (i =3D 0; i < fb->format->num_planes; i++)
dbc33c7d65536b drivers/gpu/drm/tegra/fb.c  Daniel Stone    2018-03-30 @126 =
 		fb->obj[i] =3D &planes[i]->gem;
de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen 2013-03-22  127  =

dbc33c7d65536b drivers/gpu/drm/tegra/fb.c  Daniel Stone    2018-03-30  128 =
 	err =3D drm_framebuffer_init(drm, fb, &tegra_fb_funcs);
de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen 2013-03-22  129 =
 	if (err < 0) {
de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen 2013-03-22  130 =
 		dev_err(drm->dev, "failed to initialize framebuffer: %d\n",
de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen 2013-03-22  131 =
 			err);
de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen 2013-03-22  132 =
 		kfree(fb);
de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen 2013-03-22  133 =
 		return ERR_PTR(err);
de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen 2013-03-22  134 =
 	}
de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen 2013-03-22  135  =

de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen 2013-03-22  136 =
 	return fb;
de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen 2013-03-22  137 =
 }
de2ba664c30fcd drivers/gpu/host1x/drm/fb.c Arto Merilainen 2013-03-22  138  =


:::::: The code at line 126 was first introduced by commit
:::::: dbc33c7d65536bce447057dc6f882decc515047d drm/tegra: tegra_fb -> drm_=
framebuffer

:::::: TO: Daniel Stone <daniels@collabora.com>
:::::: CC: Thierry Reding <treding@nvidia.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6094581564845673514==--

