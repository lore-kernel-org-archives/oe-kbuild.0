Content-Type: multipart/mixed; boundary="===============5966590179917622523=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [arm-integrator:kernel-in-vmalloc-v5.18-rc1 22/34] arch/hexagon/include/asm/page.h: asm/mem-layout.h is included more than once.
Date: Mon, 06 Jun 2022 21:27:16 +0800
Message-ID: <202206062117.GDGQ0S1P-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5966590179917622523==
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
commit: f295aaedbbb34a1689fef3a68dd052120d1feea6 [22/34] Hexagon: Make virt=
_to_pfn() a static inline
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
compiler: gcc-11 (Debian 11.3.0-1) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


includecheck warnings: (new ones prefixed by >>)
>> arch/hexagon/include/asm/page.h: asm/mem-layout.h is included more than =
once.

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5966590179917622523==--

