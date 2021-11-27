Content-Type: multipart/mixed; boundary="===============3158924222976110344=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/i915/gem/selftests/huge_pages.c:187 fake_get_huge_pages() warn: should '1 << ((__builtin_constant_p((~0))) ?((((~0)) < 2) ?0:63 - __builtin_clzll((~0))):((4 <= 4)) ?__ilog2_u32((~0)):__ilog2_u64((~0)))' be a 64 bit type?
Date: Sat, 27 Nov 2021 12:04:55 +0800
Message-ID: <202111271214.djaOQVT7-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3158924222976110344==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Jakub Jelinek <jakub@redhat.com>
CC: "Peter Zijlstra (Intel)" <peterz@infradead.org>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   c5c17547b778975b3d83a73c8d84e8fb5ecf3ba5
commit: 2f78788b55baa3410b1ec91a576286abe1ad4d6a ilog2: improve ilog2 for c=
onstant arguments
date:   12 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 12 months ago
config: i386-randconfig-m021-20211116 (https://download.01.org/0day-ci/arch=
ive/20211127/202111271214.djaOQVT7-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/gpu/drm/i915/gem/selftests/huge_pages.c:187 fake_get_huge_pages() w=
arn: should '1 << ((__builtin_constant_p((~0))) ?((((~0)) < 2) ?0:63 - __bu=
iltin_clzll((~0))):((4 <=3D 4)) ?__ilog2_u32((~0)):__ilog2_u64((~0)))' be a=
 64 bit type?

Old smatch warnings:
drivers/gpu/drm/i915/gem/i915_gem_object.h:127 __i915_gem_object_lock() err=
or: we previously assumed 'ww' could be null (see line 119)

vim +187 drivers/gpu/drm/i915/gem/selftests/huge_pages.c

4049866f091311 drivers/gpu/drm/i915/selftests/huge_pages.c Matthew Auld 201=
7-10-06  183  =

