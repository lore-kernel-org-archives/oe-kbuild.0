Content-Type: multipart/mixed; boundary="===============6897815785530698984=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [intel-tdx:guest-upstream 25/33] arch/x86/mm/pat/set_memory.c:2044:2: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
Date: Sat, 15 Jan 2022 09:13:03 +0800
Message-ID: <202201150902.Q0x8pSmK-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6897815785530698984==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
CC: Sean Christopherson <sean.j.christopherson@intel.com>
CC: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.co=
m>
CC: Andi Kleen <ak@linux.intel.com>
CC: Tony Luck <tony.luck@intel.com>

tree:   https://github.com/intel/tdx.git guest-upstream
head:   33b1329c49e6d5f961b29c5cafd6571a5de523f0
commit: 5364ea9ede9af9f08041cacf140f8feef077d375 [25/33] x86/mm/cpa: Add su=
pport for TDX shared memory
:::::: branch date: 33 hours ago
:::::: commit date: 33 hours ago
config: x86_64-randconfig-c007 (https://download.01.org/0day-ci/archive/202=
20115/202201150902.Q0x8pSmK-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 82c8ac=
a93488730ce8f66101e0f3538f14b551dd)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel/tdx/commit/5364ea9ede9af9f08041cacf140f8=
feef077d375
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx guest-upstream
        git checkout 5364ea9ede9af9f08041cacf140f8feef077d375
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                   ^     ~~~~~~~~~~~~~~~~~
   fs/ntfs3/fslog.c:5171:3: note: Value stored to 'rno' is never read
                   rno =3D ino_get(&oe->ref);
                   ^     ~~~~~~~~~~~~~~~~~
   fs/ntfs3/fslog.c:5197:2: warning: 1st function call argument is an unini=
