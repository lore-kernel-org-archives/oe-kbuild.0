Content-Type: multipart/mixed; boundary="===============5586663508081591731=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/nios2/kernel/setup.c:152:6: warning: Unused variable: dram_start [unusedVariable]
Date: Sun, 11 Jul 2021 09:13:01 +0800
Message-ID: <202107110956.WXDUxcnr-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5586663508081591731==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Andreas Oetken <andreas.oetken@siemens.com>
CC: Ley Foon Tan <ley.foon.tan@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   1e16624d7b4376797ede36e3c955375cf0f23298
commit: 7f7bc20bc41a4fbcd2db75b375ac95e5faf958ae nios2: Don't use _end for =
calculating min_low_pfn
date:   5 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 5 months ago
compiler: nios2-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> arch/nios2/kernel/setup.c:152:6: warning: Unused variable: dram_start [u=
nusedVariable]
    int dram_start;
        ^
   arch/nios2/kernel/setup.c:131:6: warning: Uninitialized variable: cmdlin=
e_passed [uninitvar]
    if (cmdline_passed[0])
        ^

vim +152 arch/nios2/kernel/setup.c

7f7bc20bc41a4f Andreas Oetken 2021-02-19  149  =

27d22413e60009 Ley Foon Tan   2014-11-06  150  void __init setup_arch(char =
**cmdline_p)
27d22413e60009 Ley Foon Tan   2014-11-06  151  {
0042379279bcac Mike Rapoport  2018-10-26 @152  	int dram_start;

:::::: The code at line 152 was first introduced by commit
:::::: 0042379279bcac871d2a60172f942a3a255ec611 nios2: switch to NO_BOOTMEM

:::::: TO: Mike Rapoport <rppt@linux.vnet.ibm.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5586663508081591731==--

