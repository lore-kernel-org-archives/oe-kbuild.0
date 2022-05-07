Content-Type: multipart/mixed; boundary="===============5227399492292153474=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [intel-tdx:kvm-upstream-workaround 219/361] arch/x86/kvm/mmu/mmu_internal.h: mmu.h is included more than once.
Date: Sat, 07 May 2022 21:00:53 +0800
Message-ID: <202205072036.6EWBogQv-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5227399492292153474==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Isaku Yamahata <isaku.yamahata@intel.com>

tree:   https://github.com/intel/tdx.git kvm-upstream-workaround
head:   3b5b338cdf10dca7a2435d1f86b2dd9f1a3ad833
commit: 9be9dc86983ab1ffdc679c1ab5de025d1487dc40 [219/361] KVM: x86/tdp_mmu=
: Ignore unsupported mmu operation on private GFNs
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
compiler: gcc-11 (Debian 11.2.0-20) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


includecheck warnings: (new ones prefixed by >>)
>> arch/x86/kvm/mmu/mmu_internal.h: mmu.h is included more than once.

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5227399492292153474==--

