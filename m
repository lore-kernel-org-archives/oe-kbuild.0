Content-Type: multipart/mixed; boundary="===============1342589900807926793=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [jsarha:topic/chromeos-4.19-s0ix 9356/9999] drivers/gpu/drm/i915/i915_gem.c:3322:19: error: format '%d' expects argument of type 'int', but argument 4 has type 'u64' {aka 'long long unsigned int'}
Date: Mon, 18 Apr 2022 05:25:10 +0800
Message-ID: <202204180502.mVuKQ2TE-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1342589900807926793==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Guenter Roeck <groeck@chromium.org>
CC: Douglas Anderson <dianders@chromium.org>
CC: Rob Clark <robdclark@google.com>

Hi Guenter,

FYI, the error/warning still remains.

tree:   https://github.com/jsarha/linux topic/chromeos-4.19-s0ix
head:   430bdaa0a8c38697780f45a148964d71951df11f
commit: 5a4de0d9ac4bc240999584010ecb3d5f902bf165 [9356/9999] FIXUP: CHROMIU=
M: drm/vgem: fix cache synchronization on arm/arm64 (take three)
:::::: branch date: 2 years, 6 months ago
:::::: commit date: 2 years, 7 months ago
config: x86_64-randconfig-c002 (https://download.01.org/0day-ci/archive/202=
20418/202204180502.mVuKQ2TE-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-19) 11.2.0
reproduce (this is a W=3D1 build):
        # https://github.com/jsarha/linux/commit/5a4de0d9ac4bc240999584010e=
cb3d5f902bf165
        git remote add jsarha https://github.com/jsarha/linux
        git fetch --no-tags jsarha topic/chromeos-4.19-s0ix
        git checkout 5a4de0d9ac4bc240999584010ecb3d5f902bf165
        # save the config file to linux build tree
        mkdir build_dir
        make W=3D1 O=3Dbuild_dir ARCH=3Dx86_64 SHELL=3D/bin/bash drivers/gp=
u/drm/i915/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from include/linux/list.h:9,
                    from include/linux/agp_backend.h:33,
                    from include/drm/drmP.h:35,
                    from drivers/gpu/drm/i915/i915_gem.c:28:
   drivers/gpu/drm/i915/i915_gem.c: In function 'nop_submit_request':
>> drivers/gpu/drm/i915/i915_gem.c:3322:19: error: format '%d' expects argu=
ment of type 'int', but argument 4 has type 'u64' {aka 'long long unsigned =
int'} [-Werror=3Dformat=3D]
    3322 |         GEM_TRACE("%s fence %llx:%d -> -EIO\n",
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
    3323 |                   request->engine->name,
    3324 |                   request->fence.context, request->fence.seqno);
         |                                           ~~~~~~~~~~~~~~~~~~~~
         |                                                         |
         |                                                         u64 {aka=
 long long unsigned int}
   include/linux/kernel.h:683:47: note: in definition of macro '__trace_pri=
ntk_check_format'
     683 |                 ____trace_printk_check_format(fmt, ##args);     =
        \
         |                                               ^~~
   include/linux/kernel.h:720:17: note: in expansion of macro 'do_trace_pri=
ntk'
     720 |                 do_trace_printk(fmt, ##__VA_ARGS__);    \
         |                 ^~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_gem.h:64:24: note: in expansion of macro 'trac=
e_printk'
      64 | #define GEM_TRACE(...) trace_printk(__VA_ARGS__)
         |                        ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_gem.c:3322:9: note: in expansion of macro 'GEM=
_TRACE'
    3322 |         GEM_TRACE("%s fence %llx:%d -> -EIO\n",
         |         ^~~~~~~~~
   drivers/gpu/drm/i915/i915_gem.c:3322:35: note: format string is defined =
here
    3322 |         GEM_TRACE("%s fence %llx:%d -> -EIO\n",
         |                                  ~^
         |                                   |
         |                                   int
         |                                  %lld
   In file included from include/linux/list.h:9,
                    from include/linux/agp_backend.h:33,
                    from include/drm/drmP.h:35,
                    from drivers/gpu/drm/i915/i915_gem.c:28:
   drivers/gpu/drm/i915/i915_gem.c:3322:19: error: format '%d' expects argu=
ment of type 'int', but argument 5 has type 'u64' {aka 'long long unsigned =
int'} [-Werror=3Dformat=3D]
    3322 |         GEM_TRACE("%s fence %llx:%d -> -EIO\n",
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
    3323 |                   request->engine->name,
    3324 |                   request->fence.context, request->fence.seqno);
         |                                           ~~~~~~~~~~~~~~~~~~~~
         |                                                         |
         |                                                         u64 {aka=
 long long unsigned int}
   include/linux/kernel.h:736:43: note: in definition of macro 'do_trace_pr=
intk'
     736 |                 __trace_printk(_THIS_IP_, fmt, ##args);         =
        \
         |                                           ^~~
   drivers/gpu/drm/i915/i915_gem.h:64:24: note: in expansion of macro 'trac=
e_printk'
      64 | #define GEM_TRACE(...) trace_printk(__VA_ARGS__)
         |                        ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_gem.c:3322:9: note: in expansion of macro 'GEM=
_TRACE'
    3322 |         GEM_TRACE("%s fence %llx:%d -> -EIO\n",
         |         ^~~~~~~~~
   drivers/gpu/drm/i915/i915_gem.c:3322:35: note: format string is defined =
here
    3322 |         GEM_TRACE("%s fence %llx:%d -> -EIO\n",
         |                                  ~^
         |                                   |
         |                                   int
         |                                  %lld
   cc1: all warnings being treated as errors


vim +3322 drivers/gpu/drm/i915/i915_gem.c

d80270931314a88 Chris Wilson  2017-02-08  3319  =

e61e0f51ba7974b Chris Wilson  2018-02-21  3320  static void nop_submit_requ=
est(struct i915_request *request)
af7a8ffad9c58de Daniel Vetter 2017-10-11  3321  {
d9b13c4dde6cacd Chris Wilson  2018-03-15 @3322  	GEM_TRACE("%s fence %llx:%=
d -> -EIO\n",
d9b13c4dde6cacd Chris Wilson  2018-03-15  3323  		  request->engine->name,
d9b13c4dde6cacd Chris Wilson  2018-03-15  3324  		  request->fence.context,=
 request->fence.seqno);
af7a8ffad9c58de Daniel Vetter 2017-10-11  3325  	dma_fence_set_error(&reque=
st->fence, -EIO);
af7a8ffad9c58de Daniel Vetter 2017-10-11  3326  =

e61e0f51ba7974b Chris Wilson  2018-02-21  3327  	i915_request_submit(reques=
t);
af7a8ffad9c58de Daniel Vetter 2017-10-11  3328  }
af7a8ffad9c58de Daniel Vetter 2017-10-11  3329  =


:::::: The code at line 3322 was first introduced by commit
:::::: d9b13c4dde6cacd8f2c4385cd6d293b0ac622e0b drm/i915: Trace GEM steps b=
etween submit and wedging

:::::: TO: Chris Wilson <chris@chris-wilson.co.uk>
:::::: CC: Chris Wilson <chris@chris-wilson.co.uk>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1342589900807926793==--

