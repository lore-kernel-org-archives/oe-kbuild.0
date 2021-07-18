Content-Type: multipart/mixed; boundary="===============6008879154657389318=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 08/12] KVM: arm64: Allow userspace to configure a vCPU's virtual offset
Date: Mon, 19 Jul 2021 04:23:56 +0800
Message-ID: <202107190443.6krerBEV-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6008879154657389318==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20210716212629.2232756-9-oupton@google.com>
References: <20210716212629.2232756-9-oupton@google.com>
TO: Oliver Upton <oupton@google.com>
TO: kvm(a)vger.kernel.org
TO: kvmarm(a)lists.cs.columbia.edu
CC: Paolo Bonzini <pbonzini@redhat.com>
CC: Sean Christopherson <seanjc@google.com>
CC: Marc Zyngier <maz@kernel.org>
CC: Peter Shier <pshier@google.com>
CC: Jim Mattson <jmattson@google.com>
CC: David Matlack <dmatlack@google.com>
CC: Ricardo Koller <ricarkol@google.com>
CC: Jing Zhang <jingzhangos@google.com>

Hi Oliver,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on kvm/queue]
[also build test WARNING on vhost/linux-next v5.14-rc1 next-20210716]
[cannot apply to kvmarm/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Oliver-Upton/KVM-Add-idemp=
otent-controls-for-migrating-system-counter-state/20210718-103407
base:   https://git.kernel.org/pub/scm/virt/kvm/kvm.git queue
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
compiler: gcc-10 (Ubuntu 10.3.0-1ubuntu1~20.04) 10.3.0
reproduce:
cd tools/perf && ./check-headers.sh

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


perfheadercheck warnings: (new ones prefixed by >>)
   Warning: Kernel ABI header at 'tools/arch/arm64/include/uapi/asm/kvm.h' =
differs from latest version at 'arch/arm64/include/uapi/asm/kvm.h':  187> s=
truct kvm_arm_copy_mte_tags {
   Warning: Kernel ABI header at 'tools/arch/arm64/include/uapi/asm/kvm.h' =
differs from latest version at 'arch/arm64/include/uapi/asm/kvm.h':  188> 	=
__u64 guest_ipa;
   Warning: Kernel ABI header at 'tools/arch/arm64/include/uapi/asm/kvm.h' =
differs from latest version at 'arch/arm64/include/uapi/asm/kvm.h':  189> 	=
__u64 length;
   Warning: Kernel ABI header at 'tools/arch/arm64/include/uapi/asm/kvm.h' =
differs from latest version at 'arch/arm64/include/uapi/asm/kvm.h':  190> 	=
void __user *addr;
   Warning: Kernel ABI header at 'tools/arch/arm64/include/uapi/asm/kvm.h' =
differs from latest version at 'arch/arm64/include/uapi/asm/kvm.h':  191> 	=
__u64 flags;
   Warning: Kernel ABI header at 'tools/arch/arm64/include/uapi/asm/kvm.h' =
differs from latest version at 'arch/arm64/include/uapi/asm/kvm.h':  192> 	=
__u64 reserved[2];
   Warning: Kernel ABI header at 'tools/arch/arm64/include/uapi/asm/kvm.h' =
differs from latest version at 'arch/arm64/include/uapi/asm/kvm.h':  193> };
   Warning: Kernel ABI header at 'tools/arch/arm64/include/uapi/asm/kvm.h' =
differs from latest version at 'arch/arm64/include/uapi/asm/kvm.h':  194> =

   Warning: Kernel ABI header at 'tools/arch/arm64/include/uapi/asm/kvm.h' =
differs from latest version at 'arch/arm64/include/uapi/asm/kvm.h':  195> #=
define KVM_ARM_TAGS_TO_GUEST		0
   Warning: Kernel ABI header at 'tools/arch/arm64/include/uapi/asm/kvm.h' =
differs from latest version at 'arch/arm64/include/uapi/asm/kvm.h':  196> #=
define KVM_ARM_TAGS_FROM_GUEST		1
   Warning: Kernel ABI header at 'tools/arch/arm64/include/uapi/asm/kvm.h' =
differs from latest version at 'arch/arm64/include/uapi/asm/kvm.h':  197> =

>> Warning: Kernel ABI header at 'tools/arch/arm64/include/uapi/asm/kvm.h' =
differs from latest version at 'arch/arm64/include/uapi/asm/kvm.h':  368> #=
define   KVM_ARM_VCPU_TIMER_OFFSET_VTIMER	2

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6008879154657389318==--

