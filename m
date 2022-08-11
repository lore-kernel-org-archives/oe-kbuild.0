Content-Type: multipart/mixed; boundary="===============9092886491028359735=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [intel-tdx:kvm-upstream-workaround 622/846] arch/x86/kvm/vmx/tdx.c: mmu.h is included more than once.
Date: Thu, 11 Aug 2022 09:07:07 +0800
Message-ID: <202208110902.BNgzZ13m-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============9092886491028359735==
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
head:   6e62680f6e4094d3986229a4145ebd54390dc110
commit: b1cd412bd4c1a68ae5ef4a34068aad1328f97bdc [622/846] KVM: TDX: TDP MM=
U TDX support
:::::: branch date: 34 hours ago
:::::: commit date: 34 hours ago
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

includecheck warnings: (new ones prefixed by >>)
>> arch/x86/kvm/vmx/tdx.c: mmu.h is included more than once.

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============9092886491028359735==--

