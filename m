Content-Type: multipart/mixed; boundary="===============4214391973962854421=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [intel-tdx:kvm-upstream-workaround 79/308] arch/x86/kvm/vmx/tdx.c: mmu.h is included more than once.
Date: Fri, 19 Aug 2022 10:26:15 +0800
Message-ID: <202208191030.i4GEbwAP-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4214391973962854421==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Isaku Yamahata <isaku.yamahata@intel.com>

tree:   https://github.com/intel/tdx.git kvm-upstream-workaround
head:   85c097fdd1667a842a9e75d8f658fc16bd72981a
commit: 89a0c6fa8cdaabd8a401b43f3b1f4c9014ec76b0 [79/308] KVM: TDX: TDP MMU=
 TDX support
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
compiler: gcc-11 (Debian 11.3.0-5) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

includecheck warnings: (new ones prefixed by >>)
>> arch/x86/kvm/vmx/tdx.c: mmu.h is included more than once.

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4214391973962854421==--

