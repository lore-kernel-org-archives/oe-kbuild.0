Content-Type: multipart/mixed; boundary="===============7399443321786696217=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [vishal-tiering:tiering-0.8 3/44] mm/mprotect.c:122 change_pte_range() warn: bitwise AND condition is false here
Date: Fri, 14 Jan 2022 12:40:33 +0800
Message-ID: <202201141216.cdEZnKhl-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7399443321786696217==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Huang Ying <ying.huang@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vishal/tiering.git =
tiering-0.8
head:   d58c7b0e1a99a2ec17f2910a310835bafc50b4d1
commit: 53c1d73ddb39cc1719a6b237d7db7b9edb93a81a [3/44] memory tiering: ski=
p to scan fast memory
:::::: branch date: 34 hours ago
:::::: commit date: 10 weeks ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/202=
20114/202201141216.cdEZnKhl-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
mm/mprotect.c:122 change_pte_range() warn: bitwise AND condition is false h=
ere

vim +122 mm/mprotect.c

36f881883c57941 Kirill A. Shutemov 2015-06-24   38  =

4b10e7d562c90d0 Mel Gorman         2012-10-25   39  static unsigned long ch=
ange_pte_range(struct vm_area_struct *vma, pmd_t *pmd,
c1e6098b23bb46e Peter Zijlstra     2006-09-25   40  		unsigned long addr, u=
nsigned long end, pgprot_t newprot,
58705444c45b3ca Peter Xu           2020-04-06   41  		unsigned long cp_flag=
s)
^1da177e4c3f415 Linus Torvalds     2005-04-16   42  {
0697212a411c1da Christoph Lameter  2006-06-23   43  	pte_t *pte, oldpte;
705e87c0c3c3842 Hugh Dickins       2005-10-29   44  	spinlock_t *ptl;
7da4d641c58d201 Peter Zijlstra     2012-11-19   45  	unsigned long pages =
=3D 0;
3e32158767b04db Andi Kleen         2016-12-12   46  	int target_node =3D NU=
MA_NO_NODE;
58705444c45b3ca Peter Xu           2020-04-06   47  	bool dirty_accountable=
 =3D cp_flags & MM_CP_DIRTY_ACCT;
58705444c45b3ca Peter Xu           2020-04-06   48  	bool prot_numa =3D cp_=
flags & MM_CP_PROT_NUMA;
292924b26024748 Peter Xu           2020-04-06   49  	bool uffd_wp =3D cp_fl=
ags & MM_CP_UFFD_WP;
292924b26024748 Peter Xu           2020-04-06   50  	bool uffd_wp_resolve =
=3D cp_flags & MM_CP_UFFD_WP_RESOLVE;
^1da177e4c3f415 Linus Torvalds     2005-04-16   51  =

175ad4f1e7a29c8 Andrea Arcangeli   2017-02-22   52  	/*
c1e8d7c6a7a682e Michel Lespinasse  2020-06-08   53  	 * Can be called with =
only the mmap_lock for reading by
175ad4f1e7a29c8 Andrea Arcangeli   2017-02-22   54  	 * prot_numa so we mus=
t check the pmd isn't constantly
175ad4f1e7a29c8 Andrea Arcangeli   2017-02-22   55  	 * changing from under=
 us from pmd_none to pmd_trans_huge
175ad4f1e7a29c8 Andrea Arcangeli   2017-02-22   56  	 * and/or the other wa=
y around.
175ad4f1e7a29c8 Andrea Arcangeli   2017-02-22   57  	 */
175ad4f1e7a29c8 Andrea Arcangeli   2017-02-22   58  	if (pmd_trans_unstable=
(pmd))
175ad4f1e7a29c8 Andrea Arcangeli   2017-02-22   59  		return 0;
175ad4f1e7a29c8 Andrea Arcangeli   2017-02-22   60  =

175ad4f1e7a29c8 Andrea Arcangeli   2017-02-22   61  	/*
175ad4f1e7a29c8 Andrea Arcangeli   2017-02-22   62  	 * The pmd points to a=
 regular pte so the pmd can't change
c1e8d7c6a7a682e Michel Lespinasse  2020-06-08   63  	 * from under us even =
if the mmap_lock is only hold for
175ad4f1e7a29c8 Andrea Arcangeli   2017-02-22   64  	 * reading.
175ad4f1e7a29c8 Andrea Arcangeli   2017-02-22   65  	 */
175ad4f1e7a29c8 Andrea Arcangeli   2017-02-22   66  	pte =3D pte_offset_map=
_lock(vma->vm_mm, pmd, addr, &ptl);
1ad9f620c3a22fa Mel Gorman         2014-04-07   67  =

3e32158767b04db Andi Kleen         2016-12-12   68  	/* Get target node for=
 single threaded private VMAs */
3e32158767b04db Andi Kleen         2016-12-12   69  	if (prot_numa && !(vma=
->vm_flags & VM_SHARED) &&
3e32158767b04db Andi Kleen         2016-12-12   70  	    atomic_read(&vma->=
vm_mm->mm_users) =3D=3D 1)
3e32158767b04db Andi Kleen         2016-12-12   71  		target_node =3D numa_=
node_id();
3e32158767b04db Andi Kleen         2016-12-12   72  =

3ea277194daaeaa Mel Gorman         2017-08-02   73  	flush_tlb_batched_pend=
ing(vma->vm_mm);
6606c3e0da53607 Zachary Amsden     2006-09-30   74  	arch_enter_lazy_mmu_mo=
de();
^1da177e4c3f415 Linus Torvalds     2005-04-16   75  	do {
0697212a411c1da Christoph Lameter  2006-06-23   76  		oldpte =3D *pte;
0697212a411c1da Christoph Lameter  2006-06-23   77  		if (pte_present(oldpt=
e)) {
^1da177e4c3f415 Linus Torvalds     2005-04-16   78  			pte_t ptent;
b191f9b106ea1a2 Mel Gorman         2015-03-25   79  			bool preserve_write =
=3D prot_numa && pte_write(oldpte);
^1da177e4c3f415 Linus Torvalds     2005-04-16   80  =

e944fd67b625c02 Mel Gorman         2015-02-12   81  			/*
e944fd67b625c02 Mel Gorman         2015-02-12   82  			 * Avoid trapping fa=
ults against the zero or KSM
e944fd67b625c02 Mel Gorman         2015-02-12   83  			 * pages. See simila=
r comment in change_huge_pmd.
e944fd67b625c02 Mel Gorman         2015-02-12   84  			 */
e944fd67b625c02 Mel Gorman         2015-02-12   85  			if (prot_numa) {
e944fd67b625c02 Mel Gorman         2015-02-12   86  				struct page *page;
53c1d73ddb39cc1 Huang Ying         2019-06-12   87  				int nid;
e944fd67b625c02 Mel Gorman         2015-02-12   88  =

a818f5363a0eba0 Huang Ying         2019-11-30   89  				/* Avoid TLB flush =
if possible */
a818f5363a0eba0 Huang Ying         2019-11-30   90  				if (pte_protnone(ol=
dpte))
a818f5363a0eba0 Huang Ying         2019-11-30   91  					continue;
a818f5363a0eba0 Huang Ying         2019-11-30   92  =

e944fd67b625c02 Mel Gorman         2015-02-12   93  				page =3D vm_normal_=
page(vma, addr, oldpte);
e944fd67b625c02 Mel Gorman         2015-02-12   94  				if (!page || PageKs=
m(page))
e944fd67b625c02 Mel Gorman         2015-02-12   95  					continue;
10c1045f28e86ac Mel Gorman         2015-02-12   96  =

859d4adc3415a64 Henry Willard      2018-01-31   97  				/* Also skip shared=
 copy-on-write pages */
859d4adc3415a64 Henry Willard      2018-01-31   98  				if (is_cow_mapping(=
vma->vm_flags) &&
859d4adc3415a64 Henry Willard      2018-01-31   99  				    page_mapcount(p=
age) !=3D 1)
859d4adc3415a64 Henry Willard      2018-01-31  100  					continue;
859d4adc3415a64 Henry Willard      2018-01-31  101  =

09a913a7a947fb6 Mel Gorman         2018-04-10  102  				/*
09a913a7a947fb6 Mel Gorman         2018-04-10  103  				 * While migration =
can move some dirty pages,
09a913a7a947fb6 Mel Gorman         2018-04-10  104  				 * it cannot move t=
hem all from MIGRATE_ASYNC
09a913a7a947fb6 Mel Gorman         2018-04-10  105  				 * context.
09a913a7a947fb6 Mel Gorman         2018-04-10  106  				 */
9de4f22a60f7319 Huang Ying         2020-04-06  107  				if (page_is_file_lr=
u(page) && PageDirty(page))
09a913a7a947fb6 Mel Gorman         2018-04-10  108  					continue;
09a913a7a947fb6 Mel Gorman         2018-04-10  109  =

3e32158767b04db Andi Kleen         2016-12-12  110  				/*
3e32158767b04db Andi Kleen         2016-12-12  111  				 * Don't mess with =
PTEs if page is already on the node
3e32158767b04db Andi Kleen         2016-12-12  112  				 * a single-threade=
d process is running on.
3e32158767b04db Andi Kleen         2016-12-12  113  				 */
53c1d73ddb39cc1 Huang Ying         2019-06-12  114  				nid =3D page_to_nid=
(page);
53c1d73ddb39cc1 Huang Ying         2019-06-12  115  				if (target_node =3D=
=3D nid)
53c1d73ddb39cc1 Huang Ying         2019-06-12  116  					continue;
53c1d73ddb39cc1 Huang Ying         2019-06-12  117  =

53c1d73ddb39cc1 Huang Ying         2019-06-12  118  				/*
53c1d73ddb39cc1 Huang Ying         2019-06-12  119  				 * Skip scanning to=
p tier node if normal numa
53c1d73ddb39cc1 Huang Ying         2019-06-12  120  				 * balancing is dis=
abled
53c1d73ddb39cc1 Huang Ying         2019-06-12  121  				 */
53c1d73ddb39cc1 Huang Ying         2019-06-12 @122  				if (!(sysctl_numa_b=
alancing_mode & NUMA_BALANCING_NORMAL) &&
53c1d73ddb39cc1 Huang Ying         2019-06-12  123  				    node_is_toptier=
(nid))
3e32158767b04db Andi Kleen         2016-12-12  124  					continue;
e944fd67b625c02 Mel Gorman         2015-02-12  125  			}
e944fd67b625c02 Mel Gorman         2015-02-12  126  =

04a8645304500be Aneesh Kumar K.V   2019-03-05  127  			oldpte =3D ptep_modi=
fy_prot_start(vma, addr, pte);
04a8645304500be Aneesh Kumar K.V   2019-03-05  128  			ptent =3D pte_modify=
(oldpte, newprot);
b191f9b106ea1a2 Mel Gorman         2015-03-25  129  			if (preserve_write)
288bc54949fc262 Aneesh Kumar K.V   2017-02-24  130  				ptent =3D pte_mk_sa=
vedwrite(ptent);
8a0516ed8b90c95 Mel Gorman         2015-02-12  131  =

292924b26024748 Peter Xu           2020-04-06  132  			if (uffd_wp) {
292924b26024748 Peter Xu           2020-04-06  133  				ptent =3D pte_wrpro=
tect(ptent);
292924b26024748 Peter Xu           2020-04-06  134  				ptent =3D pte_mkuff=
d_wp(ptent);
292924b26024748 Peter Xu           2020-04-06  135  			} else if (uffd_wp_r=
esolve) {
292924b26024748 Peter Xu           2020-04-06  136  				/*
292924b26024748 Peter Xu           2020-04-06  137  				 * Leave the write =
bit to be handled
292924b26024748 Peter Xu           2020-04-06  138  				 * by PF interrupt =
handler, then
292924b26024748 Peter Xu           2020-04-06  139  				 * things like COW =
could be properly
292924b26024748 Peter Xu           2020-04-06  140  				 * handled.
292924b26024748 Peter Xu           2020-04-06  141  				 */
292924b26024748 Peter Xu           2020-04-06  142  				ptent =3D pte_clear=
_uffd_wp(ptent);
292924b26024748 Peter Xu           2020-04-06  143  			}
292924b26024748 Peter Xu           2020-04-06  144  =

8a0516ed8b90c95 Mel Gorman         2015-02-12  145  			/* Avoid taking writ=
e faults for known dirty pages */
64e455079e1bd77 Peter Feiner       2014-10-13  146  			if (dirty_accountabl=
e && pte_dirty(ptent) &&
64e455079e1bd77 Peter Feiner       2014-10-13  147  					(pte_soft_dirty(pt=
ent) ||
8a0516ed8b90c95 Mel Gorman         2015-02-12  148  					 !(vma->vm_flags &=
 VM_SOFTDIRTY))) {
9d85d5863fa4818 Aneesh Kumar K.V   2014-02-12  149  				ptent =3D pte_mkwri=
te(ptent);
4b10e7d562c90d0 Mel Gorman         2012-10-25  150  			}
04a8645304500be Aneesh Kumar K.V   2019-03-05  151  			ptep_modify_prot_com=
mit(vma, addr, pte, oldpte, ptent);
7da4d641c58d201 Peter Zijlstra     2012-11-19  152  			pages++;
f45ec5ff16a75f9 Peter Xu           2020-04-06  153  		} else if (is_swap_pt=
e(oldpte)) {
0697212a411c1da Christoph Lameter  2006-06-23  154  			swp_entry_t entry =
=3D pte_to_swp_entry(oldpte);
f45ec5ff16a75f9 Peter Xu           2020-04-06  155  			pte_t newpte;
0697212a411c1da Christoph Lameter  2006-06-23  156  =

4dd845b5a3e57ad Alistair Popple    2021-06-30  157  			if (is_writable_migr=
ation_entry(entry)) {
0697212a411c1da Christoph Lameter  2006-06-23  158  				/*
0697212a411c1da Christoph Lameter  2006-06-23  159  				 * A protection che=
ck is difficult so
0697212a411c1da Christoph Lameter  2006-06-23  160  				 * just be safe and=
 disable write
0697212a411c1da Christoph Lameter  2006-06-23  161  				 */
4dd845b5a3e57ad Alistair Popple    2021-06-30  162  				entry =3D make_read=
able_migration_entry(
4dd845b5a3e57ad Alistair Popple    2021-06-30  163  							swp_offset(entry=
));
c3d16e16522fe3f Cyrill Gorcunov    2013-10-16  164  				newpte =3D swp_entr=
y_to_pte(entry);
c3d16e16522fe3f Cyrill Gorcunov    2013-10-16  165  				if (pte_swp_soft_di=
rty(oldpte))
c3d16e16522fe3f Cyrill Gorcunov    2013-10-16  166  					newpte =3D pte_swp=
_mksoft_dirty(newpte);
f45ec5ff16a75f9 Peter Xu           2020-04-06  167  				if (pte_swp_uffd_wp=
(oldpte))
f45ec5ff16a75f9 Peter Xu           2020-04-06  168  					newpte =3D pte_swp=
_mkuffd_wp(newpte);
4dd845b5a3e57ad Alistair Popple    2021-06-30  169  			} else if (is_writab=
le_device_private_entry(entry)) {
5042db43cc26f51 J=C3=A9r=C3=B4me Glisse      2017-09-08  170  				/*
5042db43cc26f51 J=C3=A9r=C3=B4me Glisse      2017-09-08  171  				 * We do =
not preserve soft-dirtiness. See
5042db43cc26f51 J=C3=A9r=C3=B4me Glisse      2017-09-08  172  				 * copy_o=
ne_pte() for explanation.
5042db43cc26f51 J=C3=A9r=C3=B4me Glisse      2017-09-08  173  				 */
4dd845b5a3e57ad Alistair Popple    2021-06-30  174  				entry =3D make_read=
able_device_private_entry(
4dd845b5a3e57ad Alistair Popple    2021-06-30  175  							swp_offset(entry=
));
5042db43cc26f51 J=C3=A9r=C3=B4me Glisse      2017-09-08  176  				newpte =
=3D swp_entry_to_pte(entry);
f45ec5ff16a75f9 Peter Xu           2020-04-06  177  				if (pte_swp_uffd_wp=
(oldpte))
f45ec5ff16a75f9 Peter Xu           2020-04-06  178  					newpte =3D pte_swp=
_mkuffd_wp(newpte);
b756a3b5e7ead8f Alistair Popple    2021-06-30  179  			} else if (is_writab=
le_device_exclusive_entry(entry)) {
b756a3b5e7ead8f Alistair Popple    2021-06-30  180  				entry =3D make_read=
able_device_exclusive_entry(
b756a3b5e7ead8f Alistair Popple    2021-06-30  181  							swp_offset(entry=
));
b756a3b5e7ead8f Alistair Popple    2021-06-30  182  				newpte =3D swp_entr=
y_to_pte(entry);
b756a3b5e7ead8f Alistair Popple    2021-06-30  183  				if (pte_swp_soft_di=
rty(oldpte))
b756a3b5e7ead8f Alistair Popple    2021-06-30  184  					newpte =3D pte_swp=
_mksoft_dirty(newpte);
b756a3b5e7ead8f Alistair Popple    2021-06-30  185  				if (pte_swp_uffd_wp=
(oldpte))
b756a3b5e7ead8f Alistair Popple    2021-06-30  186  					newpte =3D pte_swp=
_mkuffd_wp(newpte);
f45ec5ff16a75f9 Peter Xu           2020-04-06  187  			} else {
f45ec5ff16a75f9 Peter Xu           2020-04-06  188  				newpte =3D oldpte;
f45ec5ff16a75f9 Peter Xu           2020-04-06  189  			}
f45ec5ff16a75f9 Peter Xu           2020-04-06  190  =

f45ec5ff16a75f9 Peter Xu           2020-04-06  191  			if (uffd_wp)
f45ec5ff16a75f9 Peter Xu           2020-04-06  192  				newpte =3D pte_swp_=
mkuffd_wp(newpte);
f45ec5ff16a75f9 Peter Xu           2020-04-06  193  			else if (uffd_wp_res=
olve)
f45ec5ff16a75f9 Peter Xu           2020-04-06  194  				newpte =3D pte_swp_=
clear_uffd_wp(newpte);
5042db43cc26f51 J=C3=A9r=C3=B4me Glisse      2017-09-08  195  =

f45ec5ff16a75f9 Peter Xu           2020-04-06  196  			if (!pte_same(oldpte=
, newpte)) {
f45ec5ff16a75f9 Peter Xu           2020-04-06  197  				set_pte_at(vma->vm_=
mm, addr, pte, newpte);
5042db43cc26f51 J=C3=A9r=C3=B4me Glisse      2017-09-08  198  				pages++;
5042db43cc26f51 J=C3=A9r=C3=B4me Glisse      2017-09-08  199  			}
e920e14ca29b0b2 Mel Gorman         2013-10-07  200  		}
^1da177e4c3f415 Linus Torvalds     2005-04-16  201  	} while (pte++, addr +=
=3D PAGE_SIZE, addr !=3D end);
6606c3e0da53607 Zachary Amsden     2006-09-30  202  	arch_leave_lazy_mmu_mo=
de();
705e87c0c3c3842 Hugh Dickins       2005-10-29  203  	pte_unmap_unlock(pte -=
 1, ptl);
7da4d641c58d201 Peter Zijlstra     2012-11-19  204  =

7da4d641c58d201 Peter Zijlstra     2012-11-19  205  	return pages;
^1da177e4c3f415 Linus Torvalds     2005-04-16  206  }
^1da177e4c3f415 Linus Torvalds     2005-04-16  207  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7399443321786696217==--

