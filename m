Content-Type: multipart/mixed; boundary="===============5904025176870223650=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/etnaviv/etnaviv_dump.c:213 etnaviv_core_dump() warn: should '(((*pages++) - mem_map) + (m68k_memory[0]->addr >> 12)) << 12' be a 64 bit type?
Date: Sun, 13 Feb 2022 07:44:49 +0800
Message-ID: <202202130749.3uNUKwfr-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5904025176870223650==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Angelo Dureghello <angelo@kernel-space.org>
CC: Greg Ungerer <gerg@linux-m68k.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   b81b1829e7e39f6cebdf6e4d5484eacbceda8554
commit: d2bd44c4c05d043fb65cfdf26c54e6d8b94a4b41 m68k: fix flatmem memory m=
odel setup
date:   10 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 10 months ago
config: m68k-randconfig-m031-20220213 (https://download.01.org/0day-ci/arch=
ive/20220213/202202130749.3uNUKwfr-lkp(a)intel.com/config)
compiler: m68k-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/gpu/drm/etnaviv/etnaviv_dump.c:213 etnaviv_core_dump() warn: should=
 '(((*pages++) - mem_map) + (m68k_memory[0]->addr >> 12)) << 12' be a 64 bi=
t type?

vim +213 drivers/gpu/drm/etnaviv/etnaviv_dump.c

a8c21a5451d831 The etnaviv authors 2015-12-03  112  =

