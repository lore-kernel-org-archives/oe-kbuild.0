Content-Type: multipart/mixed; boundary="===============7992004194342204139=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/x86/kvm/vmx/nested.c:3362:30: warning: Assigned value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
Date: Mon, 09 Aug 2021 19:03:01 +0800
Message-ID: <202108091957.4LHpiTCl-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7992004194342204139==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: clang-built-linux(a)googlegroups.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Vitaly Kuznetsov <vkuznets@redhat.com>
CC: Paolo Bonzini <pbonzini@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   36a21d51725af2ce0700c6ebcb6b9594aac658a6
commit: f5c7e8425f18fdb9bdb7d13340651d7876890329 KVM: nVMX: Always make an =
attempt to map eVMCS after migration
date:   3 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 3 months ago
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
t/commit/?id=3Df5c7e8425f18fdb9bdb7d13340651d7876890329
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout f5c7e8425f18fdb9bdb7d13340651d7876890329
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   4 warnings generated.
   Suppressed 4 warnings (3 in non-user code, 1 with check filters).
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
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   arch/x86/include/asm/xen/hypercall.h:358:9: warning: Assigned value is g=
arbage or undefined [clang-analyzer-core.uninitialized.Assign]
           return _hypercall2(int, event_channel_op, cmd, arg);
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
   drivers/xen/events/events_2l.c:89:21: note: Loop condition is false.  Ex=
iting loop
           unsigned int cpu =3D get_cpu();
                              ^
   include/linux/smp.h:260:23: note: expanded from macro 'get_cpu'
   #define get_cpu()               ({ preempt_disable(); __smp_processor_id=
(); })
                                      ^
   include/linux/preempt.h:175:27: note: expanded from macro 'preempt_disab=
le'
   #define preempt_disable() \
                             ^
   drivers/xen/events/events_2l.c:92:10: note: Loop condition is false.  Ex=
iting loop
           BUG_ON(!irqs_disabled());
                   ^
   include/linux/irqflags.h:254:3: note: expanded from macro 'irqs_disabled'
                   raw_local_save_flags(_flags);           \
                   ^
   include/linux/irqflags.h:180:2: note: expanded from macro 'raw_local_sav=
