Content-Type: multipart/mixed; boundary="===============0204653614993260664=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [kvm:kvm-tdx-5.17 4/141] arch/x86/include/asm/tdx.h: linux/bits.h is included more than once.
Date: Sun, 17 Apr 2022 06:55:52 +0800
Message-ID: <202204170648.GAsiSATl-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0204653614993260664==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: kvm(a)vger.kernel.org
CC: Robert Hu <robert.hu@intel.com>
CC: Farrah Chen <farrah.chen@intel.com>
CC: Danmei Wei <danmei.wei@intel.com>
TO: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.co=
m>
CC: Paolo Bonzini <pbonzini@redhat.com>
CC: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
CC: Dave Hansen <dave.hansen@linux.intel.com>
CC: Tony Luck <tony.luck@intel.com>
CC: Thomas Gleixner <tglx@linutronix.de>
CC: Borislav Petkov <bp@suse.de>

tree:   https://git.kernel.org/pub/scm/virt/kvm/kvm.git kvm-tdx-5.17
head:   a50e4531e92e36f185ea32843c149c4703451109
commit: f9cb93339a222960add97c5203b2a1852cdd12ea [4/141] x86/tdx: Add __tdx=
_module_call() helper functions
:::::: branch date: 30 hours ago
:::::: commit date: 30 hours ago
compiler: gcc-11 (Debian 11.2.0-19) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


includecheck warnings: (new ones prefixed by >>)
>> arch/x86/include/asm/tdx.h: linux/bits.h is included more than once.

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0204653614993260664==--

