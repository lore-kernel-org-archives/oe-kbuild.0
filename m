Content-Type: multipart/mixed; boundary="===============2868587989124832032=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [drm-drm-intel:drm-intel-next-queued 9/12] drivers/gpu/drm/i915/i915_perf.c:386 i915_oa_config_release() warn: passing zero to 'PTR_ERR'
Date: Sun, 13 Oct 2019 12:23:14 +0300
Message-ID: <20191013092152.GW13286@kadam>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2868587989124832032==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   git://anongit.freedesktop.org/drm/drm-intel drm-intel-next-queued
head:   5f5c382ecfdd06e17316d1c9f1362522c20cdfef
commit: 6a45008ab7bb5e13b543de0c141b94aaa71d8397 [9/12] drm/i915/perf: allo=
w for CS OA configs to be created lazily

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/gpu/drm/i915/i915_perf.c:386 i915_oa_config_release() warn: passing=
 zero to 'PTR_ERR'

Old smatch warnings:
drivers/gpu/drm/i915/i915_perf.c:388 i915_oa_config_release() warn: passing=
 zero to 'PTR_ERR'
drivers/gpu/drm/i915/i915_perf.c:390 i915_oa_config_release() warn: passing=
 zero to 'PTR_ERR'
drivers/gpu/drm/i915/i915_perf.c:3420 i915_perf_add_config_ioctl() error: d=
ouble unlock 'mutex:&perf->metrics_lock'
drivers/gpu/drm/i915/i915_perf.c:3427 i915_perf_add_config_ioctl() error: d=
ouble unlock 'mutex:&perf->metrics_lock'
drivers/gpu/drm/i915/i915_perf.c:3481 i915_perf_remove_config_ioctl() error=
: double unlock 'mutex:&perf->metrics_lock'
drivers/gpu/drm/i915/i915_perf.c:3490 i915_perf_remove_config_ioctl() error=
: double unlock 'mutex:&perf->metrics_lock'

git remote add drm-drm-intel git://anongit.freedesktop.org/drm/drm-intel
git remote update drm-drm-intel
git checkout 6a45008ab7bb5e13b543de0c141b94aaa71d8397
vim +/PTR_ERR +386 drivers/gpu/drm/i915/i915_perf.c

6a45008ab7bb5e Lionel Landwerlin     2019-10-12  381  void i915_oa_config_r=
elease(struct kref *ref)
f89823c212246d Lionel Landwerlin     2017-08-03  382  {
6a45008ab7bb5e Lionel Landwerlin     2019-10-12  383  	struct i915_oa_confi=
g *oa_config =3D
6a45008ab7bb5e Lionel Landwerlin     2019-10-12  384  		container_of(ref, t=
ypeof(*oa_config), ref);
6a45008ab7bb5e Lionel Landwerlin     2019-10-12  385  =

f89823c212246d Lionel Landwerlin     2017-08-03 @386  	if (!PTR_ERR(oa_conf=
ig->flex_regs))

These should be IS_ERR() instead of PTR_ERR().  I haven't looked at
the conext outside of this email but it feels like a design mistake
that it's possible for these to be error pointers anyway.

f89823c212246d Lionel Landwerlin     2017-08-03  387  		kfree(oa_config->fl=
ex_regs);
f89823c212246d Lionel Landwerlin     2017-08-03  388  	if (!PTR_ERR(oa_conf=
ig->b_counter_regs))
f89823c212246d Lionel Landwerlin     2017-08-03  389  		kfree(oa_config->b_=
counter_regs);
f89823c212246d Lionel Landwerlin     2017-08-03  390  	if (!PTR_ERR(oa_conf=
ig->mux_regs))
f89823c212246d Lionel Landwerlin     2017-08-03  391  		kfree(oa_config->mu=
x_regs);
f89823c212246d Lionel Landwerlin     2017-08-03  392  =

6a45008ab7bb5e Lionel Landwerlin     2019-10-12  393  	kfree_rcu(oa_config,=
 rcu);
f89823c212246d Lionel Landwerlin     2017-08-03  394  }

---
0-DAY kernel test infrastructure                Open Source Technology Cent=
er
https://lists.01.org/pipermail/kbuild-all                   Intel Corporati=
on
--===============2868587989124832032==--

