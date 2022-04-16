Content-Type: multipart/mixed; boundary="===============5215999554097090514=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/i915/display/intel_bw.c:634:16: warning: Array access (via field 'data_rate') results in a null pointer dereference [clang-analyzer-core.NullDereference]
Date: Sat, 16 Apr 2022 23:40:27 +0800
Message-ID: <202204162342.0qQdw7N6-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5215999554097090514==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: "Ville Syrj=C3=A4l=C3=A4" <ville.syrjala@linux.intel.com>
CC: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   59250f8a7f3a60a2661b84cbafc1e0eb5d05ec9b
commit: 6d8ebef53c2ccea482ed77769b7b5cbb453b7715 drm/i915: Extract intel_bw=
_check_data_rate()
date:   7 weeks ago
:::::: branch date: 17 hours ago
:::::: commit date: 7 weeks ago
config: x86_64-randconfig-c007-20220411 (https://download.01.org/0day-ci/ar=
chive/20220416/202204162342.0qQdw7N6-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c6e83f=
560f06cdfe8aa47b248d8bdc58f947274b)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D6d8ebef53c2ccea482ed77769b7b5cbb453b7715
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 6d8ebef53c2ccea482ed77769b7b5cbb453b7715
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                                   ^
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^
   drivers/gpu/drm/i915/display/intel_bw.c:369:6: note: Assuming 'ret' is 0
           if (ret) {
               ^~~
   drivers/gpu/drm/i915/display/intel_bw.c:369:2: note: Taking false branch
           if (ret) {
           ^
   drivers/gpu/drm/i915/display/intel_bw.c:375:6: note: Assuming field 'typ=
e' is equal to INTEL_DRAM_LPDDR4
           if (dram_info->type =3D=3D INTEL_DRAM_LPDDR4 || dram_info->type =
=3D=3D INTEL_DRAM_LPDDR5)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_bw.c:375:43: note: Left side of '||' =
is true
           if (dram_info->type =3D=3D INTEL_DRAM_LPDDR4 || dram_info->type =
=3D=3D INTEL_DRAM_LPDDR5)
                                                    ^
   drivers/gpu/drm/i915/display/intel_bw.c:376:3: note: Value assigned to '=
num_channels'
                   num_channels *=3D 2;
                   ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_bw.c:378:20: note: '?' condition is t=
rue
           qi.deinterleave =3D qi.deinterleave ? : DIV_ROUND_UP(num_channel=
s, is_y_tile ? 4 : 2);
                             ^
   drivers/gpu/drm/i915/display/intel_bw.c:380:6: note: Assuming 'num_chann=
els' is >=3D field 'max_numchannels'
           if (num_channels < qi.max_numchannels && DISPLAY_VER(dev_priv) >=
=3D 12)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_bw.c:380:40: note: Left side of '&&' =
is false
           if (num_channels < qi.max_numchannels && DISPLAY_VER(dev_priv) >=
=3D 12)
                                                 ^
   drivers/gpu/drm/i915/display/intel_bw.c:383:6: note: Assuming field 'ver=
' is > 11
           if (DISPLAY_VER(dev_priv) > 11 && num_channels > qi.max_numchann=
els)
               ^
   drivers/gpu/drm/i915/i915_drv.h:957:27: note: expanded from macro 'DISPL=
AY_VER'
   #define DISPLAY_VER(i915)       (INTEL_INFO(i915)->display.ver)
                                   ^
   drivers/gpu/drm/i915/display/intel_bw.c:383:6: note: Left side of '&&' i=
s true
           if (DISPLAY_VER(dev_priv) > 11 && num_channels > qi.max_numchann=
els)
               ^
   drivers/gpu/drm/i915/i915_drv.h:957:27: note: expanded from macro 'DISPL=
AY_VER'
   #define DISPLAY_VER(i915)       (INTEL_INFO(i915)->display.ver)
                                   ^
   drivers/gpu/drm/i915/display/intel_bw.c:383:36: note: Assuming 'num_chan=
nels' is <=3D field 'max_numchannels'
           if (DISPLAY_VER(dev_priv) > 11 && num_channels > qi.max_numchann=
els)
                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/gpu/drm/i915/display/intel_bw.c:383:2: note: Taking false branch
           if (DISPLAY_VER(dev_priv) > 11 && num_channels > qi.max_numchann=
els)
           ^
   drivers/gpu/drm/i915/display/intel_bw.c:385:6: note: Assuming field 'max=
_numchannels' is equal to 0
           if (qi.max_numchannels !=3D 0)
               ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_bw.c:385:2: note: Taking false branch
           if (qi.max_numchannels !=3D 0)
           ^
   drivers/gpu/drm/i915/display/intel_bw.c:391:12: note: Assuming '__UNIQUE=
_ID___x531' is >=3D '__UNIQUE_ID___y532'
           maxdebw =3D min(sa->deprogbwlimit * 1000, peakbw * 6 / 10); /* 6=
0% */
                     ^
   include/linux/minmax.h:45:19: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                           ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_bw.c:391:12: note: '?' condition is f=
alse
           maxdebw =3D min(sa->deprogbwlimit * 1000, peakbw * 6 / 10); /* 6=
0% */
                     ^
   include/linux/minmax.h:45:19: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                           ^
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^
   drivers/gpu/drm/i915/display/intel_bw.c:393:47: note: Division by zero
           ipqdepth =3D min(ipqdepthpch, sa->displayrtids / num_channels);
                                                        ^
   include/linux/minmax.h:45:36: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                                            ^
   include/linux/minmax.h:38:17: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                                 ^
   include/linux/minmax.h:32:25: note: expanded from macro '__cmp_once'
                   typeof(y) unique_y =3D (y);               \
                                         ^
>> drivers/gpu/drm/i915/display/intel_bw.c:634:16: warning: Array access (v=
ia field 'data_rate') results in a null pointer dereference [clang-analyzer=
-core.NullDereference]
                   data_rate +=3D bw_state->data_rate[pipe];
                                ^
   drivers/gpu/drm/i915/display/intel_bw.c:900:6: note: Assuming field 'ver=
' is >=3D 11
           if (DISPLAY_VER(dev_priv) < 11)
               ^
   drivers/gpu/drm/i915/i915_drv.h:957:27: note: expanded from macro 'DISPL=
AY_VER'
   #define DISPLAY_VER(i915)       (INTEL_INFO(i915)->display.ver)
                                   ^
   drivers/gpu/drm/i915/display/intel_bw.c:900:2: note: Taking false branch
           if (DISPLAY_VER(dev_priv) < 11)
           ^
   drivers/gpu/drm/i915/display/intel_bw.c:904:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   drivers/gpu/drm/i915/display/intel_bw.c:904:2: note: Taking false branch
           if (ret)
           ^
   drivers/gpu/drm/i915/display/intel_bw.c:908:2: note: Value assigned to '=
new_bw_state'
           new_bw_state =3D intel_atomic_get_new_bw_state(state);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_bw.c:910:6: note: Assuming 'new_bw_st=
ate' is null
           if (new_bw_state &&
               ^~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_bw.c:910:19: note: Left side of '&&' =
is false
           if (new_bw_state &&
                            ^
   drivers/gpu/drm/i915/display/intel_bw.c:919:6: note: Assuming 'changed' =
is true
           if (!changed)
               ^~~~~~~~
   drivers/gpu/drm/i915/display/intel_bw.c:919:2: note: Taking false branch
           if (!changed)
           ^
   drivers/gpu/drm/i915/display/intel_bw.c:923:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   drivers/gpu/drm/i915/display/intel_bw.c:923:2: note: Taking false branch
           if (ret)
           ^
   drivers/gpu/drm/i915/display/intel_bw.c:926:43: note: Passing null point=
er value via 2nd parameter 'bw_state'
           data_rate =3D intel_bw_data_rate(dev_priv, new_bw_state);
                                                    ^~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_bw.c:926:14: note: Calling 'intel_bw_=
data_rate'
           data_rate =3D intel_bw_data_rate(dev_priv, new_bw_state);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_bw.c:633:2: note: Loop condition is t=
rue.  Entering loop body
           for_each_pipe(dev_priv, pipe)
           ^
   drivers/gpu/drm/i915/display/intel_display.h:376:2: note: expanded from =
macro 'for_each_pipe'
           for ((__p) =3D 0; (__p) < I915_MAX_PIPES; (__p)++) \
           ^
   drivers/gpu/drm/i915/display/intel_bw.c:633:2: note: Assuming the condit=
ion is false
           for_each_pipe(dev_priv, pipe)
           ^
   drivers/gpu/drm/i915/display/intel_display.h:377:3: note: expanded from =
macro 'for_each_pipe'
                   for_each_if(INTEL_INFO(__dev_priv)->display.pipe_mask & =
BIT(__p))
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~
   include/drm/drm_util.h:63:36: note: expanded from macro 'for_each_if'
   #define for_each_if(condition) if (!(condition)) {} else
                                      ^~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_bw.c:633:2: note: Taking false branch
           for_each_pipe(dev_priv, pipe)
           ^
   drivers/gpu/drm/i915/display/intel_display.h:377:3: note: expanded from =
macro 'for_each_pipe'
                   for_each_if(INTEL_INFO(__dev_priv)->display.pipe_mask & =
BIT(__p))
                   ^
   include/drm/drm_util.h:63:32: note: expanded from macro 'for_each_if'
   #define for_each_if(condition) if (!(condition)) {} else
                                  ^
   drivers/gpu/drm/i915/display/intel_bw.c:634:16: note: Array access (via =
field 'data_rate') results in a null pointer dereference
                   data_rate +=3D bw_state->data_rate[pipe];
                                ^         ~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_bw.c:1003:32: warning: Access to fiel=
d 'qgv_points_mask' results in a dereference of a null pointer (loaded from=
 variable 'new_bw_state') [clang-analyzer-core.NullDereference]
           new_bw_state->qgv_points_mask =3D ~allowed_points &
           ~~~~~~~~~~~~                  ^
   drivers/gpu/drm/i915/display/intel_bw.c:900:6: note: Assuming field 'ver=
' is >=3D 11
           if (DISPLAY_VER(dev_priv) < 11)
               ^
   drivers/gpu/drm/i915/i915_drv.h:957:27: note: expanded from macro 'DISPL=
AY_VER'
   #define DISPLAY_VER(i915)       (INTEL_INFO(i915)->display.ver)
                                   ^
   drivers/gpu/drm/i915/display/intel_bw.c:900:2: note: Taking false branch
           if (DISPLAY_VER(dev_priv) < 11)
           ^
   drivers/gpu/drm/i915/display/intel_bw.c:903:8: note: Calling 'intel_bw_c=
heck_data_rate'
           ret =3D intel_bw_check_data_rate(state, &changed);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_bw.c:846:2: note: Assuming 'i' is < f=
ield 'num_crtc'
           for_each_oldnew_intel_crtc_in_state(state, crtc, old_crtc_state,
           ^
   drivers/gpu/drm/i915/display/intel_display.h:510:7: note: expanded from =
macro 'for_each_oldnew_intel_crtc_in_state'
                (__i) < (__state)->base.dev->mode_config.num_crtc && \
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_bw.c:846:2: note: Left side of '&&' i=
s true
           for_each_oldnew_intel_crtc_in_state(state, crtc, old_crtc_state,
           ^
   drivers/gpu/drm/i915/display/intel_display.h:510:7: note: expanded from =
macro 'for_each_oldnew_intel_crtc_in_state'
                (__i) < (__state)->base.dev->mode_config.num_crtc && \
                ^
   drivers/gpu/drm/i915/display/intel_bw.c:846:2: note: Loop condition is t=
rue.  Entering loop body
           for_each_oldnew_intel_crtc_in_state(state, crtc, old_crtc_state,

vim +/data_rate +634 drivers/gpu/drm/i915/display/intel_bw.c

c457d9cf256e94 drivers/gpu/drm/i915/intel_bw.c         Ville Syrj=C3=A4l=C3=
=A4  2019-05-24  626  =

c457d9cf256e94 drivers/gpu/drm/i915/intel_bw.c         Ville Syrj=C3=A4l=C3=
=A4  2019-05-24  627  static unsigned int intel_bw_data_rate(struct drm_i91=
5_private *dev_priv,
c457d9cf256e94 drivers/gpu/drm/i915/intel_bw.c         Ville Syrj=C3=A4l=C3=
=A4  2019-05-24  628  				       const struct intel_bw_state *bw_state)
c457d9cf256e94 drivers/gpu/drm/i915/intel_bw.c         Ville Syrj=C3=A4l=C3=
=A4  2019-05-24  629  {
c457d9cf256e94 drivers/gpu/drm/i915/intel_bw.c         Ville Syrj=C3=A4l=C3=
=A4  2019-05-24  630  	unsigned int data_rate =3D 0;
c457d9cf256e94 drivers/gpu/drm/i915/intel_bw.c         Ville Syrj=C3=A4l=C3=
=A4  2019-05-24  631  	enum pipe pipe;
c457d9cf256e94 drivers/gpu/drm/i915/intel_bw.c         Ville Syrj=C3=A4l=C3=
=A4  2019-05-24  632  =

c457d9cf256e94 drivers/gpu/drm/i915/intel_bw.c         Ville Syrj=C3=A4l=C3=
=A4  2019-05-24  633  	for_each_pipe(dev_priv, pipe)
c457d9cf256e94 drivers/gpu/drm/i915/intel_bw.c         Ville Syrj=C3=A4l=C3=
=A4  2019-05-24 @634  		data_rate +=3D bw_state->data_rate[pipe];
c457d9cf256e94 drivers/gpu/drm/i915/intel_bw.c         Ville Syrj=C3=A4l=C3=
=A4  2019-05-24  635  =

cca084692394ad drivers/gpu/drm/i915/display/intel_bw.c Tvrtko Ursulin 2021-=
11-26  636  	if (DISPLAY_VER(dev_priv) >=3D 13 && intel_vtd_active(dev_priv=
))
0788abdef6d110 drivers/gpu/drm/i915/display/intel_bw.c Matt Roper     2021-=
05-11  637  		data_rate =3D data_rate * 105 / 100;
0788abdef6d110 drivers/gpu/drm/i915/display/intel_bw.c Matt Roper     2021-=
05-11  638  =

c457d9cf256e94 drivers/gpu/drm/i915/intel_bw.c         Ville Syrj=C3=A4l=C3=
=A4  2019-05-24  639  	return data_rate;
c457d9cf256e94 drivers/gpu/drm/i915/intel_bw.c         Ville Syrj=C3=A4l=C3=
=A4  2019-05-24  640  }
c457d9cf256e94 drivers/gpu/drm/i915/intel_bw.c         Ville Syrj=C3=A4l=C3=
=A4  2019-05-24  641  =


:::::: The code at line 634 was first introduced by commit
:::::: c457d9cf256e942138a54a2e80349ee7fe20c391 drm/i915: Make sure we have=
 enough memory bandwidth on ICL

:::::: TO: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
:::::: CC: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5215999554097090514==--

