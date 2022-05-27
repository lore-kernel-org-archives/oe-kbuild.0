Content-Type: multipart/mixed; boundary="===============0512660385157217483=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [jsarha:topic/chromeos-4.19-s0ix 7536/9999] drivers/gpu/drm/i915/i915_gem.c:3200:27: error: format '%d' expects argument of type 'int', but argument 5 has type 'u64' {aka 'long long unsigned int'}
Date: Fri, 27 May 2022 18:28:59 +0800
Message-ID: <202205271838.TOvBtZ7t-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0512660385157217483==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: "Christian K=C3=B6nig" <christian.koenig@amd.com>
CC: Chunming Zhou <david1.zhou@amd.com>
CC: Guenter Roeck <groeck@chromium.org>
CC: Sean Paul <seanpaul@chromium.org>
CC: Gurchetan Singh <gurchetansingh@chromium.org>
CC: "St=C3=A9phane Marchesin" <marcheu@chromium.org>

Hi Christian,

FYI, the error/warning still remains.

tree:   https://github.com/jsarha/linux topic/chromeos-4.19-s0ix
head:   430bdaa0a8c38697780f45a148964d71951df11f
commit: 88445be194e93603d722c82108ed8c47c3f60e65 [7536/9999] UPSTREAM: dma-=
buf: make fence sequence numbers 64 bit v2
:::::: branch date: 2 years, 7 months ago
:::::: commit date: 2 years, 10 months ago
config: x86_64-randconfig-c002 (https://download.01.org/0day-ci/archive/202=
20527/202205271838.TOvBtZ7t-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-1) 11.3.0
reproduce (this is a W=3D1 build):
        # https://github.com/jsarha/linux/commit/88445be194e93603d722c82108=
ed8c47c3f60e65
        git remote add jsarha https://github.com/jsarha/linux
        git fetch --no-tags jsarha topic/chromeos-4.19-s0ix
        git checkout 88445be194e93603d722c82108ed8c47c3f60e65
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=3D1 O=3Dbuild_dir ARCH=3Dx86_64 SHELL=3D/bin/bash drivers/gp=
u/drm/i915/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from include/linux/list.h:9,
                    from include/linux/agp_backend.h:33,
                    from include/drm/drmP.h:35,
                    from drivers/gpu/drm/i915/i915_gem.c:28:
   drivers/gpu/drm/i915/i915_gem.c: In function 'i915_gem_reset_request':
