Content-Type: multipart/mixed; boundary="===============4304363530545248460=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/x86/kvm/mmu/mmu.c:3336:3: warning: Value stored to 'r' is never read [clang-analyzer-deadcode.DeadStores]
Date: Wed, 24 Nov 2021 08:54:21 +0800
Message-ID: <202111240852.VioBRfTz-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4304363530545248460==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Paolo Bonzini <pbonzini@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   5d9f4cf36721aba199975a9be7863a3ff5cd4b59
commit: 4a38162ee9f10f5f67c36f4f5aa4f6be2657efd5 KVM: MMU: load PDPTRs outs=
ide mmu_lock
date:   7 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 7 months ago
config: x86_64-randconfig-c007-20211122 (https://download.01.org/0day-ci/ar=
chive/20211124/202111240852.VioBRfTz-lkp(a)intel.com/config.gz)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project c133fb=
321f7ca6083ce15b6aa5bf89de6600e649)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D4a38162ee9f10f5f67c36f4f5aa4f6be2657efd5
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 4a38162ee9f10f5f67c36f4f5aa4f6be2657efd5
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   arch/x86/kvm/mmu/mmu.c:2967:16: note: Assuming the condition is false
           if (unlikely(((error_code & (PFERR_FETCH_MASK | PFERR_PRESENT_MA=
SK))
                         ^
   include/linux/compiler.h:48:41: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                            ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:33:34: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
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
   Suppressed 7 warnings (6 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   lib/string_helpers.c:111:12: warning: Assigned value is garbage or undef=
ined [clang-analyzer-core.uninitialized.Assign]
           remainder +=3D rounding[j];
                     ^  ~~~~~~~~~~~
   lib/string_helpers.c:59:6: note: Assuming 'blk_size' is not equal to 0
           if (blk_size =3D=3D 0)
               ^~~~~~~~~~~~~
   lib/string_helpers.c:59:2: note: Taking false branch
           if (blk_size =3D=3D 0)
           ^
   lib/string_helpers.c:61:6: note: Assuming 'size' is not equal to 0
           if (size =3D=3D 0)
               ^~~~~~~~~
   lib/string_helpers.c:61:2: note: Taking false branch
           if (size =3D=3D 0)
           ^
   lib/string_helpers.c:75:2: note: Loop condition is false. Execution cont=
inues on line 80
           while (blk_size >> 32) {
           ^
   lib/string_helpers.c:80:2: note: Loop condition is false. Execution cont=
inues on line 87
           while (size >> 32) {
           ^
   lib/string_helpers.c:90:2: note: Loop condition is false. Execution cont=
inues on line 97
           while (size >=3D divisor[units]) {
           ^
   lib/string_helpers.c:98:14: note: Assuming the condition is true
           for (j =3D 0; sf_cap*10 < 1000; j++)
                       ^~~~~~~~~~~~~~~~
   lib/string_helpers.c:98:2: note: Loop condition is true.  Entering loop =
body
           for (j =3D 0; sf_cap*10 < 1000; j++)
           ^
   lib/string_helpers.c:98:14: note: Assuming the condition is true
           for (j =3D 0; sf_cap*10 < 1000; j++)
                       ^~~~~~~~~~~~~~~~
   lib/string_helpers.c:98:2: note: Loop condition is true.  Entering loop =
body
           for (j =3D 0; sf_cap*10 < 1000; j++)
           ^
   lib/string_helpers.c:98:14: note: Assuming the condition is true
           for (j =3D 0; sf_cap*10 < 1000; j++)
                       ^~~~~~~~~~~~~~~~
   lib/string_helpers.c:98:2: note: Loop condition is true.  Entering loop =
body
           for (j =3D 0; sf_cap*10 < 1000; j++)
           ^
   lib/string_helpers.c:98:32: note: The value 3 is assigned to 'j'
           for (j =3D 0; sf_cap*10 < 1000; j++)
                                         ^~~
   lib/string_helpers.c:98:14: note: Assuming the condition is false
           for (j =3D 0; sf_cap*10 < 1000; j++)
                       ^~~~~~~~~~~~~~~~
   lib/string_helpers.c:98:2: note: Loop condition is false. Execution cont=
inues on line 101
           for (j =3D 0; sf_cap*10 < 1000; j++)
           ^
   lib/string_helpers.c:101:6: note: Assuming 'units' is not equal to STRIN=
G_UNITS_2
           if (units =3D=3D STRING_UNITS_2) {
               ^~~~~~~~~~~~~~~~~~~~~~~
   lib/string_helpers.c:101:2: note: Taking false branch
           if (units =3D=3D STRING_UNITS_2) {
           ^
   lib/string_helpers.c:111:12: note: Assigned value is garbage or undefined
           remainder +=3D rounding[j];
                     ^  ~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   lib/kunit/test.c:371:23: warning: The left operand of '=3D=3D' is a garb=
age value [clang-analyzer-core.UndefinedBinaryOperatorResult]
                                   if (param_desc[0] =3D=3D '\0') {
                                                     ^
   lib/kunit/test.c:410:14: note: Assuming the condition is true
           for (i =3D 0; suites[i] !=3D NULL; i++) {
                       ^~~~~~~~~~~~~~~~~
   lib/kunit/test.c:410:2: note: Loop condition is true.  Entering loop body
           for (i =3D 0; suites[i] !=3D NULL; i++) {
           ^
   lib/kunit/test.c:412:3: note: Calling 'kunit_run_tests'
                   kunit_run_tests(suites[i]);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/kunit/test.c:356:2: note: Loop condition is true.  Entering loop body
           kunit_suite_for_each_test_case(suite, test_case) {
           ^
   include/kunit/test.h:349:2: note: expanded from macro 'kunit_suite_for_e=
ach_test_case'
           for (test_case =3D suite->test_cases; test_case->run_case; test_=
case++)
           ^
   lib/kunit/test.c:360:7: note: Assuming field 'generate_params' is null
                   if (test_case->generate_params) {

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
--===============4304363530545248460==--

