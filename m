Content-Type: multipart/mixed; boundary="===============0670168037468150696=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 17/28] KVM: VMX: Extend VMX controls macro shenanigans
Date: Thu, 30 Jun 2022 07:10:45 +0800
Message-ID: <202206300737.hxbeaBdX-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0670168037468150696==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "commit no functional change"
:::::: =


CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220629150625.238286-18-vkuznets@redhat.com>
References: <20220629150625.238286-18-vkuznets@redhat.com>
TO: Vitaly Kuznetsov <vkuznets@redhat.com>
TO: kvm(a)vger.kernel.org
TO: Paolo Bonzini <pbonzini@redhat.com>
TO: Sean Christopherson <seanjc@google.com>
CC: Anirudh Rayabharam <anrayabh@linux.microsoft.com>
CC: Wanpeng Li <wanpengli@tencent.com>
CC: Jim Mattson <jmattson@google.com>
CC: Maxim Levitsky <mlevitsk@redhat.com>
CC: linux-hyperv(a)vger.kernel.org
CC: linux-kernel(a)vger.kernel.org

Hi Vitaly,

I love your patch! Yet something to improve:

[auto build test ERROR on kvm/queue]
[also build test ERROR on next-20220629]
[cannot apply to tip/x86/core mst-vhost/linux-next linus/master v5.19-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Vitaly-Kuznetsov/KVM=
-VMX-Support-TscScaling-and-EnclsExitingBitmap-with-eVMCS-use-vmcs_config-f=
or-L1-VMX-MSRs/20220629-231053
base:   https://git.kernel.org/pub/scm/virt/kvm/kvm.git queue
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
config: i386-randconfig-a002 (https://download.01.org/0day-ci/archive/20220=
630/202206300737.hxbeaBdX-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a774ba=
7f60d1fef403b5507b1b1a7475d3684d71)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/9c71af2ee4c61edceb5=
b7e478ee5db07b4a27bbc
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Vitaly-Kuznetsov/KVM-VMX-Support-T=
scScaling-and-EnclsExitingBitmap-with-eVMCS-use-vmcs_config-for-L1-VMX-MSRs=
/20220629-231053
        git checkout 9c71af2ee4c61edceb5b7e478ee5db07b4a27bbc
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross W=3D=
1 O=3Dbuild_dir ARCH=3Di386 SHELL=3D/bin/bash arch/x86/kvm/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from arch/x86/kvm/vmx/vmx.c:61:
   In file included from arch/x86/kvm/vmx/nested.h:7:
>> arch/x86/kvm/vmx/vmx.h:604:1: error: call to __compiletime_assert_493 de=
clared with 'error' attribute: BUILD_BUG_ON failed: !(val & (KVM_REQ_VMX_VM=
_ENTRY_CONTROLS | KVM_OPT_VMX_VM_ENTRY_CONTROLS))
   BUILD_CONTROLS_SHADOW(vm_entry, VM_ENTRY_CONTROLS, 32)
   ^
   arch/x86/kvm/vmx/vmx.h:596:2: note: expanded from macro 'BUILD_CONTROLS_=
SHADOW'
           BUILD_BUG_ON(!(val & (KVM_REQ_VMX_##uname | KVM_OPT_VMX_##uname)=
));     \
           ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
           BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:340:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:333:4: note: expanded from macro '__compi=
letime_assert'
                           prefix ## suffix();                             \
                           ^
   <scratch space>:168:1: note: expanded from here
   __compiletime_assert_493
   ^
   In file included from arch/x86/kvm/vmx/vmx.c:61:
   In file included from arch/x86/kvm/vmx/nested.h:7:
   arch/x86/kvm/vmx/vmx.h:604:1: error: call to __compiletime_assert_494 de=
clared with 'error' attribute: BUILD_BUG_ON failed: !(val & (KVM_REQ_VMX_VM=
_ENTRY_CONTROLS | KVM_OPT_VMX_VM_ENTRY_CONTROLS))
   arch/x86/kvm/vmx/vmx.h:601:2: note: expanded from macro 'BUILD_CONTROLS_=
SHADOW'
           BUILD_BUG_ON(!(val & (KVM_REQ_VMX_##uname | KVM_OPT_VMX_##uname)=
));     \
           ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
           BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:340:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:333:4: note: expanded from macro '__compi=
letime_assert'
                           prefix ## suffix();                             \
                           ^
   <scratch space>:178:1: note: expanded from here
   __compiletime_assert_494
   ^
   In file included from arch/x86/kvm/vmx/vmx.c:61:
   In file included from arch/x86/kvm/vmx/nested.h:7:
>> arch/x86/kvm/vmx/vmx.h:605:1: error: call to __compiletime_assert_495 de=
clared with 'error' attribute: BUILD_BUG_ON failed: !(val & (KVM_REQ_VMX_VM=
_EXIT_CONTROLS | KVM_OPT_VMX_VM_EXIT_CONTROLS))
   BUILD_CONTROLS_SHADOW(vm_exit, VM_EXIT_CONTROLS, 32)
   ^
   arch/x86/kvm/vmx/vmx.h:596:2: note: expanded from macro 'BUILD_CONTROLS_=
SHADOW'
           BUILD_BUG_ON(!(val & (KVM_REQ_VMX_##uname | KVM_OPT_VMX_##uname)=
));     \
           ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
           BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:340:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:333:4: note: expanded from macro '__compi=
letime_assert'
                           prefix ## suffix();                             \
                           ^
   <scratch space>:198:1: note: expanded from here
   __compiletime_assert_495
   ^
   In file included from arch/x86/kvm/vmx/vmx.c:61:
   In file included from arch/x86/kvm/vmx/nested.h:7:
>> arch/x86/kvm/vmx/vmx.h:604:1: error: call to __compiletime_assert_493 de=
clared with 'error' attribute: BUILD_BUG_ON failed: !(val & (KVM_REQ_VMX_VM=
_ENTRY_CONTROLS | KVM_OPT_VMX_VM_ENTRY_CONTROLS))
   BUILD_CONTROLS_SHADOW(vm_entry, VM_ENTRY_CONTROLS, 32)
   ^
   arch/x86/kvm/vmx/vmx.h:596:2: note: expanded from macro 'BUILD_CONTROLS_=
SHADOW'
           BUILD_BUG_ON(!(val & (KVM_REQ_VMX_##uname | KVM_OPT_VMX_##uname)=
));     \
           ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
           BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:340:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:333:4: note: expanded from macro '__compi=
letime_assert'
                           prefix ## suffix();                             \
                           ^
   <scratch space>:168:1: note: expanded from here
   __compiletime_assert_493
   ^
   4 errors generated.


vim +/error +604 arch/x86/kvm/vmx/vmx.h

9c71af2ee4c61e Vitaly Kuznetsov    2022-06-29  539  =

9c71af2ee4c61e Vitaly Kuznetsov    2022-06-29  540  #define KVM_OPT_VMX_CPU=
_BASED_VM_EXEC_CONTROL			\
9c71af2ee4c61e Vitaly Kuznetsov    2022-06-29  541  	(CPU_BASED_TPR_SHADOW =
|					\
9c71af2ee4c61e Vitaly Kuznetsov    2022-06-29  542  	CPU_BASED_USE_MSR_BITM=
APS |				\
9c71af2ee4c61e Vitaly Kuznetsov    2022-06-29  543  	CPU_BASED_ACTIVATE_SEC=
ONDARY_CONTROLS |			\
9c71af2ee4c61e Vitaly Kuznetsov    2022-06-29  544  	CPU_BASED_ACTIVATE_TER=
TIARY_CONTROLS)
9c71af2ee4c61e Vitaly Kuznetsov    2022-06-29  545  =

9c71af2ee4c61e Vitaly Kuznetsov    2022-06-29  546  #define KVM_REQ_VMX_SEC=
ONDARY_VM_EXEC_CONTROL 0
9c71af2ee4c61e Vitaly Kuznetsov    2022-06-29  547  #define KVM_OPT_VMX_SEC=
ONDARY_VM_EXEC_CONTROL			\
9c71af2ee4c61e Vitaly Kuznetsov    2022-06-29  548  	(SECONDARY_EXEC_VIRTUA=
LIZE_APIC_ACCESSES |		\
9c71af2ee4c61e Vitaly Kuznetsov    2022-06-29  549  	SECONDARY_EXEC_VIRTUAL=
IZE_X2APIC_MODE |			\
9c71af2ee4c61e Vitaly Kuznetsov    2022-06-29  550  	SECONDARY_EXEC_WBINVD_=
EXITING |				\
9c71af2ee4c61e Vitaly Kuznetsov    2022-06-29  551  	SECONDARY_EXEC_ENABLE_=
VPID |				\
9c71af2ee4c61e Vitaly Kuznetsov    2022-06-29  552  	SECONDARY_EXEC_ENABLE_=
EPT |				\
9c71af2ee4c61e Vitaly Kuznetsov    2022-06-29  553  	SECONDARY_EXEC_UNRESTR=
ICTED_GUEST |			\
9c71af2ee4c61e Vitaly Kuznetsov    2022-06-29  554  	SECONDARY_EXEC_PAUSE_L=
OOP_EXITING |			\
9c71af2ee4c61e Vitaly Kuznetsov    2022-06-29  555  	SECONDARY_EXEC_DESC |	=
				\
9c71af2ee4c61e Vitaly Kuznetsov    2022-06-29  556  	SECONDARY_EXEC_ENABLE_=
RDTSCP |				\
9c71af2ee4c61e Vitaly Kuznetsov    2022-06-29  557  	SECONDARY_EXEC_ENABLE_=
INVPCID |				\
9c71af2ee4c61e Vitaly Kuznetsov    2022-06-29  558  	SECONDARY_EXEC_APIC_RE=
GISTER_VIRT |			\
9c71af2ee4c61e Vitaly Kuznetsov    2022-06-29  559  	SECONDARY_EXEC_VIRTUAL=
_INTR_DELIVERY |			\
9c71af2ee4c61e Vitaly Kuznetsov    2022-06-29  560  	SECONDARY_EXEC_SHADOW_=
VMCS |				\
9c71af2ee4c61e Vitaly Kuznetsov    2022-06-29  561  	SECONDARY_EXEC_XSAVES =
|					\
9c71af2ee4c61e Vitaly Kuznetsov    2022-06-29  562  	SECONDARY_EXEC_RDSEED_=
EXITING |				\
9c71af2ee4c61e Vitaly Kuznetsov    2022-06-29  563  	SECONDARY_EXEC_RDRAND_=
EXITING |				\
9c71af2ee4c61e Vitaly Kuznetsov    2022-06-29  564  	SECONDARY_EXEC_ENABLE_=
PML |				\
9c71af2ee4c61e Vitaly Kuznetsov    2022-06-29  565  	SECONDARY_EXEC_TSC_SCA=
LING |				\
9c71af2ee4c61e Vitaly Kuznetsov    2022-06-29  566  	SECONDARY_EXEC_ENABLE_=
USR_WAIT_PAUSE |			\
9c71af2ee4c61e Vitaly Kuznetsov    2022-06-29  567  	SECONDARY_EXEC_PT_USE_=
GPA |				\
9c71af2ee4c61e Vitaly Kuznetsov    2022-06-29  568  	SECONDARY_EXEC_PT_CONC=
EAL_VMX |				\
9c71af2ee4c61e Vitaly Kuznetsov    2022-06-29  569  	SECONDARY_EXEC_ENABLE_=
VMFUNC |				\
9c71af2ee4c61e Vitaly Kuznetsov    2022-06-29  570  	SECONDARY_EXEC_BUS_LOC=
K_DETECTION |			\
9c71af2ee4c61e Vitaly Kuznetsov    2022-06-29  571  	SECONDARY_EXEC_NOTIFY_=
VM_EXITING |			\
9c71af2ee4c61e Vitaly Kuznetsov    2022-06-29  572  	SECONDARY_EXEC_ENCLS_E=
XITING)
9c71af2ee4c61e Vitaly Kuznetsov    2022-06-29  573  =

9c71af2ee4c61e Vitaly Kuznetsov    2022-06-29  574  #define KVM_REQ_VMX_TER=
TIARY_VM_EXEC_CONTROL 0
9c71af2ee4c61e Vitaly Kuznetsov    2022-06-29  575  #define KVM_OPT_VMX_TER=
TIARY_VM_EXEC_CONTROL			\
9c71af2ee4c61e Vitaly Kuznetsov    2022-06-29  576  	(TERTIARY_EXEC_IPI_VIR=
T)
9c71af2ee4c61e Vitaly Kuznetsov    2022-06-29  577  =

ed3905ba60384a Robert Hoo          2022-04-19  578  #define BUILD_CONTROLS_=
SHADOW(lname, uname, bits)				\
ed3905ba60384a Robert Hoo          2022-04-19  579  static inline void lnam=
e##_controls_set(struct vcpu_vmx *vmx, u##bits val)	\
70f932ecdfe6b5 Sean Christopherson 2019-05-07  580  {										\
09e226cf07e6bf Sean Christopherson 2019-05-07  581  	if (vmx->loaded_vmcs->=
controls_shadow.lname !=3D val) {			\
ed3905ba60384a Robert Hoo          2022-04-19  582  		vmcs_write##bits(unam=
e, val);					\
09e226cf07e6bf Sean Christopherson 2019-05-07  583  		vmx->loaded_vmcs->con=
trols_shadow.lname =3D val;			\
09e226cf07e6bf Sean Christopherson 2019-05-07  584  	}									\
70f932ecdfe6b5 Sean Christopherson 2019-05-07  585  }										\
ed3905ba60384a Robert Hoo          2022-04-19  586  static inline u##bits _=
_##lname##_controls_get(struct loaded_vmcs *vmcs)	\
389ab25216c9d0 Sean Christopherson 2021-08-10  587  {										\
389ab25216c9d0 Sean Christopherson 2021-08-10  588  	return vmcs->controls_=
shadow.lname;					\
389ab25216c9d0 Sean Christopherson 2021-08-10  589  }										\
ed3905ba60384a Robert Hoo          2022-04-19  590  static inline u##bits l=
name##_controls_get(struct vcpu_vmx *vmx)		\
70f932ecdfe6b5 Sean Christopherson 2019-05-07  591  {										\
389ab25216c9d0 Sean Christopherson 2021-08-10  592  	return __##lname##_con=
trols_get(vmx->loaded_vmcs);			\
70f932ecdfe6b5 Sean Christopherson 2019-05-07  593  }										\
ed3905ba60384a Robert Hoo          2022-04-19  594  static inline void lnam=
e##_controls_setbit(struct vcpu_vmx *vmx, u##bits val)	\
70f932ecdfe6b5 Sean Christopherson 2019-05-07  595  {										\
9c71af2ee4c61e Vitaly Kuznetsov    2022-06-29  596  	BUILD_BUG_ON(!(val & (=
KVM_REQ_VMX_##uname | KVM_OPT_VMX_##uname)));	\
70f932ecdfe6b5 Sean Christopherson 2019-05-07  597  	lname##_controls_set(v=
mx, lname##_controls_get(vmx) | val);		\
70f932ecdfe6b5 Sean Christopherson 2019-05-07  598  }										\
ed3905ba60384a Robert Hoo          2022-04-19  599  static inline void lnam=
e##_controls_clearbit(struct vcpu_vmx *vmx, u##bits val)	\
70f932ecdfe6b5 Sean Christopherson 2019-05-07  600  {										\
9c71af2ee4c61e Vitaly Kuznetsov    2022-06-29  601  	BUILD_BUG_ON(!(val & (=
KVM_REQ_VMX_##uname | KVM_OPT_VMX_##uname)));	\
70f932ecdfe6b5 Sean Christopherson 2019-05-07  602  	lname##_controls_set(v=
mx, lname##_controls_get(vmx) & ~val);		\
89b0c9f58350f6 Sean Christopherson 2018-12-03  603  }
ed3905ba60384a Robert Hoo          2022-04-19 @604  BUILD_CONTROLS_SHADOW(v=
m_entry, VM_ENTRY_CONTROLS, 32)
ed3905ba60384a Robert Hoo          2022-04-19 @605  BUILD_CONTROLS_SHADOW(v=
m_exit, VM_EXIT_CONTROLS, 32)
ed3905ba60384a Robert Hoo          2022-04-19  606  BUILD_CONTROLS_SHADOW(p=
in, PIN_BASED_VM_EXEC_CONTROL, 32)
ed3905ba60384a Robert Hoo          2022-04-19  607  BUILD_CONTROLS_SHADOW(e=
xec, CPU_BASED_VM_EXEC_CONTROL, 32)
ed3905ba60384a Robert Hoo          2022-04-19  608  BUILD_CONTROLS_SHADOW(s=
econdary_exec, SECONDARY_VM_EXEC_CONTROL, 32)
1ad4e5438c67a0 Robert Hoo          2022-04-19  609  BUILD_CONTROLS_SHADOW(t=
ertiary_exec, TERTIARY_VM_EXEC_CONTROL, 64)
89b0c9f58350f6 Sean Christopherson 2018-12-03  610  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0670168037468150696==--

