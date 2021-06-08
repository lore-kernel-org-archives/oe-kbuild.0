Content-Type: multipart/mixed; boundary="===============2282469145027531215=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [RFC PATCH 5/5] KVM: arm64: Pass PSCI calls to userspace
Date: Wed, 09 Jun 2021 02:03:24 +0800
Message-ID: <202106090141.8X2Phqcy-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2282469145027531215==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20210608154805.216869-6-jean-philippe@linaro.org>
References: <20210608154805.216869-6-jean-philippe@linaro.org>
TO: "Jean-Philippe Brucker" <jean-philippe@linaro.org>

Hi Jean-Philippe,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on kvmarm/next]
[also build test WARNING on kvm/queue v5.13-rc5 next-20210608]
[cannot apply to vhost/linux-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Jean-Philippe-Brucker/KVM-=
arm64-Pass-PSCI-to-userspace/20210608-235708
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm.git n=
ext
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce:
cd tools/perf && ./check-headers.sh

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


perfheadercheck warnings: (new ones prefixed by >>)
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1086> #define KVM_CAP_ARM=
_MP_HALTED 199
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1087> #define KVM_CAP_ARM=
_HVC_TO_USER 200
>> Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs f=
rom latest version at 'include/uapi/linux/kvm.h': 1088> #define KVM_CAP_ARM=
_PSCI_TO_USER 201

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2282469145027531215==--

