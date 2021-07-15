Content-Type: multipart/mixed; boundary="===============4915099491965940086=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 09/16] KVM: arm64: Advertise a capability for MMIO guard
Date: Fri, 16 Jul 2021 04:10:20 +0800
Message-ID: <202107160429.rVF4O6Ib-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4915099491965940086==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20210715163159.1480168-10-maz@kernel.org>
References: <20210715163159.1480168-10-maz@kernel.org>
TO: Marc Zyngier <maz@kernel.org>

Hi Marc,

I love your patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v5.14-rc1 next-20210715]
[cannot apply to kvmarm/next arm64/for-next/core kvm/queue]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Marc-Zyngier/KVM-arm64-MMI=
O-guard-PV-services/20210716-005453
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
8096acd7442e613fad0354fc8dfdb2003cceea0b
:::::: branch date: 3 hours ago
:::::: commit date: 3 hours ago
compiler: gcc-10 (Ubuntu 10.3.0-1ubuntu1~20.04) 10.3.0
reproduce:
cd tools/perf && ./check-headers.sh

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


perfheadercheck warnings: (new ones prefixed by >>)
>> Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1115> #define KVM_CAP_ARM=
_MMIO_GUARD 206

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4915099491965940086==--

