Content-Type: multipart/mixed; boundary="===============7806243121523768700=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/x86/xen/mmu_pv.c:1521:3: warning: Value stored to 'pinned' is never read [clang-analyzer-deadcode.DeadStores]
Date: Wed, 11 May 2022 16:54:02 +0800
Message-ID: <202205111613.hPOB4972-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7806243121523768700==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Juergen Gross <jgross@suse.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   feb9c5e19e913b53cb536a7aa7c9f20107bb51ec
commit: 36c9b5929b7094ea19a78827c0ede20d2e0e6c9c xen: fix usage of pmd_popu=
late in mremap for pv guests
date:   8 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 8 months ago
config: x86_64-randconfig-c007-20220509 (https://download.01.org/0day-ci/ar=
chive/20220511/202205111613.hPOB4972-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a38564=
5b470e2d3a1534aae618ea56b31177639f)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D36c9b5929b7094ea19a78827c0ede20d2e0e6c9c
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 36c9b5929b7094ea19a78827c0ede20d2e0e6c9c
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                         ^       ~~~~~
   arch/x86/include/asm/xen/hypercall.h:261:9: warning: Assigned value is g=
arbage or undefined [clang-analyzer-core.uninitialized.Assign]
           return _hypercall4(int, mmu_update, req, count, success_count, d=
omid);
                  ^
   arch/x86/include/asm/xen/hypercall.h:191:2: note: expanded from macro '_=
hypercall4'
           __HYPERCALL_DECLS;                                              \
           ^
   arch/x86/include/asm/xen/hypercall.h:113:2: note: expanded from macro '_=
_HYPERCALL_DECLS'
           register unsigned long __arg1 asm(__HYPERCALL_ARG1REG) =3D __arg=
