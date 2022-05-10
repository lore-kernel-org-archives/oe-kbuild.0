Content-Type: multipart/mixed; boundary="===============4488288610200678783=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH -V2 1/3 RESEND] memory tiering: hot page selection with hint page fault latency
Date: Wed, 11 May 2022 04:11:49 +0800
Message-ID: <202205110455.qmC7MeuB-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4488288610200678783==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220510063958.86985-2-ying.huang@intel.com>
References: <20220510063958.86985-2-ying.huang@intel.com>
TO: Huang Ying <ying.huang@intel.com>

Hi Huang,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on tip/sched/core]
[also build test WARNING on mcgrof/sysctl-next linus/master v5.18-rc6 next-=
20220510]
[cannot apply to hnaz-mm/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Huang-Ying/memory-ti=
ering-hot-page-selection/20220510-144141
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git d70522f=
c541224b8351ac26f4765f2c6268f8d72
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: i386-randconfig-m021-20220509 (https://download.01.org/0day-ci/arch=
ive/20220511/202205110455.qmC7MeuB-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-20) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
mm/memory.c:4456 do_numa_page() warn: bitwise AND condition is false here

vim +4456 mm/memory.c

9532fec118d485 Mel Gorman         2012-11-15  4397  =

2b7403035459c7 Souptick Joarder   2018-08-23  4398  static vm_fault_t do_nu=
ma_page(struct vm_fault *vmf)
d10e63f29488b0 Mel Gorman         2012-10-25  4399  {
82b0f8c39a3869 Jan Kara           2016-12-14  4400  	struct vm_area_struct =
*vma =3D vmf->vma;
4daae3b4b9e49b Mel Gorman         2012-11-02  4401  	struct page *page =3D =
NULL;
98fa15f34cb379 Anshuman Khandual  2019-03-05  4402  	int page_nid =3D NUMA_=
NO_NODE;
90572890d20252 Peter Zijlstra     2013-10-07  4403  	int last_cpupid;
cbee9f88ec1b8d Peter Zijlstra     2012-10-25  4404  	int target_nid;
04a8645304500b Aneesh Kumar K.V   2019-03-05  4405  	pte_t pte, old_pte;
288bc54949fc26 Aneesh Kumar K.V   2017-02-24  4406  	bool was_writable =3D =
pte_savedwrite(vmf->orig_pte);
6688cc05473b36 Peter Zijlstra     2013-10-07  4407  	int flags =3D 0;
d10e63f29488b0 Mel Gorman         2012-10-25  4408  =

d10e63f29488b0 Mel Gorman         2012-10-25  4409  	/*
d10e63f29488b0 Mel Gorman         2012-10-25  4410  	 * The "pte" at this p=
oint cannot be used safely without
d10e63f29488b0 Mel Gorman         2012-10-25  4411  	 * validation through =
pte_unmap_same(). It's of NUMA type but
d10e63f29488b0 Mel Gorman         2012-10-25  4412  	 * the pfn may be scre=
wed if the read is non atomic.
d10e63f29488b0 Mel Gorman         2012-10-25  4413  	 */
82b0f8c39a3869 Jan Kara           2016-12-14  4414  	vmf->ptl =3D pte_lockp=
tr(vma->vm_mm, vmf->pmd);
82b0f8c39a3869 Jan Kara           2016-12-14  4415  	spin_lock(vmf->ptl);
cee216a696b200 Aneesh Kumar K.V   2017-02-24  4416  	if (unlikely(!pte_same=
(*vmf->pte, vmf->orig_pte))) {
82b0f8c39a3869 Jan Kara           2016-12-14  4417  		pte_unmap_unlock(vmf-=
>pte, vmf->ptl);
4daae3b4b9e49b Mel Gorman         2012-11-02  4418  		goto out;
4daae3b4b9e49b Mel Gorman         2012-11-02  4419  	}
4daae3b4b9e49b Mel Gorman         2012-11-02  4420  =

b99a342d4f11a5 Huang Ying         2021-04-29  4421  	/* Get the normal PTE =
 */
b99a342d4f11a5 Huang Ying         2021-04-29  4422  	old_pte =3D ptep_get(v=
mf->pte);
04a8645304500b Aneesh Kumar K.V   2019-03-05  4423  	pte =3D pte_modify(old=
_pte, vma->vm_page_prot);
d10e63f29488b0 Mel Gorman         2012-10-25  4424  =

82b0f8c39a3869 Jan Kara           2016-12-14  4425  	page =3D vm_normal_pag=
e(vma, vmf->address, pte);
b99a342d4f11a5 Huang Ying         2021-04-29  4426  	if (!page)
b99a342d4f11a5 Huang Ying         2021-04-29  4427  		goto out_map;
d10e63f29488b0 Mel Gorman         2012-10-25  4428  =

e81c48024f43b4 Kirill A. Shutemov 2016-01-15  4429  	/* TODO: handle PTE-ma=
pped THP */
b99a342d4f11a5 Huang Ying         2021-04-29  4430  	if (PageCompound(page))
b99a342d4f11a5 Huang Ying         2021-04-29  4431  		goto out_map;
e81c48024f43b4 Kirill A. Shutemov 2016-01-15  4432  =

6688cc05473b36 Peter Zijlstra     2013-10-07  4433  	/*
bea66fbd11af1c Mel Gorman         2015-03-25  4434  	 * Avoid grouping on R=
O pages in general. RO pages shouldn't hurt as
bea66fbd11af1c Mel Gorman         2015-03-25  4435  	 * much anyway since t=
hey can be in shared cache state. This misses
bea66fbd11af1c Mel Gorman         2015-03-25  4436  	 * the case where a ma=
pping is writable but the process never writes
bea66fbd11af1c Mel Gorman         2015-03-25  4437  	 * to it but pte_write=
 gets cleared during protection updates and
bea66fbd11af1c Mel Gorman         2015-03-25  4438  	 * pte_dirty has unpre=
dictable behaviour between PTE scan updates,
bea66fbd11af1c Mel Gorman         2015-03-25  4439  	 * background writebac=
k, dirty balancing and application behaviour.
bea66fbd11af1c Mel Gorman         2015-03-25  4440  	 */
b99a342d4f11a5 Huang Ying         2021-04-29  4441  	if (!was_writable)
6688cc05473b36 Peter Zijlstra     2013-10-07  4442  		flags |=3D TNF_NO_GRO=
UP;
6688cc05473b36 Peter Zijlstra     2013-10-07  4443  =

dabe1d992414a6 Rik van Riel       2013-10-07  4444  	/*
dabe1d992414a6 Rik van Riel       2013-10-07  4445  	 * Flag if the page is=
 shared between multiple address spaces. This
dabe1d992414a6 Rik van Riel       2013-10-07  4446  	 * is later used when =
determining whether to group tasks together
dabe1d992414a6 Rik van Riel       2013-10-07  4447  	 */
dabe1d992414a6 Rik van Riel       2013-10-07  4448  	if (page_mapcount(page=
) > 1 && (vma->vm_flags & VM_SHARED))
dabe1d992414a6 Rik van Riel       2013-10-07  4449  		flags |=3D TNF_SHARED;
dabe1d992414a6 Rik van Riel       2013-10-07  4450  =

8191acbd30c73e Mel Gorman         2013-10-07  4451  	page_nid =3D page_to_n=
id(page);
8f54435bb59e21 Huang Ying         2022-05-10  4452  	/*
8f54435bb59e21 Huang Ying         2022-05-10  4453  	 * For memory tiering =
mode, cpupid of slow memory page is used
8f54435bb59e21 Huang Ying         2022-05-10  4454  	 * to record page acce=
ss time.  So use default value.
8f54435bb59e21 Huang Ying         2022-05-10  4455  	 */
8f54435bb59e21 Huang Ying         2022-05-10 @4456  	if ((sysctl_numa_balan=
cing_mode & NUMA_BALANCING_MEMORY_TIERING) &&
8f54435bb59e21 Huang Ying         2022-05-10  4457  	    !node_is_toptier(p=
age_nid))
8f54435bb59e21 Huang Ying         2022-05-10  4458  		last_cpupid =3D (-1 &=
 LAST_CPUPID_MASK);
8f54435bb59e21 Huang Ying         2022-05-10  4459  	else
8f54435bb59e21 Huang Ying         2022-05-10  4460  		last_cpupid =3D page_=
cpupid_last(page);
82b0f8c39a3869 Jan Kara           2016-12-14  4461  	target_nid =3D numa_mi=
grate_prep(page, vma, vmf->address, page_nid,
bae473a423f65e Kirill A. Shutemov 2016-07-26  4462  			&flags);
98fa15f34cb379 Anshuman Khandual  2019-03-05  4463  	if (target_nid =3D=3D =
NUMA_NO_NODE) {
4daae3b4b9e49b Mel Gorman         2012-11-02  4464  		put_page(page);
b99a342d4f11a5 Huang Ying         2021-04-29  4465  		goto out_map;
4daae3b4b9e49b Mel Gorman         2012-11-02  4466  	}
b99a342d4f11a5 Huang Ying         2021-04-29  4467  	pte_unmap_unlock(vmf->=
pte, vmf->ptl);
4daae3b4b9e49b Mel Gorman         2012-11-02  4468  =

4daae3b4b9e49b Mel Gorman         2012-11-02  4469  	/* Migrate to the requ=
ested node */
bf90ac198e30d2 Wang Qing          2021-04-29  4470  	if (migrate_misplaced_=
page(page, vma, target_nid)) {
8191acbd30c73e Mel Gorman         2013-10-07  4471  		page_nid =3D target_n=
id;
6688cc05473b36 Peter Zijlstra     2013-10-07  4472  		flags |=3D TNF_MIGRAT=
ED;
b99a342d4f11a5 Huang Ying         2021-04-29  4473  	} else {
074c238177a75f Mel Gorman         2015-03-25  4474  		flags |=3D TNF_MIGRAT=
E_FAIL;
b99a342d4f11a5 Huang Ying         2021-04-29  4475  		vmf->pte =3D pte_offs=
et_map(vmf->pmd, vmf->address);
b99a342d4f11a5 Huang Ying         2021-04-29  4476  		spin_lock(vmf->ptl);
b99a342d4f11a5 Huang Ying         2021-04-29  4477  		if (unlikely(!pte_sam=
e(*vmf->pte, vmf->orig_pte))) {
b99a342d4f11a5 Huang Ying         2021-04-29  4478  			pte_unmap_unlock(vmf=
->pte, vmf->ptl);
b99a342d4f11a5 Huang Ying         2021-04-29  4479  			goto out;
b99a342d4f11a5 Huang Ying         2021-04-29  4480  		}
b99a342d4f11a5 Huang Ying         2021-04-29  4481  		goto out_map;
b99a342d4f11a5 Huang Ying         2021-04-29  4482  	}
4daae3b4b9e49b Mel Gorman         2012-11-02  4483  =

4daae3b4b9e49b Mel Gorman         2012-11-02  4484  out:
98fa15f34cb379 Anshuman Khandual  2019-03-05  4485  	if (page_nid !=3D NUMA=
_NO_NODE)
6688cc05473b36 Peter Zijlstra     2013-10-07  4486  		task_numa_fault(last_=
cpupid, page_nid, 1, flags);
d10e63f29488b0 Mel Gorman         2012-10-25  4487  	return 0;
b99a342d4f11a5 Huang Ying         2021-04-29  4488  out_map:
b99a342d4f11a5 Huang Ying         2021-04-29  4489  	/*
b99a342d4f11a5 Huang Ying         2021-04-29  4490  	 * Make it present aga=
in, depending on how arch implements
b99a342d4f11a5 Huang Ying         2021-04-29  4491  	 * non-accessible ptes=
, some can allow access by kernel mode.
b99a342d4f11a5 Huang Ying         2021-04-29  4492  	 */
b99a342d4f11a5 Huang Ying         2021-04-29  4493  	old_pte =3D ptep_modif=
y_prot_start(vma, vmf->address, vmf->pte);
b99a342d4f11a5 Huang Ying         2021-04-29  4494  	pte =3D pte_modify(old=
_pte, vma->vm_page_prot);
b99a342d4f11a5 Huang Ying         2021-04-29  4495  	pte =3D pte_mkyoung(pt=
e);
b99a342d4f11a5 Huang Ying         2021-04-29  4496  	if (was_writable)
b99a342d4f11a5 Huang Ying         2021-04-29  4497  		pte =3D pte_mkwrite(p=
te);
b99a342d4f11a5 Huang Ying         2021-04-29  4498  	ptep_modify_prot_commi=
t(vma, vmf->address, vmf->pte, old_pte, pte);
b99a342d4f11a5 Huang Ying         2021-04-29  4499  	update_mmu_cache(vma, =
vmf->address, vmf->pte);
b99a342d4f11a5 Huang Ying         2021-04-29  4500  	pte_unmap_unlock(vmf->=
pte, vmf->ptl);
b99a342d4f11a5 Huang Ying         2021-04-29  4501  	goto out;
d10e63f29488b0 Mel Gorman         2012-10-25  4502  }
d10e63f29488b0 Mel Gorman         2012-10-25  4503  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4488288610200678783==--

