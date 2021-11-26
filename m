Content-Type: multipart/mixed; boundary="===============6990679713979786029=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/i915/i915_ttm_buddy_manager.c:54 i915_ttm_buddy_man_alloc() warn: should 'bman_res->base.num_pages << 12' be a 64 bit type?
Date: Fri, 26 Nov 2021 08:47:00 +0800
Message-ID: <202111260820.IgS60h1h-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6990679713979786029==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Matthew Auld <matthew.auld@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   8ced7ca3570333998ad2088d5a6275701970e28e
commit: 88be9a0a06b73ecd85a688a7c174c941e9692e92 drm/i915/ttm: add ttm_budd=
y_man
date:   5 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 5 months ago
config: i386-randconfig-m021-20211124 (https://download.01.org/0day-ci/arch=
ive/20211126/202111260820.IgS60h1h-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/gpu/drm/i915/i915_ttm_buddy_manager.c:54 i915_ttm_buddy_man_alloc()=
 warn: should 'bman_res->base.num_pages << 12' be a 64 bit type?

Old smatch warnings:
drivers/gpu/drm/i915/i915_ttm_buddy_manager.c:56 i915_ttm_buddy_man_alloc()=
 warn: should 'bo->page_alignment << 12' be a 64 bit type?

vim +54 drivers/gpu/drm/i915/i915_ttm_buddy_manager.c

88be9a0a06b73e Matthew Auld 2021-06-16   28  =

88be9a0a06b73e Matthew Auld 2021-06-16   29  static int i915_ttm_buddy_man_=
alloc(struct ttm_resource_manager *man,
88be9a0a06b73e Matthew Auld 2021-06-16   30  				    struct ttm_buffer_obje=
ct *bo,
88be9a0a06b73e Matthew Auld 2021-06-16   31  				    const struct ttm_place=
 *place,
88be9a0a06b73e Matthew Auld 2021-06-16   32  				    struct ttm_resource **=
res)
88be9a0a06b73e Matthew Auld 2021-06-16   33  {
88be9a0a06b73e Matthew Auld 2021-06-16   34  	struct i915_ttm_buddy_manager=
 *bman =3D to_buddy_manager(man);
88be9a0a06b73e Matthew Auld 2021-06-16   35  	struct i915_ttm_buddy_resourc=
e *bman_res;
88be9a0a06b73e Matthew Auld 2021-06-16   36  	struct i915_buddy_mm *mm =3D =
&bman->mm;
88be9a0a06b73e Matthew Auld 2021-06-16   37  	unsigned long n_pages;
88be9a0a06b73e Matthew Auld 2021-06-16   38  	unsigned int min_order;
88be9a0a06b73e Matthew Auld 2021-06-16   39  	u64 min_page_size;
88be9a0a06b73e Matthew Auld 2021-06-16   40  	u64 size;
88be9a0a06b73e Matthew Auld 2021-06-16   41  	int err;
88be9a0a06b73e Matthew Auld 2021-06-16   42  =

88be9a0a06b73e Matthew Auld 2021-06-16   43  	GEM_BUG_ON(place->fpfn || pla=
ce->lpfn);
88be9a0a06b73e Matthew Auld 2021-06-16   44  =

88be9a0a06b73e Matthew Auld 2021-06-16   45  	bman_res =3D kzalloc(sizeof(*=
bman_res), GFP_KERNEL);
88be9a0a06b73e Matthew Auld 2021-06-16   46  	if (!bman_res)
88be9a0a06b73e Matthew Auld 2021-06-16   47  		return -ENOMEM;
88be9a0a06b73e Matthew Auld 2021-06-16   48  =

88be9a0a06b73e Matthew Auld 2021-06-16   49  	ttm_resource_init(bo, place, =
&bman_res->base);
88be9a0a06b73e Matthew Auld 2021-06-16   50  	INIT_LIST_HEAD(&bman_res->blo=
cks);
88be9a0a06b73e Matthew Auld 2021-06-16   51  	bman_res->mm =3D mm;
88be9a0a06b73e Matthew Auld 2021-06-16   52  =

88be9a0a06b73e Matthew Auld 2021-06-16   53  	GEM_BUG_ON(!bman_res->base.nu=
m_pages);
88be9a0a06b73e Matthew Auld 2021-06-16  @54  	size =3D bman_res->base.num_p=
ages << PAGE_SHIFT;
88be9a0a06b73e Matthew Auld 2021-06-16   55  =

88be9a0a06b73e Matthew Auld 2021-06-16   56  	min_page_size =3D bo->page_al=
ignment << PAGE_SHIFT;
88be9a0a06b73e Matthew Auld 2021-06-16   57  	GEM_BUG_ON(min_page_size < mm=
->chunk_size);
88be9a0a06b73e Matthew Auld 2021-06-16   58  	min_order =3D ilog2(min_page_=
size) - ilog2(mm->chunk_size);
88be9a0a06b73e Matthew Auld 2021-06-16   59  	if (place->flags & TTM_PL_FLA=
G_CONTIGUOUS) {
88be9a0a06b73e Matthew Auld 2021-06-16   60  		size =3D roundup_pow_of_two(=
size);
88be9a0a06b73e Matthew Auld 2021-06-16   61  		min_order =3D ilog2(size) - =
ilog2(mm->chunk_size);
88be9a0a06b73e Matthew Auld 2021-06-16   62  	}
88be9a0a06b73e Matthew Auld 2021-06-16   63  =

88be9a0a06b73e Matthew Auld 2021-06-16   64  	if (size > mm->size) {
88be9a0a06b73e Matthew Auld 2021-06-16   65  		err =3D -E2BIG;
88be9a0a06b73e Matthew Auld 2021-06-16   66  		goto err_free_res;
88be9a0a06b73e Matthew Auld 2021-06-16   67  	}
88be9a0a06b73e Matthew Auld 2021-06-16   68  =

88be9a0a06b73e Matthew Auld 2021-06-16   69  	n_pages =3D size >> ilog2(mm-=
>chunk_size);
88be9a0a06b73e Matthew Auld 2021-06-16   70  =

88be9a0a06b73e Matthew Auld 2021-06-16   71  	do {
88be9a0a06b73e Matthew Auld 2021-06-16   72  		struct i915_buddy_block *blo=
ck;
88be9a0a06b73e Matthew Auld 2021-06-16   73  		unsigned int order;
88be9a0a06b73e Matthew Auld 2021-06-16   74  =

88be9a0a06b73e Matthew Auld 2021-06-16   75  		order =3D fls(n_pages) - 1;
88be9a0a06b73e Matthew Auld 2021-06-16   76  		GEM_BUG_ON(order > mm->max_o=
rder);
88be9a0a06b73e Matthew Auld 2021-06-16   77  		GEM_BUG_ON(order < min_order=
);
88be9a0a06b73e Matthew Auld 2021-06-16   78  =

88be9a0a06b73e Matthew Auld 2021-06-16   79  		do {
88be9a0a06b73e Matthew Auld 2021-06-16   80  			mutex_lock(&bman->lock);
88be9a0a06b73e Matthew Auld 2021-06-16   81  			block =3D i915_buddy_alloc(=
mm, order);
88be9a0a06b73e Matthew Auld 2021-06-16   82  			mutex_unlock(&bman->lock);
88be9a0a06b73e Matthew Auld 2021-06-16   83  			if (!IS_ERR(block))
88be9a0a06b73e Matthew Auld 2021-06-16   84  				break;
88be9a0a06b73e Matthew Auld 2021-06-16   85  =

88be9a0a06b73e Matthew Auld 2021-06-16   86  			if (order-- =3D=3D min_orde=
r) {
88be9a0a06b73e Matthew Auld 2021-06-16   87  				err =3D -ENOSPC;
88be9a0a06b73e Matthew Auld 2021-06-16   88  				goto err_free_blocks;
88be9a0a06b73e Matthew Auld 2021-06-16   89  			}
88be9a0a06b73e Matthew Auld 2021-06-16   90  		} while (1);
88be9a0a06b73e Matthew Auld 2021-06-16   91  =

88be9a0a06b73e Matthew Auld 2021-06-16   92  		n_pages -=3D BIT(order);
88be9a0a06b73e Matthew Auld 2021-06-16   93  =

88be9a0a06b73e Matthew Auld 2021-06-16   94  		list_add_tail(&block->link, =
&bman_res->blocks);
88be9a0a06b73e Matthew Auld 2021-06-16   95  =

88be9a0a06b73e Matthew Auld 2021-06-16   96  		if (!n_pages)
88be9a0a06b73e Matthew Auld 2021-06-16   97  			break;
88be9a0a06b73e Matthew Auld 2021-06-16   98  	} while (1);
88be9a0a06b73e Matthew Auld 2021-06-16   99  =

88be9a0a06b73e Matthew Auld 2021-06-16  100  	*res =3D &bman_res->base;
88be9a0a06b73e Matthew Auld 2021-06-16  101  	return 0;
88be9a0a06b73e Matthew Auld 2021-06-16  102  =

88be9a0a06b73e Matthew Auld 2021-06-16  103  err_free_blocks:
88be9a0a06b73e Matthew Auld 2021-06-16  104  	mutex_lock(&bman->lock);
88be9a0a06b73e Matthew Auld 2021-06-16  105  	i915_buddy_free_list(mm, &bma=
n_res->blocks);
88be9a0a06b73e Matthew Auld 2021-06-16  106  	mutex_unlock(&bman->lock);
88be9a0a06b73e Matthew Auld 2021-06-16  107  err_free_res:
88be9a0a06b73e Matthew Auld 2021-06-16  108  	kfree(bman_res);
88be9a0a06b73e Matthew Auld 2021-06-16  109  	return err;
88be9a0a06b73e Matthew Auld 2021-06-16  110  }
88be9a0a06b73e Matthew Auld 2021-06-16  111  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6990679713979786029==--

