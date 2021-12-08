Content-Type: multipart/mixed; boundary="===============8953674717112856283=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/i915/selftests/intel_memory_region.c:324 igt_mock_splintered_region() warn: should '1 << ((__builtin_constant_p(size)) ?((size < 2) ?0:63 - __builtin_clzll(size)):((8 <= 4)) ?__ilog2_u32(size):__ilog2_u64(size))' be a 64 bit type?
Date: Wed, 08 Dec 2021 22:10:56 +0800
Message-ID: <202112082247.EBSbNc5i-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8953674717112856283==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Jakub Jelinek <jakub@redhat.com>
CC: "Peter Zijlstra (Intel)" <peterz@infradead.org>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

Hi Jakub,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   2a987e65025e2b79c6d453b78cb5985ac6e5eb26
commit: 2f78788b55baa3410b1ec91a576286abe1ad4d6a ilog2: improve ilog2 for c=
onstant arguments
date:   12 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 12 months ago
config: i386-randconfig-m021-20211207 (https://download.01.org/0day-ci/arch=
ive/20211208/202112082247.EBSbNc5i-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/gpu/drm/i915/selftests/intel_memory_region.c:324 igt_mock_splintere=
d_region() warn: should '1 << ((__builtin_constant_p(size)) ?((size < 2) ?0=
:63 - __builtin_clzll(size)):((8 <=3D 4)) ?__ilog2_u32(size):__ilog2_u64(si=
ze))' be a 64 bit type?
drivers/gpu/drm/i915/gem/selftests/huge_pages.c:187 fake_get_huge_pages() w=
arn: should '1 << ((__builtin_constant_p((~0))) ?((((~0)) < 2) ?0:63 - __bu=
iltin_clzll((~0))):((4 <=3D 4)) ?__ilog2_u32((~0)):__ilog2_u64((~0)))' be a=
 64 bit type?

Old smatch warnings:
drivers/gpu/drm/i915/gem/i915_gem_object.h:127 __i915_gem_object_lock() err=
or: we previously assumed 'ww' could be null (see line 119)
drivers/gpu/drm/i915/gem/i915_gem_object.h:127 __i915_gem_object_lock() err=
or: we previously assumed 'ww' could be null (see line 119)
drivers/gpu/drm/i915/gem/selftests/i915_gem_coherency.c:405 igt_gem_coheren=
cy() error: uninitialized symbol 'found'.

vim +324 drivers/gpu/drm/i915/selftests/intel_memory_region.c

2f0b97ca021186 Matthew Auld 2019-10-08  263  =

09a729b178be1c Matthew Auld 2020-10-21  264  static int igt_mock_splintered=
_region(void *arg)
09a729b178be1c Matthew Auld 2020-10-21  265  {
09a729b178be1c Matthew Auld 2020-10-21  266  	struct intel_memory_region *m=
em =3D arg;
09a729b178be1c Matthew Auld 2020-10-21  267  	struct drm_i915_private *i915=
 =3D mem->i915;
09a729b178be1c Matthew Auld 2020-10-21  268  	struct drm_i915_gem_object *o=
bj;
09a729b178be1c Matthew Auld 2020-10-21  269  	unsigned int expected_order;
09a729b178be1c Matthew Auld 2020-10-21  270  	LIST_HEAD(objects);
09a729b178be1c Matthew Auld 2020-10-21  271  	u64 size;
09a729b178be1c Matthew Auld 2020-10-21  272  	int err =3D 0;
09a729b178be1c Matthew Auld 2020-10-21  273  =

09a729b178be1c Matthew Auld 2020-10-21  274  	/*
09a729b178be1c Matthew Auld 2020-10-21  275  	 * Sanity check we can still =
allocate everything even if the
09a729b178be1c Matthew Auld 2020-10-21  276  	 * mm.max_order !=3D mm.size.=
 i.e our starting address space size is not a
09a729b178be1c Matthew Auld 2020-10-21  277  	 * power-of-two.
09a729b178be1c Matthew Auld 2020-10-21  278  	 */
09a729b178be1c Matthew Auld 2020-10-21  279  =

09a729b178be1c Matthew Auld 2020-10-21  280  	size =3D (SZ_4G - 1) & PAGE_M=
ASK;
09a729b178be1c Matthew Auld 2020-10-21  281  	mem =3D mock_region_create(i9=
15, 0, size, PAGE_SIZE, 0);
09a729b178be1c Matthew Auld 2020-10-21  282  	if (IS_ERR(mem))
09a729b178be1c Matthew Auld 2020-10-21  283  		return PTR_ERR(mem);
09a729b178be1c Matthew Auld 2020-10-21  284  =

09a729b178be1c Matthew Auld 2020-10-21  285  	if (mem->mm.size !=3D size) {
09a729b178be1c Matthew Auld 2020-10-21  286  		pr_err("%s size mismatch(%ll=
u !=3D %llu)\n",
09a729b178be1c Matthew Auld 2020-10-21  287  		       __func__, mem->mm.siz=
e, size);
09a729b178be1c Matthew Auld 2020-10-21  288  		err =3D -EINVAL;
09a729b178be1c Matthew Auld 2020-10-21  289  		goto out_put;
09a729b178be1c Matthew Auld 2020-10-21  290  	}
09a729b178be1c Matthew Auld 2020-10-21  291  =

