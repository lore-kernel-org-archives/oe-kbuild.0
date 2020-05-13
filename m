Content-Type: multipart/mixed; boundary="===============7422740421457065308=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH v5 17/18] READ_ONCE: Use data_race() to avoid KCSAN instrumentation
Date: Wed, 13 May 2020 10:38:19 +0800
Message-ID: <202005131048.vsoHppMT%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7422740421457065308==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20200511204150.27858-18-will@kernel.org>
References: <20200511204150.27858-18-will@kernel.org>
TO: Will Deacon <will@kernel.org>

Hi Will,

I love your patch! Perhaps something to improve:

[auto build test WARNING on next-20200511]
[cannot apply to sparc/master linus/master sparc-next/master v5.7-rc5 v5.7-=
rc4 v5.7-rc3 v5.7-rc5]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/Will-Deacon/Rework-READ_ON=
CE-to-improve-codegen/20200512-050702
base:    4b20e7462caa697f8a2cdab04ed8a5881cc65427
:::::: branch date: 30 hours ago
:::::: commit date: 30 hours ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/gpu/drm/i915/gt/intel_lrc.c:1374 __execlists_schedule_in() warn: su=
btract is higher precedence than shift

Old smatch warnings:
drivers/gpu/drm/i915/gt/intel_lrc.c:5589 intel_execlists_create_virtual() w=
arn: assigning (-2) to unsigned variable 've->base.instance'
drivers/gpu/drm/i915/gt/intel_lrc.c:5590 intel_execlists_create_virtual() w=
arn: assigning (-2) to unsigned variable 've->base.uabi_instance'

# https://github.com/0day-ci/linux/commit/f4da55a875afdc38f9732cf74200a9c62=
9539475
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout f4da55a875afdc38f9732cf74200a9c629539475
vim +1374 drivers/gpu/drm/i915/gt/intel_lrc.c

1883a0a4658eab Tvrtko Ursulin 2020-02-16  1349  =

df403069029dc6 Chris Wilson   2019-08-16  1350  static inline struct intel_=
engine_cs *
df403069029dc6 Chris Wilson   2019-08-16  1351  __execlists_schedule_in(str=
uct i915_request *rq)
df403069029dc6 Chris Wilson   2019-08-16  1352  {
df403069029dc6 Chris Wilson   2019-08-16  1353  	struct intel_engine_cs * c=
onst engine =3D rq->engine;
9f3ccd40acf4a3 Chris Wilson   2019-12-20  1354  	struct intel_context * con=
st ce =3D rq->context;
df403069029dc6 Chris Wilson   2019-08-16  1355  =

df403069029dc6 Chris Wilson   2019-08-16  1356  	intel_context_get(ce);
df403069029dc6 Chris Wilson   2019-08-16  1357  =

9f3ccd40acf4a3 Chris Wilson   2019-12-20  1358  	if (unlikely(intel_context=
_is_banned(ce)))
31b61f0ef9af62 Chris Wilson   2019-11-11  1359  		reset_active(rq, engine);
31b61f0ef9af62 Chris Wilson   2019-11-11  1360  =

b0b10248866455 Chris Wilson   2019-11-02  1361  	if (IS_ENABLED(CONFIG_DRM_=
I915_DEBUG_GEM))
31b61f0ef9af62 Chris Wilson   2019-11-11  1362  		execlists_check_context(c=
e, engine);
b0b10248866455 Chris Wilson   2019-11-02  1363  =

2935ed5339c495 Chris Wilson   2019-10-04  1364  	if (ce->tag) {
2935ed5339c495 Chris Wilson   2019-10-04  1365  		/* Use a fixed tag for OA=
 and friends */
5c4a53e3b1cbc3 Chris Wilson   2020-04-28  1366  		GEM_BUG_ON(ce->tag <=3D B=
ITS_PER_LONG);
2632f174a2e1a5 Chris Wilson   2020-04-28  1367  		ce->lrc.ccid =3D ce->tag;
2935ed5339c495 Chris Wilson   2019-10-04  1368  	} else {
2935ed5339c495 Chris Wilson   2019-10-04  1369  		/* We don't need a strict=
 matching tag, just different values */
5c4a53e3b1cbc3 Chris Wilson   2020-04-28  1370  		unsigned int tag =3D ffs(=
engine->context_tag);
5c4a53e3b1cbc3 Chris Wilson   2020-04-28  1371  =

5c4a53e3b1cbc3 Chris Wilson   2020-04-28  1372  		GEM_BUG_ON(tag =3D=3D 0 |=
| tag >=3D BITS_PER_LONG);
5c4a53e3b1cbc3 Chris Wilson   2020-04-28  1373  		clear_bit(tag - 1, &engin=
e->context_tag);
5c4a53e3b1cbc3 Chris Wilson   2020-04-28 @1374  		ce->lrc.ccid =3D tag << (=
GEN11_SW_CTX_ID_SHIFT - 32);
5c4a53e3b1cbc3 Chris Wilson   2020-04-28  1375  =

5c4a53e3b1cbc3 Chris Wilson   2020-04-28  1376  		BUILD_BUG_ON(BITS_PER_LON=
G > GEN12_MAX_CONTEXT_HW_ID);
2935ed5339c495 Chris Wilson   2019-10-04  1377  	}
2935ed5339c495 Chris Wilson   2019-10-04  1378  =

2632f174a2e1a5 Chris Wilson   2020-04-28  1379  	ce->lrc.ccid |=3D engine->=
execlists.ccid;
2632f174a2e1a5 Chris Wilson   2020-04-28  1380  =

93b0e8fe4753e0 Chris Wilson   2019-11-21  1381  	__intel_gt_pm_get(engine->=
gt);
df403069029dc6 Chris Wilson   2019-08-16  1382  	execlists_context_status_c=
hange(rq, INTEL_CONTEXT_SCHEDULE_IN);
df403069029dc6 Chris Wilson   2019-08-16  1383  	intel_engine_context_in(en=
gine);
df403069029dc6 Chris Wilson   2019-08-16  1384  =

df403069029dc6 Chris Wilson   2019-08-16  1385  	return engine;
df403069029dc6 Chris Wilson   2019-08-16  1386  }
df403069029dc6 Chris Wilson   2019-08-16  1387  =


:::::: The code at line 1374 was first introduced by commit
:::::: 5c4a53e3b1cbc38d0906e382f1037290658759bb drm/i915/execlists: Track i=
nflight CCID

:::::: TO: Chris Wilson <chris@chris-wilson.co.uk>
:::::: CC: Chris Wilson <chris@chris-wilson.co.uk>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7422740421457065308==--