1; \
           ^
   arch/x86/xen/mmu_pv.c:1450:2: note: Calling '__xen_set_pte'
           __xen_set_pte(ptep, pte);
           ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/xen/mmu_pv.c:269:2: note: Taking true branch
           if (!xen_batched_set_pte(ptep, pteval)) {
           ^
   arch/x86/xen/mmu_pv.c:278:3: note: Calling 'HYPERVISOR_mmu_update'
                   HYPERVISOR_mmu_update(&u, 1, NULL, DOMID_SELF);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/xen/hypercall.h:261:9: note: Assigned value is garb=
age or undefined
           return _hypercall4(int, mmu_update, req, count, success_count, d=
omid);
                  ^
   arch/x86/include/asm/xen/hypercall.h:191:2: note: expanded from macro '_=
hypercall4'
           __HYPERCALL_DECLS;                                              \
           ^~~~~~~~~~~~~~~~~
   arch/x86/include/asm/xen/hypercall.h:113:2: note: expanded from macro '_=
_HYPERCALL_DECLS'
           register unsigned long __arg1 asm(__HYPERCALL_ARG1REG) =3D __arg=
1; \
           ^                                                        ~~~~~~
   arch/x86/include/asm/xen/hypercall.h:268:9: warning: Assigned value is g=
arbage or undefined [clang-analyzer-core.uninitialized.Assign]
           return _hypercall4(int, mmuext_op, op, count, success_count, dom=
id);
                  ^
   arch/x86/include/asm/xen/hypercall.h:191:2: note: expanded from macro '_=
hypercall4'
           __HYPERCALL_DECLS;                                              \
           ^
   arch/x86/include/asm/xen/hypercall.h:113:2: note: expanded from macro '_=
_HYPERCALL_DECLS'
           register unsigned long __arg1 asm(__HYPERCALL_ARG1REG) =3D __arg=
1; \
           ^
   arch/x86/xen/mmu_pv.c:1477:2: note: Calling 'pin_pagetable_pfn'
           pin_pagetable_pfn(MMUEXT_UNPIN_TABLE, pfn);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/xen/mmu_pv.c:993:6: note: Calling 'HYPERVISOR_mmuext_op'
           if (HYPERVISOR_mmuext_op(&op, 1, NULL, DOMID_SELF))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/xen/hypercall.h:268:9: note: Assigned value is garb=
age or undefined
           return _hypercall4(int, mmuext_op, op, count, success_count, dom=
id);
                  ^
   arch/x86/include/asm/xen/hypercall.h:191:2: note: expanded from macro '_=
hypercall4'
           __HYPERCALL_DECLS;                                              \
           ^~~~~~~~~~~~~~~~~
   arch/x86/include/asm/xen/hypercall.h:113:2: note: expanded from macro '_=
_HYPERCALL_DECLS'
           register unsigned long __arg1 asm(__HYPERCALL_ARG1REG) =3D __arg=
1; \
           ^                                                        ~~~~~~
   arch/x86/include/asm/xen/hypercall.h:334:9: warning: Assigned value is g=
arbage or undefined [clang-analyzer-core.uninitialized.Assign]
           return _hypercall2(long, memory_op, cmd, arg);
                  ^
   arch/x86/include/asm/xen/hypercall.h:169:2: note: expanded from macro '_=
hypercall2'
           __HYPERCALL_DECLS;                                              \
           ^
   arch/x86/include/asm/xen/hypercall.h:113:2: note: expanded from macro '_=
_HYPERCALL_DECLS'
           register unsigned long __arg1 asm(__HYPERCALL_ARG1REG) =3D __arg=
1; \
           ^
   arch/x86/xen/mmu_pv.c:1635:6: note: Calling 'HYPERVISOR_memory_op'
           if (HYPERVISOR_memory_op(XENMEM_machphys_mapping, &mapping) =3D=
=3D 0) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/xen/hypercall.h:334:9: note: Assigned value is garb=
age or undefined
           return _hypercall2(long, memory_op, cmd, arg);
                  ^
   arch/x86/include/asm/xen/hypercall.h:169:2: note: expanded from macro '_=
hypercall2'
           __HYPERCALL_DECLS;                                              \
           ^~~~~~~~~~~~~~~~~
   arch/x86/include/asm/xen/hypercall.h:113:2: note: expanded from macro '_=
_HYPERCALL_DECLS'
           register unsigned long __arg1 asm(__HYPERCALL_ARG1REG) =3D __arg=
1; \
           ^                                                        ~~~~~~
   arch/x86/include/asm/xen/hypercall.h:348:10: warning: Assigned value is =
garbage or undefined [clang-analyzer-core.uninitialized.Assign]
                   return _hypercall3(int, update_va_mapping, va,
                          ^
   arch/x86/include/asm/xen/hypercall.h:180:2: note: expanded from macro '_=
hypercall3'
           __HYPERCALL_DECLS;                                              \
           ^
   arch/x86/include/asm/xen/hypercall.h:113:2: note: expanded from macro '_=
_HYPERCALL_DECLS'
           register unsigned long __arg1 asm(__HYPERCALL_ARG1REG) =3D __arg=
1; \
           ^
   arch/x86/xen/mmu_pv.c:1628:9: note: Calling 'set_page_prot_flags'
           return set_page_prot_flags(addr, prot, UVMF_NONE);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/xen/mmu_pv.c:1623:6: note: Calling 'HYPERVISOR_update_va_mappin=
g'
           if (HYPERVISOR_update_va_mapping((unsigned long)addr, pte, flags=
))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/xen/hypercall.h:347:2: note: Taking true branch
           if (sizeof(new_val) =3D=3D sizeof(long))
           ^
   arch/x86/include/asm/xen/hypercall.h:348:10: note: Assigned value is gar=
bage or undefined
                   return _hypercall3(int, update_va_mapping, va,
                          ^
   arch/x86/include/asm/xen/hypercall.h:180:2: note: expanded from macro '_=
hypercall3'
           __HYPERCALL_DECLS;                                              \
           ^~~~~~~~~~~~~~~~~
   arch/x86/include/asm/xen/hypercall.h:113:2: note: expanded from macro '_=
_HYPERCALL_DECLS'
           register unsigned long __arg1 asm(__HYPERCALL_ARG1REG) =3D __arg=
1; \
           ^                                                        ~~~~~~
>> arch/x86/xen/mmu_pv.c:1521:3: warning: Value stored to 'pinned' is never=
 read [clang-analyzer-deadcode.DeadStores]
                   pinned =3D false;
                   ^        ~~~~~
   arch/x86/xen/mmu_pv.c:1521:3: note: Value stored to 'pinned' is never re=
ad
                   pinned =3D false;
                   ^        ~~~~~
   arch/x86/xen/mmu_pv.c:1523:4: warning: Value stored to 'pinned' is never=
 read [clang-analyzer-deadcode.DeadStores]
                           pinned =3D PagePinned(page);
                           ^        ~~~~~~~~~~~~~~~~
   arch/x86/xen/mmu_pv.c:1523:4: note: Value stored to 'pinned' is never re=
ad
                           pinned =3D PagePinned(page);
                           ^        ~~~~~~~~~~~~~~~~
   Suppressed 14 warnings (3 in non-user code, 11 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   fs/udf/super.c:881:2: warning: Value stored to 'ts' is never read [clang=
-analyzer-deadcode.DeadStores]
           ts =3D &pvoldesc->recordingDateAndTime;
           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/udf/super.c:881:2: note: Value stored to 'ts' is never read
           ts =3D &pvoldesc->recordingDateAndTime;
           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/udf/super.c:1769:2: warning: Address of stack memory associated with =
local variable 'data' returned to caller [clang-analyzer-core.StackAddressE=
scape]
           return ret;
           ^
   fs/udf/super.c:1800:8: note: Calling 'udf_process_sequence'
           ret =3D udf_process_sequence(sb, main_s, main_e, fileset);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/udf/super.c:1679:6: note: Assuming field 'part_descs_loc' is non-null
           if (!data.part_descs_loc)
               ^~~~~~~~~~~~~~~~~~~~
   fs/udf/super.c:1679:2: note: Taking false branch
           if (!data.part_descs_loc)
           ^
   fs/udf/super.c:1686:11: note: 'done' is false
           for (; (!done && block <=3D lastblock); block++) {
                    ^~~~
   fs/udf/super.c:1686:10: note: Left side of '&&' is true
           for (; (!done && block <=3D lastblock); block++) {
                   ^
   fs/udf/super.c:1686:19: note: Assuming 'block' is <=3D 'lastblock'
           for (; (!done && block <=3D lastblock); block++) {
                            ^~~~~~~~~~~~~~~~~~
   fs/udf/super.c:1686:2: note: Loop condition is true.  Entering loop body
           for (; (!done && block <=3D lastblock); block++) {
           ^
   fs/udf/super.c:1688:7: note: Assuming 'bh' is non-null
                   if (!bh)
                       ^~~
   fs/udf/super.c:1688:3: note: Taking false branch
                   if (!bh)
                   ^
   fs/udf/super.c:1694:3: note: Control jumps to 'case 7:'  at line 1717
                   switch (ident) {
                   ^
   fs/udf/super.c:1720:8: note: Assuming the condition is true
                           if (IS_ERR(curr)) {
                               ^~~~~~~~~~~~
   fs/udf/super.c:1720:4: note: Taking true branch
                           if (IS_ERR(curr)) {
                           ^
   fs/udf/super.c:1723:5: note: Control jumps to line 1768
                                   goto out;
                                   ^
   fs/udf/super.c:1769:2: note: Address of stack memory associated with loc=
al variable 'data' returned to caller
           return ret;
           ^      ~~~
   fs/udf/super.c:1769:2: warning: Use of memory after it is freed [clang-a=
nalyzer-unix.Malloc]
           return ret;
           ^
   fs/udf/super.c:1800:8: note: Calling 'udf_process_sequence'
           ret =3D udf_process_sequence(sb, main_s, main_e, fileset);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/udf/super.c:1679:6: note: Assuming field 'part_descs_loc' is non-null
           if (!data.part_descs_loc)
               ^~~~~~~~~~~~~~~~~~~~
   fs/udf/super.c:1679:2: note: Taking false branch
           if (!data.part_descs_loc)
           ^
   fs/udf/super.c:1686:11: note: 'done' is false
           for (; (!done && block <=3D lastblock); block++) {
                    ^~~~
   fs/udf/super.c:1686:10: note: Left side of '&&' is true
           for (; (!done && block <=3D lastblock); block++) {
                   ^
   fs/udf/super.c:1686:19: note: Assuming 'block' is <=3D 'lastblock'
           for (; (!done && block <=3D lastblock); block++) {
                            ^~~~~~~~~~~~~~~~~~
   fs/udf/super.c:1686:2: note: Loop condition is true.  Entering loop body
           for (; (!done && block <=3D lastblock); block++) {
           ^
   fs/udf/super.c:1688:7: note: Assuming 'bh' is non-null
                   if (!bh)
                       ^~~
   fs/udf/super.c:1688:3: note: Taking false branch
                   if (!bh)
                   ^
   fs/udf/super.c:1694:3: note: Control jumps to 'case 5:' @line 1718
                   switch (ident) {

vim +/pinned +1521 arch/x86/xen/mmu_pv.c

7e0563dea9c4e6 Vitaly Kuznetsov 2017-04-04  1508  =

7e0563dea9c4e6 Vitaly Kuznetsov 2017-04-04  1509  /* This needs to make sur=
e the new pte page is pinned iff its being
7e0563dea9c4e6 Vitaly Kuznetsov 2017-04-04  1510     attached to a pinned p=
agetable. */
7e0563dea9c4e6 Vitaly Kuznetsov 2017-04-04  1511  static inline void xen_al=
loc_ptpage(struct mm_struct *mm, unsigned long pfn,
7e0563dea9c4e6 Vitaly Kuznetsov 2017-04-04  1512  				    unsigned level)
7e0563dea9c4e6 Vitaly Kuznetsov 2017-04-04  1513  {
6f84f8d1587f20 Pavel Tatashin   2018-04-10  1514  	bool pinned =3D xen_page=
_pinned(mm->pgd);
7e0563dea9c4e6 Vitaly Kuznetsov 2017-04-04  1515  =

7e0563dea9c4e6 Vitaly Kuznetsov 2017-04-04  1516  	trace_xen_mmu_alloc_ptpa=
ge(mm, pfn, level, pinned);
7e0563dea9c4e6 Vitaly Kuznetsov 2017-04-04  1517  =

7e0563dea9c4e6 Vitaly Kuznetsov 2017-04-04  1518  	if (pinned) {
7e0563dea9c4e6 Vitaly Kuznetsov 2017-04-04  1519  		struct page *page =3D p=
fn_to_page(pfn);
7e0563dea9c4e6 Vitaly Kuznetsov 2017-04-04  1520  =

36c9b5929b7094 Juergen Gross    2021-09-08 @1521  		pinned =3D false;
36c9b5929b7094 Juergen Gross    2021-09-08  1522  		if (static_branch_likel=
y(&xen_struct_pages_ready)) {
36c9b5929b7094 Juergen Gross    2021-09-08  1523  			pinned =3D PagePinned(=
page);
7e0563dea9c4e6 Vitaly Kuznetsov 2017-04-04  1524  			SetPagePinned(page);
36c9b5929b7094 Juergen Gross    2021-09-08  1525  		}
7e0563dea9c4e6 Vitaly Kuznetsov 2017-04-04  1526  =

7e0563dea9c4e6 Vitaly Kuznetsov 2017-04-04  1527  		xen_mc_batch();
7e0563dea9c4e6 Vitaly Kuznetsov 2017-04-04  1528  =

7e0563dea9c4e6 Vitaly Kuznetsov 2017-04-04  1529  		__set_pfn_prot(pfn, PAG=
E_KERNEL_RO);
7e0563dea9c4e6 Vitaly Kuznetsov 2017-04-04  1530  =

36c9b5929b7094 Juergen Gross    2021-09-08  1531  		if (level =3D=3D PT_PTE=
 && USE_SPLIT_PTE_PTLOCKS && !pinned)
7e0563dea9c4e6 Vitaly Kuznetsov 2017-04-04  1532  			__pin_pagetable_pfn(MM=
UEXT_PIN_L1_TABLE, pfn);
7e0563dea9c4e6 Vitaly Kuznetsov 2017-04-04  1533  =

7e0563dea9c4e6 Vitaly Kuznetsov 2017-04-04  1534  		xen_mc_issue(PARAVIRT_L=
AZY_MMU);
7e0563dea9c4e6 Vitaly Kuznetsov 2017-04-04  1535  	}
7e0563dea9c4e6 Vitaly Kuznetsov 2017-04-04  1536  }
7e0563dea9c4e6 Vitaly Kuznetsov 2017-04-04  1537  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7806243121523768700==--

