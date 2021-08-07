Content-Type: multipart/mixed; boundary="===============2088412167832002462=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/x86/kvm/vmx/nested.c:3824:7: warning: Access to field 'sipi_vector' results in a dereference of a null pointer (loaded from variable 'apic') [clang-analyzer-core.NullDereference]
Date: Sat, 07 Aug 2021 18:54:18 +0800
Message-ID: <202108071809.Tm9olIya-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2088412167832002462==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: clang-built-linux(a)googlegroups.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Yadong Qi <yadong.qi@intel.com>
CC: Paolo Bonzini <pbonzini@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   c9194f32bfd932e976a158d1af97a63be68a2aab
commit: bf0cd88ce363a2de3684baaa48d3f194acdc516c KVM: x86: emulate wait-for=
-SIPI and SIPI-VMExit
date:   9 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 9 months ago
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
   include/linux/compiler_types.h:303:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:295:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/i2c/i2c-core-base.c:959:6: note: Loop condition is false.  Exiti=
ng loop
           if (ACPI_COMPANION(&client->dev))
               ^
   include/linux/acpi.h:43:30: note: expanded from macro 'ACPI_COMPANION'
   #define ACPI_COMPANION(dev)             to_acpi_device_node((dev)->fwnod=
e)
                                           ^
   include/acpi/acpi_bus.h:410:4: note: expanded from macro 'to_acpi_device=
_node'
                           container_of(__to_acpi_device_node_fwnode,      \
                           ^
   include/linux/kernel.h:853:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
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
   drivers/i2c/i2c-core-base.c:959:6: note: Assuming the condition is true
           if (ACPI_COMPANION(&client->dev))
               ^
   include/linux/acpi.h:43:30: note: expanded from macro 'ACPI_COMPANION'
   #define ACPI_COMPANION(dev)             to_acpi_device_node((dev)->fwnod=
e)
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   include/acpi/acpi_bus.h:406:2: note: expanded from macro 'to_acpi_device=
_node'
           ({                                                              \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/i2c/i2c-core-base.c:959:2: note: Taking true branch
           if (ACPI_COMPANION(&client->dev))
           ^
   drivers/i2c/i2c-core-base.c:960:32: note: Assuming the condition is false
                   acpi_device_clear_enumerated(ACPI_COMPANION(&client->dev=
));
                                                ^
   include/linux/acpi.h:43:30: note: expanded from macro 'ACPI_COMPANION'
   #define ACPI_COMPANION(dev)             to_acpi_device_node((dev)->fwnod=
e)
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   include/acpi/acpi_bus.h:409:3: note: expanded from macro 'to_acpi_device=
_node'
                   is_acpi_device_node(__to_acpi_device_node_fwnode) ?     \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/i2c/i2c-core-base.c:960:32: note: '?' condition is false
                   acpi_device_clear_enumerated(ACPI_COMPANION(&client->dev=
));
                                                ^
   include/linux/acpi.h:43:30: note: expanded from macro 'ACPI_COMPANION'
   #define ACPI_COMPANION(dev)             to_acpi_device_node((dev)->fwnod=
e)
                                           ^
   include/acpi/acpi_bus.h:409:3: note: expanded from macro 'to_acpi_device=
_node'
                   is_acpi_device_node(__to_acpi_device_node_fwnode) ?     \
                   ^
   drivers/i2c/i2c-core-base.c:960:32: note: Passing null pointer value via=
 1st parameter 'adev'
                   acpi_device_clear_enumerated(ACPI_COMPANION(&client->dev=
));
                                                ^
   include/linux/acpi.h:43:30: note: expanded from macro 'ACPI_COMPANION'
   #define ACPI_COMPANION(dev)             to_acpi_device_node((dev)->fwnod=
e)
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   include/acpi/acpi_bus.h:406:2: note: expanded from macro 'to_acpi_device=
_node'
           ({                                                              \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/i2c/i2c-core-base.c:960:3: note: Calling 'acpi_device_clear_enum=
erated'
                   acpi_device_clear_enumerated(ACPI_COMPANION(&client->dev=
));
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   include/linux/acpi.h:671:22: note: Dereference of null pointer
           adev->flags.visited =3D false;
           ~~~~~~~~~~~~~~~~~~~~^~~~~~~
   Suppressed 2 warnings (2 in non-user code).
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
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
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

--===============2088412167832002462==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
223yjCD0B1vf/Q8QpTH5wq4BAA==
--===============2088412167832002462==--

