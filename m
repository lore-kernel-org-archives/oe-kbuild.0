Content-Type: multipart/mixed; boundary="===============7587896171721423210=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [arm-integrator:kernel-in-vmalloc-v5.18-rc1 26/34] arch/mips/include/asm/page.h: asm/io.h is included more than once.
Date: Tue, 07 Jun 2022 08:04:58 +0800
Message-ID: <202206070754.4xoqt9p4-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7587896171721423210==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Linus Walleij <linus.walleij@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integr=
ator.git kernel-in-vmalloc-v5.18-rc1
head:   1aafd4ba7b78b4ac0013a48a35252654852cb7ab
commit: 528ddc725d2f4c648357c9323487fb3f9a639cb6 [26/34] MIPS: Make virt_to=
_pfn() a static inline
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
compiler: gcc-11 (Debian 11.3.0-1) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


includecheck warnings: (new ones prefixed by >>)
>> arch/mips/include/asm/page.h: asm/io.h is included more than once.

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7587896171721423210==--

