Content-Type: multipart/mixed; boundary="===============5061326247748967735=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [drm-intel:drm-intel-next-queued 20/20] drivers/gpu/drm/i915/gt/intel_lrc.c:4613 intel_execlists_create_virtual() warn: assigning (-2) to unsigned variable 've->base.uabi_instance'
Date: Tue, 07 Jan 2020 06:31:56 +0300
Message-ID: <20200107033156.GH3889@kadam>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5061326247748967735==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   git://anongit.freedesktop.org/drm-intel drm-intel-next-queued
head:   f75fc37b5e70b75f21550410f88e2379648120e2
commit: f75fc37b5e70b75f21550410f88e2379648120e2 [20/20] drm/i915/gt: Mark =
up virtual engine uabi_instance

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/gpu/drm/i915/gt/intel_lrc.c:4613 intel_execlists_create_virtual() w=
arn: assigning (-2) to unsigned variable 've->base.uabi_instance'

Old smatch warnings:
drivers/gpu/drm/i915/gt/intel_lrc.c:4612 intel_execlists_create_virtual() w=
arn: assigning (-2) to unsigned variable 've->base.instance'

git remote add drm-intel git://anongit.freedesktop.org/drm-intel
git remote update drm-intel
git checkout f75fc37b5e70b75f21550410f88e2379648120e2
vim +4613 drivers/gpu/drm/i915/gt/intel_lrc.c

6d06779e867243 Chris Wilson   2019-05-21  4587  struct intel_context *
e6ba76480299a0 Chris Wilson   2019-12-21  4588  intel_execlists_create_virt=
ual(struct intel_engine_cs **siblings,
6d06779e867243 Chris Wilson   2019-05-21  4589  			       unsigned int coun=
t)
6d06779e867243 Chris Wilson   2019-05-21  4590  {
6d06779e867243 Chris Wilson   2019-05-21  4591  	struct virtual_engine *ve;
6d06779e867243 Chris Wilson   2019-05-21  4592  	unsigned int n;
6d06779e867243 Chris Wilson   2019-05-21  4593  	int err;
6d06779e867243 Chris Wilson   2019-05-21  4594  =

6d06779e867243 Chris Wilson   2019-05-21  4595  	if (count =3D=3D 0)
6d06779e867243 Chris Wilson   2019-05-21  4596  		return ERR_PTR(-EINVAL);
6d06779e867243 Chris Wilson   2019-05-21  4597  =

6d06779e867243 Chris Wilson   2019-05-21  4598  	if (count =3D=3D 1)
e6ba76480299a0 Chris Wilson   2019-12-21  4599  		return intel_context_crea=
te(siblings[0]);
6d06779e867243 Chris Wilson   2019-05-21  4600  =

6d06779e867243 Chris Wilson   2019-05-21  4601  	ve =3D kzalloc(struct_size=
(ve, siblings, count), GFP_KERNEL);
6d06779e867243 Chris Wilson   2019-05-21  4602  	if (!ve)
6d06779e867243 Chris Wilson   2019-05-21  4603  		return ERR_PTR(-ENOMEM);
6d06779e867243 Chris Wilson   2019-05-21  4604  =

e6ba76480299a0 Chris Wilson   2019-12-21  4605  	ve->base.i915 =3D siblings=
[0]->i915;
f937f5613b6f10 Tvrtko Ursulin 2019-06-21  4606  	ve->base.gt =3D siblings[0=
]->gt;
20af04f3dd5679 Chris Wilson   2019-10-08  4607  	ve->base.uncore =3D siblin=
gs[0]->uncore;
6d06779e867243 Chris Wilson   2019-05-21  4608  	ve->base.id =3D -1;
f75fc37b5e70b7 Chris Wilson   2020-01-06  4609  =

6d06779e867243 Chris Wilson   2019-05-21  4610  	ve->base.class =3D OTHER_C=
LASS;
6d06779e867243 Chris Wilson   2019-05-21  4611  	ve->base.uabi_class =3D I9=
15_ENGINE_CLASS_INVALID;
6d06779e867243 Chris Wilson   2019-05-21  4612  	ve->base.instance =3D I915=
_ENGINE_CLASS_INVALID_VIRTUAL;
f75fc37b5e70b7 Chris Wilson   2020-01-06 @4613  	ve->base.uabi_instance =3D=
 I915_ENGINE_CLASS_INVALID_VIRTUAL;
                                                        ^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
6d06779e867243 Chris Wilson   2019-05-21  4614  =

44d89409a12eb8 Chris Wilson   2019-06-18  4615  	/*
44d89409a12eb8 Chris Wilson   2019-06-18  4616  	 * The decision on whether=
 to submit a request using semaphores
44d89409a12eb8 Chris Wilson   2019-06-18  4617  	 * depends on the saturate=
d state of the engine. We only compute
44d89409a12eb8 Chris Wilson   2019-06-18  4618  	 * this during HW submissi=
on of the request, and we need for this
44d89409a12eb8 Chris Wilson   2019-06-18  4619  	 * state to be globally ap=
plied to all requests being submitted
44d89409a12eb8 Chris Wilson   2019-06-18  4620  	 * to this engine. Virtual=
 engines encompass more than one physical

---
0-DAY kernel test infrastructure                 Open Source Technology Cen=
ter
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org Intel Corpor=
ation
--===============5061326247748967735==--

