Content-Type: multipart/mixed; boundary="===============8464197637452094739=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/amd/amdgpu/amdgpu_display.c:918:31: warning: Division by zero [clang-analyzer-core.DivideZero]
Date: Sat, 29 Jan 2022 17:54:20 +0800
Message-ID: <202201291707.DesVH9Um-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8464197637452094739==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Simon Ser <contact@emersion.fr>
CC: Alex Deucher <alexander.deucher@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   169387e2aa291a4e3cb856053730fe99d6cec06f
commit: 98122e63a7ecc08c4172a17d97a06ef5536eb268 drm/amdgpu: check tiling f=
lags when creating FB on GFX8-
date:   4 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 4 months ago
config: arm-randconfig-c002-20220126 (https://download.01.org/0day-ci/archi=
ve/20220129/202201291707.DesVH9Um-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 2a1b7a=
a016c0f4b5598806205bdfbab1ea2d92c4)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D98122e63a7ecc08c4172a17d97a06ef5536eb268
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 98122e63a7ecc08c4172a17d97a06ef5536eb268
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           if (flags & CLK_DIVIDER_POWER_OF_TWO) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   drivers/clk/clk-divider.c:243:2: note: Taking true branch
           if (flags & CLK_DIVIDER_POWER_OF_TWO) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/clk/clk-divider.c:245:10: note: Calling '__rounddown_pow_of_two'
                   down =3D __rounddown_pow_of_two(down);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/log2.h:67:13: note: The result of the left shift is undefi=
ned due to shifting by '4294967295', which is greater or equal to the width=
 of type 'unsigned long'
           return 1UL << (fls_long(n) - 1);
                      ^  ~~~~~~~~~~~~~~~~~
   12 warnings generated.
   drivers/regulator/ltc3676.c:76:17: warning: Value stored to 'dev' during=
 its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D ltc3676->dev;
                          ^~~   ~~~~~~~~~~~~
   drivers/regulator/ltc3676.c:76:17: note: Value stored to 'dev' during it=
s initialization is never read
           struct device *dev =3D ltc3676->dev;
                          ^~~   ~~~~~~~~~~~~
   drivers/regulator/ltc3676.c:77:6: warning: Value stored to 'dcdc' during=
 its initialization is never read [clang-analyzer-deadcode.DeadStores]
           int dcdc =3D rdev_get_id(rdev);
               ^~~~   ~~~~~~~~~~~~~~~~~
   drivers/regulator/ltc3676.c:77:6: note: Value stored to 'dcdc' during it=
s initialization is never read
           int dcdc =3D rdev_get_id(rdev);
               ^~~~   ~~~~~~~~~~~~~~~~~
   drivers/regulator/ltc3676.c:94:17: warning: Value stored to 'dev' during=
 its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D ltc3676->dev;
                          ^~~   ~~~~~~~~~~~~
   drivers/regulator/ltc3676.c:94:17: note: Value stored to 'dev' during it=
s initialization is never read
           struct device *dev =3D ltc3676->dev;
                          ^~~   ~~~~~~~~~~~~
   drivers/regulator/ltc3676.c:96:6: warning: Value stored to 'dcdc' during=
 its initialization is never read [clang-analyzer-deadcode.DeadStores]
           int dcdc =3D rdev_get_id(rdev);
               ^~~~   ~~~~~~~~~~~~~~~~~
   drivers/regulator/ltc3676.c:96:6: note: Value stored to 'dcdc' during it=
s initialization is never read
           int dcdc =3D rdev_get_id(rdev);
               ^~~~   ~~~~~~~~~~~~~~~~~
   drivers/regulator/ltc3676.c:121:17: warning: Value stored to 'dev' durin=
g its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D ltc3676->dev;
                          ^~~   ~~~~~~~~~~~~
   drivers/regulator/ltc3676.c:121:17: note: Value stored to 'dev' during i=
ts initialization is never read
           struct device *dev =3D ltc3676->dev;
                          ^~~   ~~~~~~~~~~~~
   drivers/regulator/ltc3676.c:122:11: warning: Value stored to 'dcdc' duri=
ng its initialization is never read [clang-analyzer-deadcode.DeadStores]
           int ret, dcdc =3D rdev_get_id(rdev);
                    ^~~~   ~~~~~~~~~~~~~~~~~
   drivers/regulator/ltc3676.c:122:11: note: Value stored to 'dcdc' during =
its initialization is never read
           int ret, dcdc =3D rdev_get_id(rdev);
                    ^~~~   ~~~~~~~~~~~~~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   drivers/phy/cadence/phy-cadence-salvo.c:227:2: warning: Value stored to =
