Content-Type: multipart/mixed; boundary="===============0057493085654278392=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/x86/kvm/vmx/nested.c:3824:7: warning: Access to field 'sipi_vector' results in a dereference of a null pointer (loaded from variable 'apic') [clang-analyzer-core.NullDereference]
Date: Sat, 07 Aug 2021 17:30:33 +0800
Message-ID: <202108071725.T5L45z9U-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0057493085654278392==
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
:::::: branch date: 14 hours ago
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
           ^
   drivers/tty/serial/serial_core.c:2273:3: note: Calling 'uart_change_pm'
                   uart_change_pm(state, UART_PM_STATE_ON);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/serial_core.c:2139:27: note: Value assigned to field =
'tty', which participates in a condition later
           struct uart_port *port =3D uart_port_check(state);
                                    ^~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/serial_core.c:2141:6: note: Assuming 'pm_state' is eq=
ual to field 'pm_state'
           if (state->pm_state !=3D pm_state) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/serial_core.c:2141:2: note: Taking false branch
           if (state->pm_state !=3D pm_state) {
           ^
   drivers/tty/serial/serial_core.c:2273:3: note: Returning from 'uart_chan=
ge_pm'
                   uart_change_pm(state, UART_PM_STATE_ON);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/serial_core.c:2276:3: note: Calling 'spin_unlock_irq'
                   spin_unlock_irq(&uport->lock);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:404:2: note: Value assigned to 'console_suspend=
_enabled', which participates in a condition later
           raw_spin_unlock_irq(&lock->rlock);
           ^
   include/linux/spinlock.h:285:35: note: expanded from macro 'raw_spin_unl=
ock_irq'
   #define raw_spin_unlock_irq(lock)       _raw_spin_unlock_irq(lock)
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/serial_core.c:2276:3: note: Returning from 'spin_unlo=
ck_irq'
                   spin_unlock_irq(&uport->lock);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/serial_core.c:2277:7: note: Assuming 'console_suspend=
_enabled' is true
                   if (console_suspend_enabled || !uart_console(uport)) {
                       ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/serial_core.c:2277:31: note: Left side of '||' is true
                   if (console_suspend_enabled || !uart_console(uport)) {
                                               ^
   drivers/tty/serial/serial_core.c:2282:8: note: Assuming 'ret' is not equ=
al to 0
                           if (ret =3D=3D 0) {
                               ^~~~~~~~
   drivers/tty/serial/serial_core.c:2282:4: note: Taking false branch
                           if (ret =3D=3D 0) {
                           ^
   drivers/tty/serial/serial_core.c:2296:5: note: Calling 'uart_shutdown'
                                   uart_shutdown(tty, state);
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/serial_core.c:276:2: note: 'uport' initialized here
           struct uart_port *uport =3D uart_port_check(state);
           ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/serial_core.c:284:6: note: Assuming 'tty' is null
           if (tty)
               ^~~
   drivers/tty/serial/serial_core.c:284:2: note: Taking false branch
           if (tty)
           ^
   drivers/tty/serial/serial_core.c:287:6: note: Assuming the condition is =
true
           if (tty_port_initialized(port)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/serial_core.c:287:2: note: Taking true branch
           if (tty_port_initialized(port)) {
           ^
   drivers/tty/serial/serial_core.c:293:7: note: Assuming 'uport' is null
                   if (uport && uart_console(uport) && tty)
                       ^~~~~
   drivers/tty/serial/serial_core.c:293:13: note: Left side of '&&' is false
                   if (uport && uart_console(uport) && tty)
                             ^
   drivers/tty/serial/serial_core.c:296:8: note: 'tty' is null
                   if (!tty || C_HUPCL(tty))
                        ^~~
   drivers/tty/serial/serial_core.c:296:12: note: Left side of '||' is true
                   if (!tty || C_HUPCL(tty))
                            ^
   drivers/tty/serial/serial_core.c:297:22: note: Passing null pointer valu=
e via 1st parameter 'uport'
                           uart_port_dtr_rts(uport, 0);
                                             ^~~~~
   drivers/tty/serial/serial_core.c:297:4: note: Calling 'uart_port_dtr_rts'
                           uart_port_dtr_rts(uport, 0);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/serial_core.c:160:17: note: Access to field 'rs485_co=
nfig' results in a dereference of a null pointer (loaded from variable 'upo=
rt')
           int rs485_on =3D uport->rs485_config &&
                          ^~~~~
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

--===============0057493085654278392==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

H4sICDgtDmEAAy5jb25maWcAjFxLd9w2st7nV/RxNplFEkmWNc69Rws0CTaRJkgGIPuhDY4itz26
kSVPS0rsf3+rAD4AsNjJLDJuVBHPenxVKOj7775fsNeXp8+3L/d3tw8P3xafDo+H4+3L4cPi4/3D
4X8XabUoq2bBU9H8BMzF/ePr15+/vr8yV5eLdz+dn/109uPx7u1ifTg+Hh4WydPjx/tPr9DB/dPj
d99/l1RlJlYmScyGKy2q0jR811y/uXu4ffy0+PNwfAa+xfnlT9DP4odP9y//8/PP8N/P98fj0/Hn
h4c/P5svx6f/O9y9LC7Pb69+f3d2d/Hul6vz2w8f7s4uL9++//3d1b8Ph/OPl4ePvxwuzz7+8v5f
b/pRV+Ow12d9Y5FO24BPaJMUrFxdf/MYobEo0rHJcgyfn1+ewf+8PhJWmkKUa++DsdHohjUiCWg5
04ZpaVZVU80STNU2dduQdFFC13wkCfWb2VbKm8GyFUXaCMlNw5YFN7pSXldNrjiDdZZZBf8BFo2f
wrl9v1hZOXhYPB9eXr+MJ7lU1ZqXBg5Sy9obuBSN4eXGMAU7J6Rort9eQC/9lCtZCxi94bpZ3D8v
Hp9esONhq6uEFf22vnlDNRvW+ntkl2U0KxqPP2cbbtZclbwwqxvhTc+nLIFyQZOKG8loyu5m7otq
jnBJE250gxI1bI03X2JnojnHX+GE/a9i+u7mFBUmf5p8eYqMCyFmnPKMtUVjJcI7m745r3RTMsmv
3/zw+PR4GJVV7/VG1J5+dA34/0lT+IuvKy12Rv7W8pYTM9iyJsmNpfpfJarS2kguK7U3rGlYkpPL
azUvxJIksRasIDGiPV+mYFTLgTNmRdFrEijl4vn19+dvzy+Hz6MmrXjJlUisztaqWnpq7JN0Xm1p
iih/5UmDKuMJmkqBpI3eGsU1L1P60yT3tQNb0koyUVJtJhdc4eL2076kFsg5S5h0609CskbBOcJO
gZ43laK5cBlqw3CdRlZpZOyySiU87eyY8M23rpnSvJvdcIJ+zylftqtMhyd9ePywePoYndlo/6tk
rasWxnRSllbeiFYAfBarAt+ojzesEClruCmYbkyyTwri9K3V3ozCFJFtf3zDy0afJKLJZmkCA51m
k3DULP21JflkpU1b45Qjq+Z0MalbO12lrQ+JfNBJHqsizf1ngAKUloDLXIO34aAG3rzKyuQ36FWk
lf7heKGxhglXqUgINXVfidTfbNvmrUmschS5bqa2704kJnMclqc4l3UDXZWBwenbN1XRlg1Te9Km
dFzEdPvvkwo+73cKdvHn5vb5j8ULTGdxC1N7frl9eV7c3t09vT6+3D9+ivYOt50ltg+nH8PIG6Ga
iIwHTswEtcVKY9BR74p1ivYr4WBdgd7MU8zmrQc9QAYQEumwCbSyYPu+o2GulrTDVmqjtAj2HWxP
725SoRH2pKSS/4O9tHuuknahKdEs9wZo4wLgh+E7kEBvE3TAYb+JmnAj7KedthGkSVObcqq9USw5
TTAW8MmlL9nh+kKItRTlhTcjsXb/mLbYk/abcxjIqdAA57DTDDyayJrri7NRzkXZAD5mGY94zt8G
tqYtdQdikxyMvjVevV7ou/8cPrw+HI6Lj4fbl9fj4dk2dyskqIHV1m1dAzDWpmwlM0sGOD8JhNxy
bVnZALGxo7elZLVpiqXJilbnE3gOazq/eB/1MIwTU5OVqtra26yarbjTfK584Qb8kqwIHXAduJ0Z
e8mYUCakjHgoA9fAynQr0iYnegTjMPela69FqkmT1tFVGoLTkJqBdbvhKt4Ck7crDrs6aU/5RiSc
mAZocWwXJjPlKjtFX9bZ/EQtTPDHRfgK6ALMGvVRzpN1XcH5ohsBVOP5Gie2GMjYnv0+wcvDcaQc
bD5godhe9SeCppEYc1mg2dxYvKG807e/mYSOHezw4LhKowgJGqLACFrCeAga/DDI0qvo96W/KGiZ
CRKWVYV+LbQkoDhVDW5G3HDEdfbUKiVBFcNjj9g0/IMYYggbAgsi0vOrIMQAHjDZCa8twLRmMkY4
ia7XMJuCNTgdz73V2fgjNvvRSBKckYDIwpN3DXIu0a1NEJ4ThklzloO2+tjF4aoBqQTmNP5tSin8
8DmQ6GiJ1IExwNJZG0ynbfgu+gk2wduSugpWJVYlKzJPPu3M/QaLRP0GnYO982fKREXhk8q0KkI3
LN0ImHO3i5SqjlEbHozFC1lqtp5SwOBLppTwj22Nve2lnraY4LSGVrt1qLqN2PBAeqZHPLqZHsAg
268iwELYBHaiAFRPrMpbS9QveqVxRTB4CcA+MFAQMAXRkjV9tpUYCHriaep7G6cuMLwZwhJPxM7P
gnSCdc9d1rA+HD8+HT/fPt4dFvzPwyNgMAaOO0EUBph7hFwznbt5WiIs32ykjSlJzPcPR/RQsnQD
9s54xuVVsmZwWmpNknXB6IyCLtolZbyKyvOA+DWcnAJE0IlF4DryNssAFFnEMATTM7FGlYkCFIUY
0po+67iCqCdMA/bMV5dLP7Td2XRw8Nv3QrpRrU1UwPQTCOE9bXK5TWPtfHP95vDw8eryx6/vr368
uvTTgGvwjD148valYcnaIdsJTco2En+JeE2VCGldtHt98f4UA9thCpNk6E+772imn4ANuju/iuNq
Z4enjYO9MPZEAvs+xOSsEEuFSQQbMhHKjrEddrSjaAzACCamuXWgBAdICgxs6hVITRMpueaNg1Uu
foSYwouoOYCcnmSNBHSlMM2Rt35uPOCzwkuyufmIJVelSwKB19NiWcRT1q2uOWz6DNkaVbt1rJhi
zBsI3Q3A1bce/rGpPPvxHIjvzA5M3ardHFtrs3veCWbgtTlTxT7BnBb3IEW9cgFOASan0NeXUUyh
GR4XSj2eCU9c0sxa0vr4dHd4fn46Ll6+fXHBbBAIRQuljZGkUtCo3BlnTau4g76h3u8uWO3HrNgm
a5t8863UqirSTGg65ap4A1gBZHFmeCfIgNVUEQ7Edw2cOcrRiM6GXpHh5LDIgNpVmKLWtF1HFibH
/rswhMQgOoO42sM/fcsQQXh9DsLR5aMhUCtaFeyYixYqCUKYAYofTAGFZPagRwB3AA2vWu4n8OAc
GOZ5Alfctbl5zWx5vkEDUyxB1syml7SezoOkG/w09YbqxxLyjQw+BSnecC84CvpxKhUnZcP+qGsS
8NLRyl02tm4x3QfKUzQdGh23YUNLxbA9UcaLSjz1rH0qYujkVzjPvEIwYqdFfMsSVQ5zHsP79Xty
UrLWCU1ABHdBkwAHUFh+cCB1GwqlFa8SHHTnHVwS5spnKc7naY2OzEAi612SryJkgMnkTWQvIFKV
rbR6njEpiv311aXPYMUCQjWpPTEUYK6tZTJBoIf8G7mb2CwfBWFKEkNHXnAyo4gTARV11sGLULtm
sAjTxny/8q9i+uYEsCNr1ZRwk7Nq59+N5DV3QhckfFIpqDNkIHWiClBOaV2pNoqV4EyXfAWdn9NE
vBiakHpsGRPGBph1gYAjvNiwcoFXtWbqCSAy6xoDk6q4AuTn4vfuRtmmBPDuasYgST8w7xowW1jw
FUv28QDSXr/A4c1adeSAc5wfrbtfGxysFzF8fnq8f3k6umT7KFdjcNK5lbZE7aQMx4RVsTq0ThOO
BLPlnDZZHrP1VtWWRxFAB+dnVhHoTheVAnZrC9bdL4Y+s6oL/A8PUwUDj3hPR0FSJKB6YF/mD0XT
gUsHAgSdF0PqOwuZZk4zFQpO0qyWiNUi/JLUzJVm6EYkgZ3AnQT3DMqSqD15Q+NwnsU6jpERuHQg
j7FbQLc2qMcBeMMZyIGLKBzR4si5aaBVM2uUN1diM5rJAlWk6OED3j22/Prs64fD7Ycz73/BpmAW
EwKXSmOGQLU1JQaosegBZT+/kdV1MHMa7kYXc/1bNPOjeDSKAjd2dWC20kqGJ6chzorn1EqyjGJE
euNWNu7y3Kz5Xk8k3PI2emcPxFQZlR+mGKe6EjJg8peUYZ4Jsj2/MednZ3Oki3ezpLfhV0F3Z57T
ubk+9w7fgc5c4dWhv5Q133HqStW2Y6hIRZCOWLdqhRmJ/aQ/TAlSzlcxnZu09euL6nyvBboYUFVA
s2dfzzuh9ZPjmPlADaQMbv89BM2rEr6/CGS+i9Q3qfYS2s6zxPYwgKwxy64qC/qaN+bEy2I6kyRT
G5WDdtHOC+RIZHtTpE2fP5zLbRZiw2u8rvITOqcCxckJsjQ1kc20NGfpemXKwQ4UbXxbNuFR8K9N
LCcdl64LiHNq9F1Nh6UJLozbbaZAipViYemLz9fkdcDiHPjTX4fjAlzf7afD58Pji106S2qxePqC
1YpemrHLJXiZpi65MLm06gl6LWqbUfU0q8tZ8CGQ8pP00uiC8zpoQePQt46+XZotW3NbPEIJtoyY
54I6ICWFt6/b3xxMAMuTiUTwMec8l8fAvfJok1+9jFsd1GDeq3VbR53BqeRNl3nHT+o0iToBmW7A
Wbq5Wcijveze6BeR1651RYbErq86UW468UxrH8A63vA4bJviGwMiq5RIuZ9YCmcBhowoJfI5WLzI
JWvAFe/j1rZpQg9imzcwOnXrYYkZm37QMBonuT2rSMdsaTb+UhwkQ+tobmPQ5HDoLDksrwmJk5mK
WtJuL+qUrVaKr+K8drDmHNAoK6KRk1ZDDGxSDcbSOqnxBnS0cW7L0G60NdiMNJ5+TCNk8MQaEhSt
ir6ednOsIEAEi08jX8vSGdjOls5tQc8lqjjkcgK+pLMq7tuZK2d/FyVv8uoEm+Jpi8V4WIS4ZQrR
UEFNdtR+VnPPhoTt3YVlOAQSToh23dDX/E5Nd+BZTpyU+/dM6gnkFK+dQQjBo8xgQbCwk+hdh7Cu
L+FaZMfDf18Pj3ffFs93tw9RINmr4VzREvH10LH48HDw6u6hp04hg95tUmxVbSCcT1PSfgZckpft
bBcNpxFtwNQn4EhxcKQ+WeeDlWFFXnBpATUy0gHu33p5u1XL1+e+YfED6Oji8HL307+8i0ZQWxc1
eh4a2qR0P8JWlxDt8ZllwTzW+Vke8iXl8uIMduS3VqgAXgvNwPrTooe0VDLMo1CaD5Cp9G4ybGC0
11lQ4DWzWrcT94+3x28L/vn14TaCQTbBNpsF2L29oOTGIWn/IsU1xb9t7qe9unSIHCTMv9jrSr+H
L8eVTGZrF5HdHz//dXs8LNLj/Z/BjTFP/foCgLMQy/k3MUpaUwWWNYoms61Jsq4Wg0rAVdWq4EMH
4VWHJWEobpNaczEJhHzDNVAPUpvDp+Pt4mO/nA92OX4l2wxDT55sRGBc134qvm/BpFtYD+5Tsvh+
v2s3mMALSuQG6qSKAxulFFXYwmwBgl9DM/QgdewWsHW4znSJaqzZCXvcZPEYfaobVLnZY7bQVj92
wX/IGktpsNjlvmY+JBqIZWXCKhds3GUAXZvKZfejWmi8LmhB5G+i8MUdzRgfQzcAgBUJeOyswsy0
3VCZxl1I2c4+WkDos9m9O/evPAFq5+zclCJuu3h3Fbc2NWvtHV/wXOj2ePef+5fDHQaUP344fAG5
RCs8CbFckB+Wn7ikQNjWnyCIlI+X7QFUrp7B4+5bEDxMnfHaXcSSVvbXVmJyezmTMXaPt2wkhxm7
bOYh0+Sq185zjLDa0lo7rAJMENpG0RHeF2HZLSiWWeot83QSy3rwnrRVJQhdI7KgKMkOI2DjsPSA
uK9fk/Na470rRahqur3rBl9/ZVSpXNaWLqdmJZd+oLLhYSnaWIVle8whaoyI6PwQJItVW7VEIYSG
k7NAw70CIRJR4GoazJl0ZZBTBs37DOwMscsgSxabSTdz94zO1bmYbS5AN8XkMhJLELRJ9yVDMGkr
2t0XcZdaYpKne/gWnwFAUFBcTDlgHUAnRwgOYj5Xy0UeDz7Sm/0w35olLMcVsUY0KXYguyNZ2+lE
TP9AVP0Li6k0YACB+Q5bfOvKHOwXVCfE+H0dmOq2KMwkjqc2qvxpKlG8h3YVwtGcd+kFmxgiyVhy
T7F00uW0wdW+d9el0WS6VnfDNkNLq3am4qXDWgim3Huo/pUlwVsVqcdP7YnmCTKcIHVVQ0EI5Cgn
CzDtQRUgVVHXk1oX3yB7lJOdb0WTg0F1wmBLKWKJQesC4aG1QOspqJl5KBOb31OPZJz2VCidMkZU
vfEr8aoIvUSf5vynfKZuyT6RjsWQcRLOnrYlYsIVvLsih9JV1jjkNFlH2t9t8QTU25MVILWY/ENP
Bm7Sqg5hUi3JXukEtWfj2EEtXuxOd6KhbX341VjeR/Tr1ebNdeKzEF11ZMuONb7xNJ28dS/9pk4Q
dka41PdQxThydPFgaJ1RP7VYdSln7ylVN5OOziKXO0RkS+HKC6j9RilxM/GgKtE2OsUGXG/TvwVW
W6/G8AQp/tyJC/k5RRrni/XPEJx2lz6hmxygFHj0ABGNlzHgXPyqXjJx65VM91fA0xPuQeE8ZXyj
73ByUm1+/P32+fBh8YcrRf5yfPp4H6eAkK3bwVNzs2w95mVdfVNfuXtipGCy+GcSMHEoSrLy928Q
fd8VmEiJTwB8PbCl7xqrsce/tdBZCP84uqO2b3lNXNYec7XlKY4eNJ3qQatk+KMCxewdm+UUdL6w
I6NmKT5TOdjxYGXoFnCT1ug1hqdDRkh7qULFECXILmjyXi6rQk9NawM4YrxcGV8FFHRif3yd6pCY
ryi6PPcijNJJKlh18Ja4zRPFH6+CmgoxrJJbQu3sy/vUdmNvreZZ1JZiQMEu4XDw5qVgdY0bx9IU
d9rYzaPsSf+YwSx5hv+H+C98Lu7xuivYrYLOfWg63u5ZVeRfD3evL7e/Pxzsn0JZ2MKZFy+GXYoy
kw06s4m1pUjwI4xtOyadKFGHLzwcAaSGLvrDbhDVkhnQuWnbNcnD56fjt4Uc86PTy0+yIKUnDtUs
kpUtoygUM4ArsMScIm1c6m1SPDPhiIMZfDm/asPXOjhjoasicrhz99RhezdkYJlChv5RTlXGxcrE
F+66m3rc4e667T23K7C7jCa0RKvhL6BrcNJF+fckztBaXKg4qitdu0pcobsg20TF7Fg6YfXPNPG7
D1cmWyFUCYMfL+wbsy+aKkbtt9TKgPsTBKm6vjz75Yq2PJN66XDniDrqfAuhqobNc+kI+ukLhb2H
HkjMzYot21P2m+SW7jkamRHAaoUw2RM8jVh7GpVAjFTaAlyvzb7R9OpH2GwNwEDLdPC9fcGhr//t
bSaJ/m/qqvJU/mbpxx03b7PK/2NJN1r2kjQ+P+jahocO0tl3Yq4DK2KpadLHJs77lJc/hM0E2T3v
o7lTAKq2z2fCGMlV28dF773v0u5vRMAnJivYinJedVdS1isQV7bmt/tjByPGw5fHgCxzyWaejdms
Et6iWhnBCxO6xsBfjY3JWIAE543+KHBDnWt5ePnr6fgHoMSpawA7s+bRWwJsATlh1DYDpPDQO/4C
ZxfkuW1b/PWoeMXMQ4BMSevhSSosBov66C9T0DX8myck9BJluDpRu4e7+MdT6Lu5Gt+Z4gvl1F6I
kFepwFSX/p/bsb9Nmid1NBg226rKucGQQTFF03HdohaniCuF4i7bHTFNx2GatizDElTAVuAaqrWY
SZ27DzcNfTOP1KxqT9HGYWduQJGP0a81LA0w9TxR1DPpJ0sdlus3okBGTU1S981h921azwuw5VBs
+zccSIVzgci3osUWR4d/rgZpo/xOz5O0Sz8l03vYnn795u719/u7N2HvMn1HV2PCyV6FYrq56mQd
Ywu64MIyuVf6WFZt0pmIDVd/depor06e7RVxuOEcpKiv5qmRzPokLZrJqqHNXClq7y25TAGvG3w/
0+xrPvnaSdqJqaKlqYvuD/XNaIJltLs/T9d8dWWK7d+NZ9nA99AhhjvmujjdEZzB/J0ZRJ3JrDHC
W1FMDc/6vp4H4KfNWoH7lDFU8Jld4pmkLusTRLA9aTIzT6zpTGassZr54ydwhvSO/j9nz9LcOM7j
X3HtYWvm0DWW/D70QZZom229Isq2kosq08n3dWrTSSpJfzvz75cg9SAo0JraQ7otAHyTIAgCYFDS
3hKx7yhhW/BoTx0g9LUB8A2BRL8GRGZ2joO0Xk9974ZERyyUqen6xSHtXxaUQUyPXeUv6KyCnHaD
zw+Zq/hlnF3yIKXHhzEGbVrQgQqhP5RBO93kkPK8j1K405JHyLM8vfw0BkMOXwCnkzOZWZaz9Cwu
vHQEFTwTQgdaRRAh1LlJJLljZ4QWpg7v1oPDl0b1iqqpFHydFPFMyuYCmLyL6qYo3QWkoaDFgSao
DtDkBXdYjvU0YRwIwSmWq3bWCo6et5YJxvYGiS9NBI2BGV4j6E4+Hz8+Le2rqt2xtIKh4XVWZHLT
zFI+iLXQCN2D7C2EKWAbgxYkRRC5+sWxDLYO69Kd7KDCxY129TGkDuQXXrBYmyb0Be/2sMy8oSlj
i3h5fHz4mHy+Tv58lO0E5dMDKJ4mcntRBP0ZooXAeQgOLQcIjaBjEBjeHBcuoTTf3R05aUcIo7JB
h2j4VjoKZRaEhk8iqiuju8mv2PWGAXdEk2L5oXbFDk139EDkQu5rtjGjKVnvaBy1L7c8DKIoYCWB
XFGyerGpT9Y3h+hAD9qTTDO+BsLKQylJWhZl38T10WnUdIge//P0nTDC08Qc71bw7drc8tC497I/
mqCiAgGVpkvrofrF1KjtIA2QUNpxCQ5MHXAD6J0/+4GSmJqFBeUGpVIJyxejgbUCOD36LZHydwDP
+H9ABtqwIfGAFIXPMhuRJzYkMu/7NU05aEy9vTgrV7OIOvoqk1lhDZ8rNizglGWsFTjomo09YAsd
fqN1/rFd7AxKUZ62uDwIwoSAKsZAyCGc2q7I0hK5AUEKFLESAKDGBYY5iGcGSK5c3VF15bbnbEoe
0JudKqexVLHG5CTgZOHyUexoiMBBHQ6sT9wjCxTGXBojZIUP/1Aru1+OrlWqDLWvpqxDxA5sTH1X
LhaLqSt/RdKoEEfKEQe1JrTrWMgn319fPt9fnyGG5IPN387KpqNhgR9P/365gAkupApf5Q/x6+3t
9f0TWZfLNXexF+FFRcceDJGEQ/gRhXT3fkvFKFWHWnZSqk1NteC1qurLotc/ZUOfngH9aDel1y66
qbSMcP/wCO7mCt33IkTSHeQ1TtvZ+dND0g0Xe3l4e316wZ0OcQ8sszYT2rmAWGjJJMo2TodRfFdE
V+jH/z59fv9xdaqoqXVpBPCShXam7izM8Q4DUg1RBDmPTBvoBlCXgq98bwhXGgs4XWen8uvM9KZt
CBqeKgXtsqoHN9YDcjDVZOnedTnWkTnuJ/pSTwkYD5hqrBYH6nJ009Ui1IV6HVrHFR3A9/7t6UEK
1UJ37mBQjG5arCoq8zAXdUVpTc2kyzVRXZlQMhyfyrSoFG5Gnh8cde6NrZ++N4LWJOv09L1eXVu3
HFick7xY9lKZ5Dsrip6GyWPNKaU5jZTZ0yiIMzJSU17oQjunChVBuGWMnWfC86tc5O995+8uyubD
FMLgujjofSv+y9BVdtTawnPYQIKSstPoiVpJeehD0dTUODQpYw6QDegb+K4jIYhRVPCzo2oNATsX
Dj2fJgCm02RTD2+Te40TkGlviobYFShC3AojVtTwUk3ZOErxyfEcAaDPpxhiqG15zEtu2voUbI9u
0fR3zc3o0Q1MxDxBV8YN/OINQNhtpM3TfHEAWI4yYYwgcPTOnEaA2jEps3RxXbFx03AFdb5hD+ok
Y7CI5MCta24NMMIDG85WbXLjbJjJw5ptqtph9yk5OxP8VIj8VIMtBgwuv3//fIImTN7u3z80b0PJ
gmIFBsAO9g0UbdyB61Sym5VPE0HVbmKDqqi6nORPKSpAEG4darN8v3/50E5ck/j+b8SPoaQsy4Xd
eCiVg82CHGytnRqy+iD5o8iSP3bP9x9yG/3x9Gawe9zgHSVqAuYbi1horQGA7+FsMATLjEAvqO47
kCFii0yz5nrfLr/eSiZ5C5e2Eu8emR241v9Dwj3LElaSTsJAoo1V02Oton7XHq6shfWvYufDhnKP
gPl2w637TZseHJtQAJuuj5NIDBcEYOS2RKkSWvSp5DHOTs4SC5BZgGArtEtivyG7Z5aWlu/f3kCp
1wCV+ktR3X+HgBuD6ZeB2qdqLSDcSw7sb5LA1WWyU1bLalB9Hh4aIMqLia1fkEHhVJWO6+mcSibC
rQ/WDg5NM5CkrPx8fHai4/l8uqfkJ1VZ5dJ7LuRCKXAz4ESjx6o/box0s34N4PH5X19Ahr5/enl8
mMisGpbsYgZ5Ei4WnqN+Ih7Ml/zQVstcIGUkoQOWFD19/M+X7OVLCLV0qcggfZSFe8Ose6uMzFO5
uSdfvfkQWn6d990y3mKt9Jbym912yU4B7Ob5waW2CbSBZBjK4v8tC6TOchS204FDNRRxnEdRMflv
/b8vj0DJ5Kc2VxlI6WoeARkeihv1elnLl7sixjM2MzmZgTsbQH2JlZuBOIBdk2mS1hJs2bZ57Myf
4j4DLFgouhcuUOzjE9tyexopCc3lDZ5RWh47tIr29rFDpjQgSnI3zVOUbYqSPxMpMzfBf9oYs5+v
31+fzeNsmjeBYPT0OieM0hEguOaWTx/fh1JWEC38RVXL47jpPNcDsTgpBfDkFkuDfAuOxWZE3UOQ
lpijlXyX1I7AfDwUm5kv5lMPqarTMM4EBJOEyGU8dEjtBymaxmSkljwSm/XUD0z9Oxexv5lOZ8hQ
QMF8OqiX3JCk1C7kUTP2FwsquldLsT14qxVSgrUYVZPNlOLEhyRczhbGnh8Jb7k2vs/Nqc42ThWI
OyKFSolCslYQe7yqRbRjpssQ6CCkNInO3fk5D1JSRxf6ONC3/pZzQdYiKGrfU9o/zZ9YDpvdh61+
0/A6KH30XEUD1lGMyBFoKJKgWq5XC6JyDcFmFlZGBPQGKqWmer055Aw3tcEy5k2nc1KkttrRtXy7
8qatu3R/0FBQpwVoj5XrRMgTbCuzNuEH/rr/mPCXj8/3Xz9VVPyPH/Ik/DD5BGkdSp88A0N/kKv3
6Q1+mptJCZIY2YL/R77DuRtzMQMGQC0wMO9QcRxzZMulI/5xAlQn2EKng5cVxReauX9OTOWzPA9c
bpj93ceK1l7QBQvhTu22d4Fh4SGz5n8Qh+DkauberQsMPgRSBg/qgCOhyOSmPSV4JUad65GAO/lG
KBisCUCCsb+ZK5WgU5ycsBup/tZ3uXv21eud7xpMnO332iVSP4rIGJt4s8188tvu6f3xIv9+H9Zq
xwsGF9LmULWwOjuE9E1KR2HZlAzQmbg123u1TsYeHYRyumQQo1CpW6iTuyxZRwo3GL6yZ7BW6zZL
I5dRk9reSAzUfn+ydMA9Q7lRASauWMeWLKBtkWTTwFCINrbJnahz5cKA6sihttrKBXWK6NPs3mES
JesnGH2PLtsFYnHmuEovuNPCqDzRdZfw+qwGTb0c6sj4zMjXs7TZgTKsNqyI0jjJ6MKkCGfVrz07
fL4//fkL3mNuNMGB4Y+HjjPttc4/TNJxI/BT14bPxhQ5yz1ccqRZiGWns9xrGW2YUd7mh4wMjmXk
F0RB3t56dOKdAqnInrA0RzLYM7yCWOnNPJc9c5soDsKCy0IOSCaKeZiRejeUtGR2TD5mSSaGflht
Q6UYa0QS3OFM5QmsG4ixtEgFIj/XnufV1iw07opk2pnDgC+J6mpPaorNAiU7SUuObDeCm5KOg2am
K0JySqm4CBmOtFzGLhPD2HMi6PUIGNfojE2Tk9yvcTsVpE636zUZTtdIrF9ZxatlO6cNE7dhAoyR
ZkfbtKI7I3RNu5LvM/sWyciMXq46zqZ9IDQTjkxE2eDQCoi4TSk1nJEGEljPuUmWTtlhokRnfsIn
uMMphYsd2SF1TttimSTncZLt3sHUDJrCQRPzmxN32ey1SKsSRCsPLBbYUK0B1SW9Bjo0PfQdmp6D
PXq0ZlIQzTCzIk9mZhLldoj90qoanjakJZ1RrhfhPUN7bsRkrG8zVWOz1hcU+44HuuQw29Ytw/wg
Fh5Dh7ct80frzu5weDUDpUPFmRnuSaMuI8nhFFwYNqDho+PB1/6iqsgqtIHE+tH1SFbHmrjhiG7q
cEPY0zaQEu5Yi7xyJbE3KIxxZTd31UwiXGkctk27xJvSk4bvaX78LRkZwyQozgy/RpOcExcLEcc9
XTNxvKVCMJoFyVKCNENTNomree2wfZW4xUA1ZmLF5Sp6dxmpDw8LPNuOYr2e0/sdoBaezJZ2LzmK
O5lUnY7HC82aJdjz5SBdzWcjAoFKKZgZoMrE3hZYdyu/valjrHYsiNOR4tKgbArrGZ0G0ScesZ6t
/RGxRP6EB9GRsCl8x0w7V6S/Cc6uyNIMK0/S3QgfTnGbuJQ6wfU3lcI8BP6sbVlomMN6tpniDcA/
jo98epZbL9qFVIyRiD6yGQmzI6oxBD4e4bCNI6w2fsJWyFLal7OP7PBbBhYlOz4iSucsFRAtCWms
slGufxNnexwI+iYOZlVFizE3sVPAlHmCXawLfUP6I5oVOYF+K0Ey3E0ISk+X+1mRjE6JIkJNK5bT
+chaAEPhkiGBYO3NNg7nL0CVGb1QirW33IwVJudBIEjOUYAzUEGiRJBIWQS5mQrY6OwDHpGSmQH/
TEQWy5O1/MPPyzn8ESS83sFwjcxJwWNshyfCjT+dUXeoKBVaG/Jz43jdRKK8zciAikSgOcByHrpe
SwHajec5DkOAnI/xUpGFoEWqaFWJKNV2gZpXJnKC/4OhO6WYY+T5bSInq0tUlWyTlunBWSp17Bb8
NFKJ2zTLBX4LJ7qEdRXvrVU6TFuyw6lELFNDRlLhFGCeLeULcPgUDpfS0tIzDvM8Y34vP+vi4LJH
BewZQojxkjKYMbK98DsrNoCG1JeFa8J1BPRLPEbm+l7MzLy5KQsq7maRDU0cy7520eyiyPGsEM9z
t7++2IJsT+uTDrcuD6dEm/aeLUG6sY4WlAVGZ/g8wBol5jR/FtbxT2V4eP34/PLx9PA4OYltq7tX
VI+PD41PGmBa77zg4f7t8/F9ePNwsbhb6xZXXyJKYwjkvY4z0bsMhSuRClJ+XntAojwsXFIOzjQx
QxiYKEMrRWDbkz2BsuJL26hCcCTGg2+CwzItL7hIsIcukWl/JKKQTIpxzj415XsCXQTYcw3hOomA
QpqOSybCvNM24aWD/u42MgUBE6V0qyxVqhJ9Z62cJyeXJ/B//G3oK/o7OFl+PD5OPn+0VIRJ04Vk
k0qGUxdTpm9Tz1B6NLxWxBwmQeekApUyzW9O33gpTrXDQEKuvLl9KWcyHlm04JR1GjAlwzmxF4JF
lA54AH95+/XpvOjkaX4yX8eDzzpmkbBhux3EQbJdYTUOHI4tRwOE15HEjsggWmOSoCx41WA6y9hn
eKXiCZ6e/9f9d/xic5MM3pK9VuK37Fai7dLYmQRqi2Wjs1xWaTrBkd1us6AwI/o3EMnr8sVivXZi
NhSmPG5xpPoWc1N6U9KwBVFgyxYD5XvLq4mjxsu+WK4XZBbxUdaMVja0JPucUxY+CK+mB6ObWIbB
cu7RMUlMovXcW18rR88jonfjZD3zZ3TzJGpGL1wj32o1W2xGiEJqD+zReeGZ3kYdImUX64GrDgUB
FECzdDVj4nDU48rsElwCSo7raU6pa+rxG7H0Kf1MPyiJX5fZKTxICD20l3g+nV2dgZVz6oOiqXY8
sdh2a3lU7xAN2ZHiDtdYg2jec2zgLaQO0iDOUH/2qBl1qO/RESfyC7NtERDw/c4/kqXsC1KHj/C1
GXG8x5zgYdPENBTscEpCCUIKJXjELjxF7kYdskywTqHPUOmNrlX0EhQFz6hMk2CvtLBUZSCaaVZs
Xagtiizc4yCkIw6u2DfhwqNvjihSHdHdgaWHE3VX14+vWEw9jywCthqX61NHVOWOkE8dRV6RrvQd
fid4sNwOJ7sKj0Tphho0LFERFswM0G4AwVI4ZwV2XjLxQbRarzboZDrAOszQECEI5XViKgtIdF3O
Vg6Sk9xJeBXywlWZ7cn3pt5spCaKyne2CCTnLGU1D9P1YkoH7kH0t+uwTAJvTh8Qh6R7z6OYIiYs
S5FbT78QBNr811EWUMxdhr0maRRsprM5XRA8z5FjLY6JPgRJLg60lYpJx5h5GECYfQBPGAlWcDN8
LiKpwhl6pNdENiK2q4L7LIu44y7bbIdkg6SnuEnEYy5nTuUqSizF7WpJ302jKp3SO4fnotnoY7nz
PX811rHWuRzjaG2tSXMJQO98WU+n4xXXtONLXcpMnrfGJuMIH0pmSiqBEFUiPM8xKyWv2EEoep67
CNSHqwI8ZZXjygdlclx59FUc4p8sdTsIo+GARzfLRTVdjrRc/S7AfYFunPp94Q5+XoJn2Gy2qOpS
hA6W33JRapCjcr2qKuxZgAik1Ow5F4E80ipXrkzwcowpJKE3W61nVxrJ5Rlm5ipKNk+xjfGBlJT+
wJjcSbcapSuS2uETivgBj5lj08dk4h+sKVF6vvmIIMYlOxxKF2Gr9dIREA61PRfLxXQ1zirvWLn0
/bFN9k5JiHR9i+yQNLuwY/Dl6QPZZ6CcecpLjiZgI/W7wsMXCR/ug1o9ev/+oFzb+R/ZBPQiKO57
YfpaEz5FFoX6rPl6OvdtoPzX9j7SiLBc++GKlAc0QR7yXAzyi/lWQ63sioAyONC4xhiTyE2CEvTO
dZOgCClqfaLHpZ8G67BB7IOEYf+UFlKnYrFYE/AYOaF0YJacvOmR3qQ6ol2ytvexRqVOjXRn504p
yLTO6cf9+/13UIgPXLPKEp16z+TzdymvNus6L83w182r4C6gfoHlq79Y9pnHKi4JRCKw3/povDvf
n+6fhw6CWqYy39TEiLW/mJLAOmJ5AdZpLBp6cZt02lEOTcIW5S0Xi2lQnwMJol+UMal3cEQ90oWE
2ozdUVMc7R1VjrwoMCnSoj6B437/4ICJLeDRqoRdI2EVKI2xasvEJ0F6eyVMjEmqYjaA894opX4D
zialGiCcfRO5+ESXtvTX68qVPM5JO3HUdN6FOklfX74ATJKqiaruoIYeNzox9HbMy+FwtwjnfOgI
umH1LAp8njKAzjy/mb6TDSwG8+8bB9iZkwjDtMod4CupvCUXq4oaiQ5niw82YcP5v5UBOMk4Itkg
0lEyUlXRIIvcH7RDwvphmfkWdidk9+WAJJrZI9techetaHm6i1l1Lbeegspy0M+57VjU+ZgjvmvV
JQnLIla7JVGNFDzWIXaQw2dJnhIFbdOQZneZywDuBJffpSNkOoR8kcJmSj2KdDi3sXL6kQMY8iUG
gH7Zu7/m1KDu+sw9MuoW7TTcRlTwIOgoWW8sKEgA3JWm5ZGCyR3zzOKvxibZeBi55wjPEy5ltzSK
zWYqqIoUFwUl4pcaA263+m00slsVkb7k12rWXUAqRhWdeYGqAYLvLNAlgEjE2d6uIQS6RG91S/B2
ULIxWpfmRUE0Xi1QPwbMs4RR14s9mXXt3SMC9GxjB94G85lHIbQdCgFuotEOMBXPD8xUngd5Dg5K
ZuCJS2A+QgrvljDUXAk50i1Mz1a8Cknq9P045KR+VU6lfXhgoGS2X1YuQ/mXUwXL7gybl8RMy5X4
dhDgoA0BOBBBjYNNM5bFSagHOenTj0kEwYp0FLDhNbHcRIa3w6YWACIbAASelWZ75O4KUHUrA8En
0CLy22frqUUBSHjdFl3KSmByqlrhIfn1/Pn09vz4l+wBqKKKGkLVExIN2G0Lj8twPiMVLy1FHgab
xdwb1KNB/DVEyD6gikriKsxjese42hgzfx3HTYn8uGCBI4UBKIj3GXqGqgXKmre9CIV1RyCIyNX3
YGOPNJE5S/iP14/PqwEbdebcW8wWdokSuJwRwMoGJtFqsbT7TkNrMV+vKSv+hgSc+4iUdZLTmjrA
c+tQaKKE0hIiSFLaBeScV5TBDuBSpejwcSYNUDZms7a6Sdtgy4l6sgaWy/PwZmEXLcFL8g61QW6W
Fc7HMvhrQHmRDRa8Ci5LGMuonEMsY/Qc4u+Pz8efkz8hqFsTcei3n3LOPP89efz55+MDGJX90VB9
kXI/hCL63c49hEBxDssBwEdM8H2qIgzYDuIWWsR01GeLrA1BcCWnbXArRSROxQ+3MzPDDwCOJexs
TYCGD1mQWr88o2Np4/ebgeTIEotxGMhMWQPgPOUCdzZN8KQk788B2VlYNg87yu3lRUqyEvWHZgP3
jR0gufzLAO7mz0mbPvv8oflZk9iYHBaH1qwRN6K56TcfWmr1Mi6mZbW0PFEekwoVIwmhAzVBRigM
hGg5pXzAA3SMEKezT08CnHeExLXXm1twV7P/o+zKmhvHkfRf8dNGd8z2NgkQJPgwDxRJSWyTEoug
ZFW/KLQu1bZjfFTYrpnq+fWLgweOBN3zYIedXxJIXIkEkEhgbQbOxXMcnDJE+zMMmDsNgJczYCxp
1po3bLaehyraFgiz2Lc3948v9/8w4l2NH/TtOSSUnnP7JVbdsW/wnxX+Xt4XbjQPv8uXLzKYIu+s
MuO3/zH8Zh15xlLydMQqY65JTlBGhsbA/9L2I4cgnw6gmhBKUK5jrPvoI7nJW4RZQOG6HZjYKSQB
vAM/skBqymHiVmnXfT5WpSdA/cBWf96dZFyi5Ry7/an3RGmYMsx2fEVbZ7eecOgjW8kXvFxZwdcH
R66i3PGF6EdZlk1T9Wx16DyB8Ae2TdlUu+pDyfgi6kOe3zLWihd4P2Cry7vqY7nYYddVrPy4+vtq
42aqQnten69vl7ebbw/P9++vj5AjuY/F7rSNWBFkbmfOWZTUIfEA2AfoNo+Y9/gIdwgyHFwrHL5V
xDgSIp3jPIRRsz6quk/2zUU1Hm1rYj4bEImxz2wNb8FKGAySPbwS+XT59o3bNDJ9wFhSsjZFC7ei
hIs73ztPEp40zTCT+zkrz2tKEmxWNGYJ5LKnqqAyr71K4vFECezhImFlJvhSFGb3ejhkN1/WhOpM
TRhcJ/8yoOIgZrFW10lIKawNVW30FD6qVeVdqisO4hCMkiLhu2onAhGZ3e98x8I4j6he3sXyTDaz
pF5/fOOTHNh7lM/wQssKH1TQX2KGkdu4A917pqAO8sTqFi/UsmRIvJm3+ZpaMeIlvW+rHNHQ8onS
7ByrUtSQWxcfVlZX/b7fwW+6SYZVwcUNmzvINVwy/Jbtfj/3fe2I7JrfJl63OI2gc+8BpQmGGkFo
Vt9HXU56ontADHUnjuJpDJHTMADqWgLwAlhxfGpOFHayVrjXVVf1/NnlYxzobktNrz581IJqEb/Q
gj0FnxZQ9cnn6v3Wqhn5soy4bRXadSafApGQGdtQ1X6RY2TfgNTennAKaJZjs+nKTeYNYS6l5Zbv
AXIrk6HdZdWEv/zrYVjeNBe+arYuroTjs3PCwX0PVcvMUjAU6QEqdSS8ayDAXKfOdLYx4ukBQurC
s8fLP/WzcZ7OsJjihqiZr6Iza6N2AkQRAiiSpMlBgTQVIN+IFtd1PBymO5H5MbQ9aHAg78f0Y6Fx
4BFJ3zA3AewF+Ko594GeyiHBCQYS6pEsoR7JaBlEPiRMgI4zdBDNupXvdnUlA3fWp1e92tpwstDp
3pCeBtP2rtG3qdsiU7ieKp8naYqIAsCxrPSfvAV2gP28Bw4niQGWT1KMGY9r+W3WbcQeL5/+g9jY
1FxlPR+En8/5HQpCqGONDKKRYq31dDr10UMPHbl0tmKuwAZRRa2wiOPnq08oOel+XBZgHi/Y4Lb4
5AeL/nzgrckr9rw7NkCJhE8zVANZGhKALnxWkyDyI0DtSASFJ7eKuFXE2xQb6mLEZHcLIDti5BCm
BEqgbz17pnPSsjFceeoexyR06cJETOIUuwiv5ygkQNEkkAYwgEgCAwkmUHk4RHguC0USHNSTHUlp
AKXKmhWOIMfpseE22WFTijMhlEZArXR9GhECZFmkaUo0zWdpF/nv+VgZG0CKOOweboEr2rvLO18v
QKugKUh1kUQhdP5gMGhqf6Y3YaDfPDMB4gNiH5B6AGyoLx0KE6ghNI4URQGUap+cQg8Q+QGwrByI
kQdIfEklBCwSw4knnsbEkScxgs3bieckouHvhK8CN+o8YS0G3lsqwhIu1OFtGAgOSNp11oRkuzCx
TQLxpbzYhdhA1wXnWOltXbImBypMBkiA6G1ZFgC9P7VAS+X8V1Z151xdOLHQgsUIjOEu4rJ/UOFF
WddcLUAH8iNLRW55NazAakxCbt9BUQF1DorWG/hrghPicwBUPIMnPO95sF/VkBLLtw1QnZuahNR0
VJsAFLAGkmrD7QZ4Fa1xwCvKkWFbbeMQXDROdbpqshKQi9Pb8gSJVRHii1czd5LSHhFuMtbWkAX/
lkeAPuDDpAsRAvqxeAiKT6wAIKcQUFMoKPG49htcKdithctCCL7BonOg0Jd7hBB0jm5weEWPEHh1
3OQAlb4wiuIghqxWgyUE5hIJxNSXbLrUppwBhwkGWk88TxBDs6AEMCxHHENdRAIEbC4JpfCGpCkj
GMVp1gQtBqfsPo9102PiL3drFK6a3DZGJoYu4UoAA323iUFqAlMBY4FTE7D/NAl0V3+GKTTGGorh
xOhSX+JwAiWWglmkQJtyKljilCAcwRJxKFocmJIDHFttThO8OLYER4SAQu36XG2oVKzXb1ZPeN7z
wQOURQAJ1IAc4MtEoE52bd44TsejeGtKUni6bRvrZNv6lm37EBCDk6Eez8n4B0jOQc0zeNAs5F80
JVcRQNWWfAKOoEHCARR6gFiszgH5GpZHSbOAQL1QYSucAtKxvmcJARNsuDqCDNg8RLSg8JqA8aU+
BPASUagdql2GghSqcYF4oidqLBh9YJ31eQLfT5sYtk2++MBP37RhgCARJQIttg0GoDo4PYKaV9AR
2P84QsDL5yODCK+Wt4fBWnfBmMYZAPQhgtY1x54iDNDvKE4SvIEBGgL2owBSL4B8ADAqJB3UewoR
qx5xTLzY2py1Tijx3pnRuWLPWyEaV4yS7ZLtrljK7RooznjusegvNw0g4R77F9Za/W3giQAglHtm
HEwNJBHwqbZc9x0e1md9JWJFQCp4ZCobvsord+Ku2eBRLhZH2edzw+YHeUZmy6QYyXddJYNOnPuu
apmLF6Xyc9vsj1yosj3fVayESqUzrsXKT16CWiyk/ol88VgGBln8xJ86wLgor2BYZbuN/PVBQrNw
ekpFeVx35aeRc1FuEV09s9+VGIJUibclhdfd0+URdOGUzzfJFs7rzLNYUkxsn5+LnkESzb2es+Io
OH2QpWCBSzacBiym5UifbxcTgytB25IfLlJAQ5+teOUwVq3MYPOcDu0a5k2ms2tk8z8Z9U8eRkKJ
Gxxgg8wcbA9f6JIc46PWS6kMPCJS6TlvoOB3BptxCqiQUguKJt3Wv35/vpevEztxK4fvmnVh3bAT
FLFjZrpsi5hNyunB87Cf/CzrEU0CX/gSwcLlJGmgHy9I6nj+b4lxalFwgmh2EBVZjMEnFY4wJzgm
jynjO0X1rPllwrZD1UTEENGMyzaRU3+9KRxa+Mtql8ciJztRQSXIe41wYoFdhUbYs100wZBpNIDG
kYysyDzEJ7tpByLUYE2LYgRFoOaLhXObsSo3FpeCylOBva1FekoFfTpk3S3gz123ufDFMgnMjDcy
a1dR8R8oYNk2+ba/+6uMBV8Kgs91T7KLK7p2Lc2INFY+/N56gG89hoUzadKhJm/2hV5FAlAONbYQ
lLYN9Wzyzbi/q0k89rjJqkF4CiMCnjsMsHXmNVFp5FJpGiQAETkjU5I9G0AzDm2MSLSPcWwPAk5L
7czH/R6T3JX9waRAR5AjzbPPPMH2LSqZA+Qso+M9CbBviM9+TsY3rMyXFDyroiQ+OVdAJFQjujB8
WUP0tdtEssaxpN9+pry7GIvHbHUiweLcwz6zXDeNBc0IvJMVVgsp7zG7HOKol/r6BE+wbg72J21W
N5kn+kzL4jAgnhgu0qsMXngMsV+s8sxuaIYAir4wBwkGGoE+g2OxHGe5KWEag8+ij3AaBoCUaYhg
KjRXcIzrHzAy/+AHB5gxI5IdCnNscEC8tLDUWe7qECUYSLRuMMGWylGueiZNuulatovygwSJoEUj
7AIEHSJLCRsSBlYVCppd2XxBnNoaSdKonR+nRqDL6gDi8OQkIzxoANEFQoJF60TK4C1cXqQ4Mnpb
J53QWuA6j35R02fxjomLR0frzNiLnUiTAe0A6+pU8ibd171xpDQziDvRBxmYYscOTQmmLlaXcnG5
yMWnyg2NzZJPYJb3lILnNBpPQXBKoaQns95FRksbyHM02Rcz1S14IA1uLiJQi1ksoHDrbEcw0QfT
jNmz3oxUrE4x6OFn8MQoCTMoZT7OY3wCET4rJKCkEkEwQhPkqWCBecx0janPMaGQtWzyxEkM5S/s
K2JOCwZI42g5bcmjGzsmZBhcFmSaXRZIoGWPwWMZfhZGEVzeYdlh6m8TT0zjxgRpCq+MNK6WUk+Q
aY2Jm4Mev2mTCQzOZrIQcFBPRqgnYfAAdmYRVwUiArYrZI1q6Prwu/3MHsR2pDQAz84sHgrLIKAU
hnTv6Jks32SyL0hasAh4eHQudDq8XcbalbiV11ZW3Nu+2sERW7SPlfm8WPCuj6yQmzrWHD17LTPT
aAh/xFZviP0aisPETSwSxhjB4gjjDMGHoCYTMQIE2lji0YGj3fpBQSRbiJd1hmtzOpivkO6VCoBL
WT2LIsheVmeramU4J3XepVM+rKpmmQVlt++rdaXbCfIVEYkJZ2kj9o5MYptghCya2hfT5RD9vz3U
rKSCAyyuYOmyase2WbG/s9kMaWZJZvtOB7j1VPvuN4+Mq6I7ysgZrKzL3H1DvLl+ebiMNt37n9/0
mwtDnWSN2MZzqkWhKkj8uT/6GIpqU/XcgPNzdJm4kuIBWdH5oPGKoA+XfuZ6HU738pwia1Vx//IK
PAxyrIpSvl/k9Ji99Fo0oigVx9W8TjcyNRKXmR4fvlxfovrh+fuP8RUXO9djVGs9b6aZDuMaXbR6
yVu9NVS1YsiKo/eygOJQJnlT7aSi3m30OAsy+aZsEP8ZamNOX2DrOmNb8WLKOed/QWdviu1uty+M
+oHqwWiVKQiLU0t2Q4j6h6reSUGmXzz838P75fGmP2opz0dUvCmbJoNcTgWknv3SebPT8GZ9x/4e
xmZCIny42LKUdQvPkZKtFJFzGB+t1X53rveM8V9QewnmQ11Oq6upxECZ9MHunlcNAyqvxvECKWE5
TKfC/WnS+zIjie4iP4zqKkr0kwYVjMOkzZyhNsHNo9sCxiR0mkqCV34l/wKFiw3/JQM4n/oMinUy
SJZlSRLEWzfVdUxj5Kaqtjh8A2x1WCNrSprpwFiXdD7e9vrp8owUjer71QZMr8nqem+rielDtjHG
9lzp6izMzpDPBWu+yM7NZ0ZGSL7e7lUrtvuzyG7SJHBus6KRId1q+/iYd39bYNjZgM8hS4xqbDT5
r0y8ssyTHSO+mJ4NDTsz+YpddwSzESWSc86SLEJoH5PMbf3wer0T18R+qsqyvAlxGv08vkSnKT2R
zrrqyqI/mhpoIE5PWdnTnn4fW5Euz/cPj4+X1z+BU0w1x/d9Js9z1Bn49y8PL3z6vH8RF0H/++bb
68v99e3t5fVNBi55evhhJKGasj+Oe4UmuciSCDuzGyenNArcTsbHaxyFBLasNBbwsc6hU7EWRwGQ
ds4wDqDd5xEmOCLOgODUGqPMKUF9xCjIqhzhlY0diizEkVNobv0afokzVffKHab5FiWsaU9uKdh+
9/m86td8FQ3f5f1rzadiahRsYrQblCvFWL3tNcfX0Nln48abBDdFxF0Cu2yKjCFyrN+0NMjCjgaN
ncT3gLjiWPU0hPZnJpTEdo6cGMduXrcsgB+oGLpdTWMuaZwATcbnl9AODgBwQCujobeJLawkcups
pA+1Y43IloTRCSQTaOgd2yQIoAXigN8h6jZPf5emgSuXoAJ1KOjgbubY609YXUnQepfotBejTwNd
NQkTp6T5CZFRyehGKNiHr88Laev+yRrZ9FfQOjd4GKTjjhYQZOy2rySnIJmYbiYG4F2bjlwppikc
o2XguKXUc/o5NOSWUWRvYRmVPFWoVskPT1wZ/fP6dH1+vxGh8ozpd9CdbRFHAQ6hIBI6x7ADaWTp
Jj/PZ78qlvsXzsO1oTjn8EggFF9C0BYOWracmApQX3Q379+f+TrEyUEYKtyIRbwHgKnbn6pJ/OHt
/srn7+friwhZeX38piVtt0qC3dHYEJSkjhoGFpdMPCvRVsXgXDzaFf78VdkuT9fXCy/IM59k3KcD
hh7V9tVOLOlrO9NtRQigKqqGVxPsKK0x+FW7gPV935maOEpMUIEKak44TEHJMIGORxS8P6I4chIT
VOJM84JKAV0s6YtZJJD1tD+SGLwKPMLDdR7no8STWLIkA4lTQAHujwki8L79xJCgJd3CGeLIr0EF
DMubJJ5XyUYGymf7hXTTGK7UNAbd8Uc4xJRQ97sji2PwCHoYlH3aBLrbhkZ2DWZBDiGNz4EWPt2f
8B7Opg/NzdwJOAaecxeNAy/ZXILDinljqpkuwEGbY6cr7vb7XRCOkJ0qafY1uOEk4a7I8gYB33W/
kWi3IAy5jTPHvJdUR5FyalTmG8gqJ7dkla2XTLymylpom0nBZU/LW8PahtWq1Lg1p0G7POP0Tqjn
/GOc3RNsT0AGQ3GXJuAV/BmOHdXKqTRIzse80UthiKrWv4+Xtz+0acKRvg1jAr9TqziEHwl4nDLB
cRTrMpg5qjm6reyZdJ6EbczadT7s5F6wEv372/vL08O/r2IrTs7czuJa8osAta3pIa2jfD0cyjdD
fCcFExs1JioHNLyanAz0s3cLTal+s9AA5Raa70sJer5sehSY1+psNPa4VdlsoKedyYTMNZuFhqCK
1JnE29JmtDEdPeUoQKDnmsFEgmAhiQg+SDREPdU8DcI8FSrRxD0IUWgeRYzq5p+BCrMzJss9MITj
8umM6zwIQN3uMCFYEIl5hByk8HxZRsa7mGai3NjzYA2lHYv5p5566w9ZakyR5rhFIUl8tVb1aYhB
Dz6NqePa2NdkpxoHYbeG0U9NWIS8tiJPfUh8xQsWGfMGoJJ0XfV2lTug69eX53f+ydsYFF86gb29
8+X25fXLzU9vl3du9D+8X3+++aqxGvucrF8FNIVs8AGNjUAZingM0uAHQDQH30COwzD44U1fwKGZ
lBgips6RVEoLhq2rkVCp72WY5r/dvF9f+cruXbx4s1D+ojvBl9TkJvCgcnNUQI67sgTVMCR1UXeU
Rror1EzE46zDSb8wbxNp3+UnFBlujRNRdzWQOfTYNAcF8featx+GTOYZTZ1WI9sQ3p8dmxpRarf/
KrY058Sbwo5CWv9Ywnlf80ki5svAdGQamy2w/Cmsr6xYEIJ8LFl4SqFpSn40KIsiDOzxoCDVTpAs
PDN4raQ+zmKfI9Hc/LBryIxDC8a5n9jjl3dZ/aaKFIPxydHi48PNKauI2ZvpQSvn+k5CvW/3Nz95
B6AuS8uNluDvTw7NGf+8KChZriiOQ3ufU4/Gzujgo983sGu+DKdOJ1FFjfztuTv1MWwjDEOUWHpB
DEFMrKFcVCtR980KJucOORFkp3SK7jsY53AKDNmhiJClJOBsnQZuNy/zpU4sRjGO/Z20QHx+7dwW
5/Qo9DjPCI6urxEFA/rMKHI7f2zprt+LkE/h4kx/X+h9OB8mE2/vFSqDIk8NemIIaAw+XaOUZjKK
kvWMS7J7eX3/4ybjC8qH+8vzr7cvr9fL800/j7FfcznxFf3RKy/vnCgIrKG/74h5X38khnbdrXK+
bHPn+HpT9BgHkA2lwdYcOVD1+AGKzJvHnUXE6A18Rkp2oARZoira2Tl5HejHqAbzMK1idXWZFcva
zEwlXWh2PuDogm4QqhUFbGx2mbFpIvzXfyhNn4trkj6dKC2SCE/hAkaPFC3tm5fnxz8HC/TXtq7N
7qR2gq3pTMyFvKB8PvDO2jNPOh0UsTIf3X/GZf7N15dXZSeZ2XKljdPT59+cfrhbbRG02zmBqdXZ
dqsWhQDNmSeErzwc5ndC7YQU0dLrYu2P7R7P6KZ2Rgcn2nN01q+4EYwhdRPHxGdiVydEAmINA7me
Qs7sLnQ7dnT7dt8dGIZjr8mvWL7vEeRVIr8u63JXTpstL09PL8/yKvzr18v99eanckcChMKf4Te8
nAkhWDIm7Se1zOWUs2qS6fcvL49v4sUW3uuujy/fbp6v//Lpz+LQNJ/Pa8Bp0PXPkIlvXi/f/ni4
f3OdFbONFlKF/yMiGpreT4Iob7YCFSswVjGb/VjBrXTcZOes85wWcozdVb14gmUPv0hRmE88qEmJ
0/QNwPFsTSMbCYhXN10/mtfL0/Xmf79//cobvXC3E9crsD3Bz+R3q8v9Px7/n7EnaW4j5/WvuOY0
UzXfe/Ea+zAHik2pOeot3WwtuXQ5tuKoxpZSslzf5P36B7A3LqDsQyI3AO4gCYIgsH36cYSlMuGR
GyLbyBqwrfljF5GS6GT0npzo+Okm4ThqI36uogtThBsxw4O5oeARVywp944jfnj67mGIlyUjUnu9
PJmxNtBeJqal14isWMzMyCojxnCq7xcagdAeUAU6VOS+YPTK+PCC6s2by09k5TTqjsQUt9fXgWoX
GGqypCeN0SXEQwO/bc77shHjOKsYK7a4vvj0OSko3CSCU+FnCsNKvuJZZi5B73B9n0ccpZaPfG9x
Gtte5XXmh22PZeQvZLHjPVhGozNuVYpspmKi34CsZMuxfXWbjZFJF2RmkA9+bh5QIME6eCZwSM+u
lLAdGmgoL2tKMNW4ojDdo2hQXQqW2LCJSOYys2FtvCoXJuHLBeb1jJU2LGWcJYlLqLWCDmxdlKKq
bCD02yzXoZisfXqANlPKdxSmFGnVmPF4NSwRVoRaDfs6F2t3MNKJLL2Bnk0DwX80MslLmZPu9RC9
kAuWRNIuBwrWb40c6Fq4JS9ZonLqYNtmLZZVnknuNGJdau9ENlSiUaybvVS0hybE/c0mgRUDsWop
s5jRkcDaFmaVhEmRUy5ukCDhjtt9DRSRC8jyRe5WO8lnEmdBIOuUzSRPYUiEy5CJKt1+SdlaPxRw
yyhFy2uhMiQ+ucmnysktR+tgl63SOlGSGPBMOXyRl0rMbRAs3ehsCZjM6BoD6LF6IRTDAHJugwqY
trhqhkasSBi+WshoN2WaopSwI7v5VgzGgoxdrpFpVWczLw3aXwf9pmkKJRgZAbvFiQTDlIvKy7jO
iiTw5k+PaiBCu543+O6PVQHZUueeslL9na/dIsx5IRe5PR4wfyvh8rWKYXKkbu1VjLGg/UiRBkmN
+0lTVJfeSiFlmitKIELsSmapU6+vIAdjQ8yMepizuFoFfV1HsNsEggDqXtL+9Jq4pgVxvf8kBW2z
Rm1/Y5xka18eMtRhmSUd19lNZnhpk1VM7/Stmx1AN9ZmPYKnskx1wNkoX2Zt0G5T3ghk36Ot6vRi
QTVp8pjLJpFKJaIRGWySxkKFeOIFHoLxfZMqJe1tEQnqpJB+YFODAP7MQgEsEA+SGHQFq5qYR07p
gRStdyLd10iETTWEmQFe/Pj1un2A0U7uf9Gn4SwvdIYrLiT90AGxbcS8UBMVixe5W9lhNE7UwymE
RTNBxxJU6+LUA8scBrQ9eVK3r5bbfnzSUTPnmWXK9SsN/z5QvxJpH4rEGB2cj5qFiHhXlfLgazvE
VVHMpVuwBgY92o0UrtcqKpNETakVHSlYwu2oy7rRcppC2kASPvlsOUFJdThtoLd6FME1lC9vYBgc
chSBYedyfGlh1l9iFxRXX2yAyqtYTpifOFVzqyEgjSrJqf0xE0ucvYbci1/tIZyCNb2c4mO0gAHb
u92JmmBS4nEqA/m6iZcYMSWbCf/IA6T+cUOnh/PezdU1c4rV5/1PXmEaTJ0fR+wllejm6lSim0/2
cVzDg/4UNLaNnnjhpergoeVO0zgu5XQl0EfUFQG89otIimvakcpYgWu/OR38ZMWQxnJXoqGdfx50
Mlu7fOOqVtpsTJ8KGmL6y3G4J7q4JS8b2zEYHGyYUMUZOgHw8lIJv747D3cNssf1v05mpls1h1O1
3vzb83b3z+/nf+iFvJxNNB4KeMPQgJQ4cfb7KH/94fD6BEVSt3PSZAX947UGHf2QK57GghT9+XYS
bGrrQAx23tTy4zswvGX4raHVLL08v/pk9oI6bJ+e/AmLwsCsfcHo9H+L0CG8KfHSIsphxYhzFcwk
VfRJwiKKBexlE8GoJ7wW4aD2CZbHi/q9TBgH4VuqdTCPU3Orp+ndGOth0V29/XnEC8fXs2Pb3yN3
ZZvj9+3zEY0v97vv26ez33FYjveHp83RZa2h80sGB2ORKXfS9O3UHg4CSDj22c9dLWwmlOMWlaYr
tNqKOtja3Wk/kmScC/SdK5O2i3tt1f0/bz+x/a/7583Z68/N5uGHZaFKUxjSO/yfwU6aURu9gKNG
AwsTvlSveFkbdgIa5XlbQKhDk4gZ4+s20rTZdxrpCUQ2Wny+vqAmsUbK24s765l5C7WNSTrYhQ8T
l+c+dHV569VRXtMO2zqkY9rQQUNmCi06ELW4VNBdZkhwBGAEhpvb89sOM+SEuJBjhQj97eItgrEh
jTDDSYCPW3hD0l7apsy4ORmTwVFpJjNhFdMMjtpA2slEYlfCCWCOMmDJmrSaRabb6O60BzD7tqqD
50xhjfyWF8mqaTMakrTBuuHcnH1JiyYqnIQDnb6uiLHIJp2l9FFjpKF6fYlFuz5mOqgHsEVXAAqr
AzqADtRrKA6q2m1eNW3cJg0jxp+3m93RGDFWrTMQnr0+gk/yjAPwST2lvGHojKYyoRWYdZeQZE1A
NGm+EK3rnbVTD8RWIplifQLv5lsi2N0CWgyn1sblZb2KZFUkjArnVtte7uCz4ZJqAmIK9KUzE5ks
jYMJIiL0UkAhmPnuFgEgwPDcViTVXczm7lKC7lqgga2GWhZ18rI2jy8ISqc3F4Y8AzVrJutCn1vc
uJg4cw0XDOPt7SRfzWqHQ4w0dte1EJQda7IJi6ggH21qF++YyspMQzMyHm6LQ01w1elsuu2m3yDT
7cNh/7r/fjyLf/3cHP6zOHt628BRnVBjxetCuN4chmeNp3PR2aw2u14wJnJfiQykrCTJSY02YtFN
j1goHhsCaZuKz6FtFnBa2TSwKoFUQWFg2+1aJivTHyfi4N8EdY0lKs2dEppZpiwXRxoGwpPSFe09
iVjt69C4xCOaaGe1lLlKJkht5wxMj9mObbUyLhZ4kzXWlGQqk7DLJ9DTBfA3T532ol+sZgWnMOHA
eWHdZhLDPNZhVop1SA8GB0TYKWlhZ3V7Y3glaXdianNLW2lsrCGPyzwVQ9rKxeRw3MSgWNbN04BS
cK4jiiGcmfV+/2kH/gO2ilVBJUuKU8mKMle5l2w+0fdR49mE1m+JJGFZvhq6gFLAo1NbnhgXO/CB
7AazcV4b9+I9IdRIFMxyFKdPik4mA8zz22ugUra6u7Kf/xvYSl5fkhHTHBorRrGFuroKZM0jLj6T
odtNIm2dBac7MntLUxEvq0JmMK/n/eLKn/cP/5xV+7cDFfUCMoDlDKV002QFoJMkGqCj7RSV16DX
YzKBDchsaMEpjuqFSYdYQpNqyp1V69pk87I/btD3CaUCLwVe6wCLcnJrIBK3mf58eX3yO6Us0sqS
vDVAB1Im2btFa6lzhsoRBFAHB01mbMR97axaGGsR2l0spe0lsT1RQjt/r369HjcvZ/nujP/Y/vwD
D40P2+/bB0Ot3RpnvTzvnwBc7bnVdb2RFoFu0+Ep9DGYzMe2RleH/f3jw/4llI7Ea4JsVfzv9LDZ
vD7cwxH4y/4gv4QyeY+0VUn8T7oKZeDhNPLL2/0zVC1YdxJvjpcb1qIVObbP292/Tp72qWfBa2v3
IlIMqoIPDf24F/Uxm/rloPs8m+2BcLe3PFR10Z10ICn9vLXJs0iA+GnswiYRCCy4mLPMNISzCNB4
oYL1mkYPbsADqUH4lQvh1py4tRmbCcKZyCghVKwUH9VV4t/jw37XnZWpHFty7Q38ln5D2VFMKwY7
R0CN0JK4GjUX352WMbDUHf22pyPEAKy0p4qRwPERbSJu7QAOHapQGfoPCmdaqtu7z5fMy7NKr69N
r/sduL9rpBCmC9ZBNEjz0jpdSlL/mClD4wIfTVpJG8BMYREBMrI0pRoUMKFFXHv7qGyRChGwoc6K
PCAUIoHKA1HQdWqYJEEkNMK7trSzRk1owL/jAmTKST08EYBPWF23j08mQxuknN2d85XlxgygqpLn
V7c2bMrmwsp1j28piVmySCXSf3YC3gwJvfnVz1dTZIEPX++IwNA9LOII6RfBOsDPJ1LlBFg/iEkL
bUMFkWMwEhCSq0Wl751IHy+IVcvELRdATULcMsLJX/sp8G0u+vhcWmkxWlK49IMKAZbWecchQ8mT
nJUYRITLC1K7iRZDDFajIufKNH4sRSWU7TzXkL4QNyl5WgHLwhennXNqMiXH8DO6vUW8Pqvevr3q
PW1sbKddaQBtKV/QmmOWIpgoYsLTZo4xRIDsokvad3m8booVay5us7SJK9Me0EJhSmuoANnFlIJi
RZrSIqbdCiO5jmJo+6Mdz0V84g1/sTl83x9e7ncwcV72u+1xb6sq+vJOkA0dziyvr5Xrc68DBSca
dMWV0/dXLfG00mE0fcmU7R4P++2jocvMojK3rYI7UDORIF2UwGp0j/ZZDaKBbVWHR0MAUYs5LD3G
+qI/hxXGBhYpcGPE0p4X4+XZ8XD/sN09+bOvUkam8NGeiOHkW9nXTSMK1TrUwo0U+vWInR/I+2UX
EiU3bZEN3HBX6BbY4aewX5DPF1oOVoZhRA/pNNyO7h7ggRhrA35G5laR0LSqqZIVXTJx39Sbhfnj
0+c6LWaGjNKdMQtkLy8EF5I26azsqfiCMh7WVJNSRmacmy4FiJriq/CwnThf4A0pz+vCcjKu8yvF
zDI61sBomnjVA1gzTamhHNBsWpPJQnuZElR2IDvnhaUPqjOJnKt1kYGI6DI39Cj4hduMI/ZViUwn
prEFAtpTMgZRtvmhhL8zwS2+hh7Mgt7yc1do6m8VbJGjfVm0xTtVvTKbxx3OeCyaJZoHt/e2hhTE
EhkxBRMKdn5WVtY4VhggVa4gkdEIsUIpzbk87WDNBBUy0M1UX+LtTIN4aVsA47ELrU3WFgXZGVPU
q/NyXbjhdk2KBeymitozp9Vww9P3jAuQLUAf2CyWYy2CvoWrc0VJYqjDnVZXjbkctzALNK3x+YLV
nxxAwasNK3G+QO/T6wAMzdZlCdzWwI9ZAEXCkiWD2TAFqSdfkg01UuGORrsDMIhW0J26xURbDLJU
KMbzYrgl4fcPP8x73WmlGdhkzJaj0cip8sGxrFQ+K5llUN0jQyJAj88nf2NnJJCHpRBs69QKLq+b
t8f92XeYbN5cQ82cNRgaMLfvYDVskQaBnc4dt87CIUCJUiUOsGAzgW8NpBXjTKN4LJOoNO832hRo
dY2GvK6dWJuoqLVway1ec1Fa1zmOnKHSwvuklo8WsWJKWQzZgiXGXrih/LfF9UyoZGIW0YF0661j
tg4MLKyrk8FoeSZnLFOSO6nan35ijrKnP9LGuiWr9soZekKJlFryMqFg1Z2bVIZk5qwD+L24cL6t
Q1wLwf6kykLk1V8vDvlVEwhFlecKKegDua6anhBBPK5anTFNlJGN74iQcUDcASK7bZGsdHT6Oioo
a3YgoW7MZij3oa5B5oYWBDcN9xN7wyrQta+r6qwsuPvdzGB/NHqxg4ZNg7go4mZK9QCX02p08oJf
7ZJlRutBIN5PLoH5K8HrUox3xmMRSLUUDO9AkI1juiJIVRd45xjG65kXqKtviTNCabeZI14vVviS
jeaolvAD9TvFdjyPWBNgWabTkqi7gh6ezDQFgo/e2u+v37avewz09p/z3wx+TJCDIqEX26tLOoCw
RfT5Q0QBf5YW0e01rXd1iOgxcog+VNwHKh569+wQ0auPQ/SRit/QnjUdItrvskP0kS64oRXUDhHt
lcEiurv8QE53Hxngu4DvWpvo6gN1uv0c7ic4DCHvN/RlgJXN+cVHqn0e8qqMVKzikj7EmXUJp+8p
wj3TU4TZp6d4v0/CjNNThMe6pwhPrZ4iPIBDf7zfmIAHcosk3Jx5Lm8b+kA6oGljKkSjOWGZp4H3
wD0FF/hK5R0SOBfXJX2pNBCVOVPyvcLWpUySd4qbMfEuSSkE/Uy1pwDBPWEBo6CBJqtl4CrE7L73
GqXqci4DwgDS1GpKz+IoodX7dSZx2lLKsLxZWsp4S9XQ3tVvHt4O2+MvPwwaSgWmVIHfcMD4ghZ8
TXi7ByGvgmMY8ACmKGU2o/f3TiUgorD4AYgmipscstSP4cNUbfxFfoJKS2lSrdG2stLKflVKTqo/
O0pLh9nBArLKkHl3dKD0WLioKi06w0xO+sf9fhYFI51QTEHQRh1Hq0m19asMj0ao/EiBDWKRFAGt
1FBGBXxIz4eBROVpvqan8EDDioJBme8UtmYBW+mxOmyKdy/u81+XTJ8P8mXWJBVlv4J6upk7cAOw
qeQsg1OzG5K8pwvUUSyoovoHJiNTmbbZUL2/fnu+3z2iOdKf+N/j/r+7P3/dv9zD1/3jz+3uz9f7
7xvIcPv453Z33DzhDPzz28/vv7WTcr457DbPZz/uD4+bHWqTx8nZWqRuXvaHX2fb3fa4vX/e/t89
Yg2rKa5PzdoaccFK6ASp+hcjxiGGosLH43b/ARA4jM9hjmW06n6ggCOCUQyVB1JgEfQYIB1aNaDh
p/GI5yQxqrqDtIPbK7K7enS4twerFneRHPoQl7B8UIEdfv087tugnPtD59TdGBZNDM2bMfPxggW+
8OGCRSTQJ63mXBaxqQx2EH6S2HqNagB90jKbUTCScDiUeRUP1oSFKj8vCp96XhR+DmjB7JN69uk2
3LpN7VDuu0Ay4aAK0Y8MvOxn0/OL27ROPERWJzTQr7r+IUa/VjFsnx4cK2JoLrqxl6mfwyyp8bYO
dwq0Gx7uut++PW8f/vPP5tfZg+blJ3S79Mtj4bJiXpaRz0eC+3UUPIqJHhe8jCp6Ce7bkVJPWPuO
qsuFuLi+tuPneEhsq38n/Hb8sdkdtw/3x83jmdjplmOMpf9u0Ynp6+v+YatR0f3x3usKzlO/dwHm
DgOPQWJiF5+KPFmfWx5Ghyk9kxWwTBABf1SZbKpKUCxbiS8B7wpDD8cMFs2F1/6Jtpp92T/a/uz6
ek9oq+sWOZ34PKv8qcaJ+SG4nzYplx4sn06I5hYn67VSFZEGBMVlSYbe7SdhHBydEdUPQBDPFitq
gBi+LFE1JU70PYL2hP1UjDGGSD8oTm9aL8H6NZsCrqCXiKosgNZjg2j7tHk9+oWV/PLCz7kFt3fi
NJKGwsAl1KK4WpE70SRhc3HhM0oL95mqg3drmle+Ov8Uyak/X8myg7wwjDS+uLi58vBpRMGuiYFI
JUxKkeDvqalbptE5GQ3EwNuOiEfExTWt3BgpLknn+f2yErNzrzEIhGlQiUsKBSWGkdfnFydTBtJQ
C17MKM8Rw25xSaVRIC1O8sCNQLeJzsrzu4DevKVYFlCjcNGamxrN5g2s1/0UadfW7c8f9gOHfo33
eRlgjSLkRFGZ2br8ny+nkpxILcK7TnHxAZ7GJ+1JIv1tv0e8l7DbvWBx/DjlRZgUVRB9S7wtC7C0
kswkMKpyYoMDSmIlQajdFLeIiHx7NSIvGxGJUPOm+pfiX5ZU7NR07aUMqlc61LttBtm3sHwb2HC9
/4Vq3tOcGGaDJJxN6sPUMic5u4OHGLtHB0qy0c3lkq2DNFajeg/RfUROQnSCMxA+BQz3dPI19wq7
vaIWu+TriQEDZExt818r5Zvvlve7x/3LWfb28m1zOJttdptDrz3wJJaskg0vyoyyvOjbWE5m/Wtb
AtNJJV7PaFzwRtQg4vS150jhlfu3RAWEQEPgYk2UjWe7Bk7a75Y/EPan5w8RlwEjKJcOT/De4HQK
hOfttwO65z7s347bHSEBJnJCbhkaXvIr7/TRWVIshCYJSU8GznBpG6Qhce0yczJ5S0KjxqPayRzM
456PjgJdMwhuZSW/ir/Oz0/2UlD+s7Iaq+nNWYPsFEuMXTKeDk9MdqAeRCU3q5i2AGPVOk0F6ru1
shxd3fmstzkc8Y0WnHTbYAav26fd/fHtsDl7+LF5+Ge7e7I9N6BdDHICPqytBl0/qX/7SN59Mycy
Y+Uan1dnatqvs0lwQiQyE6xsSvSIZhpEsd5gccgWRD90SGCYD/Um/CAVZrxY48vwtLchJEgSkQWw
mVBNraRpmNCjpjKL0Nck9BBUwWClvIwsG/9SpqLJ6nTSOk3owO29h/nQYXh3wCU+SWWFj3LAmqvR
pIenxYrHrZ1NKaYOBeqCpyhXaT90RSLNlg55ACfBvpDlqr1qMecGbziHtdcCnTtcypv2CEbyN9Rc
1Y2dgX2OxANk79bDgyeSi8n61ilwxNBXqx0JK5cs4Ee5pZgErv4AGxCmuCMXciqmEExn/4TNDSWQ
ezAu0Qt8SvYDiA7aiYPthxuhaO7twr/+f2VHshu3jry/rzDeaQ4zgZMYmczBB6kldWtam7W4bV+E
jGMYRiZ5QWwD+fyphZSKZFHJHAKnWcVVZFWxWAtSkrIp3GgFIJIobWCp1gZJHir+hYp/c4fF/m/3
tm7KyDGlc8NDMKRMIvYiBp6o/vsrcDxMMleVAQwd7PGgNN39WxmB7xJnoOuM5/1dKU6gAKQAeKdC
qjsncs8KuLmL4LeRciHlWpJATyqJY2iaykDW8IMcO/CZqE+kvSNZv18n1YxXZ7E+Sd8nt0wrBJkY
hnZXAmkAFkoIKwjJCxAm6fnCRWhBODsEC8vdMEZ1gtbpa0GT59k8MKCisP0ejOIvJR29jfoGpRRb
JMv6eQRJ3iHKJrKI/OKIvIu8DVJDIMrFjJOHfbXEOLGrSUEEWPEu5nclCXzVOiPA38thV+3hjFWu
JR/VHb4zyyYwWA9IFpr9ad2VTrCwlqKm74Gj97erFEkykd1L19nQhjtsn48Yk7AtMvnVZR2KWThL
nlG0eJ30w79R6cefMnEfFeFD5YA5AEbvg+J+6dBfynlWW0ATe0/MRTUNB88mfUFCS/ZZBp21dta7
4ymRATuoKMu71vNxQuFH/UxrampfiHGfeq2IRaXffzx9e/lyBne1s89fH54fQ+sMEpCOtKaOFIGF
aKvpPHixyxaG3K9ACKqW17l/RjGupjIfLy+WbQILiAYMQQsX6xqkaJtsRpDlXnis9dDcNglGAoxb
5joY5BylmwXc1mkLnH3O+x4qqCmdqAX4B4Jf2g5OKqToCi8X+6f/Pvzj5emrkVGfCfWey3+E34P7
An7qUGVbhv4a0y53/AwFdABxSxcvBFJ2SvpC53z7LMXQimU3alqnvKFnynpCpdkh34ndXACxz2do
uLl8d37x8Q+xnTug5uiXKJlBD5dWagtAciqHHF1/0RMAjodKZ3geAxzeEv39y6FORsmAfAiNaW6b
6jZcsqIlX8Kp4SpJVe6b+f07LZA5Wx0YdynP4kY2xlbaYYjS9QrzuxuCU2mhWuXp3h7u7OE/r4+P
aFlQfnt++fH61Y2nR6ku8EYlo72JwsW8gT/k5fnPtxoWu0brLRi36QGttzAcxp9/uh9GejTYEmPg
nniJ8ywUX78JoUY/uI3Nu7QUMSAh5kLk9gj7WPaFv5UKK2VPh6QB2b0pR7jPm5EaJILJxhh51B8A
GZhiRJvBa4M8Rvwyr0+vE9qRdR5ZFWQQjLi9GLtBZg8gAJWRvF06BN7DNZY9o0XGadHZndO8QE8l
co52VpoaNmRSt7IjjJiow9DwSsLlcEOvbu3u9WBw5YWzDie+a4FzDJcfLlz4RKwEJJrhePnxXIWR
iNpP3Qg07A9vuAjnKxNqfLy+hyNQOer8ElO9x4BOA96CLH0zqmo2wph9TpJuC8cPas1AVt8HfRoc
cpaZmmODxm5tX+5lSicHEyjblJuA8JZaOnggkU8c2w36pM8+mFi8ylz2DW4OButBMX+LsLmEhB2J
fPJiDpW0ZlsaE0IOyhz5zYh5iDTijfBYmECqCwvouoRSKWw1TLmk6rXXhmdHR8LlfQt8JJndTb7Q
I8Y53fi1ZMmivxk9P0H6HfiCm2IT1WCDyrIHpJrRBimH+RYgJVfA6sKVtJCNHpiXTigHapwWNn9m
cPIm8wUNb42u67nbjy49sJCwhAwWjODuDQqAvcYjRDdFlewHtaYZwhaLMbgci1hphAHRAXD4IDJW
lJVNMVstg9QBJKRFA0z8hNtMIQmZwgrAdXLvm4YTMDTUqEvocAIiux8CKNoz492maVemB7dn1uv4
JpbrGfYEvwNHhWFLE0Q6a//6/vz3s+qv+y+v31mWOnz69ihvOBgoHU08W+fu7xQzAbx86wLpIjqN
lwt1RY3nhKdohAWWShBM/hUCnSsNKUQkIvWhfKU4shnl+frZ+szrleIwyQ+7YNBBoinB4ao7FSec
2DoYgdYlTp65OI6/rNz+fJiaPXNicURZNF1Ay+JfALdWFnJF/PU6erj+Mp6umOlmreP9SPIVz0bl
Ydvbj50iQML//Eo5eARTWq+eROuiah+CmpugW4f8SNVBaT36xAZX9pjnnce4+IUEbfhWdvy35+9P
39CuD+b49fXl4ecD/Ofh5f7NmzcyqQGGfaC296S98DUxXY8BtpXgDwzAJGbURAMrHgv+QAg47yiN
RPXfNOY3eXAHEbFCXaqqo59ODJkHuG2gG0XAvU+D48vNpTRCj26Sq0HehQTfAKKTsXkOqjxWG1ea
XpU3w5PToOBEo8NCPATbOmNV8bRsvSLalKX1Q8ZdnpJyFA7FVnX1f+wu2ySF+kHVo+W/avnc1EJn
R+IDIci1I1UAeg5MDSbhg8PFAvmGrHJkcSg0cqSz/4Wl18+fXj6dodh6j0+RgS5nCSbhSoZYvCUl
RZRaBLQMXxPTSIiDKwvKlyAF4p3CyrwO4YoM3u9q18NKNSPc+odgFfrdpErbfKp3k3LUd9PsT9x+
T7GzZEWsgpHWonsOEbYqg/gdacBBi4WUQlh+pXjH08DI+csJS6CSZXelPHJzZZRHPamNZBf4ptbs
bvWsr2QCsu70kOxiwjwCycSqKOktKq9tKMyqO+g4Vrda2EMWB86ncjzgW8DwG2gmGA0FTveHxWg1
hUuC9nZOElRCwfAoeL4J0+gBvEbQnufWK9yZ1rhpj8L0GFR09qbJQ9m5PIU09+lUFHK1KE4r4Ttm
BPAHyO1ognEGa9z1eV7Due2v9LkE7dnboN+QQVQeR7wZobBE7ypB09HNEtsngQI+Gq1taQGIQ1F6
0Rb5Csit6p5b/RUIyIWC4ghQ4bgOJzhX8Wp1Xbbe6pi9Z/aXz4TgFDZJ52fI8kBWKwyfXNUcpsCL
YCeYlSAdp0c+qdzYTGAoeqqgmodOgJ3mvPfEYNOuCMrsN/LL9RbsdnKeWYfbBk6uj4phmNT0Y7yU
fC6iN9V1188pUMBDnfT6SXPAQR9JRa+30cww9ruOCbCPboM/iA5/ibzsnziKON9GLRmVudbFxUMe
R3TWOx5TFrhwmeWUX/bt+39d0Nuz0SrYHhMMie18Mi6KJKzxscT3jTg5Szx+5/s1HlkBaGeckYyc
pgz6cIKTkidH2kxb/RyLsoj4KTOCiY5flTGFvMHjXzEPb8ax981tlREF7yzNs4fMGm3EDsaQky5b
FxaIbD8/ftBENk+YDthFKGwr6dZIO28ebqdBmsZ8/GDfBIjRyDQXslakrSzdRypwPuDMdU4yl9wq
pYd6nXWQ+UTskJBQsJ5iJToVTghNZTCu6+aVCXMw0QE/v4kETxcYue63vmBMwWu4j+FzDfNwTQ/q
ZI+jm551SXQtuAUrNfnXkLrcnj6vEz3eqSkbuwm9r/Guu4jXloU1Jw6b2/bOx13K+cWZTrUvHxiZ
293q0khifHh+wfsnamt2mCDg0+OD1MsccViaiYymZ3XinHa1jiSnwKkZf620XbkUacaW3rZoxnHX
ijRJRvM6gKDQXluC6z3YtNdKez3IwSQMskImSINVHbNRvzaz0gx50eBFc3dR6rKhnGlxjGj9dL3x
wN7bYNopmpptwMn4q61azDATP8HSbm2Do+c9CndROOtzPlxsnxea+CG/wbeajZVhIyG2/tLkP4s1
7FzPBSo/AmBs9eidhMAm03F4Wo711oebpkgADoLeBJzchWNk0CIWgpQwejRkDR5cvDWM+WQQtMx0
QzzevMeNnQ1zb/08fxJuHk42Fgcv7WgkttFHt7X4aCh/QBOrWHpXshSHca6Scby1ouzrU9JrdzPe
QzbeqDeJuFmW2XoUSSYaj4cpQF7v4Bqm3YVsI6jkdB+8bM1SJ9A8KTyo+PA6BDUL3yrHiux5HTW3
2+QZQegPtr77H8VcsGahrgEA
--===============0057493085654278392==--

