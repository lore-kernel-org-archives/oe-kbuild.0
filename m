Content-Type: multipart/mixed; boundary="===============6738237503846804520=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/s390/kernel/nmi.c:109:26: warning: Parameter 'mcesad' can be declared with const [constParameter]
Date: Tue, 10 May 2022 01:03:52 +0800
Message-ID: <202205100114.R5SudXlz-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6738237503846804520==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Alexander Gordeev <agordeev@linux.ibm.com>
CC: Heiko Carstens <hca@linux.ibm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   9be9ed2612b5aedb52a2c240edb1630b6b743cb6
commit: c7ed509b21b6566990ff39a6744cd5e214b5dca9 s390/nmi: disable interrup=
ts on extended save area update
date:   5 months ago
:::::: branch date: 74 minutes ago
:::::: commit date: 5 months ago
compiler: s390-linux-gcc (GCC) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout c7ed509b21b6566990ff39a6744cd5e214b5dca9
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> arch/s390/pci/pci_clp.c:38:16: warning: Local variable 'rsp' shadows out=
er argument [shadowArgument]
     unsigned int rsp;
                  ^
   arch/s390/pci/pci_clp.c:35:46: note: Shadowed declaration
   static inline void zpci_err_clp(unsigned int rsp, int rc)
                                                ^
   arch/s390/pci/pci_clp.c:38:16: note: Shadow variable
     unsigned int rsp;
                  ^
>> arch/s390/pci/pci_clp.c:39:7: warning: Local variable 'rc' shadows outer=
 argument [shadowArgument]
     int rc;
         ^
   arch/s390/pci/pci_clp.c:35:55: note: Shadowed declaration
   static inline void zpci_err_clp(unsigned int rsp, int rc)
                                                         ^
   arch/s390/pci/pci_clp.c:39:7: note: Shadow variable
     int rc;
         ^
--
>> arch/s390/kernel/nmi.c:109:26: warning: Parameter 'mcesad' can be declar=
ed with const [constParameter]
   void nmi_free_mcesa(u64 *mcesad)
                            ^

vim +/mcesad +109 arch/s390/kernel/nmi.c

6c81511ca1f52a arch/s390/kernel/nmi.c  Martin Schwidefsky 2017-10-12  108  =

c7ed509b21b656 arch/s390/kernel/nmi.c  Alexander Gordeev  2021-12-10 @109  =
void nmi_free_mcesa(u64 *mcesad)
6c81511ca1f52a arch/s390/kernel/nmi.c  Martin Schwidefsky 2017-10-12  110  {
6c81511ca1f52a arch/s390/kernel/nmi.c  Martin Schwidefsky 2017-10-12  111  =
	if (!nmi_needs_mcesa())
6c81511ca1f52a arch/s390/kernel/nmi.c  Martin Schwidefsky 2017-10-12  112  =
		return;
c7ed509b21b656 arch/s390/kernel/nmi.c  Alexander Gordeev  2021-12-10  113  =
	kmem_cache_free(mcesa_cache, __va(*mcesad & MCESA_ORIGIN_MASK));
6c81511ca1f52a arch/s390/kernel/nmi.c  Martin Schwidefsky 2017-10-12  114  }
77fa22450de00d drivers/s390/s390mach.c Heiko Carstens     2005-06-25  115  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6738237503846804520==--

