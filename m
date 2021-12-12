Content-Type: multipart/mixed; boundary="===============8238045584754442806=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 5033/6579] drivers/gpu/drm/i915/display/intel_cdclk.c:1639:10: warning: The result of the '/' expression is undefined [clang-analyzer-core.UndefinedBinaryOperatorResult]
Date: Mon, 13 Dec 2021 03:15:30 +0800
Message-ID: <202112130311.0kcIrssq-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8238045584754442806==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: "Ville Syrj=C3=A4l=C3=A4" <ville.syrjala@linux.intel.com>
CC: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
CC: Mika Kahola <mika.kahola@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   ea922272cbe547bdf58da2aaf240d59782c6a009
commit: d4a23930490df39fd076a82649ddba6b3a6c8216 [5033/6579] drm/i915: Allo=
w cdclk squasher to be reconfigured live
:::::: branch date: 2 days ago
:::::: commit date: 5 days ago
config: i386-randconfig-c001-20211207 (https://download.01.org/0day-ci/arch=
ive/20211213/202112130311.0kcIrssq-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 097a1c=
b1d5ebb3a0ec4bcaed8ba3ff6a8e33c00a)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3Dd4a23930490df39fd076a82649ddba6b3a6c8216
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout d4a23930490df39fd076a82649ddba6b3a6c8216
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   drivers/gpu/drm/i915/display/intel_cdclk.c:1217:2: note: Returning witho=
ut writing to 'i915->cdclk.hw.cdclk'
           return IS_DG2(i915);
           ^
   drivers/gpu/drm/i915/display/intel_cdclk.c:1833:6: note: Returning from =
'has_cdclk_squasher'
           if (has_cdclk_squasher(dev_priv))
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
   drivers/gpu/drm/i915/display/intel_cdclk.c:1833:2: note: Assuming the co=
ndition is true
           if (has_cdclk_squasher(dev_priv))
           ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ~~~~=
~~~~~~~~~~~~~^~~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   drivers/gpu/drm/i915/display/intel_cdclk.c:1833:2: note: '?' condition i=
s false
           if (has_cdclk_squasher(dev_priv))
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
   drivers/gpu/drm/i915/display/intel_cdclk.c:1833:2: note: Taking false br=