>> drivers/gpu/drm/i915/i915_gem.c:3200:27: error: format '%d' expects argu=
ment of type 'int', but argument 5 has type 'u64' {aka 'long long unsigned =
int'} [-Werror=3Dformat=3D]
    3200 |                 GEM_TRACE("%s pardoned global=3D%d (fence %llx:%=
d), current %d\n",
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~
    3201 |                           engine->name, request->global_seqno,
    3202 |                           request->fence.context, request->fence=
.seqno,
         |                                                   ~~~~~~~~~~~~~~=
~~~~~~
         |                                                                 |
         |                                                                 =
u64 {aka long long unsigned int}
   include/linux/kernel.h:682:47: note: in definition of macro '__trace_pri=
ntk_check_format'
     682 |                 ____trace_printk_check_format(fmt, ##args);     =
        \
         |                                               ^~~
   include/linux/kernel.h:719:17: note: in expansion of macro 'do_trace_pri=
ntk'
     719 |                 do_trace_printk(fmt, ##__VA_ARGS__);    \
         |                 ^~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_gem.h:64:24: note: in expansion of macro 'trac=
e_printk'
      64 | #define GEM_TRACE(...) trace_printk(__VA_ARGS__)
         |                        ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_gem.c:3200:17: note: in expansion of macro 'GE=
M_TRACE'
    3200 |                 GEM_TRACE("%s pardoned global=3D%d (fence %llx:%=
d), current %d\n",
         |                 ^~~~~~~~~
   drivers/gpu/drm/i915/i915_gem.c:3200:63: note: format string is defined =
here
    3200 |                 GEM_TRACE("%s pardoned global=3D%d (fence %llx:%=
d), current %d\n",
         |                                                              ~^
         |                                                               |
         |                                                               int
         |                                                              %lld
   In file included from include/linux/list.h:9,
                    from include/linux/agp_backend.h:33,
                    from include/drm/drmP.h:35,
                    from drivers/gpu/drm/i915/i915_gem.c:28:
   drivers/gpu/drm/i915/i915_gem.c:3200:27: error: format '%d' expects argu=
ment of type 'int', but argument 6 has type 'u64' {aka 'long long unsigned =
int'} [-Werror=3Dformat=3D]
    3200 |                 GEM_TRACE("%s pardoned global=3D%d (fence %llx:%=
d), current %d\n",
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~
    3201 |                           engine->name, request->global_seqno,
    3202 |                           request->fence.context, request->fence=
.seqno,
         |                                                   ~~~~~~~~~~~~~~=
~~~~~~
         |                                                                 |
         |                                                                 =
u64 {aka long long unsigned int}
   include/linux/kernel.h:735:43: note: in definition of macro 'do_trace_pr=
intk'
     735 |                 __trace_printk(_THIS_IP_, fmt, ##args);         =
        \
         |                                           ^~~
   drivers/gpu/drm/i915/i915_gem.h:64:24: note: in expansion of macro 'trac=
e_printk'
      64 | #define GEM_TRACE(...) trace_printk(__VA_ARGS__)
         |                        ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_gem.c:3200:17: note: in expansion of macro 'GE=
M_TRACE'
    3200 |                 GEM_TRACE("%s pardoned global=3D%d (fence %llx:%=
d), current %d\n",
         |                 ^~~~~~~~~
   drivers/gpu/drm/i915/i915_gem.c:3200:63: note: format string is defined =
here
    3200 |                 GEM_TRACE("%s pardoned global=3D%d (fence %llx:%=
d), current %d\n",
         |                                                              ~^
         |                                                               |
         |                                                               int
         |                                                              %lld
   In file included from include/linux/list.h:9,
                    from include/linux/agp_backend.h:33,
                    from include/drm/drmP.h:35,
                    from drivers/gpu/drm/i915/i915_gem.c:28:
   drivers/gpu/drm/i915/i915_gem.c: In function 'nop_submit_request':
   drivers/gpu/drm/i915/i915_gem.c:3322:19: error: format '%d' expects argu=
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
   include/linux/kernel.h:682:47: note: in definition of macro '__trace_pri=
ntk_check_format'
     682 |                 ____trace_printk_check_format(fmt, ##args);     =
        \
         |                                               ^~~
   include/linux/kernel.h:719:17: note: in expansion of macro 'do_trace_pri=
ntk'
     719 |                 do_trace_printk(fmt, ##__VA_ARGS__);    \
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
   include/linux/kernel.h:735:43: note: in definition of macro 'do_trace_pr=
intk'
     735 |                 __trace_printk(_THIS_IP_, fmt, ##args);         =
        \
         |                                           ^~~
   drivers/gpu/drm/i915/i915_gem.h:64:24: note: in expansion of macro 'trac=
e_printk'
      64 | #define GEM_TRACE(...) trace_printk(__VA_ARGS__)


vim +3200 drivers/gpu/drm/i915/i915_gem.c

36193acd54bdf1 Mika Kuoppala 2017-01-17  3171  =

d1d1ebf4120db0 Chris Wilson  2017-07-21  3172  /* Returns the request if it=
 was guilty of the hang */
e61e0f51ba7974 Chris Wilson  2018-02-21  3173  static struct i915_request *
d1d1ebf4120db0 Chris Wilson  2017-07-21  3174  i915_gem_reset_request(struc=
t intel_engine_cs *engine,
bba0869b18e44f Chris Wilson  2018-04-06  3175  		       struct i915_request=
 *request,
bba0869b18e44f Chris Wilson  2018-04-06  3176  		       bool stalled)
61da536204ca0d Mika Kuoppala 2017-01-17  3177  {
71895a085879d7 Mika Kuoppala 2017-01-17  3178  	/* The guilty request will =
get skipped on a hung engine.
71895a085879d7 Mika Kuoppala 2017-01-17  3179  	 *
71895a085879d7 Mika Kuoppala 2017-01-17  3180  	 * Users of client default =
contexts do not rely on logical
71895a085879d7 Mika Kuoppala 2017-01-17  3181  	 * state preserved between =
batches so it is safe to execute
71895a085879d7 Mika Kuoppala 2017-01-17  3182  	 * queued requests followin=
g the hang. Non default contexts
71895a085879d7 Mika Kuoppala 2017-01-17  3183  	 * rely on preserved state,=
 so skipping a batch loses the
71895a085879d7 Mika Kuoppala 2017-01-17  3184  	 * evolution of the state a=
nd it needs to be considered corrupted.
71895a085879d7 Mika Kuoppala 2017-01-17  3185  	 * Executing more queued ba=
tches on top of corrupted state is
71895a085879d7 Mika Kuoppala 2017-01-17  3186  	 * risky. But we take the r=
isk by trying to advance through
71895a085879d7 Mika Kuoppala 2017-01-17  3187  	 * the queued requests in o=
rder to make the client behaviour
71895a085879d7 Mika Kuoppala 2017-01-17  3188  	 * more predictable around =
resets, by not throwing away random
71895a085879d7 Mika Kuoppala 2017-01-17  3189  	 * amount of batches it has=
 prepared for execution. Sophisticated
71895a085879d7 Mika Kuoppala 2017-01-17  3190  	 * clients can use gem_rese=
t_stats_ioctl and dma fence status
71895a085879d7 Mika Kuoppala 2017-01-17  3191  	 * (exported via sync_file =
info ioctl on explicit fences) to observe
71895a085879d7 Mika Kuoppala 2017-01-17  3192  	 * when it loses the contex=
t state and should rebuild accordingly.
71895a085879d7 Mika Kuoppala 2017-01-17  3193  	 *
71895a085879d7 Mika Kuoppala 2017-01-17  3194  	 * The context ban, and ult=
imately the client ban, mechanism are safety
71895a085879d7 Mika Kuoppala 2017-01-17  3195  	 * valves if client submiss=
ion ends up resulting in nothing more than
71895a085879d7 Mika Kuoppala 2017-01-17  3196  	 * subsequent hangs.
71895a085879d7 Mika Kuoppala 2017-01-17  3197  	 */
71895a085879d7 Mika Kuoppala 2017-01-17  3198  =

bba0869b18e44f Chris Wilson  2018-04-06  3199  	if (i915_request_completed(=
request)) {
bba0869b18e44f Chris Wilson  2018-04-06 @3200  		GEM_TRACE("%s pardoned glo=
bal=3D%d (fence %llx:%d), current %d\n",
bba0869b18e44f Chris Wilson  2018-04-06  3201  			  engine->name, request->=
global_seqno,
bba0869b18e44f Chris Wilson  2018-04-06  3202  			  request->fence.context,=
 request->fence.seqno,
bba0869b18e44f Chris Wilson  2018-04-06  3203  			  intel_engine_get_seqno(=
engine));
bba0869b18e44f Chris Wilson  2018-04-06  3204  		stalled =3D false;
bba0869b18e44f Chris Wilson  2018-04-06  3205  	}
bba0869b18e44f Chris Wilson  2018-04-06  3206  =

bba0869b18e44f Chris Wilson  2018-04-06  3207  	if (stalled) {
4e0d64dba816ad Chris Wilson  2018-05-17  3208  		i915_gem_context_mark_guil=
ty(request->gem_context);
6dd7526f6f6c73 Chris Wilson  2018-07-06  3209  		i915_request_skip(request,=
 -EIO);
d1d1ebf4120db0 Chris Wilson  2017-07-21  3210  =

d1d1ebf4120db0 Chris Wilson  2017-07-21  3211  		/* If this context is now =
banned, skip all pending requests. */
4e0d64dba816ad Chris Wilson  2018-05-17  3212  		if (i915_gem_context_is_ba=
nned(request->gem_context))
d1d1ebf4120db0 Chris Wilson  2017-07-21  3213  			engine_skip_context(reque=
st);
61da536204ca0d Mika Kuoppala 2017-01-17  3214  	} else {
d1d1ebf4120db0 Chris Wilson  2017-07-21  3215  		/*
d1d1ebf4120db0 Chris Wilson  2017-07-21  3216  		 * Since this is not the h=
ung engine, it may have advanced
d1d1ebf4120db0 Chris Wilson  2017-07-21  3217  		 * since the hang declarat=
ion. Double check by refinding
d1d1ebf4120db0 Chris Wilson  2017-07-21  3218  		 * the active request at t=
he time of the reset.
d1d1ebf4120db0 Chris Wilson  2017-07-21  3219  		 */
d1d1ebf4120db0 Chris Wilson  2017-07-21  3220  		request =3D i915_gem_find_=
active_request(engine);
d1d1ebf4120db0 Chris Wilson  2017-07-21  3221  		if (request) {
042ed2dbe5b294 Chris Wilson  2018-06-15  3222  			unsigned long flags;
042ed2dbe5b294 Chris Wilson  2018-06-15  3223  =

4e0d64dba816ad Chris Wilson  2018-05-17  3224  			i915_gem_context_mark_inn=
ocent(request->gem_context);
61da536204ca0d Mika Kuoppala 2017-01-17  3225  			dma_fence_set_error(&requ=
est->fence, -EAGAIN);
d1d1ebf4120db0 Chris Wilson  2017-07-21  3226  =

d1d1ebf4120db0 Chris Wilson  2017-07-21  3227  			/* Rewind the engine to r=
eplay the incomplete rq */
042ed2dbe5b294 Chris Wilson  2018-06-15  3228  			spin_lock_irqsave(&engine=
->timeline.lock, flags);
d1d1ebf4120db0 Chris Wilson  2017-07-21  3229  			request =3D list_prev_ent=
ry(request, link);
a89d1f921c1593 Chris Wilson  2018-05-02  3230  			if (&request->link =3D=3D=
 &engine->timeline.requests)
d1d1ebf4120db0 Chris Wilson  2017-07-21  3231  				request =3D NULL;
042ed2dbe5b294 Chris Wilson  2018-06-15  3232  			spin_unlock_irqrestore(&e=
ngine->timeline.lock, flags);
d1d1ebf4120db0 Chris Wilson  2017-07-21  3233  		}
61da536204ca0d Mika Kuoppala 2017-01-17  3234  	}
61da536204ca0d Mika Kuoppala 2017-01-17  3235  =

d1d1ebf4120db0 Chris Wilson  2017-07-21  3236  	return request;
61da536204ca0d Mika Kuoppala 2017-01-17  3237  }
61da536204ca0d Mika Kuoppala 2017-01-17  3238  =


:::::: The code at line 3200 was first introduced by commit
:::::: bba0869b18e44ff2f713c98575ddad8c7c5e9b10 drm/i915: Treat i915_reset_=
engine() as guilty until proven innocent

:::::: TO: Chris Wilson <chris@chris-wilson.co.uk>
:::::: CC: Chris Wilson <chris@chris-wilson.co.uk>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0512660385157217483==--

