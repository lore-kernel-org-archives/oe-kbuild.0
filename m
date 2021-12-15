Content-Type: multipart/mixed; boundary="===============6975906631081780284=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 15/43] kmsan: mm: maintain KMSAN metadata for page operations
Date: Wed, 15 Dec 2021 21:09:54 +0800
Message-ID: <202112152149.7ygega3j-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6975906631081780284==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20211214162050.660953-16-glider@google.com>
References: <20211214162050.660953-16-glider@google.com>
TO: Alexander Potapenko <glider@google.com>

Hi Alexander,

I love your patch! Perhaps something to improve:

[auto build test WARNING on tip/x86/mm]
[also build test WARNING on linus/master v5.16-rc5]
[cannot apply to tip/x86/core hnaz-mm/master next-20211214]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Alexander-Potapenko/Add-Ke=
rnelMemorySanitizer-infrastructure/20211215-003033
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git 35fa745=
286ac44ee26ed100c2bd2553368ad193b
:::::: branch date: 21 hours ago
:::::: commit date: 21 hours ago
config: x86_64-randconfig-m001-20211214 (https://download.01.org/0day-ci/ar=
chive/20211215/202112152149.7ygega3j-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
mm/vmalloc.c:442 __vunmap_range_noflush() warn: bitwise AND condition is fa=
lse here

vim +442 mm/vmalloc.c

c2febafc67734a Kirill A. Shutemov  2017-03-09  411  =

4ad0ae8c64ac8f Nicholas Piggin     2021-04-29  412  /*
4ad0ae8c64ac8f Nicholas Piggin     2021-04-29  413   * vunmap_range_noflush=
 is similar to vunmap_range, but does not
4ad0ae8c64ac8f Nicholas Piggin     2021-04-29  414   * flush caches or TLBs.
b521c43f58e523 Christoph Hellwig   2020-06-01  415   *
4ad0ae8c64ac8f Nicholas Piggin     2021-04-29  416   * The caller is respon=
sible for calling flush_cache_vmap() before calling
4ad0ae8c64ac8f Nicholas Piggin     2021-04-29  417   * this function, and f=
lush_tlb_kernel_range after it has returned
4ad0ae8c64ac8f Nicholas Piggin     2021-04-29  418   * successfully (and be=
fore the addresses are expected to cause a page fault
4ad0ae8c64ac8f Nicholas Piggin     2021-04-29  419   * or be re-mapped for =
something else, if TLB flushes are being delayed or
4ad0ae8c64ac8f Nicholas Piggin     2021-04-29  420   * coalesced).
b521c43f58e523 Christoph Hellwig   2020-06-01  421   *
4ad0ae8c64ac8f Nicholas Piggin     2021-04-29  422   * This is an internal =
function only. Do not use outside mm/.
b521c43f58e523 Christoph Hellwig   2020-06-01  423   */
73c9fc6d9c6621 Alexander Potapenko 2021-12-14  424  void __vunmap_range_nof=
lush(unsigned long start, unsigned long end)
^1da177e4c3f41 Linus Torvalds      2005-04-16  425  {
^1da177e4c3f41 Linus Torvalds      2005-04-16  426  	unsigned long next;
b521c43f58e523 Christoph Hellwig   2020-06-01  427  	pgd_t *pgd;
2ba3e6947aed9b Joerg Roedel        2020-06-01  428  	unsigned long addr =3D=
 start;
2ba3e6947aed9b Joerg Roedel        2020-06-01  429  	pgtbl_mod_mask mask =
=3D 0;
^1da177e4c3f41 Linus Torvalds      2005-04-16  430  =

^1da177e4c3f41 Linus Torvalds      2005-04-16  431  	BUG_ON(addr >=3D end);
^1da177e4c3f41 Linus Torvalds      2005-04-16  432  	pgd =3D pgd_offset_k(a=
ddr);
^1da177e4c3f41 Linus Torvalds      2005-04-16  433  	do {
^1da177e4c3f41 Linus Torvalds      2005-04-16  434  		next =3D pgd_addr_end=
(addr, end);
2ba3e6947aed9b Joerg Roedel        2020-06-01  435  		if (pgd_bad(*pgd))
2ba3e6947aed9b Joerg Roedel        2020-06-01  436  			mask |=3D PGTBL_PGD_=
MODIFIED;
^1da177e4c3f41 Linus Torvalds      2005-04-16  437  		if (pgd_none_or_clear=
_bad(pgd))
^1da177e4c3f41 Linus Torvalds      2005-04-16  438  			continue;
2ba3e6947aed9b Joerg Roedel        2020-06-01  439  		vunmap_p4d_range(pgd,=
 addr, next, &mask);
^1da177e4c3f41 Linus Torvalds      2005-04-16  440  	} while (pgd++, addr =
=3D next, addr !=3D end);
2ba3e6947aed9b Joerg Roedel        2020-06-01  441  =

2ba3e6947aed9b Joerg Roedel        2020-06-01 @442  	if (mask & ARCH_PAGE_T=
ABLE_SYNC_MASK)
2ba3e6947aed9b Joerg Roedel        2020-06-01  443  		arch_sync_kernel_mapp=
ings(start, end);
^1da177e4c3f41 Linus Torvalds      2005-04-16  444  }
^1da177e4c3f41 Linus Torvalds      2005-04-16  445  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6975906631081780284==--

