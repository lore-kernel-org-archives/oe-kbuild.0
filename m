Content-Type: multipart/mixed; boundary="===============2899084039879366787=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: mm/cma.c:209:3: warning: %d in format string (no. 1) requires 'int' but the argument type is 'unsigned int'. [invalidPrintfArgType_sint]
Date: Fri, 16 Jul 2021 09:43:28 +0800
Message-ID: <202107160906.DYv2rhKU-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2899084039879366787==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Barry Song <song.bao.hua@hisilicon.com>
CC: Nathan Chancellor <natechancellor@gmail.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Mike Kravetz <mike.kravetz@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   e9338abf0e186336022293d2e454c106761f262b
commit: 18e98e56f4407b8c766b6f6d9f2850fd2a081e4d mm: cma: fix the name of C=
MA areas
date:   11 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 11 months ago
compiler: aarch64-linux-gcc (GCC) 10.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)
>> mm/cma.c:209:3: warning: %d in format string (no. 1) requires 'int' but =
the argument type is 'unsigned int'. [invalidPrintfArgType_sint]
     snprintf(cma->name, CMA_MAX_NAME,  "cma%dn", cma_area_count);
     ^

vim +209 mm/cma.c

a254129e8686bf Joonsoo Kim      2014-08-06  159  =

de9e14eebf33a6 Marek Szyprowski 2014-10-13  160  /**
de9e14eebf33a6 Marek Szyprowski 2014-10-13  161   * cma_init_reserved_mem()=
 - create custom contiguous area from reserved memory
de9e14eebf33a6 Marek Szyprowski 2014-10-13  162   * @base: Base address of =
the reserved area
de9e14eebf33a6 Marek Szyprowski 2014-10-13  163   * @size: Size of the rese=
rved area (in bytes),
de9e14eebf33a6 Marek Szyprowski 2014-10-13  164   * @order_per_bit: Order o=
f pages represented by one bit on bitmap.
e8b098fc5747a7 Mike Rapoport    2018-04-05  165   * @name: The name of the =
area. If this parameter is NULL, the name of
e8b098fc5747a7 Mike Rapoport    2018-04-05  166   *        the area will be=
 set to "cmaN", where N is a running counter of
e8b098fc5747a7 Mike Rapoport    2018-04-05  167   *        used areas.
de9e14eebf33a6 Marek Szyprowski 2014-10-13  168   * @res_cma: Pointer to st=
ore the created cma region.
de9e14eebf33a6 Marek Szyprowski 2014-10-13  169   *
de9e14eebf33a6 Marek Szyprowski 2014-10-13  170   * This function creates c=
ustom contiguous area from already reserved memory.
de9e14eebf33a6 Marek Szyprowski 2014-10-13  171   */
de9e14eebf33a6 Marek Szyprowski 2014-10-13  172  int __init cma_init_reserv=
ed_mem(phys_addr_t base, phys_addr_t size,
ac173824959ade Sasha Levin      2015-04-14  173  				 unsigned int order_pe=
r_bit,
f318dd083c8128 Laura Abbott     2017-04-18  174  				 const char *name,
ac173824959ade Sasha Levin      2015-04-14  175  				 struct cma **res_cma)
de9e14eebf33a6 Marek Szyprowski 2014-10-13  176  {
de9e14eebf33a6 Marek Szyprowski 2014-10-13  177  	struct cma *cma;
de9e14eebf33a6 Marek Szyprowski 2014-10-13  178  	phys_addr_t alignment;
de9e14eebf33a6 Marek Szyprowski 2014-10-13  179  =

de9e14eebf33a6 Marek Szyprowski 2014-10-13  180  	/* Sanity checks */
de9e14eebf33a6 Marek Szyprowski 2014-10-13  181  	if (cma_area_count =3D=3D=
 ARRAY_SIZE(cma_areas)) {
de9e14eebf33a6 Marek Szyprowski 2014-10-13  182  		pr_err("Not enough slots=
 for CMA reserved regions!\n");
de9e14eebf33a6 Marek Szyprowski 2014-10-13  183  		return -ENOSPC;
de9e14eebf33a6 Marek Szyprowski 2014-10-13  184  	}
de9e14eebf33a6 Marek Szyprowski 2014-10-13  185  =

de9e14eebf33a6 Marek Szyprowski 2014-10-13  186  	if (!size || !memblock_is=
_region_reserved(base, size))
de9e14eebf33a6 Marek Szyprowski 2014-10-13  187  		return -EINVAL;
de9e14eebf33a6 Marek Szyprowski 2014-10-13  188  =

0f96ae2928a547 Shailendra Verma 2015-06-24  189  	/* ensure minimal alignme=
nt required by mm core */
badbda53e50508 Stephen Rothwell 2016-05-27  190  	alignment =3D PAGE_SIZE <<
badbda53e50508 Stephen Rothwell 2016-05-27  191  			max_t(unsigned long, MA=
X_ORDER - 1, pageblock_order);
de9e14eebf33a6 Marek Szyprowski 2014-10-13  192  =

de9e14eebf33a6 Marek Szyprowski 2014-10-13  193  	/* alignment should be al=
igned with order_per_bit */
de9e14eebf33a6 Marek Szyprowski 2014-10-13  194  	if (!IS_ALIGNED(alignment=
 >> PAGE_SHIFT, 1 << order_per_bit))
de9e14eebf33a6 Marek Szyprowski 2014-10-13  195  		return -EINVAL;
de9e14eebf33a6 Marek Szyprowski 2014-10-13  196  =

de9e14eebf33a6 Marek Szyprowski 2014-10-13  197  	if (ALIGN(base, alignment=
) !=3D base || ALIGN(size, alignment) !=3D size)
de9e14eebf33a6 Marek Szyprowski 2014-10-13  198  		return -EINVAL;
de9e14eebf33a6 Marek Szyprowski 2014-10-13  199  =

de9e14eebf33a6 Marek Szyprowski 2014-10-13  200  	/*
de9e14eebf33a6 Marek Szyprowski 2014-10-13  201  	 * Each reserved area mus=
t be initialised later, when more kernel
de9e14eebf33a6 Marek Szyprowski 2014-10-13  202  	 * subsystems (like slab =
allocator) are available.
de9e14eebf33a6 Marek Szyprowski 2014-10-13  203  	 */
de9e14eebf33a6 Marek Szyprowski 2014-10-13  204  	cma =3D &cma_areas[cma_ar=
ea_count];
18e98e56f4407b Barry Song       2020-08-11  205  =

18e98e56f4407b Barry Song       2020-08-11  206  	if (name)
18e98e56f4407b Barry Song       2020-08-11  207  		snprintf(cma->name, CMA_=
MAX_NAME, name);
18e98e56f4407b Barry Song       2020-08-11  208  	else
18e98e56f4407b Barry Song       2020-08-11 @209  		snprintf(cma->name, CMA_=
MAX_NAME,  "cma%d\n", cma_area_count);
18e98e56f4407b Barry Song       2020-08-11  210  =

de9e14eebf33a6 Marek Szyprowski 2014-10-13  211  	cma->base_pfn =3D PFN_DOW=
N(base);
de9e14eebf33a6 Marek Szyprowski 2014-10-13  212  	cma->count =3D size >> PA=
GE_SHIFT;
de9e14eebf33a6 Marek Szyprowski 2014-10-13  213  	cma->order_per_bit =3D or=
der_per_bit;
de9e14eebf33a6 Marek Szyprowski 2014-10-13  214  	*res_cma =3D cma;
de9e14eebf33a6 Marek Szyprowski 2014-10-13  215  	cma_area_count++;
94737a85f332ae George G. Davis  2015-02-11  216  	totalcma_pages +=3D (size=
 / PAGE_SIZE);
de9e14eebf33a6 Marek Szyprowski 2014-10-13  217  =

de9e14eebf33a6 Marek Szyprowski 2014-10-13  218  	return 0;
de9e14eebf33a6 Marek Szyprowski 2014-10-13  219  }
de9e14eebf33a6 Marek Szyprowski 2014-10-13  220  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2899084039879366787==--

