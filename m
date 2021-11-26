Content-Type: multipart/mixed; boundary="===============4253435487954609513=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [android-common:android12-5.10 8048/13788] mm/memory.c:4691 handle_pte_fault() warn: inconsistent returns 'vmf->ptl'.
Date: Fri, 26 Nov 2021 22:17:07 +0800
Message-ID: <202111262210.LRAXzn5C-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4253435487954609513==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: cros-kernel-buildreports(a)googlegroups.com

tree:   https://android.googlesource.com/kernel/common android12-5.10
head:   575a552ac7c6be1013294c5781f22a250b10f494
commit: 35eacb5c87b9b5e9683e25a24282cde1a2d4a1d5 [8048/13788] ANDROID: mm: =
allow vmas with vm_ops to be speculatively handled
:::::: branch date: 23 hours ago
:::::: commit date: 7 months ago
config: i386-randconfig-m021-20211118 (https://download.01.org/0day-ci/arch=
ive/20211126/202111262210.LRAXzn5C-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
mm/memory.c:4691 handle_pte_fault() warn: inconsistent returns 'vmf->ptl'.

vim +4691 mm/memory.c

a00cc7d9dd93d6 Matthew Wilcox        2017-02-24  4562  =

^1da177e4c3f41 Linus Torvalds        2005-04-16  4563  /*
^1da177e4c3f41 Linus Torvalds        2005-04-16  4564   * These routines al=
so need to handle stuff like marking pages dirty
^1da177e4c3f41 Linus Torvalds        2005-04-16  4565   * and/or accessed f=
or architectures that don't do it in hardware (most
^1da177e4c3f41 Linus Torvalds        2005-04-16  4566   * RISC architecture=
s).  The early dirtying is also good on the i386.
^1da177e4c3f41 Linus Torvalds        2005-04-16  4567   *
^1da177e4c3f41 Linus Torvalds        2005-04-16  4568   * There is also a h=
ook called "update_mmu_cache()" that architectures
^1da177e4c3f41 Linus Torvalds        2005-04-16  4569   * with external mmu=
 caches can use to update those (ie the Sparc or
^1da177e4c3f41 Linus Torvalds        2005-04-16  4570   * PowerPC hashed pa=
ge tables that act as extended TLBs).
^1da177e4c3f41 Linus Torvalds        2005-04-16  4571   *
c1e8d7c6a7a682 Michel Lespinasse     2020-06-08  4572   * We enter with non=
-exclusive mmap_lock (to exclude vma changes, but allow
7267ec008b5cd8 Kirill A. Shutemov    2016-07-26  4573   * concurrent faults=
).
9a95f3cf7b33d6 Paul Cassella         2014-08-06  4574   *
c1e8d7c6a7a682 Michel Lespinasse     2020-06-08  4575   * The mmap_lock may=
 have been released depending on flags and our return value.
7267ec008b5cd8 Kirill A. Shutemov    2016-07-26  4576   * See filemap_fault=
() and __lock_page_or_retry().
^1da177e4c3f41 Linus Torvalds        2005-04-16  4577   */
2b7403035459c7 Souptick Joarder      2018-08-23  4578  static vm_fault_t ha=
ndle_pte_fault(struct vm_fault *vmf)
^1da177e4c3f41 Linus Torvalds        2005-04-16  4579  {
^1da177e4c3f41 Linus Torvalds        2005-04-16  4580  	pte_t entry;
35eacb5c87b9b5 Vinayak Menon         2021-03-18  4581  	vm_fault_t ret =3D =
0;
^1da177e4c3f41 Linus Torvalds        2005-04-16  4582  =

82b0f8c39a3869 Jan Kara              2016-12-14  4583  	if (unlikely(pmd_no=
ne(*vmf->pmd))) {
1c5371744061fc Peter Zijlstra        2018-04-17  4584  		/*
1c5371744061fc Peter Zijlstra        2018-04-17  4585  		 * In the case of =
the speculative page fault handler we abort
1c5371744061fc Peter Zijlstra        2018-04-17  4586  		 * the speculative=
 path immediately as the pmd is probably
1c5371744061fc Peter Zijlstra        2018-04-17  4587  		 * in the way to b=
e converted in a huge one. We will try
1c5371744061fc Peter Zijlstra        2018-04-17  4588  		 * again holding t=
he mmap_sem (which implies that the collapse
1c5371744061fc Peter Zijlstra        2018-04-17  4589  		 * operation is do=
ne).
1c5371744061fc Peter Zijlstra        2018-04-17  4590  		 */
1c5371744061fc Peter Zijlstra        2018-04-17  4591  		if (vmf->flags & F=
AULT_FLAG_SPECULATIVE)
1c5371744061fc Peter Zijlstra        2018-04-17  4592  			return VM_FAULT_R=
ETRY;
e37c6982706333 Christian Borntraeger 2014-12-07  4593  		/*
7267ec008b5cd8 Kirill A. Shutemov    2016-07-26  4594  		 * Leave __pte_all=
oc() until later: because vm_ops->fault may
7267ec008b5cd8 Kirill A. Shutemov    2016-07-26  4595  		 * want to allocat=
e huge page, and if we expose page table
7267ec008b5cd8 Kirill A. Shutemov    2016-07-26  4596  		 * for an instant,=
 it will be difficult to retract from
7267ec008b5cd8 Kirill A. Shutemov    2016-07-26  4597  		 * concurrent faul=
ts and from rmap lookups.
e37c6982706333 Christian Borntraeger 2014-12-07  4598  		 */
82b0f8c39a3869 Jan Kara              2016-12-14  4599  		vmf->pte =3D NULL;
1c5371744061fc Peter Zijlstra        2018-04-17  4600  	} else if (!(vmf->f=
lags & FAULT_FLAG_SPECULATIVE)) {
0aa300a25229b9 Kirill A. Shutemov    2020-12-19  4601  		/*
0aa300a25229b9 Kirill A. Shutemov    2020-12-19  4602  		 * If a huge pmd m=
aterialized under us just retry later.  Use
0aa300a25229b9 Kirill A. Shutemov    2020-12-19  4603  		 * pmd_trans_unsta=
ble() via pmd_devmap_trans_unstable() instead
0aa300a25229b9 Kirill A. Shutemov    2020-12-19  4604  		 * of pmd_trans_hu=
ge() to ensure the pmd didn't become
0aa300a25229b9 Kirill A. Shutemov    2020-12-19  4605  		 * pmd_trans_huge =
under us and then back to pmd_none, as a
0aa300a25229b9 Kirill A. Shutemov    2020-12-19  4606  		 * result of MADV_=
DONTNEED running immediately after a huge pmd
0aa300a25229b9 Kirill A. Shutemov    2020-12-19  4607  		 * fault in a diff=
erent thread of this mm, in turn leading to a
0aa300a25229b9 Kirill A. Shutemov    2020-12-19  4608  		 * misleading pmd_=
trans_huge() retval. All we have to ensure is
0aa300a25229b9 Kirill A. Shutemov    2020-12-19  4609  		 * that it is a re=
gular pmd that we can walk with
0aa300a25229b9 Kirill A. Shutemov    2020-12-19  4610  		 * pte_offset_map(=
) and we can do that through an atomic read
0aa300a25229b9 Kirill A. Shutemov    2020-12-19  4611  		 * in C, which is =
what pmd_trans_unstable() provides.
0aa300a25229b9 Kirill A. Shutemov    2020-12-19  4612  		 */
d0f0931de936a0 Ross Zwisler          2017-06-02  4613  		if (pmd_devmap_tra=
ns_unstable(vmf->pmd))
7267ec008b5cd8 Kirill A. Shutemov    2016-07-26  4614  			return 0;
7267ec008b5cd8 Kirill A. Shutemov    2016-07-26  4615  		/*
7267ec008b5cd8 Kirill A. Shutemov    2016-07-26  4616  		 * A regular pmd i=
s established and it can't morph into a huge
7267ec008b5cd8 Kirill A. Shutemov    2016-07-26  4617  		 * pmd from under =
us anymore at this point because we hold the
c1e8d7c6a7a682 Michel Lespinasse     2020-06-08  4618  		 * mmap_lock read =
mode and khugepaged takes it in write mode.
7267ec008b5cd8 Kirill A. Shutemov    2016-07-26  4619  		 * So now it's saf=
e to run pte_offset_map().
1c5371744061fc Peter Zijlstra        2018-04-17  4620  		 * This is not app=
licable to the speculative page fault handler
1c5371744061fc Peter Zijlstra        2018-04-17  4621  		 * but in that cas=
e, the pte is fetched earlier in
1c5371744061fc Peter Zijlstra        2018-04-17  4622  		 * handle_speculat=
ive_fault().
7267ec008b5cd8 Kirill A. Shutemov    2016-07-26  4623  		 */
82b0f8c39a3869 Jan Kara              2016-12-14  4624  		vmf->pte =3D pte_o=
ffset_map(vmf->pmd, vmf->address);
2994302bc8a171 Jan Kara              2016-12-14  4625  		vmf->orig_pte =3D =
*vmf->pte;
7267ec008b5cd8 Kirill A. Shutemov    2016-07-26  4626  =

7267ec008b5cd8 Kirill A. Shutemov    2016-07-26  4627  		/*
7267ec008b5cd8 Kirill A. Shutemov    2016-07-26  4628  		 * some architectu=
res can have larger ptes than wordsize,
7267ec008b5cd8 Kirill A. Shutemov    2016-07-26  4629  		 * e.g.ppc44x-defc=
onfig has CONFIG_PTE_64BIT=3Dy and
b03a0fe0c5e4b4 Paul E. McKenney      2017-10-23  4630  		 * CONFIG_32BIT=3D=
y, so READ_ONCE cannot guarantee atomic
b03a0fe0c5e4b4 Paul E. McKenney      2017-10-23  4631  		 * accesses.  The =
code below just needs a consistent view
b03a0fe0c5e4b4 Paul E. McKenney      2017-10-23  4632  		 * for the ifs and=
 we later double check anyway with the
7267ec008b5cd8 Kirill A. Shutemov    2016-07-26  4633  		 * ptl lock held. =
So here a barrier will do.
7267ec008b5cd8 Kirill A. Shutemov    2016-07-26  4634  		 */
e37c6982706333 Christian Borntraeger 2014-12-07  4635  		barrier();
2994302bc8a171 Jan Kara              2016-12-14  4636  		if (pte_none(vmf->=
orig_pte)) {
82b0f8c39a3869 Jan Kara              2016-12-14  4637  			pte_unmap(vmf->pt=
e);
82b0f8c39a3869 Jan Kara              2016-12-14  4638  			vmf->pte =3D NULL;
7267ec008b5cd8 Kirill A. Shutemov    2016-07-26  4639  		}
7267ec008b5cd8 Kirill A. Shutemov    2016-07-26  4640  	}
7267ec008b5cd8 Kirill A. Shutemov    2016-07-26  4641  =

82b0f8c39a3869 Jan Kara              2016-12-14  4642  	if (!vmf->pte) {
82b0f8c39a3869 Jan Kara              2016-12-14  4643  		if (vma_is_anonymo=
us(vmf->vma))
82b0f8c39a3869 Jan Kara              2016-12-14  4644  			return do_anonymo=
us_page(vmf);
35eacb5c87b9b5 Vinayak Menon         2021-03-18  4645  		else if ((vmf->fla=
gs & FAULT_FLAG_SPECULATIVE) &&
35eacb5c87b9b5 Vinayak Menon         2021-03-18  4646  				!vmf_allows_spec=
ulation(vmf))
1c5371744061fc Peter Zijlstra        2018-04-17  4647  			return VM_FAULT_R=
ETRY;
b5330628546616 Oleg Nesterov         2015-09-08  4648  		else
82b0f8c39a3869 Jan Kara              2016-12-14  4649  			return do_fault(v=
mf);
65500d234e74fc Hugh Dickins          2005-10-29  4650  	}
7267ec008b5cd8 Kirill A. Shutemov    2016-07-26  4651  =

2994302bc8a171 Jan Kara              2016-12-14  4652  	if (!pte_present(vm=
f->orig_pte))
2994302bc8a171 Jan Kara              2016-12-14  4653  		return do_swap_pag=
e(vmf);
^1da177e4c3f41 Linus Torvalds        2005-04-16  4654  =

2994302bc8a171 Jan Kara              2016-12-14  4655  	if (pte_protnone(vm=
f->orig_pte) && vma_is_accessible(vmf->vma))
2994302bc8a171 Jan Kara              2016-12-14  4656  		return do_numa_pag=
e(vmf);
d10e63f29488b0 Mel Gorman            2012-10-25  4657  =

b23ffc113b308e Laurent Dufour        2018-04-17  4658  	if (!pte_spinlock(v=
mf))
b23ffc113b308e Laurent Dufour        2018-04-17  4659  		return VM_FAULT_RE=
TRY;
2994302bc8a171 Jan Kara              2016-12-14  4660  	entry =3D vmf->orig=
_pte;
7df676974359f9 Bibo Mao              2020-05-27  4661  	if (unlikely(!pte_s=
ame(*vmf->pte, entry))) {
7df676974359f9 Bibo Mao              2020-05-27  4662  		update_mmu_tlb(vmf=
->vma, vmf->address, vmf->pte);
8f4e2101fd7df9 Hugh Dickins          2005-10-29  4663  		goto unlock;
7df676974359f9 Bibo Mao              2020-05-27  4664  	}
82b0f8c39a3869 Jan Kara              2016-12-14  4665  	if (vmf->flags & FA=
ULT_FLAG_WRITE) {
f6f3732162b5ae Linus Torvalds        2017-12-15  4666  		if (!pte_write(ent=
ry))
2994302bc8a171 Jan Kara              2016-12-14  4667  			return do_wp_page=
(vmf);
^1da177e4c3f41 Linus Torvalds        2005-04-16  4668  		entry =3D pte_mkdi=
rty(entry);
^1da177e4c3f41 Linus Torvalds        2005-04-16  4669  	}
^1da177e4c3f41 Linus Torvalds        2005-04-16  4670  	entry =3D pte_mkyou=
ng(entry);
82b0f8c39a3869 Jan Kara              2016-12-14  4671  	if (ptep_set_access=
_flags(vmf->vma, vmf->address, vmf->pte, entry,
82b0f8c39a3869 Jan Kara              2016-12-14  4672  				vmf->flags & FAU=
LT_FLAG_WRITE)) {
82b0f8c39a3869 Jan Kara              2016-12-14  4673  		update_mmu_cache(v=
mf->vma, vmf->address, vmf->pte);
1a44e149084d77 Andrea Arcangeli      2005-10-29  4674  	} else {
b7333b58f358f3 Yang Shi              2020-08-14  4675  		/* Skip spurious T=
LB flush for retried page fault */
b7333b58f358f3 Yang Shi              2020-08-14  4676  		if (vmf->flags & F=
AULT_FLAG_TRIED)
b7333b58f358f3 Yang Shi              2020-08-14  4677  			goto unlock;
35eacb5c87b9b5 Vinayak Menon         2021-03-18  4678  		if (vmf->flags & F=
AULT_FLAG_SPECULATIVE)
35eacb5c87b9b5 Vinayak Menon         2021-03-18  4679  			ret =3D VM_FAULT_=
RETRY;
1a44e149084d77 Andrea Arcangeli      2005-10-29  4680  		/*
1a44e149084d77 Andrea Arcangeli      2005-10-29  4681  		 * This is needed =
only for protection faults but the arch code
1a44e149084d77 Andrea Arcangeli      2005-10-29  4682  		 * is not yet tell=
ing us if this is a protection fault or not.
1a44e149084d77 Andrea Arcangeli      2005-10-29  4683  		 * This still avoi=
ds useless tlb flushes for .text page faults
1a44e149084d77 Andrea Arcangeli      2005-10-29  4684  		 * with threads.
1a44e149084d77 Andrea Arcangeli      2005-10-29  4685  		 */
82b0f8c39a3869 Jan Kara              2016-12-14  4686  		if (vmf->flags & F=
AULT_FLAG_WRITE)
82b0f8c39a3869 Jan Kara              2016-12-14  4687  			flush_tlb_fix_spu=
rious_fault(vmf->vma, vmf->address);
1a44e149084d77 Andrea Arcangeli      2005-10-29  4688  	}
8f4e2101fd7df9 Hugh Dickins          2005-10-29  4689  unlock:
82b0f8c39a3869 Jan Kara              2016-12-14  4690  	pte_unmap_unlock(vm=
f->pte, vmf->ptl);
35eacb5c87b9b5 Vinayak Menon         2021-03-18 @4691  	return ret;
^1da177e4c3f41 Linus Torvalds        2005-04-16  4692  }
^1da177e4c3f41 Linus Torvalds        2005-04-16  4693  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4253435487954609513==--

