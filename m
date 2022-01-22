Content-Type: multipart/mixed; boundary="===============2973325506136673605=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [jimc:dd-drm-rfc 13/18] drivers/gpu/drm/arm/display/komeda/komeda_kms.c:121:22: warning: Value stored to 'a' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Sun, 23 Jan 2022 04:15:30 +0800
Message-ID: <202201230137.mBVZ14jX-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2973325506136673605==
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
chive/20220123/202201230137.mBVZ14jX-lkp(a)intel.com/config)
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
   ^
   include/linux/mfd/twl.h:157:9: note: expanded from macro 'TWL_CLASS_IS'
           return ((id) =3D=3D (GET_TWL_REV)) ? 1 : 0; \
                  ^
   include/linux/mfd/twl.h:160:1: note: Returning the value 1, which partic=
ipates in a condition later
   TWL_CLASS_IS(4030, TWL4030_CLASS_ID)
   ^
   include/linux/mfd/twl.h:157:2: note: expanded from macro 'TWL_CLASS_IS'
           return ((id) =3D=3D (GET_TWL_REV)) ? 1 : 0; \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mfd/twl-core.c:1201:6: note: Returning from 'twl_class_is_4030'
           if (twl_class_is_4030()) {
               ^~~~~~~~~~~~~~~~~~~
   drivers/mfd/twl-core.c:1201:2: note: Taking true branch
           if (twl_class_is_4030()) {
           ^
   drivers/mfd/twl-core.c:1202:3: note: 'temp' declared without an initial =
value
                   u8 temp;
                   ^~~~~~~
   drivers/mfd/twl-core.c:1204:3: note: Calling 'twl_i2c_read_u8'
                   twl_i2c_read_u8(TWL4030_MODULE_INTBR, &temp, REG_GPPUPDC=
TR1);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   include/linux/mfd/twl.h:180:9: note: Calling 'twl_i2c_read'
           return twl_i2c_read(mod_no, val, reg, 1);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mfd/twl-core.c:473:7: note: 'regmap' is null
           if (!regmap)
                ^~~~~~
   drivers/mfd/twl-core.c:473:2: note: Taking true branch
           if (!regmap)
           ^
   drivers/mfd/twl-core.c:474:3: note: Returning without writing to '*value'
                   return -EPERM;
                   ^
   include/linux/mfd/twl.h:180:9: note: Returning from 'twl_i2c_read'
           return twl_i2c_read(mod_no, val, reg, 1);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mfd/twl.h:180:2: note: Returning without writing to '*val'
           return twl_i2c_read(mod_no, val, reg, 1);
           ^
   drivers/mfd/twl-core.c:1204:3: note: Returning from 'twl_i2c_read_u8'
                   twl_i2c_read_u8(TWL4030_MODULE_INTBR, &temp, REG_GPPUPDC=
TR1);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/mfd/twl-core.c:1205:8: note: The left expression of the compound=
 assignment is an uninitialized value. The computed value will also be garb=
age
                   temp &=3D ~(SR_I2C_SDA_CTRL_PU | SR_I2C_SCL_CTRL_PU | \
                   ~~~~ ^
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
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
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   drivers/target/target_core_pr.c:227:2: warning: Value stored to 'tpg' is=
 never read [clang-analyzer-deadcode.DeadStores]
           tpg =3D sess->se_tpg;
           ^     ~~~~~~~~~~~~
   drivers/target/target_core_pr.c:227:2: note: Value stored to 'tpg' is ne=
ver read
           tpg =3D sess->se_tpg;
           ^     ~~~~~~~~~~~~
   drivers/target/target_core_pr.c:1022:26: warning: Value stored to 'se_tp=
g' during its initialization is never read [clang-analyzer-deadcode.DeadSto=
res]
           struct se_portal_group *se_tpg =3D nacl->se_tpg;
                                   ^~~~~~   ~~~~~~~~~~~~
   drivers/target/target_core_pr.c:1022:26: note: Value stored to 'se_tpg' =
during its initialization is never read
           struct se_portal_group *se_tpg =3D nacl->se_tpg;
                                   ^~~~~~   ~~~~~~~~~~~~
   drivers/target/target_core_pr.c:1279:39: warning: Value stored to 'tfo' =
during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           const struct target_core_fabric_ops *tfo =3D
                                                ^~~
   drivers/target/target_core_pr.c:1279:39: note: Value stored to 'tfo' dur=
ing its initialization is never read
           const struct target_core_fabric_ops *tfo =3D
                                                ^~~
   drivers/target/target_core_pr.c:1796:3: warning: Value stored to 'dest_s=
e_deve' is never read [clang-analyzer-deadcode.DeadStores]
                   dest_se_deve =3D tidh->dest_se_deve;
                   ^              ~~~~~~~~~~~~~~~~~~
   drivers/target/target_core_pr.c:1796:3: note: Value stored to 'dest_se_d=
eve' is never read
                   dest_se_deve =3D tidh->dest_se_deve;
                   ^              ~~~~~~~~~~~~~~~~~~
   drivers/target/target_core_pr.c:1954:3: warning: Value stored to 'len' i=
s never read [clang-analyzer-deadcode.DeadStores]
                   len +=3D sprintf(buf+len, "No Registrations or Reservati=
ons");
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/target/target_core_pr.c:1954:3: note: Value stored to 'len' is n=
ever read
                   len +=3D sprintf(buf+len, "No Registrations or Reservati=
ons");
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/target/target_core_pr.c:2450:39: warning: Value stored to 'tfo' =
during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           const struct target_core_fabric_ops *tfo =3D se_nacl->se_tpg->se=
_tpg_tfo;
                                                ^~~   ~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   drivers/target/target_core_pr.c:2450:39: note: Value stored to 'tfo' dur=
ing its initialization is never read
           const struct target_core_fabric_ops *tfo =3D se_nacl->se_tpg->se=
_tpg_tfo;
                                                ^~~   ~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   drivers/target/target_core_pr.c:2760:39: warning: Value stored to 'tfo' =
during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           const struct target_core_fabric_ops *tfo =3D nacl->se_tpg->se_tp=
g_tfo;
                                                ^~~   ~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/target/target_core_pr.c:2760:39: note: Value stored to 'tfo' dur=
ing its initialization is never read
           const struct target_core_fabric_ops *tfo =3D nacl->se_tpg->se_tp=
g_tfo;
                                                ^~~   ~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/target/target_core_pr.c:3163:2: warning: Value stored to 'tf_ops=
' is never read [clang-analyzer-deadcode.DeadStores]
           tf_ops =3D se_tpg->se_tpg_tfo;
           ^        ~~~~~~~~~~~~~~~~~~
   drivers/target/target_core_pr.c:3163:2: note: Value stored to 'tf_ops' i=
s never read
           tf_ops =3D se_tpg->se_tpg_tfo;
           ^        ~~~~~~~~~~~~~~~~~~
   drivers/target/target_core_pr.c:3924:3: warning: Value stored to 'add_de=
sc_len' is never read [clang-analyzer-deadcode.DeadStores]
                   add_desc_len =3D 0;
                   ^              ~
   drivers/target/target_core_pr.c:3924:3: note: Value stored to 'add_desc_=
len' is never read
                   add_desc_len =3D 0;
                   ^              ~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   drivers/media/dvb-frontends/horus3a.c:141:23: warning: Value stored to '=
priv' during its initialization is never read [clang-analyzer-deadcode.Dead=
Stores]
           struct horus3a_priv *priv =3D fe->tuner_priv;
                                ^~~~   ~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/horus3a.c:141:23: note: Value stored to 'pri=
v' during its initialization is never read
           struct horus3a_priv *priv =3D fe->tuner_priv;
                                ^~~~   ~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/horus3a.c:149:23: warning: Value stored to '=
priv' during its initialization is never read [clang-analyzer-deadcode.Dead=
Stores]
           struct horus3a_priv *priv =3D fe->tuner_priv;
                                ^~~~   ~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/horus3a.c:149:23: note: Value stored to 'pri=
v' during its initialization is never read
           struct horus3a_priv *priv =3D fe->tuner_priv;
                                ^~~~   ~~~~~~~~~~~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   drivers/media/dvb-frontends/helene.c:432:22: warning: Value stored to 'p=
riv' during its initialization is never read [clang-analyzer-deadcode.DeadS=
tores]
           struct helene_priv *priv =3D fe->tuner_priv;
                               ^~~~   ~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/helene.c:432:22: note: Value stored to 'priv=
' during its initialization is never read
           struct helene_priv *priv =3D fe->tuner_priv;
                               ^~~~   ~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/helene.c:452:22: warning: Value stored to 'p=
riv' during its initialization is never read [clang-analyzer-deadcode.DeadS=
tores]
           struct helene_priv *priv =3D fe->tuner_priv;
                               ^~~~   ~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/helene.c:452:22: note: Value stored to 'priv=
