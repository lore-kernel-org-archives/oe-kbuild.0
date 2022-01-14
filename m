Content-Type: multipart/mixed; boundary="===============4761972701916199096=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [vishal-tiering:tiering-0.8 4/44] mm/memory.c:4397 do_numa_page() warn: bitwise AND condition is false here
Date: Fri, 14 Jan 2022 19:15:32 +0800
Message-ID: <202201141903.5izUcXf4-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4761972701916199096==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Huang Ying <ying.huang@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vishal/tiering.git =
tiering-0.8
head:   d58c7b0e1a99a2ec17f2910a310835bafc50b4d1
commit: a5991df63566277963f7ea69181a8341412fcc7b [4/44] memory tiering: hot=
 page selection with hint page fault latency
:::::: branch date: 2 days ago
:::::: commit date: 10 weeks ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/202=
20114/202201141903.5izUcXf4-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
mm/memory.c:4397 do_numa_page() warn: bitwise AND condition is false here

vim +4397 mm/memory.c

9532fec118d485 Mel Gorman         2012-11-15  4338  =

2b7403035459c7 Souptick Joarder   2018-08-23  4339  static vm_fault_t do_nu=
ma_page(struct vm_fault *vmf)
d10e63f29488b0 Mel Gorman         2012-10-25  4340  {
82b0f8c39a3869 Jan Kara           2016-12-14  4341  	struct vm_area_struct =
*vma =3D vmf->vma;
4daae3b4b9e49b Mel Gorman         2012-11-02  4342  	struct page *page =3D =
NULL;
98fa15f34cb379 Anshuman Khandual  2019-03-05  4343  	int page_nid =3D NUMA_=
NO_NODE;
90572890d20252 Peter Zijlstra     2013-10-07  4344  	int last_cpupid;
cbee9f88ec1b8d Peter Zijlstra     2012-10-25  4345  	int target_nid;
04a8645304500b Aneesh Kumar K.V   2019-03-05  4346  	pte_t pte, old_pte;
288bc54949fc26 Aneesh Kumar K.V   2017-02-24  4347  	bool was_writable =3D =
pte_savedwrite(vmf->orig_pte);
6688cc05473b36 Peter Zijlstra     2013-10-07  4348  	int flags =3D 0;
d10e63f29488b0 Mel Gorman         2012-10-25  4349  =

d10e63f29488b0 Mel Gorman         2012-10-25  4350  	/*
d10e63f29488b0 Mel Gorman         2012-10-25  4351  	 * The "pte" at this p=
oint cannot be used safely without
d10e63f29488b0 Mel Gorman         2012-10-25  4352  	 * validation through =
pte_unmap_same(). It's of NUMA type but
d10e63f29488b0 Mel Gorman         2012-10-25  4353  	 * the pfn may be scre=
wed if the read is non atomic.
d10e63f29488b0 Mel Gorman         2012-10-25  4354  	 */
82b0f8c39a3869 Jan Kara           2016-12-14  4355  	vmf->ptl =3D pte_lockp=
tr(vma->vm_mm, vmf->pmd);
82b0f8c39a3869 Jan Kara           2016-12-14  4356  	spin_lock(vmf->ptl);
cee216a696b200 Aneesh Kumar K.V   2017-02-24  4357  	if (unlikely(!pte_same=
(*vmf->pte, vmf->orig_pte))) {
82b0f8c39a3869 Jan Kara           2016-12-14  4358  		pte_unmap_unlock(vmf-=
>pte, vmf->ptl);
4daae3b4b9e49b Mel Gorman         2012-11-02  4359  		goto out;
4daae3b4b9e49b Mel Gorman         2012-11-02  4360  	}
4daae3b4b9e49b Mel Gorman         2012-11-02  4361  =

b99a342d4f11a5 Huang Ying         2021-04-29  4362  	/* Get the normal PTE =
 */
b99a342d4f11a5 Huang Ying         2021-04-29  4363  	old_pte =3D ptep_get(v=
mf->pte);
04a8645304500b Aneesh Kumar K.V   2019-03-05  4364  	pte =3D pte_modify(old=
_pte, vma->vm_page_prot);
d10e63f29488b0 Mel Gorman         2012-10-25  4365  =

82b0f8c39a3869 Jan Kara           2016-12-14  4366  	page =3D vm_normal_pag=
e(vma, vmf->address, pte);
b99a342d4f11a5 Huang Ying         2021-04-29  4367  	if (!page)
b99a342d4f11a5 Huang Ying         2021-04-29  4368  		goto out_map;
d10e63f29488b0 Mel Gorman         2012-10-25  4369  =

e81c48024f43b4 Kirill A. Shutemov 2016-01-15  4370  	/* TODO: handle PTE-ma=
pped THP */
b99a342d4f11a5 Huang Ying         2021-04-29  4371  	if (PageCompound(page))
b99a342d4f11a5 Huang Ying         2021-04-29  4372  		goto out_map;
e81c48024f43b4 Kirill A. Shutemov 2016-01-15  4373  =

6688cc05473b36 Peter Zijlstra     2013-10-07  4374  	/*
bea66fbd11af1c Mel Gorman         2015-03-25  4375  	 * Avoid grouping on R=
O pages in general. RO pages shouldn't hurt as
bea66fbd11af1c Mel Gorman         2015-03-25  4376  	 * much anyway since t=
hey can be in shared cache state. This misses
bea66fbd11af1c Mel Gorman         2015-03-25  4377  	 * the case where a ma=
pping is writable but the process never writes
bea66fbd11af1c Mel Gorman         2015-03-25  4378  	 * to it but pte_write=
 gets cleared during protection updates and
bea66fbd11af1c Mel Gorman         2015-03-25  4379  	 * pte_dirty has unpre=
dictable behaviour between PTE scan updates,
bea66fbd11af1c Mel Gorman         2015-03-25  4380  	 * background writebac=
k, dirty balancing and application behaviour.
bea66fbd11af1c Mel Gorman         2015-03-25  4381  	 */
b99a342d4f11a5 Huang Ying         2021-04-29  4382  	if (!was_writable)
6688cc05473b36 Peter Zijlstra     2013-10-07  4383  		flags |=3D TNF_NO_GRO=
UP;
6688cc05473b36 Peter Zijlstra     2013-10-07  4384  =

dabe1d992414a6 Rik van Riel       2013-10-07  4385  	/*
dabe1d992414a6 Rik van Riel       2013-10-07  4386  	 * Flag if the page is=
 shared between multiple address spaces. This
dabe1d992414a6 Rik van Riel       2013-10-07  4387  	 * is later used when =
determining whether to group tasks together
dabe1d992414a6 Rik van Riel       2013-10-07  4388  	 */
dabe1d992414a6 Rik van Riel       2013-10-07  4389  	if (page_mapcount(page=
) > 1 && (vma->vm_flags & VM_SHARED))
dabe1d992414a6 Rik van Riel       2013-10-07  4390  		flags |=3D TNF_SHARED;
dabe1d992414a6 Rik van Riel       2013-10-07  4391  =

8191acbd30c73e Mel Gorman         2013-10-07  4392  	page_nid =3D page_to_n=
id(page);
a5991df6356627 Huang Ying         2020-06-11  4393  	/*
a5991df6356627 Huang Ying         2020-06-11  4394  	 * In memory tiering m=
ode, cpupid of slow memory page is used
a5991df6356627 Huang Ying         2020-06-11  4395  	 * to record page acce=
ss time.  So use default value.
a5991df6356627 Huang Ying         2020-06-11  4396  	 */
a5991df6356627 Huang Ying         2020-06-11 @4397  	if ((sysctl_numa_balan=
cing_mode & NUMA_BALANCING_MEMORY_TIERING) &&
a5991df6356627 Huang Ying         2020-06-11  4398  	    !node_is_toptier(p=
age_nid))
a5991df6356627 Huang Ying         2020-06-11  4399  		last_cpupid =3D (-1 &=
 LAST_CPUPID_MASK);
a5991df6356627 Huang Ying         2020-06-11  4400  	else
a5991df6356627 Huang Ying         2020-06-11  4401  		last_cpupid =3D page_=
cpupid_last(page);
82b0f8c39a3869 Jan Kara           2016-12-14  4402  	target_nid =3D numa_mi=
grate_prep(page, vma, vmf->address, page_nid,
bae473a423f65e Kirill A. Shutemov 2016-07-26  4403  			&flags);
98fa15f34cb379 Anshuman Khandual  2019-03-05  4404  	if (target_nid =3D=3D =
NUMA_NO_NODE) {
4daae3b4b9e49b Mel Gorman         2012-11-02  4405  		put_page(page);
b99a342d4f11a5 Huang Ying         2021-04-29  4406  		goto out_map;
4daae3b4b9e49b Mel Gorman         2012-11-02  4407  	}
b99a342d4f11a5 Huang Ying         2021-04-29  4408  	pte_unmap_unlock(vmf->=
pte, vmf->ptl);
4daae3b4b9e49b Mel Gorman         2012-11-02  4409  =

4daae3b4b9e49b Mel Gorman         2012-11-02  4410  	/* Migrate to the requ=
ested node */
bf90ac198e30d2 Wang Qing          2021-04-29  4411  	if (migrate_misplaced_=
page(page, vma, target_nid)) {
8191acbd30c73e Mel Gorman         2013-10-07  4412  		page_nid =3D target_n=
id;
6688cc05473b36 Peter Zijlstra     2013-10-07  4413  		flags |=3D TNF_MIGRAT=
ED;
b99a342d4f11a5 Huang Ying         2021-04-29  4414  	} else {
074c238177a75f Mel Gorman         2015-03-25  4415  		flags |=3D TNF_MIGRAT=
E_FAIL;
b99a342d4f11a5 Huang Ying         2021-04-29  4416  		vmf->pte =3D pte_offs=
et_map(vmf->pmd, vmf->address);
b99a342d4f11a5 Huang Ying         2021-04-29  4417  		spin_lock(vmf->ptl);
b99a342d4f11a5 Huang Ying         2021-04-29  4418  		if (unlikely(!pte_sam=
e(*vmf->pte, vmf->orig_pte))) {
b99a342d4f11a5 Huang Ying         2021-04-29  4419  			pte_unmap_unlock(vmf=
->pte, vmf->ptl);
b99a342d4f11a5 Huang Ying         2021-04-29  4420  			goto out;
b99a342d4f11a5 Huang Ying         2021-04-29  4421  		}
b99a342d4f11a5 Huang Ying         2021-04-29  4422  		goto out_map;
b99a342d4f11a5 Huang Ying         2021-04-29  4423  	}
4daae3b4b9e49b Mel Gorman         2012-11-02  4424  =

4daae3b4b9e49b Mel Gorman         2012-11-02  4425  out:
98fa15f34cb379 Anshuman Khandual  2019-03-05  4426  	if (page_nid !=3D NUMA=
_NO_NODE)
6688cc05473b36 Peter Zijlstra     2013-10-07  4427  		task_numa_fault(last_=
cpupid, page_nid, 1, flags);
d10e63f29488b0 Mel Gorman         2012-10-25  4428  	return 0;
b99a342d4f11a5 Huang Ying         2021-04-29  4429  out_map:
b99a342d4f11a5 Huang Ying         2021-04-29  4430  	/*
b99a342d4f11a5 Huang Ying         2021-04-29  4431  	 * Make it present aga=
in, depending on how arch implements
b99a342d4f11a5 Huang Ying         2021-04-29  4432  	 * non-accessible ptes=
, some can allow access by kernel mode.
b99a342d4f11a5 Huang Ying         2021-04-29  4433  	 */
b99a342d4f11a5 Huang Ying         2021-04-29  4434  	old_pte =3D ptep_modif=
y_prot_start(vma, vmf->address, vmf->pte);
b99a342d4f11a5 Huang Ying         2021-04-29  4435  	pte =3D pte_modify(old=
_pte, vma->vm_page_prot);
b99a342d4f11a5 Huang Ying         2021-04-29  4436  	pte =3D pte_mkyoung(pt=
e);
b99a342d4f11a5 Huang Ying         2021-04-29  4437  	if (was_writable)
b99a342d4f11a5 Huang Ying         2021-04-29  4438  		pte =3D pte_mkwrite(p=
te);
b99a342d4f11a5 Huang Ying         2021-04-29  4439  	ptep_modify_prot_commi=
t(vma, vmf->address, vmf->pte, old_pte, pte);
b99a342d4f11a5 Huang Ying         2021-04-29  4440  	update_mmu_cache(vma, =
vmf->address, vmf->pte);
b99a342d4f11a5 Huang Ying         2021-04-29  4441  	pte_unmap_unlock(vmf->=
pte, vmf->ptl);
b99a342d4f11a5 Huang Ying         2021-04-29  4442  	goto out;
d10e63f29488b0 Mel Gorman         2012-10-25  4443  }
d10e63f29488b0 Mel Gorman         2012-10-25  4444  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4761972701916199096==--