e_flags'
           do {                                            \
           ^
   drivers/xen/events/events_2l.c:92:2: note: Taking false branch
           BUG_ON(!irqs_disabled());
           ^
   include/asm-generic/bug.h:63:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                  ^
   drivers/xen/events/events_2l.c:92:2: note: Loop condition is false.  Exi=
ting loop
           BUG_ON(!irqs_disabled());
           ^
   include/asm-generic/bug.h:63:27: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                             ^
   drivers/xen/events/events_2l.c:96:16: note: Assuming the condition is tr=
ue
           if (unlikely((cpu !=3D cpu_from_evtchn(port))))
                         ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   drivers/xen/events/events_2l.c:96:2: note: Taking true branch
           if (unlikely((cpu !=3D cpu_from_evtchn(port))))
           ^
   drivers/xen/events/events_2l.c:119:6: note: 'do_hypercall' is 1
           if (do_hypercall) {
               ^~~~~~~~~~~~
   drivers/xen/events/events_2l.c:119:2: note: Taking true branch
           if (do_hypercall) {
           ^
   drivers/xen/events/events_2l.c:121:9: note: Calling 'HYPERVISOR_event_ch=
annel_op'
                   (void)HYPERVISOR_event_channel_op(EVTCHNOP_unmask, &unma=
sk);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   arch/x86/include/asm/xen/hypercall.h:358:9: note: Assigned value is garb=
age or undefined
           return _hypercall2(int, event_channel_op, cmd, arg);
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
   drivers/xen/events/events_2l.c:207:4: warning: Value stored to 'bit_idx'=
 is never read [clang-analyzer-deadcode.DeadStores]
                           bit_idx =3D 0;
                           ^         ~
   drivers/xen/events/events_2l.c:207:4: note: Value stored to 'bit_idx' is=
 never read
                           bit_idx =3D 0;
                           ^         ~
   Suppressed 3 warnings (2 in non-user code, 1 with check filters).
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
   12 warnings generated.
>> arch/x86/kvm/vmx/nested.c:3362:30: warning: Assigned value is garbage or=
 undefined [clang-analyzer-core.uninitialized.Assign]
                   vmcs12->exit_qualification =3D entry_failure_code;
                                              ^
   arch/x86/kvm/vmx/nested.c:6165:6: note: Assuming field 'format' is equal=
 to KVM_STATE_NESTED_FORMAT_VMX
           if (kvm_state->format !=3D KVM_STATE_NESTED_FORMAT_VMX)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/vmx/nested.c:6165:2: note: Taking false branch
           if (kvm_state->format !=3D KVM_STATE_NESTED_FORMAT_VMX)
           ^
   arch/x86/kvm/vmx/nested.c:6168:6: note: Assuming the condition is false
           if (kvm_state->hdr.vmx.vmxon_pa =3D=3D -1ull) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/vmx/nested.c:6168:2: note: Taking false branch
           if (kvm_state->hdr.vmx.vmxon_pa =3D=3D -1ull) {
           ^
   arch/x86/kvm/vmx/nested.c:6187:7: note: Assuming the condition is false
                   if (!nested_vmx_allowed(vcpu))
                       ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/vmx/nested.c:6187:3: note: Taking false branch
                   if (!nested_vmx_allowed(vcpu))
                   ^
   arch/x86/kvm/vmx/nested.c:6190:3: note: Taking false branch
                   if (!page_address_valid(vcpu, kvm_state->hdr.vmx.vmxon_p=
a))
                   ^
   arch/x86/kvm/vmx/nested.c:6194:7: note: Assuming the condition is false
           if ((kvm_state->hdr.vmx.smm.flags & KVM_STATE_NESTED_SMM_GUEST_M=
ODE) &&
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   arch/x86/kvm/vmx/nested.c:6194:71: note: Left side of '&&' is false
           if ((kvm_state->hdr.vmx.smm.flags & KVM_STATE_NESTED_SMM_GUEST_M=
ODE) &&
                                                                           =
     ^
   arch/x86/kvm/vmx/nested.c:6198:6: note: Assuming the condition is false
           if (kvm_state->hdr.vmx.smm.flags &
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/vmx/nested.c:6198:2: note: Taking false branch
           if (kvm_state->hdr.vmx.smm.flags &
           ^
   arch/x86/kvm/vmx/nested.c:6202:6: note: Assuming the condition is false
           if (kvm_state->hdr.vmx.flags & ~KVM_STATE_VMX_PREEMPTION_TIMER_D=
EADLINE)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   arch/x86/kvm/vmx/nested.c:6202:2: note: Taking false branch
           if (kvm_state->hdr.vmx.flags & ~KVM_STATE_VMX_PREEMPTION_TIMER_D=
EADLINE)
           ^
   arch/x86/kvm/vmx/nested.c:6210:6: note: Assuming the condition is true
           if (is_smm(vcpu) ?
               ^~~~~~~~~~~~
   arch/x86/kvm/vmx/nested.c:6210:6: note: '?' condition is true
   arch/x86/kvm/vmx/nested.c:6210:6: note: Assuming the condition is false
           if (is_smm(vcpu) ?
               ^~~~~~
   arch/x86/kvm/vmx/nested.c:6210:2: note: Taking false branch
           if (is_smm(vcpu) ?
           ^
   arch/x86/kvm/vmx/nested.c:6216:71: note: Left side of '&&' is false
           if ((kvm_state->hdr.vmx.smm.flags & KVM_STATE_NESTED_SMM_GUEST_M=
ODE) &&
                                                                           =
     ^
   arch/x86/kvm/vmx/nested.c:6220:7: note: Assuming the condition is false
           if ((kvm_state->flags & KVM_STATE_NESTED_EVMCS) &&
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/vmx/nested.c:6220:50: note: Left side of '&&' is false
           if ((kvm_state->flags & KVM_STATE_NESTED_EVMCS) &&
                                                           ^
   arch/x86/kvm/vmx/nested.c:6226:2: note: Taking false branch
           if (kvm_state->hdr.vmx.vmxon_pa =3D=3D -1ull)
           ^
   arch/x86/kvm/vmx/nested.c:6231:6: note: 'ret' is 0
           if (ret)
               ^~~
   arch/x86/kvm/vmx/nested.c:6231:2: note: Taking false branch
           if (ret)
           ^
   arch/x86/kvm/vmx/nested.c:6235:6: note: Assuming the condition is false
           if (kvm_state->size < sizeof(*kvm_state) + sizeof(*vmcs12)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/vmx/nested.c:6235:2: note: Taking false branch
           if (kvm_state->size < sizeof(*kvm_state) + sizeof(*vmcs12)) {
           ^
   arch/x86/kvm/vmx/nested.c:6245:6: note: Assuming the condition is true
           if (kvm_state->hdr.vmx.vmcs12_pa !=3D -1ull) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/vmx/nested.c:6245:2: note: Taking true branch
           if (kvm_state->hdr.vmx.vmcs12_pa !=3D -1ull) {
           ^
   arch/x86/kvm/vmx/nested.c:6246:7: note: Assuming field 'vmcs12_pa' is no=
t equal to field 'vmxon_pa'
                   if (kvm_state->hdr.vmx.vmcs12_pa =3D=3D kvm_state->hdr.v=
mx.vmxon_pa ||
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   arch/x86/kvm/vmx/nested.c:6246:7: note: Left side of '||' is false
   arch/x86/kvm/vmx/nested.c:6246:3: note: Taking false branch
                   if (kvm_state->hdr.vmx.vmcs12_pa =3D=3D kvm_state->hdr.v=
mx.vmxon_pa ||
                   ^
   arch/x86/kvm/vmx/nested.c:6263:6: note: Assuming the condition is false
           if (kvm_state->hdr.vmx.smm.flags & KVM_STATE_NESTED_SMM_VMXON) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/vmx/nested.c:6263:2: note: Taking false branch
           if (kvm_state->hdr.vmx.smm.flags & KVM_STATE_NESTED_SMM_VMXON) {
           ^
   arch/x86/kvm/vmx/nested.c:6272:6: note: Assuming the condition is false
           if (copy_from_user(vmcs12, user_vmx_nested_state->vmcs12, sizeof=
(*vmcs12)))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~
   arch/x86/kvm/vmx/nested.c:6272:2: note: Taking false branch
           if (copy_from_user(vmcs12, user_vmx_nested_state->vmcs12, sizeof=
(*vmcs12)))
           ^

vim +3362 arch/x86/kvm/vmx/nested.c

55d2375e58a61b Sean Christopherson 2018-12-03  3273  =

55d2375e58a61b Sean Christopherson 2018-12-03  3274  static void load_vmcs1=
2_host_state(struct kvm_vcpu *vcpu,
55d2375e58a61b Sean Christopherson 2018-12-03  3275  				   struct vmcs12 *=
vmcs12);
55d2375e58a61b Sean Christopherson 2018-12-03  3276  =

55d2375e58a61b Sean Christopherson 2018-12-03  3277  /*
55d2375e58a61b Sean Christopherson 2018-12-03  3278   * If from_vmentry is =
false, this is being called from state restore (either RSM
55d2375e58a61b Sean Christopherson 2018-12-03  3279   * or KVM_SET_NESTED_S=
TATE).  Otherwise it's called from vmlaunch/vmresume.
671ddc700fd08b Jim Mattson         2019-10-15  3280   *
671ddc700fd08b Jim Mattson         2019-10-15  3281   * Returns:
463bfeeead9741 Miaohe Lin          2020-02-14  3282   *	NVMX_VMENTRY_SUCCES=
S: Entered VMX non-root mode
463bfeeead9741 Miaohe Lin          2020-02-14  3283   *	NVMX_VMENTRY_VMFAIL=
:  Consistency check VMFail
463bfeeead9741 Miaohe Lin          2020-02-14  3284   *	NVMX_VMENTRY_VMEXIT=
:  Consistency check VMExit
463bfeeead9741 Miaohe Lin          2020-02-14  3285   *	NVMX_VMENTRY_KVM_IN=
TERNAL_ERROR: KVM internal error
55d2375e58a61b Sean Christopherson 2018-12-03  3286   */
671ddc700fd08b Jim Mattson         2019-10-15  3287  enum nvmx_vmentry_stat=
us nested_vmx_enter_non_root_mode(struct kvm_vcpu *vcpu,
671ddc700fd08b Jim Mattson         2019-10-15  3288  							bool from_vment=
ry)
55d2375e58a61b Sean Christopherson 2018-12-03  3289  {
55d2375e58a61b Sean Christopherson 2018-12-03  3290  	struct vcpu_vmx *vmx =
=3D to_vmx(vcpu);
55d2375e58a61b Sean Christopherson 2018-12-03  3291  	struct vmcs12 *vmcs12=
 =3D get_vmcs12(vcpu);
68cda40d9f3c4c Sean Christopherson 2020-05-11  3292  	enum vm_entry_failure=
_code entry_failure_code;
55d2375e58a61b Sean Christopherson 2018-12-03  3293  	bool evaluate_pending=
_interrupts;
8e53324021645f Sean Christopherson 2020-11-06  3294  	union vmx_exit_reason=
 exit_reason =3D {
8e53324021645f Sean Christopherson 2020-11-06  3295  		.basic =3D EXIT_REAS=
ON_INVALID_STATE,
8e53324021645f Sean Christopherson 2020-11-06  3296  		.failed_vmentry =3D =
1,
8e53324021645f Sean Christopherson 2020-11-06  3297  	};
8e53324021645f Sean Christopherson 2020-11-06  3298  	u32 failed_index;
55d2375e58a61b Sean Christopherson 2018-12-03  3299  =

eeeb4f67a6cd43 Sean Christopherson 2020-03-20  3300  	if (kvm_check_request=
(KVM_REQ_TLB_FLUSH_CURRENT, vcpu))
eeeb4f67a6cd43 Sean Christopherson 2020-03-20  3301  		kvm_vcpu_flush_tlb_c=
urrent(vcpu);
eeeb4f67a6cd43 Sean Christopherson 2020-03-20  3302  =

2183f5645ae7e0 Sean Christopherson 2019-05-07  3303  	evaluate_pending_inte=
rrupts =3D exec_controls_get(vmx) &
4e2a0bc56ad197 Xiaoyao Li          2019-12-06  3304  		(CPU_BASED_INTR_WIND=
OW_EXITING | CPU_BASED_NMI_WINDOW_EXITING);
55d2375e58a61b Sean Christopherson 2018-12-03  3305  	if (likely(!evaluate_=
pending_interrupts) && kvm_vcpu_apicv_active(vcpu))
55d2375e58a61b Sean Christopherson 2018-12-03  3306  		evaluate_pending_int=
errupts |=3D vmx_has_apicv_interrupt(vcpu);
55d2375e58a61b Sean Christopherson 2018-12-03  3307  =

55d2375e58a61b Sean Christopherson 2018-12-03  3308  	if (!(vmcs12->vm_entr=
y_controls & VM_ENTRY_LOAD_DEBUG_CONTROLS))
55d2375e58a61b Sean Christopherson 2018-12-03  3309  		vmx->nested.vmcs01_d=
ebugctl =3D vmcs_read64(GUEST_IA32_DEBUGCTL);
55d2375e58a61b Sean Christopherson 2018-12-03  3310  	if (kvm_mpx_supported=
() &&
55d2375e58a61b Sean Christopherson 2018-12-03  3311  		!(vmcs12->vm_entry_c=
ontrols & VM_ENTRY_LOAD_BNDCFGS))
55d2375e58a61b Sean Christopherson 2018-12-03  3312  		vmx->nested.vmcs01_g=
uest_bndcfgs =3D vmcs_read64(GUEST_BNDCFGS);
55d2375e58a61b Sean Christopherson 2018-12-03  3313  =

f087a02941feac Sean Christopherson 2019-06-07  3314  	/*
f087a02941feac Sean Christopherson 2019-06-07  3315  	 * Overwrite vmcs01.G=
UEST_CR3 with L1's CR3 if EPT is disabled *and*
f087a02941feac Sean Christopherson 2019-06-07  3316  	 * nested early check=
s are disabled.  In the event of a "late" VM-Fail,
f087a02941feac Sean Christopherson 2019-06-07  3317  	 * i.e. a VM-Fail det=
ected by hardware but not KVM, KVM must unwind its
f087a02941feac Sean Christopherson 2019-06-07  3318  	 * software model to =
the pre-VMEntry host state.  When EPT is disabled,
f087a02941feac Sean Christopherson 2019-06-07  3319  	 * GUEST_CR3 holds KV=
M's shadow CR3, not L1's "real" CR3, which causes
f087a02941feac Sean Christopherson 2019-06-07  3320  	 * nested_vmx_restore=
_host_state() to corrupt vcpu->arch.cr3.  Stuffing
f087a02941feac Sean Christopherson 2019-06-07  3321  	 * vmcs01.GUEST_CR3 r=
esults in the unwind naturally setting arch.cr3 to
f087a02941feac Sean Christopherson 2019-06-07  3322  	 * the correct value.=
  Smashing vmcs01.GUEST_CR3 is safe because nested
f087a02941feac Sean Christopherson 2019-06-07  3323  	 * VM-Exits, and the =
unwind, reset KVM's MMU, i.e. vmcs01.GUEST_CR3 is
f087a02941feac Sean Christopherson 2019-06-07  3324  	 * guaranteed to be o=
verwritten with a shadow CR3 prior to re-entering
f087a02941feac Sean Christopherson 2019-06-07  3325  	 * L1.  Don't stuff v=
mcs01.GUEST_CR3 when using nested early checks as
f087a02941feac Sean Christopherson 2019-06-07  3326  	 * KVM modifies vcpu-=
>arch.cr3 if and only if the early hardware checks
f087a02941feac Sean Christopherson 2019-06-07  3327  	 * pass, and early VM=
-Fails do not reset KVM's MMU, i.e. the VM-Fail
f087a02941feac Sean Christopherson 2019-06-07  3328  	 * path would need to=
 manually save/restore vmcs01.GUEST_CR3.
f087a02941feac Sean Christopherson 2019-06-07  3329  	 */
f087a02941feac Sean Christopherson 2019-06-07  3330  	if (!enable_ept && !n=
ested_early_check)
f087a02941feac Sean Christopherson 2019-06-07  3331  		vmcs_writel(GUEST_CR=
3, vcpu->arch.cr3);
f087a02941feac Sean Christopherson 2019-06-07  3332  =

55d2375e58a61b Sean Christopherson 2018-12-03  3333  	vmx_switch_vmcs(vcpu,=
 &vmx->nested.vmcs02);
55d2375e58a61b Sean Christopherson 2018-12-03  3334  =

55d2375e58a61b Sean Christopherson 2018-12-03  3335  	prepare_vmcs02_early(=
vmx, vmcs12);
55d2375e58a61b Sean Christopherson 2018-12-03  3336  =

55d2375e58a61b Sean Christopherson 2018-12-03  3337  	if (from_vmentry) {
b89d5ad00e7899 Sean Christopherson 2020-09-23  3338  		if (unlikely(!nested=
_get_vmcs12_pages(vcpu))) {
b89d5ad00e7899 Sean Christopherson 2020-09-23  3339  			vmx_switch_vmcs(vcp=
u, &vmx->vmcs01);
671ddc700fd08b Jim Mattson         2019-10-15  3340  			return NVMX_VMENTRY=
_KVM_INTERNAL_ERROR;
b89d5ad00e7899 Sean Christopherson 2020-09-23  3341  		}
55d2375e58a61b Sean Christopherson 2018-12-03  3342  =

55d2375e58a61b Sean Christopherson 2018-12-03  3343  		if (nested_vmx_check=
_vmentry_hw(vcpu)) {
55d2375e58a61b Sean Christopherson 2018-12-03  3344  			vmx_switch_vmcs(vcp=
u, &vmx->vmcs01);
671ddc700fd08b Jim Mattson         2019-10-15  3345  			return NVMX_VMENTRY=
_VMFAIL;
55d2375e58a61b Sean Christopherson 2018-12-03  3346  		}
55d2375e58a61b Sean Christopherson 2018-12-03  3347  =

68cda40d9f3c4c Sean Christopherson 2020-05-11  3348  		if (nested_vmx_check=
_guest_state(vcpu, vmcs12,
68cda40d9f3c4c Sean Christopherson 2020-05-11  3349  						 &entry_failure_=
code)) {
8e53324021645f Sean Christopherson 2020-11-06  3350  			exit_reason.basic =
=3D EXIT_REASON_INVALID_STATE;
68cda40d9f3c4c Sean Christopherson 2020-05-11  3351  			vmcs12->exit_qualif=
ication =3D entry_failure_code;
55d2375e58a61b Sean Christopherson 2018-12-03  3352  			goto vmentry_fail_v=
mexit;
55d2375e58a61b Sean Christopherson 2018-12-03  3353  		}
68cda40d9f3c4c Sean Christopherson 2020-05-11  3354  	}
55d2375e58a61b Sean Christopherson 2018-12-03  3355  =

55d2375e58a61b Sean Christopherson 2018-12-03  3356  	enter_guest_mode(vcpu=
);
5e3d394fdd9e6b Xiaoyao Li          2019-12-06  3357  	if (vmcs12->cpu_based=
_vm_exec_control & CPU_BASED_USE_TSC_OFFSETTING)
55d2375e58a61b Sean Christopherson 2018-12-03  3358  		vcpu->arch.tsc_offse=
t +=3D vmcs12->tsc_offset;
55d2375e58a61b Sean Christopherson 2018-12-03  3359  =

68cda40d9f3c4c Sean Christopherson 2020-05-11  3360  	if (prepare_vmcs02(vc=
pu, vmcs12, &entry_failure_code)) {
8e53324021645f Sean Christopherson 2020-11-06  3361  		exit_reason.basic =
=3D EXIT_REASON_INVALID_STATE;
68cda40d9f3c4c Sean Christopherson 2020-05-11 @3362  		vmcs12->exit_qualifi=
cation =3D entry_failure_code;
55d2375e58a61b Sean Christopherson 2018-12-03  3363  		goto vmentry_fail_vm=
exit_guest_mode;
68cda40d9f3c4c Sean Christopherson 2020-05-11  3364  	}
55d2375e58a61b Sean Christopherson 2018-12-03  3365  =

55d2375e58a61b Sean Christopherson 2018-12-03  3366  	if (from_vmentry) {
68cda40d9f3c4c Sean Christopherson 2020-05-11  3367  		failed_index =3D nes=
ted_vmx_load_msr(vcpu,
55d2375e58a61b Sean Christopherson 2018-12-03  3368  						   vmcs12->vm_en=
try_msr_load_addr,
55d2375e58a61b Sean Christopherson 2018-12-03  3369  						   vmcs12->vm_en=
try_msr_load_count);
68cda40d9f3c4c Sean Christopherson 2020-05-11  3370  		if (failed_index) {
8e53324021645f Sean Christopherson 2020-11-06  3371  			exit_reason.basic =
=3D EXIT_REASON_MSR_LOAD_FAIL;
68cda40d9f3c4c Sean Christopherson 2020-05-11  3372  			vmcs12->exit_qualif=
ication =3D failed_index;
55d2375e58a61b Sean Christopherson 2018-12-03  3373  			goto vmentry_fail_v=
mexit_guest_mode;
68cda40d9f3c4c Sean Christopherson 2020-05-11  3374  		}
55d2375e58a61b Sean Christopherson 2018-12-03  3375  	} else {
55d2375e58a61b Sean Christopherson 2018-12-03  3376  		/*
55d2375e58a61b Sean Christopherson 2018-12-03  3377  		 * The MMU is not in=
itialized to point at the right entities yet and
55d2375e58a61b Sean Christopherson 2018-12-03  3378  		 * "get pages" would=
 need to read data from the guest (i.e. we will
55d2375e58a61b Sean Christopherson 2018-12-03  3379  		 * need to perform g=
pa to hpa translation). Request a call
55d2375e58a61b Sean Christopherson 2018-12-03  3380  		 * to nested_get_vmc=
s12_pages before the next VM-entry.  The MSRs
55d2375e58a61b Sean Christopherson 2018-12-03  3381  		 * have already been=
 set at vmentry time and should not be reset.
55d2375e58a61b Sean Christopherson 2018-12-03  3382  		 */
729c15c20f1a7c Paolo Bonzini       2020-09-22  3383  		kvm_make_request(KVM=
_REQ_GET_NESTED_STATE_PAGES, vcpu);
55d2375e58a61b Sean Christopherson 2018-12-03  3384  	}
55d2375e58a61b Sean Christopherson 2018-12-03  3385  =

55d2375e58a61b Sean Christopherson 2018-12-03  3386  	/*
55d2375e58a61b Sean Christopherson 2018-12-03  3387  	 * If L1 had a pendin=
g IRQ/NMI until it executed
55d2375e58a61b Sean Christopherson 2018-12-03  3388  	 * VMLAUNCH/VMRESUME =
which wasn't delivered because it was
55d2375e58a61b Sean Christopherson 2018-12-03  3389  	 * disallowed (e.g. i=
nterrupts disabled), L0 needs to
55d2375e58a61b Sean Christopherson 2018-12-03  3390  	 * evaluate if this p=
ending event should cause an exit from L2
55d2375e58a61b Sean Christopherson 2018-12-03  3391  	 * to L1 or delivered=
 directly to L2 (e.g. In case L1 don't
55d2375e58a61b Sean Christopherson 2018-12-03  3392  	 * intercept EXTERNAL=
_INTERRUPT).
55d2375e58a61b Sean Christopherson 2018-12-03  3393  	 *
55d2375e58a61b Sean Christopherson 2018-12-03  3394  	 * Usually this would=
 be handled by the processor noticing an
55d2375e58a61b Sean Christopherson 2018-12-03  3395  	 * IRQ/NMI window req=
uest, or checking RVI during evaluation of
55d2375e58a61b Sean Christopherson 2018-12-03  3396  	 * pending virtual in=
terrupts.  However, this setting was done
55d2375e58a61b Sean Christopherson 2018-12-03  3397  	 * on VMCS01 and now =
VMCS02 is active instead. Thus, we force L0
55d2375e58a61b Sean Christopherson 2018-12-03  3398  	 * to perform pending=
 event evaluation by requesting a KVM_REQ_EVENT.
55d2375e58a61b Sean Christopherson 2018-12-03  3399  	 */
55d2375e58a61b Sean Christopherson 2018-12-03  3400  	if (unlikely(evaluate=
_pending_interrupts))
55d2375e58a61b Sean Christopherson 2018-12-03  3401  		kvm_make_request(KVM=
_REQ_EVENT, vcpu);
55d2375e58a61b Sean Christopherson 2018-12-03  3402  =

359a6c3ddc5184 Paolo Bonzini       2019-01-29  3403  	/*
359a6c3ddc5184 Paolo Bonzini       2019-01-29  3404  	 * Do not start the p=
reemption timer hrtimer until after we know
359a6c3ddc5184 Paolo Bonzini       2019-01-29  3405  	 * we are successful,=
 so that only nested_vmx_vmexit needs to cancel
359a6c3ddc5184 Paolo Bonzini       2019-01-29  3406  	 * the timer.
359a6c3ddc5184 Paolo Bonzini       2019-01-29  3407  	 */
359a6c3ddc5184 Paolo Bonzini       2019-01-29  3408  	vmx->nested.preemptio=
n_timer_expired =3D false;
850448f35aaf45 Peter Shier         2020-05-26  3409  	if (nested_cpu_has_pr=
eemption_timer(vmcs12)) {
850448f35aaf45 Peter Shier         2020-05-26  3410  		u64 timer_value =3D =
vmx_calc_preemption_timer_value(vcpu);
850448f35aaf45 Peter Shier         2020-05-26  3411  		vmx_start_preemption=
_timer(vcpu, timer_value);
850448f35aaf45 Peter Shier         2020-05-26  3412  	}
359a6c3ddc5184 Paolo Bonzini       2019-01-29  3413  =

55d2375e58a61b Sean Christopherson 2018-12-03  3414  	/*
55d2375e58a61b Sean Christopherson 2018-12-03  3415  	 * Note no nested_vmx=
_succeed or nested_vmx_fail here. At this point
55d2375e58a61b Sean Christopherson 2018-12-03  3416  	 * we are no longer r=
unning L1, and VMLAUNCH/VMRESUME has not yet
55d2375e58a61b Sean Christopherson 2018-12-03  3417  	 * returned as far as=
 L1 is concerned. It will only return (and set
55d2375e58a61b Sean Christopherson 2018-12-03  3418  	 * the success flag) =
when L2 exits (see nested_vmx_vmexit()).
55d2375e58a61b Sean Christopherson 2018-12-03  3419  	 */
671ddc700fd08b Jim Mattson         2019-10-15  3420  	return NVMX_VMENTRY_S=
UCCESS;
55d2375e58a61b Sean Christopherson 2018-12-03  3421  =

55d2375e58a61b Sean Christopherson 2018-12-03  3422  	/*
55d2375e58a61b Sean Christopherson 2018-12-03  3423  	 * A failed consisten=
cy check that leads to a VMExit during L1's
55d2375e58a61b Sean Christopherson 2018-12-03  3424  	 * VMEnter to L2 is a=
 variation of a normal VMexit, as explained in
55d2375e58a61b Sean Christopherson 2018-12-03  3425  	 * 26.7 "VM-entry fai=
lures during or after loading guest state".
55d2375e58a61b Sean Christopherson 2018-12-03  3426  	 */
55d2375e58a61b Sean Christopherson 2018-12-03  3427  vmentry_fail_vmexit_gu=
est_mode:
5e3d394fdd9e6b Xiaoyao Li          2019-12-06  3428  	if (vmcs12->cpu_based=
_vm_exec_control & CPU_BASED_USE_TSC_OFFSETTING)
55d2375e58a61b Sean Christopherson 2018-12-03  3429  		vcpu->arch.tsc_offse=
t -=3D vmcs12->tsc_offset;
55d2375e58a61b Sean Christopherson 2018-12-03  3430  	leave_guest_mode(vcpu=
);
55d2375e58a61b Sean Christopherson 2018-12-03  3431  =

55d2375e58a61b Sean Christopherson 2018-12-03  3432  vmentry_fail_vmexit:
55d2375e58a61b Sean Christopherson 2018-12-03  3433  	vmx_switch_vmcs(vcpu,=
 &vmx->vmcs01);
55d2375e58a61b Sean Christopherson 2018-12-03  3434  =

55d2375e58a61b Sean Christopherson 2018-12-03  3435  	if (!from_vmentry)
671ddc700fd08b Jim Mattson         2019-10-15  3436  		return NVMX_VMENTRY_=
VMEXIT;
55d2375e58a61b Sean Christopherson 2018-12-03  3437  =

55d2375e58a61b Sean Christopherson 2018-12-03  3438  	load_vmcs12_host_stat=
e(vcpu, vmcs12);
8e53324021645f Sean Christopherson 2020-11-06  3439  	vmcs12->vm_exit_reaso=
n =3D exit_reason.full;
55d2375e58a61b Sean Christopherson 2018-12-03  3440  	if (enable_shadow_vmc=
s || vmx->nested.hv_evmcs)
3731905ef28fc1 Sean Christopherson 2019-05-07  3441  		vmx->nested.need_vmc=
s12_to_shadow_sync =3D true;
671ddc700fd08b Jim Mattson         2019-10-15  3442  	return NVMX_VMENTRY_V=
MEXIT;
55d2375e58a61b Sean Christopherson 2018-12-03  3443  }
55d2375e58a61b Sean Christopherson 2018-12-03  3444  =


:::::: The code at line 3362 was first introduced by commit
:::::: 68cda40d9f3c4cb880108eb22f974d9e3d5dc6c5 KVM: nVMX: Tweak handling o=
f failure code for nested VM-Enter failure

:::::: TO: Sean Christopherson <sean.j.christopherson@intel.com>
:::::: CC: Paolo Bonzini <pbonzini@redhat.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============7992004194342204139==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
zCaIUcNmr/8Hv+yeS5S7AQA=
--===============7992004194342204139==--