' during its initialization is never read
           struct helene_priv *priv =3D fe->tuner_priv;
                               ^~~~   ~~~~~~~~~~~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
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
   8 warnings generated.
   drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c:366:3: warning: Value=
 stored to 'err' is never read [clang-analyzer-deadcode.DeadStores]
                   err =3D PTR_ERR(kingdisplay->enable_gpio);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c:366:3: note: Value st=
ored to 'err' is never read
                   err =3D PTR_ERR(kingdisplay->enable_gpio);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 7 warnings (7 in non-user code).
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
   6 warnings generated.
   drivers/usb/dwc3/core.c:56:2: warning: Value stored to 'mode' is never r=
ead [clang-analyzer-deadcode.DeadStores]
           mode =3D dwc->dr_mode;
           ^      ~~~~~~~~~~~~
   drivers/usb/dwc3/core.c:56:2: note: Value stored to 'mode' is never read
           mode =3D dwc->dr_mode;
           ^      ~~~~~~~~~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   drivers/usb/dwc3/gadget.c:687:2: warning: Value stored to 'dep' is never=
 read [clang-analyzer-deadcode.DeadStores]
           dep =3D dwc->eps[1];
           ^     ~~~~~~~~~~~
   drivers/usb/dwc3/gadget.c:687:2: note: Value stored to 'dep' is never re=
