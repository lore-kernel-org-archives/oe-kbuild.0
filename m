Content-Type: multipart/mixed; boundary="===============4324882104399590437=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/x86/kvm/vmx/nested.c:3824:7: warning: Access to field 'sipi_vector' results in a dereference of a null pointer (loaded from variable 'apic') [clang-analyzer-core.NullDereference]
Date: Sun, 29 Aug 2021 10:31:49 +0800
Message-ID: <202108291041.rN1TWfO1-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4324882104399590437==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Yadong Qi <yadong.qi@intel.com>
CC: Paolo Bonzini <pbonzini@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   3f5ad13cb012939e1797ec9cdf43941c169216d2
commit: bf0cd88ce363a2de3684baaa48d3f194acdc516c KVM: x86: emulate wait-for=
-SIPI and SIPI-VMExit
date:   10 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 10 months ago
config: x86_64-randconfig-c007-20210826 (attached as .config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project ea08c4=
cd1c0869ec5024a8bb3f5cdf06ab03ae83)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dbf0cd88ce363a2de3684baaa48d3f194acdc516c
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout bf0cd88ce363a2de3684baaa48d3f194acdc516c
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           if (result =3D=3D SCAN_SUCCEED) {
               ^~~~~~
   mm/khugepaged.c:1864:2: note: Taking true branch
           if (result =3D=3D SCAN_SUCCEED) {
           ^
   mm/khugepaged.c:1872:3: note: Left side of '&&' is false
                   list_for_each_entry_safe(page, tmp, &pagelist, lru) {
                   ^
   include/linux/list.h:715:13: note: expanded from macro 'list_for_each_en=
try_safe'
           for (pos =3D list_first_entry(head, typeof(*pos), member),      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:853:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   mm/khugepaged.c:1872:3: note: Taking false branch
                   list_for_each_entry_safe(page, tmp, &pagelist, lru) {
                   ^
   include/linux/list.h:715:13: note: expanded from macro 'list_for_each_en=
try_safe'
           for (pos =3D list_first_entry(head, typeof(*pos), member),      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:315:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:303:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:295:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   mm/khugepaged.c:1872:3: note: Loop condition is false.  Exiting loop
                   list_for_each_entry_safe(page, tmp, &pagelist, lru) {
                   ^
   include/linux/list.h:715:13: note: expanded from macro 'list_for_each_en=
try_safe'
           for (pos =3D list_first_entry(head, typeof(*pos), member),      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:315:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:303:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:293:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   mm/khugepaged.c:1872:3: note: Assigned value is garbage or undefined
                   list_for_each_entry_safe(page, tmp, &pagelist, lru) {
                   ^
   include/linux/list.h:716:7: note: expanded from macro 'list_for_each_ent=
ry_safe'
                   n =3D list_next_entry(pos, member);                     =
  \
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:555:2: note: expanded from macro 'list_next_entry'
           list_entry((pos)->member.next, typeof(*(pos)), member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:852:2: note: expanded from macro 'container_of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
           ^              ~~~~~~~~~~~~~
   mm/khugepaged.c:2021:4: warning: Value stored to 'result' is never read =
[clang-analyzer-deadcode.DeadStores]
                           result =3D SCAN_EXCEED_NONE_PTE;
                           ^        ~~~~~~~~~~~~~~~~~~~~
   mm/khugepaged.c:2021:4: note: Value stored to 'result' is never read
                           result =3D SCAN_EXCEED_NONE_PTE;
                           ^        ~~~~~~~~~~~~~~~~~~~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
>> arch/x86/kvm/vmx/nested.c:3824:7: warning: Access to field 'sipi_vector'=
 results in a dereference of a null pointer (loaded from variable 'apic') [=
clang-analyzer-core.NullDereference]
                                                   apic->sipi_vector & 0xFF=
UL);
                                                   ^~~~
   arch/x86/kvm/vmx/nested.c:3791:25: note: Calling 'to_vmx'
           struct vcpu_vmx *vmx =3D to_vmx(vcpu);
                                  ^~~~~~~~~~~~
   arch/x86/kvm/vmx/vmx.h:422:9: note: Left side of '&&' is false
           return container_of(vcpu, struct vcpu_vmx, vcpu);
                  ^
   include/linux/kernel.h:853:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   arch/x86/kvm/vmx/vmx.h:422:9: note: Taking false branch
           return container_of(vcpu, struct vcpu_vmx, vcpu);
                  ^
   include/linux/kernel.h:853:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:315:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:303:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:295:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   arch/x86/kvm/vmx/vmx.h:422:9: note: Loop condition is false.  Exiting lo=
op
           return container_of(vcpu, struct vcpu_vmx, vcpu);
                  ^
   include/linux/kernel.h:853:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:315:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:303:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:293:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   arch/x86/kvm/vmx/vmx.h:422:2: note: Returning without writing to 'vcpu->=
arch.apic'
           return container_of(vcpu, struct vcpu_vmx, vcpu);
           ^
   arch/x86/kvm/vmx/vmx.h:422:2: note: Returning without writing to 'vcpu->=
arch.apic', which participates in a condition later
   arch/x86/kvm/vmx/nested.c:3791:25: note: Returning from 'to_vmx'
           struct vcpu_vmx *vmx =3D to_vmx(vcpu);
                                  ^~~~~~~~~~~~
   arch/x86/kvm/vmx/nested.c:3794:6: note: Assuming field 'nested_run_pendi=
ng' is false
               vmx->nested.nested_run_pending || kvm_event_needs_reinjectio=
n(vcpu);
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/vmx/nested.c:3794:6: note: Left side of '||' is false
   arch/x86/kvm/vmx/nested.c:3794:40: note: Calling 'kvm_event_needs_reinje=
ction'
               vmx->nested.nested_run_pending || kvm_event_needs_reinjectio=
n(vcpu);
                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   arch/x86/kvm/x86.h:71:9: note: Assuming field 'injected' is false
           return vcpu->arch.exception.injected || vcpu->arch.interrupt.inj=
ected ||
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/x86.h:71:9: note: Left side of '||' is false
   arch/x86/kvm/x86.h:71:42: note: Assuming field 'injected' is false
           return vcpu->arch.exception.injected || vcpu->arch.interrupt.inj=
ected ||
                                                   ^~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   arch/x86/kvm/x86.h:71:9: note: Left side of '||' is false
           return vcpu->arch.exception.injected || vcpu->arch.interrupt.inj=
ected ||
                  ^
   arch/x86/kvm/x86.h:71:2: note: Returning without writing to 'vcpu->arch.=
apic'
           return vcpu->arch.exception.injected || vcpu->arch.interrupt.inj=
ected ||
           ^
   arch/x86/kvm/x86.h:71:2: note: Returning without writing to 'vcpu->arch.=
apic', which participates in a condition later
   arch/x86/kvm/vmx/nested.c:3794:40: note: Returning from 'kvm_event_needs=
_reinjection'
               vmx->nested.nested_run_pending || kvm_event_needs_reinjectio=
n(vcpu);
                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   arch/x86/kvm/vmx/nested.c:3796:2: note: 'apic' initialized here
           struct kvm_lapic *apic =3D vcpu->arch.apic;
           ^~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/vmx/nested.c:3802:6: note: Assuming 'block_nested_events' i=
s false
           if (!block_nested_events)
               ^~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/vmx/nested.c:3802:2: note: Taking true branch
           if (!block_nested_events)
           ^
   arch/x86/kvm/vmx/nested.c:3805:6: note: Calling 'lapic_in_kernel'
           if (lapic_in_kernel(vcpu) &&
               ^~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/lapic.h:179:6: note: Calling 'static_key_false'
           if (static_key_false(&kvm_no_apic_vcpu))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/jump_label.h:264:15: note: Assuming the condition is true
           if (unlikely(static_key_count(key) > 0))
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/jump_label.h:264:2: note: Taking true branch

vim +3824 arch/x86/kvm/vmx/nested.c

d2060bd42e4482 Sean Christopherson 2020-04-22  3788  =

a1c77abb8d9338 Sean Christopherson 2020-03-02  3789  static int vmx_check_n=
ested_events(struct kvm_vcpu *vcpu)
55d2375e58a61b Sean Christopherson 2018-12-03  3790  {
55d2375e58a61b Sean Christopherson 2018-12-03  3791  	struct vcpu_vmx *vmx =
=3D to_vmx(vcpu);
55d2375e58a61b Sean Christopherson 2018-12-03  3792  	unsigned long exit_qu=
al;
55d2375e58a61b Sean Christopherson 2018-12-03  3793  	bool block_nested_eve=
nts =3D
55d2375e58a61b Sean Christopherson 2018-12-03  3794  	    vmx->nested.neste=
d_run_pending || kvm_event_needs_reinjection(vcpu);
5ef8acbdd687c9 Oliver Upton        2020-02-07  3795  	bool mtf_pending =3D =
vmx->nested.mtf_pending;
4b9852f4f38909 Liran Alon          2019-08-26  3796  	struct kvm_lapic *api=
c =3D vcpu->arch.apic;
4b9852f4f38909 Liran Alon          2019-08-26  3797  =

5ef8acbdd687c9 Oliver Upton        2020-02-07  3798  	/*
5ef8acbdd687c9 Oliver Upton        2020-02-07  3799  	 * Clear the MTF stat=
e. If a higher priority VM-exit is delivered first,
5ef8acbdd687c9 Oliver Upton        2020-02-07  3800  	 * this state is disc=
arded.
5ef8acbdd687c9 Oliver Upton        2020-02-07  3801  	 */
5c8beb47466522 Oliver Upton        2020-04-06  3802  	if (!block_nested_eve=
nts)
5ef8acbdd687c9 Oliver Upton        2020-02-07  3803  		vmx->nested.mtf_pend=
ing =3D false;
5ef8acbdd687c9 Oliver Upton        2020-02-07  3804  =

4b9852f4f38909 Liran Alon          2019-08-26  3805  	if (lapic_in_kernel(v=
cpu) &&
4b9852f4f38909 Liran Alon          2019-08-26  3806  		test_bit(KVM_APIC_IN=
IT, &apic->pending_events)) {
4b9852f4f38909 Liran Alon          2019-08-26  3807  		if (block_nested_eve=
nts)
4b9852f4f38909 Liran Alon          2019-08-26  3808  			return -EBUSY;
684c0422da71da Oliver Upton        2020-02-07  3809  		nested_vmx_update_pe=
nding_dbg(vcpu);
e64a8508234afb Liran Alon          2019-11-11  3810  		clear_bit(KVM_APIC_I=
NIT, &apic->pending_events);
bf0cd88ce363a2 Yadong Qi           2020-11-06  3811  		if (vcpu->arch.mp_st=
ate !=3D KVM_MP_STATE_INIT_RECEIVED)
4b9852f4f38909 Liran Alon          2019-08-26  3812  			nested_vmx_vmexit(v=
cpu, EXIT_REASON_INIT_SIGNAL, 0, 0);
4b9852f4f38909 Liran Alon          2019-08-26  3813  		return 0;
4b9852f4f38909 Liran Alon          2019-08-26  3814  	}
55d2375e58a61b Sean Christopherson 2018-12-03  3815  =

bf0cd88ce363a2 Yadong Qi           2020-11-06  3816  	if (lapic_in_kernel(v=
cpu) &&
bf0cd88ce363a2 Yadong Qi           2020-11-06  3817  	    test_bit(KVM_APIC=
_SIPI, &apic->pending_events)) {
bf0cd88ce363a2 Yadong Qi           2020-11-06  3818  		if (block_nested_eve=
nts)
bf0cd88ce363a2 Yadong Qi           2020-11-06  3819  			return -EBUSY;
bf0cd88ce363a2 Yadong Qi           2020-11-06  3820  =

bf0cd88ce363a2 Yadong Qi           2020-11-06  3821  		clear_bit(KVM_APIC_S=
IPI, &apic->pending_events);
bf0cd88ce363a2 Yadong Qi           2020-11-06  3822  		if (vcpu->arch.mp_st=
ate =3D=3D KVM_MP_STATE_INIT_RECEIVED)
bf0cd88ce363a2 Yadong Qi           2020-11-06  3823  			nested_vmx_vmexit(v=
cpu, EXIT_REASON_SIPI_SIGNAL, 0,
bf0cd88ce363a2 Yadong Qi           2020-11-06 @3824  						apic->sipi_vecto=
r & 0xFFUL);
bf0cd88ce363a2 Yadong Qi           2020-11-06  3825  		return 0;
bf0cd88ce363a2 Yadong Qi           2020-11-06  3826  	}
bf0cd88ce363a2 Yadong Qi           2020-11-06  3827  =

5ef8acbdd687c9 Oliver Upton        2020-02-07  3828  	/*
5ef8acbdd687c9 Oliver Upton        2020-02-07  3829  	 * Process any except=
ions that are not debug traps before MTF.
5ef8acbdd687c9 Oliver Upton        2020-02-07  3830  	 */
6ce347af1499de Sean Christopherson 2020-04-22  3831  	if (vcpu->arch.except=
ion.pending && !vmx_pending_dbg_trap(vcpu)) {
5ef8acbdd687c9 Oliver Upton        2020-02-07  3832  		if (block_nested_eve=
nts)
5ef8acbdd687c9 Oliver Upton        2020-02-07  3833  			return -EBUSY;
6ce347af1499de Sean Christopherson 2020-04-22  3834  		if (!nested_vmx_chec=
k_exception(vcpu, &exit_qual))
6ce347af1499de Sean Christopherson 2020-04-22  3835  			goto no_vmexit;
5ef8acbdd687c9 Oliver Upton        2020-02-07  3836  		nested_vmx_inject_ex=
ception_vmexit(vcpu, exit_qual);
5ef8acbdd687c9 Oliver Upton        2020-02-07  3837  		return 0;
5ef8acbdd687c9 Oliver Upton        2020-02-07  3838  	}
5ef8acbdd687c9 Oliver Upton        2020-02-07  3839  =

5ef8acbdd687c9 Oliver Upton        2020-02-07  3840  	if (mtf_pending) {
5ef8acbdd687c9 Oliver Upton        2020-02-07  3841  		if (block_nested_eve=
nts)
5ef8acbdd687c9 Oliver Upton        2020-02-07  3842  			return -EBUSY;
5ef8acbdd687c9 Oliver Upton        2020-02-07  3843  		nested_vmx_update_pe=
nding_dbg(vcpu);
5ef8acbdd687c9 Oliver Upton        2020-02-07  3844  		nested_vmx_vmexit(vc=
pu, EXIT_REASON_MONITOR_TRAP_FLAG, 0, 0);
5ef8acbdd687c9 Oliver Upton        2020-02-07  3845  		return 0;
5ef8acbdd687c9 Oliver Upton        2020-02-07  3846  	}
5ef8acbdd687c9 Oliver Upton        2020-02-07  3847  =

6ce347af1499de Sean Christopherson 2020-04-22  3848  	if (vcpu->arch.except=
ion.pending) {
55d2375e58a61b Sean Christopherson 2018-12-03  3849  		if (block_nested_eve=
nts)
55d2375e58a61b Sean Christopherson 2018-12-03  3850  			return -EBUSY;
6ce347af1499de Sean Christopherson 2020-04-22  3851  		if (!nested_vmx_chec=
k_exception(vcpu, &exit_qual))
6ce347af1499de Sean Christopherson 2020-04-22  3852  			goto no_vmexit;
55d2375e58a61b Sean Christopherson 2018-12-03  3853  		nested_vmx_inject_ex=
ception_vmexit(vcpu, exit_qual);
55d2375e58a61b Sean Christopherson 2018-12-03  3854  		return 0;
55d2375e58a61b Sean Christopherson 2018-12-03  3855  	}
55d2375e58a61b Sean Christopherson 2018-12-03  3856  =

d2060bd42e4482 Sean Christopherson 2020-04-22  3857  	if (nested_vmx_preemp=
tion_timer_pending(vcpu)) {
55d2375e58a61b Sean Christopherson 2018-12-03  3858  		if (block_nested_eve=
nts)
55d2375e58a61b Sean Christopherson 2018-12-03  3859  			return -EBUSY;
55d2375e58a61b Sean Christopherson 2018-12-03  3860  		nested_vmx_vmexit(vc=
pu, EXIT_REASON_PREEMPTION_TIMER, 0, 0);
55d2375e58a61b Sean Christopherson 2018-12-03  3861  		return 0;
55d2375e58a61b Sean Christopherson 2018-12-03  3862  	}
55d2375e58a61b Sean Christopherson 2018-12-03  3863  =

1cd2f0b0dd9218 Sean Christopherson 2020-04-22  3864  	if (vcpu->arch.smi_pe=
nding && !is_smm(vcpu)) {
1cd2f0b0dd9218 Sean Christopherson 2020-04-22  3865  		if (block_nested_eve=
nts)
1cd2f0b0dd9218 Sean Christopherson 2020-04-22  3866  			return -EBUSY;
1cd2f0b0dd9218 Sean Christopherson 2020-04-22  3867  		goto no_vmexit;
1cd2f0b0dd9218 Sean Christopherson 2020-04-22  3868  	}
1cd2f0b0dd9218 Sean Christopherson 2020-04-22  3869  =

15ff0b450b6541 Sean Christopherson 2020-04-22  3870  	if (vcpu->arch.nmi_pe=
nding && !vmx_nmi_blocked(vcpu)) {
55d2375e58a61b Sean Christopherson 2018-12-03  3871  		if (block_nested_eve=
nts)
55d2375e58a61b Sean Christopherson 2018-12-03  3872  			return -EBUSY;
15ff0b450b6541 Sean Christopherson 2020-04-22  3873  		if (!nested_exit_on_=
nmi(vcpu))
15ff0b450b6541 Sean Christopherson 2020-04-22  3874  			goto no_vmexit;
15ff0b450b6541 Sean Christopherson 2020-04-22  3875  =

55d2375e58a61b Sean Christopherson 2018-12-03  3876  		nested_vmx_vmexit(vc=
pu, EXIT_REASON_EXCEPTION_NMI,
55d2375e58a61b Sean Christopherson 2018-12-03  3877  				  NMI_VECTOR | INT=
R_TYPE_NMI_INTR |
55d2375e58a61b Sean Christopherson 2018-12-03  3878  				  INTR_INFO_VALID_=
MASK, 0);
55d2375e58a61b Sean Christopherson 2018-12-03  3879  		/*
55d2375e58a61b Sean Christopherson 2018-12-03  3880  		 * The NMI-triggered=
 VM exit counts as injection:
55d2375e58a61b Sean Christopherson 2018-12-03  3881  		 * clear this one an=
d block further NMIs.
55d2375e58a61b Sean Christopherson 2018-12-03  3882  		 */
55d2375e58a61b Sean Christopherson 2018-12-03  3883  		vcpu->arch.nmi_pendi=
ng =3D 0;
55d2375e58a61b Sean Christopherson 2018-12-03  3884  		vmx_set_nmi_mask(vcp=
u, true);
55d2375e58a61b Sean Christopherson 2018-12-03  3885  		return 0;
55d2375e58a61b Sean Christopherson 2018-12-03  3886  	}
55d2375e58a61b Sean Christopherson 2018-12-03  3887  =

15ff0b450b6541 Sean Christopherson 2020-04-22  3888  	if (kvm_cpu_has_inter=
rupt(vcpu) && !vmx_interrupt_blocked(vcpu)) {
55d2375e58a61b Sean Christopherson 2018-12-03  3889  		if (block_nested_eve=
nts)
55d2375e58a61b Sean Christopherson 2018-12-03  3890  			return -EBUSY;
15ff0b450b6541 Sean Christopherson 2020-04-22  3891  		if (!nested_exit_on_=
intr(vcpu))
15ff0b450b6541 Sean Christopherson 2020-04-22  3892  			goto no_vmexit;
55d2375e58a61b Sean Christopherson 2018-12-03  3893  		nested_vmx_vmexit(vc=
pu, EXIT_REASON_EXTERNAL_INTERRUPT, 0, 0);
55d2375e58a61b Sean Christopherson 2018-12-03  3894  		return 0;
55d2375e58a61b Sean Christopherson 2018-12-03  3895  	}
55d2375e58a61b Sean Christopherson 2018-12-03  3896  =

6ce347af1499de Sean Christopherson 2020-04-22  3897  no_vmexit:
55d2375e58a61b Sean Christopherson 2018-12-03  3898  	vmx_complete_nested_p=
osted_interrupt(vcpu);
55d2375e58a61b Sean Christopherson 2018-12-03  3899  	return 0;
55d2375e58a61b Sean Christopherson 2018-12-03  3900  }
55d2375e58a61b Sean Christopherson 2018-12-03  3901  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============4324882104399590437==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============4324882104399590437==--

