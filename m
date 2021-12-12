Content-Type: multipart/mixed; boundary="===============4178810171576884968=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/i915/gt/selftest_migrate.c:475 create_init_lmem_internal() warn: inconsistent returns 'obj->base.resv'.
Date: Mon, 13 Dec 2021 05:57:52 +0800
Message-ID: <202112130524.rBqCujMX-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4178810171576884968==
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
head:   a763d5a5abd65797aec3dd1bf01fe2ccbec32967
commit: 94ce0d65076cda511da843ae1893c819948a215a drm/i915/gt: Setup a defau=
lt migration context on the GT
date:   6 months ago
:::::: branch date: 21 hours ago
:::::: commit date: 6 months ago
config: i386-randconfig-m021-20211207 (https://download.01.org/0day-ci/arch=
ive/20211213/202112130524.rBqCujMX-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/gpu/drm/i915/gt/selftest_migrate.c:475 create_init_lmem_internal() =
warn: inconsistent returns 'obj->base.resv'.

Old smatch warnings:
drivers/gpu/drm/i915/gt/selftest_migrate.c:102 copy() error: uninitialized =
symbol 'rq'.
drivers/gpu/drm/i915/gt/selftest_migrate.c:113 copy() error: uninitialized =
symbol 'vaddr'.
drivers/gpu/drm/i915/gem/i915_gem_object.h:182 __i915_gem_object_lock() err=
or: we previously assumed 'ww' could be null (see line 171)
drivers/gpu/drm/i915/gt/selftest_migrate.c:182 clear() error: uninitialized=
 symbol 'rq'.
drivers/gpu/drm/i915/gt/selftest_migrate.c:193 clear() error: uninitialized=
 symbol 'vaddr'.

vim +475 drivers/gpu/drm/i915/gt/selftest_migrate.c

94ce0d65076cda Chris Wilson 2021-06-17  451  =

94ce0d65076cda Chris Wilson 2021-06-17  452  static struct drm_i915_gem_obj=
ect *
94ce0d65076cda Chris Wilson 2021-06-17  453  create_init_lmem_internal(stru=
ct intel_gt *gt, size_t sz, bool try_lmem)
94ce0d65076cda Chris Wilson 2021-06-17  454  {
94ce0d65076cda Chris Wilson 2021-06-17  455  	struct drm_i915_gem_object *o=
bj =3D NULL;
cf586021642d80 Chris Wilson 2021-06-17  456  	int err;
cf586021642d80 Chris Wilson 2021-06-17  457  =

94ce0d65076cda Chris Wilson 2021-06-17  458  	if (try_lmem)
94ce0d65076cda Chris Wilson 2021-06-17  459  		obj =3D i915_gem_object_crea=
te_lmem(gt->i915, sz, 0);
94ce0d65076cda Chris Wilson 2021-06-17  460  =

94ce0d65076cda Chris Wilson 2021-06-17  461  	if (IS_ERR_OR_NULL(obj)) {
94ce0d65076cda Chris Wilson 2021-06-17  462  		obj =3D i915_gem_object_crea=
te_internal(gt->i915, sz);
94ce0d65076cda Chris Wilson 2021-06-17  463  		if (IS_ERR(obj))
94ce0d65076cda Chris Wilson 2021-06-17  464  			return obj;
94ce0d65076cda Chris Wilson 2021-06-17  465  	}
94ce0d65076cda Chris Wilson 2021-06-17  466  =

94ce0d65076cda Chris Wilson 2021-06-17  467  	i915_gem_object_trylock(obj);
94ce0d65076cda Chris Wilson 2021-06-17  468  	err =3D i915_gem_object_pin_p=
ages(obj);
94ce0d65076cda Chris Wilson 2021-06-17  469  	if (err) {
94ce0d65076cda Chris Wilson 2021-06-17  470  		i915_gem_object_unlock(obj);
94ce0d65076cda Chris Wilson 2021-06-17  471  		i915_gem_object_put(obj);
94ce0d65076cda Chris Wilson 2021-06-17  472  		return ERR_PTR(err);
94ce0d65076cda Chris Wilson 2021-06-17  473  	}
94ce0d65076cda Chris Wilson 2021-06-17  474  =

94ce0d65076cda Chris Wilson 2021-06-17 @475  	return obj;
94ce0d65076cda Chris Wilson 2021-06-17  476  }
94ce0d65076cda Chris Wilson 2021-06-17  477  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4178810171576884968==--

