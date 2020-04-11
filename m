Content-Type: multipart/mixed; boundary="===============7034106852741739079=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH] drm/i915/gt: remove redundant assignment to variable x
Date: Sat, 11 Apr 2020 13:54:09 +0800
Message-ID: <202004111323.JKaGGq1k%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7034106852741739079==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20200410192252.76908-1-colin.king@canonical.com>
References: <20200410192252.76908-1-colin.king@canonical.com>
TO: Colin King <colin.king@canonical.com>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen <joonas.la=
htinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, David A=
irlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Chris Wilson=
 <chris@chris-wilson.co.uk>, intel-gfx(a)lists.freedesktop.org, dri-devel=
(a)lists.freedesktop.org, kernel-janitors(a)vger.kernel.org, linux-kernel(a=
)vger.kernel.org, kernel-janitors(a)vger.kernel.org, linux-kernel(a)vger.ke=
rnel.org

Hi Colin,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm-intel/for-linux-next]
[also build test WARNING on v5.6 next-20200410]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/Colin-King/drm-i915-gt-rem=
ove-redundant-assignment-to-variable-x/20200411-032731
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/gpu/drm/i915/gt/intel_engine_cs.c:1210 print_request() error: unini=
tialized symbol 'x'.

# https://github.com/0day-ci/linux/commit/6ee08d455bba0066e8f5f276dcd43d9e3=
e594dc5
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout 6ee08d455bba0066e8f5f276dcd43d9e3e594dc5
vim +/x +1210 drivers/gpu/drm/i915/gt/intel_engine_cs.c

b7268c5eed0ab4 drivers/gpu/drm/i915/intel_engine_cs.c    Chris Wilson   201=
8-04-18  1201  =

f636edb214a5ff drivers/gpu/drm/i915/intel_engine_cs.c    Chris Wilson   201=
7-10-09  1202  static void print_request(struct drm_printer *m,
e61e0f51ba7974 drivers/gpu/drm/i915/intel_engine_cs.c    Chris Wilson   201=
8-02-21  1203  			  struct i915_request *rq,
f636edb214a5ff drivers/gpu/drm/i915/intel_engine_cs.c    Chris Wilson   201=
7-10-09  1204  			  const char *prefix)
f636edb214a5ff drivers/gpu/drm/i915/intel_engine_cs.c    Chris Wilson   201=
7-10-09  1205  {
ab2681512b4c10 drivers/gpu/drm/i915/intel_engine_cs.c    Chris Wilson   201=
8-03-14  1206  	const char *name =3D rq->fence.ops->get_timeline_name(&rq->=
fence);
96d4f03c20d04c drivers/gpu/drm/i915/intel_engine_cs.c    Chris Wilson   201=
8-05-17  1207  	char buf[80] =3D "";
6ee08d455bba00 drivers/gpu/drm/i915/gt/intel_engine_cs.c Colin Ian King 202=
0-04-10  1208  	int x;
247870ac8ea729 drivers/gpu/drm/i915/intel_engine_cs.c    Chris Wilson   201=
8-04-24  1209  =

247870ac8ea729 drivers/gpu/drm/i915/intel_engine_cs.c    Chris Wilson   201=
8-04-24 @1210  	x =3D print_sched_attr(rq->i915, &rq->sched.attr, buf, x, s=
izeof(buf));
ab2681512b4c10 drivers/gpu/drm/i915/intel_engine_cs.c    Chris Wilson   201=
8-03-14  1211  =

b300fde8965fdd drivers/gpu/drm/i915/intel_engine_cs.c    Chris Wilson   201=
9-02-26  1212  	drm_printf(m, "%s %llx:%llx%s%s %s @ %dms: %s\n",
b7268c5eed0ab4 drivers/gpu/drm/i915/intel_engine_cs.c    Chris Wilson   201=
8-04-18  1213  		   prefix,
b300fde8965fdd drivers/gpu/drm/i915/intel_engine_cs.c    Chris Wilson   201=
9-02-26  1214  		   rq->fence.context, rq->fence.seqno,
8547444137ec61 drivers/gpu/drm/i915/intel_engine_cs.c    Chris Wilson   201=
9-01-29  1215  		   i915_request_completed(rq) ? "!" :
8547444137ec61 drivers/gpu/drm/i915/intel_engine_cs.c    Chris Wilson   201=
9-01-29  1216  		   i915_request_started(rq) ? "*" :
8547444137ec61 drivers/gpu/drm/i915/intel_engine_cs.c    Chris Wilson   201=
9-01-29  1217  		   "",
8c334f24e3b448 drivers/gpu/drm/i915/gt/intel_engine_cs.c Chris Wilson   201=
9-05-01  1218  		   test_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
8c334f24e3b448 drivers/gpu/drm/i915/gt/intel_engine_cs.c Chris Wilson   201=
9-05-01  1219  			    &rq->fence.flags) ? "+" :
52c0fdb25c7c91 drivers/gpu/drm/i915/intel_engine_cs.c    Chris Wilson   201=
9-01-29  1220  		   test_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
8c334f24e3b448 drivers/gpu/drm/i915/gt/intel_engine_cs.c Chris Wilson   201=
9-05-01  1221  			    &rq->fence.flags) ? "-" :
8c334f24e3b448 drivers/gpu/drm/i915/gt/intel_engine_cs.c Chris Wilson   201=
9-05-01  1222  		   "",
247870ac8ea729 drivers/gpu/drm/i915/intel_engine_cs.c    Chris Wilson   201=
8-04-24  1223  		   buf,
f636edb214a5ff drivers/gpu/drm/i915/intel_engine_cs.c    Chris Wilson   201=
7-10-09  1224  		   jiffies_to_msecs(jiffies - rq->emitted_jiffies),
ab2681512b4c10 drivers/gpu/drm/i915/intel_engine_cs.c    Chris Wilson   201=
8-03-14  1225  		   name);
f636edb214a5ff drivers/gpu/drm/i915/intel_engine_cs.c    Chris Wilson   201=
7-10-09  1226  }
f636edb214a5ff drivers/gpu/drm/i915/intel_engine_cs.c    Chris Wilson   201=
7-10-09  1227  =


:::::: The code at line 1210 was first introduced by commit
:::::: 247870ac8ea72916cd26f89e9bc211b97141ecd5 drm/i915: Build request inf=
o on stack before printk

:::::: TO: Chris Wilson <chris@chris-wilson.co.uk>
:::::: CC: Chris Wilson <chris@chris-wilson.co.uk>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7034106852741739079==--

