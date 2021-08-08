Content-Type: multipart/mixed; boundary="===============4570766360484630213=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/x86/kvm/vmx/nested.c:3362:30: warning: Assigned value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
Date: Mon, 09 Aug 2021 06:59:12 +0800
Message-ID: <202108090604.cJ7GzXYU-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4570766360484630213==
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
head:   cceb634774efca60f8cc57041234f00faf97f22d
commit: f5c7e8425f18fdb9bdb7d13340651d7876890329 KVM: nVMX: Always make an =
attempt to map eVMCS after migration
date:   3 months ago
:::::: branch date: 4 hours ago
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
   ipc/shm.c:1446:9: note: Assuming 'addr' is 0, which participates in a co=
ndition later
                                   if (!addr && (shmflg & SHM_REMAP))
                                       ^~~~~
   ipc/shm.c:1446:9: note: Left side of '&&' is true
   ipc/shm.c:1446:19: note: Assuming the condition is false
                                   if (!addr && (shmflg & SHM_REMAP))
                                                 ^~~~~~~~~~~~~~~~~~
   ipc/shm.c:1446:5: note: Taking false branch
                                   if (!addr && (shmflg & SHM_REMAP))
                                   ^
   ipc/shm.c:1459:6: note: Assuming the condition is false
           if (shmflg & SHM_RDONLY) {
               ^~~~~~~~~~~~~~~~~~~
   ipc/shm.c:1459:2: note: Taking false branch
           if (shmflg & SHM_RDONLY) {
           ^
   ipc/shm.c:1468:6: note: Assuming the condition is false
           if (shmflg & SHM_EXEC) {
               ^~~~~~~~~~~~~~~~~
   ipc/shm.c:1468:2: note: Taking false branch
           if (shmflg & SHM_EXEC) {
           ^
   ipc/shm.c:1479:8: note: Calling 'shm_obtain_object_check'
           shp =3D shm_obtain_object_check(ns, shmid);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   ipc/shm.c:170:6: note: Calling 'IS_ERR'
           if (IS_ERR(ipcp))
               ^~~~~~~~~~~~
   include/linux/err.h:36:9: note: Assuming the condition is true
           return IS_ERR_VALUE((unsigned long)ptr);
                  ^
   include/linux/err.h:22:34: note: expanded from macro 'IS_ERR_VALUE'
   #define IS_ERR_VALUE(x) unlikely((unsigned long)(void *)(x) >=3D (unsign=
ed long)-MAX_ERRNO)
                           ~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/err.h:36:2: note: Returning the value 1, which participate=
s in a condition later
           return IS_ERR_VALUE((unsigned long)ptr);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   ipc/shm.c:170:6: note: Returning from 'IS_ERR'
           if (IS_ERR(ipcp))
               ^~~~~~~~~~~~
   ipc/shm.c:170:2: note: Taking true branch
           if (IS_ERR(ipcp))
           ^
   ipc/shm.c:171:3: note: Returning pointer, which participates in a condit=
ion later
                   return ERR_CAST(ipcp);
                   ^~~~~~~~~~~~~~~~~~~~~
   ipc/shm.c:1479:8: note: Returning from 'shm_obtain_object_check'
           shp =3D shm_obtain_object_check(ns, shmid);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   ipc/shm.c:1480:6: note: Calling 'IS_ERR'
           if (IS_ERR(shp)) {
               ^~~~~~~~~~~
   include/linux/err.h:36:2: note: Returning the value 1, which participate=
s in a condition later
           return IS_ERR_VALUE((unsigned long)ptr);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   ipc/shm.c:1480:6: note: Returning from 'IS_ERR'
           if (IS_ERR(shp)) {
               ^~~~~~~~~~~
   ipc/shm.c:1480:2: note: Taking true branch
           if (IS_ERR(shp)) {
           ^
   ipc/shm.c:1482:3: note: Control jumps to line 1584
                   goto out_unlock;
                   ^
   ipc/shm.c:1586:2: note: Returning without writing to '*raddr'
           return err;
           ^
   ipc/shm.c:1586:2: note: Returning value (loaded from 'err'), which parti=
cipates in a condition later
           return err;
           ^~~~~~~~~~
   ipc/shm.c:1612:8: note: Returning from 'do_shmat'
           err =3D do_shmat(shmid, compat_ptr(shmaddr), shmflg, &ret, COMPA=
T_SHMLBA);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   ipc/shm.c:1613:6: note: Assuming 'err' is 0
           if (err)
               ^~~
   ipc/shm.c:1613:2: note: Taking false branch
           if (err)
           ^
   ipc/shm.c:1615:2: note: Loop condition is false.  Exiting loop
           force_successful_syscall_return();
           ^
   include/linux/ptrace.h:254:43: note: expanded from macro 'force_successf=
ul_syscall_return'
   #define force_successful_syscall_return() do { } while (0)
                                             ^
   ipc/shm.c:1616:2: note: Undefined or garbage value returned to caller
           return (long)ret;
           ^      ~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
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

--===============4570766360484630213==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
VplNEKOGzV7/D6WAA9uquwEA
--===============4570766360484630213==--

