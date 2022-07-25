Content-Type: multipart/mixed; boundary="===============0699455937909638159=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 2965/12552] mm/memory_hotplug.c:351 __add_pages() error: uninitialized symbol 'err'.
Date: Mon, 25 Jul 2022 16:07:18 +0800
Message-ID: <202207251634.guJgI4WI-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0699455937909638159==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Anshuman Khandual <anshuman.khandual@arm.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: David Hildenbrand <david@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   18c107a1f120d095404d141dfad8f594bdc44020
commit: 943189db4f3ed1445dd630dc0b96e115357c4330 [2965/12552] mm/memory_hot=
plug: drop 'reason' argument from check_pfn_span()
:::::: branch date: 3 days ago
:::::: commit date: 5 weeks ago
config: x86_64-randconfig-m001-20220718 (https://download.01.org/0day-ci/ar=
chive/20220725/202207251634.guJgI4WI-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
mm/memory_hotplug.c:351 __add_pages() error: uninitialized symbol 'err'.

vim +/err +351 mm/memory_hotplug.c

9f605f260594f9 Dan Williams      2021-02-25  309  =

7ea6216049ff9c Dan Williams      2019-07-18  310  int __ref __add_pages(int=
 nid, unsigned long pfn, unsigned long nr_pages,
f5637d3b42ab04 Logan Gunthorpe   2020-04-10  311  		struct mhp_params *para=
ms)
4edd7ceff0662a David Rientjes    2013-04-29  312  {
6cdd0b30a920b3 David Hildenbrand 2020-04-06  313  	const unsigned long end_=
pfn =3D pfn + nr_pages;
6cdd0b30a920b3 David Hildenbrand 2020-04-06  314  	unsigned long cur_nr_pag=
es;
9a845030427c7a Dan Williams      2019-07-18  315  	int err;
f5637d3b42ab04 Logan Gunthorpe   2020-04-10  316  	struct vmem_altmap *altm=
ap =3D params->altmap;
4b94ffdc4163ba Dan Williams      2016-01-15  317  =

6366238b8dfc38 liusongtang       2022-05-09  318  	if (WARN_ON_ONCE(!pgprot=
_val(params->pgprot)))
bfeb022f8fe4c5 Logan Gunthorpe   2020-04-10  319  		return -EINVAL;
bfeb022f8fe4c5 Logan Gunthorpe   2020-04-10  320  =

bca3feaa0764ab Anshuman Khandual 2021-02-25  321  	VM_BUG_ON(!mhp_range_all=
owed(PFN_PHYS(pfn), nr_pages * PAGE_SIZE, false));
dca4436d1cf9e0 Alastair D'Silva  2019-11-30  322  =

4b94ffdc4163ba Dan Williams      2016-01-15  323  	if (altmap) {
4b94ffdc4163ba Dan Williams      2016-01-15  324  		/*
4b94ffdc4163ba Dan Williams      2016-01-15  325  		 * Validate altmap is w=
ithin bounds of the total request
4b94ffdc4163ba Dan Williams      2016-01-15  326  		 */
7ea6216049ff9c Dan Williams      2019-07-18  327  		if (altmap->base_pfn !=
=3D pfn
4b94ffdc4163ba Dan Williams      2016-01-15  328  				|| vmem_altmap_offset=
(altmap) > nr_pages) {
4b94ffdc4163ba Dan Williams      2016-01-15  329  			pr_warn_once("memory a=
dd fail, invalid altmap\n");
7ea6216049ff9c Dan Williams      2019-07-18  330  			return -EINVAL;
4b94ffdc4163ba Dan Williams      2016-01-15  331  		}
4b94ffdc4163ba Dan Williams      2016-01-15  332  		altmap->alloc =3D 0;
4b94ffdc4163ba Dan Williams      2016-01-15  333  	}
4b94ffdc4163ba Dan Williams      2016-01-15  334  =

943189db4f3ed1 Anshuman Khandual 2022-05-31  335  	if (check_pfn_span(pfn, =
nr_pages)) {
943189db4f3ed1 Anshuman Khandual 2022-05-31  336  		WARN(1, "Misaligned %s =
start: %#lx end: #%lx\n", __func__, pfn, pfn + nr_pages - 1);
943189db4f3ed1 Anshuman Khandual 2022-05-31  337  		return -EINVAL;
943189db4f3ed1 Anshuman Khandual 2022-05-31  338  	}
7ea6216049ff9c Dan Williams      2019-07-18  339  =

6cdd0b30a920b3 David Hildenbrand 2020-04-06  340  	for (; pfn < end_pfn; pf=
n +=3D cur_nr_pages) {
6cdd0b30a920b3 David Hildenbrand 2020-04-06  341  		/* Select all remaining=
 pages up to the next section boundary */
6cdd0b30a920b3 David Hildenbrand 2020-04-06  342  		cur_nr_pages =3D min(en=
d_pfn - pfn,
6cdd0b30a920b3 David Hildenbrand 2020-04-06  343  				   SECTION_ALIGN_UP(p=
fn + 1) - pfn);
e3246d8f52173a Joao Martins      2022-04-28  344  		err =3D sparse_add_sect=
ion(nid, pfn, cur_nr_pages, altmap,
e3246d8f52173a Joao Martins      2022-04-28  345  					 params->pgmap);
ba72b4c8cf60e4 Dan Williams      2019-07-18  346  		if (err)
ba72b4c8cf60e4 Dan Williams      2019-07-18  347  			break;
f64ac5e6e30668 Michal Hocko      2017-10-03  348  		cond_resched();
4edd7ceff0662a David Rientjes    2013-04-29  349  	}
c435a390574d01 Zhu Guihua        2015-06-24  350  	vmemmap_populate_print_l=
ast();
4edd7ceff0662a David Rientjes    2013-04-29 @351  	return err;
4edd7ceff0662a David Rientjes    2013-04-29  352  }
4edd7ceff0662a David Rientjes    2013-04-29  353  =


:::::: The code at line 351 was first introduced by commit
:::::: 4edd7ceff0662afde195da6f6c43e7cbe1ed2dc4 mm, hotplug: avoid compilin=
g memory hotremove functions when disabled

:::::: TO: David Rientjes <rientjes@google.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0699455937909638159==--

