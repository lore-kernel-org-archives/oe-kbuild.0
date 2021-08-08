Content-Type: multipart/mixed; boundary="===============2842250144645697046=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/x86/kvm/mmu/mmu.c:3336:3: warning: Value stored to 'r' is never read [clang-analyzer-deadcode.DeadStores]
Date: Sun, 08 Aug 2021 23:21:33 +0800
Message-ID: <202108082356.XA9iwnRz-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2842250144645697046==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: clang-built-linux(a)googlegroups.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Paolo Bonzini <pbonzini@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   85a90500f9a1717c4e142ce92e6c1cb1a339ec78
commit: 4a38162ee9f10f5f67c36f4f5aa4f6be2657efd5 KVM: MMU: load PDPTRs outs=
ide mmu_lock
date:   4 months ago
:::::: branch date: 22 hours ago
:::::: commit date: 4 months ago
config: x86_64-randconfig-c001-20210806 (attached as .config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 42b9c2=
a17a0b63cccf3ac197a82f91b28e53e643)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install x86_64 cross compiling tool for clang build
        # apt-get install binutils-x86-64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D4a38162ee9f10f5f67c36f4f5aa4f6be2657efd5
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 4a38162ee9f10f5f67c36f4f5aa4f6be2657efd5
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   arch/x86/kvm/mmu/mmu.c:2963:2: note: Taking false branch
           if (unlikely(error_code & PFERR_RSVD_MASK))
           ^
   arch/x86/kvm/mmu/mmu.c:2967:16: note: Assuming the condition is false
           if (unlikely(((error_code & (PFERR_FETCH_MASK | PFERR_PRESENT_MA=
SK))
                         ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   arch/x86/kvm/mmu/mmu.c:2967:2: note: Taking false branch
           if (unlikely(((error_code & (PFERR_FETCH_MASK | PFERR_PRESENT_MA=
SK))
           ^
   arch/x86/kvm/mmu/mmu.c:2985:9: note: Assuming 'shadow_acc_track_mask' is=
 equal to 0
           return shadow_acc_track_mask !=3D 0 ||
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/mmu/mmu.c:2985:9: note: Left side of '||' is false
   arch/x86/kvm/mmu/mmu.c:2986:10: note: Assuming the condition is true
                  ((error_code & (PFERR_WRITE_MASK | PFERR_PRESENT_MASK))
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/mmu/mmu.c:2985:2: note: Returning the value 1, which partic=
ipates in a condition later
           return shadow_acc_track_mask !=3D 0 ||
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/mmu/mmu.c:3053:7: note: Returning from 'page_fault_can_be_f=
ast'
           if (!page_fault_can_be_fast(error_code))
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/mmu/mmu.c:3053:2: note: Taking false branch
           if (!page_fault_can_be_fast(error_code))
           ^
   arch/x86/kvm/mmu/mmu.c:3061:3: note: Calling 'shadow_walk_init'
                   for_each_shadow_entry_lockless(vcpu, cr2_or_gpa, iterato=
r, spte)
                   ^
   arch/x86/kvm/mmu/mmu.c:166:7: note: expanded from macro 'for_each_shadow=
_entry_lockless'
           for (shadow_walk_init(&(_walker), _vcpu, _addr);                \
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/mmu/mmu.c:2111:2: note: Calling 'shadow_walk_init_using_roo=
t'
           shadow_walk_init_using_root(iterator, vcpu, vcpu->arch.mmu->root=
_hpa,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   arch/x86/kvm/mmu/mmu.c:2087:6: note: Assuming field 'level' is not equal=
 to PT64_ROOT_4LEVEL
           if (iterator->level =3D=3D PT64_ROOT_4LEVEL &&
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/mmu/mmu.c:2087:42: note: Left side of '&&' is false
           if (iterator->level =3D=3D PT64_ROOT_4LEVEL &&
                                                   ^
   arch/x86/kvm/mmu/mmu.c:2092:6: note: Assuming field 'level' is not equal=
 to PT32E_ROOT_LEVEL
           if (iterator->level =3D=3D PT32E_ROOT_LEVEL) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/mmu/mmu.c:2092:2: note: Taking false branch
           if (iterator->level =3D=3D PT32E_ROOT_LEVEL) {
           ^
   arch/x86/kvm/mmu/mmu.c:2106:1: note: Returning without writing to 'itera=
tor->sptep'
   }
   ^
   arch/x86/kvm/mmu/mmu.c:2111:2: note: Returning from 'shadow_walk_init_us=
ing_root'
           shadow_walk_init_using_root(iterator, vcpu, vcpu->arch.mmu->root=
_hpa,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   arch/x86/kvm/mmu/mmu.c:2113:1: note: Returning without writing to 'itera=
tor->sptep'
   }
   ^
   arch/x86/kvm/mmu/mmu.c:3061:3: note: Returning from 'shadow_walk_init'
                   for_each_shadow_entry_lockless(vcpu, cr2_or_gpa, iterato=
r, spte)
                   ^
   arch/x86/kvm/mmu/mmu.c:166:7: note: expanded from macro 'for_each_shadow=
_entry_lockless'
           for (shadow_walk_init(&(_walker), _vcpu, _addr);                \
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/mmu/mmu.c:3061:3: note: Calling 'shadow_walk_okay'
                   for_each_shadow_entry_lockless(vcpu, cr2_or_gpa, iterato=
r, spte)
                   ^
   arch/x86/kvm/mmu/mmu.c:167:7: note: expanded from macro 'for_each_shadow=
_entry_lockless'
                shadow_walk_okay(&(_walker)) &&                            \
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/mmu/mmu.c:2117:6: note: Assuming field 'level' is < PG_LEVE=
L_4K
           if (iterator->level < PG_LEVEL_4K)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/mmu/mmu.c:2117:2: note: Taking true branch
           if (iterator->level < PG_LEVEL_4K)
           ^
   arch/x86/kvm/mmu/mmu.c:2118:3: note: Returning without writing to 'itera=
tor->sptep'
                   return false;
                   ^
   arch/x86/kvm/mmu/mmu.c:3061:3: note: Returning from 'shadow_walk_okay'
                   for_each_shadow_entry_lockless(vcpu, cr2_or_gpa, iterato=
r, spte)
                   ^
   arch/x86/kvm/mmu/mmu.c:167:7: note: expanded from macro 'for_each_shadow=
_entry_lockless'
                shadow_walk_okay(&(_walker)) &&                            \
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/mmu/mmu.c:3061:3: note: Left side of '&&' is false
                   for_each_shadow_entry_lockless(vcpu, cr2_or_gpa, iterato=
r, spte)
                   ^
   arch/x86/kvm/mmu/mmu.c:167:36: note: expanded from macro 'for_each_shado=
w_entry_lockless'
                shadow_walk_okay(&(_walker)) &&                            \
                                             ^
   arch/x86/kvm/mmu/mmu.c:3065:3: note: Taking true branch
                   if (!is_shadow_present_pte(spte))
                   ^
   arch/x86/kvm/mmu/mmu.c:3066:4: note:  Execution continues on line 3140
                           break;
                           ^
   arch/x86/kvm/mmu/mmu.c:3140:2: note: 4th function call argument is an un=
initialized value
           trace_fast_page_fault(vcpu, cr2_or_gpa, error_code, iterator.spt=
ep,
           ^                                                   ~~~~~~~~~~~~=
~~
>> arch/x86/kvm/mmu/mmu.c:3336:3: warning: Value stored to 'r' is never rea=
d [clang-analyzer-deadcode.DeadStores]
                   r =3D -EIO;
                   ^   ~~~~
   arch/x86/kvm/mmu/mmu.c:3336:3: note: Value stored to 'r' is never read
                   r =3D -EIO;
                   ^   ~~~~
   arch/x86/kvm/mmu/mmu.c:3350:4: warning: Value stored to 'r' is never rea=
d [clang-analyzer-deadcode.DeadStores]
                           r =3D -EIO;
                           ^   ~~~~
   arch/x86/kvm/mmu/mmu.c:3350:4: note: Value stored to 'r' is never read
                           r =3D -EIO;
                           ^   ~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (2 in non-user code, 3 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (2 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   kernel/exit.c:1571:3: warning: Value stored to 'signo' is never read [cl=
ang-analyzer-deadcode.DeadStores]
                   signo =3D SIGCHLD;
                   ^
   kernel/exit.c:1571:3: note: Value stored to 'signo' is never read
   kernel/exit.c:1706:3: warning: Value stored to 'signo' is never read [cl=
ang-analyzer-deadcode.DeadStores]
                   signo =3D SIGCHLD;
                   ^
   kernel/exit.c:1706:3: note: Value stored to 'signo' is never read
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   kernel/resource.c:83:2: warning: The expression is an uninitialized valu=
e. The computed value will also be garbage [clang-analyzer-core.uninitializ=
ed.Assign]
           (*pos)++;
           ^
   kernel/resource.c:1666:2: note: 'l' declared without an initial value
           loff_t l;
           ^~~~~~~~
   kernel/resource.c:1669:2: note: Loop condition is true.  Entering loop b=
ody
           for (p =3D p->child; p ; p =3D r_next(NULL, p, &l)) {
           ^
   kernel/resource.c:1674:7: note: Assuming the condition is true
                   if (p->start >=3D addr + size)
                       ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/resource.c:1674:3: note: Taking true branch
                   if (p->start >=3D addr + size)
                   ^
   kernel/resource.c:1675:4: note:  Execution continues on line 1669
                           continue;
                           ^
   kernel/resource.c:1669:29: note: Calling 'r_next'
           for (p =3D p->child; p ; p =3D r_next(NULL, p, &l)) {
                                      ^~~~~~~~~~~~~~~~~~~
   kernel/resource.c:83:2: note: The expression is an uninitialized value. =
The computed value will also be garbage
           (*pos)++;
           ^~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   kernel/sysctl.c:1484:10: warning: The left operand of '=3D=3D' is a garb=
age value [clang-analyzer-core.UndefinedBinaryOperatorResult]
                           if (c =3D=3D '-') {
                               ~ ^
   kernel/sysctl.c:1431:63: note: 'c' declared without an initial value
           char tr_a[] =3D { '-', ',', '\n' }, tr_b[] =3D { ',', '\n', 0 },=
 c;
                                                                        ^
   kernel/sysctl.c:1433:6: note: Assuming 'bitmap' is non-null
           if (!bitmap || !bitmap_len || !left || (*ppos && !write)) {
               ^~~~~~~
   kernel/sysctl.c:1433:6: note: Left side of '||' is false
   kernel/sysctl.c:1433:17: note: Assuming 'bitmap_len' is not equal to 0
           if (!bitmap || !bitmap_len || !left || (*ppos && !write)) {
                          ^~~~~~~~~~~
   kernel/sysctl.c:1433:6: note: Left side of '||' is false
           if (!bitmap || !bitmap_len || !left || (*ppos && !write)) {
               ^
   kernel/sysctl.c:1433:32: note: Assuming 'left' is not equal to 0
           if (!bitmap || !bitmap_len || !left || (*ppos && !write)) {
                                         ^~~~~
   kernel/sysctl.c:1433:6: note: Left side of '||' is false
           if (!bitmap || !bitmap_len || !left || (*ppos && !write)) {
               ^
   kernel/sysctl.c:1433:42: note: Assuming the condition is false
           if (!bitmap || !bitmap_len || !left || (*ppos && !write)) {
                                                   ^~~~~
   kernel/sysctl.c:1433:48: note: Left side of '&&' is false
           if (!bitmap || !bitmap_len || !left || (*ppos && !write)) {
                                                         ^
   kernel/sysctl.c:1438:6: note: Assuming 'write' is not equal to 0
           if (write) {
               ^~~~~
   kernel/sysctl.c:1438:2: note: Taking true branch
           if (write) {
           ^
   kernel/sysctl.c:1442:7: note: Assuming the condition is false
                   if (left > PAGE_SIZE - 1) {

vim +/r +3336 arch/x86/kvm/mmu/mmu.c

651dd37a9ce6fd arch/x86/kvm/mmu.c     Joerg Roedel        2010-09-10  3288  =

651dd37a9ce6fd arch/x86/kvm/mmu.c     Joerg Roedel        2010-09-10  3289 =
 static int mmu_alloc_shadow_roots(struct kvm_vcpu *vcpu)
17ac10ad2bb7d8 drivers/kvm/mmu.c      Avi Kivity          2007-01-05  3290 =
 {
b37233c911cbec arch/x86/kvm/mmu/mmu.c Sean Christopherson 2021-03-04  3291 =
 	struct kvm_mmu *mmu =3D vcpu->arch.mmu;
6e0918aec49a5f arch/x86/kvm/mmu/mmu.c Sean Christopherson 2021-03-04  3292 =
 	u64 pdptrs[4], pm_mask;
be01e8e2c632c4 arch/x86/kvm/mmu/mmu.c Sean Christopherson 2020-03-20  3293 =
 	gfn_t root_gfn, root_pgd;
8123f265248c85 arch/x86/kvm/mmu/mmu.c Sean Christopherson 2020-04-27  3294 =
 	hpa_t root;
4a38162ee9f10f arch/x86/kvm/mmu/mmu.c Paolo Bonzini       2021-04-08  3295 =
 	unsigned i;
4a38162ee9f10f arch/x86/kvm/mmu/mmu.c Paolo Bonzini       2021-04-08  3296 =
 	int r;
3bb65a22a45020 drivers/kvm/mmu.c      Avi Kivity          2007-01-05  3297  =

b37233c911cbec arch/x86/kvm/mmu/mmu.c Sean Christopherson 2021-03-04  3298 =
 	root_pgd =3D mmu->get_guest_pgd(vcpu);
be01e8e2c632c4 arch/x86/kvm/mmu/mmu.c Sean Christopherson 2020-03-20  3299 =
 	root_gfn =3D root_pgd >> PAGE_SHIFT;
17ac10ad2bb7d8 drivers/kvm/mmu.c      Avi Kivity          2007-01-05  3300  =

651dd37a9ce6fd arch/x86/kvm/mmu.c     Joerg Roedel        2010-09-10  3301 =
 	if (mmu_check_root(vcpu, root_gfn))
651dd37a9ce6fd arch/x86/kvm/mmu.c     Joerg Roedel        2010-09-10  3302 =
 		return 1;
651dd37a9ce6fd arch/x86/kvm/mmu.c     Joerg Roedel        2010-09-10  3303  =

4a38162ee9f10f arch/x86/kvm/mmu/mmu.c Paolo Bonzini       2021-04-08  3304 =
 	/*
4a38162ee9f10f arch/x86/kvm/mmu/mmu.c Paolo Bonzini       2021-04-08  3305 =
 	 * On SVM, reading PDPTRs might access guest memory, which might fault
4a38162ee9f10f arch/x86/kvm/mmu/mmu.c Paolo Bonzini       2021-04-08  3306 =
 	 * and thus might sleep.  Grab the PDPTRs before acquiring mmu_lock.
4a38162ee9f10f arch/x86/kvm/mmu/mmu.c Paolo Bonzini       2021-04-08  3307 =
 	 */
6e0918aec49a5f arch/x86/kvm/mmu/mmu.c Sean Christopherson 2021-03-04  3308 =
 	if (mmu->root_level =3D=3D PT32E_ROOT_LEVEL) {
6e0918aec49a5f arch/x86/kvm/mmu/mmu.c Sean Christopherson 2021-03-04  3309 =
 		for (i =3D 0; i < 4; ++i) {
6e0918aec49a5f arch/x86/kvm/mmu/mmu.c Sean Christopherson 2021-03-04  3310 =
 			pdptrs[i] =3D mmu->get_pdptr(vcpu, i);
6e0918aec49a5f arch/x86/kvm/mmu/mmu.c Sean Christopherson 2021-03-04  3311 =
 			if (!(pdptrs[i] & PT_PRESENT_MASK))
6e0918aec49a5f arch/x86/kvm/mmu/mmu.c Sean Christopherson 2021-03-04  3312 =
 				continue;
6e0918aec49a5f arch/x86/kvm/mmu/mmu.c Sean Christopherson 2021-03-04  3313  =

6e0918aec49a5f arch/x86/kvm/mmu/mmu.c Sean Christopherson 2021-03-04  3314 =
 			if (mmu_check_root(vcpu, pdptrs[i] >> PAGE_SHIFT))
6e0918aec49a5f arch/x86/kvm/mmu/mmu.c Sean Christopherson 2021-03-04  3315 =
 				return 1;
6e0918aec49a5f arch/x86/kvm/mmu/mmu.c Sean Christopherson 2021-03-04  3316 =
 		}
6e0918aec49a5f arch/x86/kvm/mmu/mmu.c Sean Christopherson 2021-03-04  3317 =
 	}
6e0918aec49a5f arch/x86/kvm/mmu/mmu.c Sean Christopherson 2021-03-04  3318  =

4a38162ee9f10f arch/x86/kvm/mmu/mmu.c Paolo Bonzini       2021-04-08  3319 =
 	write_lock(&vcpu->kvm->mmu_lock);
4a38162ee9f10f arch/x86/kvm/mmu/mmu.c Paolo Bonzini       2021-04-08  3320 =
 	r =3D make_mmu_pages_available(vcpu);
4a38162ee9f10f arch/x86/kvm/mmu/mmu.c Paolo Bonzini       2021-04-08  3321 =
 	if (r < 0)
4a38162ee9f10f arch/x86/kvm/mmu/mmu.c Paolo Bonzini       2021-04-08  3322 =
 		goto out_unlock;
4a38162ee9f10f arch/x86/kvm/mmu/mmu.c Paolo Bonzini       2021-04-08  3323  =

651dd37a9ce6fd arch/x86/kvm/mmu.c     Joerg Roedel        2010-09-10  3324 =
 	/*
651dd37a9ce6fd arch/x86/kvm/mmu.c     Joerg Roedel        2010-09-10  3325 =
 	 * Do we shadow a long mode page table? If so we need to
651dd37a9ce6fd arch/x86/kvm/mmu.c     Joerg Roedel        2010-09-10  3326 =
 	 * write-protect the guests page table root.
651dd37a9ce6fd arch/x86/kvm/mmu.c     Joerg Roedel        2010-09-10  3327 =
 	 */
b37233c911cbec arch/x86/kvm/mmu/mmu.c Sean Christopherson 2021-03-04  3328 =
 	if (mmu->root_level >=3D PT64_ROOT_4LEVEL) {
8123f265248c85 arch/x86/kvm/mmu/mmu.c Sean Christopherson 2020-04-27  3329 =
 		root =3D mmu_alloc_root(vcpu, root_gfn, 0,
b37233c911cbec arch/x86/kvm/mmu/mmu.c Sean Christopherson 2021-03-04  3330 =
 				      mmu->shadow_root_level, false);
b37233c911cbec arch/x86/kvm/mmu/mmu.c Sean Christopherson 2021-03-04  3331 =
 		mmu->root_hpa =3D root;
be01e8e2c632c4 arch/x86/kvm/mmu/mmu.c Sean Christopherson 2020-03-20  3332 =
 		goto set_root_pgd;
17ac10ad2bb7d8 drivers/kvm/mmu.c      Avi Kivity          2007-01-05  3333 =
 	}
f87f928882d080 arch/x86/kvm/mmu.c     Joerg Roedel        2010-09-02  3334  =

4a38162ee9f10f arch/x86/kvm/mmu/mmu.c Paolo Bonzini       2021-04-08  3335 =
 	if (WARN_ON_ONCE(!mmu->pae_root)) {
4a38162ee9f10f arch/x86/kvm/mmu/mmu.c Paolo Bonzini       2021-04-08 @3336 =
 		r =3D -EIO;
4a38162ee9f10f arch/x86/kvm/mmu/mmu.c Paolo Bonzini       2021-04-08  3337 =
 		goto out_unlock;
4a38162ee9f10f arch/x86/kvm/mmu/mmu.c Paolo Bonzini       2021-04-08  3338 =
 	}
73ad160693dc3b arch/x86/kvm/mmu/mmu.c Sean Christopherson 2021-03-04  3339  =

651dd37a9ce6fd arch/x86/kvm/mmu.c     Joerg Roedel        2010-09-10  3340 =
 	/*
651dd37a9ce6fd arch/x86/kvm/mmu.c     Joerg Roedel        2010-09-10  3341 =
 	 * We shadow a 32 bit page table. This may be a legacy 2-level
81407ca553c0c8 arch/x86/kvm/mmu.c     Joerg Roedel        2010-09-10  3342 =
 	 * or a PAE 3-level page table. In either case we need to be aware that
81407ca553c0c8 arch/x86/kvm/mmu.c     Joerg Roedel        2010-09-10  3343 =
 	 * the shadow page table may be a PAE or a long mode page table.
651dd37a9ce6fd arch/x86/kvm/mmu.c     Joerg Roedel        2010-09-10  3344 =
 	 */
17e368d94af77c arch/x86/kvm/mmu/mmu.c Sean Christopherson 2021-03-04  3345 =
 	pm_mask =3D PT_PRESENT_MASK | shadow_me_mask;
748e52b9b73680 arch/x86/kvm/mmu/mmu.c Sean Christopherson 2021-03-04  3346 =
 	if (mmu->shadow_root_level =3D=3D PT64_ROOT_4LEVEL) {
81407ca553c0c8 arch/x86/kvm/mmu.c     Joerg Roedel        2010-09-10  3347 =
 		pm_mask |=3D PT_ACCESSED_MASK | PT_WRITABLE_MASK | PT_USER_MASK;
81407ca553c0c8 arch/x86/kvm/mmu.c     Joerg Roedel        2010-09-10  3348  =

4a38162ee9f10f arch/x86/kvm/mmu/mmu.c Paolo Bonzini       2021-04-08  3349 =
 		if (WARN_ON_ONCE(!mmu->lm_root)) {
4a38162ee9f10f arch/x86/kvm/mmu/mmu.c Paolo Bonzini       2021-04-08  3350 =
 			r =3D -EIO;
4a38162ee9f10f arch/x86/kvm/mmu/mmu.c Paolo Bonzini       2021-04-08  3351 =
 			goto out_unlock;
4a38162ee9f10f arch/x86/kvm/mmu/mmu.c Paolo Bonzini       2021-04-08  3352 =
 		}
73ad160693dc3b arch/x86/kvm/mmu/mmu.c Sean Christopherson 2021-03-04  3353  =

748e52b9b73680 arch/x86/kvm/mmu/mmu.c Sean Christopherson 2021-03-04  3354 =
 		mmu->lm_root[0] =3D __pa(mmu->pae_root) | pm_mask;
04d45551a1eefb arch/x86/kvm/mmu/mmu.c Sean Christopherson 2021-03-04  3355 =
 	}
04d45551a1eefb arch/x86/kvm/mmu/mmu.c Sean Christopherson 2021-03-04  3356  =

17ac10ad2bb7d8 drivers/kvm/mmu.c      Avi Kivity          2007-01-05  3357 =
 	for (i =3D 0; i < 4; ++i) {
c834e5e44fc15a arch/x86/kvm/mmu/mmu.c Sean Christopherson 2021-03-09  3358 =
 		WARN_ON_ONCE(IS_VALID_PAE_ROOT(mmu->pae_root[i]));
6e6ec58485746e arch/x86/kvm/mmu/mmu.c Sean Christopherson 2021-03-04  3359  =

b37233c911cbec arch/x86/kvm/mmu/mmu.c Sean Christopherson 2021-03-04  3360 =
 		if (mmu->root_level =3D=3D PT32E_ROOT_LEVEL) {
6e0918aec49a5f arch/x86/kvm/mmu/mmu.c Sean Christopherson 2021-03-04  3361 =
 			if (!(pdptrs[i] & PT_PRESENT_MASK)) {
c834e5e44fc15a arch/x86/kvm/mmu/mmu.c Sean Christopherson 2021-03-09  3362 =
 				mmu->pae_root[i] =3D INVALID_PAE_ROOT;
417726a3fbecb2 drivers/kvm/mmu.c      Avi Kivity          2007-04-12  3363 =
 				continue;
417726a3fbecb2 drivers/kvm/mmu.c      Avi Kivity          2007-04-12  3364 =
 			}
6e0918aec49a5f arch/x86/kvm/mmu/mmu.c Sean Christopherson 2021-03-04  3365 =
 			root_gfn =3D pdptrs[i] >> PAGE_SHIFT;
5a7388c2d2faa2 arch/x86/kvm/mmu.c     Eric Northup        2010-04-26  3366 =
 		}
8facbbff071ff2 arch/x86/kvm/mmu.c     Avi Kivity          2010-05-04  3367  =

8123f265248c85 arch/x86/kvm/mmu/mmu.c Sean Christopherson 2020-04-27  3368 =
 		root =3D mmu_alloc_root(vcpu, root_gfn, i << 30,
8123f265248c85 arch/x86/kvm/mmu/mmu.c Sean Christopherson 2020-04-27  3369 =
 				      PT32_ROOT_LEVEL, false);
b37233c911cbec arch/x86/kvm/mmu/mmu.c Sean Christopherson 2021-03-04  3370 =
 		mmu->pae_root[i] =3D root | pm_mask;
81407ca553c0c8 arch/x86/kvm/mmu.c     Joerg Roedel        2010-09-10  3371 =
 	}
81407ca553c0c8 arch/x86/kvm/mmu.c     Joerg Roedel        2010-09-10  3372  =

ba0a194ffbfb41 arch/x86/kvm/mmu/mmu.c Sean Christopherson 2021-03-04  3373 =
 	if (mmu->shadow_root_level =3D=3D PT64_ROOT_4LEVEL)
b37233c911cbec arch/x86/kvm/mmu/mmu.c Sean Christopherson 2021-03-04  3374 =
 		mmu->root_hpa =3D __pa(mmu->lm_root);
ba0a194ffbfb41 arch/x86/kvm/mmu/mmu.c Sean Christopherson 2021-03-04  3375 =
 	else
ba0a194ffbfb41 arch/x86/kvm/mmu/mmu.c Sean Christopherson 2021-03-04  3376 =
 		mmu->root_hpa =3D __pa(mmu->pae_root);
81407ca553c0c8 arch/x86/kvm/mmu.c     Joerg Roedel        2010-09-10  3377  =

be01e8e2c632c4 arch/x86/kvm/mmu/mmu.c Sean Christopherson 2020-03-20  3378 =
 set_root_pgd:
b37233c911cbec arch/x86/kvm/mmu/mmu.c Sean Christopherson 2021-03-04  3379 =
 	mmu->root_pgd =3D root_pgd;
4a38162ee9f10f arch/x86/kvm/mmu/mmu.c Paolo Bonzini       2021-04-08  3380 =
 out_unlock:
4a38162ee9f10f arch/x86/kvm/mmu/mmu.c Paolo Bonzini       2021-04-08  3381 =
 	write_unlock(&vcpu->kvm->mmu_lock);
ad7dc69aeb2313 arch/x86/kvm/mmu.c     Vitaly Kuznetsov    2019-02-22  3382  =

8986ecc0ef58c9 arch/x86/kvm/mmu.c     Marcelo Tosatti     2009-05-12  3383 =
 	return 0;
17ac10ad2bb7d8 drivers/kvm/mmu.c      Avi Kivity          2007-01-05  3384 =
 }
17ac10ad2bb7d8 drivers/kvm/mmu.c      Avi Kivity          2007-01-05  3385  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============2842250144645697046==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============2842250144645697046==--