anch
           if (has_cdclk_squasher(dev_priv))
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/gpu/drm/i915/display/intel_cdclk.c:1836:3: note: Value assigned =
to 'clock'
                   clock =3D dev_priv->cdclk.hw.cdclk;
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_cdclk.c:1838:47: note: Passing value =
via 2nd parameter 'cdclk'
           expected |=3D bxt_cdclk_cd2x_div_sel(dev_priv, clock,
                                                        ^~~~~
   drivers/gpu/drm/i915/display/intel_cdclk.c:1838:14: note: Calling 'bxt_c=
dclk_cd2x_div_sel'
           expected |=3D bxt_cdclk_cd2x_div_sel(dev_priv, clock,
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_cdclk.c:1639:10: note: '__d' initiali=
zed to the value of 'cdclk'
           switch (DIV_ROUND_CLOSEST(vco, cdclk)) {
                   ^
   include/linux/math.h:88:2: note: expanded from macro 'DIV_ROUND_CLOSEST'
           typeof(divisor) __d =3D divisor;                  \
           ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_cdclk.c:1639:10: note: Left side of '=
||' is false
           switch (DIV_ROUND_CLOSEST(vco, cdclk)) {
                   ^
   include/linux/math.h:89:3: note: expanded from macro 'DIV_ROUND_CLOSEST'
           (((typeof(x))-1) > 0 ||                         \
            ^
   drivers/gpu/drm/i915/display/intel_cdclk.c:1639:10: note: Left side of '=
||' is false
           switch (DIV_ROUND_CLOSEST(vco, cdclk)) {
                   ^
   include/linux/math.h:89:3: note: expanded from macro 'DIV_ROUND_CLOSEST'
           (((typeof(x))-1) > 0 ||                         \
            ^
   drivers/gpu/drm/i915/display/intel_cdclk.c:1639:10: note: Assuming '__x'=
 is <=3D 0
           switch (DIV_ROUND_CLOSEST(vco, cdclk)) {
                   ^
   include/linux/math.h:91:5: note: expanded from macro 'DIV_ROUND_CLOSEST'
            (((__x) > 0) =3D=3D ((__d) > 0))) ?                \
              ^~~~~~~~~
   drivers/gpu/drm/i915/display/intel_cdclk.c:1639:10: note: Assuming '__d'=
 is <=3D 0
           switch (DIV_ROUND_CLOSEST(vco, cdclk)) {
                   ^
   include/linux/math.h:91:20: note: expanded from macro 'DIV_ROUND_CLOSEST'
            (((__x) > 0) =3D=3D ((__d) > 0))) ?                \
                             ^~~~~~~~~
   drivers/gpu/drm/i915/display/intel_cdclk.c:1639:10: note: '?' condition =
is true
           switch (DIV_ROUND_CLOSEST(vco, cdclk)) {
                   ^
   include/linux/math.h:89:2: note: expanded from macro 'DIV_ROUND_CLOSEST'
           (((typeof(x))-1) > 0 ||                         \
           ^
   drivers/gpu/drm/i915/display/intel_cdclk.c:1639:10: note: Division by ze=
ro
           switch (DIV_ROUND_CLOSEST(vco, cdclk)) {
                   ^
   include/linux/math.h:92:26: note: expanded from macro 'DIV_ROUND_CLOSEST'
                   (((__x) + ((__d) / 2)) / (__d)) :       \
                    ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
>> drivers/gpu/drm/i915/display/intel_cdclk.c:1639:10: warning: The result =
of the '/' expression is undefined [clang-analyzer-core.UndefinedBinaryOper=
atorResult]
           switch (DIV_ROUND_CLOSEST(vco, cdclk)) {
                   ^
   include/linux/math.h:92:26: note: expanded from macro 'DIV_ROUND_CLOSEST'
                   (((__x) + ((__d) / 2)) / (__d)) :       \
                                          ^
   drivers/gpu/drm/i915/display/intel_cdclk.c:1911:6: note: Assuming field =
'ver' is < 10
           if (DISPLAY_VER(i915) >=3D 10 || IS_BROXTON(i915))
               ^
   drivers/gpu/drm/i915/i915_drv.h:1154:27: note: expanded from macro 'DISP=
LAY_VER'
   #define DISPLAY_VER(i915)       (INTEL_INFO(i915)->display.ver)
                                   ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/gpu/drm/i915/display/intel_cdclk.c:1911:6: note: Left side of '|=
|' is false
           if (DISPLAY_VER(i915) >=3D 10 || IS_BROXTON(i915))
               ^
   drivers/gpu/drm/i915/i915_drv.h:1154:27: note: expanded from macro 'DISP=
LAY_VER'
   #define DISPLAY_VER(i915)       (INTEL_INFO(i915)->display.ver)
                                   ^
   drivers/gpu/drm/i915/display/intel_cdclk.c:1911:2: note: Assuming the co=
ndition is false
           if (DISPLAY_VER(i915) >=3D 10 || IS_BROXTON(i915))
           ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/gpu/drm/i915/display/intel_cdclk.c:1911:2: note: '?' condition i=
s false
           if (DISPLAY_VER(i915) >=3D 10 || IS_BROXTON(i915))
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/gpu/drm/i915/display/intel_cdclk.c:1911:6: note: Field 'ver' is =
< 10
           if (DISPLAY_VER(i915) >=3D 10 || IS_BROXTON(i915))
               ^
   drivers/gpu/drm/i915/i915_drv.h:1154:54: note: expanded from macro 'DISP=
LAY_VER'
   #define DISPLAY_VER(i915)       (INTEL_INFO(i915)->display.ver)
                                                              ^
   drivers/gpu/drm/i915/display/intel_cdclk.c:1911:6: note: Left side of '|=
|' is false
           if (DISPLAY_VER(i915) >=3D 10 || IS_BROXTON(i915))
               ^
   drivers/gpu/drm/i915/i915_drv.h:1154:27: note: expanded from macro 'DISP=
LAY_VER'
   #define DISPLAY_VER(i915)       (INTEL_INFO(i915)->display.ver)
                                   ^
   drivers/gpu/drm/i915/display/intel_cdclk.c:1911:2: note: Assuming the co=
ndition is false
           if (DISPLAY_VER(i915) >=3D 10 || IS_BROXTON(i915))
           ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ~~~~=
~~~~~~~~~~~~~^~~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   drivers/gpu/drm/i915/display/intel_cdclk.c:1911:2: note: '?' condition i=
s true
           if (DISPLAY_VER(i915) >=3D 10 || IS_BROXTON(i915))
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
   drivers/gpu/drm/i915/display/intel_cdclk.c:1911:2: note: Taking true bra=
nch
           if (DISPLAY_VER(i915) >=3D 10 || IS_BROXTON(i915))
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/gpu/drm/i915/display/intel_cdclk.c:1912:3: note: Calling 'bxt_cd=
clk_init_hw'
                   bxt_cdclk_init_hw(i915);
                   ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_cdclk.c:1867:2: note: Calling 'bxt_sa=
nitize_cdclk'
           bxt_sanitize_cdclk(dev_priv);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_cdclk.c:1802:6: note: Assuming field =
'vco' is not equal to 0
           if (dev_priv->cdclk.hw.vco =3D=3D 0 ||
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/gpu/drm/i915/display/intel_cdclk.c:1802:6: note: Left side of '|=
|' is false
           if (dev_priv->cdclk.hw.vco =3D=3D 0 ||

vim +1639 drivers/gpu/drm/i915/display/intel_cdclk.c

0a12e437049786 Ville Syrj=C3=A4l=C3=A4 2019-09-11  1634  =

b41df85a983493 Ville Syrj=C3=A4l=C3=A4 2021-04-30  1635  static u32 bxt_cdc=
lk_cd2x_div_sel(struct drm_i915_private *dev_priv,
b41df85a983493 Ville Syrj=C3=A4l=C3=A4 2021-04-30  1636  				  int cdclk, i=
nt vco)
b41df85a983493 Ville Syrj=C3=A4l=C3=A4 2021-04-30  1637  {
b41df85a983493 Ville Syrj=C3=A4l=C3=A4 2021-04-30  1638  	/* cdclk =3D vco =
/ 2 / div{1,1.5,2,4} */
b41df85a983493 Ville Syrj=C3=A4l=C3=A4 2021-04-30 @1639  	switch (DIV_ROUND=
_CLOSEST(vco, cdclk)) {
b41df85a983493 Ville Syrj=C3=A4l=C3=A4 2021-04-30  1640  	default:
b41df85a983493 Ville Syrj=C3=A4l=C3=A4 2021-04-30  1641  		drm_WARN_ON(&dev=
_priv->drm,
b41df85a983493 Ville Syrj=C3=A4l=C3=A4 2021-04-30  1642  			    cdclk !=3D =
dev_priv->cdclk.hw.bypass);
b41df85a983493 Ville Syrj=C3=A4l=C3=A4 2021-04-30  1643  		drm_WARN_ON(&dev=
_priv->drm, vco !=3D 0);
b41df85a983493 Ville Syrj=C3=A4l=C3=A4 2021-04-30  1644  		fallthrough;
b41df85a983493 Ville Syrj=C3=A4l=C3=A4 2021-04-30  1645  	case 2:
b41df85a983493 Ville Syrj=C3=A4l=C3=A4 2021-04-30  1646  		return BXT_CDCLK=
_CD2X_DIV_SEL_1;
b41df85a983493 Ville Syrj=C3=A4l=C3=A4 2021-04-30  1647  	case 3:
b41df85a983493 Ville Syrj=C3=A4l=C3=A4 2021-04-30  1648  		return BXT_CDCLK=
_CD2X_DIV_SEL_1_5;
b41df85a983493 Ville Syrj=C3=A4l=C3=A4 2021-04-30  1649  	case 4:
b41df85a983493 Ville Syrj=C3=A4l=C3=A4 2021-04-30  1650  		return BXT_CDCLK=
_CD2X_DIV_SEL_2;
b41df85a983493 Ville Syrj=C3=A4l=C3=A4 2021-04-30  1651  	case 8:
b41df85a983493 Ville Syrj=C3=A4l=C3=A4 2021-04-30  1652  		return BXT_CDCLK=
_CD2X_DIV_SEL_4;
b41df85a983493 Ville Syrj=C3=A4l=C3=A4 2021-04-30  1653  	}
b41df85a983493 Ville Syrj=C3=A4l=C3=A4 2021-04-30  1654  }
b41df85a983493 Ville Syrj=C3=A4l=C3=A4 2021-04-30  1655  =


:::::: The code at line 1639 was first introduced by commit
:::::: b41df85a9834932370806df189d5997a4891fd88 drm/i915: Extract some help=
ers to compute cdclk register values

:::::: TO: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
:::::: CC: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8238045584754442806==--

