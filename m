Content-Type: multipart/mixed; boundary="===============8917145258077508764=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v17 5/6] KVM: arm64: ioctl to fetch/store tags in a guest
Date: Tue, 22 Jun 2021 01:53:47 +0800
Message-ID: <202106220134.4TooJspN-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8917145258077508764==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20210621111716.37157-6-steven.price@arm.com>
References: <20210621111716.37157-6-steven.price@arm.com>
TO: Steven Price <steven.price@arm.com>
TO: Catalin Marinas <catalin.marinas@arm.com>
TO: Marc Zyngier <maz@kernel.org>
TO: Will Deacon <will@kernel.org>
CC: Steven Price <steven.price@arm.com>
CC: James Morse <james.morse@arm.com>
CC: Julien Thierry <julien.thierry.kdev@gmail.com>
CC: Suzuki K Poulose <suzuki.poulose@arm.com>
CC: kvmarm(a)lists.cs.columbia.edu
CC: linux-arm-kernel(a)lists.infradead.org
CC: linux-kernel(a)vger.kernel.org

Hi Steven,

I love your patch! Perhaps something to improve:

[auto build test WARNING on v5.13-rc7]
[cannot apply to kvmarm/next arm64/for-next/core kvm/queue next-20210621]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Steven-Price/MTE-support-f=
or-KVM-guest/20210621-191918
base:    13311e74253fe64329390df80bed3f07314ddd61
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce:
cd tools/perf && ./check-headers.sh

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


perfheadercheck warnings: (new ones prefixed by >>)
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1086> #define KVM_CAP_ARM=
_MTE 199
>> Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1432> #define KVM_ARM_MTE=
_COPY_TAGS	  _IOR(KVMIO,  0xb4, struct kvm_arm_copy_mte_tags)
--
>> Warning: Kernel ABI header at 'tools/arch/arm64/include/uapi/asm/kvm.h' =
differs from latest version at 'arch/arm64/include/uapi/asm/kvm.h':  187> s=
truct kvm_arm_copy_mte_tags {
>> Warning: Kernel ABI header at 'tools/arch/arm64/include/uapi/asm/kvm.h' =
differs from latest version at 'arch/arm64/include/uapi/asm/kvm.h':  188> 	=
__u64 guest_ipa;
>> Warning: Kernel ABI header at 'tools/arch/arm64/include/uapi/asm/kvm.h' =
differs from latest version at 'arch/arm64/include/uapi/asm/kvm.h':  189> 	=
__u64 length;
>> Warning: Kernel ABI header at 'tools/arch/arm64/include/uapi/asm/kvm.h' =
differs from latest version at 'arch/arm64/include/uapi/asm/kvm.h':  190> 	=
void __user *addr;
>> Warning: Kernel ABI header at 'tools/arch/arm64/include/uapi/asm/kvm.h' =
differs from latest version at 'arch/arm64/include/uapi/asm/kvm.h':  191> 	=
__u64 flags;
>> Warning: Kernel ABI header at 'tools/arch/arm64/include/uapi/asm/kvm.h' =
differs from latest version at 'arch/arm64/include/uapi/asm/kvm.h':  192> 	=
__u64 reserved[2];
   Warning: Kernel ABI header at 'tools/arch/arm64/include/uapi/asm/kvm.h' =
differs from latest version at 'arch/arm64/include/uapi/asm/kvm.h':  193> };
   Warning: Kernel ABI header at 'tools/arch/arm64/include/uapi/asm/kvm.h' =
differs from latest version at 'arch/arm64/include/uapi/asm/kvm.h':  194> =

>> Warning: Kernel ABI header at 'tools/arch/arm64/include/uapi/asm/kvm.h' =
differs from latest version at 'arch/arm64/include/uapi/asm/kvm.h':  195> #=
define KVM_ARM_TAGS_TO_GUEST		0
>> Warning: Kernel ABI header at 'tools/arch/arm64/include/uapi/asm/kvm.h' =
differs from latest version at 'arch/arm64/include/uapi/asm/kvm.h':  196> #=
define KVM_ARM_TAGS_FROM_GUEST		1
   Warning: Kernel ABI header at 'tools/arch/arm64/include/uapi/asm/kvm.h' =
differs from latest version at 'arch/arm64/include/uapi/asm/kvm.h':  197> =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8917145258077508764==--