'value' is never read [clang-analyzer-deadcode.DeadStores]
           value |=3D RXDET_IN_P3_32KHZ;
           ^
   drivers/phy/cadence/phy-cadence-salvo.c:227:2: note: Value stored to 'va=
lue' is never read
   Suppressed 7 warnings (6 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
>> drivers/gpu/drm/amd/amdgpu/amdgpu_display.c:918:31: warning: Division by=
 zero [clang-analyzer-core.DivideZero]
           if (rfb->base.pitches[plane] % block_pitch) {
                                        ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_display.c:1135:14: note: Assuming 'i' =
is >=3D field 'num_planes'
           for (i =3D 1; i < rfb->base.format->num_planes; ++i) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_display.c:1135:2: note: Loop condition=
 is false. Execution continues on line 1144
           for (i =3D 1; i < rfb->base.format->num_planes; ++i) {
           ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_display.c:1145:2: note: '?' condition =
is false
           if (ret)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_display.c:1145:6: note: 'ret' is 0
           if (ret)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_display.c:1145:2: note: '?' condition =
is false
           if (ret)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_display.c:1145:2: note: Taking false b=
ranch
           if (ret)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_display.c:1148:6: note: Assuming field=
 'allow_fb_modifiers' is true
           if (!dev->mode_config.allow_fb_modifiers) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_display.c:1148:2: note: '?' condition =
is false
           if (!dev->mode_config.allow_fb_modifiers) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_display.c:1148:24: note: Field 'allow_=
fb_modifiers' is true
           if (!dev->mode_config.allow_fb_modifiers) {
                                 ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_display.c:1148:2: note: '?' condition =
is false
           if (!dev->mode_config.allow_fb_modifiers) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_display.c:1148:2: note: Taking false b=
ranch
           if (!dev->mode_config.allow_fb_modifiers) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_display.c:1156:23: note: Field 'allow_=
fb_modifiers' is true
           if (dev->mode_config.allow_fb_modifiers &&
                                ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_display.c:1156:6: note: Left side of '=
&&' is true
           if (dev->mode_config.allow_fb_modifiers &&
               ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_display.c:1157:6: note: Assuming the c=
ondition is false
               !(rfb->base.flags & DRM_MODE_FB_MODIFIERS)) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))

vim +918 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c

234055fd9728e6 Bas Nieuwenhuizen 2021-05-04  902  =

234055fd9728e6 Bas Nieuwenhuizen 2021-05-04  903  static int amdgpu_display=
_verify_plane(struct amdgpu_framebuffer *rfb, int plane,
234055fd9728e6 Bas Nieuwenhuizen 2021-05-04  904  				       const struct d=
rm_format_info *format,
234055fd9728e6 Bas Nieuwenhuizen 2021-05-04  905  				       unsigned int b=
lock_width, unsigned int block_height,
234055fd9728e6 Bas Nieuwenhuizen 2021-05-04  906  				       unsigned int b=
lock_size_log2)
234055fd9728e6 Bas Nieuwenhuizen 2021-05-04  907  {
234055fd9728e6 Bas Nieuwenhuizen 2021-05-04  908  	unsigned int width =3D r=
fb->base.width /
234055fd9728e6 Bas Nieuwenhuizen 2021-05-04  909  		((plane && plane < form=
at->num_planes) ? format->hsub : 1);
234055fd9728e6 Bas Nieuwenhuizen 2021-05-04  910  	unsigned int height =3D =
rfb->base.height /
234055fd9728e6 Bas Nieuwenhuizen 2021-05-04  911  		((plane && plane < form=
at->num_planes) ? format->vsub : 1);
234055fd9728e6 Bas Nieuwenhuizen 2021-05-04  912  	unsigned int cpp =3D pla=
ne < format->num_planes ? format->cpp[plane] : 1;
234055fd9728e6 Bas Nieuwenhuizen 2021-05-04  913  	unsigned int block_pitch=
 =3D block_width * cpp;
234055fd9728e6 Bas Nieuwenhuizen 2021-05-04  914  	unsigned int min_pitch =
=3D ALIGN(width * cpp, block_pitch);
234055fd9728e6 Bas Nieuwenhuizen 2021-05-04  915  	unsigned int block_size =
=3D 1 << block_size_log2;
234055fd9728e6 Bas Nieuwenhuizen 2021-05-04  916  	uint64_t size;
234055fd9728e6 Bas Nieuwenhuizen 2021-05-04  917  =

234055fd9728e6 Bas Nieuwenhuizen 2021-05-04 @918  	if (rfb->base.pitches[pl=
ane] % block_pitch) {
234055fd9728e6 Bas Nieuwenhuizen 2021-05-04  919  		drm_dbg_kms(rfb->base.d=
ev,
234055fd9728e6 Bas Nieuwenhuizen 2021-05-04  920  			    "pitch %d for plan=
e %d is not a multiple of block pitch %d\n",
234055fd9728e6 Bas Nieuwenhuizen 2021-05-04  921  			    rfb->base.pitches[=
plane], plane, block_pitch);
234055fd9728e6 Bas Nieuwenhuizen 2021-05-04  922  		return -EINVAL;
234055fd9728e6 Bas Nieuwenhuizen 2021-05-04  923  	}
234055fd9728e6 Bas Nieuwenhuizen 2021-05-04  924  	if (rfb->base.pitches[pl=
ane] < min_pitch) {
234055fd9728e6 Bas Nieuwenhuizen 2021-05-04  925  		drm_dbg_kms(rfb->base.d=
ev,
234055fd9728e6 Bas Nieuwenhuizen 2021-05-04  926  			    "pitch %d for plan=
e %d is less than minimum pitch %d\n",
234055fd9728e6 Bas Nieuwenhuizen 2021-05-04  927  			    rfb->base.pitches[=
plane], plane, min_pitch);
234055fd9728e6 Bas Nieuwenhuizen 2021-05-04  928  		return -EINVAL;
234055fd9728e6 Bas Nieuwenhuizen 2021-05-04  929  	}
234055fd9728e6 Bas Nieuwenhuizen 2021-05-04  930  =

234055fd9728e6 Bas Nieuwenhuizen 2021-05-04  931  	/* Force at least natura=
l alignment. */
234055fd9728e6 Bas Nieuwenhuizen 2021-05-04  932  	if (rfb->base.offsets[pl=
ane] % block_size) {
234055fd9728e6 Bas Nieuwenhuizen 2021-05-04  933  		drm_dbg_kms(rfb->base.d=
ev,
234055fd9728e6 Bas Nieuwenhuizen 2021-05-04  934  			    "offset 0x%x for p=
lane %d is not a multiple of block pitch 0x%x\n",
234055fd9728e6 Bas Nieuwenhuizen 2021-05-04  935  			    rfb->base.offsets[=
plane], plane, block_size);
234055fd9728e6 Bas Nieuwenhuizen 2021-05-04  936  		return -EINVAL;
234055fd9728e6 Bas Nieuwenhuizen 2021-05-04  937  	}
234055fd9728e6 Bas Nieuwenhuizen 2021-05-04  938  =

234055fd9728e6 Bas Nieuwenhuizen 2021-05-04  939  	size =3D rfb->base.offse=
ts[plane] +
234055fd9728e6 Bas Nieuwenhuizen 2021-05-04  940  		(uint64_t)rfb->base.pit=
ches[plane] / block_pitch *
234055fd9728e6 Bas Nieuwenhuizen 2021-05-04  941  		block_size * DIV_ROUND_=
UP(height, block_height);
234055fd9728e6 Bas Nieuwenhuizen 2021-05-04  942  =

234055fd9728e6 Bas Nieuwenhuizen 2021-05-04  943  	if (rfb->base.obj[0]->si=
ze < size) {
234055fd9728e6 Bas Nieuwenhuizen 2021-05-04  944  		drm_dbg_kms(rfb->base.d=
ev,
234055fd9728e6 Bas Nieuwenhuizen 2021-05-04  945  			    "BO size 0x%zx is =
less than 0x%llx required for plane %d\n",
234055fd9728e6 Bas Nieuwenhuizen 2021-05-04  946  			    rfb->base.obj[0]->=
size, size, plane);
234055fd9728e6 Bas Nieuwenhuizen 2021-05-04  947  		return -EINVAL;
234055fd9728e6 Bas Nieuwenhuizen 2021-05-04  948  	}
234055fd9728e6 Bas Nieuwenhuizen 2021-05-04  949  =

234055fd9728e6 Bas Nieuwenhuizen 2021-05-04  950  	return 0;
234055fd9728e6 Bas Nieuwenhuizen 2021-05-04  951  }
234055fd9728e6 Bas Nieuwenhuizen 2021-05-04  952  =


:::::: The code at line 918 was first introduced by commit
:::::: 234055fd9728e6726787bc63b24b6450034876cf drm/amdgpu: Use device spec=
ific BO size & stride check.

:::::: TO: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8464197637452094739==--

