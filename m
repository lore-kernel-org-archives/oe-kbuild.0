Content-Type: multipart/mixed; boundary="===============6821953147407104831=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [jimc:dd-drm-rfc 13/18] drivers/gpu/drm/arm/display/komeda/komeda_kms.c:121:22: warning: Value stored to 'a' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Tue, 25 Jan 2022 22:43:19 +0800
Message-ID: <202201252247.vq1Bm7yr-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6821953147407104831==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Jim Cromie <jim.cromie@gmail.com>

tree:   https://github.com/jimc/linux.git dd-drm-rfc
head:   c86deb7d09199fd29665d9c68f1e70850132e49a
commit: ed4425a17de1eb5638703d40ed1d002b28963687 [13/18] drm_print: add cho=
ice to use dynamic debug in drm-debug
:::::: branch date: 4 months ago
:::::: commit date: 4 months ago
config: x86_64-randconfig-c007-20211009 (https://download.01.org/0day-ci/ar=
chive/20220125/202201252247.vq1Bm7yr-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 30caca=
39f401ae17927439c0a0bd6d1b1916dd6a)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/jimc/linux/commit/ed4425a17de1eb5638703d40ed1d=
002b28963687
        git remote add jimc https://github.com/jimc/linux.git
        git fetch --no-tags jimc dd-drm-rfc
        git checkout ed4425a17de1eb5638703d40ed1d002b28963687
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
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
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   drivers/mfd/rohm-bd70528.c:282:2: warning: Value stored to 'ret' is neve=
r read [clang-analyzer-deadcode.DeadStores]
           ret =3D regmap_update_bits(bd70528->chip.regmap,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mfd/rohm-bd70528.c:282:2: note: Value stored to 'ret' is never r=
ead
           ret =3D regmap_update_bits(bd70528->chip.regmap,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c:514:8: warnin=
g: Branch condition evaluates to a garbage value [clang-analyzer-core.unini=
tialized.Branch]
           if (!(dflow->en_scaling || dflow->en_img_enhancement))
                 ^
   drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c:1164:8: note:=
 Calling 'komeda_splitter_validate'
           err =3D komeda_splitter_validate(pipe->splitter, conn_st,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c:572:6: note: =
Assuming 'splitter' is non-null
           if (!splitter) {
               ^~~~~~~~~
   drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c:572:2: note: =
Taking false branch
           if (!splitter) {
           ^
   drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c:577:2: note: =
Taking false branch
           if (!in_range(&splitter->hsize, dflow->in_w)) {
           ^
   drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c:583:2: note: =
Taking false branch
           if (!in_range(&splitter->vsize, dflow->in_h)) {
           ^
   drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c:592:2: note: =
Taking true branch
           if (IS_ERR(c_st))
           ^
   drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c:593:3: note: =
Returning without writing to 'l_output->en_scaling'
                   return PTR_ERR(c_st);
                   ^
   drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c:1164:8: note:=
 Returning from 'komeda_splitter_validate'
           err =3D komeda_splitter_validate(pipe->splitter, conn_st,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c:1166:6: note:=
 Assuming 'err' is 0
           if (err)
               ^~~
   drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c:1166:2: note:=
 Taking false branch
           if (err)
           ^
   drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c:1168:8: note:=
 Calling 'komeda_scaler_validate'
           err =3D komeda_scaler_validate(conn, kcrtc_st, &l_dflow);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c:514:8: note: =
Branch condition evaluates to a garbage value
           if (!(dflow->en_scaling || dflow->en_img_enhancement))
                 ^~~~~~~~~~~~~~~~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
>> drivers/gpu/drm/arm/display/komeda/komeda_kms.c:121:22: warning: Value s=
tored to 'a' during its initialization is never read [clang-analyzer-deadco=
de.DeadStores]
                           struct drm_plane *a =3D node->base.plane;
                                             ^   ~~~~~~~~~~~~~~~~
   drivers/gpu/drm/arm/display/komeda/komeda_kms.c:121:22: note: Value stor=
ed to 'a' during its initialization is never read
                           struct drm_plane *a =3D node->base.plane;
                                             ^   ~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/arm/display/komeda/komeda_kms.c:122:22: warning: Value s=
tored to 'b' during its initialization is never read [clang-analyzer-deadco=
de.DeadStores]
                           struct drm_plane *b =3D new->base.plane;
                                             ^   ~~~~~~~~~~~~~~~
   drivers/gpu/drm/arm/display/komeda/komeda_kms.c:122:22: note: Value stor=
ed to 'b' during its initialization is never read
                           struct drm_plane *b =3D new->base.plane;
                                             ^   ~~~~~~~~~~~~~~~
   include/linux/list.h:73:2: warning: Dereference of null pointer [clang-a=
nalyzer-core.NullDereference]
           WRITE_ONCE(prev->next, new);
           ^
   include/asm-generic/rwonce.h:61:2: note: expanded from macro 'WRITE_ONCE'
           __WRITE_ONCE(x, val);                                           \
           ^
   include/asm-generic/rwonce.h:55:30: note: expanded from macro '__WRITE_O=
NCE'
           *(volatile typeof(x) *)&(x) =3D (val);                          =
  \
                                       ^
   drivers/gpu/drm/arm/display/komeda/komeda_kms.c:205:6: note: Assuming 'e=
rr' is 0
           if (err)
               ^~~
   drivers/gpu/drm/arm/display/komeda/komeda_kms.c:205:2: note: Taking fals=
e branch
           if (err)
           ^
   drivers/gpu/drm/arm/display/komeda/komeda_kms.c:212:2: note: Assuming 'i=
' is < field 'num_crtc'
           for_each_new_crtc_in_state(state, crtc, new_crtc_st, i) {
           ^
   include/drm/drm_atomic.h:846:7: note: expanded from macro 'for_each_new_=
crtc_in_state'
                (__i) < (__state)->dev->mode_config.num_crtc;              \
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/arm/display/komeda/komeda_kms.c:212:2: note: Loop condit=
ion is true.  Entering loop body
           for_each_new_crtc_in_state(state, crtc, new_crtc_st, i) {
           ^
   include/drm/drm_atomic.h:845:2: note: expanded from macro 'for_each_new_=
crtc_in_state'
           for ((__i) =3D 0;                                               =
  \
           ^
   drivers/gpu/drm/arm/display/komeda/komeda_kms.c:212:2: note: Assuming fi=
eld 'ptr' is non-null
           for_each_new_crtc_in_state(state, crtc, new_crtc_st, i) {
           ^
   include/drm/drm_atomic.h:848:16: note: expanded from macro 'for_each_new=
_crtc_in_state'
                   for_each_if ((__state)->crtcs[__i].ptr &&               \
                   ~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_util.h:63:38: note: expanded from macro 'for_each_if'
   #define for_each_if(condition) if (!(condition)) {} else
                                        ^~~~~~~~~
   drivers/gpu/drm/arm/display/komeda/komeda_kms.c:212:2: note: Left side o=
f '&&' is true
           for_each_new_crtc_in_state(state, crtc, new_crtc_st, i) {
           ^
   include/drm/drm_atomic.h:848:16: note: expanded from macro 'for_each_new=
_crtc_in_state'
                   for_each_if ((__state)->crtcs[__i].ptr &&               \
                                ^
   drivers/gpu/drm/arm/display/komeda/komeda_kms.c:212:2: note: Taking fals=
e branch
           for_each_new_crtc_in_state(state, crtc, new_crtc_st, i) {
           ^
   include/drm/drm_atomic.h:848:3: note: expanded from macro 'for_each_new_=
crtc_in_state'
                   for_each_if ((__state)->crtcs[__i].ptr &&               \
                   ^
   include/drm/drm_util.h:63:32: note: expanded from macro 'for_each_if'
   #define for_each_if(condition) if (!(condition)) {} else
                                  ^
   drivers/gpu/drm/arm/display/komeda/komeda_kms.c:214:7: note: Assuming 'e=
rr' is 0
                   if (err)
                       ^~~
   drivers/gpu/drm/arm/display/komeda/komeda_kms.c:214:3: note: Taking fals=
e branch
                   if (err)
                   ^
   drivers/gpu/drm/arm/display/komeda/komeda_kms.c:217:9: note: Calling 'ko=
meda_crtc_normalize_zpos'
                   err =3D komeda_crtc_normalize_zpos(crtc, new_crtc_st);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/arm/display/komeda/komeda_kms.c:140:30: note: Left side =
of '&&' is false
           struct komeda_crtc *kcrtc =3D to_kcrtc(crtc);
                                       ^
   drivers/gpu/drm/arm/display/komeda/komeda_kms.h:131:21: note: expanded f=
rom macro 'to_kcrtc'
   #define to_kcrtc(p)     container_of(p, struct komeda_crtc, base)
                           ^
   include/linux/kernel.h:495:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/gpu/drm/arm/display/komeda/komeda_kms.c:140:30: note: Taking fal=
se branch
           struct komeda_crtc *kcrtc =3D to_kcrtc(crtc);
                                       ^
   drivers/gpu/drm/arm/display/komeda/komeda_kms.h:131:21: note: expanded f=
rom macro 'to_kcrtc'
   #define to_kcrtc(p)     container_of(p, struct komeda_crtc, base)
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
   drivers/gpu/drm/arm/display/komeda/komeda_kms.c:140:30: note: Loop condi=
tion is false.  Exiting loop
           struct komeda_crtc *kcrtc =3D to_kcrtc(crtc);
                                       ^
   drivers/gpu/drm/arm/display/komeda/komeda_kms.h:131:21: note: expanded f=
rom macro 'to_kcrtc'
   #define to_kcrtc(p)     container_of(p, struct komeda_crtc, base)
--
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/gpio/gpio-xilinx.c:101:13: warning: The left expression of the c=
ompound assignment is an uninitialized value. The computed value will also =
be garbage [clang-analyzer-core.uninitialized.Assign]
           map[index] &=3D ~(0xFFFFFFFFul << offset);
                      ^
   drivers/gpio/gpio-xilinx.c:520:2: note: Calling 'xgpio_read_ch_all'
           xgpio_read_ch_all(chip, XGPIO_DATA_OFFSET, all);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpio-xilinx.c:133:16: note: Assuming 'bit' is <=3D 'lastbit'
           for (bit =3D 0; bit <=3D lastbit ; bit +=3D 32)
                         ^~~~~~~~~~~~~~
   drivers/gpio/gpio-xilinx.c:133:2: note: Loop condition is true.  Enterin=
g loop body
           for (bit =3D 0; bit <=3D lastbit ; bit +=3D 32)
           ^
   drivers/gpio/gpio-xilinx.c:134:3: note: Calling 'xgpio_read_ch'
                   xgpio_read_ch(chip, reg, bit, a);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpio-xilinx.c:120:2: note: Calling 'xgpio_set_value32'
           xgpio_set_value32(a, bit, xgpio_readreg(addr));
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpio-xilinx.c:98:2: note: 'index' initialized to 0
           const size_t index =3D BIT_WORD(bit);
           ^~~~~~~~~~~~~~~~~~
   drivers/gpio/gpio-xilinx.c:101:13: note: The left expression of the comp=
ound assignment is an uninitialized value. The computed value will also be =
garbage
           map[index] &=3D ~(0xFFFFFFFFul << offset);
           ~~~~~~~~~~ ^
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
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
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
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
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
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
   10 warnings generated.
>> drivers/gpu/drm/i2c/tda998x_drv.c:798:3: warning: Value stored to 'flag0=
' is never read [clang-analyzer-deadcode.DeadStores]
                   flag0 =3D reg_read(priv, REG_INT_FLAGS_0);
                   ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i2c/tda998x_drv.c:798:3: note: Value stored to 'flag0' i=
s never read
                   flag0 =3D reg_read(priv, REG_INT_FLAGS_0);
                   ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/i2c/tda998x_drv.c:799:3: warning: Value stored to 'flag1=
' is never read [clang-analyzer-deadcode.DeadStores]
                   flag1 =3D reg_read(priv, REG_INT_FLAGS_1);
                   ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i2c/tda998x_drv.c:799:3: note: Value stored to 'flag1' i=
s never read
                   flag1 =3D reg_read(priv, REG_INT_FLAGS_1);
                   ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
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
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
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
   drivers/input/keyboard/samsung-keypad.c:88:23: warning: The result of th=
e left shift is undefined because the left operand is negative [clang-analy=
zer-core.UndefinedBinaryOperatorResult]
                           val &=3D ~(1 << col) << 8;
                                              ^
   drivers/input/keyboard/samsung-keypad.c:158:3: note: Calling 'samsung_ke=
ypad_scan'
                   samsung_keypad_scan(keypad, row_state);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/input/keyboard/samsung-keypad.c:85:16: note: Assuming 'col' is <=
 field 'cols'
           for (col =3D 0; col < keypad->cols; col++) {
                         ^~~~~~~~~~~~~~~~~~
   drivers/input/keyboard/samsung-keypad.c:85:2: note: Loop condition is tr=
ue.  Entering loop body
           for (col =3D 0; col < keypad->cols; col++) {
           ^
   drivers/input/keyboard/samsung-keypad.c:86:7: note: Assuming field 'type=
' is equal to KEYPAD_TYPE_S5PV210
                   if (keypad->type =3D=3D KEYPAD_TYPE_S5PV210) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/input/keyboard/samsung-keypad.c:86:3: note: Taking true branch
                   if (keypad->type =3D=3D KEYPAD_TYPE_S5PV210) {
                   ^
   drivers/input/keyboard/samsung-keypad.c:88:23: note: The result of the l=
eft shift is undefined because the left operand is negative
                           val &=3D ~(1 << col) << 8;
                                  ~~~~~~~~~~~ ^
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.

vim +/a +121 drivers/gpu/drm/arm/display/komeda/komeda_kms.c

61f1c4a8ab7575 james qian wang (Arm Technology China  2019-01-03   96) =

109bd7d5f4c2db Lowry Li (Arm Technology China         2019-05-20   97) stat=
ic int komeda_plane_state_list_add(struct drm_plane_state *plane_st,
109bd7d5f4c2db Lowry Li (Arm Technology China         2019-05-20   98) 				=
       struct list_head *zorder_list)
109bd7d5f4c2db Lowry Li (Arm Technology China         2019-05-20   99) {
109bd7d5f4c2db Lowry Li (Arm Technology China         2019-05-20  100) 	str=
uct komeda_plane_state *new =3D to_kplane_st(plane_st);
109bd7d5f4c2db Lowry Li (Arm Technology China         2019-05-20  101) 	str=
uct komeda_plane_state *node, *last;
109bd7d5f4c2db Lowry Li (Arm Technology China         2019-05-20  102) =

109bd7d5f4c2db Lowry Li (Arm Technology China         2019-05-20  103) 	las=
t =3D list_empty(zorder_list) ?
109bd7d5f4c2db Lowry Li (Arm Technology China         2019-05-20  104) 	   =
    NULL : list_last_entry(zorder_list, typeof(*last), zlist_node);
109bd7d5f4c2db Lowry Li (Arm Technology China         2019-05-20  105) =

109bd7d5f4c2db Lowry Li (Arm Technology China         2019-05-20  106) 	/* =
Considering the list sequence is zpos increasing, so if list is empty
109bd7d5f4c2db Lowry Li (Arm Technology China         2019-05-20  107) 	 * =
or the zpos of new node bigger than the last node in list, no need
109bd7d5f4c2db Lowry Li (Arm Technology China         2019-05-20  108) 	 * =
loop and just insert the new one to the tail of the list.
109bd7d5f4c2db Lowry Li (Arm Technology China         2019-05-20  109) 	 */
109bd7d5f4c2db Lowry Li (Arm Technology China         2019-05-20  110) 	if =
(!last || (new->base.zpos > last->base.zpos)) {
109bd7d5f4c2db Lowry Li (Arm Technology China         2019-05-20  111) 		li=
st_add_tail(&new->zlist_node, zorder_list);
109bd7d5f4c2db Lowry Li (Arm Technology China         2019-05-20  112) 		re=
turn 0;
109bd7d5f4c2db Lowry Li (Arm Technology China         2019-05-20  113) 	}
109bd7d5f4c2db Lowry Li (Arm Technology China         2019-05-20  114) =

109bd7d5f4c2db Lowry Li (Arm Technology China         2019-05-20  115) 	/* =
Build the list by zpos increasing */
109bd7d5f4c2db Lowry Li (Arm Technology China         2019-05-20  116) 	lis=
t_for_each_entry(node, zorder_list, zlist_node) {
109bd7d5f4c2db Lowry Li (Arm Technology China         2019-05-20  117) 		if=
 (new->base.zpos < node->base.zpos) {
109bd7d5f4c2db Lowry Li (Arm Technology China         2019-05-20  118) 			l=
ist_add_tail(&new->zlist_node, &node->zlist_node);
109bd7d5f4c2db Lowry Li (Arm Technology China         2019-05-20  119) 			b=
reak;
109bd7d5f4c2db Lowry Li (Arm Technology China         2019-05-20  120) 		} =
else if (node->base.zpos =3D=3D new->base.zpos) {
109bd7d5f4c2db Lowry Li (Arm Technology China         2019-05-20 @121) 			s=
truct drm_plane *a =3D node->base.plane;
109bd7d5f4c2db Lowry Li (Arm Technology China         2019-05-20 @122) 			s=
truct drm_plane *b =3D new->base.plane;
109bd7d5f4c2db Lowry Li (Arm Technology China         2019-05-20  123) =

109bd7d5f4c2db Lowry Li (Arm Technology China         2019-05-20  124) 			/=
* Komeda doesn't support setting a same zpos for
109bd7d5f4c2db Lowry Li (Arm Technology China         2019-05-20  125) 			 =
* different planes.
109bd7d5f4c2db Lowry Li (Arm Technology China         2019-05-20  126) 			 =
*/
109bd7d5f4c2db Lowry Li (Arm Technology China         2019-05-20  127) 			D=
RM_DEBUG_ATOMIC("PLANE: %s and PLANE: %s are configured same zpos: %d.\n",
109bd7d5f4c2db Lowry Li (Arm Technology China         2019-05-20  128) 				=
	 a->name, b->name, node->base.zpos);
109bd7d5f4c2db Lowry Li (Arm Technology China         2019-05-20  129) 			r=
eturn -EINVAL;
109bd7d5f4c2db Lowry Li (Arm Technology China         2019-05-20  130) 		}
109bd7d5f4c2db Lowry Li (Arm Technology China         2019-05-20  131) 	}
109bd7d5f4c2db Lowry Li (Arm Technology China         2019-05-20  132) =

109bd7d5f4c2db Lowry Li (Arm Technology China         2019-05-20  133) 	ret=
urn 0;
109bd7d5f4c2db Lowry Li (Arm Technology China         2019-05-20  134) }
109bd7d5f4c2db Lowry Li (Arm Technology China         2019-05-20  135) =


:::::: The code at line 121 was first introduced by commit
:::::: 109bd7d5f4c2db66541272e5a41aeabd6cfeef95 drm/komeda: Adds zorder sup=
port

:::::: TO: Lowry Li (Arm Technology China) <Lowry.Li@arm.com>
:::::: CC: Liviu Dudau <Liviu.Dudau@arm.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6821953147407104831==--

