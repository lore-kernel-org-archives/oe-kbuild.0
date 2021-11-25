Content-Type: multipart/mixed; boundary="===============8523456772354588057=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/i915/gt/selftest_migrate.c:102 copy() error: uninitialized symbol 'rq'.
Date: Fri, 26 Nov 2021 07:45:11 +0800
Message-ID: <202111260712.wpRC6Dh0-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8523456772354588057==
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
head:   8ced7ca3570333998ad2088d5a6275701970e28e
commit: cf586021642d8017cde111b7dd1ba86224e9da51 drm/i915/gt: Pipelined pag=
e migration
date:   5 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 5 months ago
config: i386-randconfig-m021-20211116 (https://download.01.org/0day-ci/arch=
ive/20211126/202111260712.wpRC6Dh0-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/gpu/drm/i915/gt/selftest_migrate.c:102 copy() error: uninitialized =
symbol 'rq'.
drivers/gpu/drm/i915/gt/selftest_migrate.c:113 copy() error: uninitialized =
symbol 'vaddr'.

Old smatch warnings:
drivers/gpu/drm/i915/gem/i915_gem_object.h:182 __i915_gem_object_lock() err=
or: we previously assumed 'ww' could be null (see line 171)

vim +/rq +102 drivers/gpu/drm/i915/gt/selftest_migrate.c

cf586021642d801 Chris Wilson 2021-06-17   31  =

cf586021642d801 Chris Wilson 2021-06-17   32  static int copy(struct intel_=
migrate *migrate,
cf586021642d801 Chris Wilson 2021-06-17   33  		int (*fn)(struct intel_migr=
ate *migrate,
cf586021642d801 Chris Wilson 2021-06-17   34  			  struct i915_gem_ww_ctx *=
ww,
cf586021642d801 Chris Wilson 2021-06-17   35  			  struct drm_i915_gem_obje=
ct *src,
cf586021642d801 Chris Wilson 2021-06-17   36  			  struct drm_i915_gem_obje=
ct *dst,
cf586021642d801 Chris Wilson 2021-06-17   37  			  struct i915_request **ou=
t),
cf586021642d801 Chris Wilson 2021-06-17   38  		u32 sz, struct rnd_state *p=
rng)
cf586021642d801 Chris Wilson 2021-06-17   39  {
cf586021642d801 Chris Wilson 2021-06-17   40  	struct drm_i915_private *i91=
5 =3D migrate->context->engine->i915;
cf586021642d801 Chris Wilson 2021-06-17   41  	struct drm_i915_gem_object *=
src, *dst;
cf586021642d801 Chris Wilson 2021-06-17   42  	struct i915_request *rq;
cf586021642d801 Chris Wilson 2021-06-17   43  	struct i915_gem_ww_ctx ww;
cf586021642d801 Chris Wilson 2021-06-17   44  	u32 *vaddr;
cf586021642d801 Chris Wilson 2021-06-17   45  	int err =3D 0;
cf586021642d801 Chris Wilson 2021-06-17   46  	int i;
cf586021642d801 Chris Wilson 2021-06-17   47  =

cf586021642d801 Chris Wilson 2021-06-17   48  	src =3D create_lmem_or_inter=
nal(i915, sz);
cf586021642d801 Chris Wilson 2021-06-17   49  	if (IS_ERR(src))
cf586021642d801 Chris Wilson 2021-06-17   50  		return 0;
cf586021642d801 Chris Wilson 2021-06-17   51  =

cf586021642d801 Chris Wilson 2021-06-17   52  	dst =3D i915_gem_object_crea=
te_internal(i915, sz);
cf586021642d801 Chris Wilson 2021-06-17   53  	if (IS_ERR(dst))
cf586021642d801 Chris Wilson 2021-06-17   54  		goto err_free_src;
cf586021642d801 Chris Wilson 2021-06-17   55  =

cf586021642d801 Chris Wilson 2021-06-17   56  	for_i915_gem_ww(&ww, err, tr=
ue) {
cf586021642d801 Chris Wilson 2021-06-17   57  		err =3D i915_gem_object_loc=
k(src, &ww);
cf586021642d801 Chris Wilson 2021-06-17   58  		if (err)
cf586021642d801 Chris Wilson 2021-06-17   59  			continue;
cf586021642d801 Chris Wilson 2021-06-17   60  =

cf586021642d801 Chris Wilson 2021-06-17   61  		err =3D i915_gem_object_loc=
k(dst, &ww);
cf586021642d801 Chris Wilson 2021-06-17   62  		if (err)
cf586021642d801 Chris Wilson 2021-06-17   63  			continue;
cf586021642d801 Chris Wilson 2021-06-17   64  =

cf586021642d801 Chris Wilson 2021-06-17   65  		vaddr =3D i915_gem_object_p=
in_map(src, I915_MAP_WC);
cf586021642d801 Chris Wilson 2021-06-17   66  		if (IS_ERR(vaddr)) {
cf586021642d801 Chris Wilson 2021-06-17   67  			err =3D PTR_ERR(vaddr);
cf586021642d801 Chris Wilson 2021-06-17   68  			continue;
cf586021642d801 Chris Wilson 2021-06-17   69  		}
cf586021642d801 Chris Wilson 2021-06-17   70  =

cf586021642d801 Chris Wilson 2021-06-17   71  		for (i =3D 0; i < sz / size=
of(u32); i++)
cf586021642d801 Chris Wilson 2021-06-17   72  			vaddr[i] =3D i;
cf586021642d801 Chris Wilson 2021-06-17   73  		i915_gem_object_flush_map(s=
rc);
cf586021642d801 Chris Wilson 2021-06-17   74  =

cf586021642d801 Chris Wilson 2021-06-17   75  		vaddr =3D i915_gem_object_p=
in_map(dst, I915_MAP_WC);
cf586021642d801 Chris Wilson 2021-06-17   76  		if (IS_ERR(vaddr)) {
cf586021642d801 Chris Wilson 2021-06-17   77  			err =3D PTR_ERR(vaddr);
cf586021642d801 Chris Wilson 2021-06-17   78  			goto unpin_src;
cf586021642d801 Chris Wilson 2021-06-17   79  		}
cf586021642d801 Chris Wilson 2021-06-17   80  =

cf586021642d801 Chris Wilson 2021-06-17   81  		for (i =3D 0; i < sz / size=
of(u32); i++)
cf586021642d801 Chris Wilson 2021-06-17   82  			vaddr[i] =3D ~i;
cf586021642d801 Chris Wilson 2021-06-17   83  		i915_gem_object_flush_map(d=
st);
cf586021642d801 Chris Wilson 2021-06-17   84  =

cf586021642d801 Chris Wilson 2021-06-17   85  		err =3D fn(migrate, &ww, sr=
c, dst, &rq);
cf586021642d801 Chris Wilson 2021-06-17   86  		if (!err)
cf586021642d801 Chris Wilson 2021-06-17   87  			continue;
cf586021642d801 Chris Wilson 2021-06-17   88  =

cf586021642d801 Chris Wilson 2021-06-17   89  		if (err !=3D -EDEADLK && er=
r !=3D -EINTR && err !=3D -ERESTARTSYS)
cf586021642d801 Chris Wilson 2021-06-17   90  			pr_err("%ps failed, size: =
%u\n", fn, sz);
cf586021642d801 Chris Wilson 2021-06-17   91  		if (rq) {
cf586021642d801 Chris Wilson 2021-06-17   92  			i915_request_wait(rq, 0, H=
Z);
cf586021642d801 Chris Wilson 2021-06-17   93  			i915_request_put(rq);
cf586021642d801 Chris Wilson 2021-06-17   94  		}
cf586021642d801 Chris Wilson 2021-06-17   95  		i915_gem_object_unpin_map(d=
st);
cf586021642d801 Chris Wilson 2021-06-17   96  unpin_src:
cf586021642d801 Chris Wilson 2021-06-17   97  		i915_gem_object_unpin_map(s=
rc);
cf586021642d801 Chris Wilson 2021-06-17   98  	}
cf586021642d801 Chris Wilson 2021-06-17   99  	if (err)
cf586021642d801 Chris Wilson 2021-06-17  100  		goto err_out;
cf586021642d801 Chris Wilson 2021-06-17  101  =

cf586021642d801 Chris Wilson 2021-06-17 @102  	if (rq) {
cf586021642d801 Chris Wilson 2021-06-17  103  		if (i915_request_wait(rq, 0=
, HZ) < 0) {
cf586021642d801 Chris Wilson 2021-06-17  104  			pr_err("%ps timed out, siz=
e: %u\n", fn, sz);
cf586021642d801 Chris Wilson 2021-06-17  105  			err =3D -ETIME;
cf586021642d801 Chris Wilson 2021-06-17  106  		}
cf586021642d801 Chris Wilson 2021-06-17  107  		i915_request_put(rq);
cf586021642d801 Chris Wilson 2021-06-17  108  	}
cf586021642d801 Chris Wilson 2021-06-17  109  =

cf586021642d801 Chris Wilson 2021-06-17  110  	for (i =3D 0; !err && i < sz=
 / PAGE_SIZE; i++) {
cf586021642d801 Chris Wilson 2021-06-17  111  		int x =3D i * 1024 + i915_p=
random_u32_max_state(1024, prng);
cf586021642d801 Chris Wilson 2021-06-17  112  =

cf586021642d801 Chris Wilson 2021-06-17 @113  		if (vaddr[x] !=3D x) {
cf586021642d801 Chris Wilson 2021-06-17  114  			pr_err("%ps failed, size: =
%u, offset: %zu\n",
cf586021642d801 Chris Wilson 2021-06-17  115  			       fn, sz, x * sizeof(=
u32));
cf586021642d801 Chris Wilson 2021-06-17  116  			igt_hexdump(vaddr + i * 10=
24, 4096);
cf586021642d801 Chris Wilson 2021-06-17  117  			err =3D -EINVAL;
cf586021642d801 Chris Wilson 2021-06-17  118  		}
cf586021642d801 Chris Wilson 2021-06-17  119  	}
cf586021642d801 Chris Wilson 2021-06-17  120  =

cf586021642d801 Chris Wilson 2021-06-17  121  	i915_gem_object_unpin_map(ds=
t);
cf586021642d801 Chris Wilson 2021-06-17  122  	i915_gem_object_unpin_map(sr=
c);
cf586021642d801 Chris Wilson 2021-06-17  123  =

cf586021642d801 Chris Wilson 2021-06-17  124  err_out:
cf586021642d801 Chris Wilson 2021-06-17  125  	i915_gem_object_put(dst);
cf586021642d801 Chris Wilson 2021-06-17  126  err_free_src:
cf586021642d801 Chris Wilson 2021-06-17  127  	i915_gem_object_put(src);
cf586021642d801 Chris Wilson 2021-06-17  128  =

cf586021642d801 Chris Wilson 2021-06-17  129  	return err;
cf586021642d801 Chris Wilson 2021-06-17  130  }
cf586021642d801 Chris Wilson 2021-06-17  131  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============8523456772354588057==--

