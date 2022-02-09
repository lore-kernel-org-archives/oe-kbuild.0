Content-Type: multipart/mixed; boundary="===============8003983689490900066=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ammarfaizi2-block:google/android/kernel/common/android12-5.10 2324/9999] mm/memory.c:4691 handle_pte_fault() warn: inconsistent returns 'vmf->ptl'.
Date: Wed, 09 Feb 2022 19:44:24 +0800
Message-ID: <202202091958.0BHF6SGy-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8003983689490900066==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: "GNU/Weeb Mailing List" <gwml@vger.gnuweeb.org>
CC: linux-kernel(a)vger.kernel.org
TO: Vinayak Menon <vinmenon@codeaurora.org>
CC: Todd Kjos <tkjos@google.com>

tree:   https://github.com/ammarfaizi2/linux-block google/android/kernel/co=
mmon/android12-5.10
head:   2a2327c4e8ac335069586354b280031105b9980e
commit: 35eacb5c87b9b5e9683e25a24282cde1a2d4a1d5 [2324/9999] ANDROID: mm: a=
llow vmas with vm_ops to be speculatively handled
:::::: branch date: 9 hours ago
:::::: commit date: 10 months ago
config: i386-randconfig-m021-20211118 (https://download.01.org/0day-ci/arch=
ive/20220209/202202091958.0BHF6SGy-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
mm/memory.c:4691 handle_pte_fault() warn: inconsistent returns 'vmf->ptl'.

vim +4691 mm/memory.c

a00cc7d9dd93d66 Matthew Wilcox        2017-02-24  4562  =

^1da177e4c3f415 Linus Torvalds        2005-04-16  4563  /*
^1da177e4c3f415 Linus Torvalds        2005-04-16  4564   * These routines a=
lso need to handle stuff like marking pages dirty
^1da177e4c3f415 Linus Torvalds        2005-04-16  4565   * and/or accessed =
for architectures that don't do it in hardware (most
^1da177e4c3f415 Linus Torvalds        2005-04-16  4566   * RISC architectur=
es).  The early dirtying is also good on the i386.
^1da177e4c3f415 Linus Torvalds        2005-04-16  4567   *
^1da177e4c3f415 Linus Torvalds        2005-04-16  4568   * There is also a =
hook called "update_mmu_cache()" that architectures
^1da177e4c3f415 Linus Torvalds        2005-04-16  4569   * with external mm=
u caches can use to update those (ie the Sparc or
^1da177e4c3f415 Linus Torvalds        2005-04-16  4570   * PowerPC hashed p=
age tables that act as extended TLBs).
^1da177e4c3f415 Linus Torvalds        2005-04-16  4571   *
c1e8d7c6a7a682e Michel Lespinasse     2020-06-08  4572   * We enter with no=
n-exclusive mmap_lock (to exclude vma changes, but allow
7267ec008b5cd8b Kirill A. Shutemov    2016-07-26  4573   * concurrent fault=
s).
9a95f3cf7b33d66 Paul Cassella         2014-08-06  4574   *
c1e8d7c6a7a682e Michel Lespinasse     2020-06-08  4575   * The mmap_lock ma=
y have been released depending on flags and our return value.
7267ec008b5cd8b Kirill A. Shutemov    2016-07-26  4576   * See filemap_faul=
t() and __lock_page_or_retry().
^1da177e4c3f415 Linus Torvalds        2005-04-16  4577   */
2b7403035459c75 Souptick Joarder      2018-08-23  4578  static vm_fault_t h=
andle_pte_fault(struct vm_fault *vmf)
^1da177e4c3f415 Linus Torvalds        2005-04-16  4579  {
^1da177e4c3f415 Linus Torvalds        2005-04-16  4580  	pte_t entry;
35eacb5c87b9b5e Vinayak Menon         2021-03-18  4581  	vm_fault_t ret =3D=
 0;
^1da177e4c3f415 Linus Torvalds        2005-04-16  4582  =

82b0f8c39a3869b Jan Kara              2016-12-14  4583  	if (unlikely(pmd_n=
one(*vmf->pmd))) {
1c5371744061fcc Peter Zijlstra        2018-04-17  4584  		/*
1c5371744061fcc Peter Zijlstra        2018-04-17  4585  		 * In the case of=
 the speculative page fault handler we abort
1c5371744061fcc Peter Zijlstra        2018-04-17  4586  		 * the speculativ=
e path immediately as the pmd is probably
1c5371744061fcc Peter Zijlstra        2018-04-17  4587  		 * in the way to =
be converted in a huge one. We will try
1c5371744061fcc Peter Zijlstra        2018-04-17  4588  		 * again holding =
the mmap_sem (which implies that the collapse
1c5371744061fcc Peter Zijlstra        2018-04-17  4589  		 * operation is d=
one).
1c5371744061fcc Peter Zijlstra        2018-04-17  4590  		 */
1c5371744061fcc Peter Zijlstra        2018-04-17  4591  		if (vmf->flags & =
FAULT_FLAG_SPECULATIVE)
1c5371744061fcc Peter Zijlstra        2018-04-17  4592  			return VM_FAULT_=
RETRY;
e37c69827063332 Christian Borntraeger 2014-12-07  4593  		/*
7267ec008b5cd8b Kirill A. Shutemov    2016-07-26  4594  		 * Leave __pte_al=
loc() until later: because vm_ops->fault may
7267ec008b5cd8b Kirill A. Shutemov    2016-07-26  4595  		 * want to alloca=
te huge page, and if we expose page table
7267ec008b5cd8b Kirill A. Shutemov    2016-07-26  4596  		 * for an instant=
, it will be difficult to retract from
7267ec008b5cd8b Kirill A. Shutemov    2016-07-26  4597  		 * concurrent fau=
lts and from rmap lookups.
e37c69827063332 Christian Borntraeger 2014-12-07  4598  		 */
82b0f8c39a3869b Jan Kara              2016-12-14  4599  		vmf->pte =3D NULL;
1c5371744061fcc Peter Zijlstra        2018-04-17  4600  	} else if (!(vmf->=
flags & FAULT_FLAG_SPECULATIVE)) {
0aa300a25229b9b Kirill A. Shutemov    2020-12-19  4601  		/*
0aa300a25229b9b Kirill A. Shutemov    2020-12-19  4602  		 * If a huge pmd =
materialized under us just retry later.  Use
0aa300a25229b9b Kirill A. Shutemov    2020-12-19  4603  		 * pmd_trans_unst=
able() via pmd_devmap_trans_unstable() instead
0aa300a25229b9b Kirill A. Shutemov    2020-12-19  4604  		 * of pmd_trans_h=
uge() to ensure the pmd didn't become
0aa300a25229b9b Kirill A. Shutemov    2020-12-19  4605  		 * pmd_trans_huge=
 under us and then back to pmd_none, as a
0aa300a25229b9b Kirill A. Shutemov    2020-12-19  4606  		 * result of MADV=
_DONTNEED running immediately after a huge pmd
0aa300a25229b9b Kirill A. Shutemov    2020-12-19  4607  		 * fault in a dif=
ferent thread of this mm, in turn leading to a
0aa300a25229b9b Kirill A. Shutemov    2020-12-19  4608  		 * misleading pmd=
_trans_huge() retval. All we have to ensure is
0aa300a25229b9b Kirill A. Shutemov    2020-12-19  4609  		 * that it is a r=
egular pmd that we can walk with
0aa300a25229b9b Kirill A. Shutemov    2020-12-19  4610  		 * pte_offset_map=
() and we can do that through an atomic read
0aa300a25229b9b Kirill A. Shutemov    2020-12-19  4611  		 * in C, which is=
 what pmd_trans_unstable() provides.
0aa300a25229b9b Kirill A. Shutemov    2020-12-19  4612  		 */
d0f0931de936a0a Ross Zwisler          2017-06-02  4613  		if (pmd_devmap_tr=
ans_unstable(vmf->pmd))
7267ec008b5cd8b Kirill A. Shutemov    2016-07-26  4614  			return 0;
7267ec008b5cd8b Kirill A. Shutemov    2016-07-26  4615  		/*
7267ec008b5cd8b Kirill A. Shutemov    2016-07-26  4616  		 * A regular pmd =
is established and it can't morph into a huge
7267ec008b5cd8b Kirill A. Shutemov    2016-07-26  4617  		 * pmd from under=
 us anymore at this point because we hold the
c1e8d7c6a7a682e Michel Lespinasse     2020-06-08  4618  		 * mmap_lock read=
 mode and khugepaged takes it in write mode.
7267ec008b5cd8b Kirill A. Shutemov    2016-07-26  4619  		 * So now it's sa=
fe to run pte_offset_map().
1c5371744061fcc Peter Zijlstra        2018-04-17  4620  		 * This is not ap=
plicable to the speculative page fault handler
1c5371744061fcc Peter Zijlstra        2018-04-17  4621  		 * but in that ca=
se, the pte is fetched earlier in
1c5371744061fcc Peter Zijlstra        2018-04-17  4622  		 * handle_specula=
tive_fault().
7267ec008b5cd8b Kirill A. Shutemov    2016-07-26  4623  		 */
82b0f8c39a3869b Jan Kara              2016-12-14  4624  		vmf->pte =3D pte_=
offset_map(vmf->pmd, vmf->address);
2994302bc8a1718 Jan Kara              2016-12-14  4625  		vmf->orig_pte =3D=
 *vmf->pte;
7267ec008b5cd8b Kirill A. Shutemov    2016-07-26  4626  =

7267ec008b5cd8b Kirill A. Shutemov    2016-07-26  4627  		/*
7267ec008b5cd8b Kirill A. Shutemov    2016-07-26  4628  		 * some architect=
ures can have larger ptes than wordsize,
7267ec008b5cd8b Kirill A. Shutemov    2016-07-26  4629  		 * e.g.ppc44x-def=
config has CONFIG_PTE_64BIT=3Dy and
b03a0fe0c5e4b46 Paul E. McKenney      2017-10-23  4630  		 * CONFIG_32BIT=
=3Dy, so READ_ONCE cannot guarantee atomic
b03a0fe0c5e4b46 Paul E. McKenney      2017-10-23  4631  		 * accesses.  The=
 code below just needs a consistent view
b03a0fe0c5e4b46 Paul E. McKenney      2017-10-23  4632  		 * for the ifs an=
d we later double check anyway with the
7267ec008b5cd8b Kirill A. Shutemov    2016-07-26  4633  		 * ptl lock held.=
 So here a barrier will do.
7267ec008b5cd8b Kirill A. Shutemov    2016-07-26  4634  		 */
e37c69827063332 Christian Borntraeger 2014-12-07  4635  		barrier();
2994302bc8a1718 Jan Kara              2016-12-14  4636  		if (pte_none(vmf-=
>orig_pte)) {
82b0f8c39a3869b Jan Kara              2016-12-14  4637  			pte_unmap(vmf->p=
te);
82b0f8c39a3869b Jan Kara              2016-12-14  4638  			vmf->pte =3D NUL=
L;
7267ec008b5cd8b Kirill A. Shutemov    2016-07-26  4639  		}
7267ec008b5cd8b Kirill A. Shutemov    2016-07-26  4640  	}
7267ec008b5cd8b Kirill A. Shutemov    2016-07-26  4641  =

82b0f8c39a3869b Jan Kara              2016-12-14  4642  	if (!vmf->pte) {
82b0f8c39a3869b Jan Kara              2016-12-14  4643  		if (vma_is_anonym=
ous(vmf->vma))
82b0f8c39a3869b Jan Kara              2016-12-14  4644  			return do_anonym=
ous_page(vmf);
35eacb5c87b9b5e Vinayak Menon         2021-03-18  4645  		else if ((vmf->fl=
ags & FAULT_FLAG_SPECULATIVE) &&
35eacb5c87b9b5e Vinayak Menon         2021-03-18  4646  				!vmf_allows_spe=
culation(vmf))
1c5371744061fcc Peter Zijlstra        2018-04-17  4647  			return VM_FAULT_=
RETRY;
b5330628546616a Oleg Nesterov         2015-09-08  4648  		else
82b0f8c39a3869b Jan Kara              2016-12-14  4649  			return do_fault(=
vmf);
65500d234e74fc4 Hugh Dickins          2005-10-29  4650  	}
7267ec008b5cd8b Kirill A. Shutemov    2016-07-26  4651  =

2994302bc8a1718 Jan Kara              2016-12-14  4652  	if (!pte_present(v=
mf->orig_pte))
2994302bc8a1718 Jan Kara              2016-12-14  4653  		return do_swap_pa=
ge(vmf);
^1da177e4c3f415 Linus Torvalds        2005-04-16  4654  =

2994302bc8a1718 Jan Kara              2016-12-14  4655  	if (pte_protnone(v=
mf->orig_pte) && vma_is_accessible(vmf->vma))
2994302bc8a1718 Jan Kara              2016-12-14  4656  		return do_numa_pa=
ge(vmf);
d10e63f29488b0f Mel Gorman            2012-10-25  4657  =

b23ffc113b308e2 Laurent Dufour        2018-04-17  4658  	if (!pte_spinlock(=
vmf))
b23ffc113b308e2 Laurent Dufour        2018-04-17  4659  		return VM_FAULT_R=
ETRY;
2994302bc8a1718 Jan Kara              2016-12-14  4660  	entry =3D vmf->ori=
g_pte;
7df676974359f92 Bibo Mao              2020-05-27  4661  	if (unlikely(!pte_=
same(*vmf->pte, entry))) {
7df676974359f92 Bibo Mao              2020-05-27  4662  		update_mmu_tlb(vm=
f->vma, vmf->address, vmf->pte);
8f4e2101fd7df90 Hugh Dickins          2005-10-29  4663  		goto unlock;
7df676974359f92 Bibo Mao              2020-05-27  4664  	}
82b0f8c39a3869b Jan Kara              2016-12-14  4665  	if (vmf->flags & F=
AULT_FLAG_WRITE) {
f6f3732162b5ae3 Linus Torvalds        2017-12-15  4666  		if (!pte_write(en=
try))
2994302bc8a1718 Jan Kara              2016-12-14  4667  			return do_wp_pag=
e(vmf);
^1da177e4c3f415 Linus Torvalds        2005-04-16  4668  		entry =3D pte_mkd=
irty(entry);
^1da177e4c3f415 Linus Torvalds        2005-04-16  4669  	}
^1da177e4c3f415 Linus Torvalds        2005-04-16  4670  	entry =3D pte_mkyo=
ung(entry);
82b0f8c39a3869b Jan Kara              2016-12-14  4671  	if (ptep_set_acces=
s_flags(vmf->vma, vmf->address, vmf->pte, entry,
82b0f8c39a3869b Jan Kara              2016-12-14  4672  				vmf->flags & FA=
ULT_FLAG_WRITE)) {
82b0f8c39a3869b Jan Kara              2016-12-14  4673  		update_mmu_cache(=
vmf->vma, vmf->address, vmf->pte);
1a44e149084d772 Andrea Arcangeli      2005-10-29  4674  	} else {
b7333b58f358f38 Yang Shi              2020-08-14  4675  		/* Skip spurious =
TLB flush for retried page fault */
b7333b58f358f38 Yang Shi              2020-08-14  4676  		if (vmf->flags & =
FAULT_FLAG_TRIED)
b7333b58f358f38 Yang Shi              2020-08-14  4677  			goto unlock;
35eacb5c87b9b5e Vinayak Menon         2021-03-18  4678  		if (vmf->flags & =
FAULT_FLAG_SPECULATIVE)
35eacb5c87b9b5e Vinayak Menon         2021-03-18  4679  			ret =3D VM_FAULT=
_RETRY;
1a44e149084d772 Andrea Arcangeli      2005-10-29  4680  		/*
1a44e149084d772 Andrea Arcangeli      2005-10-29  4681  		 * This is needed=
 only for protection faults but the arch code
1a44e149084d772 Andrea Arcangeli      2005-10-29  4682  		 * is not yet tel=
ling us if this is a protection fault or not.
1a44e149084d772 Andrea Arcangeli      2005-10-29  4683  		 * This still avo=
ids useless tlb flushes for .text page faults
1a44e149084d772 Andrea Arcangeli      2005-10-29  4684  		 * with threads.
1a44e149084d772 Andrea Arcangeli      2005-10-29  4685  		 */
82b0f8c39a3869b Jan Kara              2016-12-14  4686  		if (vmf->flags & =
FAULT_FLAG_WRITE)
82b0f8c39a3869b Jan Kara              2016-12-14  4687  			flush_tlb_fix_sp=
urious_fault(vmf->vma, vmf->address);
1a44e149084d772 Andrea Arcangeli      2005-10-29  4688  	}
8f4e2101fd7df90 Hugh Dickins          2005-10-29  4689  unlock:
82b0f8c39a3869b Jan Kara              2016-12-14  4690  	pte_unmap_unlock(v=
mf->pte, vmf->ptl);
35eacb5c87b9b5e Vinayak Menon         2021-03-18 @4691  	return ret;
^1da177e4c3f415 Linus Torvalds        2005-04-16  4692  }
^1da177e4c3f415 Linus Torvalds        2005-04-16  4693  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8003983689490900066==--

