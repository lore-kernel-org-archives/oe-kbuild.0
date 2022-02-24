Content-Type: multipart/mixed; boundary="===============1696008397312592849=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [davidhildenbrand:cow_fixes_part_2 21/27] mm/hugetlb.c:6051 follow_hugetlb_page() error: uninitialized symbol 'unshare'.
Date: Thu, 24 Feb 2022 14:37:40 +0800
Message-ID: <202202241452.QrPElUkk-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1696008397312592849==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: David Hildenbrand <david@redhat.com>
CC: Andrea Arcangeli <aarcange@redhat.com>

tree:   git://github.com/davidhildenbrand/linux cow_fixes_part_2
head:   6a519d5bcfc204824056f340a0cfc86207962151
commit: d41af2eea859d0123cf08a88eae48239d5bdae2b [21/27] mm/gup: trigger FA=
ULT_FLAG_UNSHARE when R/O-pinning a possibly shared anonymous page
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/202=
20224/202202241452.QrPElUkk-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
mm/hugetlb.c:6051 follow_hugetlb_page() error: uninitialized symbol 'unshar=
e'.

vim +/unshare +6051 mm/hugetlb.c

d41af2eea859d0 David Hildenbrand  2021-12-16  5976  =

28a35716d31798 Michel Lespinasse  2013-02-22  5977  long follow_hugetlb_pag=
e(struct mm_struct *mm, struct vm_area_struct *vma,
63551ae0feaaa2 David Gibson       2005-06-21  5978  			 struct page **pages=
, struct vm_area_struct **vmas,
28a35716d31798 Michel Lespinasse  2013-02-22  5979  			 unsigned long *posi=
tion, unsigned long *nr_pages,
4f6da93411806d Peter Xu           2020-04-01  5980  			 long i, unsigned in=
t flags, int *locked)
63551ae0feaaa2 David Gibson       2005-06-21  5981  {
d5d4b0aa4e1430 Kenneth W Chen     2006-03-22  5982  	unsigned long pfn_offs=
et;
d5d4b0aa4e1430 Kenneth W Chen     2006-03-22  5983  	unsigned long vaddr =
=3D *position;
28a35716d31798 Michel Lespinasse  2013-02-22  5984  	unsigned long remainde=
r =3D *nr_pages;
a5516438959d90 Andi Kleen         2008-07-23  5985  	struct hstate *h =3D h=
state_vma(vma);
0fa5bc4023c188 Joao Martins       2021-02-24  5986  	int err =3D -EFAULT, r=
efs;
63551ae0feaaa2 David Gibson       2005-06-21  5987  =

63551ae0feaaa2 David Gibson       2005-06-21  5988  	while (vaddr < vma->vm=
_end && remainder) {
63551ae0feaaa2 David Gibson       2005-06-21  5989  		pte_t *pte;
cb900f41215447 Kirill A. Shutemov 2013-11-14  5990  		spinlock_t *ptl =3D N=
ULL;
d41af2eea859d0 David Hildenbrand  2021-12-16  5991  		bool unshare;
2a15efc953b26a Hugh Dickins       2009-09-21  5992  		int absent;
63551ae0feaaa2 David Gibson       2005-06-21  5993  		struct page *page;
63551ae0feaaa2 David Gibson       2005-06-21  5994  =

02057967b5d3b7 David Rientjes     2015-04-14  5995  		/*
02057967b5d3b7 David Rientjes     2015-04-14  5996  		 * If we have a pendi=
ng SIGKILL, don't keep faulting pages and
02057967b5d3b7 David Rientjes     2015-04-14  5997  		 * potentially alloca=
ting memory.
02057967b5d3b7 David Rientjes     2015-04-14  5998  		 */
fa45f1162f28cb Davidlohr Bueso    2019-01-03  5999  		if (fatal_signal_pend=
ing(current)) {
02057967b5d3b7 David Rientjes     2015-04-14  6000  			remainder =3D 0;
02057967b5d3b7 David Rientjes     2015-04-14  6001  			break;
02057967b5d3b7 David Rientjes     2015-04-14  6002  		}
02057967b5d3b7 David Rientjes     2015-04-14  6003  =

4c887265977213 Adam Litke         2005-10-29  6004  		/*
4c887265977213 Adam Litke         2005-10-29  6005  		 * Some archs (sparc6=
4, sh*) have multiple pte_ts to
2a15efc953b26a Hugh Dickins       2009-09-21  6006  		 * each hugepage.  We=
 have to make sure we get the
4c887265977213 Adam Litke         2005-10-29  6007  		 * first, for the pag=
e indexing below to work.
cb900f41215447 Kirill A. Shutemov 2013-11-14  6008  		 *
cb900f41215447 Kirill A. Shutemov 2013-11-14  6009  		 * Note that page tab=
le lock is not held when pte is null.
4c887265977213 Adam Litke         2005-10-29  6010  		 */
7868a2087ec13e Punit Agrawal      2017-07-06  6011  		pte =3D huge_pte_offs=
et(mm, vaddr & huge_page_mask(h),
7868a2087ec13e Punit Agrawal      2017-07-06  6012  				      huge_page_siz=
e(h));
cb900f41215447 Kirill A. Shutemov 2013-11-14  6013  		if (pte)
cb900f41215447 Kirill A. Shutemov 2013-11-14  6014  			ptl =3D huge_pte_loc=
k(h, mm, pte);
2a15efc953b26a Hugh Dickins       2009-09-21  6015  		absent =3D !pte || hu=
ge_pte_none(huge_ptep_get(pte));
2a15efc953b26a Hugh Dickins       2009-09-21  6016  =

2a15efc953b26a Hugh Dickins       2009-09-21  6017  		/*
2a15efc953b26a Hugh Dickins       2009-09-21  6018  		 * When coredumping, =
it suits get_dump_page if we just return
3ae77f43b1118a Hugh Dickins       2009-09-21  6019  		 * an error where the=
re's an empty slot with no huge pagecache
3ae77f43b1118a Hugh Dickins       2009-09-21  6020  		 * to back it.  This =
way, we avoid allocating a hugepage, and
3ae77f43b1118a Hugh Dickins       2009-09-21  6021  		 * the sparse dumpfil=
e avoids allocating disk blocks, but its
3ae77f43b1118a Hugh Dickins       2009-09-21  6022  		 * huge holes still s=
how up with zeroes where they need to be.
2a15efc953b26a Hugh Dickins       2009-09-21  6023  		 */
3ae77f43b1118a Hugh Dickins       2009-09-21  6024  		if (absent && (flags =
& FOLL_DUMP) &&
3ae77f43b1118a Hugh Dickins       2009-09-21  6025  		    !hugetlbfs_pageca=
che_present(h, vma, vaddr)) {
cb900f41215447 Kirill A. Shutemov 2013-11-14  6026  			if (pte)
cb900f41215447 Kirill A. Shutemov 2013-11-14  6027  				spin_unlock(ptl);
2a15efc953b26a Hugh Dickins       2009-09-21  6028  			remainder =3D 0;
2a15efc953b26a Hugh Dickins       2009-09-21  6029  			break;
2a15efc953b26a Hugh Dickins       2009-09-21  6030  		}
63551ae0feaaa2 David Gibson       2005-06-21  6031  =

9cc3a5bd40067b Naoya Horiguchi    2013-04-17  6032  		/*
9cc3a5bd40067b Naoya Horiguchi    2013-04-17  6033  		 * We need call huget=
lb_fault for both hugepages under migration
9cc3a5bd40067b Naoya Horiguchi    2013-04-17  6034  		 * (in which case hug=
etlb_fault waits for the migration,) and
9cc3a5bd40067b Naoya Horiguchi    2013-04-17  6035  		 * hwpoisoned hugepag=
es (in which case we need to prevent the
9cc3a5bd40067b Naoya Horiguchi    2013-04-17  6036  		 * caller from access=
ing to them.) In order to do this, we use
9cc3a5bd40067b Naoya Horiguchi    2013-04-17  6037  		 * here is_swap_pte i=
nstead of is_hugetlb_entry_migration and
9cc3a5bd40067b Naoya Horiguchi    2013-04-17  6038  		 * is_hugetlb_entry_h=
wpoisoned. This is because it simply covers
9cc3a5bd40067b Naoya Horiguchi    2013-04-17  6039  		 * both cases, and be=
cause we can't follow correct pages
9cc3a5bd40067b Naoya Horiguchi    2013-04-17  6040  		 * directly from any =
kind of swap entries.
9cc3a5bd40067b Naoya Horiguchi    2013-04-17  6041  		 */
d41af2eea859d0 David Hildenbrand  2021-12-16  6042  		if (absent ||
d41af2eea859d0 David Hildenbrand  2021-12-16  6043  		    __follow_hugetlb_=
must_fault(flags, pte, &unshare)) {
2b7403035459c7 Souptick Joarder   2018-08-23  6044  			vm_fault_t ret;
87ffc118b54dcd Andrea Arcangeli   2017-02-22  6045  			unsigned int fault_f=
lags =3D 0;
4c887265977213 Adam Litke         2005-10-29  6046  =

cb900f41215447 Kirill A. Shutemov 2013-11-14  6047  			if (pte)
cb900f41215447 Kirill A. Shutemov 2013-11-14  6048  				spin_unlock(ptl);
87ffc118b54dcd Andrea Arcangeli   2017-02-22  6049  			if (flags & FOLL_WRI=
TE)
87ffc118b54dcd Andrea Arcangeli   2017-02-22  6050  				fault_flags |=3D FA=
ULT_FLAG_WRITE;
d41af2eea859d0 David Hildenbrand  2021-12-16 @6051  			else if (unshare)
d41af2eea859d0 David Hildenbrand  2021-12-16  6052  				fault_flags |=3D FA=
ULT_FLAG_UNSHARE;
4f6da93411806d Peter Xu           2020-04-01  6053  			if (locked)
71335f37c5e8ec Peter Xu           2020-04-01  6054  				fault_flags |=3D FA=
ULT_FLAG_ALLOW_RETRY |
71335f37c5e8ec Peter Xu           2020-04-01  6055  					FAULT_FLAG_KILLABL=
E;
87ffc118b54dcd Andrea Arcangeli   2017-02-22  6056  			if (flags & FOLL_NOW=
AIT)
87ffc118b54dcd Andrea Arcangeli   2017-02-22  6057  				fault_flags |=3D FA=
ULT_FLAG_ALLOW_RETRY |
87ffc118b54dcd Andrea Arcangeli   2017-02-22  6058  					FAULT_FLAG_RETRY_N=
OWAIT;
87ffc118b54dcd Andrea Arcangeli   2017-02-22  6059  			if (flags & FOLL_TRI=
ED) {
4426e945df588f Peter Xu           2020-04-01  6060  				/*
4426e945df588f Peter Xu           2020-04-01  6061  				 * Note: FAULT_FLAG=
_ALLOW_RETRY and
4426e945df588f Peter Xu           2020-04-01  6062  				 * FAULT_FLAG_TRIED=
 can co-exist
4426e945df588f Peter Xu           2020-04-01  6063  				 */
87ffc118b54dcd Andrea Arcangeli   2017-02-22  6064  				fault_flags |=3D FA=
ULT_FLAG_TRIED;
87ffc118b54dcd Andrea Arcangeli   2017-02-22  6065  			}
87ffc118b54dcd Andrea Arcangeli   2017-02-22  6066  			ret =3D hugetlb_faul=
t(mm, vma, vaddr, fault_flags);
87ffc118b54dcd Andrea Arcangeli   2017-02-22  6067  			if (ret & VM_FAULT_E=
RROR) {
2be7cfed995e25 Daniel Jordan      2017-08-02  6068  				err =3D vm_fault_to=
_errno(ret, flags);
1c59827d1da9bc Hugh Dickins       2005-10-19  6069  				remainder =3D 0;
1c59827d1da9bc Hugh Dickins       2005-10-19  6070  				break;
1c59827d1da9bc Hugh Dickins       2005-10-19  6071  			}
87ffc118b54dcd Andrea Arcangeli   2017-02-22  6072  			if (ret & VM_FAULT_R=
ETRY) {
4f6da93411806d Peter Xu           2020-04-01  6073  				if (locked &&
1ac25013fb9e4e Andrea Arcangeli   2019-02-01  6074  				    !(fault_flags &=
 FAULT_FLAG_RETRY_NOWAIT))
4f6da93411806d Peter Xu           2020-04-01  6075  					*locked =3D 0;
87ffc118b54dcd Andrea Arcangeli   2017-02-22  6076  				*nr_pages =3D 0;
87ffc118b54dcd Andrea Arcangeli   2017-02-22  6077  				/*
87ffc118b54dcd Andrea Arcangeli   2017-02-22  6078  				 * VM_FAULT_RETRY m=
ust not return an
87ffc118b54dcd Andrea Arcangeli   2017-02-22  6079  				 * error, it will r=
eturn zero
87ffc118b54dcd Andrea Arcangeli   2017-02-22  6080  				 * instead.
87ffc118b54dcd Andrea Arcangeli   2017-02-22  6081  				 *
87ffc118b54dcd Andrea Arcangeli   2017-02-22  6082  				 * No need to updat=
e "position" as the
87ffc118b54dcd Andrea Arcangeli   2017-02-22  6083  				 * caller will not =
check it after
87ffc118b54dcd Andrea Arcangeli   2017-02-22  6084  				 * *nr_pages is set=
 to 0.
87ffc118b54dcd Andrea Arcangeli   2017-02-22  6085  				 */
87ffc118b54dcd Andrea Arcangeli   2017-02-22  6086  				return i;
87ffc118b54dcd Andrea Arcangeli   2017-02-22  6087  			}
87ffc118b54dcd Andrea Arcangeli   2017-02-22  6088  			continue;
87ffc118b54dcd Andrea Arcangeli   2017-02-22  6089  		}
63551ae0feaaa2 David Gibson       2005-06-21  6090  =

a5516438959d90 Andi Kleen         2008-07-23  6091  		pfn_offset =3D (vaddr=
 & ~huge_page_mask(h)) >> PAGE_SHIFT;
7f2e9525ba55b1 Gerald Schaefer    2008-04-28  6092  		page =3D pte_page(hug=
e_ptep_get(pte));
8fde12ca79aff9 Linus Torvalds     2019-04-11  6093  =

acbfb087e3b199 Zhigang Lu         2019-11-30  6094  		/*
acbfb087e3b199 Zhigang Lu         2019-11-30  6095  		 * If subpage informa=
tion not requested, update counters
acbfb087e3b199 Zhigang Lu         2019-11-30  6096  		 * and skip the same_=
page loop below.
acbfb087e3b199 Zhigang Lu         2019-11-30  6097  		 */
acbfb087e3b199 Zhigang Lu         2019-11-30  6098  		if (!pages && !vmas &=
& !pfn_offset &&
acbfb087e3b199 Zhigang Lu         2019-11-30  6099  		    (vaddr + huge_pag=
e_size(h) < vma->vm_end) &&
acbfb087e3b199 Zhigang Lu         2019-11-30  6100  		    (remainder >=3D p=
ages_per_huge_page(h))) {
acbfb087e3b199 Zhigang Lu         2019-11-30  6101  			vaddr +=3D huge_page=
_size(h);
acbfb087e3b199 Zhigang Lu         2019-11-30  6102  			remainder -=3D pages=
_per_huge_page(h);
acbfb087e3b199 Zhigang Lu         2019-11-30  6103  			i +=3D pages_per_hug=
e_page(h);
acbfb087e3b199 Zhigang Lu         2019-11-30  6104  			spin_unlock(ptl);
acbfb087e3b199 Zhigang Lu         2019-11-30  6105  			continue;
acbfb087e3b199 Zhigang Lu         2019-11-30  6106  		}
acbfb087e3b199 Zhigang Lu         2019-11-30  6107  =

d08af0a59684e1 Joao Martins       2021-07-14  6108  		/* vaddr may not be a=
ligned to PAGE_SIZE */
d08af0a59684e1 Joao Martins       2021-07-14  6109  		refs =3D min3(pages_p=
er_huge_page(h) - pfn_offset, remainder,
d08af0a59684e1 Joao Martins       2021-07-14  6110  		    (vma->vm_end - AL=
IGN_DOWN(vaddr, PAGE_SIZE)) >> PAGE_SHIFT);
0fa5bc4023c188 Joao Martins       2021-02-24  6111  =

82e5d378b0e473 Joao Martins       2021-02-24  6112  		if (pages || vmas)
82e5d378b0e473 Joao Martins       2021-02-24  6113  			record_subpages_vmas=
(mem_map_offset(page, pfn_offset),
82e5d378b0e473 Joao Martins       2021-02-24  6114  					     vma, refs,
82e5d378b0e473 Joao Martins       2021-02-24  6115  					     likely(pages)=
 ? pages + i : NULL,
82e5d378b0e473 Joao Martins       2021-02-24  6116  					     vmas ? vmas +=
 i : NULL);
63551ae0feaaa2 David Gibson       2005-06-21  6117  =

82e5d378b0e473 Joao Martins       2021-02-24  6118  		if (pages) {
0fa5bc4023c188 Joao Martins       2021-02-24  6119  			/*
0fa5bc4023c188 Joao Martins       2021-02-24  6120  			 * try_grab_compound=
_head() should always succeed here,
0fa5bc4023c188 Joao Martins       2021-02-24  6121  			 * because: a) we ho=
ld the ptl lock, and b) we've just
0fa5bc4023c188 Joao Martins       2021-02-24  6122  			 * checked that the =
huge page is present in the page
0fa5bc4023c188 Joao Martins       2021-02-24  6123  			 * tables. If the hu=
ge page is present, then the tail
0fa5bc4023c188 Joao Martins       2021-02-24  6124  			 * pages must also b=
e present. The ptl prevents the
0fa5bc4023c188 Joao Martins       2021-02-24  6125  			 * head page and tai=
l pages from being rearranged in
0fa5bc4023c188 Joao Martins       2021-02-24  6126  			 * any way. So this =
page must be available at this
0fa5bc4023c188 Joao Martins       2021-02-24  6127  			 * point, unless the=
 page refcount overflowed:
0fa5bc4023c188 Joao Martins       2021-02-24  6128  			 */
82e5d378b0e473 Joao Martins       2021-02-24  6129  			if (WARN_ON_ONCE(!tr=
y_grab_compound_head(pages[i],
0fa5bc4023c188 Joao Martins       2021-02-24  6130  								 refs,
0fa5bc4023c188 Joao Martins       2021-02-24  6131  								 flags))) {
0fa5bc4023c188 Joao Martins       2021-02-24  6132  				spin_unlock(ptl);
0fa5bc4023c188 Joao Martins       2021-02-24  6133  				remainder =3D 0;
0fa5bc4023c188 Joao Martins       2021-02-24  6134  				err =3D -ENOMEM;
0fa5bc4023c188 Joao Martins       2021-02-24  6135  				break;
0fa5bc4023c188 Joao Martins       2021-02-24  6136  			}
d5d4b0aa4e1430 Kenneth W Chen     2006-03-22  6137  		}
82e5d378b0e473 Joao Martins       2021-02-24  6138  =

82e5d378b0e473 Joao Martins       2021-02-24  6139  		vaddr +=3D (refs << P=
AGE_SHIFT);
82e5d378b0e473 Joao Martins       2021-02-24  6140  		remainder -=3D refs;
82e5d378b0e473 Joao Martins       2021-02-24  6141  		i +=3D refs;
82e5d378b0e473 Joao Martins       2021-02-24  6142  =

cb900f41215447 Kirill A. Shutemov 2013-11-14  6143  		spin_unlock(ptl);
63551ae0feaaa2 David Gibson       2005-06-21  6144  	}
28a35716d31798 Michel Lespinasse  2013-02-22  6145  	*nr_pages =3D remainde=
r;
87ffc118b54dcd Andrea Arcangeli   2017-02-22  6146  	/*
87ffc118b54dcd Andrea Arcangeli   2017-02-22  6147  	 * setting position is=
 actually required only if remainder is
87ffc118b54dcd Andrea Arcangeli   2017-02-22  6148  	 * not zero but it's f=
aster not to add a "if (remainder)"
87ffc118b54dcd Andrea Arcangeli   2017-02-22  6149  	 * branch.
87ffc118b54dcd Andrea Arcangeli   2017-02-22  6150  	 */
63551ae0feaaa2 David Gibson       2005-06-21  6151  	*position =3D vaddr;
63551ae0feaaa2 David Gibson       2005-06-21  6152  =

2be7cfed995e25 Daniel Jordan      2017-08-02  6153  	return i ? i : err;
63551ae0feaaa2 David Gibson       2005-06-21  6154  }
8f860591ffb297 Zhang, Yanmin      2006-03-22  6155  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============1696008397312592849==--

