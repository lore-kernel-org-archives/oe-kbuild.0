Content-Type: multipart/mixed; boundary="===============2483619341626136683=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/i915/i915_scatterlist.c:154 i915_rsgt_from_buddy_resource() warn: should 'res->num_pages << 12' be a 64 bit type?
Date: Mon, 31 Jan 2022 22:29:10 +0800
Message-ID: <202201312218.4lsfgfAM-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2483619341626136683==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: "Thomas Hellstr=C3=B6m" <thomas.hellstrom@linux.intel.com>
CC: Matthew Auld <matthew.auld@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   26291c54e111ff6ba87a164d85d4a4e134b7315c
commit: cad7109a2b5e7d48466b77728aa16ce55415eea0 drm/i915: Introduce refcou=
nted sg-tables
date:   3 months ago
:::::: branch date: 25 hours ago
:::::: commit date: 3 months ago
config: i386-randconfig-m021-20220131 (https://download.01.org/0day-ci/arch=
ive/20220131/202201312218.4lsfgfAM-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/gpu/drm/i915/i915_scatterlist.c:154 i915_rsgt_from_buddy_resource()=
 warn: should 'res->num_pages << 12' be a 64 bit type?

vim +154 drivers/gpu/drm/i915/i915_scatterlist.c

d148738923fdb5 Thomas Hellstr=C3=B6m 2021-06-02  136  =

f701b16d4cc535 Matthew Auld     2021-06-16  137  /**
cad7109a2b5e7d Thomas Hellstr=C3=B6m 2021-11-01  138   * i915_rsgt_from_bud=
dy_resource - Create a refcounted sg_table from a struct
f701b16d4cc535 Matthew Auld     2021-06-16  139   * i915_buddy_block list
f701b16d4cc535 Matthew Auld     2021-06-16  140   * @res: The struct i915_t=
tm_buddy_resource.
f701b16d4cc535 Matthew Auld     2021-06-16  141   * @region_start: An offse=
t to add to the dma addresses of the sg list.
f701b16d4cc535 Matthew Auld     2021-06-16  142   *
f701b16d4cc535 Matthew Auld     2021-06-16  143   * Create a struct sg_tabl=
e, initializing it from struct i915_buddy_block list,
f701b16d4cc535 Matthew Auld     2021-06-16  144   * taking a maximum segmen=
t length into account, splitting into segments
f701b16d4cc535 Matthew Auld     2021-06-16  145   * if necessary.
f701b16d4cc535 Matthew Auld     2021-06-16  146   *
cad7109a2b5e7d Thomas Hellstr=C3=B6m 2021-11-01  147   * Return: A pointer =
to a kmalloced struct i915_refct_sgts on success, negative
f701b16d4cc535 Matthew Auld     2021-06-16  148   * error code cast to an e=
rror pointer on failure.
f701b16d4cc535 Matthew Auld     2021-06-16  149   */
cad7109a2b5e7d Thomas Hellstr=C3=B6m 2021-11-01  150  struct i915_refct_sgt=
 *i915_rsgt_from_buddy_resource(struct ttm_resource *res,
f701b16d4cc535 Matthew Auld     2021-06-16  151  						     u64 region_star=
t)
f701b16d4cc535 Matthew Auld     2021-06-16  152  {
f701b16d4cc535 Matthew Auld     2021-06-16  153  	struct i915_ttm_buddy_res=
ource *bman_res =3D to_ttm_buddy_resource(res);
f701b16d4cc535 Matthew Auld     2021-06-16 @154  	const u64 size =3D res->n=
um_pages << PAGE_SHIFT;
f701b16d4cc535 Matthew Auld     2021-06-16  155  	const u64 max_segment =3D=
 rounddown(UINT_MAX, PAGE_SIZE);
f701b16d4cc535 Matthew Auld     2021-06-16  156  	struct i915_buddy_mm *mm =
=3D bman_res->mm;
f701b16d4cc535 Matthew Auld     2021-06-16  157  	struct list_head *blocks =
=3D &bman_res->blocks;
f701b16d4cc535 Matthew Auld     2021-06-16  158  	struct i915_buddy_block *=
block;
cad7109a2b5e7d Thomas Hellstr=C3=B6m 2021-11-01  159  	struct i915_refct_sg=
t *rsgt;
f701b16d4cc535 Matthew Auld     2021-06-16  160  	struct scatterlist *sg;
f701b16d4cc535 Matthew Auld     2021-06-16  161  	struct sg_table *st;
f701b16d4cc535 Matthew Auld     2021-06-16  162  	resource_size_t prev_end;
f701b16d4cc535 Matthew Auld     2021-06-16  163  =

f701b16d4cc535 Matthew Auld     2021-06-16  164  	GEM_BUG_ON(list_empty(blo=
cks));
f701b16d4cc535 Matthew Auld     2021-06-16  165  =

cad7109a2b5e7d Thomas Hellstr=C3=B6m 2021-11-01  166  	rsgt =3D kmalloc(siz=
eof(*rsgt), GFP_KERNEL);
cad7109a2b5e7d Thomas Hellstr=C3=B6m 2021-11-01  167  	if (!rsgt)
f701b16d4cc535 Matthew Auld     2021-06-16  168  		return ERR_PTR(-ENOMEM);
f701b16d4cc535 Matthew Auld     2021-06-16  169  =

cad7109a2b5e7d Thomas Hellstr=C3=B6m 2021-11-01  170  	i915_refct_sgt_init(=
rsgt, size);
cad7109a2b5e7d Thomas Hellstr=C3=B6m 2021-11-01  171  	st =3D &rsgt->table;
f701b16d4cc535 Matthew Auld     2021-06-16  172  	if (sg_alloc_table(st, re=
s->num_pages, GFP_KERNEL)) {
cad7109a2b5e7d Thomas Hellstr=C3=B6m 2021-11-01  173  		i915_refct_sgt_put(=
rsgt);
f701b16d4cc535 Matthew Auld     2021-06-16  174  		return ERR_PTR(-ENOMEM);
f701b16d4cc535 Matthew Auld     2021-06-16  175  	}
f701b16d4cc535 Matthew Auld     2021-06-16  176  =

f701b16d4cc535 Matthew Auld     2021-06-16  177  	sg =3D st->sgl;
f701b16d4cc535 Matthew Auld     2021-06-16  178  	st->nents =3D 0;
f701b16d4cc535 Matthew Auld     2021-06-16  179  	prev_end =3D (resource_si=
ze_t)-1;
f701b16d4cc535 Matthew Auld     2021-06-16  180  =

f701b16d4cc535 Matthew Auld     2021-06-16  181  	list_for_each_entry(block=
, blocks, link) {
f701b16d4cc535 Matthew Auld     2021-06-16  182  		u64 block_size, offset;
f701b16d4cc535 Matthew Auld     2021-06-16  183  =

f701b16d4cc535 Matthew Auld     2021-06-16  184  		block_size =3D min_t(u64=
, size, i915_buddy_block_size(mm, block));
f701b16d4cc535 Matthew Auld     2021-06-16  185  		offset =3D i915_buddy_bl=
ock_offset(block);
f701b16d4cc535 Matthew Auld     2021-06-16  186  =

f701b16d4cc535 Matthew Auld     2021-06-16  187  		while (block_size) {
f701b16d4cc535 Matthew Auld     2021-06-16  188  			u64 len;
f701b16d4cc535 Matthew Auld     2021-06-16  189  =

f701b16d4cc535 Matthew Auld     2021-06-16  190  			if (offset !=3D prev_en=
d || sg->length >=3D max_segment) {
f701b16d4cc535 Matthew Auld     2021-06-16  191  				if (st->nents)
f701b16d4cc535 Matthew Auld     2021-06-16  192  					sg =3D __sg_next(sg);
f701b16d4cc535 Matthew Auld     2021-06-16  193  =

f701b16d4cc535 Matthew Auld     2021-06-16  194  				sg_dma_address(sg) =3D=
 region_start + offset;
f701b16d4cc535 Matthew Auld     2021-06-16  195  				sg_dma_len(sg) =3D 0;
f701b16d4cc535 Matthew Auld     2021-06-16  196  				sg->length =3D 0;
f701b16d4cc535 Matthew Auld     2021-06-16  197  				st->nents++;
f701b16d4cc535 Matthew Auld     2021-06-16  198  			}
f701b16d4cc535 Matthew Auld     2021-06-16  199  =

f701b16d4cc535 Matthew Auld     2021-06-16  200  			len =3D min(block_size,=
 max_segment - sg->length);
f701b16d4cc535 Matthew Auld     2021-06-16  201  			sg->length +=3D len;
f701b16d4cc535 Matthew Auld     2021-06-16  202  			sg_dma_len(sg) +=3D len;
f701b16d4cc535 Matthew Auld     2021-06-16  203  =

f701b16d4cc535 Matthew Auld     2021-06-16  204  			offset +=3D len;
f701b16d4cc535 Matthew Auld     2021-06-16  205  			block_size -=3D len;
f701b16d4cc535 Matthew Auld     2021-06-16  206  =

f701b16d4cc535 Matthew Auld     2021-06-16  207  			prev_end =3D offset;
f701b16d4cc535 Matthew Auld     2021-06-16  208  		}
f701b16d4cc535 Matthew Auld     2021-06-16  209  	}
f701b16d4cc535 Matthew Auld     2021-06-16  210  =

f701b16d4cc535 Matthew Auld     2021-06-16  211  	sg_mark_end(sg);
f701b16d4cc535 Matthew Auld     2021-06-16  212  	i915_sg_trim(st);
f701b16d4cc535 Matthew Auld     2021-06-16  213  =

cad7109a2b5e7d Thomas Hellstr=C3=B6m 2021-11-01  214  	return rsgt;
f701b16d4cc535 Matthew Auld     2021-06-16  215  }
f701b16d4cc535 Matthew Auld     2021-06-16  216  =


:::::: The code at line 154 was first introduced by commit
:::::: f701b16d4cc535d24facdfdd21dc97a3691e5576 drm/i915/ttm: add i915_sg_f=
rom_buddy_resource

:::::: TO: Matthew Auld <matthew.auld@intel.com>
:::::: CC: Matthew Auld <matthew.auld@intel.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2483619341626136683==--

