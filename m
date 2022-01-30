Content-Type: multipart/mixed; boundary="===============1922812296517371268=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 18/35] mm: implement speculative handling in do_anonymous_page()
Date: Mon, 31 Jan 2022 02:03:50 +0800
Message-ID: <202201310126.IymdD4Vv-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1922812296517371268==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220128131006.67712-19-michel@lespinasse.org>
References: <20220128131006.67712-19-michel@lespinasse.org>
TO: Michel Lespinasse <michel@lespinasse.org>
TO: "Linux-MM" <linux-mm@kvack.org>
TO: linux-kernel(a)vger.kernel.org
TO: Andrew Morton <akpm@linux-foundation.org>
CC: kernel-team(a)fb.com
CC: Laurent Dufour <ldufour@linux.ibm.com>
CC: Jerome Glisse <jglisse@google.com>
CC: Peter Zijlstra <peterz@infradead.org>
CC: Michal Hocko <mhocko@suse.com>
CC: Vlastimil Babka <vbabka@suse.cz>
CC: Davidlohr Bueso <dave@stgolabs.net>

Hi Michel,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v5.17-rc1 next-20220128]
[cannot apply to tip/x86/mm arm64/for-next/core powerpc/next hnaz-mm/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Michel-Lespinasse/Speculat=
ive-page-faults/20220128-212122
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
145d9b498fc827b79c1260b4caa29a8e59d4c2b9
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-c007-20220124 (https://download.01.org/0day-ci/ar=
chive/20220131/202201310126.IymdD4Vv-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 33b45e=
e44b1f32ffdbc995e6fec806271b4b3ba4)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/fa5331bae2e49ce86eff95939=
0b451b7401f9156
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Michel-Lespinasse/Speculative-page=
-faults/20220128-212122
        git checkout fa5331bae2e49ce86eff959390b451b7401f9156
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                       ^~~~~~~~~~~~~~
   mm/memory.c:2576:22: note: Left side of '&&' is false
                   if (pmd_none(*pmd) && !create)
                                      ^
   mm/memory.c:2578:7: note: Assuming the condition is true
                   if (WARN_ON_ONCE(pmd_leaf(*pmd)))
                       ^
   include/asm-generic/bug.h:104:23: note: expanded from macro 'WARN_ON_ONC=
E'
           int __ret_warn_on =3D !!(condition);                      \
                                ^~~~~~~~~~~~
   mm/memory.c:2578:7: note: Taking false branch
                   if (WARN_ON_ONCE(pmd_leaf(*pmd)))
                       ^
   include/asm-generic/bug.h:105:2: note: expanded from macro 'WARN_ON_ONCE'
           if (unlikely(__ret_warn_on))                            \
           ^
   mm/memory.c:2578:3: note: Taking false branch
                   if (WARN_ON_ONCE(pmd_leaf(*pmd)))
                   ^
   mm/memory.c:2580:8: note: Calling 'pmd_none'
                   if (!pmd_none(*pmd) && WARN_ON_ONCE(pmd_bad(*pmd))) {
                        ^~~~~~~~~~~~~~
   arch/x86/include/asm/pgtable.h:797:2: note: Returning zero, which partic=
ipates in a condition later
           return (val & ~_PAGE_KNL_ERRATUM_MASK) =3D=3D 0;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/memory.c:2580:8: note: Returning from 'pmd_none'
                   if (!pmd_none(*pmd) && WARN_ON_ONCE(pmd_bad(*pmd))) {
                        ^~~~~~~~~~~~~~
   mm/memory.c:2580:7: note: Left side of '&&' is true
                   if (!pmd_none(*pmd) && WARN_ON_ONCE(pmd_bad(*pmd))) {
                       ^
   mm/memory.c:2580:26: note: Taking false branch
                   if (!pmd_none(*pmd) && WARN_ON_ONCE(pmd_bad(*pmd))) {
                                          ^
   include/asm-generic/bug.h:105:2: note: expanded from macro 'WARN_ON_ONCE'
           if (unlikely(__ret_warn_on))                            \
           ^
   mm/memory.c:2580:3: note: Taking false branch
                   if (!pmd_none(*pmd) && WARN_ON_ONCE(pmd_bad(*pmd))) {
                   ^
   mm/memory.c:2585:9: note: Calling 'apply_to_pte_range'
                   err =3D apply_to_pte_range(mm, pmd, addr, next,
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/memory.c:2520:2: note: 'ptl' declared without an initial value
           spinlock_t *ptl;
           ^~~~~~~~~~~~~~~
   mm/memory.c:2522:6: note: 'create' is false
           if (create) {
               ^~~~~~
   mm/memory.c:2522:2: note: Taking false branch
           if (create) {
           ^
   mm/memory.c:2529:23: note: Assuming the condition is true
                   mapped_pte =3D pte =3D (mm =3D=3D &init_mm) ?
                                       ^~~~~~~~~~~~~~
   mm/memory.c:2529:22: note: '?' condition is true
                   mapped_pte =3D pte =3D (mm =3D=3D &init_mm) ?
                                      ^
   mm/memory.c:2534:2: note: Taking false branch
           BUG_ON(pmd_huge(*pmd));
           ^
   include/asm-generic/bug.h:65:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                  ^
   mm/memory.c:2534:2: note: Loop condition is false.  Exiting loop
           BUG_ON(pmd_huge(*pmd));
           ^
   include/asm-generic/bug.h:65:27: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                             ^
   mm/memory.c:2536:2: note: Loop condition is false.  Exiting loop
           arch_enter_lazy_mmu_mode();
           ^
   include/linux/pgtable.h:985:36: note: expanded from macro 'arch_enter_la=
zy_mmu_mode'
   #define arch_enter_lazy_mmu_mode()      do {} while (0)
                                           ^
   mm/memory.c:2538:6: note: Assuming 'fn' is null
           if (fn) {
               ^~
   mm/memory.c:2538:2: note: Taking false branch
           if (fn) {
           ^
   mm/memory.c:2549:2: note: Loop condition is false.  Exiting loop
           arch_leave_lazy_mmu_mode();
           ^
   include/linux/pgtable.h:986:36: note: expanded from macro 'arch_leave_la=
zy_mmu_mode'
   #define arch_leave_lazy_mmu_mode()      do {} while (0)
                                           ^
   mm/memory.c:2551:6: note: Assuming the condition is true
           if (mm !=3D &init_mm)
               ^~~~~~~~~~~~~~
   mm/memory.c:2551:2: note: Taking true branch
           if (mm !=3D &init_mm)
           ^
   mm/memory.c:2552:3: note: 1st function call argument is an uninitialized=
 value
                   pte_unmap_unlock(mapped_pte, ptl);
                   ^
   include/linux/mm.h:2357:2: note: expanded from macro 'pte_unmap_unlock'
           spin_unlock(ptl);                               \
           ^           ~~~
>> mm/memory.c:3876:7: warning: Assigned value is garbage or undefined [cla=
ng-analyzer-core.uninitialized.Assign]
           if (!pte_map_lock(vmf)) {
                ^
   include/linux/mm.h:3418:2: note: expanded from macro 'pte_map_lock'
           struct vm_fault *vmf =3D __vmf;                                 =
  \
           ^
   mm/memory.c:4940:6: note: Assuming the condition is false
           if (flags & FAULT_FLAG_SPECULATIVE)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/memory.c:4940:2: note: Taking false branch
           if (flags & FAULT_FLAG_SPECULATIVE)
           ^
   mm/memory.c:4943:2: note: Taking false branch
           __set_current_state(TASK_RUNNING);
           ^
   include/linux/sched.h:204:3: note: expanded from macro '__set_current_st=
ate'
                   debug_normal_state_change((state_value));               \
                   ^
   include/linux/sched.h:137:3: note: expanded from macro 'debug_normal_sta=
te_change'
                   WARN_ON_ONCE(is_special_task_state(state_value));       \
                   ^
   include/asm-generic/bug.h:105:2: note: expanded from macro 'WARN_ON_ONCE'
           if (unlikely(__ret_warn_on))                            \
           ^
   mm/memory.c:4943:2: note: Loop condition is false.  Exiting loop
           __set_current_state(TASK_RUNNING);
           ^
   include/linux/sched.h:204:3: note: expanded from macro '__set_current_st=
ate'
                   debug_normal_state_change((state_value));               \
                   ^
   include/linux/sched.h:136:2: note: expanded from macro 'debug_normal_sta=
te_change'
           do {                                                            \
           ^
   mm/memory.c:4943:2: note: Left side of '||' is false
           __set_current_state(TASK_RUNNING);
           ^
   include/linux/sched.h:205:3: note: expanded from macro '__set_current_st=
ate'
                   WRITE_ONCE(current->__state, (state_value));            \
                   ^
   include/asm-generic/rwonce.h:60:2: note: expanded from macro 'WRITE_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:313:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   mm/memory.c:4943:2: note: Left side of '||' is false
           __set_current_state(TASK_RUNNING);
           ^
   include/linux/sched.h:205:3: note: expanded from macro '__set_current_st=
ate'
                   WRITE_ONCE(current->__state, (state_value));            \
                   ^
   include/asm-generic/rwonce.h:60:2: note: expanded from macro 'WRITE_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:313:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   mm/memory.c:4943:2: note: Left side of '||' is true
           __set_current_state(TASK_RUNNING);
           ^
   include/linux/sched.h:205:3: note: expanded from macro '__set_current_st=
ate'
                   WRITE_ONCE(current->__state, (state_value));            \
                   ^
   include/asm-generic/rwonce.h:60:2: note: expanded from macro 'WRITE_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:314:28: note: expanded from macro '__nati=
ve_word'
            sizeof(t) =3D=3D sizeof(int) || sizeof(t) =3D=3D sizeof(long))
                                     ^
   mm/memory.c:4943:2: note: Taking false branch
           __set_current_state(TASK_RUNNING);
           ^
   include/linux/sched.h:205:3: note: expanded from macro '__set_current_st=
ate'
                   WRITE_ONCE(current->__state, (state_value));            \
                   ^
   include/asm-generic/rwonce.h:60:2: note: expanded from macro 'WRITE_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletim=
e_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
           ^
   include/linux/compiler_types.h:346:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:334:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:326:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   mm/memory.c:4943:2: note: Loop condition is false.  Exiting loop
           __set_current_state(TASK_RUNNING);

vim +3876 mm/memory.c

^1da177e4c3f41 Linus Torvalds          2005-04-16  3808  =

^1da177e4c3f41 Linus Torvalds          2005-04-16  3809  /*
c1e8d7c6a7a682 Michel Lespinasse       2020-06-08  3810   * We enter with n=
on-exclusive mmap_lock (to exclude vma changes,
8f4e2101fd7df9 Hugh Dickins            2005-10-29  3811   * but allow concu=
rrent faults), and pte mapped but not yet locked.
c1e8d7c6a7a682 Michel Lespinasse       2020-06-08  3812   * We return with =
mmap_lock still held, but pte unmapped and unlocked.
^1da177e4c3f41 Linus Torvalds          2005-04-16  3813   */
2b7403035459c7 Souptick Joarder        2018-08-23  3814  static vm_fault_t =
do_anonymous_page(struct vm_fault *vmf)
^1da177e4c3f41 Linus Torvalds          2005-04-16  3815  {
82b0f8c39a3869 Jan Kara                2016-12-14  3816  	struct vm_area_st=
ruct *vma =3D vmf->vma;
e2bf0c1a3180a3 Michel Lespinasse       2022-01-28  3817  	struct page *page=
 =3D NULL;
2b7403035459c7 Souptick Joarder        2018-08-23  3818  	vm_fault_t ret =
=3D 0;
^1da177e4c3f41 Linus Torvalds          2005-04-16  3819  	pte_t entry;
^1da177e4c3f41 Linus Torvalds          2005-04-16  3820  =

6b7339f4c31ad6 Kirill A. Shutemov      2015-07-06  3821  	/* File mapping w=
ithout ->vm_ops ? */
6b7339f4c31ad6 Kirill A. Shutemov      2015-07-06  3822  	if (vma->vm_flags=
 & VM_SHARED)
6b7339f4c31ad6 Kirill A. Shutemov      2015-07-06  3823  		return VM_FAULT_=
SIGBUS;
6b7339f4c31ad6 Kirill A. Shutemov      2015-07-06  3824  =

7267ec008b5cd8 Kirill A. Shutemov      2016-07-26  3825  	/*
7267ec008b5cd8 Kirill A. Shutemov      2016-07-26  3826  	 * Use pte_alloc(=
) instead of pte_alloc_map().  We can't run
7267ec008b5cd8 Kirill A. Shutemov      2016-07-26  3827  	 * pte_offset_map=
() on pmds where a huge pmd might be created
7267ec008b5cd8 Kirill A. Shutemov      2016-07-26  3828  	 * from a differe=
nt thread.
7267ec008b5cd8 Kirill A. Shutemov      2016-07-26  3829  	 *
3e4e28c5a8f01e Michel Lespinasse       2020-06-08  3830  	 * pte_alloc_map(=
) is safe to use under mmap_write_lock(mm) or when
7267ec008b5cd8 Kirill A. Shutemov      2016-07-26  3831  	 * parallel threa=
ds are excluded by other means.
7267ec008b5cd8 Kirill A. Shutemov      2016-07-26  3832  	 *
3e4e28c5a8f01e Michel Lespinasse       2020-06-08  3833  	 * Here we only h=
ave mmap_read_lock(mm).
7267ec008b5cd8 Kirill A. Shutemov      2016-07-26  3834  	 */
4cf58924951ef8 Joel Fernandes (Google  2019-01-03  3835) 	if (pte_alloc(vma=
->vm_mm, vmf->pmd))
7267ec008b5cd8 Kirill A. Shutemov      2016-07-26  3836  		return VM_FAULT_=
OOM;
7267ec008b5cd8 Kirill A. Shutemov      2016-07-26  3837  =

2fce3f44868d85 Michel Lespinasse       2022-01-28  3838  	/* See comment in=
 __handle_mm_fault() */
82b0f8c39a3869 Jan Kara                2016-12-14  3839  	if (unlikely(pmd_=
trans_unstable(vmf->pmd)))
7267ec008b5cd8 Kirill A. Shutemov      2016-07-26  3840  		return 0;
7267ec008b5cd8 Kirill A. Shutemov      2016-07-26  3841  =

11ac552477e328 Linus Torvalds          2010-08-14  3842  	/* Use the zero-p=
age for reads */
82b0f8c39a3869 Jan Kara                2016-12-14  3843  	if (!(vmf->flags =
& FAULT_FLAG_WRITE) &&
bae473a423f65e Kirill A. Shutemov      2016-07-26  3844  			!mm_forbids_zer=
opage(vma->vm_mm)) {
82b0f8c39a3869 Jan Kara                2016-12-14  3845  		entry =3D pte_mk=
special(pfn_pte(my_zero_pfn(vmf->address),
62eede62dafb4a Hugh Dickins            2009-09-21  3846  						vma->vm_page=
_prot));
e2bf0c1a3180a3 Michel Lespinasse       2022-01-28  3847  	} else {
^1da177e4c3f41 Linus Torvalds          2005-04-16  3848  		/* Allocate our =
own private page. */
fa5331bae2e49c Michel Lespinasse       2022-01-28  3849  		if (unlikely(!vm=
a->anon_vma)) {
fa5331bae2e49c Michel Lespinasse       2022-01-28  3850  			if (vmf->flags =
& FAULT_FLAG_SPECULATIVE)
fa5331bae2e49c Michel Lespinasse       2022-01-28  3851  				return VM_FAUL=
T_RETRY;
fa5331bae2e49c Michel Lespinasse       2022-01-28  3852  			if (__anon_vma_=
prepare(vma))
65500d234e74fc Hugh Dickins            2005-10-29  3853  				goto oom;
fa5331bae2e49c Michel Lespinasse       2022-01-28  3854  		}
82b0f8c39a3869 Jan Kara                2016-12-14  3855  		page =3D alloc_z=
eroed_user_highpage_movable(vma, vmf->address);
^1da177e4c3f41 Linus Torvalds          2005-04-16  3856  		if (!page)
65500d234e74fc Hugh Dickins            2005-10-29  3857  			goto oom;
eb3c24f305e56c Mel Gorman              2015-06-24  3858  =

8f425e4ed0eb3e Matthew Wilcox (Oracle  2021-06-25  3859) 		if (mem_cgroup_c=
harge(page_folio(page), vma->vm_mm, GFP_KERNEL))
eb3c24f305e56c Mel Gorman              2015-06-24  3860  			goto oom_free_p=
age;
9d82c69438d0df Johannes Weiner         2020-06-03  3861  		cgroup_throttle_=
swaprate(page, GFP_KERNEL);
eb3c24f305e56c Mel Gorman              2015-06-24  3862  =

52f37629fd3c7b Minchan Kim             2013-04-29  3863  		/*
52f37629fd3c7b Minchan Kim             2013-04-29  3864  		 * The memory ba=
rrier inside __SetPageUptodate makes sure that
f4f5329d453704 Wei Yang                2019-11-30  3865  		 * preceding sto=
res to the page contents become visible before
52f37629fd3c7b Minchan Kim             2013-04-29  3866  		 * the set_pte_a=
t() write.
52f37629fd3c7b Minchan Kim             2013-04-29  3867  		 */
0ed361dec36945 Nicholas Piggin         2008-02-04  3868  		__SetPageUptodat=
e(page);
^1da177e4c3f41 Linus Torvalds          2005-04-16  3869  =

65500d234e74fc Hugh Dickins            2005-10-29  3870  		entry =3D mk_pte=
(page, vma->vm_page_prot);
50c25ee97cf6ab Thomas Bogendoerfer     2021-06-04  3871  		entry =3D pte_sw=
_mkyoung(entry);
1ac0cb5d0e22d5 Hugh Dickins            2009-09-21  3872  		if (vma->vm_flag=
s & VM_WRITE)
1ac0cb5d0e22d5 Hugh Dickins            2009-09-21  3873  			entry =3D pte_m=
kwrite(pte_mkdirty(entry));
e2bf0c1a3180a3 Michel Lespinasse       2022-01-28  3874  	}
8f4e2101fd7df9 Hugh Dickins            2005-10-29  3875  =

fa5331bae2e49c Michel Lespinasse       2022-01-28 @3876  	if (!pte_map_lock=
(vmf)) {
fa5331bae2e49c Michel Lespinasse       2022-01-28  3877  		ret =3D VM_FAULT=
_RETRY;
fa5331bae2e49c Michel Lespinasse       2022-01-28  3878  		goto release;
fa5331bae2e49c Michel Lespinasse       2022-01-28  3879  	}
7df676974359f9 Bibo Mao                2020-05-27  3880  	if (!pte_none(*vm=
f->pte)) {
45ee1834760b3b Michel Lespinasse       2022-01-28  3881  		update_mmu_tlb(v=
ma, vmf->address, vmf->pte);
e2bf0c1a3180a3 Michel Lespinasse       2022-01-28  3882  		goto unlock;
7df676974359f9 Bibo Mao                2020-05-27  3883  	}
9ba6929480088a Hugh Dickins            2009-09-21  3884  =

6b31d5955cb29a Michal Hocko            2017-08-18  3885  	ret =3D check_sta=
ble_address_space(vma->vm_mm);
6b31d5955cb29a Michal Hocko            2017-08-18  3886  	if (ret)
e2bf0c1a3180a3 Michel Lespinasse       2022-01-28  3887  		goto unlock;
6b31d5955cb29a Michal Hocko            2017-08-18  3888  =

6b251fc96cf2cd Andrea Arcangeli        2015-09-04  3889  	/* Deliver the pa=
ge fault to userland, check inside PT lock */
6b251fc96cf2cd Andrea Arcangeli        2015-09-04  3890  	if (userfaultfd_m=
issing(vma)) {
82b0f8c39a3869 Jan Kara                2016-12-14  3891  		pte_unmap_unlock=
(vmf->pte, vmf->ptl);
e2bf0c1a3180a3 Michel Lespinasse       2022-01-28  3892  		if (page)
09cbfeaf1a5a67 Kirill A. Shutemov      2016-04-01  3893  			put_page(page);
fa5331bae2e49c Michel Lespinasse       2022-01-28  3894  		if (vmf->flags &=
 FAULT_FLAG_SPECULATIVE)
fa5331bae2e49c Michel Lespinasse       2022-01-28  3895  			return VM_FAULT=
_RETRY;
82b0f8c39a3869 Jan Kara                2016-12-14  3896  		return handle_us=
erfault(vmf, VM_UFFD_MISSING);
6b251fc96cf2cd Andrea Arcangeli        2015-09-04  3897  	}
6b251fc96cf2cd Andrea Arcangeli        2015-09-04  3898  =

e2bf0c1a3180a3 Michel Lespinasse       2022-01-28  3899  	if (page) {
bae473a423f65e Kirill A. Shutemov      2016-07-26  3900  		inc_mm_counter_f=
ast(vma->vm_mm, MM_ANONPAGES);
82b0f8c39a3869 Jan Kara                2016-12-14  3901  		page_add_new_ano=
n_rmap(page, vma, vmf->address, false);
b518154e59aab3 Joonsoo Kim             2020-08-11  3902  		lru_cache_add_in=
active_or_unevictable(page, vma);
e2bf0c1a3180a3 Michel Lespinasse       2022-01-28  3903  	}
e2bf0c1a3180a3 Michel Lespinasse       2022-01-28  3904  =

82b0f8c39a3869 Jan Kara                2016-12-14  3905  	set_pte_at(vma->v=
m_mm, vmf->address, vmf->pte, entry);
^1da177e4c3f41 Linus Torvalds          2005-04-16  3906  =

^1da177e4c3f41 Linus Torvalds          2005-04-16  3907  	/* No need to inv=
alidate - it was non-present before */
82b0f8c39a3869 Jan Kara                2016-12-14  3908  	update_mmu_cache(=
vma, vmf->address, vmf->pte);
e2bf0c1a3180a3 Michel Lespinasse       2022-01-28  3909  	pte_unmap_unlock(=
vmf->pte, vmf->ptl);
e2bf0c1a3180a3 Michel Lespinasse       2022-01-28  3910  	return 0;
65500d234e74fc Hugh Dickins            2005-10-29  3911  unlock:
82b0f8c39a3869 Jan Kara                2016-12-14  3912  	pte_unmap_unlock(=
vmf->pte, vmf->ptl);
fa5331bae2e49c Michel Lespinasse       2022-01-28  3913  release:
e2bf0c1a3180a3 Michel Lespinasse       2022-01-28  3914  	if (page)
09cbfeaf1a5a67 Kirill A. Shutemov      2016-04-01  3915  		put_page(page);
e2bf0c1a3180a3 Michel Lespinasse       2022-01-28  3916  	return ret;
8a9f3ccd24741b Balbir Singh            2008-02-07  3917  oom_free_page:
09cbfeaf1a5a67 Kirill A. Shutemov      2016-04-01  3918  	put_page(page);
65500d234e74fc Hugh Dickins            2005-10-29  3919  oom:
^1da177e4c3f41 Linus Torvalds          2005-04-16  3920  	return VM_FAULT_O=
OM;
^1da177e4c3f41 Linus Torvalds          2005-04-16  3921  }
^1da177e4c3f41 Linus Torvalds          2005-04-16  3922  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1922812296517371268==--

