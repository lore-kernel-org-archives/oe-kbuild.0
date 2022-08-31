Content-Type: multipart/mixed; boundary="===============7749347347091976046=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [arm-integrator:virt-to-pfn-v6.0-rc1 11/24] arch/arm64/include/asm/memory.h: asm-generic/memory_model.h is included more than once.
Date: Wed, 31 Aug 2022 16:26:17 +0800
Message-ID: <202208311629.N1huPzIe-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7749347347091976046==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Linus Walleij <linus.walleij@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integr=
ator.git virt-to-pfn-v6.0-rc1
head:   fd7709c9f1119794e96665ae423d79d93bfe43fc
commit: abccaa86889322e58b320ccc8bfc587c304e20fd [11/24] arm64: memory: Mak=
e virt_to_pfn() a static inline
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
compiler: gcc-11 (Debian 11.3.0-5) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

includecheck warnings: (new ones prefixed by >>)
>> arch/arm64/include/asm/memory.h: asm-generic/memory_model.h is included =
more than once.

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7749347347091976046==--