tialized value [clang-analyzer-core.CallAndMessage]
           kfree(rst_info.r_page);
           ^     ~~~~~~~~~~~~~~~
   fs/ntfs3/fslog.c:3783:14: note: Calling 'norm_file_page'
           page_size =3D norm_file_page(PAGE_SIZE, &l_size, true);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ntfs3/fslog.c:655:6: note: 'use_default' is true
           if (use_default)
               ^~~~~~~~~~~
   fs/ntfs3/fslog.c:655:2: note: Taking true branch
           if (use_default)
           ^
   fs/ntfs3/fslog.c:662:6: note: Assuming the condition is false
           if (*l_size < (MinLogRecordPages + 2) * page_size)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ntfs3/fslog.c:662:2: note: Taking false branch
           if (*l_size < (MinLogRecordPages + 2) * page_size)
           ^
   fs/ntfs3/fslog.c:665:2: note: Returning the value 4096 (loaded from 'pag=
e_size'), which participates in a condition later
           return page_size;
           ^~~~~~~~~~~~~~~~
   fs/ntfs3/fslog.c:3783:14: note: Returning from 'norm_file_page'
           page_size =3D norm_file_page(PAGE_SIZE, &l_size, true);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ntfs3/fslog.c:3787:7: note: 'page_size' is 4096
           if (!page_size)
                ^~~~~~~~~
   fs/ntfs3/fslog.c:3787:2: note: Taking false branch
           if (!page_size)
           ^
   fs/ntfs3/fslog.c:3790:8: note: Calling 'kzalloc'
           log =3D kzalloc(sizeof(struct ntfs_log), GFP_NOFS);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:724:9: note: Calling 'kmalloc'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:578:2: note: Taking false branch
           if (__builtin_constant_p(size)) {
           ^
   include/linux/slab.h:595:2: note: Returning pointer, which participates =
in a condition later
           return __kmalloc(size, flags);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:724:9: note: Returning from 'kmalloc'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:724:2: note: Returning pointer, which participates =
in a condition later
           return kmalloc(size, flags | __GFP_ZERO);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ntfs3/fslog.c:3790:8: note: Returning from 'kzalloc'
           log =3D kzalloc(sizeof(struct ntfs_log), GFP_NOFS);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ntfs3/fslog.c:3791:6: note: Assuming 'log' is non-null
           if (!log)
               ^~~~
   fs/ntfs3/fslog.c:3791:2: note: Taking false branch
           if (!log)
           ^
   fs/ntfs3/fslog.c:3796:22: note: Calling 'kmalloc'
           log->one_page_buf =3D kmalloc(page_size, GFP_NOFS);
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:578:2: note: Taking false branch
           if (__builtin_constant_p(size)) {
           ^
   include/linux/slab.h:595:2: note: Returning pointer, which participates =
in a condition later
           return __kmalloc(size, flags);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ntfs3/fslog.c:3796:22: note: Returning from 'kmalloc'
           log->one_page_buf =3D kmalloc(page_size, GFP_NOFS);
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ntfs3/fslog.c:3798:6: note: Assuming field 'one_page_buf' is null
           if (!log->one_page_buf) {
               ^~~~~~~~~~~~~~~~~~
   fs/ntfs3/fslog.c:3798:2: note: Taking true branch
           if (!log->one_page_buf) {
           ^
   fs/ntfs3/fslog.c:3800:3: note: Control jumps to line 5161
                   goto out;
                   ^
   fs/ntfs3/fslog.c:5162:6: note: 'lcb' is null
           if (lcb)
               ^~~
   fs/ntfs3/fslog.c:5162:2: note: Taking false branch
           if (lcb)
           ^
   fs/ntfs3/fslog.c:5170:2: note: Loop condition is false. Execution contin=
ues on line 5193
           while ((oe =3D enum_rstbl(oatbl, oe))) {
           ^
   fs/ntfs3/fslog.c:5197:2: note: 1st function call argument is an uninitia=
lized value
           kfree(rst_info.r_page);
           ^     ~~~~~~~~~~~~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
>> arch/x86/mm/pat/set_memory.c:2044:2: warning: Value stored to 'ret' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           ret =3D __change_page_attr_set_clr(&cpa, 1);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/mm/pat/set_memory.c:2044:2: note: Value stored to 'ret' is neve=
r read
           ret =3D __change_page_attr_set_clr(&cpa, 1);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 5 warnings (4 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   arch/x86/mm/pat/memtype.c:1098:24: warning: Access to field 'vm_start' r=
esults in a dereference of a null pointer (loaded from variable 'vma') [cla=
ng-analyzer-core.NullDereference]
                   if (follow_phys(vma, vma->vm_start, 0, &prot, &paddr)) {
                                        ^~~
   arch/x86/mm/pat/memtype.c:1092:6: note: Assuming 'vma' is null
           if (vma && !(vma->vm_flags & VM_PAT))
               ^~~
   arch/x86/mm/pat/memtype.c:1092:10: note: Left side of '&&' is false
           if (vma && !(vma->vm_flags & VM_PAT))
                   ^
   arch/x86/mm/pat/memtype.c:1097:6: note: Assuming 'paddr' is 0
           if (!paddr && !size) {
               ^~~~~~
   arch/x86/mm/pat/memtype.c:1097:6: note: Left side of '&&' is true
   arch/x86/mm/pat/memtype.c:1097:16: note: Assuming 'size' is 0
           if (!paddr && !size) {
                         ^~~~~
   arch/x86/mm/pat/memtype.c:1097:2: note: Taking true branch
           if (!paddr && !size) {
           ^
   arch/x86/mm/pat/memtype.c:1098:24: note: Access to field 'vm_start' resu=
lts in a dereference of a null pointer (loaded from variable 'vma')
                   if (follow_phys(vma, vma->vm_start, 0, &prot, &paddr)) {
                                        ^~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   drivers/target/target_core_rd.c:95:2: warning: Value stored to 'page_cou=
nt' is never read [clang-analyzer-deadcode.DeadStores]
           page_count =3D rd_release_sgl_table(rd_dev, rd_dev->sg_table_arr=
ay,
           ^            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/target/target_core_rd.c:95:2: note: Value stored to 'page_count'=
 is never read
           page_count =3D rd_release_sgl_table(rd_dev, rd_dev->sg_table_arr=
ay,
           ^            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/target/target_core_rd.c:221:2: warning: Value stored to 'page_co=
unt' is never read [clang-analyzer-deadcode.DeadStores]
           page_count =3D rd_release_sgl_table(rd_dev, rd_dev->sg_prot_arra=
y,
           ^            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/target/target_core_rd.c:221:2: note: Value stored to 'page_count=
' is never read
           page_count =3D rd_release_sgl_table(rd_dev, rd_dev->sg_prot_arra=
y,
           ^            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   mm/gup.c:708:2: warning: Value stored to 'page' is never read [clang-ana=
lyzer-deadcode.DeadStores]
           page =3D follow_trans_huge_pmd(vma, address, pmd, flags);
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/gup.c:708:2: note: Value stored to 'page' is never read
           page =3D follow_trans_huge_pmd(vma, address, pmd, flags);
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/gup.c:1296:13: warning: Dereference of null pointer (loaded from vari=
able 'unlocked') [clang-analyzer-core.NullDereference]
                   *unlocked =3D true;
                    ~~~~~~~~ ^
   mm/gup.c:1270:6: note: Assuming 'unlocked' is null
           if (unlocked)
               ^~~~~~~~
   mm/gup.c:1270:2: note: Taking false branch
           if (unlocked)
           ^
   mm/gup.c:1275:6: note: Assuming 'vma' is non-null
           if (!vma || address < vma->vm_start)
               ^~~~
   mm/gup.c:1275:6: note: Left side of '||' is false
   mm/gup.c:1275:14: note: Assuming 'address' is >=3D field 'vm_start'
           if (!vma || address < vma->vm_start)
                       ^~~~~~~~~~~~~~~~~~~~~~~
   mm/gup.c:1275:2: note: Taking false branch
           if (!vma || address < vma->vm_start)
           ^
   mm/gup.c:1278:7: note: Calling 'vma_permits_fault'
           if (!vma_permits_fault(vma, fault_flags))
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/gup.c:1212:18: note: Assuming the condition is false
           bool write   =3D !!(fault_flags & FAULT_FLAG_WRITE);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/gup.c:1213:18: note: Assuming the condition is false
           bool foreign =3D !!(fault_flags & FAULT_FLAG_REMOTE);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/gup.c:1214:24: note: 'write' is true
           vm_flags_t vm_flags =3D write ? VM_WRITE : VM_READ;
                                 ^~~~~

vim +/ret +2044 arch/x86/mm/pat/set_memory.c

5364ea9ede9af9 arch/x86/mm/pat/set_memory.c Kirill A. Shutemov 2020-03-30  =
2004  =

810a521265023a arch/x86/mm/pat/set_memory.c Tianyu Lan         2021-10-25  =
2005  /*
810a521265023a arch/x86/mm/pat/set_memory.c Tianyu Lan         2021-10-25  =
2006   * __set_memory_enc_pgtable() is used for the hypervisors that get
810a521265023a arch/x86/mm/pat/set_memory.c Tianyu Lan         2021-10-25  =
2007   * informed about "encryption" status via page tables.
810a521265023a arch/x86/mm/pat/set_memory.c Tianyu Lan         2021-10-25  =
2008   */
810a521265023a arch/x86/mm/pat/set_memory.c Tianyu Lan         2021-10-25  =
2009  static int __set_memory_enc_pgtable(unsigned long addr, int numpages,=
 bool enc)
77bd2342d4304b arch/x86/mm/pageattr.c       Tom Lendacky       2017-07-17  =
2010  {
77bd2342d4304b arch/x86/mm/pageattr.c       Tom Lendacky       2017-07-17  =
2011  	struct cpa_data cpa;
77bd2342d4304b arch/x86/mm/pageattr.c       Tom Lendacky       2017-07-17  =
2012  	int ret;
77bd2342d4304b arch/x86/mm/pageattr.c       Tom Lendacky       2017-07-17  =
2013  =

77bd2342d4304b arch/x86/mm/pageattr.c       Tom Lendacky       2017-07-17  =
2014  	/* Should not be working on unaligned addresses */
77bd2342d4304b arch/x86/mm/pageattr.c       Tom Lendacky       2017-07-17  =
2015  	if (WARN_ONCE(addr & ~PAGE_MASK, "misaligned address: %#lx\n", addr))
77bd2342d4304b arch/x86/mm/pageattr.c       Tom Lendacky       2017-07-17  =
2016  		addr &=3D PAGE_MASK;
77bd2342d4304b arch/x86/mm/pageattr.c       Tom Lendacky       2017-07-17  =
2017  =

77bd2342d4304b arch/x86/mm/pageattr.c       Tom Lendacky       2017-07-17  =
2018  	memset(&cpa, 0, sizeof(cpa));
77bd2342d4304b arch/x86/mm/pageattr.c       Tom Lendacky       2017-07-17  =
2019  	cpa.vaddr =3D &addr;
77bd2342d4304b arch/x86/mm/pageattr.c       Tom Lendacky       2017-07-17  =
2020  	cpa.numpages =3D numpages;
5364ea9ede9af9 arch/x86/mm/pat/set_memory.c Kirill A. Shutemov 2020-03-30  =
2021  =

5364ea9ede9af9 arch/x86/mm/pat/set_memory.c Kirill A. Shutemov 2020-03-30  =
2022  	cpa.mask_set =3D pgprot_cc_mask(enc);
5364ea9ede9af9 arch/x86/mm/pat/set_memory.c Kirill A. Shutemov 2020-03-30  =
2023  	cpa.mask_clr =3D pgprot_cc_mask(!enc);
5364ea9ede9af9 arch/x86/mm/pat/set_memory.c Kirill A. Shutemov 2020-03-30  =
2024  =

77bd2342d4304b arch/x86/mm/pageattr.c       Tom Lendacky       2017-07-17  =
2025  	cpa.pgd =3D init_mm.pgd;
77bd2342d4304b arch/x86/mm/pageattr.c       Tom Lendacky       2017-07-17  =
2026  =

77bd2342d4304b arch/x86/mm/pageattr.c       Tom Lendacky       2017-07-17  =
2027  	/* Must avoid aliasing mappings in the highmem code */
77bd2342d4304b arch/x86/mm/pageattr.c       Tom Lendacky       2017-07-17  =
2028  	kmap_flush_unused();
77bd2342d4304b arch/x86/mm/pageattr.c       Tom Lendacky       2017-07-17  =
2029  	vm_unmap_aliases();
77bd2342d4304b arch/x86/mm/pageattr.c       Tom Lendacky       2017-07-17  =
2030  =

77bd2342d4304b arch/x86/mm/pageattr.c       Tom Lendacky       2017-07-17  =
2031  	/*
5364ea9ede9af9 arch/x86/mm/pat/set_memory.c Kirill A. Shutemov 2020-03-30  =
2032  	 * Before changing the encryption attribute, flush caches.
5364ea9ede9af9 arch/x86/mm/pat/set_memory.c Kirill A. Shutemov 2020-03-30  =
2033  	 *
5364ea9ede9af9 arch/x86/mm/pat/set_memory.c Kirill A. Shutemov 2020-03-30  =
2034  	 * For TDX, guest is responsible for flushing caches on private->sha=
red
5364ea9ede9af9 arch/x86/mm/pat/set_memory.c Kirill A. Shutemov 2020-03-30  =
2035  	 * transition. VMM is responsible for flushing on shared->private.
77bd2342d4304b arch/x86/mm/pageattr.c       Tom Lendacky       2017-07-17  =
2036  	 */
5364ea9ede9af9 arch/x86/mm/pat/set_memory.c Kirill A. Shutemov 2020-03-30  =
2037  	if (cc_platform_has(CC_ATTR_GUEST_TDX)) {
5364ea9ede9af9 arch/x86/mm/pat/set_memory.c Kirill A. Shutemov 2020-03-30  =
2038  		if (!enc)
5364ea9ede9af9 arch/x86/mm/pat/set_memory.c Kirill A. Shutemov 2020-03-30  =
2039  			cpa_flush(&cpa, 1);
5364ea9ede9af9 arch/x86/mm/pat/set_memory.c Kirill A. Shutemov 2020-03-30  =
2040  	} else {
75d1cc0e05af57 arch/x86/mm/pat/set_memory.c Krish Sadhukhan    2020-09-17  =
2041  		cpa_flush(&cpa, !this_cpu_has(X86_FEATURE_SME_COHERENT));
5364ea9ede9af9 arch/x86/mm/pat/set_memory.c Kirill A. Shutemov 2020-03-30  =
2042  	}
77bd2342d4304b arch/x86/mm/pageattr.c       Tom Lendacky       2017-07-17  =
2043  =

77bd2342d4304b arch/x86/mm/pageattr.c       Tom Lendacky       2017-07-17 @=
2044  	ret =3D __change_page_attr_set_clr(&cpa, 1);
77bd2342d4304b arch/x86/mm/pageattr.c       Tom Lendacky       2017-07-17  =
2045  =

77bd2342d4304b arch/x86/mm/pageattr.c       Tom Lendacky       2017-07-17  =
2046  	/*
fe0937b24ff5d7 arch/x86/mm/pageattr.c       Peter Zijlstra     2018-12-03  =
2047  	 * After changing the encryption attribute, we need to flush TLBs ag=
ain
fe0937b24ff5d7 arch/x86/mm/pageattr.c       Peter Zijlstra     2018-12-03  =
2048  	 * in case any speculative TLB caching occurred (but no need to flush
fe0937b24ff5d7 arch/x86/mm/pageattr.c       Peter Zijlstra     2018-12-03  =
2049  	 * caches again).  We could just use cpa_flush_all(), but in case TLB
fe0937b24ff5d7 arch/x86/mm/pageattr.c       Peter Zijlstra     2018-12-03  =
2050  	 * flushing gets optimized in the cpa_flush() path use the same logic
fe0937b24ff5d7 arch/x86/mm/pageattr.c       Peter Zijlstra     2018-12-03  =
2051  	 * as above.
77bd2342d4304b arch/x86/mm/pageattr.c       Tom Lendacky       2017-07-17  =
2052  	 */
fe0937b24ff5d7 arch/x86/mm/pageattr.c       Peter Zijlstra     2018-12-03  =
2053  	cpa_flush(&cpa, 0);
77bd2342d4304b arch/x86/mm/pageattr.c       Tom Lendacky       2017-07-17  =
2054  =

064ce6c550a063 arch/x86/mm/pat/set_memory.c Brijesh Singh      2021-08-24  =
2055  	/*
064ce6c550a063 arch/x86/mm/pat/set_memory.c Brijesh Singh      2021-08-24  =
2056  	 * Notify hypervisor that a given memory range is mapped encrypted
064ce6c550a063 arch/x86/mm/pat/set_memory.c Brijesh Singh      2021-08-24  =
2057  	 * or decrypted.
064ce6c550a063 arch/x86/mm/pat/set_memory.c Brijesh Singh      2021-08-24  =
2058  	 */
5364ea9ede9af9 arch/x86/mm/pat/set_memory.c Kirill A. Shutemov 2020-03-30  =
2059  	return notify_range_enc_status_changed(addr, numpages, enc);
77bd2342d4304b arch/x86/mm/pageattr.c       Tom Lendacky       2017-07-17  =
2060  }
77bd2342d4304b arch/x86/mm/pageattr.c       Tom Lendacky       2017-07-17  =
2061  =


:::::: The code at line 2044 was first introduced by commit
:::::: 77bd2342d4304bda7896c953d424d15deb314ca3 x86/mm: Add support for cha=
nging the memory encryption attribute

:::::: TO: Tom Lendacky <thomas.lendacky@amd.com>
:::::: CC: Ingo Molnar <mingo@kernel.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6897815785530698984==--

