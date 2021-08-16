Content-Type: multipart/mixed; boundary="===============4974745117525537724=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/x86/kvm/vmx/vmx_ops.h:176:0: warning: syntax error [syntaxError]
Date: Tue, 17 Aug 2021 02:59:23 +0800
Message-ID: <202108170211.Kymf2CXy-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4974745117525537724==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Sean Christopherson <sean.j.christopherson@intel.com>
CC: Paolo Bonzini <pbonzini@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   7c60610d476766e128cc4284bb6349732cbd6606
commit: 5a085326d51d0c92bc5c1f62d60dcf3db450af69 KVM: VMX: Rename ops.h to =
vmx_ops.h
date:   11 months ago
:::::: branch date: 19 hours ago
:::::: commit date: 11 months ago
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   In file included from arch/x86/kvm/vmx/nested.c:
>> arch/x86/kvm/vmx/vmx_ops.h:176:0: warning: syntax error [syntaxError]
   =

   ^

vim +176 arch/x86/kvm/vmx/vmx_ops.h

89b0c9f58350f6 arch/x86/kvm/vmx/ops.h Sean Christopherson 2018-12-03  173  =

89b0c9f58350f6 arch/x86/kvm/vmx/ops.h Sean Christopherson 2018-12-03  174  =
static __always_inline void __vmcs_writel(unsigned long field, unsigned lon=
g value)
89b0c9f58350f6 arch/x86/kvm/vmx/ops.h Sean Christopherson 2018-12-03  175  {
52a9fcbc73a303 arch/x86/kvm/vmx/ops.h Sean Christopherson 2019-07-19 @176  =
	vmx_asm2(vmwrite, "r"(field), "rm"(value), field, value);
89b0c9f58350f6 arch/x86/kvm/vmx/ops.h Sean Christopherson 2018-12-03  177  }
89b0c9f58350f6 arch/x86/kvm/vmx/ops.h Sean Christopherson 2018-12-03  178  =


:::::: The code at line 176 was first introduced by commit
:::::: 52a9fcbc73a30375cad8d9e7b519e1ad97b0880a KVM: VMX: Optimize VMX inst=
ruction error and fault handling

:::::: TO: Sean Christopherson <sean.j.christopherson@intel.com>
:::::: CC: Paolo Bonzini <pbonzini@redhat.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4974745117525537724==--

