Content-Type: multipart/mixed; boundary="===============5850598920623651156=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c:2376 eb_pin_timeline() warn: inconsistent returns '&tl->mutex'.
Date: Mon, 07 Feb 2022 23:18:08 +0800
Message-ID: <202202072340.xZpz7hAb-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5850598920623651156==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Matthew Brost <matthew.brost@intel.com>
CC: John Harrison <John.C.Harrison@Intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   dfd42facf1e4ada021b939b4e19c935dcdd55566
commit: 544460c33821b44c2f0c643121303c3dc3f66ef1 drm/i915: Multi-BB execbuf
date:   4 months ago
:::::: branch date: 19 hours ago
:::::: commit date: 4 months ago
config: i386-randconfig-m021-20220207 (https://download.01.org/0day-ci/arch=
ive/20220207/202202072340.xZpz7hAb-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c:2376 eb_pin_timeline() warn:=
 inconsistent returns '&tl->mutex'.

Old smatch warnings:
drivers/gpu/drm/i915/gem/i915_gem_object.h:195 __i915_gem_object_lock() err=
or: we previously assumed 'ww' could be null (see line 184)
drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c:1926 eb_move_to_gpu() warn: =
maybe use && instead of &
drivers/gpu/drm/i915/gem/i915_gem_context.h:218 i915_gem_context_get_engine=
() warn: inconsistent indenting
drivers/gpu/drm/i915/gem/i915_gem_context.h:220 i915_gem_context_get_engine=
() warn: inconsistent indenting
drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c:3285 i915_gem_do_execbuffer(=
) error: 'out_fence' dereferencing possible ERR_PTR()
drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c:3290 i915_gem_do_execbuffer(=
) error: 'out_fence' dereferencing possible ERR_PTR()

vim +2376 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c

e5dadff4b09376 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c Chris Wilson =
     2019-08-15  2332  =

544460c33821b4 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c Matthew Brost=
     2021-10-14  2333  static int eb_pin_timeline(struct i915_execbuffer *e=
b, struct intel_context *ce,
544460c33821b4 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c Matthew Brost=
     2021-10-14  2334  			   bool throttle)
8f2a1057d6ec21 drivers/gpu/drm/i915/i915_gem_execbuffer.c     Chris Wilson =
     2019-04-25  2335  {
e5dadff4b09376 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c Chris Wilson =
     2019-08-15  2336  	struct intel_timeline *tl;
2bf541ff6d06f4 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c Maarten Lankh=
orst 2020-08-19  2337  	struct i915_request *rq =3D NULL;
8f2a1057d6ec21 drivers/gpu/drm/i915/i915_gem_execbuffer.c     Chris Wilson =
     2019-04-25  2338  =

a4e57f9031ccd5 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c Chris Wilson =
     2019-08-04  2339  	/*
a4e57f9031ccd5 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c Chris Wilson =
     2019-08-04  2340  	 * Take a local wakeref for preparing to dispatch t=
he execbuf as
a4e57f9031ccd5 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c Chris Wilson =
     2019-08-04  2341  	 * we expect to access the hardware fairly frequent=
ly in the
a4e57f9031ccd5 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c Chris Wilson =
     2019-08-04  2342  	 * process, and require the engine to be kept awake=
 between accesses.
a4e57f9031ccd5 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c Chris Wilson =
     2019-08-04  2343  	 * Upon dispatch, we acquire another prolonged wake=
ref that we hold
a4e57f9031ccd5 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c Chris Wilson =
     2019-08-04  2344  	 * until the timeline is idle, which in turn releas=
es the wakeref
a4e57f9031ccd5 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c Chris Wilson =
     2019-08-04  2345  	 * taken on the engine, and the parent device.
a4e57f9031ccd5 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c Chris Wilson =
     2019-08-04  2346  	 */
e5dadff4b09376 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c Chris Wilson =
     2019-08-15  2347  	tl =3D intel_context_timeline_lock(ce);
544460c33821b4 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c Matthew Brost=
     2021-10-14  2348  	if (IS_ERR(tl))
544460c33821b4 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c Matthew Brost=
     2021-10-14  2349  		return PTR_ERR(tl);
a4e57f9031ccd5 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c Chris Wilson =
     2019-08-04  2350  =

a4e57f9031ccd5 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c Chris Wilson =
     2019-08-04  2351  	intel_context_enter(ce);
2bf541ff6d06f4 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c Maarten Lankh=
orst 2020-08-19  2352  	if (throttle)
2bf541ff6d06f4 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c Maarten Lankh=
orst 2020-08-19  2353  		rq =3D eb_throttle(eb, ce);
e5dadff4b09376 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c Chris Wilson =
     2019-08-15  2354  	intel_context_timeline_unlock(tl);
e5dadff4b09376 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c Chris Wilson =
     2019-08-15  2355  =

544460c33821b4 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c Matthew Brost=
     2021-10-14  2356  	if (rq) {
544460c33821b4 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c Matthew Brost=
     2021-10-14  2357  		bool nonblock =3D eb->file->filp->f_flags & O_NONB=
LOCK;
544460c33821b4 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c Matthew Brost=
     2021-10-14  2358  		long timeout =3D nonblock ? 0 : MAX_SCHEDULE_TIMEO=
UT;
544460c33821b4 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c Matthew Brost=
     2021-10-14  2359  =

544460c33821b4 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c Matthew Brost=
     2021-10-14  2360  		if (i915_request_wait(rq, I915_WAIT_INTERRUPTIBLE,
544460c33821b4 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c Matthew Brost=
     2021-10-14  2361  				      timeout) < 0) {
544460c33821b4 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c Matthew Brost=
     2021-10-14  2362  			i915_request_put(rq);
544460c33821b4 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c Matthew Brost=
     2021-10-14  2363  =

544460c33821b4 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c Matthew Brost=
     2021-10-14  2364  			tl =3D intel_context_timeline_lock(ce);
544460c33821b4 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c Matthew Brost=
     2021-10-14  2365  			intel_context_exit(ce);
544460c33821b4 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c Matthew Brost=
     2021-10-14  2366  			intel_context_timeline_unlock(tl);
544460c33821b4 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c Matthew Brost=
     2021-10-14  2367  =

544460c33821b4 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c Matthew Brost=
     2021-10-14  2368  			if (nonblock)
544460c33821b4 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c Matthew Brost=
     2021-10-14  2369  				return -EWOULDBLOCK;
544460c33821b4 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c Matthew Brost=
     2021-10-14  2370  			else
544460c33821b4 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c Matthew Brost=
     2021-10-14  2371  				return -EINTR;
544460c33821b4 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c Matthew Brost=
     2021-10-14  2372  		}
544460c33821b4 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c Matthew Brost=
     2021-10-14  2373  		i915_request_put(rq);
544460c33821b4 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c Matthew Brost=
     2021-10-14  2374  	}
544460c33821b4 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c Matthew Brost=
     2021-10-14  2375  =

544460c33821b4 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c Matthew Brost=
     2021-10-14 @2376  	return 0;
544460c33821b4 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c Matthew Brost=
     2021-10-14  2377  }
544460c33821b4 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c Matthew Brost=
     2021-10-14  2378  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============5850598920623651156==--