ad
           dep =3D dwc->eps[1];
           ^     ~~~~~~~~~~~
   drivers/usb/dwc3/gadget.c:698:3: warning: Value stored to 'dep' is never=
 read [clang-analyzer-deadcode.DeadStores]
                   dep =3D dwc->eps[num];
                   ^     ~~~~~~~~~~~~~
   drivers/usb/dwc3/gadget.c:698:3: note: Value stored to 'dep' is never re=
ad
                   dep =3D dwc->eps[num];
                   ^     ~~~~~~~~~~~~~
   drivers/usb/dwc3/gadget.c:1681:39: warning: The result of the left shift=
 is undefined due to shifting '0' by '14', which is unrepresentable in the =
unsigned version of the return type 'int' [clang-analyzer-core.UndefinedBin=
aryOperatorResult]
                   test_frame_number |=3D dep->combo_num << 14;
                                                       ^
   drivers/usb/dwc3/gadget.c:3450:6: note: Assuming the condition is false
           if (!(dep->flags & DWC3_EP_ENABLED)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/dwc3/gadget.c:3450:2: note: Taking false branch
           if (!(dep->flags & DWC3_EP_ENABLED)) {
           ^
   drivers/usb/dwc3/gadget.c:3459:6: note: Assuming 'epnum' is not equal to=
 0
           if (epnum =3D=3D 0 || epnum =3D=3D 1) {
               ^~~~~~~~~~
   drivers/usb/dwc3/gadget.c:3459:6: note: Left side of '||' is false
   drivers/usb/dwc3/gadget.c:3459:20: note: Assuming 'epnum' is not equal t=
o 1
           if (epnum =3D=3D 0 || epnum =3D=3D 1) {
                             ^~~~~~~~~~
   drivers/usb/dwc3/gadget.c:3459:2: note: Taking false branch
           if (epnum =3D=3D 0 || epnum =3D=3D 1) {
           ^
   drivers/usb/dwc3/gadget.c:3464:2: note: Control jumps to 'case 3:'  at l=
ine 3468
           switch (event->endpoint_event) {
           ^
   drivers/usb/dwc3/gadget.c:3469:3: note: Calling 'dwc3_gadget_endpoint_tr=
ansfer_not_ready'
                   dwc3_gadget_endpoint_transfer_not_ready(dep, event);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/dwc3/gadget.c:3325:2: note: Calling 'dwc3_gadget_endpoint_fr=
ame_from_event'
           dwc3_gadget_endpoint_frame_from_event(dep, event);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/dwc3/gadget.c:3241:1: note: Returning without writing to 'de=
p->combo_num'

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
--===============2973325506136673605==--

