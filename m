Content-Type: multipart/mixed; boundary="===============7041205474659611053=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/x86/kvm/mmu/mmu.c:3336:3: warning: Value stored to 'r' is never read [clang-analyzer-deadcode.DeadStores]
Date: Mon, 09 Aug 2021 08:10:15 +0800
Message-ID: <202108090807.I57Y28N4-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7041205474659611053==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: clang-built-linux(a)googlegroups.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Paolo Bonzini <pbonzini@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   36a21d51725af2ce0700c6ebcb6b9594aac658a6
commit: 4a38162ee9f10f5f67c36f4f5aa4f6be2657efd5 KVM: MMU: load PDPTRs outs=
ide mmu_lock
date:   4 months ago
:::::: branch date: 3 hours ago
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
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   include/linux/hid.h:999:9: warning: Access to field 'name' results in a =
dereference of a null pointer (loaded from variable 'input') [clang-analyze=
r-core.NullDereference]
                                       input->name, c, type);
                                       ^
   drivers/hid/hid-apple.c:371:6: note: Assuming the condition is true
           if (usage->hid =3D=3D (HID_UP_CUSTOM | 0x0003) ||
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-apple.c:371:45: note: Left side of '||' is true
           if (usage->hid =3D=3D (HID_UP_CUSTOM | 0x0003) ||
                                                      ^
   drivers/hid/hid-apple.c:376:3: note: Calling 'hid_map_usage_clear'
                   hid_map_usage_clear(hi, usage, bit, max, EV_KEY, KEY_FN);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/hid.h:1027:2: note: Calling 'hid_map_usage'
           hid_map_usage(hidinput, usage, bit, max, type, c);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/hid.h:974:2: note: 'input' initialized here
           struct input_dev *input =3D hidinput->input;
           ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/hid.h:978:2: note: Control jumps to 'case 1:'  at line 987
           switch (type) {
           ^
   include/linux/hid.h:990:3: note:  Execution continues on line 997
                   break;
                   ^
   include/linux/hid.h:997:15: note: 'c' is <=3D 'limit'
           if (unlikely(c > limit || !bmap)) {
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/hid.h:997:15: note: Left side of '||' is false
           if (unlikely(c > limit || !bmap)) {
                        ^
   include/linux/hid.h:997:28: note: Assuming 'bmap' is null
           if (unlikely(c > limit || !bmap)) {
                                     ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/hid.h:997:28: note: Assuming pointer value is null
           if (unlikely(c > limit || !bmap)) {
                                     ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/hid.h:997:2: note: Taking true branch
           if (unlikely(c > limit || !bmap)) {
           ^
   include/linux/hid.h:998:3: note: Assuming the condition is true
                   pr_warn_ratelimited("%s: Invalid code %d type %d\n",
                   ^
   include/linux/printk.h:528:2: note: expanded from macro 'pr_warn_ratelim=
ited'
           printk_ratelimited(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/printk.h:511:6: note: expanded from macro 'printk_ratelimi=
ted'
           if (__ratelimit(&_rs))                                          \
               ^~~~~~~~~~~~~~~~~
   include/linux/ratelimit_types.h:41:28: note: expanded from macro '__rate=
limit'
   #define __ratelimit(state) ___ratelimit(state, __func__)
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/hid.h:998:3: note: Taking true branch
                   pr_warn_ratelimited("%s: Invalid code %d type %d\n",
                   ^
   include/linux/printk.h:528:2: note: expanded from macro 'pr_warn_ratelim=
ited'
           printk_ratelimited(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:511:2: note: expanded from macro 'printk_ratelimi=
ted'
           if (__ratelimit(&_rs))                                          \

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

--===============7041205474659611053==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============7041205474659611053==--