4049866f091311 drivers/gpu/drm/i915/selftests/huge_pages.c Matthew Auld 201=
7-10-06  184  static int fake_get_huge_pages(struct drm_i915_gem_object *ob=
j)
4049866f091311 drivers/gpu/drm/i915/selftests/huge_pages.c Matthew Auld 201=
7-10-06  185  {
4049866f091311 drivers/gpu/drm/i915/selftests/huge_pages.c Matthew Auld 201=
7-10-06  186  	struct drm_i915_private *i915 =3D to_i915(obj->base.dev);
4049866f091311 drivers/gpu/drm/i915/selftests/huge_pages.c Matthew Auld 201=
7-10-06 @187  	const u64 max_len =3D rounddown_pow_of_two(UINT_MAX);
4049866f091311 drivers/gpu/drm/i915/selftests/huge_pages.c Matthew Auld 201=
7-10-06  188  	struct sg_table *st;
4049866f091311 drivers/gpu/drm/i915/selftests/huge_pages.c Matthew Auld 201=
7-10-06  189  	struct scatterlist *sg;
84e8978e62fea6 drivers/gpu/drm/i915/selftests/huge_pages.c Matthew Auld 201=
7-10-09  190  	unsigned int sg_page_sizes;
4049866f091311 drivers/gpu/drm/i915/selftests/huge_pages.c Matthew Auld 201=
7-10-06  191  	u64 rem;
4049866f091311 drivers/gpu/drm/i915/selftests/huge_pages.c Matthew Auld 201=
7-10-06  192  =

4049866f091311 drivers/gpu/drm/i915/selftests/huge_pages.c Matthew Auld 201=
7-10-06  193  	st =3D kmalloc(sizeof(*st), GFP);
4049866f091311 drivers/gpu/drm/i915/selftests/huge_pages.c Matthew Auld 201=
7-10-06  194  	if (!st)
4049866f091311 drivers/gpu/drm/i915/selftests/huge_pages.c Matthew Auld 201=
7-10-06  195  		return -ENOMEM;
4049866f091311 drivers/gpu/drm/i915/selftests/huge_pages.c Matthew Auld 201=
7-10-06  196  =

4049866f091311 drivers/gpu/drm/i915/selftests/huge_pages.c Matthew Auld 201=
7-10-06  197  	if (sg_alloc_table(st, obj->base.size >> PAGE_SHIFT, GFP)) {
4049866f091311 drivers/gpu/drm/i915/selftests/huge_pages.c Matthew Auld 201=
7-10-06  198  		kfree(st);
4049866f091311 drivers/gpu/drm/i915/selftests/huge_pages.c Matthew Auld 201=
7-10-06  199  		return -ENOMEM;
4049866f091311 drivers/gpu/drm/i915/selftests/huge_pages.c Matthew Auld 201=
7-10-06  200  	}
4049866f091311 drivers/gpu/drm/i915/selftests/huge_pages.c Matthew Auld 201=
7-10-06  201  =

4049866f091311 drivers/gpu/drm/i915/selftests/huge_pages.c Matthew Auld 201=
7-10-06  202  	/* Use optimal page sized chunks to fill in the sg table */
4049866f091311 drivers/gpu/drm/i915/selftests/huge_pages.c Matthew Auld 201=
7-10-06  203  	rem =3D obj->base.size;
4049866f091311 drivers/gpu/drm/i915/selftests/huge_pages.c Matthew Auld 201=
7-10-06  204  	sg =3D st->sgl;
4049866f091311 drivers/gpu/drm/i915/selftests/huge_pages.c Matthew Auld 201=
7-10-06  205  	st->nents =3D 0;
84e8978e62fea6 drivers/gpu/drm/i915/selftests/huge_pages.c Matthew Auld 201=
7-10-09  206  	sg_page_sizes =3D 0;
4049866f091311 drivers/gpu/drm/i915/selftests/huge_pages.c Matthew Auld 201=
7-10-06  207  	do {
4049866f091311 drivers/gpu/drm/i915/selftests/huge_pages.c Matthew Auld 201=
7-10-06  208  		unsigned int page_size =3D get_largest_page_size(i915, rem);
4049866f091311 drivers/gpu/drm/i915/selftests/huge_pages.c Matthew Auld 201=
7-10-06  209  		unsigned int len =3D min(page_size * div_u64(rem, page_size=
),
4049866f091311 drivers/gpu/drm/i915/selftests/huge_pages.c Matthew Auld 201=
7-10-06  210  				       max_len);
4049866f091311 drivers/gpu/drm/i915/selftests/huge_pages.c Matthew Auld 201=
7-10-06  211  =

4049866f091311 drivers/gpu/drm/i915/selftests/huge_pages.c Matthew Auld 201=
7-10-06  212  		GEM_BUG_ON(!page_size);
4049866f091311 drivers/gpu/drm/i915/selftests/huge_pages.c Matthew Auld 201=
7-10-06  213  =

4049866f091311 drivers/gpu/drm/i915/selftests/huge_pages.c Matthew Auld 201=
7-10-06  214  		sg->offset =3D 0;
4049866f091311 drivers/gpu/drm/i915/selftests/huge_pages.c Matthew Auld 201=
7-10-06  215  		sg->length =3D len;
4049866f091311 drivers/gpu/drm/i915/selftests/huge_pages.c Matthew Auld 201=
7-10-06  216  		sg_dma_len(sg) =3D len;
4049866f091311 drivers/gpu/drm/i915/selftests/huge_pages.c Matthew Auld 201=
7-10-06  217  		sg_dma_address(sg) =3D page_size;
4049866f091311 drivers/gpu/drm/i915/selftests/huge_pages.c Matthew Auld 201=
7-10-06  218  =

84e8978e62fea6 drivers/gpu/drm/i915/selftests/huge_pages.c Matthew Auld 201=
7-10-09  219  		sg_page_sizes |=3D len;
4049866f091311 drivers/gpu/drm/i915/selftests/huge_pages.c Matthew Auld 201=
7-10-06  220  =

4049866f091311 drivers/gpu/drm/i915/selftests/huge_pages.c Matthew Auld 201=
7-10-06  221  		st->nents++;
4049866f091311 drivers/gpu/drm/i915/selftests/huge_pages.c Matthew Auld 201=
7-10-06  222  =

4049866f091311 drivers/gpu/drm/i915/selftests/huge_pages.c Matthew Auld 201=
7-10-06  223  		rem -=3D len;
4049866f091311 drivers/gpu/drm/i915/selftests/huge_pages.c Matthew Auld 201=
7-10-06  224  		if (!rem) {
4049866f091311 drivers/gpu/drm/i915/selftests/huge_pages.c Matthew Auld 201=
7-10-06  225  			sg_mark_end(sg);
4049866f091311 drivers/gpu/drm/i915/selftests/huge_pages.c Matthew Auld 201=
7-10-06  226  			break;
4049866f091311 drivers/gpu/drm/i915/selftests/huge_pages.c Matthew Auld 201=
7-10-06  227  		}
4049866f091311 drivers/gpu/drm/i915/selftests/huge_pages.c Matthew Auld 201=
7-10-06  228  =

4049866f091311 drivers/gpu/drm/i915/selftests/huge_pages.c Matthew Auld 201=
7-10-06  229  		sg =3D sg_next(sg);
4049866f091311 drivers/gpu/drm/i915/selftests/huge_pages.c Matthew Auld 201=
7-10-06  230  	} while (1);
4049866f091311 drivers/gpu/drm/i915/selftests/huge_pages.c Matthew Auld 201=
7-10-06  231  =

c6d22ab61bfdeb drivers/gpu/drm/i915/selftests/huge_pages.c Matthew Auld 201=
8-09-20  232  	i915_sg_trim(st);
c6d22ab61bfdeb drivers/gpu/drm/i915/selftests/huge_pages.c Matthew Auld 201=
8-09-20  233  =

84e8978e62fea6 drivers/gpu/drm/i915/selftests/huge_pages.c Matthew Auld 201=
7-10-09  234  	__i915_gem_object_set_pages(obj, st, sg_page_sizes);
4049866f091311 drivers/gpu/drm/i915/selftests/huge_pages.c Matthew Auld 201=
7-10-06  235  =

4049866f091311 drivers/gpu/drm/i915/selftests/huge_pages.c Matthew Auld 201=
7-10-06  236  	return 0;
4049866f091311 drivers/gpu/drm/i915/selftests/huge_pages.c Matthew Auld 201=
7-10-06  237  }
4049866f091311 drivers/gpu/drm/i915/selftests/huge_pages.c Matthew Auld 201=
7-10-06  238  =


:::::: The code at line 187 was first introduced by commit
:::::: 4049866f0913110bf7de597c1177de7a1cc459cb drm/i915/selftests: huge pa=
ge tests

:::::: TO: Matthew Auld <matthew.auld@intel.com>
:::::: CC: Chris Wilson <chris@chris-wilson.co.uk>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3158924222976110344==--

