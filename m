Content-Type: multipart/mixed; boundary="===============5489355601287321760=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 1/3] memory tiering: hot page selection with hint page fault latency
Date: Sat, 09 Apr 2022 12:00:26 +0800
Message-ID: <202204091107.3i51JkZh-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5489355601287321760==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220408071222.219689-2-ying.huang@intel.com>
References: <20220408071222.219689-2-ying.huang@intel.com>
TO: Huang Ying <ying.huang@intel.com>

Hi Huang,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on tip/sched/core]
[also build test WARNING on mcgrof/sysctl-next linus/master v5.18-rc1 next-=
20220408]
[cannot apply to hnaz-mm/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Huang-Ying/memory-ti=
ering-hot-page-selection/20220408-151410
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git 089c02a=
e2771a14af2928c59c56abfb9b885a8d7
:::::: branch date: 21 hours ago
:::::: commit date: 21 hours ago
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20220=
409/202204091107.3i51JkZh-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-19) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
mm/memory.c:4456 do_numa_page() warn: bitwise AND condition is false here

vim +4456 mm/memory.c

9532fec118d485e Mel Gorman         2012-11-15  4397  =

2b7403035459c75 Souptick Joarder   2018-08-23  4398  static vm_fault_t do_n=
uma_page(struct vm_fault *vmf)
d10e63f29488b0f Mel Gorman         2012-10-25  4399  {
82b0f8c39a3869b Jan Kara           2016-12-14  4400  	struct vm_area_struct=
 *vma =3D vmf->vma;
4daae3b4b9e49b7 Mel Gorman         2012-11-02  4401  	struct page *page =3D=
 NULL;
98fa15f34cb3798 Anshuman Khandual  2019-03-05  4402  	int page_nid =3D NUMA=
_NO_NODE;
90572890d202527 Peter Zijlstra     2013-10-07  4403  	int last_cpupid;
cbee9f88ec1b8dd Peter Zijlstra     2012-10-25  4404  	int target_nid;
04a8645304500be Aneesh Kumar K.V   2019-03-05  4405  	pte_t pte, old_pte;
288bc54949fc262 Aneesh Kumar K.V   2017-02-24  4406  	bool was_writable =3D=
 pte_savedwrite(vmf->orig_pte);
6688cc05473b36a Peter Zijlstra     2013-10-07  4407  	int flags =3D 0;
d10e63f29488b0f Mel Gorman         2012-10-25  4408  =

d10e63f29488b0f Mel Gorman         2012-10-25  4409  	/*
d10e63f29488b0f Mel Gorman         2012-10-25  4410  	 * The "pte" at this =
point cannot be used safely without
d10e63f29488b0f Mel Gorman         2012-10-25  4411  	 * validation through=
 pte_unmap_same(). It's of NUMA type but
d10e63f29488b0f Mel Gorman         2012-10-25  4412  	 * the pfn may be scr=
ewed if the read is non atomic.
d10e63f29488b0f Mel Gorman         2012-10-25  4413  	 */
82b0f8c39a3869b Jan Kara           2016-12-14  4414  	vmf->ptl =3D pte_lock=
ptr(vma->vm_mm, vmf->pmd);
82b0f8c39a3869b Jan Kara           2016-12-14  4415  	spin_lock(vmf->ptl);
cee216a696b2004 Aneesh Kumar K.V   2017-02-24  4416  	if (unlikely(!pte_sam=
e(*vmf->pte, vmf->orig_pte))) {
82b0f8c39a3869b Jan Kara           2016-12-14  4417  		pte_unmap_unlock(vmf=
->pte, vmf->ptl);
4daae3b4b9e49b7 Mel Gorman         2012-11-02  4418  		goto out;
4daae3b4b9e49b7 Mel Gorman         2012-11-02  4419  	}
4daae3b4b9e49b7 Mel Gorman         2012-11-02  4420  =

b99a342d4f11a54 Huang Ying         2021-04-29  4421  	/* Get the normal PTE=
  */
b99a342d4f11a54 Huang Ying         2021-04-29  4422  	old_pte =3D ptep_get(=
vmf->pte);
04a8645304500be Aneesh Kumar K.V   2019-03-05  4423  	pte =3D pte_modify(ol=
d_pte, vma->vm_page_prot);
d10e63f29488b0f Mel Gorman         2012-10-25  4424  =

82b0f8c39a3869b Jan Kara           2016-12-14  4425  	page =3D vm_normal_pa=
ge(vma, vmf->address, pte);
b99a342d4f11a54 Huang Ying         2021-04-29  4426  	if (!page)
b99a342d4f11a54 Huang Ying         2021-04-29  4427  		goto out_map;
d10e63f29488b0f Mel Gorman         2012-10-25  4428  =

e81c48024f43b4a Kirill A. Shutemov 2016-01-15  4429  	/* TODO: handle PTE-m=
apped THP */
b99a342d4f11a54 Huang Ying         2021-04-29  4430  	if (PageCompound(page=
))
b99a342d4f11a54 Huang Ying         2021-04-29  4431  		goto out_map;
e81c48024f43b4a Kirill A. Shutemov 2016-01-15  4432  =

6688cc05473b36a Peter Zijlstra     2013-10-07  4433  	/*
bea66fbd11af1ca Mel Gorman         2015-03-25  4434  	 * Avoid grouping on =
RO pages in general. RO pages shouldn't hurt as
bea66fbd11af1ca Mel Gorman         2015-03-25  4435  	 * much anyway since =
they can be in shared cache state. This misses
bea66fbd11af1ca Mel Gorman         2015-03-25  4436  	 * the case where a m=
apping is writable but the process never writes
bea66fbd11af1ca Mel Gorman         2015-03-25  4437  	 * to it but pte_writ=
e gets cleared during protection updates and
bea66fbd11af1ca Mel Gorman         2015-03-25  4438  	 * pte_dirty has unpr=
edictable behaviour between PTE scan updates,
bea66fbd11af1ca Mel Gorman         2015-03-25  4439  	 * background writeba=
ck, dirty balancing and application behaviour.
bea66fbd11af1ca Mel Gorman         2015-03-25  4440  	 */
b99a342d4f11a54 Huang Ying         2021-04-29  4441  	if (!was_writable)
6688cc05473b36a Peter Zijlstra     2013-10-07  4442  		flags |=3D TNF_NO_GR=
OUP;
6688cc05473b36a Peter Zijlstra     2013-10-07  4443  =

dabe1d992414a64 Rik van Riel       2013-10-07  4444  	/*
dabe1d992414a64 Rik van Riel       2013-10-07  4445  	 * Flag if the page i=
s shared between multiple address spaces. This
dabe1d992414a64 Rik van Riel       2013-10-07  4446  	 * is later used when=
 determining whether to group tasks together
dabe1d992414a64 Rik van Riel       2013-10-07  4447  	 */
dabe1d992414a64 Rik van Riel       2013-10-07  4448  	if (page_mapcount(pag=
e) > 1 && (vma->vm_flags & VM_SHARED))
dabe1d992414a64 Rik van Riel       2013-10-07  4449  		flags |=3D TNF_SHARE=
D;
dabe1d992414a64 Rik van Riel       2013-10-07  4450  =

8191acbd30c73e4 Mel Gorman         2013-10-07  4451  	page_nid =3D page_to_=
nid(page);
e4e875b64dea3af Huang Ying         2022-04-08  4452  	/*
e4e875b64dea3af Huang Ying         2022-04-08  4453  	 * In memory tiering =
mode, cpupid of slow memory page is used
e4e875b64dea3af Huang Ying         2022-04-08  4454  	 * to record page acc=
ess time.  So use default value.
e4e875b64dea3af Huang Ying         2022-04-08  4455  	 */
e4e875b64dea3af Huang Ying         2022-04-08 @4456  	if ((sysctl_numa_bala=
ncing_mode & NUMA_BALANCING_MEMORY_TIERING) &&
e4e875b64dea3af Huang Ying         2022-04-08  4457  	    !node_is_toptier(=
page_nid))
e4e875b64dea3af Huang Ying         2022-04-08  4458  		last_cpupid =3D (-1 =
& LAST_CPUPID_MASK);
e4e875b64dea3af Huang Ying         2022-04-08  4459  	else
e4e875b64dea3af Huang Ying         2022-04-08  4460  		last_cpupid =3D page=
_cpupid_last(page);
82b0f8c39a3869b Jan Kara           2016-12-14  4461  	target_nid =3D numa_m=
igrate_prep(page, vma, vmf->address, page_nid,
bae473a423f65e4 Kirill A. Shutemov 2016-07-26  4462  			&flags);
98fa15f34cb3798 Anshuman Khandual  2019-03-05  4463  	if (target_nid =3D=3D=
 NUMA_NO_NODE) {
4daae3b4b9e49b7 Mel Gorman         2012-11-02  4464  		put_page(page);
b99a342d4f11a54 Huang Ying         2021-04-29  4465  		goto out_map;
4daae3b4b9e49b7 Mel Gorman         2012-11-02  4466  	}
b99a342d4f11a54 Huang Ying         2021-04-29  4467  	pte_unmap_unlock(vmf-=
>pte, vmf->ptl);
4daae3b4b9e49b7 Mel Gorman         2012-11-02  4468  =

4daae3b4b9e49b7 Mel Gorman         2012-11-02  4469  	/* Migrate to the req=
uested node */
bf90ac198e30d24 Wang Qing          2021-04-29  4470  	if (migrate_misplaced=
_page(page, vma, target_nid)) {
8191acbd30c73e4 Mel Gorman         2013-10-07  4471  		page_nid =3D target_=
nid;
6688cc05473b36a Peter Zijlstra     2013-10-07  4472  		flags |=3D TNF_MIGRA=
TED;
b99a342d4f11a54 Huang Ying         2021-04-29  4473  	} else {
074c238177a75f5 Mel Gorman         2015-03-25  4474  		flags |=3D TNF_MIGRA=
TE_FAIL;
b99a342d4f11a54 Huang Ying         2021-04-29  4475  		vmf->pte =3D pte_off=
set_map(vmf->pmd, vmf->address);
b99a342d4f11a54 Huang Ying         2021-04-29  4476  		spin_lock(vmf->ptl);
b99a342d4f11a54 Huang Ying         2021-04-29  4477  		if (unlikely(!pte_sa=
me(*vmf->pte, vmf->orig_pte))) {
b99a342d4f11a54 Huang Ying         2021-04-29  4478  			pte_unmap_unlock(vm=
f->pte, vmf->ptl);
b99a342d4f11a54 Huang Ying         2021-04-29  4479  			goto out;
b99a342d4f11a54 Huang Ying         2021-04-29  4480  		}
b99a342d4f11a54 Huang Ying         2021-04-29  4481  		goto out_map;
b99a342d4f11a54 Huang Ying         2021-04-29  4482  	}
4daae3b4b9e49b7 Mel Gorman         2012-11-02  4483  =

4daae3b4b9e49b7 Mel Gorman         2012-11-02  4484  out:
98fa15f34cb3798 Anshuman Khandual  2019-03-05  4485  	if (page_nid !=3D NUM=
A_NO_NODE)
6688cc05473b36a Peter Zijlstra     2013-10-07  4486  		task_numa_fault(last=
_cpupid, page_nid, 1, flags);
d10e63f29488b0f Mel Gorman         2012-10-25  4487  	return 0;
b99a342d4f11a54 Huang Ying         2021-04-29  4488  out_map:
b99a342d4f11a54 Huang Ying         2021-04-29  4489  	/*
b99a342d4f11a54 Huang Ying         2021-04-29  4490  	 * Make it present ag=
ain, depending on how arch implements
b99a342d4f11a54 Huang Ying         2021-04-29  4491  	 * non-accessible pte=
s, some can allow access by kernel mode.
b99a342d4f11a54 Huang Ying         2021-04-29  4492  	 */
b99a342d4f11a54 Huang Ying         2021-04-29  4493  	old_pte =3D ptep_modi=
fy_prot_start(vma, vmf->address, vmf->pte);
b99a342d4f11a54 Huang Ying         2021-04-29  4494  	pte =3D pte_modify(ol=
d_pte, vma->vm_page_prot);
b99a342d4f11a54 Huang Ying         2021-04-29  4495  	pte =3D pte_mkyoung(p=
te);
b99a342d4f11a54 Huang Ying         2021-04-29  4496  	if (was_writable)
b99a342d4f11a54 Huang Ying         2021-04-29  4497  		pte =3D pte_mkwrite(=
pte);
b99a342d4f11a54 Huang Ying         2021-04-29  4498  	ptep_modify_prot_comm=
it(vma, vmf->address, vmf->pte, old_pte, pte);
b99a342d4f11a54 Huang Ying         2021-04-29  4499  	update_mmu_cache(vma,=
 vmf->address, vmf->pte);
b99a342d4f11a54 Huang Ying         2021-04-29  4500  	pte_unmap_unlock(vmf-=
>pte, vmf->ptl);
b99a342d4f11a54 Huang Ying         2021-04-29  4501  	goto out;
d10e63f29488b0f Mel Gorman         2012-10-25  4502  }
d10e63f29488b0f Mel Gorman         2012-10-25  4503  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5489355601287321760==--

