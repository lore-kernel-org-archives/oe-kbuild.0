Content-Type: multipart/mixed; boundary="===============1399665984924441096=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 03/12] KVM: x86: Expose TSC offset controls to userspace
Date: Mon, 19 Jul 2021 04:21:19 +0800
Message-ID: <202107190434.qTdQFHKx-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1399665984924441096==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20210716212629.2232756-4-oupton@google.com>
References: <20210716212629.2232756-4-oupton@google.com>
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
   Warning: Kernel ABI header at 'tools/arch/x86/include/uapi/asm/kvm.h' di=
ffers from latest version at 'arch/x86/include/uapi/asm/kvm.h':  162> struc=
t kvm_sregs2 {
   Warning: Kernel ABI header at 'tools/arch/x86/include/uapi/asm/kvm.h' di=
ffers from latest version at 'arch/x86/include/uapi/asm/kvm.h':  163> 	/* o=
ut (KVM_GET_SREGS2) / in (KVM_SET_SREGS2) */
   Warning: Kernel ABI header at 'tools/arch/x86/include/uapi/asm/kvm.h' di=
ffers from latest version at 'arch/x86/include/uapi/asm/kvm.h':  164> 	stru=
ct kvm_segment cs, ds, es, fs, gs, ss;
   Warning: Kernel ABI header at 'tools/arch/x86/include/uapi/asm/kvm.h' di=
ffers from latest version at 'arch/x86/include/uapi/asm/kvm.h':  165> 	stru=
ct kvm_segment tr, ldt;
   Warning: Kernel ABI header at 'tools/arch/x86/include/uapi/asm/kvm.h' di=
ffers from latest version at 'arch/x86/include/uapi/asm/kvm.h':  166> 	stru=
ct kvm_dtable gdt, idt;
   Warning: Kernel ABI header at 'tools/arch/x86/include/uapi/asm/kvm.h' di=
ffers from latest version at 'arch/x86/include/uapi/asm/kvm.h':  167> 	__u6=
4 cr0, cr2, cr3, cr4, cr8;
   Warning: Kernel ABI header at 'tools/arch/x86/include/uapi/asm/kvm.h' di=
ffers from latest version at 'arch/x86/include/uapi/asm/kvm.h':  168> 	__u6=
4 efer;
   Warning: Kernel ABI header at 'tools/arch/x86/include/uapi/asm/kvm.h' di=
ffers from latest version at 'arch/x86/include/uapi/asm/kvm.h':  169> 	__u6=
4 apic_base;
   Warning: Kernel ABI header at 'tools/arch/x86/include/uapi/asm/kvm.h' di=
ffers from latest version at 'arch/x86/include/uapi/asm/kvm.h':  170> 	__u6=
4 flags;
   Warning: Kernel ABI header at 'tools/arch/x86/include/uapi/asm/kvm.h' di=
ffers from latest version at 'arch/x86/include/uapi/asm/kvm.h':  171> 	__u6=
4 pdptrs[4];
   Warning: Kernel ABI header at 'tools/arch/x86/include/uapi/asm/kvm.h' di=
ffers from latest version at 'arch/x86/include/uapi/asm/kvm.h':  172> };
   Warning: Kernel ABI header at 'tools/arch/x86/include/uapi/asm/kvm.h' di=
ffers from latest version at 'arch/x86/include/uapi/asm/kvm.h':  173> #defi=
ne KVM_SREGS2_FLAGS_PDPTRS_VALID 1
   Warning: Kernel ABI header at 'tools/arch/x86/include/uapi/asm/kvm.h' di=
ffers from latest version at 'arch/x86/include/uapi/asm/kvm.h':  174> =

   Warning: Kernel ABI header at 'tools/arch/x86/include/uapi/asm/kvm.h' di=
ffers from latest version at 'arch/x86/include/uapi/asm/kvm.h':  505> =

>> Warning: Kernel ABI header at 'tools/arch/x86/include/uapi/asm/kvm.h' di=
ffers from latest version at 'arch/x86/include/uapi/asm/kvm.h':  506> /* fo=
r KVM_{GET,SET,HAS}_DEVICE_ATTR */
>> Warning: Kernel ABI header at 'tools/arch/x86/include/uapi/asm/kvm.h' di=
ffers from latest version at 'arch/x86/include/uapi/asm/kvm.h':  507> #defi=
ne KVM_VCPU_TSC_CTRL 0 /* control group for the timestamp counter (TSC) */
>> Warning: Kernel ABI header at 'tools/arch/x86/include/uapi/asm/kvm.h' di=
ffers from latest version at 'arch/x86/include/uapi/asm/kvm.h':  508> #defi=
ne   KVM_VCPU_TSC_OFFSET 0 /* attribute for the TSC offset */

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1399665984924441096==--

