Content-Type: multipart/mixed; boundary="===============2843774272728079070=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [tip:x86/urgent 4/5] Warning: Kernel ABI header at 'tools/arch/x86/include/asm/disabled-features.h' differs from latest version at 'arch/x86/include/asm/disabled-features.h': 59< #ifdef CONFIG_IOMMU_SUPPORT
Date: Thu, 03 Jun 2021 05:16:06 +0800
Message-ID: <202106030503.rZ2TiJST-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2843774272728079070==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
CC: x86(a)kernel.org
TO: Thomas Gleixner <tglx@linutronix.de>
CC: Borislav Petkov <bp@suse.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/urg=
ent
head:   f01775b09efa3b9d1f4a2519678f11d274362da9
commit: 6867ee8bcb754c59a8304f4a9d693ed6cfb96b31 [4/5] x86/cpufeatures: For=
ce disable X86_FEATURE_ENQCMD and remove update_pasid()
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce:
cd tools/perf && ./check-headers.sh

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


perfheadercheck warnings: (new ones prefixed by >>)
>> Warning: Kernel ABI header at 'tools/arch/x86/include/asm/disabled-featu=
res.h' differs from latest version at 'arch/x86/include/asm/disabled-featur=
es.h':   59< #ifdef CONFIG_IOMMU_SUPPORT
>> Warning: Kernel ABI header at 'tools/arch/x86/include/asm/disabled-featu=
res.h' differs from latest version at 'arch/x86/include/asm/disabled-featur=
es.h':   60< # define DISABLE_ENQCMD	0
   Warning: Kernel ABI header at 'tools/arch/x86/include/asm/disabled-featu=
res.h' differs from latest version@'arch/x86/include/asm/disabled-featur=
es.h':   61< #else
>> Warning: Kernel ABI header at 'tools/arch/x86/include/asm/disabled-featu=
res.h' differs from latest version at 'arch/x86/include/asm/disabled-featur=
es.h':   62< # define DISABLE_ENQCMD (1 << (X86_FEATURE_ENQCMD & 31))
   Warning: Kernel ABI header at 'tools/arch/x86/include/asm/disabled-featu=
res.h' differs from latest version@'arch/x86/include/asm/disabled-featur=
es.h':   63< #endif
>> Warning: Kernel ABI header at 'tools/arch/x86/include/asm/disabled-featu=
res.h' differs from latest version at 'arch/x86/include/asm/disabled-featur=
es.h':   59> /* Force disable because it's broken beyond repair */
   Warning: Kernel ABI header at 'tools/arch/x86/include/asm/disabled-featu=
res.h' differs from latest version at 'arch/x86/include/asm/disabled-featur=
es.h':   60> #define DISABLE_ENQCMD		(1 << (X86_FEATURE_ENQCMD & 31))

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============2843774272728079070==--

