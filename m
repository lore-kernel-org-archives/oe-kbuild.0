Content-Type: multipart/mixed; boundary="===============3410049678135319890=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [powerpc:next-test 113/124] arch/powerpc/kernel/interrupt_64.S: asm/head-64.h is included more than once.
Date: Wed, 16 Jun 2021 01:25:37 +0800
Message-ID: <202106160108.Tj6zq6Cm-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3410049678135319890==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linuxppc-dev(a)lists.ozlabs.org
TO: Nicholas Piggin <npiggin@gmail.com>
CC: Michael Ellerman <mpe@ellerman.id.au>
CC: Benjamin Herrenschmidt <benh@kernel.crashing.org>
CC: Paul Mackerras <paulus@samba.org>
CC: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
CC: Sandipan Das <sandipan@linux.ibm.com>
CC: Palmer Dabbelt <palmerdabbelt@google.com>
CC: Christophe Leroy <christophe.leroy@csgroup.eu>
CC: linuxppc-dev(a)lists.ozlabs.org
CC: linux-kernel(a)vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git n=
ext-test
head:   103bf32b0d2dd8b8a4d3d9ebdded5ba4e8263e6a
commit: 5592c877d21b6ca201aafca349663c5a41f134f0 [113/124] powerpc/64: move=
 interrupt return asm to interrupt_64.S
:::::: branch date: 3 hours ago
:::::: commit date: 3 hours ago
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


includecheck warnings: (new ones prefixed by >>)
>> arch/powerpc/kernel/interrupt_64.S: asm/head-64.h is included more than =
once.

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3410049678135319890==--

