Content-Type: multipart/mixed; boundary="===============2550262926698642320=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/x86/kvm/mmu/mmu.c:3141:2: warning: 4th function call argument is an uninitialized value [clang-analyzer-core.CallAndMessage]
Date: Sun, 08 Aug 2021 18:35:21 +0800
Message-ID: <202108081808.kFrlWY93-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2550262926698642320==
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
:::::: branch date: 17 hours ago
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

--===============2550262926698642320==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============2550262926698642320==--

