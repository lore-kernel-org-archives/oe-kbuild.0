Content-Type: multipart/mixed; boundary="===============5752211548924184882=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 17/28] KVM: VMX: Extend VMX controls macro shenanigans
Date: Thu, 30 Jun 2022 19:18:09 +0800
Message-ID: <202206301959.fJmtKxv9-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5752211548924184882==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "commit no functional change"
:::::: =


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
[cannot apply to tip/x86/core mst-vhost/linux-next linus/master v5.19-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Vitaly-Kuznetsov/KVM=
-VMX-Support-TscScaling-and-EnclsExitingBitmap-with-eVMCS-use-vmcs_config-f=
or-L1-VMX-MSRs/20220629-231053
base:   https://git.kernel.org/pub/scm/virt/kvm/kvm.git queue
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20220630=
/202206301959.fJmtKxv9-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0
reproduce (this is a W=3D1 build):
        # https://github.com/intel-lab-lkp/linux/commit/9c71af2ee4c61edceb5=
b7e478ee5db07b4a27bbc
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Vitaly-Kuznetsov/KVM-VMX-Support-T=
scScaling-and-EnclsExitingBitmap-with-eVMCS-use-vmcs_config-for-L1-VMX-MSRs=
/20220629-231053
        git checkout 9c71af2ee4c61edceb5b7e478ee5db07b4a27bbc
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=3D1 O=3Dbuild_dir ARCH=3Di386 SHELL=3D/bin/bash arch/x86/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   In function 'vm_entry_controls_setbit',
       inlined from 'vmx_set_efer' at arch/x86/kvm/vmx/vmx.c:2903:3:
>> include/linux/compiler_types.h:352:45: error: call to '__compiletime_ass=
ert_532' declared with attribute error: BUILD_BUG_ON failed: !(val & (KVM_R=
EQ_VMX_VM_ENTRY_CONTROLS | KVM_OPT_VMX_VM_ENTRY_CONTROLS))
     352 |         _compiletime_assert(condition, msg, __compiletime_assert=
_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:333:25: note: in definition of macro '__c=
ompiletime_assert'
     333 |                         prefix ## suffix();                     =
        \
         |                         ^~~~~~
   include/linux/compiler_types.h:352:9: note: in expansion of macro '_comp=
iletime_assert'
     352 |         _compiletime_assert(condition, msg, __compiletime_assert=
_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletim=
e_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), =
msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_O=
N_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #con=
dition)
         |         ^~~~~~~~~~~~~~~~
   arch/x86/kvm/vmx/vmx.h:596:9: note: in expansion of macro 'BUILD_BUG_ON'
     596 |         BUILD_BUG_ON(!(val & (KVM_REQ_VMX_##uname | KVM_OPT_VMX_=
##uname)));     \
         |         ^~~~~~~~~~~~
   arch/x86/kvm/vmx/vmx.h:604:1: note: in expansion of macro 'BUILD_CONTROL=
S_SHADOW'
     604 | BUILD_CONTROLS_SHADOW(vm_entry, VM_ENTRY_CONTROLS, 32)
         | ^~~~~~~~~~~~~~~~~~~~~
   In function 'vm_entry_controls_clearbit',
       inlined from 'vmx_set_efer' at arch/x86/kvm/vmx/vmx.c:2905:3:
   include/linux/compiler_types.h:352:45: error: call to '__compiletime_ass=
ert_533' declared with attribute error: BUILD_BUG_ON failed: !(val & (KVM_R=
EQ_VMX_VM_ENTRY_CONTROLS | KVM_OPT_VMX_VM_ENTRY_CONTROLS))
     352 |         _compiletime_assert(condition, msg, __compiletime_assert=
_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:333:25: note: in definition of macro '__c=
ompiletime_assert'
     333 |                         prefix ## suffix();                     =
        \
         |                         ^~~~~~
   include/linux/compiler_types.h:352:9: note: in expansion of macro '_comp=
iletime_assert'
     352 |         _compiletime_assert(condition, msg, __compiletime_assert=
_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletim=
e_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), =
msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_O=
N_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #con=
dition)
         |         ^~~~~~~~~~~~~~~~
   arch/x86/kvm/vmx/vmx.h:601:9: note: in expansion of macro 'BUILD_BUG_ON'
     601 |         BUILD_BUG_ON(!(val & (KVM_REQ_VMX_##uname | KVM_OPT_VMX_=
##uname)));     \
         |         ^~~~~~~~~~~~
   arch/x86/kvm/vmx/vmx.h:604:1: note: in expansion of macro 'BUILD_CONTROL=
S_SHADOW'
     604 | BUILD_CONTROLS_SHADOW(vm_entry, VM_ENTRY_CONTROLS, 32)
         | ^~~~~~~~~~~~~~~~~~~~~


vim +/__compiletime_assert_532 +352 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  338  =

eb5c2d4b45e3d2 Will Deacon 2020-07-21  339  #define _compiletime_assert(con=
dition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  340  	__compiletime_assert(condition=
, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  341  =

eb5c2d4b45e3d2 Will Deacon 2020-07-21  342  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  343   * compiletime_assert - break b=
uild and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  344   * @condition: a compile-time c=
onstant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  345   * @msg:       a message to emi=
t if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  346   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  347   * In tradition of POSIX assert=
, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  348   * supplied condition is *false=
*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  349   * compiler has support to do s=
o.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  350   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  351  #define compiletime_assert(cond=
ition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @352  	_compiletime_assert(condition,=
 msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  353  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5752211548924184882==--