9a1fdae5876016 Lucas Stach         2019-08-09  113  void etnaviv_core_dump(=
struct etnaviv_gem_submit *submit)
a8c21a5451d831 The etnaviv authors 2015-12-03  114  {
9a1fdae5876016 Lucas Stach         2019-08-09  115  	struct etnaviv_gpu *gp=
u =3D submit->gpu;
a8c21a5451d831 The etnaviv authors 2015-12-03  116  	struct core_dump_itera=
tor iter;
a8c21a5451d831 The etnaviv authors 2015-12-03  117  	struct etnaviv_gem_obj=
ect *obj;
a8c21a5451d831 The etnaviv authors 2015-12-03  118  	unsigned int n_obj, n_=
bomap_pages;
a8c21a5451d831 The etnaviv authors 2015-12-03  119  	size_t file_size, mmu_=
size;
a8c21a5451d831 The etnaviv authors 2015-12-03  120  	__le64 *bomap, *bomap_=
start;
9a1fdae5876016 Lucas Stach         2019-08-09  121  	int i;
a8c21a5451d831 The etnaviv authors 2015-12-03  122  =

6d7a20c0776036 Lucas Stach         2017-12-06  123  	/* Only catch the firs=
t event, or when manually re-armed */
6d7a20c0776036 Lucas Stach         2017-12-06  124  	if (!etnaviv_dump_core)
6d7a20c0776036 Lucas Stach         2017-12-06  125  		return;
6d7a20c0776036 Lucas Stach         2017-12-06  126  	etnaviv_dump_core =3D =
false;
6d7a20c0776036 Lucas Stach         2017-12-06  127  =

27b67278e007b5 Lucas Stach         2019-07-05  128  	mutex_lock(&gpu->mmu_c=
ontext->lock);
1396500d673bd0 Lucas Stach         2019-05-21  129  =

27b67278e007b5 Lucas Stach         2019-07-05  130  	mmu_size =3D etnaviv_i=
ommu_dump_size(gpu->mmu_context);
a8c21a5451d831 The etnaviv authors 2015-12-03  131  =

9a1fdae5876016 Lucas Stach         2019-08-09  132  	/* We always dump regi=
sters, mmu, ring, hanging cmdbuf and end marker */
9a1fdae5876016 Lucas Stach         2019-08-09  133  	n_obj =3D 5;
a8c21a5451d831 The etnaviv authors 2015-12-03  134  	n_bomap_pages =3D 0;
a8c21a5451d831 The etnaviv authors 2015-12-03  135  	file_size =3D ARRAY_SI=
ZE(etnaviv_dump_registers) *
a8c21a5451d831 The etnaviv authors 2015-12-03  136  			sizeof(struct etnavi=
v_dump_registers) +
9a1fdae5876016 Lucas Stach         2019-08-09  137  		    mmu_size + gpu->b=
uffer.size + submit->cmdbuf.size;
a8c21a5451d831 The etnaviv authors 2015-12-03  138  =

a8c21a5451d831 The etnaviv authors 2015-12-03  139  	/* Add in the active b=
uffer objects */
9a1fdae5876016 Lucas Stach         2019-08-09  140  	for (i =3D 0; i < subm=
it->nr_bos; i++) {
9a1fdae5876016 Lucas Stach         2019-08-09  141  		obj =3D submit->bos[i=
].obj;
a8c21a5451d831 The etnaviv authors 2015-12-03  142  		file_size +=3D obj->b=
ase.size;
a8c21a5451d831 The etnaviv authors 2015-12-03  143  		n_bomap_pages +=3D ob=
j->base.size >> PAGE_SHIFT;
a8c21a5451d831 The etnaviv authors 2015-12-03  144  		n_obj++;
a8c21a5451d831 The etnaviv authors 2015-12-03  145  	}
a8c21a5451d831 The etnaviv authors 2015-12-03  146  =

a8c21a5451d831 The etnaviv authors 2015-12-03  147  	/* If we have any buff=
er objects, add a bomap object */
a8c21a5451d831 The etnaviv authors 2015-12-03  148  	if (n_bomap_pages) {
a8c21a5451d831 The etnaviv authors 2015-12-03  149  		file_size +=3D n_boma=
p_pages * sizeof(__le64);
a8c21a5451d831 The etnaviv authors 2015-12-03  150  		n_obj++;
a8c21a5451d831 The etnaviv authors 2015-12-03  151  	}
a8c21a5451d831 The etnaviv authors 2015-12-03  152  =

a8c21a5451d831 The etnaviv authors 2015-12-03  153  	/* Add the size of the=
 headers */
a8c21a5451d831 The etnaviv authors 2015-12-03  154  	file_size +=3D sizeof(=
*iter.hdr) * n_obj;
a8c21a5451d831 The etnaviv authors 2015-12-03  155  =

a8c21a5451d831 The etnaviv authors 2015-12-03  156  	/* Allocate the file i=
n vmalloc memory, it's likely to be big */
88dca4ca5a93d2 Christoph Hellwig   2020-06-01  157  	iter.start =3D __vmall=
oc(file_size, GFP_KERNEL | __GFP_NOWARN |
88dca4ca5a93d2 Christoph Hellwig   2020-06-01  158  			__GFP_NORETRY);
a8c21a5451d831 The etnaviv authors 2015-12-03  159  	if (!iter.start) {
27b67278e007b5 Lucas Stach         2019-07-05  160  		mutex_unlock(&gpu->mm=
u_context->lock);
a8c21a5451d831 The etnaviv authors 2015-12-03  161  		dev_warn(gpu->dev, "f=
ailed to allocate devcoredump file\n");
a8c21a5451d831 The etnaviv authors 2015-12-03  162  		return;
a8c21a5451d831 The etnaviv authors 2015-12-03  163  	}
a8c21a5451d831 The etnaviv authors 2015-12-03  164  =

a8c21a5451d831 The etnaviv authors 2015-12-03  165  	/* Point the data memb=
er after the headers */
a8c21a5451d831 The etnaviv authors 2015-12-03  166  	iter.hdr =3D iter.star=
t;
a8c21a5451d831 The etnaviv authors 2015-12-03  167  	iter.data =3D &iter.hd=
r[n_obj];
a8c21a5451d831 The etnaviv authors 2015-12-03  168  =

a8c21a5451d831 The etnaviv authors 2015-12-03  169  	memset(iter.hdr, 0, it=
er.data - iter.start);
a8c21a5451d831 The etnaviv authors 2015-12-03  170  =

a8c21a5451d831 The etnaviv authors 2015-12-03  171  	etnaviv_core_dump_regi=
sters(&iter, gpu);
27b67278e007b5 Lucas Stach         2019-07-05  172  	etnaviv_core_dump_mmu(=
&iter, gpu->mmu_context, mmu_size);
2f9225dbc09abe Lucas Stach         2017-11-24  173  	etnaviv_core_dump_mem(=
&iter, ETDUMP_BUF_RING, gpu->buffer.vaddr,
2f9225dbc09abe Lucas Stach         2017-11-24  174  			      gpu->buffer.si=
ze,
db82a0435b8be3 Lucas Stach         2019-07-05  175  			      etnaviv_cmdbuf=
_get_va(&gpu->buffer,
17e4660ae3d7e1 Lucas Stach         2019-07-05  176  					&gpu->mmu_context-=
>cmdbuf_mapping));
2f9225dbc09abe Lucas Stach         2017-11-24  177  =

2f9225dbc09abe Lucas Stach         2017-11-24  178  	etnaviv_core_dump_mem(=
&iter, ETDUMP_BUF_CMD,
2f9225dbc09abe Lucas Stach         2017-11-24  179  			      submit->cmdbuf=
.vaddr, submit->cmdbuf.size,
db82a0435b8be3 Lucas Stach         2019-07-05  180  			      etnaviv_cmdbuf=
_get_va(&submit->cmdbuf,
17e4660ae3d7e1 Lucas Stach         2019-07-05  181  					&gpu->mmu_context-=
>cmdbuf_mapping));
a8c21a5451d831 The etnaviv authors 2015-12-03  182  =

ca8cb69580236f Lucas Stach         2019-10-16  183  	mutex_unlock(&gpu->mmu=
_context->lock);
ca8cb69580236f Lucas Stach         2019-10-16  184  =

a8c21a5451d831 The etnaviv authors 2015-12-03  185  	/* Reserve space for t=
he bomap */
a8c21a5451d831 The etnaviv authors 2015-12-03  186  	if (n_bomap_pages) {
a8c21a5451d831 The etnaviv authors 2015-12-03  187  		bomap_start =3D bomap=
 =3D iter.data;
a8c21a5451d831 The etnaviv authors 2015-12-03  188  		memset(bomap, 0, size=
of(*bomap) * n_bomap_pages);
a8c21a5451d831 The etnaviv authors 2015-12-03  189  		etnaviv_core_dump_hea=
der(&iter, ETDUMP_BUF_BOMAP,
a8c21a5451d831 The etnaviv authors 2015-12-03  190  					 bomap + n_bomap_p=
ages);
a8c21a5451d831 The etnaviv authors 2015-12-03  191  	} else {
a8c21a5451d831 The etnaviv authors 2015-12-03  192  		/* Silence warning */
a8c21a5451d831 The etnaviv authors 2015-12-03  193  		bomap_start =3D bomap=
 =3D NULL;
a8c21a5451d831 The etnaviv authors 2015-12-03  194  	}
a8c21a5451d831 The etnaviv authors 2015-12-03  195  =

9a1fdae5876016 Lucas Stach         2019-08-09  196  	for (i =3D 0; i < subm=
it->nr_bos; i++) {
9a1fdae5876016 Lucas Stach         2019-08-09  197  		struct etnaviv_vram_m=
apping *vram;
a8c21a5451d831 The etnaviv authors 2015-12-03  198  		struct page **pages;
a8c21a5451d831 The etnaviv authors 2015-12-03  199  		void *vaddr;
a8c21a5451d831 The etnaviv authors 2015-12-03  200  =

9a1fdae5876016 Lucas Stach         2019-08-09  201  		obj =3D submit->bos[i=
].obj;
9a1fdae5876016 Lucas Stach         2019-08-09  202  		vram =3D submit->bos[=
i].mapping;
a8c21a5451d831 The etnaviv authors 2015-12-03  203  =

339073ef77e45e Lucas Stach         2016-01-22  204  		mutex_lock(&obj->lock=
);
a8c21a5451d831 The etnaviv authors 2015-12-03  205  		pages =3D etnaviv_gem=
_get_pages(obj);
339073ef77e45e Lucas Stach         2016-01-22  206  		mutex_unlock(&obj->lo=
ck);
f8261c376e7f8c Dan Carpenter       2019-01-14  207  		if (!IS_ERR(pages)) {
a8c21a5451d831 The etnaviv authors 2015-12-03  208  			int j;
a8c21a5451d831 The etnaviv authors 2015-12-03  209  =

a8c21a5451d831 The etnaviv authors 2015-12-03  210  			iter.hdr->data[0] =
=3D bomap - bomap_start;
a8c21a5451d831 The etnaviv authors 2015-12-03  211  =

a8c21a5451d831 The etnaviv authors 2015-12-03  212  			for (j =3D 0; j < ob=
j->base.size >> PAGE_SHIFT; j++)
a8c21a5451d831 The etnaviv authors 2015-12-03 @213  				*bomap++ =3D cpu_to=
_le64(page_to_phys(*pages++));

:::::: The code at line 213 was first introduced by commit
:::::: a8c21a5451d831e67b7a6fb910f9ca8bc7b43554 drm/etnaviv: add initial et=
naviv DRM driver

:::::: TO: The etnaviv authors <dri-devel@lists.freedesktop.org>
:::::: CC: Lucas Stach <l.stach@pengutronix.de>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5904025176870223650==--

