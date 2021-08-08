Content-Type: multipart/mixed; boundary="===============2684739385947217351=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/x86/kvm/mmu/mmu.c:3141:2: warning: 4th function call argument is an uninitialized value [clang-analyzer-core.CallAndMessage]
Date: Sun, 08 Aug 2021 14:37:27 +0800
Message-ID: <202108081405.X5m2Rkgu-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2684739385947217351==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: clang-built-linux(a)googlegroups.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Sean Christopherson <seanjc@google.com>
CC: Paolo Bonzini <pbonzini@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   85a90500f9a1717c4e142ce92e6c1cb1a339ec78
commit: ec89e643867148ab4a2a856a38717d2e89692be7 KVM: x86/mmu: Bail from fa=
st_page_fault() if SPTE is not shadow-present
date:   5 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 5 months ago
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
t/commit/?id=3Dec89e643867148ab4a2a856a38717d2e89692be7
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout ec89e643867148ab4a2a856a38717d2e89692be7
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
               ^
   arch/x86/kvm/mmu/mmu.c:3759:2: note: Taking false branch
           if (r)
           ^
   arch/x86/kvm/mmu/mmu.c:3762:2: note: Taking false branch
           if (is_tdp_mmu_root(vcpu->kvm, vcpu->arch.mmu->root_hpa))
           ^
   arch/x86/kvm/mmu/mmu.c:3766:7: note: Calling '__direct_map'
                   r =3D __direct_map(vcpu, gpa, error_code, map_writable, =
max_level, pfn,
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~
   arch/x86/kvm/mmu/mmu.c:2868:30: note: Assuming 'exec' is false
           bool huge_page_disallowed =3D exec && nx_huge_page_workaround_en=
abled;
                                       ^~~~
   arch/x86/kvm/mmu/mmu.c:2868:35: note: Left side of '&&' is false
           bool huge_page_disallowed =3D exec && nx_huge_page_workaround_en=
abled;
                                            ^
   arch/x86/kvm/mmu/mmu.c:2875:15: note: Assuming the condition is true
           if (WARN_ON(!VALID_PAGE(vcpu->arch.mmu->root_hpa)))
                        ^
   arch/x86/include/asm/kvm_host.h:113:24: note: expanded from macro 'VALID=
_PAGE'
   #define VALID_PAGE(x) ((x) !=3D INVALID_PAGE)
                          ^
   include/asm-generic/bug.h:119:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   arch/x86/kvm/mmu/mmu.c:2875:6: note: Taking false branch
           if (WARN_ON(!VALID_PAGE(vcpu->arch.mmu->root_hpa)))
               ^
   include/asm-generic/bug.h:120:2: note: expanded from macro 'WARN_ON'
           if (unlikely(__ret_warn_on))                                    \
           ^
   arch/x86/kvm/mmu/mmu.c:2875:2: note: Taking false branch
           if (WARN_ON(!VALID_PAGE(vcpu->arch.mmu->root_hpa)))
           ^
   arch/x86/kvm/mmu/mmu.c:2882:2: note: Calling 'shadow_walk_init'
           for_each_shadow_entry(vcpu, gpa, it) {
           ^
   arch/x86/kvm/mmu/mmu.c:160:7: note: expanded from macro 'for_each_shadow=
_entry'
           for (shadow_walk_init(&(_walker), _vcpu, _addr);        \
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/mmu/mmu.c:2121:2: note: Calling 'shadow_walk_init_using_roo=
t'
           shadow_walk_init_using_root(iterator, vcpu, vcpu->arch.mmu->root=
_hpa,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   arch/x86/kvm/mmu/mmu.c:2097:6: note: Assuming field 'level' is not equal=
 to PT64_ROOT_4LEVEL
           if (iterator->level =3D=3D PT64_ROOT_4LEVEL &&
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/mmu/mmu.c:2097:42: note: Left side of '&&' is false
           if (iterator->level =3D=3D PT64_ROOT_4LEVEL &&
                                                   ^
   arch/x86/kvm/mmu/mmu.c:2102:6: note: Assuming field 'level' is not equal=
 to PT32E_ROOT_LEVEL
           if (iterator->level =3D=3D PT32E_ROOT_LEVEL) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/mmu/mmu.c:2102:2: note: Taking false branch
           if (iterator->level =3D=3D PT32E_ROOT_LEVEL) {
           ^
   arch/x86/kvm/mmu/mmu.c:2116:1: note: Returning without writing to 'itera=
tor->sptep'
   }
   ^
   arch/x86/kvm/mmu/mmu.c:2121:2: note: Returning from 'shadow_walk_init_us=
ing_root'
           shadow_walk_init_using_root(iterator, vcpu, vcpu->arch.mmu->root=
_hpa,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   arch/x86/kvm/mmu/mmu.c:2123:1: note: Returning without writing to 'itera=
tor->sptep'
   }
   ^
   arch/x86/kvm/mmu/mmu.c:2882:2: note: Returning from 'shadow_walk_init'
           for_each_shadow_entry(vcpu, gpa, it) {
           ^
   arch/x86/kvm/mmu/mmu.c:160:7: note: expanded from macro 'for_each_shadow=
_entry'
           for (shadow_walk_init(&(_walker), _vcpu, _addr);        \
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/mmu/mmu.c:2882:2: note: Calling 'shadow_walk_okay'
           for_each_shadow_entry(vcpu, gpa, it) {
           ^
   arch/x86/kvm/mmu/mmu.c:161:7: note: expanded from macro 'for_each_shadow=
_entry'
                shadow_walk_okay(&(_walker));                      \
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/mmu/mmu.c:2127:6: note: Assuming field 'level' is < PG_LEVE=
L_4K
           if (iterator->level < PG_LEVEL_4K)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/mmu/mmu.c:2127:2: note: Taking true branch
           if (iterator->level < PG_LEVEL_4K)
           ^
   arch/x86/kvm/mmu/mmu.c:2128:3: note: Returning without writing to 'itera=
tor->sptep'
                   return false;
                   ^
   arch/x86/kvm/mmu/mmu.c:2882:2: note: Returning from 'shadow_walk_okay'
           for_each_shadow_entry(vcpu, gpa, it) {
           ^
   arch/x86/kvm/mmu/mmu.c:161:7: note: expanded from macro 'for_each_shadow=
_entry'
                shadow_walk_okay(&(_walker));                      \
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/mmu/mmu.c:2882:2: note: Loop condition is false. Execution =
continues on line 2907
           for_each_shadow_entry(vcpu, gpa, it) {
           ^
   arch/x86/kvm/mmu/mmu.c:160:2: note: expanded from macro 'for_each_shadow=
_entry'
           for (shadow_walk_init(&(_walker), _vcpu, _addr);        \
           ^
   arch/x86/kvm/mmu/mmu.c:2907:8: note: 2nd function call argument is an un=
initialized value
           ret =3D mmu_set_spte(vcpu, it.sptep, ACC_ALL,
                 ^                  ~~~~~~~~
>> arch/x86/kvm/mmu/mmu.c:3141:2: warning: 4th function call argument is an=
 uninitialized value [clang-analyzer-core.CallAndMessage]
           trace_fast_page_fault(vcpu, cr2_or_gpa, error_code, iterator.spt=
ep,
           ^
   arch/x86/kvm/mmu/mmu.c:3826:2: note: Loop condition is true.  Entering l=
oop body
           for (max_level =3D KVM_MAX_HUGEPAGE_LEVEL;
           ^
   arch/x86/kvm/mmu/mmu.c:3832:7: note: Assuming the condition is true
                   if (kvm_mtrr_check_gfn_range_consistency(vcpu, base, pag=
e_num))
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   arch/x86/kvm/mmu/mmu.c:3832:3: note: Taking true branch
                   if (kvm_mtrr_check_gfn_range_consistency(vcpu, base, pag=
e_num))
                   ^
   arch/x86/kvm/mmu/mmu.c:3833:4: note:  Execution continues on line 3836
                           break;
                           ^
   arch/x86/kvm/mmu/mmu.c:3836:9: note: Calling 'direct_page_fault'
           return direct_page_fault(vcpu, gpa, error_code, prefault,
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/mmu/mmu.c:3726:2: note: Taking false branch
           if (page_fault_handle_page_track(vcpu, error_code, gfn))
           ^
   arch/x86/kvm/mmu/mmu.c:3729:2: note: Taking true branch
           if (!is_tdp_mmu_root(vcpu->kvm, vcpu->arch.mmu->root_hpa)) {
           ^
   arch/x86/kvm/mmu/mmu.c:3730:7: note: Calling 'fast_page_fault'
                   r =3D fast_page_fault(vcpu, gpa, error_code);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/mmu/mmu.c:3054:7: note: Calling 'page_fault_can_be_fast'
           if (!page_fault_can_be_fast(error_code))
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/mmu/mmu.c:2964:2: note: Taking false branch
           if (unlikely(error_code & PFERR_RSVD_MASK))
           ^
   arch/x86/kvm/mmu/mmu.c:2968:16: note: Assuming the condition is false
           if (unlikely(((error_code & (PFERR_FETCH_MASK | PFERR_PRESENT_MA=
SK))
                         ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   arch/x86/kvm/mmu/mmu.c:2968:2: note: Taking false branch
           if (unlikely(((error_code & (PFERR_FETCH_MASK | PFERR_PRESENT_MA=
SK))
           ^
   arch/x86/kvm/mmu/mmu.c:2986:9: note: Assuming 'shadow_acc_track_mask' is=
 equal to 0
           return shadow_acc_track_mask !=3D 0 ||
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/mmu/mmu.c:2986:9: note: Left side of '||' is false
   arch/x86/kvm/mmu/mmu.c:2987:10: note: Assuming the condition is true
                  ((error_code & (PFERR_WRITE_MASK | PFERR_PRESENT_MASK))
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/mmu/mmu.c:2986:2: note: Returning the value 1, which partic=
ipates in a condition later
           return shadow_acc_track_mask !=3D 0 ||
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/mmu/mmu.c:3054:7: note: Returning from 'page_fault_can_be_f=
ast'
           if (!page_fault_can_be_fast(error_code))
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/mmu/mmu.c:3054:2: note: Taking false branch
           if (!page_fault_can_be_fast(error_code))
           ^
   arch/x86/kvm/mmu/mmu.c:3062:3: note: Calling 'shadow_walk_init'
                   for_each_shadow_entry_lockless(vcpu, cr2_or_gpa, iterato=
r, spte)
                   ^
   arch/x86/kvm/mmu/mmu.c:165:7: note: expanded from macro 'for_each_shadow=
_entry_lockless'
           for (shadow_walk_init(&(_walker), _vcpu, _addr);                \
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/mmu/mmu.c:2121:2: note: Calling 'shadow_walk_init_using_roo=
t'
           shadow_walk_init_using_root(iterator, vcpu, vcpu->arch.mmu->root=
_hpa,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   arch/x86/kvm/mmu/mmu.c:2097:6: note: Assuming field 'level' is not equal=
 to PT64_ROOT_4LEVEL
           if (iterator->level =3D=3D PT64_ROOT_4LEVEL &&
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/mmu/mmu.c:2097:42: note: Left side of '&&' is false
           if (iterator->level =3D=3D PT64_ROOT_4LEVEL &&
                                                   ^
   arch/x86/kvm/mmu/mmu.c:2102:6: note: Assuming field 'level' is not equal=
 to PT32E_ROOT_LEVEL
           if (iterator->level =3D=3D PT32E_ROOT_LEVEL) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/mmu/mmu.c:2102:2: note: Taking false branch
           if (iterator->level =3D=3D PT32E_ROOT_LEVEL) {
           ^
   arch/x86/kvm/mmu/mmu.c:2116:1: note: Returning without writing to 'itera=
tor->sptep'
   }
   ^
   arch/x86/kvm/mmu/mmu.c:2121:2: note: Returning from 'shadow_walk_init_us=
ing_root'
           shadow_walk_init_using_root(iterator, vcpu, vcpu->arch.mmu->root=
_hpa,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   arch/x86/kvm/mmu/mmu.c:2123:1: note: Returning without writing to 'itera=
tor->sptep'
   }
   ^
   arch/x86/kvm/mmu/mmu.c:3062:3: note: Returning from 'shadow_walk_init'
                   for_each_shadow_entry_lockless(vcpu, cr2_or_gpa, iterato=
r, spte)
                   ^
   arch/x86/kvm/mmu/mmu.c:165:7: note: expanded from macro 'for_each_shadow=
_entry_lockless'
           for (shadow_walk_init(&(_walker), _vcpu, _addr);                \
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/mmu/mmu.c:3062:3: note: Calling 'shadow_walk_okay'
                   for_each_shadow_entry_lockless(vcpu, cr2_or_gpa, iterato=
r, spte)
                   ^
   arch/x86/kvm/mmu/mmu.c:166:7: note: expanded from macro 'for_each_shadow=
_entry_lockless'
                shadow_walk_okay(&(_walker)) &&                            \
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/mmu/mmu.c:2127:6: note: Assuming field 'level' is < PG_LEVE=
L_4K

vim +3141 arch/x86/kvm/mmu/mmu.c

d3e328f2cb01f6 arch/x86/kvm/mmu.c     Junaid Shahid         2016-12-21  304=
1  =

c7ba5b48cc8ddc arch/x86/kvm/mmu.c     Xiao Guangrong        2012-06-20  304=
2  /*
c4371c2a682e0d arch/x86/kvm/mmu/mmu.c Sean Christopherson   2020-09-23  304=
3   * Returns one of RET_PF_INVALID, RET_PF_FIXED or RET_PF_SPURIOUS.
c7ba5b48cc8ddc arch/x86/kvm/mmu.c     Xiao Guangrong        2012-06-20  304=
4   */
c4371c2a682e0d arch/x86/kvm/mmu/mmu.c Sean Christopherson   2020-09-23  304=
5  static int fast_page_fault(struct kvm_vcpu *vcpu, gpa_t cr2_or_gpa,
c7ba5b48cc8ddc arch/x86/kvm/mmu.c     Xiao Guangrong        2012-06-20  304=
6  			   u32 error_code)
c7ba5b48cc8ddc arch/x86/kvm/mmu.c     Xiao Guangrong        2012-06-20  304=
7  {
c7ba5b48cc8ddc arch/x86/kvm/mmu.c     Xiao Guangrong        2012-06-20  304=
8  	struct kvm_shadow_walk_iterator iterator;
92a476cbfc476c arch/x86/kvm/mmu.c     Xiao Guangrong        2014-04-17  304=
9  	struct kvm_mmu_page *sp;
c4371c2a682e0d arch/x86/kvm/mmu/mmu.c Sean Christopherson   2020-09-23  305=
0  	int ret =3D RET_PF_INVALID;
c7ba5b48cc8ddc arch/x86/kvm/mmu.c     Xiao Guangrong        2012-06-20  305=
1  	u64 spte =3D 0ull;
97dceba29a6acb arch/x86/kvm/mmu.c     Junaid Shahid         2016-12-06  305=
2  	uint retry_count =3D 0;
c7ba5b48cc8ddc arch/x86/kvm/mmu.c     Xiao Guangrong        2012-06-20  305=
3  =

e5552fd252763c arch/x86/kvm/mmu.c     Xiao Guangrong        2013-07-30  305=
4  	if (!page_fault_can_be_fast(error_code))
c4371c2a682e0d arch/x86/kvm/mmu/mmu.c Sean Christopherson   2020-09-23  305=
5  		return ret;
c7ba5b48cc8ddc arch/x86/kvm/mmu.c     Xiao Guangrong        2012-06-20  305=
6  =

c7ba5b48cc8ddc arch/x86/kvm/mmu.c     Xiao Guangrong        2012-06-20  305=
7  	walk_shadow_page_lockless_begin(vcpu);
c7ba5b48cc8ddc arch/x86/kvm/mmu.c     Xiao Guangrong        2012-06-20  305=
8  =

97dceba29a6acb arch/x86/kvm/mmu.c     Junaid Shahid         2016-12-06  305=
9  	do {
d3e328f2cb01f6 arch/x86/kvm/mmu.c     Junaid Shahid         2016-12-21  306=
0  		u64 new_spte;
c7ba5b48cc8ddc arch/x86/kvm/mmu.c     Xiao Guangrong        2012-06-20  306=
1  =

736c291c9f36b0 arch/x86/kvm/mmu/mmu.c Sean Christopherson   2019-12-06  306=
2  		for_each_shadow_entry_lockless(vcpu, cr2_or_gpa, iterator, spte)
f9fa2509e5ca82 arch/x86/kvm/mmu/mmu.c Sean Christopherson   2020-01-08  306=
3  			if (!is_shadow_present_pte(spte))
d162f30a7cebe9 arch/x86/kvm/mmu.c     Junaid Shahid         2016-12-21  306=
4  				break;
d162f30a7cebe9 arch/x86/kvm/mmu.c     Junaid Shahid         2016-12-21  306=
5  =

ec89e643867148 arch/x86/kvm/mmu/mmu.c Sean Christopherson   2021-02-25  306=
6  		if (!is_shadow_present_pte(spte))
ec89e643867148 arch/x86/kvm/mmu/mmu.c Sean Christopherson   2021-02-25  306=
7  			break;
ec89e643867148 arch/x86/kvm/mmu/mmu.c Sean Christopherson   2021-02-25  306=
8  =

573546820b792e arch/x86/kvm/mmu/mmu.c Sean Christopherson   2020-06-22  306=
9  		sp =3D sptep_to_sp(iterator.sptep);
92a476cbfc476c arch/x86/kvm/mmu.c     Xiao Guangrong        2014-04-17  307=
0  		if (!is_last_spte(spte, sp->role.level))
97dceba29a6acb arch/x86/kvm/mmu.c     Junaid Shahid         2016-12-06  307=
1  			break;
c7ba5b48cc8ddc arch/x86/kvm/mmu.c     Xiao Guangrong        2012-06-20  307=
2  =

c7ba5b48cc8ddc arch/x86/kvm/mmu.c     Xiao Guangrong        2012-06-20  307=
3  		/*
f160c7b7bb322b arch/x86/kvm/mmu.c     Junaid Shahid         2016-12-06  307=
4  		 * Check whether the memory access that caused the fault would
f160c7b7bb322b arch/x86/kvm/mmu.c     Junaid Shahid         2016-12-06  307=
5  		 * still cause it if it were to be performed right now. If not,
f160c7b7bb322b arch/x86/kvm/mmu.c     Junaid Shahid         2016-12-06  307=
6  		 * then this is a spurious fault caused by TLB lazily flushed,
f160c7b7bb322b arch/x86/kvm/mmu.c     Junaid Shahid         2016-12-06  307=
7  		 * or some other CPU has already fixed the PTE after the
f160c7b7bb322b arch/x86/kvm/mmu.c     Junaid Shahid         2016-12-06  307=
8  		 * current CPU took the fault.
c7ba5b48cc8ddc arch/x86/kvm/mmu.c     Xiao Guangrong        2012-06-20  307=
9  		 *
c7ba5b48cc8ddc arch/x86/kvm/mmu.c     Xiao Guangrong        2012-06-20  308=
0  		 * Need not check the access of upper level table entries since
c7ba5b48cc8ddc arch/x86/kvm/mmu.c     Xiao Guangrong        2012-06-20  308=
1  		 * they are always ACC_ALL.
c7ba5b48cc8ddc arch/x86/kvm/mmu.c     Xiao Guangrong        2012-06-20  308=
2  		 */
d3e328f2cb01f6 arch/x86/kvm/mmu.c     Junaid Shahid         2016-12-21  308=
3  		if (is_access_allowed(error_code, spte)) {
c4371c2a682e0d arch/x86/kvm/mmu/mmu.c Sean Christopherson   2020-09-23  308=
4  			ret =3D RET_PF_SPURIOUS;
97dceba29a6acb arch/x86/kvm/mmu.c     Junaid Shahid         2016-12-06  308=
5  			break;
c7ba5b48cc8ddc arch/x86/kvm/mmu.c     Xiao Guangrong        2012-06-20  308=
6  		}
c7ba5b48cc8ddc arch/x86/kvm/mmu.c     Xiao Guangrong        2012-06-20  308=
7  =

d3e328f2cb01f6 arch/x86/kvm/mmu.c     Junaid Shahid         2016-12-21  308=
8  		new_spte =3D spte;
d3e328f2cb01f6 arch/x86/kvm/mmu.c     Junaid Shahid         2016-12-21  308=
9  =

d3e328f2cb01f6 arch/x86/kvm/mmu.c     Junaid Shahid         2016-12-21  309=
0  		if (is_access_track_spte(spte))
d3e328f2cb01f6 arch/x86/kvm/mmu.c     Junaid Shahid         2016-12-21  309=
1  			new_spte =3D restore_acc_track_spte(new_spte);
d3e328f2cb01f6 arch/x86/kvm/mmu.c     Junaid Shahid         2016-12-21  309=
2  =

c7ba5b48cc8ddc arch/x86/kvm/mmu.c     Xiao Guangrong        2012-06-20  309=
3  		/*
f160c7b7bb322b arch/x86/kvm/mmu.c     Junaid Shahid         2016-12-06  309=
4  		 * Currently, to simplify the code, write-protection can
f160c7b7bb322b arch/x86/kvm/mmu.c     Junaid Shahid         2016-12-06  309=
5  		 * be removed in the fast path only if the SPTE was
d3e328f2cb01f6 arch/x86/kvm/mmu.c     Junaid Shahid         2016-12-21  309=
6  		 * write-protected for dirty-logging or access tracking.
c7ba5b48cc8ddc arch/x86/kvm/mmu.c     Xiao Guangrong        2012-06-20  309=
7  		 */
d3e328f2cb01f6 arch/x86/kvm/mmu.c     Junaid Shahid         2016-12-21  309=
8  		if ((error_code & PFERR_WRITE_MASK) &&
e630269841ab08 arch/x86/kvm/mmu/mmu.c Miaohe Lin            2020-02-15  309=
9  		    spte_can_locklessly_be_made_writable(spte)) {
d3e328f2cb01f6 arch/x86/kvm/mmu.c     Junaid Shahid         2016-12-21  310=
0  			new_spte |=3D PT_WRITABLE_MASK;
c7ba5b48cc8ddc arch/x86/kvm/mmu.c     Xiao Guangrong        2012-06-20  310=
1  =

c126d94f2c90ed arch/x86/kvm/mmu.c     Xiao Guangrong        2014-04-17  310=
2  			/*
d3e328f2cb01f6 arch/x86/kvm/mmu.c     Junaid Shahid         2016-12-21  310=
3  			 * Do not fix write-permission on the large spte.  Since
d3e328f2cb01f6 arch/x86/kvm/mmu.c     Junaid Shahid         2016-12-21  310=
4  			 * we only dirty the first page into the dirty-bitmap in
d3e328f2cb01f6 arch/x86/kvm/mmu.c     Junaid Shahid         2016-12-21  310=
5  			 * fast_pf_fix_direct_spte(), other pages are missed
d3e328f2cb01f6 arch/x86/kvm/mmu.c     Junaid Shahid         2016-12-21  310=
6  			 * if its slot has dirty logging enabled.
c126d94f2c90ed arch/x86/kvm/mmu.c     Xiao Guangrong        2014-04-17  310=
7  			 *
d3e328f2cb01f6 arch/x86/kvm/mmu.c     Junaid Shahid         2016-12-21  310=
8  			 * Instead, we let the slow page fault path create a
d3e328f2cb01f6 arch/x86/kvm/mmu.c     Junaid Shahid         2016-12-21  310=
9  			 * normal spte to fix the access.
c126d94f2c90ed arch/x86/kvm/mmu.c     Xiao Guangrong        2014-04-17  311=
0  			 *
c126d94f2c90ed arch/x86/kvm/mmu.c     Xiao Guangrong        2014-04-17  311=
1  			 * See the comments in kvm_arch_commit_memory_region().
c126d94f2c90ed arch/x86/kvm/mmu.c     Xiao Guangrong        2014-04-17  311=
2  			 */
3bae0459bcd559 arch/x86/kvm/mmu/mmu.c Sean Christopherson   2020-04-27  311=
3  			if (sp->role.level > PG_LEVEL_4K)
d3e328f2cb01f6 arch/x86/kvm/mmu.c     Junaid Shahid         2016-12-21  311=
4  				break;
d3e328f2cb01f6 arch/x86/kvm/mmu.c     Junaid Shahid         2016-12-21  311=
5  		}
d3e328f2cb01f6 arch/x86/kvm/mmu.c     Junaid Shahid         2016-12-21  311=
6  =

d3e328f2cb01f6 arch/x86/kvm/mmu.c     Junaid Shahid         2016-12-21  311=
7  		/* Verify that the fault can be handled in the fast path */
d3e328f2cb01f6 arch/x86/kvm/mmu.c     Junaid Shahid         2016-12-21  311=
8  		if (new_spte =3D=3D spte ||
d3e328f2cb01f6 arch/x86/kvm/mmu.c     Junaid Shahid         2016-12-21  311=
9  		    !is_access_allowed(error_code, new_spte))
97dceba29a6acb arch/x86/kvm/mmu.c     Junaid Shahid         2016-12-06  312=
0  			break;
c126d94f2c90ed arch/x86/kvm/mmu.c     Xiao Guangrong        2014-04-17  312=
1  =

c7ba5b48cc8ddc arch/x86/kvm/mmu.c     Xiao Guangrong        2012-06-20  312=
2  		/*
97dceba29a6acb arch/x86/kvm/mmu.c     Junaid Shahid         2016-12-06  312=
3  		 * Currently, fast page fault only works for direct mapping
97dceba29a6acb arch/x86/kvm/mmu.c     Junaid Shahid         2016-12-06  312=
4  		 * since the gfn is not stable for indirect shadow page. See
3ecad8c2c1ff33 arch/x86/kvm/mmu/mmu.c Mauro Carvalho Chehab 2020-04-14  312=
5  		 * Documentation/virt/kvm/locking.rst to get more detail.
c7ba5b48cc8ddc arch/x86/kvm/mmu.c     Xiao Guangrong        2012-06-20  312=
6  		 */
c4371c2a682e0d arch/x86/kvm/mmu/mmu.c Sean Christopherson   2020-09-23  312=
7  		if (fast_pf_fix_direct_spte(vcpu, sp, iterator.sptep, spte,
c4371c2a682e0d arch/x86/kvm/mmu/mmu.c Sean Christopherson   2020-09-23  312=
8  					    new_spte)) {
c4371c2a682e0d arch/x86/kvm/mmu/mmu.c Sean Christopherson   2020-09-23  312=
9  			ret =3D RET_PF_FIXED;
97dceba29a6acb arch/x86/kvm/mmu.c     Junaid Shahid         2016-12-06  313=
0  			break;
c4371c2a682e0d arch/x86/kvm/mmu/mmu.c Sean Christopherson   2020-09-23  313=
1  		}
97dceba29a6acb arch/x86/kvm/mmu.c     Junaid Shahid         2016-12-06  313=
2  =

97dceba29a6acb arch/x86/kvm/mmu.c     Junaid Shahid         2016-12-06  313=
3  		if (++retry_count > 4) {
97dceba29a6acb arch/x86/kvm/mmu.c     Junaid Shahid         2016-12-06  313=
4  			printk_once(KERN_WARNING
97dceba29a6acb arch/x86/kvm/mmu.c     Junaid Shahid         2016-12-06  313=
5  				"kvm: Fast #PF retrying more than 4 times.\n");
97dceba29a6acb arch/x86/kvm/mmu.c     Junaid Shahid         2016-12-06  313=
6  			break;
97dceba29a6acb arch/x86/kvm/mmu.c     Junaid Shahid         2016-12-06  313=
7  		}
97dceba29a6acb arch/x86/kvm/mmu.c     Junaid Shahid         2016-12-06  313=
8  =

97dceba29a6acb arch/x86/kvm/mmu.c     Junaid Shahid         2016-12-06  313=
9  	} while (true);
97dceba29a6acb arch/x86/kvm/mmu.c     Junaid Shahid         2016-12-06  314=
0  =

736c291c9f36b0 arch/x86/kvm/mmu/mmu.c Sean Christopherson   2019-12-06 @314=
1  	trace_fast_page_fault(vcpu, cr2_or_gpa, error_code, iterator.sptep,
c4371c2a682e0d arch/x86/kvm/mmu/mmu.c Sean Christopherson   2020-09-23  314=
2  			      spte, ret);
c7ba5b48cc8ddc arch/x86/kvm/mmu.c     Xiao Guangrong        2012-06-20  314=
3  	walk_shadow_page_lockless_end(vcpu);
c7ba5b48cc8ddc arch/x86/kvm/mmu.c     Xiao Guangrong        2012-06-20  314=
4  =

c4371c2a682e0d arch/x86/kvm/mmu/mmu.c Sean Christopherson   2020-09-23  314=
5  	return ret;
c7ba5b48cc8ddc arch/x86/kvm/mmu.c     Xiao Guangrong        2012-06-20  314=
6  }
c7ba5b48cc8ddc arch/x86/kvm/mmu.c     Xiao Guangrong        2012-06-20  314=
7  =


:::::: The code at line 3141 was first introduced by commit
:::::: 736c291c9f36b07f8889c61764c28edce20e715d KVM: x86: Use gpa_t for cr2=
/gpa to fix TDP support on 32-bit KVM

:::::: TO: Sean Christopherson <sean.j.christopherson@intel.com>
:::::: CC: Paolo Bonzini <pbonzini@redhat.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============2684739385947217351==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

H4sICIZYD2EAAy5jb25maWcAjDxLe9u2svv+Cn3ppmfR1HYcnfTezwuIBCVUfBUg9fCGn2MrOb51
7BzZbpN/f2cGfADgUG0XqTUzeM8bA/74w48z8fry9OXm5f725uHh++zz4fFwvHk53M0+3T8c/ncW
F7O8qGYyVtVbIE7vH1+//fLtw7yZX87evz2/eHv28/H23Wx9OD4eHmbR0+On+8+v0MH90+MPP/4Q
FXmilk0UNRupjSryppK76urN7cPN4+fZn4fjM9DNzi/fnr09m/30+f7lf375Bf79cn88Ph1/eXj4
80vz9fj0f4fbl9nl+c384/uz24v3v87Pb+7ubs8uL999+Ph+/u/D4fzT5eHTr4fLs0+/fvjXm27U
5TDs1ZkzFWWaKBX58up7D8SfPe355Rn81+HSeNwJwKCTNI2HLlKHzu8ARoxE3qQqXzsjDsDGVKJS
kYdbCdMIkzXLoiomEU1RV2VdsXiVQ9dyQCn9e7MttDODRa3SuFKZbCqxSGVjCu10Va20FLDKPCng
HyAx2BRO9MfZkjjkYfZ8eHn9OpzxQhdrmTdwxCYrnYFzVTUy3zRCwyapTFVX7y6gl27KRVYqGL2S
pprdP88en16w435Xi0ik3ba+ecOBG1G7e0TLaoxIK4d+JTayWUudy7RZXitnei5mAZgLHpVeZ4LH
7K6nWhRTiEsecW0q5Kd+a5z5MjsTzDlshRN2W4X43fUpLEz+NPryFBoXwsw4lomo04o4wjmbDrwq
TJWLTF69+enx6fEwiLHZm40qHfloAfj/qErdxZeFUbsm+72WtWRmsBVVtGoI67aKdGFMk8ms0PtG
VJWIVuzyaiNTtWBRogb9yIxI5ys0jEoUOGORpp0kgVDOnl8/Pn9/fjl8GSRpKXOpVUQyW+pi4Yix
izKrYstjVP6bjCoUGYfRdAwo05hto6WRecw3jVaudCAkLjKhcg7WrJTUuLj9uK/MKKScRIy6dSeR
iUrDOcJOgZxXheapcBl6I3CdTVbEgbJLCh3JuNVjylX2phTayHZ2/Qm6PcdyUS8T45/04fFu9vQp
OLPBgBTR2hQ1jGm5LC6cEYkBXBISge9c441IVSwq2aTCVE20j1Lm9ElrbwZmCtDUn9zIvDInkaiy
RRzBQKfJMjhqEf9Ws3RZYZq6xCkHWs3KYlTWNF1tyIYENugkDYlIdf8FnAROSsBkrsHaSBADZ155
0ayu0apkxP398QKwhAkXsYoYMbWtVOxuNsGcNanlClmunSn13bLEaI798rSUWVlBV7mncDr4pkjr
vBJ6z+qUloqZbtc+KqB5t1Owi79UN89/zF5gOrMbmNrzy83L8+zm9vbp9fHl/vFzsHe47SKiPqx8
9CNvlK4CNB44MxOUFuJGr6POFJsY9VckQbsCvprGNJt3jusBPIAukfFBIJWp2Hcd9XMl1A6h3EYZ
5e076J7O3MTKoNsTs0L+D/aS9lxH9cxwrJnvG8ANC4AfjdwBBzqbYDwKahOAcCOoaSttDGoEqmPJ
wSstotOIhhy+bOFytr8+38VaqPzCmZFa2z/GEDppF7yCgawI9e4cdpqARVNJdXVxNvC5yivwj0Ui
A5rzd56uqXPTOrHRCpQ+Ka9OLsztfw53rw+H4+zT4ebl9Xh4JnC7QgbraW1TlyU4xqbJ60w0CwGB
QuQxOVFtRV4BsqLR6zwTZVOliyZJa7MaueewpvOLD0EP/TghNlrqoi6dzSrFUlrJl9plbvBfoiUj
A7YDuzNDL4lQuvExgz+UgGkQebxVcbViegTlMNXSwksVG1altXgd+86pj01Au11LHW5Bs6qXEnZ1
BI/lRkWSmQZIcagXRjOVOjmFX5TJ9ETJTXDHRfcVvAtQa1yjlYzWZQHni2YEvBrH1li2xUCGenb7
BCsPxxFL0PngC4X6qjsRVI3MmIsU1eaG/A3tnD79Fhl0bN0Oxx3XcRAhASAIjADix0MAcMMgwhfB
70t3UQCZCBIWRYF2zdckIDhFCWZGXUv06+jUCp2BKPrHHpAZ+IOLKeOm0OUKou+t0I4H2ocTnmZR
8fk8pAFVHsmSHE9Sn6HnE5lyDbNMRYXTdMxemQw/QnMQjJSBkVIQcThyYID/MzR3I8/PMskInMAi
PZ/G+lu9B+Op2fB3k2fKDas9Tg+WyB2kAB87qb3p1JXcBT9BVzhbUhbeqtQyF2ni8C3N3AWQh+oC
zAr0oDtToQrObymaWgdej4g3Cubc7iInwkM0hwdDfkQSN1tHWGDwhdBauce2xt72mRlDGu+0eiht
HYp0pTbS457xEQ/mp3NskOw35flICAL9kYK3z6zKWUvQL1qrYUUweA4Ov6e41pGb64GwyoupSEES
lBkW+pVx7NokKzwwmaYPXhyGOz/zkg5kxNusY3k4fno6frl5vD3M5J+HR/DUBJj3CH018MwHx2yi
cztPQsJmNJuMIk/WM/yHIzq+dGYH7Ez2hGEsslLA2ek1izap4PMOJq0XzN6atHDsJLaGc9TgN7RM
4hmYVZ0k4DqRX9GH3BMRSZGoFMSGGZIUIZk3Lzbyk4Ud8fxy4QbAO0one79dW2UqXVM6A6YfQaDv
yJbNgDZkDaqrN4eHT/PLn799mP88v3SThWuwn52L5exLJaK19X9HuCyrA2HI0KvTOTq+Nia+uvhw
ikDsMNHJEnSn3XU00Y9HBt2dz8Po22rlMbDXHg2diKft+8hdpGqhMdVAgRUj+hgBYkc7DifAZcH0
tSQzy1AAp8DATbkErqkCITeyss6XjTIh8nDibgmuUIciJQFdaUyGrGo3g+7REfOyZHY+aiF1blNF
YAONWqThlE1tSgmbPoEmFUtbJ9KxJ3oNAX4DTu07x0uihB81nnL1a0ruOUeTgHGWQqf7CFNa0vEc
yqWNb1LQJam5ugxCCiPwHJCdcbNlZHNmpCLL49Pt4fn56Th7+f7VxrJeHBSsgNcyGZeBRqlNpKhq
La3n6wv07kKUbsiKsKyk3JurfpZFGifK8BlXLStwCYDJJoa3HAoumU79geSugsNEBhmcsL5XJDg5
LBKg2KRNWhpeYSOJyIb+2yiEdTVMAmG14+Z0kD6AcPrsmaNNR0Ocltba2zEbLBQZcFcCTnwv45zD
sgcBAa8GnOFlLd38HZyDwDSPZ2NbmJ3XxJavNqg50gXwWrPpOK3DSy/nBj+bcsP1Q4jVJvOaWlA4
UUQY1BlD0OQNYG13mKz1e+WuT8Yj2SxtWWMaEKQqrVpvdNifDc8u/b4FmTAuIdWRdimKvpPf4KBX
BbofNC2mrYh03s95CPvXH9hJZaWJeAR6cBc8Ciw/58v3JqOsfW4lvsvBJLf2wCZn5i5Jej6Nq0yg
H8Cb3EWrZeALYJJ5EygSiGCzOiMFkIhMpfur+aVLQGwBoVpmHP5UoKBJZTVeoIf0m2w3Umau34Op
SgwpZSrZTCNOBGTXqg0ncm3BoCrGwNV+6V7RdOAIvEVR6zHieiWKnXtnsiqlZTovERRnijtDAVyn
Cs+vycl4mkaLHMznQi6h83MeiRdGI1TnTYaIAQCzTtHF8C88iC/wCrcZmwiIzFqgp2u11ODr2bi+
vWmmVAHeaU1oqswNzFsAZhFTuRTRPhwgo2sZOLxJdY8UcI7To7X3br3ldWKEL0+P9y9PR5uEH/hq
CEdae1PnKJ2c4hiRalH62mlEEWEWXfIqyyEmM1ZsZeDztw78xCo82WmjUvDW6lS0946+MS3KFP+R
fqqgp1Ef+LgnUxGIHuiX6UMxfKjSegeKz5ch9j35UhOnGSsNJ9ksF+hYBo5NVApbsmEqFXl6AncS
7DYIS6T37M2NdQDJCbKEgvFEe/QQrXl40kGdg4A3nx4f2BjCIsnBnJoGajUI4IHfbFHOoCZTFJG0
8yvwTrKWV2ff7g43d2fOf96mYHYTQpXCYIZA1yXHBiixaAGzbn4Dqe1g4jTsTS/eAWxRzQ/sUWnO
66HVgdqKi8w/OQORVTinOmPLKwYXcNjKyl6qN2u5NyMOJ9rK7OhAmiLh8sYc4VhWfAJMCk90ZZY7
t7FMFMvsq+vm/OxsCnXxfhL1zm/ldXfmWKHrq3OHG6x7utJ4x+hOby13krt7JThGi1wQaZFlrZeY
lNiP+sMcIWeNtTCrJq7d5FS52huFNgdkF/zes2/nLRe7WXRMfqBIchq4aw9x8zKH9heeELTB+iY2
TubbmppQQXo+bEiyK/KUvw8OKfFWmU8mZTEF5iBuvDUDxlLJvknjqksoTiU7U7WRJd5ruTmdUyHl
6ARFHDeBEiWcVX2ddK1AMaR1eK02otHw1ybkk5bKlClERCUas6p1rhkqDN0pWZCppRZ+jYxLV61K
j8Ra9Ke/DscZ2MKbz4cvh8cXWrqISjV7+ooFj06msU0nOMmmNr8wut3qEGatSkqxOpLVpi1kH3K5
WfusMamUpQdBbdFBB2OfNVuxllRlwjF2FhBPhX+AilJnX7e/W78BNE+iIiWHJPRUxgP3ysGNfnU8
TjJoQN8X67oMOoNTWVVtKh6blHEUdAI8XYH1tHMjH8g4Cb7BUCItrXXJBs+2rzLSdjqjpkkZ82Ea
rqN0/V3bk39YBNNy0wBDa61i6Wae/IFAzTEVSS6FCLdgISqw3PsQWleVb3AIvIHRORtjVynGDSrB
u1V2RwvWjhOOwjUtgW+MCeY2xFjWbZ1E+1U6PnI0U1VmvFEMOhXLpZbLMPHtrXkFzqtIg5Gj2kDI
3MQGVCmZsOEiddCAdstQq9QlaJQ4nH6IYzj0xBoiZK2Cv+W2cywgngR7wDvKRNKq31bTTm1BR6WK
MEKzDL7gkzC27cTNtbuLmaxWxQkyLeMaa/qwlnErNDpPKTfZQTeIUjoaxoe395v+EIg4wdplxVcL
WDHdgd05cVL274lMFfAp3l4DE4K9mfD3QP92wX5X8TVLjof/vh4eb7/Pnm9vHoL4shO3qRonpnXf
sbp7ODgF/NBTK3he75QrWxYbiPLjmNWiHlUm83qyi0ryRcceUZeXY4/dorocnuuy9CtyYk7ys5GQ
j3v/1tbTVi1enzvA7CeQxdnh5fbtv5wbRxBPG0w6dhpgWWZ/+FCbQO28NCLB9Nb52cqni/LFxRns
yO+10p6TrYwALc+zGOLiTGB6hZNwcJzyRRiMYGHBgt2fiYXbTbl/vDl+n8kvrw83gV9EKbjJPMHu
3QXHQta1di9XLCj8Tdmhen5pXXRgNveyry0a71sOKxnNlhaR3B+//HVzPMzi4/2f3i2yjN0KBPBv
IdpzL3F0RtoJlGkQbybbJkraag0uRVcUy1T2Hfi3JITCYJ3SXqMgxRbLHj4fb2afuonf0cTdarcJ
gg49WrKnOdduvr6DYALOrxl3MUl4u9/CG0zmeWV0PXZU0YHALFOFDxFUjODW0/Q9ZCbU+QjtLzNt
0hrrd/weN0k4Rpf2Bvmt9pg5pArJNhHgk4b86C12sS+F6+/0yLxo/IoXBO4S8Fqrwmb6g3ppvDqo
gbmvg8jFHs0QGkM34Ptq1puhWflZatrQLNjz4DLHHkM9+dIBHZ3N7v25ewMKbvdKnDe5CmEX7+ch
tCpFTTeD3hujm+Ptf+5fDrcYXP58d/gKjIq6eBRu2YA/qE2hBIEP644UeCzIJti7WFZx/lZnmMZe
TOSG7fMtCtEwN5dMPGUa3fYSGwyhU52T1sI6wAi90iDswZshLLwFsWkWZiscicMCHrwqrXUOLFWp
xCs/omEU7AKWFTB38Wt2Xmu8euUQRcnD227w/VfCFcUldW6zZ8SX/BMVIPOKzoZ6K+pxBeFggER7
hv6tWtZFzRQ5GDg58h3sOxAmwwQmo8JkSFsIOSYwssu1TiDbXHEmQiVoZ24f0tkalma7UiB5anTt
iOUFpon3uUA/kGrabYuwS5Nh9qZ9+haeAXiPIIWYS8BSgJaP0N6HdLZOiz0efKY32XC1bRawHFvG
GuAytQPeHdCGphMQ/QNWda8mxtyAvj8mMqj81lY6UAuuE2b8rsZLt1vkpwiHUxtE/jSWKdNDJQmR
5Eq2eQPK+LBoLLrnSFrustJgq9/bi9FgMi3U3qVN4OKinqhmaX0mdIrsi6junSVDW6SxQ8/tiZER
EpxAtRVBrtZtMSdLLemgUuCqoOtRuYurkB3M5C1Ml5RKwdgG74EnCECY3etXhLdPe0az3iqkbbmM
yjRCVkS1BSEjqbb12BcK0ehkUm8B3cRbnVD/n3qnY8W3QPGoQ4fNgrMQ3CnlHC+r0Hp1edV/SscM
Zdke8FiAGWb9iAsJiRlecCE0O5Qpksr6a6N1xN3tmoxA7Tg8DKgas41oYcF8k0gz2yd3qkLrRk8v
mYPAoREHJMU2D0l6i0Ej0N2UVzY3LMErIwy9BZwDa8r8VkNlItOvU1Y41YlLwnTVookci5XDaVqu
b58yjm08bLCyKfu+AHOgaCNY3/ig+jFq2abKnbdi7UxavAg8ij5wXChbJ8HtNzJbeFocbLD5FXgW
VffYWW+d8sgTqLC55Tq2OYca5ouF3BBDt5dVrRcwXBKBbXQLjtmUsVPb3d1Vj0+w82mnMaOPDFgT
2z5ObJ0ZTo6nXmD4aretygZlQVXJvCzR9XUffdnYISo2P3+8eT7czf6w1dpfj0+f7sPkGJK1J3Vq
j4jMFj7Ltl5/KG4+MZK3J/glCkydqpwtjv6bKKfrChR9hm8mXHmjtwIGC9aHr1O0Cs1li5al6FF0
E74DCKnq/BRF53ue6sHoqP86Qzp5B0mUis+Ytmg8WS0najBbGuSOLbifxqDt699gNSojPmKbgqBl
sE5Q+XGzxkcXDAt0dqEChh6uooZHFSl/0TE8+rXuratkTX7uhG25lR8wSeAp4KaP1M1wcVYVGBjo
bBtQoNGiDxrE1A3d8U2T6C1HgGyeo9mCM0tFWeI2ijjGfW9oKzkt1r0FaRYywf+hU+2/wndo7YX1
VkPnrr8/3IWSYMpvh9vXl5uPDwf69syM6o5enCh/ofIkq1DsRzqeQ7XqwREWS2QirUr/gYxFAA/x
NZPYDYYKbCZ0atq0puzw5en4fZYNeeTxVTFbz9Mh+2KgTOS14DAcMXiOEPBLDrWxeclR7dGIIowQ
8YMEy9p/7IQzVqZIAzM/davvw9shPT3lE3Rvmoo8LAJnWtjiAO41jK0MoKoAW594GUxogTrEXUAL
sNzFeRVRmL4mp1ZLFFe+9JcpOIgoc9EE5g0LTUj+mip8KGOrjAt0kPyI0omlh5SW4Wp5uy0lHrBf
doj11eXZr3Ne84zq0P2dY+rTV1uI/w16ypTj4d8KcYGDo52ZgEGkW7Hn9DRLndnXfGyaBWs7/Aya
95Zk7UhUBIFnTvXLDoyevjrVNmKyYqLHJcZrT09ezNW/nc1kQ5frsigckb9euEHT9bukcL9AdW2y
gJM6CDlt4+QYPTXpUoPukihjRtvYRZ+nPKSSnhAxMRuYBGO/mwHIJknFkrM8ZVtO13G/1FTv7H8A
AvQOfSLKnSXl1fAKmA4Ur374Agl3nhT9uVp0jWLQ5U96lT6ttQeO6f3N/PDy19PxD3D6xrodFMVa
Bo8sEAIHLbhNBZ/AcfrxF1grL7dPsLD1IDnpxEOIRGdkolksLAaLGvmWMQgLfguGDSVU7q9Olfbh
Mn5Uhr+ELPGdLb7cjukSiL0zBqIydz9DRL+beBWVwWAIpqrSqcGQQAvN43HdqlSnkEuNzJ3VO2aa
lqKp6jz3S3DBOQLdXqzVxIWCbbip+FIDxCZFfQo3DDtx1Yt0gn+tQjhwkaeRqpxIyhG2X64LRIYM
QFVUdmC/+zoupxmYKLTY/g0FYuFcIGAueLbF0eHPZc9tnOHoaKJ64QaqnYns8Fdvbl8/3t++8XvP
4vd88Smc7Nxn08285XUMDvgKEiKyXy/AsvImngjAcPXzU0c7P3m2c+Zw/TlkqpxPYwOedVFGVaNV
A6yZa27vCZ3H4HA3+H6o2pdy1Npy2ompoqYp0/YDhhOSQIS0+9N4I5fzJt3+3XhEtsoEHyPYY/5/
zp5tuXFcx19J7cPWOQ9dY8mXOA/9IEu0zY5uEWVb6RdVppNzJrWZpCvJnJ35+wVIXQgKtKf2oWdi
AOKdIAACYJmeLwjmwH+TCGpj7GVGeBOMBvMs8gSJ9zQgP2pjFxyhWemc3TaxMcez2E15Bgm8J4k9
7UQX1tjDjStPUhiYQ35Eo5qPFklDTw2bSiY7TgMwlynINxSR3ToQW9gxjfJ2PQuDOxadiBi+5tuX
xnx8XVRHKT93Tbjki4pKPvC/3Be+6ldpcSqjnJ8fIQT2ackncMTx0P77fJdjLtdAkuNNH+iAR1A/
frcmA6YvQvXiyBZWlCI/qpOsPckWj4zQQXYRZk71HhJZ6TkZsYe5J+x374kl0qOiWwpirpcinYPS
oZDJ+6juqtpfQR4rXhzokg0hTVlJj4vcSBOnkVKSY7n6ZG1Qd7x33E42d0R86TKITNyLOkH36vPp
49MxpurW3dZOkji6z6oCDs0il5PsEp3QPSneQdgCtjVpUVZFiW9cPNtg43GX3cIAVT5utMVsJ8y4
nmQlUuOwMVa83eE2CyZjOCBen54eP64+365+fYJ+ovXoES1HV3C8aIJRh+ghqBOhIrPHZBAm64Id
vLK9laxbJI79DdF18bc2JWiHJzJJgGjOzOFNecYdOY6kJ5eWKPetL3NqvuWHu1Rwerm+mbb8vOVx
3OnbcyrMDkF1edg30Lw0dfOrUb0bjRyFYW8dRNT7Gkh6RuRe0405ePSkJ0//ef7BOBIaYknPJPzt
O8LK2LoUc390KVUVAWqDlDEXjVums67hN0jCGbEBHNmm2g4whriOEwWYVsQVF9ulv1JOgEkH68Vs
fvZ7Ih3EgfH/f4MMjVZT4gkpSR5md6LMXEhi+zoYmnrSmVYknBKrvXyVM0W+7LeI0868TtKjc+7/
iK3M3VgfteQJFtQxAvVhQ+vDdFIEqLMlxBITxm0rdD+w45fwC2KSQQBaVJH1TTK2IVLqoH3SXDjA
vF0pI/7Y0vV0njh03PGaGDa7L9pyoGGSHg049K7xLi1NYa2XS4SiCvE/3O4dt5xvJ2rf8rNftjHZ
8i6m/V4vl8uZr3xN0pn+LtSj9nrdm5i3WF79eHv9fH97wSyZjy4PO2rfkI7NfTz/+/WEDsT4VfwG
f6g/fv58e/8kDvGwr07uRjvp/N+TKQI4ZljRSP/o91SCM1robQfyaW4b+M411dzbvP0KHX1+QfST
25XRTuinMqf9w+MTBs5r9DiKmCt4UtZl2iE0gZ+SYbrE6+PPt+dXOuiYwcFx27OhQ3SKgwYm4dpd
e3he85EBpAlDoz7+9/nzx29nl5JeeqdO1K5FbE/Y+SIG03qT0rsRBDgJATuQNjJhnugo9+ilZRxH
rO2iikqZ2M7iHaCtlbwOgylcmzlQJS8O9de5LbR1BB37Bum8blr/rfVQXhbBJzvfldhA5rmVGGs9
ZOhAYNu+ely8z2jgX4/Ql+pt7Og4Jhvyw8/nR5DElZmnyfxaw7S8brjC41K1DWdqtT9drZnmwofA
20Ku0KrRuDm7WD1tHp3Qn390cttVMRj3R2O88bTZi7Rk2T6MUp2VWyfZoIGBLnTIeaYGgn6eRGnB
5r0qK1PpEGei0zH3PHgI4Xh5A37yPg7+9qT9PmyZDi+JozHc5L8sA+dAbZxlpx1kKDlfjZGoF7yn
wSZdSy1NSzt0oBjC37sPA4n+QUklj56mdQTiWHmMg4YA+VtXTDu9Qx7NVEhmwk46Yl92DXWvrMxb
03s37a0JkprnbQdEHw8ppprbyFTW0vb3qcSOXLSZ3620U3F3MJXKjDDDHl7aXtUd8BRMQDTopq/I
ftMB+ZB2xUwwNffWXluI2gqQmYYMudTrabqthnC6R60tWXwj20vnxtsApgmYe4RH1CHBa3011slQ
gOLougwP2F3OLu2MPtoCP/VKURPuWD68fz5jV69+Prx/GMZIPouqa3TE9vB+pOgTO5yngunQMWIM
VX+YTpqi23KAP0GkwXToJp1p/f7w+mGC4q7Sh78IM8eaiqJUbuexVoluDrAojD1sek5E2S9Vkf2y
fXn4gOP8t+ef1llBO7zlRGLEfBOJiJ0NhPAd6jBTMBSElkh9w0LiJnpkXnQeAW797QY47D1eHQPe
PzNbzF3wNwl3oshEzcZZI4nxqs1vW51/vQ1oYx1seBa7mHZUBgwsdDvu3Ki69Bg+RlIGDWOcJWq6
IRADZxpn1ujRh1qmtDhYJQ6gcADRRpkQz/E0968sI9U//PyJZsQOqA1umurhB2Y0mSy/Ak1QDY4q
XqT4txy67GSRb8hgUK5XzaT5Mt53QFKWUJuwYtPw6SbdrmcL7jMVb0L0sfDYtpEkF/Xn04sXnS4W
sx0nfOnG6mjpYwUbpaLdQM3LzNWoFl0YZvMuw9PLv76gLP/w/Pr0eAVFdSzZxwzKLF4uA0/7VDpZ
L+W+b5a9QeoEoBOWlDx//M+X4vVLjK30mevw+6SId5b/+UZ7w+cgGWRfg8UUWn9djMNyucfGzA7C
H60UIX0gI92muUCc/ygAHcclMK6WcQyt+je0w1JF3RqByK2wh6Oeto9AQuBd3RzKDc0fxFU+2Pqx
87qJaZkk1dV/m/+HoABmV78bt5yJYqFXL5LRBXCnX6/rT4OhissF24Uc7MytHaA9pToKQ+3RAcv2
nesJNmLTPXYXzugIIhZdKf3sAil26UFspDv6Wqj0hfcXnA3MzZhjYr3cTDgdiFM2bDcc7YOjReYM
xPwup1OfZPjz7cfbi63M52WX38cs6mMmOAsKgRse/fzxYyoDRskyXDZtUtrxqxaQSsCgM2T3VFaV
Gwwat1Mq76O8pny0ltus9SRglLG6mYdqMQuIsT6P00Jh0lDMUCdjj6KxB8E5ZVPslIm6Wc/CyL6B
kCoNb2azOXGI0LCQz9UGxyAoGgq04zRcLrmkbT3FZh9cXxMTYY/RLbmZcfx/n8Wr+dKSNBIVrNbW
72OniLpetIrwZGJuqmmSX8wq37Qq2Qo7MAvNJiDDElNBeSyjnLVgxiFN4W5+w1qAVkRVGwbaNmrY
nyjxiJ2wPgNvozokz5V0YJOcip2BjiKLmtX6esk0riO4mceNldu+g4Ks1q5v9qWgXe2wQgSz2YIV
5J1+DD3fXAezyYFhoF5X1REL+0SB0t1Lyl1qiT8fPq7k68fn+x+/6/cOPn4D5f3x6hN1BKz96gUZ
+iPs3uef+Kd9fNco/7E9+H+UO127qVRzZADcBkM3Fp2vsyQ+ayazo2RAbUY9kQZ43XB8oVv7x8w2
zYMWcroT7u8xWbiJga9EjLeK92Pkjoj39lOmcdYeb93fbW17COs9EqUxhkHbLRj2DgXvI9AOojaS
RFyzOe5IiXGPyZCRQaF/QieuTPYNIjFywS6V+2CwBx1ooLH5be61d+JrMMYvdpi02O1MzKp5OFMI
cRXMbxZX/9g+vz+d4N8/p63aykrg5bw9nT2sLfYxfxc1UDj+NRN0oe7t/p5tk3WORzEsqQLTU2or
EmdTgJpNOnnrUNC+Hc6O3hR54nPw0kcgi8HW7w6OaXtkOnc6wcgZT+FaRLxfFnQNnaZ4x6PSizo2
PgyacDzWuA1sukPC69k7j3sYtE8J3tsA+oUCe+FxOKik19uqPvBtB3h71JOmX5f1FHwU7AtrxjlD
O5lbHlV5mhV8ZWj38jUQREAH1Ws8n+/Pv/6BL313xu/ICkMkSlh/afY3Pxm4GWY5MA7i1vI5ggwA
3GoeU9nrCGe1aPihvC/3BZsVzSovSqKyvzMaxEMN0glfcdteKGAn6O4SdTAPfH7f/UdpFFcSKtkT
mSqVccFaC8mntXCTMQpHsrFM4voYq9WlTmTRd1ooKIjDRFz6lhhu4Oc6CILWWaHW9Rh8O/c4OmZJ
2+xY47hdIbCavJbE+yW6q/kEePZ3VcwuKZ1Vo6AZuevU54qZBl4Ev1cR45udC8vEPLRLF/xmwftg
wimPfI/fzJu84fsT+1ZOLXeFe/dlFcbvOJNB1dUJ7Q8vrCXocOwks9zknP3P+gY/cF70A47NuZyS
j47yQJW4/SHH6ygYkLbkHdJskuNlks3Ow5csmspDk8q7g/S5J/ZIpxFML/ciVdRbrwO1Nb+MBzQ/
9QOaX4Mj+mLLQM4sKL9hlTP7Ex0iSWPomhZft+QFmYuMK6Fs3wSppGxad/urznFvrCgNPa+vwTS7
7j/T8jCpoSD620aEF9suvtPseRbK5PyzC9yxnm3WJ/tDdBLUw0henA+5DpdNwzahzxM3zm7A5oQX
XUZ4QjfzRFzseEdQgHv2omx8n7hnDMX4ilv4WgYI3zce569tFsz4RSN3PD/+ll2YwyyqjoI+PJQd
Mx8LUbc7vmXq9p7LpWlXBLVEeUGWbJY2i9bjAAy45cQ6ZmPV6Sx6e7rQHhlXdLXdqvV6wZ93iFoG
UCwfSXOrvsOnWvm9XGnRbcGRL0f59WJ+4UzXXyph36Xb2PuKmm/hdzDzzNVWRGl+obo8qrvKRkZn
QLxCo9bzdcjtVbtMAVKlE8euQs9KOzZsaA0trirygtpP8u0FPpzTPkkQHDF8Owd5HDO4tq4sNC1h
Pb+Z0QMgvL088/kRjl5yCunsKAmvkVkfFrekxZi0+gKH7WJ+jcsWdcUGgR1WHzvg9wL9YLbygjRc
ilxhPilitCoucv27tNjRJN53aTRvGl6MuUu9AiaUiY7DPvQdG3ppN+SA5quMyHB3Mdo9fZF2VXZx
SVQJ6Vq1mi0u7AX0pK4FEQjWwfzGE+eGqLrgN0q1DlY3lyqDdRAplnNUGPdUsSgVZSCLEI8XhQed
q6MxXwo746ONKFJQjuEffWLQE5QB8HaL03VhTSqZUu9BFd+Eszl3eUu+InsDft543q0BVHBzYUJV
psgaEKWMfe/gIO1NEHiUIUQuLvFSVcRoJGp4a4eq9XFBuldnsMD/xtQdcsoxyvI+g8XqE1WBbfIy
PcaF5Z7TQh4uNOI+L0pFnz1KTnHbpDtnl06/rcX+UBOWaSAXvqJfoP86yBcY26o80bO1Y0aclnmk
/B5+ttXe50WL2CMmWZM156ljFXuS3500CAbSnpa+BTcQ8G8sWYWbqzG78O6yDNljKj1hzR1N1Eg/
G+1o0hTmw0ezTRLPo1KyLP3pC9QG5X/ebLS/94WCZcZp+egI250LueLcQwbv8AnWqrHkebhyVERd
4P7t4/PLx/Pj09VBbXrzvaZ6enrsQvQQ0wcrRo8PPz+f3qeXDyfDAa1fo6UyMwcNh6uJIRF+nnv/
o94vfYIOLTSzEzbYKMswxWB75Z5BORnEXVSlJJHkMX7D4xVXVlJlNB6ZKXTUijikAEnOO6a2iM+g
q4hG8BHcIBRwSDu4y0bYN9s2vPbQf79PbFnARmkLqcipteTE8jkthOmLIzt6a9ztIxofkhIer6Fj
1qBZl2cGh2+yVofW4+QA22LhvYUwVSvJ+bUhx7BCLEcpViX5ZIPK159/fHovImVeHuyXDPFnm4pE
ubDtFoNAUpJn3WBMUrJb4mVtMFlUV7LpMIPH7As+DPL8CkzgXw8/6KPa3Wf4qq8TL0EIvhX3gHZr
E0cWaDyeraHweauZD27F/aaIKju3fwcBPlQul+u1F3PDYerbDVlWA+auDmas6wmhoL4nFioMVmc/
Trp4/2q1XrJFpLfQMt4W0JPsSsn54BC8jowXfBfrOFotAj47ik20XgTrc/WYdcSMbpqt5+Gc7x6g
5vy2tMptrufLmwtEMXcvNaLLKrBDmAZELk7O22EDClM5oOHnbMGM7jLi6uIUnSJOzBppDrlv6ck7
tQo588k4KVnY1sUh3gOEn9pTupjNz67Axrv00Q7Uet627Ie1vtVPPFHPkoE7nGMNqntIs4P3kDbK
I1Dh7QJH1JzTuUd0Ipny4mJTRQx8tw1v2Vp2FWtiJ/jWzgg/Yg74xGxmu/INOC09RDGHUjIRJ5mT
GKYBWWdU5R8L1Gadcw09RVUlC67QLNppIynXGEyMWlQbH2pDUiePOMwOSfM0jl04yeSbJ5/VQPR9
L/L9gbtKG+dXLWdBwFaBR40vnmogakpP8qmBomzYcP8Bv1UyWm2mi10nauJMNx0at6iKK2Hnr7eA
6MtbiopGRNn4KLleX98QxXGC9TiKEUIUmNvM1uVZdFvPrz0kBzhJZBPLyteYzSEMZsH8Qks0Vejt
EUq1RS5aGefr5YxPIUTo79dxnUXBgtfNpqS7IOCYIiWsa1U67+wwBMZB11MXUix8rrc2aRLdzOYL
viLMOF5SI4uN3kdZqfa8H4hNJ4QtqBPMLsIHpJSoSA5JQtLEc/I6so3sBGhfA3dFkUjPVbPdD2CD
bKS7TQS6PaycxleVWqn76xV/dUyadMi/e8Ih7U7f1tswCK8vDaxjFKQ43phq05wiNAuf1rPZ5YYb
2stbHWSmIFhTp26Cj4GZsjYaQpWpIPCsSuAVW8y1L0sfgf7ha4DMReO5kSGF3F4H/E0Z4Z8i90cd
k+nA90zrZTNbXei5/rvCAAO+c/rvk/Tw8xojxubzZdPWKvaw/J6LcpOc1OvrpqG+/4QApObAuwlA
YdUhXoVyzGjsOgjm1+v5mU5K0GHmvqqge5ptXJ5IoAwn7t5euuuLdFXW+nLg2/xApsJz6FMy9Tf2
lKqD0H6skeKyba28bKlZrzyp6UjfS7Vazq4vs8rvol6F4aVD9ruWEPn2VsU+605hz+SD9kHcJ0jJ
Mpe1JAuwk/p9mearTE7PQWOZfHh/1PHy8pfiCq0eJIV8ZcdqM1E/DoX+2cr1bBG6QPivGx9kEHG9
DuNrVh4wBGUsSzUpL5UbA3WKqyLOH8DgOndHpjQAZeSB8e6DKuaojUZPaz9M9mGH2EWZoBEkPaTN
1XK5ZuApCRMZwCI7BLNb/pAaiLbZ2j3HOms2N9ODlzln/jI2p98e3h9+oC16EjxlIgZGGx/7PGEu
m5t1W9Z2Mu7uOXYf0Dwx8zVcrsbCU53sBNMbuI+IdFGf788PL9MQPiNTmZTkMYkhMoh1uJyxwDYR
ZYXOYyKZRnfbdCaUjSzCHhWslstZ1B4jAPFP5tjUW1RRb/lKYuNE7mkpTRxPGsca8W2KvGoPGNA/
vl1gYyt80ysT50hEgyZhatqy8VmU35/JPWOT6pwPGF53kdK80eeSch1Q3rFJfHxi+LYO1+vG93la
sp7YpOtyyJ+Sv71+QRiQ6oWqr3+m8S7mYxxtvIKbTHeP8K6HgWCY1sChoPqUBfSW+c2ObuxgKTpY
33nA3pJUHOdN6QGf+SpYSXXdcDMx4FzxwSXcxNlq7nFC6Ui6w+FbHWEUiyeDDiG9SMZaMzpkVYaT
rgJsnLl56GC3Cka4RCQzEiOyH0h/1ZpW5ttUNOdKGym4IidTUbqRP0N4OmHNTluyuK5SfaAyzcgx
2B1zFnmCikCRVLxXQl58L3wubAe8mq49+d0xqwzIozn3BNP+2OfoGWcOYSQgGAHOG8cdaLg/88+M
vkY7TE8anbQIBwraTWUJAOBVZ17fcjA4VI8i/Wqdo10IkH+NyDKTIN7lSWp3U0N1MrwkqglLNRiM
nTXvw7HDqonMFbyxxG4j1naq6ez7TwNQcuuAThGmTS52bgsxXyd5Nh3Am0nN1mydulcTyXz1QJ1c
DaS6THD3iyOZc2s9Isjr1yN4Ey3mAYcwniQMuEuqO8E0stwL274elSVGCdk5K06R/Y4sPqlCM9cB
5JbvYX50Ul0AqTd6Y1+yJlhYSrt4L9AOjYNJVLQY/pVcxTCccfdume1Xkt5PshT0WQ4nUqql+3Rz
WR2UftKUV5BsIsxzZLKPTe+J4ZyZXg/bhgJMT4AQEBsrsSPxqAjVFzeYQYJsojDuXhzjNgUi8YFi
cm8LwOzQ9PJF9sfL5/PPl6c/YQSwiTrhCNdO/GjCbnt4WseLOWub6SnKOLpZLoJJOzrEn1MEjAFX
VZY2cZnyJ8bZztjlm/xxWiugFSuaoQxBUboryKNXPRBa3o8iVjZoSZjMaxzBzlvoCkoG+G9vH59n
c06awmWwnC/dGgG4mjPAxgVmyfVy5Y6dgbZqsV5zfvgdCUbYMV+2Wckb8xAvHb3RRiltSCSQrHYr
KKVsOH8bxOXaFhLSQjogdOZm7QyT8aKGhXpwJlaCynyzdKsG8Iq9Zu2QN6uGluO47HWgsiomG17n
z2VSB+mSYypjjBzir4/Pp9+vfsV8cF2yon/8Dmvm5a+rp99/fXpEl69fOqovoBpgFqN/uqXHmHLO
41yA+EQouct1mgA3gttBq5RPXu2Q9XkEzpS0ie5BRJJcGnS3MDs/AOJEJo7OAuj4kANpzTM5JiU4
fYIbSW5F5jAOC1lohwFaJmxwb9eUzGr2ih2Rg49k94wkHC+vIMkC6hfDBh46Lz12+9cRXt8fs/77
4v8ou5LmyHHl/Fd0cswLe9wEQJDg4R1YJKuKI7KKXWAtPZcKhVrjUVgtdUjq5x7/emPhgiVBjQ9S
SPklgcSWSACJxPufWp8NHxudw9HQWjXahRicAcxXocatm5DSckraH6E7jwpqLAthIg2RQiBExlk5
7mpPB+hAH8HrOjOL1LwfsITmenMKniQjxgxcyLdDBGUIFGgZMGcDgJcz0qAHWUZ7qpbzu+DY2kG3
ORhne4iKOVtJgec4ug4I7dh3N/dPL/f/bcV1Hj/ouyuijF0L98FY3VvV2w83g1us9CULvuPz/iI+
e7gR3VN06K8qgKPo5Srjt/+03GE9ecZSinTk8mRuAkHQ1onBIP4y9jqHqKQeMDzPDCSoFkDObfKR
3BYdJjxicN0OTPyCaATvAYwskH7zmIQ5ezh8OdXVeZGt+bK7qKhEi1x5U8rncW8DUeBHuQ77Sx+I
0jCJle/EgvnDpIpKrKeFLoTvF45cZbUT69yPsqya263ccvooz6pt656vjofAkwMD26Zq6139YWpi
Lfchz2857/5GvUqGdV25hqjLVZ3rj6Xnx92h5tXHTd7XG180HcL04fnh7e7t5vvj8/376xPkkx5i
cQdKK5cvuT+ACh6nDaIBgIQA00CTk7TQKh5BBaDrpHO5jlFHETY5rkPgNuej+vDZvSipdYBr+sxn
HTIx/oWv4S1lBYORxIf3N7/dff8uDDCVPmDZaVnbsoNbUcHlOfSCloIn7TaYHWHOOvBOlQLbFUt4
Crkg6iqo7Vu2ini6MApFChtLdV3bURMX6kRPQkLP/zqg8uBosdbWKWIM1rC6tD2Dj5Z1eZbqQoAE
gXFTFHyudzJskd29rmeOkiJmZnkXyzMZ8Ir68PO7mDjB3qF9nBdaTvrMgv4dM4z9xhvowTMQffAo
l9pkoZYVQxrMvCvWzAmUr+h9VxeYIceHyzC6nErRQ2pdflhZh/r3/Q5+DU8xrEohLmrPkCu7Yvgt
3/1+7fvGE9lfC9h405Eshs7pB5SlBGoEqTlDHx0K2lPTY2OoO+k6wBKInKEIqGsFwKtxzfG5vTDY
KVzjQddi3fNnF5VxoPstNb2i8VEL6h2FhRbsGfi+gq5PMWPvt07NqJd85MUs5NaZenpFQXa0RF37
ZUGwe6HSeMsDKuDp8fX9h7Bol/X9ZnOoNnkwSrsqiDC0jx2YN5jHWCwVBF/liH79n8dhldbeicW/
LcgZjU/9SVf+PVShM0vJcWwGyzQRdG4hwF5uz3S+seL2AUKawvOnu3+ZXgAinWFNKMxiO19N585+
8wTIIkTQXGVzMCBNDai3uuW1owCH7ThlfwztclocOPgx+1hoEgVEMvf9bYAEAbH4L0JgoHJodIGB
lAUkS1lAMlZFcQhBKdBxhg5i2L3qFbVDxcEDgumNta6x3ElMejC8qMW0PbfmbntX5ho3UxUzLMsw
1QA41LXmVLfZ3MFuc3hJDLB60WPMeNySEMukjdyqFoZDlFh7s6u8F4Pwy7U44whBHWtkkI2UGK1n
0lmIjgJ07NP5ivsCW0QdPsMhjp+vPuP0YnqsOYB9SuKC2/JzGCz761G0pqjY6+7UAiWS3ttQDeQZ
ogBdeuemURxGgNpRCEYXv4qEPSXalFjqYsRUd4sgC2TkkEYITqFvA1u/c9KqMXx5mp4kFEEpyvMd
lGBo99YQOE2TjPjJisaIEQXKr4AsggFMUxhICYVEFBAVuSxIKDlYIDuasQCQ2P4jU/duVySGHMzH
Zt/kx00lKw5n5rHX+P2hz2JKgSzLLMuooTcd3aT+vZ5qazNLE4ct1C1wi3x39y4sC8iGmcJtl2mM
oEMYi8GYNGZ6iyLzhp4N0BCQhIAsABCrZ5oQSqGGMDgyHEdQqn16QQEgDgNgWQWQ4ACQhpJKKVik
be+upVwOTtKPOIo0wbDhPfFcZOT/nXTpEEZjIH7HwHvLZPzFhVq+RZHkgMqzzltEtwsT5yRQW8ro
SocNdPFyjgvfNRVvC6BKVZQHiN5VVQnQ+0sHtGUhfuX14VroqzsBtONHHyx5gsFg9jJA/QetUVZN
I7QK5NQwstT0VtTRCqzjFAnjEoqNaHIwvN7AX1OS0pCfpeYZLhyIjgv7pg0p8WLbAnW9aShitj/g
BOCIt5BUG2G0wIt/gwNeCI8M23qbIHCtO9Xpqs0rQC5B76oLJFZNaShqz9xHKne4+Mk4O1oO/FsR
A+pEjKEDwhjo5PIdLjGrA4CagUBFo6E0cIPC4sqgLBWAAymLKR/yCjA5MAqJFWMMOSlYHMEyxRi8
um9zAANfGmq2QWUiSZRANrbFgoC5SwEJCyWbLXUCwUBQSoC6lw87JNCsqwACy5EkUJ9SAAXVloIy
eOPVlhEMfjWrjo6AJkJfJDSGMu47jglLljpQW+3WGK3awrWQJoZDKlQLAfptm4DUFKYCFoyggv1E
0KFACzPMoGHUMgInxpY6nIBTKDFwpLYZ0PCCCpY4o5iAraKgeHFUKw5wYHYFS8niwJQcMQYKtesL
vUdU8968Fj/hRS9GGFAWCaRQAwpArHyBOtl1Ret5jI/irRnN4Em8a0OvII1f81XP4SsVAy6MPkBQ
QYYGjiCTnyC5AK3kwftpIf+yrYSmASq/EhN/DA0jAWAUABK5JQHI1/IiTtsFBOqnGluRDJCO9z1P
KZhgK7QaZHcXCLOSwUsZnjIMAaJEDGqHepfjKINqXCLBawMTC8EfWIV9kcLXDyeGbVssvrDUtx2K
wElaIdAOg8UAVIegx1DzSjoG+59AKBhbYGSQwe2K7jgsIXwwYUkOAD3C0HLs1DNMAPqZkTQlGxhg
CLBbJZAFARwCgFGh6KBm1IhcislT88XWFqxNymjwSpTJlQQeYjG4Epxul9YMmqXaroHijMdEi76O
0wCSrs1/YwHY30aBAA9S/efWOd5AktG6GufahcfD+7yvZSgQ6ObVyFS1YulZ7eRVwuE2gFyU5V+u
LZ9fRBqZHaNjJJ8PtYopcu0Pdcd9vKy0j+JmfxJCVd31XPMKKpXJuJYLTnXHbbGQ5ifqlWwV92Xx
k3DqAOOivJJhle826tcHCc3CmSmV1Wl9qD6PnItyy9j2ufswxxCDTD4pKj0mv909ge636v0s1cJF
k4N7GheWTDmdRldSA+tu5V5920298pubPN8X17LnUFnm8SJYSRxdPhBWssB1MhyeLKbllbvYLiYG
V59xgjFcn4GUBl+JauW8XtmPBAg6tE1atLnJbpDt/1SoRnXqCyVucYBdZubge/imn+IYn1BfSmXg
kRFmr0ULxTy02KxDU41URrQ8dVnhjx/P9+o5ay+W6PBduy6dq5eSIjcAbUd9GcxLe5cE3mRUn+U9
ZmkUimsjWYScNIvM0xhFHR0tHDEuHY4uEM2NrqOKMXgiw6EHJcfkemZ9p6mBXQqVsOuZNhEJRLQD
9k3kLFxvGod2JFS1q1Oki5uopFIcvF86scBRkkY4sME1wZBRNYDWCZaqyAKRi9u0AxFqsLbDCYYi
h4tlxrXLeV1YC1dJFanAPvYyPa2CPh/zwy3gxd90hXRqswncDkQza1dZ8WDN2CzXYtuf/y5jKZaZ
4Pvuk+zy7rZbSzOizJwPv3feRZywru0dsgojaNOUQ1PR7kuz5iSgHZpc2RjrWhbYrZzxcA9UeBJw
fdZj84JiCp6/DLBzKDhRWexTWRalABF7A1aRAxtTMw7txSi0T0jijg1By9zMxy0mm3yo+qNNgQ5y
R1pgw3yC3St1KgfIWcnEexqR0Mif/cysb3hVLOl9XsdpcgGmGt5Sc603kZzRq+i3X5joDdZiM19d
aLQ44/AvvDBNaUmz4jDlpdMA2jnPLaA8D2ehJhcJNu3R/aTLmzYPBCPqeIIiGgjpo5z24IXKEArI
Kc/s5WcJoOkLM49kYDHokjkWy/NFnBJmCXQcPsEZigApM4RhKjRDCEyoF/AdhcHNEOhRI5IfS7vr
C0C+i7HUWc4NwikBEm1aQomjUbQnpE1TXs6OxaLdTEEiaMdIawBDZ+VKwpaiyKlCSXMrWyygM1fh
KBpz8xPUGPQIHkCCLl4y0s0IEF0iNFq0SZQMwcIVZUZiq7cdlKdeB1zdMi/lhuzcMXH5AmyTWyut
iTSZzR6wri+VaNJ901tHXzODvP9+VHFKdvzYVmDqcjWqFqOLXGIm3LDELvkE5kXPGHg8ZPCUlGQM
Snoy5n1ktK+BPEdDfTFT024H0hBGIga1mMMCCrfOd5RQczDNmDupzUjNm4yAbpAWT4JTlEMpi3Ge
kAuIiFkhBSVVCIYRluJABUssYJwbTH1BKINsZJsnSRMof2k+UXtasECWxMtpKx7TlrEhy55yINuq
ckAKLXYsHseuczCG4fIOiw1bf9t4atsuNsgyeD1kcHWMBWKOG0zC2kPQrOWwhKpIYGAUP5uFgsN9
sj4DCYMnwjOLvKMRU7DFITPUQE+MReABnMPD4MQllMGQ6TU+k9WjWe41VgeWIS9PobOzmfeQ824l
7052tRP5uK93cEAe42NtEC8W/NDHTtBVE2tPgU2VmWm0fT9iazbUfYrGYxJWFUUJwbA40h7D8Emq
zUStEJEulgbU3miqflAQxYbIsprwzUwPCxXSv6QCcGlDZ1EE1cuafFWvLL+pQ3AxVAzrpFlmSdnt
+3pdm6aBeuNFYdKJ3AqtpJLYpgRjh6Y3wEw5ZP/vjg2vmOQAiytZDnm949u83J9dNkuaWZLZpDMB
YTA1oevrI+OqPJxUYBReNVXhv9PePnx9vBvNuPe/vps3OoY6yVu5X+dVi0b1MwHX/hRiKOtN3Qub
LcxxyOUlnwDIy0MIGi9VhnDlf2/W4XTT0SuyURX3L6/Awy+nuqzU41Fej9krb0srSFZ5Ws2ROKxM
rcSHS0lfH17i5vH5x8+bl+/Spn5zcz3FjdHzZprtSG/QZatXotU7S1Vrhrw8BS9RaA5thbf1Tinq
3cYMo6GSb6sWi5+hNub0JbZucr6VL+JcC/EXdDyn2c67fWnVD1QPVqtMMXa8WnIbQtY/VPVeCir9
8vG/Ht/vnm76k5HyfIolmrJtc+hYSUL6XTaTN7+IKs47+UTVP1FiJyQDyMu9SVW38Byp2CoZGImL
0Vrvd9dmz7n4BbWXZD421bSgmkoMlMkc7P7B1DCginocL5ASVsN0KtxfNr2vcpqatwKGUV3HqXmk
oGOt2LSZExkT3Dy6HWBMwqTpJETl1+ovULjEcoKygOulz6HLEINkeZ6mUbL1U10nLMF+qnpXIzTA
Vsc1dqakmQ6MdUUX421vHkDPSNnqvl9vwPTavGn2rpqYPuQba2zPla4PvdwMxVywFuvqwn5oZoTK
Cn7EfFA8jtu2zG7SJHBus6JREfsa94RZdH9XYNgfQcwhS4x6bLTFJy6fwRbJjgF9bOeHll+5ekLw
cAKzkSVSc86SLFLoEJPKbf34+nCW1+d+qauqukEki/8xPgNoKD2Zzro+VGV/sjXQQJyeKnOnPfOG
uybdPd8/Pj3dvf4FHFfqOb7vc3Vwow+7f3x9fBHT5/2LvFr7HzffX1/uH97eXl7fVHiZb48/rSR0
U/ancXvQJpd5GhNvdhPkjMWR38nEeE1iRGHLymABX1MdOhXvSBwBaReckAjacB5hSmLqDQhBbQjO
vRI0J4KjvC4wWbnYscwRib1CC+vXcm6cqab/7zDNdzjlbXfxS8H3uy/XVb8WC2f4dvTfaz4dhaTk
E6PboEIpJvp1tzkiick+GzfBJIQpIq85uGXTZAKRE/MGqkWWdjRo7KShF941x6pnCNqSmVCauDkK
YpL4ed3yCH6iZOh2DUuEpEkKNJmYX1DgipDJAa2Mht4md63S2KuzkT7UjjMiO4riC0im0NA7dWkU
QQvEAT9j5jdPf86yyJdLUoE6lHRwA3Ps9Reib0sYvUt22jurTwNdNUWpV9LigumoZEwjFOzDD88L
aZtOzgbZdkwwOjd4/mPinhaQZOK3ryJnIJna/iQWEFybjlwZYRkc1WbguGUscJ45NOSWM+weVFuV
PFWoUcmP34Qy+tfDt4fn9xsZCdGafgfd2ZVJHBEEheUwOYZNRytLP/l5PvukWe5fBI/QhvJoIyCB
VHwpxVs4Jt1yYvqJgvJw8/7jWaxDvBykoSKMWCx6AJi6+6mexB/f7h/E/P388CIjkj48fTeSdlsl
Jf5obClOM08NA4tL3qugd+XgfzzaFeH8ddnuvj283omCPItJxn88YuhRXV/v5JK+8YZpwSHytqYU
0CB1K2oPdrE2GMIaX8LmPu9MTT3dJqlAvbUXgjJQMgIGZNLw/hThHHmp7U84iUEq9YwCSWWA5lb0
pZxF2cDPaBLDPhkGQ9hg2p+Ge0jeR2kgt3RJSJpkgD7dn1JMYZ/7iSHFS6pKMCRxWCFLGJY3TQPP
3I0MTBgPC+nKI0a/drIEbossAa8FTHBKvP65PyHCKPNTO/EkAQ+8B33QZ21kOokYZN9Wl2QETTYC
6GBfggnv4Wx6ZO8jT8ApCgQfMjjIkrknORB4UjRouENEoq4gXrfd7fe7CI2Qmypt9w2416Xh/JLh
FF2tUHkaOpR50WIvN00G6vTwG413C+LT2yT31iKK6ml9QY2rYgMtIegtXeXQRYJJI7uJVT2rbq3F
AKz11YTQCBq0CTVaH5QFjmdG4yMl7vxoMZTnLAVjH8xw4ql4QWVRej0VrVkKS1S9PH+6e/vTmMU8
6TuUUPghZc0hPVvA054JTuLElMHOUZsQXe1O9LON4GLOpvhxp7aqteg/3t5fvj3+74PcKVSGhbf2
V/wyPHJne2qbqFiuI/WoTeggY2Jj1oTpgZaflZeB6Q3goBkzb09aoNrhC32pwMCXbY8j++qgiyYB
Ry+XDXTts5mwvaR0UASqUZNJPn5uh5cz0UuBIwz60llMNIoWkojhc05L1Esj0qA8UKEKTf1zGo0W
ccyZaZ1aqLSKE7rcAxEciNFkXBdRBOp/jwnDgigsIOQgReDLKrYebrUTFUZnAGsZO/BEfBqot/6Y
Z9Y0ao9bjGgaqrW6zxABfQoNpoPQxqEmuzQkQoc1jH5uUYlEbcWB+lD4ShQstuYNQCWZuurtQW3Q
rl9fnt/FJ2/jkwzKLe3t/e75693r15tf3u7exZrk8f3hHzd/GKzWNizvVxHLoLXAgCZW/BFNPEVZ
9BMg2oNvICcIRT+D6UsY2UnJIWLrHEVlrOTEudwJlfpexfr+95v3h1ex8HyX7y0tlL88XOBrdmqP
elC5BS4h/39VgnoYkqaoO8Zi0zlrJpJx1hGkX3mwiYzviguOLUfLiWh6QqgcemKbjJL4eyPaj0Am
+IxmXqvRLYK3j8emxoy57b9KHM058Waw65LRP5Zw0ddCksj5MrJdq8Zmixx3D+crbIedk+RTxdEl
g6Yp9dGgLEoUueNBQ7qdIFlEZvDaS3+cyxEWxHWysOfKjENbrnM/ccev6LLmjRklBheTo8MnhptX
VhmEOTejlM71nSKzb/c3vwQHoClLJ4yW6J/fPJo3/kVRcLpcUQKHtmanHk280SFGf2hgN2Ldz7xO
oosah9tzd+kT2EYYhih19IIcgoQ6Q7msV7Lu2xVMLjxyKsle6TQ9dG4v4AwYskMRIUtJwvk6i/xu
XhVLnViOYpKEO2mJxfx68Ftc0GMU8O2RHIe+wQwMhTSj2O/8iaO7fi+RmMKly8G+NPtwMUwmwd4r
VQbDgRoMREEwGEK6RivNdBQl77mQZPfy+v7nTS4WlI/3d8+fbl9eH+6eb/p5jH0q1MRX9qegvKJz
4ihyhv7+QO2IAyMRuXW3KsSyzZ/jm03ZExJBNpQBO3PkQDUjIGiyaB5/FpGjNwoZKfmRUeyIqmlX
72B4oJ/iBswjsLMyWCWJ7air72bzclnZ2ZlkC71CjEe2oDqk5sURH3uFyti2IP7t/ylNX8jbnCGV
qQyWmEzxEEZ/GiPtm5fnp78GA/VT1zR2b9Mb1s5sJ6dKUVAxXQQn9Zknm465eFWMzkvjLsDNHy+v
2oyysxU6nWSXL7953XS32mJoc3UCM6cv7lYdRgDNm0akcz8cvHlC3YQ00VH7cmuAuAOCs03jDR5B
dKfwvF8JG5lA2ihJaMgCry+YRtQZJWq5hb3JX6p+4qn+7f5w5OT/GHuS5jZyXv+Kak4zVTPvxbKd
OIc5UN1UN8e9pcnWkkuX4yiOamzJZcv1fXm//gHsjQto+5DIDYA7SIIgCNBO7XQqGZVqTtnE6NQ8
4wUfdTHHh4fjQb/Yf/pxc7ub/c6Lyw/z+dkfdIA5b7/48Jqs6cZ7s09b3qFK56+Ox/tnjAoEXLe7
Pz7ODrv/hJbXuMnzbbskTB596xKdefJ08/hzf/vsm1qyxPAZAx/oR9K23UKgfmRLdCzipJAu+UrQ
o7RKWMvqwF0n4ORaKAzzU9IRSGI7pEe3ZwHM1A8ON4MG2MoAQ8L6VkBPNw+72beXHz9g0GNf27hc
kONJJtPpFje3/97v736eYKnMotgN8W5kDdjOeLMPl0p0MvrEzkSSKotwGrUJf63iuSnhTZjxhd9Y
8ISr1pTfzAk/vtD3MMRTmAmpfY2+mrE2L19npp3ahJQsZWYknQljBFnwC41Bpg9oCh0qcl8wemV6
D0L15sfzD2TlNOoziamuLi8D1a4wDmpNTxqjS4hnEn7bnAdxE8bxqTFVbHU5//ApqyjcIoZD4ycK
w+poExWFuQS9wfVDHmmcW5EPvMVparssGztws546qYj9hSx1vDqLeHKxrmpeJCol+g3Iarae2td0
2RiZ9EGFRvngcXeLAgnWwTPgQ3p2objtd0FDo7qh5FaNqyrTi4sGNTVnmQ1b8OxaFDasi4nmwgR8
ucCySVhtw3IWsSxzCbXS0IFtq5pLaQOh35JSh96y9ukR2i6pOy1MyXPZmsGiNSzjVvhkDft6zbfu
YOQLUXsDnSwDwZ40MitrUTbUjSGiV2LFsljY5UDB+qWUA91yt+Q1y1RJnXu7rPlaloWInEZsa+1+
yYYKNOl1sxeKdkGFuH/YIrBiIFatRZEyOo5c18JCCpgUJeWJBwmyyAmmoIE8dgFFuSrdamdlInAW
BLLOWSKiHIaEuwyZqdrtl5xt9TMHt4yad7wWKkPgg6FyqZzcSrRtdtkqbzIliAEvlMMXZa34tQ2C
pRt9QgGTGV1jAD1Wr7hiGKTQbVAF0xZXzdCIVRnDNxcF7Yetp9hqZ21lYWZugMOTsqoF7OZunSSD
cbwOJJEsl02ReGnQ8jzoVE5TKM7I0O4djmcSVlwuvYybosoCrx01R+S0+yk95/DFI5MBuVTnnrNa
/VNu3SLMOSVWpT2WMPcld+eESmFi5W7tVYpBzoPxTZGkwb2oreS5t8oIkZeKEqYQuxFF7tTrK8jQ
2BAzowHm8IBV0NdtDDtVIPyk7iXtbLBNG1qI13tXVtHWetTWOQUAt/b0MUMdb1zvn5UgM3XTGn7s
hExpUaFzGQTo1trtJ/BS1LkOpxyX66ILSW8KLHT23XEkj2dy2SGkd9bKoQOXQ6nTWYVKMyCtEgYh
RS7aMo1EmwmlMt7yArZsY9lEPPGaEcH4VkzVgnZuiQRNVgk/BrBBAH8WoSApiAe5EFrIZJtGsVN6
IEXn0kl3HxJhUw3RaoRXP38972+Bf7KbX/TZvCgrneEm4oJ+NILYLl5jqImKpavSrew4Gq/UwymE
xQmnI1mqbfXaY9USBrQ7B1NXxVboBnwe0zDnyWoe6Rcv/uWlfnHTPbpJj8+nWTTpOWLijVoeBV8u
Ik7GTiDmERh0AzhR+LPZzyRTS2qPQAqWRXaAct1oscwhbSBJtPhk+ZDJdeR5oLd6FMENlC8+wjA4
5CiQw17oOCDDrL+kLiiVX2yAKmUqFsxPnKtrqyEgGysRUTtuwdc4ew0pHL86lQAFawepycdocQeE
DbsTNcGixsNdAdJ+m64xrk6RcP8ABqT+4Uenh9Pnx4tL5hSrtQ8fvMI0mDrNTthzKtHHi9cSffxg
Kwc0POh0QmO72J5zL1UPDy13msbxw6crgS62LgjgpV9EVl3SfmimClz6zenhr1YMaSxvLxrauzdC
ebBx+cZV9HTZmP4pNMR0N+RwTzy/Im9GuzEY/ZOYUBUxdKjg5aWy6PLzWbhrkD0u/+tkZjqdczhV
a/G/3e8P//5+9odeyOtkofFQwAsGrqQElNnvk0T3h8PrCxRy3c7Jsw30j9ca9JNErngaCzL9p6tF
sKmd/zXYeXPLbfLI8Ja1vIbKJD8/uxgvNTqjRny7o45Ptz+d+WvXpVZXl3ZAvLEj1dP+7s6f8yhP
JN2DUmcIO4SOe0/JvBZRCYtOWqpgJrmij0YWUcphO1xwRr2otghHPVawvKhq3sqERXAiEGobzOO1
6TnQDI6n9cjqrt4/nvCC9Xl26vp7YtBid/qxvz+hsenx8GN/N/sdh+V083S3O7ncOXZ+zeCkzwvl
zruhndrhRAAJ51j79bGFLbhy3NHSdJXWw1Endbs77Terdit0L4+cuMB57LHuwj11DnJ3FHH0fiwy
MWUDk/3m35dH7Mnn4/1u9vy4293+tGx7aQrjcAL/F7CtF5TUweEk1cIqiS4IZFQ3hoWFRnluNBDq
0GQ8YdG2C7pujoJGetKZjeafLufUiqKR4mr+2fIf0EFtM5weNvdh/PzMh27Or7w6ikva+V6PdIxC
emjIwKNDuwG+HXTCC8ocq1aR/SIAARic4+PV2VWPGXNCXMihRowOlfH+xdg8J5jhHMLHrbwR6667
c2bcOU3J4FiXiIJbxbSjTz6QzAqe2ZXQcvUEQXm1Zm0uk9j0C94fcwFm3/P18JIprJHf8irbtF1G
Y5INzKhi037dFl/yqo0rJ+FIpy96UiyyzZOcPhZNNFSvr7Fo17dQD/UAtpgNQG51QA/QIa8NtYls
3ObJZRtsUu+S2EGPAxrd73eHkzGgTG4LOAd4XQif5HEN4ItmSTlJ0RktRUZrhps+Icm5gGjzcsU7
j0xbpx6IDS8qPYHk2RIrHPC30BHBNhzQATnNmlKyZhMLiapKSktgO0SEzzYSVBsRU6EPJlgGRG0c
whARo3cLCsHM99oIAGEtKm01XNNHT++vg+i+BxrYE6lVVyevG/OohqB8+XFuyG5Qs3axrfQZzY0z
izPfcN0x3Zsvyk3SOCw0bnx1AYyd27nYndlBUHJuyEat4op8/qujAmAqKzMNLciI0x0OtfKy11j1
+9uwI+f726fj8/HHaZb+etw9/bWa3b3snk+UWjDdVtz1CzI+kH09F53NZncYjgVE7htegICYZSV5
u4BYdPjEVypKDXG8SxVdQ9ss4FLaNLDOgUBEYWCf71smpBU2A3Dwb4G62xovMJwS2qRQlrMsDQO5
T+mKDj5prPb1aNw0EE20U65FqbIFUts5wzTAbKe2WhlXK7xVnGpKMpVJ2OcT6OkKOD7Knfaih7V2
A2dQ7sCjyrpZJoZ5qkNS820w8JhisPfSC6EOYjL6t+n2dmq7zDvxb6phlNZlzse00sWUcNjGGG3W
LeCIUnCqJYoh3OINoSLomA8jVqaqopJl1WvJqrpUpZfseqHvBqdjFa3d41nGinIzdgHFdU29RHfC
Zi9Nw9Ijz/sI9GUFZ20RuK4YiOFQWWWBTW0srS7P20Wj1Bt5sQS4JkHdB3UXg86co8y4H4QPnCmw
kFw3hnnFQAjF8opZ3hL1Ed/JZIR5/qoNFD57vbB9YBhYKS7PydiDDo0ZDM5GXVwEso7iiH/6QMnc
JpE28oMzNZm9pWLqZcpVZIQJSNeyEgUsU9fDXhHdH2//ncnjyxMV9wUyhdUZTzmmNRRAF1k8Qiez
PCqvUUnLRAY7rNn4KqImyCBtO8QCmtlQft46nz+7h+Nph06BKH1MzfHWD3gzInc6InGX6ePD853f
KXWVS+toogE6djp1YNLIQvoJtKCe4FEbAcGkhqQx1NeqlzG50MhnLWyHot0ZHVr+u/z1fNo9zMrD
LPq5f/wDj+G3+x/7W+PWort6e7g/3gFYHiOrM4dbNgLd2eo9HW++3x4fQglJvCYoNtX/Lp92u+fb
m/vd7MvxSXwJZfIWaaf4+Z98E8rAw2kkP2hT/Gx/2nXYxcv+HjVFYycRWb0/kU715eXmHpof7B8S
b46uGximk8D29/vDf0N5UthRLfMuppi24SE22rB09J+z5AiEh6Pl5q2PoqYDtulH2G1ZxBxkcUMA
MYlAVsNNihWmPaZFgPuUhPWeRo/u8wOp4SQgVtytOXFdNzUT5FJeUPI336hoUjLy/55uj4de8UDl
2JFrL/pX9EvfnmIpGew8AZ1MR+LqQV18r3rAMGyf6RdoPSHGS6b9ukwEjm91E3FlBz7pUZUq0AlX
ONNaXX3+dM68PGV+eWlGq+jBwyUzhSD9GJtoBf+fky8i0Smlaeu3rBLWxkuM5yeW1pZDKp0LZWi/
4KPNpbABzBSzESBiSz2uQa4huIXlFXUoR0x3o63sdiMC9vWkKgOiNhKosgwXiPMviIQGelfhdtao
Gg/4X12BpL5oxkcw8Akbwf77nTlXDNKIfT6LNpabQYAqKc4urmzYkl1zK9cjPiYmJuAqF0j/yQkx
NSb0pu6wFJjSFHz46mMEhu72EUewqE4SiAWGOB1u6wOpNgSsH3Oog3bxvIKZdgTEWcGi0vecpMcl
xKp15pYLoDYjbrVF/UU78fANhoYgelpxNJkBufSjGgdW9Ouee8aSFyWrMeZPJOakShxt3hgsglUZ
KdP0t+aSK9vxtSEgIm5RR7kEdoaviHasq8mUmKJF6fZW6XYmX7496610amyv4WoBbSnA0HooyRFM
FLGI8vYaQ/4A2bxPOnR5um2rDWvnV0XeptK0hrVQmNIaKkD2WlYoluc5LQXbrTCS6yClti/p6SQa
Lbzhr3ZPP45PDzcHmFQPx8P+dLSVQ0N5r5CNHc4sj83S9ZfZg4KTELriwun7i454KXWUXMoUsCPK
O0/swxizw/en4/67oYcu4rq0TeV7ULsQIOvUwIF0Rw9ZjYKKbS6KB10AUes/rFbGkqQ/x0XJBlY5
MGnMPOq6y6Gz/l/PTk83t/vDnT9RpTKSwkenrmgXTNrXmBMKdW7U+o8U+pmVnR+cVeo+2FFpGu0b
uPEO2i2wxy9h2yHf+XTMrgybnQHSX2g4lw8AD8RMHPEJmZskoblsqJIVXTJxUTBYLPrjY4os3v1U
hSw3efA3pZs8qQeqaEVZ2WuqRS1iM4JVnwKEYf6Ve9hev1DhzXtUNpUVS0Dn1+mUfEHLqx4KX8uc
GsoRzZYNmawQpRxCV7KoLc4/BG41xxShjVJxqgJwHigrS73XFAJ5XauWF6SJsxSloVvCL9zDHFFW
ZiJfmJZDCOh0AhiA3eagGv4ueGTNBOjzIhhGo3SlteHayJZ1OqOWPd7J62XfPMJFLEp5u0bL++7e
3xC/WCZipmAKgljBammNvMQQyWIDiYxG8A2Kh87lew9rF6iQgm6m+hLv51rEC9tAHo+SqD7cWhT0
yOM1SVRvKzdUt0mxgq1aURvyUo53fEPPuADRAfQh1GJS1iHoa9qmVJSYhyr5pbxozUW9g1mgZYMv
g6z+jABECeDdvZSZuFyhW/ptAIYvQkQN3NbCj1kARcKyNYPZsASRqlyTDTVS4b5IO+IwiDbQnbrF
RFsMspwrFpXVeOkV3dz+NC/+l1IzsMmYHUejxZ7VbwMiFVKVSc1oCXmgCl/sDhTl4h/smUwE5mBf
005Wet69fD/OfsAU9GYg6iutIdKAa/vqXsNWeRDYX6zgFlw5BCjEqswBVizh+LhHWFEQNSpKRRbX
5iVWlwJfFaCtumsK2SWqGi1PW0vaNa+tOztHhlF55X1Si0qH2DClLDbtwAJDtXyk/CmmTcJVtjCL
6EG69RMUZCUdMJxb92OjXX4iElYoETmpup9huk7irj/SxmomZGeKAD2heE4thAVXsBZfm1SGcOes
Dvi9mjvf1rmxg2B/UmUh8uLvB4f8oqVdYdRlqZCC1g/oqumZEcTjWtabaMUF2fieCBkHdvq4cNoa
C8kWsA00cUU92AAS6lo0qfWVFaz8paGwwa3E/cTesAp0TUj7/pm3EgYy5VllbomyKeoqcr/bBLZU
o4t7aHh9iXiVtkuqeyKxlJNHJvzqVjkz8hcC8YZ6DTND8qip+WQ1MBWBVGvO8CoJeTylK4JUTYW3
zmG8npaBuvrWXROU9oM74fVKhu9KaXbrCN9RP7ku3qR5jW+jMmZtgOeZTkuiPlf0EBamCRp8DOas
f/+2fz5iLMm/zn4zGDpDFoy5Xq0vzml31xbRp3cRBRzUWkRXl7SA7RDR4+gQvau4d1Q85KnAIaKX
L4foPRX/SLvKdYhoh+4O0Xu64COty3eIaD8qFtHn83fk9Pk9A/w54LDaJrp4R52uPoX7Cc5YyPst
fW9iZXM2f0+1z0Ju15GKyUjQZ0OzLuH0A0W4ZwaKMPsMFG/3SZhxBorwWA8U4ak1UIQHcOyPtxsT
CG1gkYSbc12Kq5Y+545o2uQO0WjGWpd54AX/QBFxfMn1Bgkct5uavn8bieqSKfFWYdtaZNkbxSWM
v0lSc04/Dh8oQPLPWMB0bKQpGhG42jG7761Gqaa+FgGBAWkataRncZzRB66mEDhtKa1c2a6tCwRL
g9EZPOxuX572p19+2EWUHEzJA7/hhPIFLT/b8HYPAp2EAx3wAKaoRZHQ+3uvaeBxWEQBRBunbQlZ
al8CYaou3mv0CpWW5ITaok2u1BcUqhYRqYftKS1lag8LyCpj5v3Zg1KP4aKqtOwNMznzXCaMWVSM
dBuzBEkdVSedStdW9DI8W6FOJQc26GTq16spgQ/p+TCSqDIvt/QUHmlYVTEo843Ctixg0D5Vhy3x
vkjQ028k0weMEqTRTFJGQKj+S9yBG4GtFEkBx+6a5loRqCNfUUUNL6gmpjLfBED1/v7t/ubwHa28
/sT/vh//c/jz183DDXzdfH/cH/58vvmxgwz33//cH067O5yBf357/PFbNymvd0+H3f3s583T990B
1drT5OzslncPx6dfs/1hf9rf3O//7waxhjFapI/d2mZ1xWroBKGGJ1HGQYeiQpcNdv8BEDgsuoY5
VtB3CCMFHBGMYqg8kAKLoMcA6dAABM2DjVdqrxKjzj1IOzqqI7trQId7ezQAchfJsQ9xCStHzdrT
r8fTsQsCfHzqozQYw6KJoXkJMx/NWOC5D+csJoE+qbyORJWaB2oH4SdJrRfbBtAnrYuEgpGE46HM
q3iwJixU+euq8qmvq8rPAe3cfVLvXYMNt26Ae5T7dpZMOOpS9OMUL/tkeTa/ypvMQxRNRgP9qusf
YvQblcL26cH7a1hn7EU+ev6tXr7d72//+nf3a3arefUOHaH98li0lszLJ/b5hEd+HXgUp0SP8qiO
Jb3EDvXMqWfcQ0c09YrPLy/twFseEi3lvVt29nL6uTuc9rc3p933GT/olmPMtv/s0evw8/Pxdq9R
8c3pxuuKKMr9oQXYg0uXgkTE5h+qMtueWS6BxymbCAksEUTAH7IQrZScYknJvwQ8jIw9nDJYFFde
+xfa2Pjh+N32MDnUe0Hb3nfI5cLnSeVPpYjgfx75abN67cHK5YJobvVqvTb2vcSwJvDtuiZDeQ+T
LA2OzoQaBiCIZ6sNNUAM3xephhIXhh5B08phKqb4Pn4YFKc3rReGw5pMATfQS0RVVkDrsUG8v9s9
n/zC6uh87ufcgbv7YhpJQ2HgMmrR22zInWaRsWs+9xmlg/tM1cNxnlPlq7MPsVj685UsO8gL40jj
u5uPFx4+jynYJTEQuYBJyTP8DbNFncedX3BnwqfsjAQCg0p+TqHmlx/DyMuz+aspA2mopShllF+T
cR0/p9IokNMWZUBf39GsKygvnLEexVazVwvr5MCa3Zq2f/xpv8cY1lafhwDWKkL+4tLM1uW7cr0U
JAN3CO+ew8UHeAl9IWSZ8LfbAfFWwn7XgEXp/ZTzMCke7YeWeFsFYGnlk0lgVOWVjQUoiRmMULsp
bhEx+fJtQp63POah5i31r19sv3VTTe5RbzYIBMbK8nhhw/WmEqrWQPPKGBok4WxyH6bWJcm2PTzE
tQM6UJKNbs/XbBuksRo1OEIfwuYS8ggcHPCVZbins6+lV9jVBbVOZV9fGTBAptTe+VUq3063hsP8
8WFWvDx82z3Nkt1h9zQcuT0xoJCijaq6oKwshzbWi2R4yExg+q3e6xmNC141GkQRfZ84UXjl/iPw
1M7R4rfaEmXjgaiF4+mb5Y+Ew5HzXcR1wCDJpcNjrzc4/an7fv/t/ys7kuW4deM9X+F6pxwSl2yr
HOegAxdwhhlu4qLR6MJyZJWiciy7tFT5818vAImlQfsdXPKgGyAIAr2hlyfMQv/0/fXl4VEQq6oy
FfkBtffZeSDSa/+FK0UoMZHEglmZm6M4IozJzGZ3RpFBq/6zOYKtQ4XgPLI0izTUD+WNunj3bnOV
okKVM9Q6zeDMWmhbW2JdklXl2jjsgL1IOf5Qe9kbKxlOda3QSEwWZsyhGG69u6cXjAED9ZFrdjw/
3D9+fnl9untz+7+7268Pj/duHg30RsGdgDHLw2IgF41WvzO2ec20bJL+hJHrzVgYOltFD0RVNirp
5x5T7dluSIlxHlyGBakNsz9YTjvGVx8EuibrThh0Xxt/PgGlUk0E2qhxnsbSvs03oKJscsyICisE
U7C2UtvnjjN/X9ZqbqY65QwVupkvC+yIhiXAICsxPDbpQpDXTLsaHWmyurvO9uzd0qvCw0ADaoFC
EyU47KrSftNlDNhJwBealjMiO8csm7MMaK/T9M7bpdnMeo24v2Hm4zS7A7jKGWplJodK0F6VmUpP
n7wHrhD5PlKjJP0xiaQLZ4w0cl8G0IgwlXlCXyZV1oLjHKqtmWVZ8bXNHosd1OI6gOhA+THcdPPY
is7afvsNUpKyKdxEECCSCGNgqzQGSR4i/rmIf32Dzf5vVwXWbRSB0rmZNxhSJhEnCw1PxNQIK3Dc
T3bFNg0YOtjjQWua/UeYgR8Xp6HrG8+7m9I6gRYgBcB7EVLdOGmWVsD1TQS/jbRbUq4hCXQPkTju
nWnmxTH0V0k1o25rrULS98mJKYJFDIahzUogAMAoCWEFIREB8mNHrHATeufNDlnCdjezVJ2gP/ja
0CiVzwMDKqpB4cEoJVbS0bWh76xJyVnyvJ9HkNcd0qtTs9jfFZGzyLUZDQQC22ZyJ5pGqpoMBF7x
znTYVUsqGbPmlNzA9xvML21iX7XOPPH3cvBFhzLtF2tISXWDF7X2EJglCaQMyQO07kony1tLhQJ2
wN370ypRknxk9tVVPrThbtupEbNWtkVu7w27D2W1nG3+sfCgDkOWnFulBTRxTMJcVNOw9zy9FyT0
D5/tvMTGTzk7HBM7NQg15aprR6+NNIMZGDR8l/dn9u00Sjji+q9V2H1Jxb0ENXIUtf54enh8+UqZ
Rb98u3u+D/0WSAo60GI5ogI2ohejcxXEUVVYPqICSada7q3+FcW4nEo1Xpwv3x/WFq/2gxHO1zVI
0e1XzyBXXsKx9UScmgRTN26cGRuD4pfkC/NTnbbAvmfV99BBLE9GI8A/kO7SdnDKekVXeNHeH/5/
98+Xh29aEH0m1Ftufwq/Bz8LmKZDek0bBkhMmXLCAy3oADKVzDYWlPyY9AUFbdMNiHX1KA1I2DIr
9LHEAN9kj7sBzwxNbU5HJxJ+l6eYe7PsRjFGp4fPMcPYDZyR809/s85IBxwCYxRtZ/Ue1F26YUwG
t7iDwuhg9NyHoydSJX6VQWVUgqMuhzoZbdblQ2hOc9tUp3DZipZiCKeGuyRVuWvmD++l3PpMCXTQ
k+fgYg/GjtNhyttV+fndXUZ7kgwyD7eGYuR3/329v8eL/PLx+eXp9ZubF5FqwaAuZiflsxoXbwLV
4OJfnP18J2Fx9LQ8go6sHtBZChN1/PGH+2HsCATTon3OE6+ypIHiZTMh1BjNtrF/l5Ei/hrEioi8
H2Cz2s/C30KHlZOkQ9KA1N+UY3mj9Ew1EsHswRh5jNzHZdaAKSbjsZUiG8iylI8id/x1j2FfFmM4
y7y8inulMIoOVUITyAZWGsscwWDVTBEPPp45nqxaTqUirv3SHzkro2x/8Gywi3YQgNpIGykdzujh
6o8yGmRcXqJPIMAVGD1FMeLObqKBNX+RHfcIIxaRztBQYeN2lfTVyZxQDwarDPQMqFrXAssdLj6e
u/CJeDDIeMPh4tOZCCPRvp+6EWUZb7oIZ4US7WHes4cDUHJ6+MX52dlZDOgM4C3I8mxGFT1RGLNX
pCG0QGKg1wys40PwTI1DATxTc2jQf67ty51d183BBOo9KV2HwXAEBw80mYmTCsIz6bMPOuu08C67
BjcHg+X8rL9FvF1iycFNPgnF0DBj+9IeX8tglnSIwpq6HrEYmcSgEB7LT0l9YQHd4FVqha2GdddE
q/868OxYkLi9b4FXJp7vzkJzGed47feyWxbr1ujFLtLvIM5dN+vkDhuchGmeWJoKKYf+FqB5VMDO
w5U0kI0nsLwwoQAtSROw+XONoxoqPZgdomt0Vc/dbnTpgYGELeQjoZUhb1IA7CU+aD2mqJLdIPbU
U9hioxqX02oLgzAgOgFOykT+j3Zn3cyO0CBZAQlp0acTP2F0rANq4GjkqLxl1aGBg4WhRTfHHOGP
IuFY7CcJ2c8KwC/i6vqa5zA0vNmwocMRyPkuFCLQGRvVz6ZdWWeee6Ul13kUqsm8EsceHfEE7D0n
6GEHG0R6037/8fyPN9X326+vP1hm3X9+vLfVUyxwgJ6rrWO3cZqZCF+8c4FkHpjGi4XCo016wpM8
wke2zVRYhTAEOvpol4AuYiPSM4SdEkfWszxbF7LPvadSuix7qRcMOsz0SnDA607ECV9snYyF1iVO
wcs4jr+sPP68n5odSwPWxmYVYAEti3/+6UxayBXx1+vo4frLeLxkxp+3TuAnyXj8NiIf3d5+HOsB
mtSXVyq/ZTHG1W5A9DYmjzFUq/FuHwqhFSclPdEneLiyB6U6j3nyHRa6Lq4iwd+ffzw8ojsjvOO3
15e7n3fwn7uX27dv39rFSDBJBo29I9OTX/ai6zEhvZAqgwFYEZGGaGDFY6kyCAHfO0pb0XQ7jepa
BbqelVnWpewy+vHIkHkArQ6jQwIJ4jg4Me7cSjP0KCpFUKguZDoaEH0ZU1WkUrHeuNJ077+ZrZ8m
BSca4zDimfLWNxathsvWK6JDGS4w5PzIY1KOViy1sTv+hd1lhqRUSmgQNjKA2D43del/kLAPiTbU
0V5TMsVgoMTUYKVPOHSsLGzIUQcW1UKfT6IJX1my/vL55fMbFKlv8RI5MNDhhbQgDofJOdy9HLFU
EtAII5IISQImqFMo+4KEivqOkccdghaZvP+orIeVasYyqYZgFfpsEjUBPu3ZJJCAbAqykpjvbO04
uyN2wWR40b2ICFudQTWIDOCgxVJ5IUxdCgkDaGIU6+akcRDJtbtSHhm61NJdT2Y7+xF4G9pkJ7ks
NTnvrDs9JMdYQ5NAduVnlMkWk+M2FN6q28s4xmBemEMWB87HctzjzY0vGUpoOqUPVRP4DfSkD0bV
4JpyU8FjM6eYM6Fg1hkkA4SpTRneIOiwdfIagRSgLVwP7QEz/SgfyKuHKWtnb6l4npnLr+hKJ52K
wl5xygJM+I4TCfwBUj7qfKzBd+p6pWo4+/2l/KLBeEbb9QfSiOH+8j8+CmJ0kxYMHd1wsb0W3MxE
M+0tIwCBKUovqSaruDyqHOzWX4LwXQgojnAWzmt/hLMZ71bXZeutjt6YevP5DA5OcpN0ftU8D2Qs
+/DJRetvCvwMdoJeCbJTeySY2rXHDNZ4oA6i5+8E2KnivWdNNu2KoM18I79dHsFsJ0eXHU4NHGcf
FdNhiSUJeSn5XEQ18XXXr3fh4klzwMEzQPlGNTxapUl/Vz7++Gfqh2iWN70HxgTYVbfBj6zJ/SXk
JS0encNcVaANiZ2WDRof1yIg2q4bFRjXr4dUJI7ofNB43mIQFcpcUV3sdx/+zZlQtVnGPDHBjO5u
QRFqihSf8rGsDRQJPLfx+Ib513h0QyIREUbSwqQw6f0RjqJKDrRbt55zKMoiEjvOCLoQRFWq7YH4
VyzqnnGMsrxtc6OkrqW+G1MWr9WyEWPYL122LiyQK39++ijJlZ4mEPCjUFMQKjPS9YZ2GZgG2/Pq
00dzqUKczK7yYveKjJWnu0gHrmOeuwFlWkOvUvIekXkTeeTEDglJHespFlKO4QuhJxYmAt7U97Ce
Gh3ws+tI7n8LQ8m5BBaMKfDD8DF8tqRdJsiVA804kaxaXRJdCx7ByGy+rlSX26/P60Q3vGKd2G7C
iHhU1BcdwPDI5sh5ltve+bhLO7sl0Kn2BRCtGLhb3XbPGe+eX1B5RlNThvUtPt/f2UalA05L8rqS
DNVOEtyulpHsV+B6sL+2eq+sjcx6y9O2aMYha60CZ9qgPIAk0l4ZguvdeLVXwng9CNokbbI1KShg
Vx3yUdbt2eKHvGjwKga4KHXZUP3DOEa0f7qqZbD3Nph3ij6OG3DyOmyrFgssxU+w7TC5wdFVj9Jj
FM7GqI/n2+eFXnyvrvGya2Nl2D2NHQolAdNgDZkbGEPtBwCMrZyolRDYIz8OT8ux3vpw0xRJikLQ
64CTu3BMAlvEss0SRo9ee8GNlbeGsZAfgoIct7F5Dxs7G9699Wt22nB9H7SxOGhZQM/FjWd0W4uP
cRjkzhWrKU2BCGk5yl6q7mhF2dfHpJeUP95DJoms9xJxh0C99Si7TzRHElMAVWeg50nKlhkELbTu
jaHpWcoEml8KDyreXA9Bz8J33TIiu6qjjp6bPCNIx8J+n38CzMyt0mO4AQA=
--===============2684739385947217351==--

