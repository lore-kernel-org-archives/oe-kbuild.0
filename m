Content-Type: multipart/mixed; boundary="===============4724968166369123511=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 3421/3897] mm/vmalloc.c:3077 __vmalloc_node_range() warn: bitwise AND condition is false here
Date: Sun, 28 Nov 2021 10:46:00 +0800
Message-ID: <202111281011.FJm6wfvB-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4724968166369123511==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Kefeng Wang <wangkefeng.wang@huawei.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   f30a24ed97b401416118756fa35fbe5d28f999e3
commit: f61bc9ffcab1688372969e3cbb36cab83f045c22 [3421/3897] mm: defer kmem=
leak object creation of module_alloc()
:::::: branch date: 2 days ago
:::::: commit date: 3 days ago
config: i386-randconfig-m021-20211126 (https://download.01.org/0day-ci/arch=
ive/20211128/202111281011.FJm6wfvB-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
mm/vmalloc.c:3077 __vmalloc_node_range() warn: bitwise AND condition is fal=
se here

vim +3077 mm/vmalloc.c

^1da177e4c3f41 Linus Torvalds          2005-04-16  2984  =

^1da177e4c3f41 Linus Torvalds          2005-04-16  2985  /**
d0a21265dfb5fa David Rientjes          2011-01-13  2986   * __vmalloc_node_=
range - allocate virtually contiguous memory
^1da177e4c3f41 Linus Torvalds          2005-04-16  2987   * @size:		  alloc=
ation size
2dca6999eed58d David Miller            2009-09-21  2988   * @align:		  desi=
red alignment
d0a21265dfb5fa David Rientjes          2011-01-13  2989   * @start:		  vm a=
rea range start
d0a21265dfb5fa David Rientjes          2011-01-13  2990   * @end:		  vm are=
a range end
^1da177e4c3f41 Linus Torvalds          2005-04-16  2991   * @gfp_mask:		  f=
lags for the page level allocator
^1da177e4c3f41 Linus Torvalds          2005-04-16  2992   * @prot:		  prote=
ction mask for the allocated pages
cb9e3c292d0115 Andrey Ryabinin         2015-02-13  2993   * @vm_flags:		  a=
dditional vm area flags (e.g. %VM_NO_GUARD)
00ef2d2f84babb David Rientjes          2013-02-22  2994   * @node:		  node =
to use for allocation or NUMA_NO_NODE
c85d194bfd2e36 Randy Dunlap            2008-05-01  2995   * @caller:		  cal=
ler's return address
^1da177e4c3f41 Linus Torvalds          2005-04-16  2996   *
^1da177e4c3f41 Linus Torvalds          2005-04-16  2997   * Allocate enough=
 pages to cover @size from the page level
b7d90e7a5ea8d6 Michal Hocko            2021-11-05  2998   * allocator with =
@gfp_mask flags. Please note that the full set of gfp
b7d90e7a5ea8d6 Michal Hocko            2021-11-05  2999   * flags are not s=
upported. GFP_KERNEL would be a preferred allocation mode
b7d90e7a5ea8d6 Michal Hocko            2021-11-05  3000   * but GFP_NOFS an=
d GFP_NOIO are supported as well. Zone modifiers are not
b7d90e7a5ea8d6 Michal Hocko            2021-11-05  3001   * supported. From=
 the reclaim modifiers__GFP_DIRECT_RECLAIM is required (aka
b7d90e7a5ea8d6 Michal Hocko            2021-11-05  3002   * GFP_NOWAIT is n=
ot supported) and only __GFP_NOFAIL is supported (aka
b7d90e7a5ea8d6 Michal Hocko            2021-11-05  3003   * __GFP_NORETRY a=
nd __GFP_RETRY_MAYFAIL are not supported).
b7d90e7a5ea8d6 Michal Hocko            2021-11-05  3004   * __GFP_NOWARN ca=
n be used to suppress error messages about failures.
b7d90e7a5ea8d6 Michal Hocko            2021-11-05  3005   *
b7d90e7a5ea8d6 Michal Hocko            2021-11-05  3006   * Map them into c=
ontiguous kernel virtual space, using a pagetable
b7d90e7a5ea8d6 Michal Hocko            2021-11-05  3007   * protection of @=
prot.
a862f68a8b3600 Mike Rapoport           2019-03-05  3008   *
a862f68a8b3600 Mike Rapoport           2019-03-05  3009   * Return: the add=
ress of the area or %NULL on failure
^1da177e4c3f41 Linus Torvalds          2005-04-16  3010   */
d0a21265dfb5fa David Rientjes          2011-01-13  3011  void *__vmalloc_no=
de_range(unsigned long size, unsigned long align,
d0a21265dfb5fa David Rientjes          2011-01-13  3012  			unsigned long s=
tart, unsigned long end, gfp_t gfp_mask,
cb9e3c292d0115 Andrey Ryabinin         2015-02-13  3013  			pgprot_t prot, =
unsigned long vm_flags, int node,
cb9e3c292d0115 Andrey Ryabinin         2015-02-13  3014  			const void *cal=
ler)
^1da177e4c3f41 Linus Torvalds          2005-04-16  3015  {
^1da177e4c3f41 Linus Torvalds          2005-04-16  3016  	struct vm_struct =
*area;
89219d37a2377c Catalin Marinas         2009-06-11  3017  	void *addr;
89219d37a2377c Catalin Marinas         2009-06-11  3018  	unsigned long rea=
l_size =3D size;
121e6f3258fe39 Nicholas Piggin         2021-04-29  3019  	unsigned long rea=
l_align =3D align;
121e6f3258fe39 Nicholas Piggin         2021-04-29  3020  	unsigned int shif=
t =3D PAGE_SHIFT;
^1da177e4c3f41 Linus Torvalds          2005-04-16  3021  =

d70bec8cc95ad3 Nicholas Piggin         2021-04-29  3022  	if (WARN_ON_ONCE(=
!size))
d70bec8cc95ad3 Nicholas Piggin         2021-04-29  3023  		return NULL;
d70bec8cc95ad3 Nicholas Piggin         2021-04-29  3024  =

d70bec8cc95ad3 Nicholas Piggin         2021-04-29  3025  	if ((size >> PAGE=
_SHIFT) > totalram_pages()) {
d70bec8cc95ad3 Nicholas Piggin         2021-04-29  3026  		warn_alloc(gfp_m=
ask, NULL,
f4bdfeaf18a44b Uladzislau Rezki (Sony  2021-06-28  3027) 			"vmalloc error:=
 size %lu, exceeds total pages",
f4bdfeaf18a44b Uladzislau Rezki (Sony  2021-06-28  3028) 			real_size);
d70bec8cc95ad3 Nicholas Piggin         2021-04-29  3029  		return NULL;
121e6f3258fe39 Nicholas Piggin         2021-04-29  3030  	}
121e6f3258fe39 Nicholas Piggin         2021-04-29  3031  =

3382bbee0464bf Christophe Leroy        2021-06-30  3032  	if (vmap_allow_hu=
ge && !(vm_flags & VM_NO_HUGE_VMAP)) {
121e6f3258fe39 Nicholas Piggin         2021-04-29  3033  		unsigned long si=
ze_per_node;
^1da177e4c3f41 Linus Torvalds          2005-04-16  3034  =

121e6f3258fe39 Nicholas Piggin         2021-04-29  3035  		/*
121e6f3258fe39 Nicholas Piggin         2021-04-29  3036  		 * Try huge page=
s. Only try for PAGE_KERNEL allocations,
121e6f3258fe39 Nicholas Piggin         2021-04-29  3037  		 * others like m=
odules don't yet expect huge pages in
121e6f3258fe39 Nicholas Piggin         2021-04-29  3038  		 * their allocat=
ions due to apply_to_page_range not
121e6f3258fe39 Nicholas Piggin         2021-04-29  3039  		 * supporting th=
em.
121e6f3258fe39 Nicholas Piggin         2021-04-29  3040  		 */
121e6f3258fe39 Nicholas Piggin         2021-04-29  3041  =

121e6f3258fe39 Nicholas Piggin         2021-04-29  3042  		size_per_node =
=3D size;
121e6f3258fe39 Nicholas Piggin         2021-04-29  3043  		if (node =3D=3D =
NUMA_NO_NODE)
121e6f3258fe39 Nicholas Piggin         2021-04-29  3044  			size_per_node /=
=3D num_online_nodes();
3382bbee0464bf Christophe Leroy        2021-06-30  3045  		if (arch_vmap_pm=
d_supported(prot) && size_per_node >=3D PMD_SIZE)
121e6f3258fe39 Nicholas Piggin         2021-04-29  3046  			shift =3D PMD_S=
HIFT;
3382bbee0464bf Christophe Leroy        2021-06-30  3047  		else
3382bbee0464bf Christophe Leroy        2021-06-30  3048  			shift =3D arch_=
vmap_pte_supported_shift(size_per_node);
3382bbee0464bf Christophe Leroy        2021-06-30  3049  =

121e6f3258fe39 Nicholas Piggin         2021-04-29  3050  		align =3D max(re=
al_align, 1UL << shift);
121e6f3258fe39 Nicholas Piggin         2021-04-29  3051  		size =3D ALIGN(r=
eal_size, 1UL << shift);
121e6f3258fe39 Nicholas Piggin         2021-04-29  3052  	}
121e6f3258fe39 Nicholas Piggin         2021-04-29  3053  =

121e6f3258fe39 Nicholas Piggin         2021-04-29  3054  again:
7ca3027b726be6 Daniel Axtens           2021-06-24  3055  	area =3D __get_vm=
_area_node(real_size, align, shift, VM_ALLOC |
7ca3027b726be6 Daniel Axtens           2021-06-24  3056  				  VM_UNINITIAL=
IZED | vm_flags, start, end, node,
7ca3027b726be6 Daniel Axtens           2021-06-24  3057  				  gfp_mask, ca=
ller);
d70bec8cc95ad3 Nicholas Piggin         2021-04-29  3058  	if (!area) {
d70bec8cc95ad3 Nicholas Piggin         2021-04-29  3059  		warn_alloc(gfp_m=
ask, NULL,
f4bdfeaf18a44b Uladzislau Rezki (Sony  2021-06-28  3060) 			"vmalloc error:=
 size %lu, vm_struct allocation failed",
f4bdfeaf18a44b Uladzislau Rezki (Sony  2021-06-28  3061) 			real_size);
de7d2b567d040e Joe Perches             2011-10-31  3062  		goto fail;
d70bec8cc95ad3 Nicholas Piggin         2021-04-29  3063  	}
^1da177e4c3f41 Linus Torvalds          2005-04-16  3064  =

121e6f3258fe39 Nicholas Piggin         2021-04-29  3065  	addr =3D __vmallo=
c_area_node(area, gfp_mask, prot, shift, node);
1368edf0647ac1 Mel Gorman              2011-12-08  3066  	if (!addr)
121e6f3258fe39 Nicholas Piggin         2021-04-29  3067  		goto fail;
89219d37a2377c Catalin Marinas         2009-06-11  3068  =

f5252e009d5b87 Mitsuo Hayasaka         2011-10-31  3069  	/*
20fc02b477c526 Zhang Yanfei            2013-07-08  3070  	 * In this functi=
on, newly allocated vm_struct has VM_UNINITIALIZED
20fc02b477c526 Zhang Yanfei            2013-07-08  3071  	 * flag. It means=
 that vm_struct is not fully initialized.
4341fa454796b8 Joonsoo Kim             2013-04-29  3072  	 * Now, it is ful=
ly initialized, so remove this flag here.
f5252e009d5b87 Mitsuo Hayasaka         2011-10-31  3073  	 */
20fc02b477c526 Zhang Yanfei            2013-07-08  3074  	clear_vm_uninitia=
lized_flag(area);
f5252e009d5b87 Mitsuo Hayasaka         2011-10-31  3075  =

7ca3027b726be6 Daniel Axtens           2021-06-24  3076  	size =3D PAGE_ALI=
GN(size);
f61bc9ffcab168 Kefeng Wang             2021-11-25 @3077  	if (!(vm_flags & =
VM_DEFER_KMEMLEAK))
94f4a1618b4c2b Catalin Marinas         2017-07-06  3078  		kmemleak_vmalloc=
(area, size, gfp_mask);
89219d37a2377c Catalin Marinas         2009-06-11  3079  =

89219d37a2377c Catalin Marinas         2009-06-11  3080  	return addr;
de7d2b567d040e Joe Perches             2011-10-31  3081  =

de7d2b567d040e Joe Perches             2011-10-31  3082  fail:
121e6f3258fe39 Nicholas Piggin         2021-04-29  3083  	if (shift > PAGE_=
SHIFT) {
121e6f3258fe39 Nicholas Piggin         2021-04-29  3084  		shift =3D PAGE_S=
HIFT;
121e6f3258fe39 Nicholas Piggin         2021-04-29  3085  		align =3D real_a=
lign;
121e6f3258fe39 Nicholas Piggin         2021-04-29  3086  		size =3D real_si=
ze;
121e6f3258fe39 Nicholas Piggin         2021-04-29  3087  		goto again;
121e6f3258fe39 Nicholas Piggin         2021-04-29  3088  	}
121e6f3258fe39 Nicholas Piggin         2021-04-29  3089  =

de7d2b567d040e Joe Perches             2011-10-31  3090  	return NULL;
^1da177e4c3f41 Linus Torvalds          2005-04-16  3091  }
^1da177e4c3f41 Linus Torvalds          2005-04-16  3092  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4724968166369123511==--

