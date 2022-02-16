Content-Type: multipart/mixed; boundary="===============7211100472672558252=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/i915/gt/mock_engine.c:48 mock_timeline_pin() warn: inconsistent returns 'tl->hwsp_ggtt->obj->base.resv'.
Date: Wed, 16 Feb 2022 20:45:55 +0800
Message-ID: <202202162041.mXHWdxp1-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7211100472672558252==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
CC: Daniel Vetter <daniel.vetter@ffwll.ch>
CC: "Thomas Hellstr=C3=B6m" <thomas.hellstrom@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   c5d9ae265b105d9a67575fb67bd4650a6fc08e25
commit: 2c8ab3339e398bbbcb0980933e266b93bedaae52 drm/i915: Pin timeline map=
 after first timeline pin, v4.
date:   11 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 11 months ago
config: i386-randconfig-m021-20220214 (https://download.01.org/0day-ci/arch=
ive/20220216/202202162041.mXHWdxp1-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/gpu/drm/i915/gt/mock_engine.c:48 mock_timeline_pin() warn: inconsis=
tent returns 'tl->hwsp_ggtt->obj->base.resv'.

vim +48 drivers/gpu/drm/i915/gt/mock_engine.c

f97fbf9606a1a9 drivers/gpu/drm/i915/selftests/mock_engine.c Chris Wilson   =
   2017-02-13  34  =

2c8ab3339e398b drivers/gpu/drm/i915/gt/mock_engine.c        Maarten Lankhor=
st 2021-03-23  35  static int mock_timeline_pin(struct intel_timeline *tl)
5013eb8cd601c3 drivers/gpu/drm/i915/selftests/mock_engine.c Chris Wilson   =
   2019-01-28  36  {
2c8ab3339e398b drivers/gpu/drm/i915/gt/mock_engine.c        Maarten Lankhor=
st 2021-03-23  37  	int err;
2c8ab3339e398b drivers/gpu/drm/i915/gt/mock_engine.c        Maarten Lankhor=
st 2021-03-23  38  =

2c8ab3339e398b drivers/gpu/drm/i915/gt/mock_engine.c        Maarten Lankhor=
st 2021-03-23  39  	if (WARN_ON(!i915_gem_object_trylock(tl->hwsp_ggtt->obj=
)))
2c8ab3339e398b drivers/gpu/drm/i915/gt/mock_engine.c        Maarten Lankhor=
st 2021-03-23  40  		return -EBUSY;
2c8ab3339e398b drivers/gpu/drm/i915/gt/mock_engine.c        Maarten Lankhor=
st 2021-03-23  41  =

2c8ab3339e398b drivers/gpu/drm/i915/gt/mock_engine.c        Maarten Lankhor=
st 2021-03-23  42  	err =3D intel_timeline_pin_map(tl);
2c8ab3339e398b drivers/gpu/drm/i915/gt/mock_engine.c        Maarten Lankhor=
st 2021-03-23  43  	i915_gem_object_unlock(tl->hwsp_ggtt->obj);
2c8ab3339e398b drivers/gpu/drm/i915/gt/mock_engine.c        Maarten Lankhor=
st 2021-03-23  44  	if (err)
2c8ab3339e398b drivers/gpu/drm/i915/gt/mock_engine.c        Maarten Lankhor=
st 2021-03-23  45  		return err;
2c8ab3339e398b drivers/gpu/drm/i915/gt/mock_engine.c        Maarten Lankhor=
st 2021-03-23  46  =

ccb23d2dcc300d drivers/gpu/drm/i915/gt/mock_engine.c        Chris Wilson   =
   2019-08-15  47  	atomic_inc(&tl->pin_count);
2c8ab3339e398b drivers/gpu/drm/i915/gt/mock_engine.c        Maarten Lankhor=
st 2021-03-23 @48  	return 0;
5013eb8cd601c3 drivers/gpu/drm/i915/selftests/mock_engine.c Chris Wilson   =
   2019-01-28  49  }
5013eb8cd601c3 drivers/gpu/drm/i915/selftests/mock_engine.c Chris Wilson   =
   2019-01-28  50  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7211100472672558252==--

