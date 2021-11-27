Content-Type: multipart/mixed; boundary="===============5601574813298583290=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/i915/gt/selftest_migrate.c:182 clear() error: uninitialized symbol 'rq'.
Date: Sun, 28 Nov 2021 05:19:03 +0800
Message-ID: <202111280537.jaQt4TBM-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5601574813298583290==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Chris Wilson <chris@chris-wilson.co.uk>
CC: Matthew Auld <matthew.auld@intel.com>
CC: "Thomas Hellstr=C3=B6m" <thomas.hellstrom@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   86799cdfbcd2308cbad6c1dc983b81595b77b639
commit: 563baae1875cbcac332086cca325cf55a0532b9e drm/i915/gt: Pipelined cle=
ar
date:   5 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 5 months ago
config: i386-randconfig-m021-20211116 (https://download.01.org/0day-ci/arch=
ive/20211128/202111280537.jaQt4TBM-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/gpu/drm/i915/gt/selftest_migrate.c:182 clear() error: uninitialized=
 symbol 'rq'.
drivers/gpu/drm/i915/gt/selftest_migrate.c:193 clear() error: uninitialized=
 symbol 'vaddr'.

Old smatch warnings:
drivers/gpu/drm/i915/gt/selftest_migrate.c:102 copy() error: uninitialized =
symbol 'rq'.
drivers/gpu/drm/i915/gt/selftest_migrate.c:113 copy() error: uninitialized =
symbol 'vaddr'.
drivers/gpu/drm/i915/gem/i915_gem_object.h:182 __i915_gem_object_lock() err=
or: we previously assumed 'ww' could be null (see line 171)

vim +/rq +182 drivers/gpu/drm/i915/gt/selftest_migrate.c

cf586021642d80 Chris Wilson 2021-06-17  131  =

563baae1875cbc Chris Wilson 2021-06-17  132  static int clear(struct intel_=
migrate *migrate,
563baae1875cbc Chris Wilson 2021-06-17  133  		 int (*fn)(struct intel_migr=
ate *migrate,
563baae1875cbc Chris Wilson 2021-06-17  134  			   struct i915_gem_ww_ctx *=
ww,
563baae1875cbc Chris Wilson 2021-06-17  135  			   struct drm_i915_gem_obje=
ct *obj,
563baae1875cbc Chris Wilson 2021-06-17  136  			   u32 value,
563baae1875cbc Chris Wilson 2021-06-17  137  			   struct i915_request **ou=
t),
563baae1875cbc Chris Wilson 2021-06-17  138  		 u32 sz, struct rnd_state *p=
rng)
563baae1875cbc Chris Wilson 2021-06-17  139  {
563baae1875cbc Chris Wilson 2021-06-17  140  	struct drm_i915_private *i915=
 =3D migrate->context->engine->i915;
563baae1875cbc Chris Wilson 2021-06-17  141  	struct drm_i915_gem_object *o=
bj;
563baae1875cbc Chris Wilson 2021-06-17  142  	struct i915_request *rq;
563baae1875cbc Chris Wilson 2021-06-17  143  	struct i915_gem_ww_ctx ww;
563baae1875cbc Chris Wilson 2021-06-17  144  	u32 *vaddr;
563baae1875cbc Chris Wilson 2021-06-17  145  	int err =3D 0;
563baae1875cbc Chris Wilson 2021-06-17  146  	int i;
563baae1875cbc Chris Wilson 2021-06-17  147  =

563baae1875cbc Chris Wilson 2021-06-17  148  	obj =3D create_lmem_or_intern=
al(i915, sz);
563baae1875cbc Chris Wilson 2021-06-17  149  	if (IS_ERR(obj))
563baae1875cbc Chris Wilson 2021-06-17  150  		return 0;
563baae1875cbc Chris Wilson 2021-06-17  151  =

563baae1875cbc Chris Wilson 2021-06-17  152  	for_i915_gem_ww(&ww, err, tru=
e) {
563baae1875cbc Chris Wilson 2021-06-17  153  		err =3D i915_gem_object_lock=
(obj, &ww);
563baae1875cbc Chris Wilson 2021-06-17  154  		if (err)
563baae1875cbc Chris Wilson 2021-06-17  155  			continue;
563baae1875cbc Chris Wilson 2021-06-17  156  =

563baae1875cbc Chris Wilson 2021-06-17  157  		vaddr =3D i915_gem_object_pi=
n_map(obj, I915_MAP_WC);
563baae1875cbc Chris Wilson 2021-06-17  158  		if (IS_ERR(vaddr)) {
563baae1875cbc Chris Wilson 2021-06-17  159  			err =3D PTR_ERR(vaddr);
563baae1875cbc Chris Wilson 2021-06-17  160  			continue;
563baae1875cbc Chris Wilson 2021-06-17  161  		}
563baae1875cbc Chris Wilson 2021-06-17  162  =

563baae1875cbc Chris Wilson 2021-06-17  163  		for (i =3D 0; i < sz / sizeo=
f(u32); i++)
563baae1875cbc Chris Wilson 2021-06-17  164  			vaddr[i] =3D ~i;
563baae1875cbc Chris Wilson 2021-06-17  165  		i915_gem_object_flush_map(ob=
j);
563baae1875cbc Chris Wilson 2021-06-17  166  =

563baae1875cbc Chris Wilson 2021-06-17  167  		err =3D fn(migrate, &ww, obj=
, sz, &rq);
563baae1875cbc Chris Wilson 2021-06-17  168  		if (!err)
563baae1875cbc Chris Wilson 2021-06-17  169  			continue;
563baae1875cbc Chris Wilson 2021-06-17  170  =

563baae1875cbc Chris Wilson 2021-06-17  171  		if (err !=3D -EDEADLK && err=
 !=3D -EINTR && err !=3D -ERESTARTSYS)
563baae1875cbc Chris Wilson 2021-06-17  172  			pr_err("%ps failed, size: %=
u\n", fn, sz);
563baae1875cbc Chris Wilson 2021-06-17  173  		if (rq) {
563baae1875cbc Chris Wilson 2021-06-17  174  			i915_request_wait(rq, 0, HZ=
);
563baae1875cbc Chris Wilson 2021-06-17  175  			i915_request_put(rq);
563baae1875cbc Chris Wilson 2021-06-17  176  		}
563baae1875cbc Chris Wilson 2021-06-17  177  		i915_gem_object_unpin_map(ob=
j);
563baae1875cbc Chris Wilson 2021-06-17  178  	}
563baae1875cbc Chris Wilson 2021-06-17  179  	if (err)
563baae1875cbc Chris Wilson 2021-06-17  180  		goto err_out;
563baae1875cbc Chris Wilson 2021-06-17  181  =

563baae1875cbc Chris Wilson 2021-06-17 @182  	if (rq) {
563baae1875cbc Chris Wilson 2021-06-17  183  		if (i915_request_wait(rq, 0,=
 HZ) < 0) {
563baae1875cbc Chris Wilson 2021-06-17  184  			pr_err("%ps timed out, size=
: %u\n", fn, sz);
563baae1875cbc Chris Wilson 2021-06-17  185  			err =3D -ETIME;
563baae1875cbc Chris Wilson 2021-06-17  186  		}
563baae1875cbc Chris Wilson 2021-06-17  187  		i915_request_put(rq);
563baae1875cbc Chris Wilson 2021-06-17  188  	}
563baae1875cbc Chris Wilson 2021-06-17  189  =

563baae1875cbc Chris Wilson 2021-06-17  190  	for (i =3D 0; !err && i < sz =
/ PAGE_SIZE; i++) {
563baae1875cbc Chris Wilson 2021-06-17  191  		int x =3D i * 1024 + i915_pr=
andom_u32_max_state(1024, prng);
563baae1875cbc Chris Wilson 2021-06-17  192  =

563baae1875cbc Chris Wilson 2021-06-17 @193  		if (vaddr[x] !=3D sz) {
563baae1875cbc Chris Wilson 2021-06-17  194  			pr_err("%ps failed, size: %=
u, offset: %zu\n",
563baae1875cbc Chris Wilson 2021-06-17  195  			       fn, sz, x * sizeof(u=
32));
563baae1875cbc Chris Wilson 2021-06-17  196  			igt_hexdump(vaddr + i * 102=
4, 4096);
563baae1875cbc Chris Wilson 2021-06-17  197  			err =3D -EINVAL;
563baae1875cbc Chris Wilson 2021-06-17  198  		}
563baae1875cbc Chris Wilson 2021-06-17  199  	}
563baae1875cbc Chris Wilson 2021-06-17  200  =

563baae1875cbc Chris Wilson 2021-06-17  201  	i915_gem_object_unpin_map(obj=
);
563baae1875cbc Chris Wilson 2021-06-17  202  err_out:
563baae1875cbc Chris Wilson 2021-06-17  203  	i915_gem_object_put(obj);
563baae1875cbc Chris Wilson 2021-06-17  204  =

563baae1875cbc Chris Wilson 2021-06-17  205  	return err;
563baae1875cbc Chris Wilson 2021-06-17  206  }
563baae1875cbc Chris Wilson 2021-06-17  207  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============5601574813298583290==--