09a729b178be1c Matthew Auld 2020-10-21  292  	expected_order =3D get_order(=
rounddown_pow_of_two(size));
09a729b178be1c Matthew Auld 2020-10-21  293  	if (mem->mm.max_order !=3D ex=
pected_order) {
09a729b178be1c Matthew Auld 2020-10-21  294  		pr_err("%s order mismatch(%u=
 !=3D %u)\n",
09a729b178be1c Matthew Auld 2020-10-21  295  		       __func__, mem->mm.max=
_order, expected_order);
09a729b178be1c Matthew Auld 2020-10-21  296  		err =3D -EINVAL;
09a729b178be1c Matthew Auld 2020-10-21  297  		goto out_put;
09a729b178be1c Matthew Auld 2020-10-21  298  	}
09a729b178be1c Matthew Auld 2020-10-21  299  =

09a729b178be1c Matthew Auld 2020-10-21  300  	obj =3D igt_object_create(mem=
, &objects, size, 0);
09a729b178be1c Matthew Auld 2020-10-21  301  	if (IS_ERR(obj)) {
09a729b178be1c Matthew Auld 2020-10-21  302  		err =3D PTR_ERR(obj);
09a729b178be1c Matthew Auld 2020-10-21  303  		goto out_close;
09a729b178be1c Matthew Auld 2020-10-21  304  	}
09a729b178be1c Matthew Auld 2020-10-21  305  =

09a729b178be1c Matthew Auld 2020-10-21  306  	close_objects(mem, &objects);
09a729b178be1c Matthew Auld 2020-10-21  307  =

09a729b178be1c Matthew Auld 2020-10-21  308  	/*
09a729b178be1c Matthew Auld 2020-10-21  309  	 * While we should be able al=
locate everything without any flag
09a729b178be1c Matthew Auld 2020-10-21  310  	 * restrictions, if we consid=
er I915_BO_ALLOC_CONTIGUOUS then we are
09a729b178be1c Matthew Auld 2020-10-21  311  	 * actually limited to the la=
rgest power-of-two for the region size i.e
09a729b178be1c Matthew Auld 2020-10-21  312  	 * max_order, due to the inne=
r workings of the buddy allocator. So make
09a729b178be1c Matthew Auld 2020-10-21  313  	 * sure that does indeed hold=
 true.
09a729b178be1c Matthew Auld 2020-10-21  314  	 */
09a729b178be1c Matthew Auld 2020-10-21  315  =

09a729b178be1c Matthew Auld 2020-10-21  316  	obj =3D igt_object_create(mem=
, &objects, size, I915_BO_ALLOC_CONTIGUOUS);
09a729b178be1c Matthew Auld 2020-10-21  317  	if (!IS_ERR(obj)) {
09a729b178be1c Matthew Auld 2020-10-21  318  		pr_err("%s too large contigu=
ous allocation was not rejected\n",
09a729b178be1c Matthew Auld 2020-10-21  319  		       __func__);
09a729b178be1c Matthew Auld 2020-10-21  320  		err =3D -EINVAL;
09a729b178be1c Matthew Auld 2020-10-21  321  		goto out_close;
09a729b178be1c Matthew Auld 2020-10-21  322  	}
09a729b178be1c Matthew Auld 2020-10-21  323  =

09a729b178be1c Matthew Auld 2020-10-21 @324  	obj =3D igt_object_create(mem=
, &objects, rounddown_pow_of_two(size),
09a729b178be1c Matthew Auld 2020-10-21  325  				I915_BO_ALLOC_CONTIGUOUS);
09a729b178be1c Matthew Auld 2020-10-21  326  	if (IS_ERR(obj)) {
09a729b178be1c Matthew Auld 2020-10-21  327  		pr_err("%s largest possible =
contiguous allocation failed\n",
09a729b178be1c Matthew Auld 2020-10-21  328  		       __func__);
09a729b178be1c Matthew Auld 2020-10-21  329  		err =3D PTR_ERR(obj);
09a729b178be1c Matthew Auld 2020-10-21  330  		goto out_close;
09a729b178be1c Matthew Auld 2020-10-21  331  	}
09a729b178be1c Matthew Auld 2020-10-21  332  =

09a729b178be1c Matthew Auld 2020-10-21  333  out_close:
09a729b178be1c Matthew Auld 2020-10-21  334  	close_objects(mem, &objects);
09a729b178be1c Matthew Auld 2020-10-21  335  out_put:
09a729b178be1c Matthew Auld 2020-10-21  336  	intel_memory_region_put(mem);
09a729b178be1c Matthew Auld 2020-10-21  337  	return err;
09a729b178be1c Matthew Auld 2020-10-21  338  }
09a729b178be1c Matthew Auld 2020-10-21  339  =


:::::: The code at line 324 was first introduced by commit
:::::: 09a729b178be1cb20ffce620f7e5bfc04c4a13c0 drm/i915/region: fix max si=
ze calculation

:::::: TO: Matthew Auld <matthew.auld@intel.com>
:::::: CC: Rodrigo Vivi <rodrigo.vivi@intel.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8953674717112856283==--

