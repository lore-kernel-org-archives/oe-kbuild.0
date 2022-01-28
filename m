Content-Type: multipart/mixed; boundary="===============2806648975402072203=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH -V11 3/3] memory tiering: skip to scan fast memory
Date: Sat, 29 Jan 2022 05:03:32 +0800
Message-ID: <202201290314.ANiIGBH1-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2806648975402072203==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220128082751.593478-4-ying.huang@intel.com>
References: <20220128082751.593478-4-ying.huang@intel.com>
TO: Huang Ying <ying.huang@intel.com>

Hi Huang,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on linux/master]
[also build test WARNING on linus/master v5.17-rc1 next-20220128]
[cannot apply to tip/sched/core hnaz-mm/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Huang-Ying/NUMA-balancing-=
optimize-memory-placement-for-memory-tiering-system/20220128-162856
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
2c271fe77d52a0555161926c232cd5bc07178b39
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/202=
20129/202201290314.ANiIGBH1-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
mm/mprotect.c:122 change_pte_range() warn: bitwise AND condition is false h=
ere

vim +122 mm/mprotect.c

36f881883c5794 Kirill A. Shutemov 2015-06-24   38  =

4b10e7d562c90d Mel Gorman         2012-10-25   39  static unsigned long cha=
nge_pte_range(struct vm_area_struct *vma, pmd_t *pmd,
c1e6098b23bb46 Peter Zijlstra     2006-09-25   40  		unsigned long addr, un=
signed long end, pgprot_t newprot,
58705444c45b3c Peter Xu           2020-04-06   41  		unsigned long cp_flags)
^1da177e4c3f41 Linus Torvalds     2005-04-16   42  {
0697212a411c1d Christoph Lameter  2006-06-23   43  	pte_t *pte, oldpte;
705e87c0c3c384 Hugh Dickins       2005-10-29   44  	spinlock_t *ptl;
7da4d641c58d20 Peter Zijlstra     2012-11-19   45  	unsigned long pages =3D=
 0;
3e32158767b04d Andi Kleen         2016-12-12   46  	int target_node =3D NUM=
A_NO_NODE;
58705444c45b3c Peter Xu           2020-04-06   47  	bool dirty_accountable =
=3D cp_flags & MM_CP_DIRTY_ACCT;
58705444c45b3c Peter Xu           2020-04-06   48  	bool prot_numa =3D cp_f=
lags & MM_CP_PROT_NUMA;
292924b2602474 Peter Xu           2020-04-06   49  	bool uffd_wp =3D cp_fla=
gs & MM_CP_UFFD_WP;
292924b2602474 Peter Xu           2020-04-06   50  	bool uffd_wp_resolve =
=3D cp_flags & MM_CP_UFFD_WP_RESOLVE;
^1da177e4c3f41 Linus Torvalds     2005-04-16   51  =

175ad4f1e7a29c Andrea Arcangeli   2017-02-22   52  	/*
c1e8d7c6a7a682 Michel Lespinasse  2020-06-08   53  	 * Can be called with o=
nly the mmap_lock for reading by
175ad4f1e7a29c Andrea Arcangeli   2017-02-22   54  	 * prot_numa so we must=
 check the pmd isn't constantly
175ad4f1e7a29c Andrea Arcangeli   2017-02-22   55  	 * changing from under =
us from pmd_none to pmd_trans_huge
175ad4f1e7a29c Andrea Arcangeli   2017-02-22   56  	 * and/or the other way=
 around.
175ad4f1e7a29c Andrea Arcangeli   2017-02-22   57  	 */
175ad4f1e7a29c Andrea Arcangeli   2017-02-22   58  	if (pmd_trans_unstable(=
pmd))
175ad4f1e7a29c Andrea Arcangeli   2017-02-22   59  		return 0;
175ad4f1e7a29c Andrea Arcangeli   2017-02-22   60  =

175ad4f1e7a29c Andrea Arcangeli   2017-02-22   61  	/*
175ad4f1e7a29c Andrea Arcangeli   2017-02-22   62  	 * The pmd points to a =
regular pte so the pmd can't change
c1e8d7c6a7a682 Michel Lespinasse  2020-06-08   63  	 * from under us even i=
f the mmap_lock is only hold for
175ad4f1e7a29c Andrea Arcangeli   2017-02-22   64  	 * reading.
175ad4f1e7a29c Andrea Arcangeli   2017-02-22   65  	 */
175ad4f1e7a29c Andrea Arcangeli   2017-02-22   66  	pte =3D pte_offset_map_=
lock(vma->vm_mm, pmd, addr, &ptl);
1ad9f620c3a22f Mel Gorman         2014-04-07   67  =

3e32158767b04d Andi Kleen         2016-12-12   68  	/* Get target node for =
single threaded private VMAs */
3e32158767b04d Andi Kleen         2016-12-12   69  	if (prot_numa && !(vma-=
>vm_flags & VM_SHARED) &&
3e32158767b04d Andi Kleen         2016-12-12   70  	    atomic_read(&vma->v=
m_mm->mm_users) =3D=3D 1)
3e32158767b04d Andi Kleen         2016-12-12   71  		target_node =3D numa_n=
ode_id();
3e32158767b04d Andi Kleen         2016-12-12   72  =

3ea277194daaea Mel Gorman         2017-08-02   73  	flush_tlb_batched_pendi=
ng(vma->vm_mm);
6606c3e0da5360 Zachary Amsden     2006-09-30   74  	arch_enter_lazy_mmu_mod=
e();
^1da177e4c3f41 Linus Torvalds     2005-04-16   75  	do {
0697212a411c1d Christoph Lameter  2006-06-23   76  		oldpte =3D *pte;
0697212a411c1d Christoph Lameter  2006-06-23   77  		if (pte_present(oldpte=
)) {
^1da177e4c3f41 Linus Torvalds     2005-04-16   78  			pte_t ptent;
b191f9b106ea1a Mel Gorman         2015-03-25   79  			bool preserve_write =
=3D prot_numa && pte_write(oldpte);
^1da177e4c3f41 Linus Torvalds     2005-04-16   80  =

e944fd67b625c0 Mel Gorman         2015-02-12   81  			/*
e944fd67b625c0 Mel Gorman         2015-02-12   82  			 * Avoid trapping fau=
lts against the zero or KSM
e944fd67b625c0 Mel Gorman         2015-02-12   83  			 * pages. See similar=
 comment in change_huge_pmd.
e944fd67b625c0 Mel Gorman         2015-02-12   84  			 */
e944fd67b625c0 Mel Gorman         2015-02-12   85  			if (prot_numa) {
e944fd67b625c0 Mel Gorman         2015-02-12   86  				struct page *page;
039fe39df2b560 Huang Ying         2022-01-28   87  				int nid;
e944fd67b625c0 Mel Gorman         2015-02-12   88  =

a818f5363a0eba Huang Ying         2019-11-30   89  				/* Avoid TLB flush i=
f possible */
a818f5363a0eba Huang Ying         2019-11-30   90  				if (pte_protnone(old=
pte))
a818f5363a0eba Huang Ying         2019-11-30   91  					continue;
a818f5363a0eba Huang Ying         2019-11-30   92  =

e944fd67b625c0 Mel Gorman         2015-02-12   93  				page =3D vm_normal_p=
age(vma, addr, oldpte);
e944fd67b625c0 Mel Gorman         2015-02-12   94  				if (!page || PageKsm=
(page))
e944fd67b625c0 Mel Gorman         2015-02-12   95  					continue;
10c1045f28e86a Mel Gorman         2015-02-12   96  =

859d4adc3415a6 Henry Willard      2018-01-31   97  				/* Also skip shared =
copy-on-write pages */
859d4adc3415a6 Henry Willard      2018-01-31   98  				if (is_cow_mapping(v=
ma->vm_flags) &&
859d4adc3415a6 Henry Willard      2018-01-31   99  				    page_mapcount(pa=
ge) !=3D 1)
859d4adc3415a6 Henry Willard      2018-01-31  100  					continue;
859d4adc3415a6 Henry Willard      2018-01-31  101  =

09a913a7a947fb Mel Gorman         2018-04-10  102  				/*
09a913a7a947fb Mel Gorman         2018-04-10  103  				 * While migration c=
an move some dirty pages,
09a913a7a947fb Mel Gorman         2018-04-10  104  				 * it cannot move th=
em all from MIGRATE_ASYNC
09a913a7a947fb Mel Gorman         2018-04-10  105  				 * context.
09a913a7a947fb Mel Gorman         2018-04-10  106  				 */
9de4f22a60f731 Huang Ying         2020-04-06  107  				if (page_is_file_lru=
(page) && PageDirty(page))
09a913a7a947fb Mel Gorman         2018-04-10  108  					continue;
09a913a7a947fb Mel Gorman         2018-04-10  109  =

3e32158767b04d Andi Kleen         2016-12-12  110  				/*
3e32158767b04d Andi Kleen         2016-12-12  111  				 * Don't mess with P=
TEs if page is already on the node
3e32158767b04d Andi Kleen         2016-12-12  112  				 * a single-threaded=
 process is running on.
3e32158767b04d Andi Kleen         2016-12-12  113  				 */
039fe39df2b560 Huang Ying         2022-01-28  114  				nid =3D page_to_nid(=
page);
039fe39df2b560 Huang Ying         2022-01-28  115  				if (target_node =3D=
=3D nid)
039fe39df2b560 Huang Ying         2022-01-28  116  					continue;
039fe39df2b560 Huang Ying         2022-01-28  117  =

039fe39df2b560 Huang Ying         2022-01-28  118  				/*
039fe39df2b560 Huang Ying         2022-01-28  119  				 * Skip scanning top=
 tier node if normal numa
039fe39df2b560 Huang Ying         2022-01-28  120  				 * balancing is disa=
bled
039fe39df2b560 Huang Ying         2022-01-28  121  				 */
039fe39df2b560 Huang Ying         2022-01-28 @122  				if (!(sysctl_numa_ba=
lancing_mode & NUMA_BALANCING_NORMAL) &&
039fe39df2b560 Huang Ying         2022-01-28  123  				    node_is_toptier(=
nid))
3e32158767b04d Andi Kleen         2016-12-12  124  					continue;
e944fd67b625c0 Mel Gorman         2015-02-12  125  			}
e944fd67b625c0 Mel Gorman         2015-02-12  126  =

04a8645304500b Aneesh Kumar K.V   2019-03-05  127  			oldpte =3D ptep_modif=
y_prot_start(vma, addr, pte);
04a8645304500b Aneesh Kumar K.V   2019-03-05  128  			ptent =3D pte_modify(=
oldpte, newprot);
b191f9b106ea1a Mel Gorman         2015-03-25  129  			if (preserve_write)
288bc54949fc26 Aneesh Kumar K.V   2017-02-24  130  				ptent =3D pte_mk_sav=
edwrite(ptent);
8a0516ed8b90c9 Mel Gorman         2015-02-12  131  =

292924b2602474 Peter Xu           2020-04-06  132  			if (uffd_wp) {
292924b2602474 Peter Xu           2020-04-06  133  				ptent =3D pte_wrprot=
ect(ptent);
292924b2602474 Peter Xu           2020-04-06  134  				ptent =3D pte_mkuffd=
_wp(ptent);
292924b2602474 Peter Xu           2020-04-06  135  			} else if (uffd_wp_re=
solve) {
292924b2602474 Peter Xu           2020-04-06  136  				/*
292924b2602474 Peter Xu           2020-04-06  137  				 * Leave the write b=
it to be handled
292924b2602474 Peter Xu           2020-04-06  138  				 * by PF interrupt h=
andler, then
292924b2602474 Peter Xu           2020-04-06  139  				 * things like COW c=
ould be properly
292924b2602474 Peter Xu           2020-04-06  140  				 * handled.
292924b2602474 Peter Xu           2020-04-06  141  				 */
292924b2602474 Peter Xu           2020-04-06  142  				ptent =3D pte_clear_=
uffd_wp(ptent);
292924b2602474 Peter Xu           2020-04-06  143  			}
292924b2602474 Peter Xu           2020-04-06  144  =

8a0516ed8b90c9 Mel Gorman         2015-02-12  145  			/* Avoid taking write=
 faults for known dirty pages */
64e455079e1bd7 Peter Feiner       2014-10-13  146  			if (dirty_accountable=
 && pte_dirty(ptent) &&
64e455079e1bd7 Peter Feiner       2014-10-13  147  					(pte_soft_dirty(pte=
nt) ||
8a0516ed8b90c9 Mel Gorman         2015-02-12  148  					 !(vma->vm_flags & =
VM_SOFTDIRTY))) {
9d85d5863fa481 Aneesh Kumar K.V   2014-02-12  149  				ptent =3D pte_mkwrit=
e(ptent);
4b10e7d562c90d Mel Gorman         2012-10-25  150  			}
04a8645304500b Aneesh Kumar K.V   2019-03-05  151  			ptep_modify_prot_comm=
it(vma, addr, pte, oldpte, ptent);
7da4d641c58d20 Peter Zijlstra     2012-11-19  152  			pages++;
f45ec5ff16a75f Peter Xu           2020-04-06  153  		} else if (is_swap_pte=
(oldpte)) {
0697212a411c1d Christoph Lameter  2006-06-23  154  			swp_entry_t entry =3D=
 pte_to_swp_entry(oldpte);
f45ec5ff16a75f Peter Xu           2020-04-06  155  			pte_t newpte;
0697212a411c1d Christoph Lameter  2006-06-23  156  =

4dd845b5a3e57a Alistair Popple    2021-06-30  157  			if (is_writable_migra=
tion_entry(entry)) {
0697212a411c1d Christoph Lameter  2006-06-23  158  				/*
0697212a411c1d Christoph Lameter  2006-06-23  159  				 * A protection chec=
k is difficult so
0697212a411c1d Christoph Lameter  2006-06-23  160  				 * just be safe and =
disable write
0697212a411c1d Christoph Lameter  2006-06-23  161  				 */
4dd845b5a3e57a Alistair Popple    2021-06-30  162  				entry =3D make_reada=
ble_migration_entry(
4dd845b5a3e57a Alistair Popple    2021-06-30  163  							swp_offset(entry)=
);
c3d16e16522fe3 Cyrill Gorcunov    2013-10-16  164  				newpte =3D swp_entry=
_to_pte(entry);
c3d16e16522fe3 Cyrill Gorcunov    2013-10-16  165  				if (pte_swp_soft_dir=
ty(oldpte))
c3d16e16522fe3 Cyrill Gorcunov    2013-10-16  166  					newpte =3D pte_swp_=
mksoft_dirty(newpte);
f45ec5ff16a75f Peter Xu           2020-04-06  167  				if (pte_swp_uffd_wp(=
oldpte))
f45ec5ff16a75f Peter Xu           2020-04-06  168  					newpte =3D pte_swp_=
mkuffd_wp(newpte);
4dd845b5a3e57a Alistair Popple    2021-06-30  169  			} else if (is_writabl=
e_device_private_entry(entry)) {
5042db43cc26f5 J=C3=A9r=C3=B4me Glisse      2017-09-08  170  				/*
5042db43cc26f5 J=C3=A9r=C3=B4me Glisse      2017-09-08  171  				 * We do n=
ot preserve soft-dirtiness. See
5042db43cc26f5 J=C3=A9r=C3=B4me Glisse      2017-09-08  172  				 * copy_on=
e_pte() for explanation.
5042db43cc26f5 J=C3=A9r=C3=B4me Glisse      2017-09-08  173  				 */
4dd845b5a3e57a Alistair Popple    2021-06-30  174  				entry =3D make_reada=
ble_device_private_entry(
4dd845b5a3e57a Alistair Popple    2021-06-30  175  							swp_offset(entry)=
);
5042db43cc26f5 J=C3=A9r=C3=B4me Glisse      2017-09-08  176  				newpte =3D=
 swp_entry_to_pte(entry);
f45ec5ff16a75f Peter Xu           2020-04-06  177  				if (pte_swp_uffd_wp(=
oldpte))
f45ec5ff16a75f Peter Xu           2020-04-06  178  					newpte =3D pte_swp_=
mkuffd_wp(newpte);
b756a3b5e7ead8 Alistair Popple    2021-06-30  179  			} else if (is_writabl=
e_device_exclusive_entry(entry)) {
b756a3b5e7ead8 Alistair Popple    2021-06-30  180  				entry =3D make_reada=
ble_device_exclusive_entry(
b756a3b5e7ead8 Alistair Popple    2021-06-30  181  							swp_offset(entry)=
);
b756a3b5e7ead8 Alistair Popple    2021-06-30  182  				newpte =3D swp_entry=
_to_pte(entry);
b756a3b5e7ead8 Alistair Popple    2021-06-30  183  				if (pte_swp_soft_dir=
ty(oldpte))
b756a3b5e7ead8 Alistair Popple    2021-06-30  184  					newpte =3D pte_swp_=
mksoft_dirty(newpte);
b756a3b5e7ead8 Alistair Popple    2021-06-30  185  				if (pte_swp_uffd_wp(=
oldpte))
b756a3b5e7ead8 Alistair Popple    2021-06-30  186  					newpte =3D pte_swp_=
mkuffd_wp(newpte);
f45ec5ff16a75f Peter Xu           2020-04-06  187  			} else {
f45ec5ff16a75f Peter Xu           2020-04-06  188  				newpte =3D oldpte;
f45ec5ff16a75f Peter Xu           2020-04-06  189  			}
f45ec5ff16a75f Peter Xu           2020-04-06  190  =

f45ec5ff16a75f Peter Xu           2020-04-06  191  			if (uffd_wp)
f45ec5ff16a75f Peter Xu           2020-04-06  192  				newpte =3D pte_swp_m=
kuffd_wp(newpte);
f45ec5ff16a75f Peter Xu           2020-04-06  193  			else if (uffd_wp_reso=
lve)
f45ec5ff16a75f Peter Xu           2020-04-06  194  				newpte =3D pte_swp_c=
lear_uffd_wp(newpte);
5042db43cc26f5 J=C3=A9r=C3=B4me Glisse      2017-09-08  195  =

f45ec5ff16a75f Peter Xu           2020-04-06  196  			if (!pte_same(oldpte,=
 newpte)) {
f45ec5ff16a75f Peter Xu           2020-04-06  197  				set_pte_at(vma->vm_m=
m, addr, pte, newpte);
5042db43cc26f5 J=C3=A9r=C3=B4me Glisse      2017-09-08  198  				pages++;
5042db43cc26f5 J=C3=A9r=C3=B4me Glisse      2017-09-08  199  			}
e920e14ca29b0b Mel Gorman         2013-10-07  200  		}
^1da177e4c3f41 Linus Torvalds     2005-04-16  201  	} while (pte++, addr +=
=3D PAGE_SIZE, addr !=3D end);
6606c3e0da5360 Zachary Amsden     2006-09-30  202  	arch_leave_lazy_mmu_mod=
e();
705e87c0c3c384 Hugh Dickins       2005-10-29  203  	pte_unmap_unlock(pte - =
1, ptl);
7da4d641c58d20 Peter Zijlstra     2012-11-19  204  =

7da4d641c58d20 Peter Zijlstra     2012-11-19  205  	return pages;
^1da177e4c3f41 Linus Torvalds     2005-04-16  206  }
^1da177e4c3f41 Linus Torvalds     2005-04-16  207  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2806648975402072203==--

