Content-Type: multipart/mixed; boundary="===============7370977245992631744=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [arm-integrator:kernel-in-vmalloc-v5.19-rc1 21/35] arch/hexagon/include/asm/page.h: asm/mem-layout.h is included more than once.
Date: Wed, 06 Jul 2022 19:44:56 +0800
Message-ID: <202207061920.z89bMMgl-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7370977245992631744==
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
ator.git kernel-in-vmalloc-v5.19-rc1
head:   144435741b0a6f31403d3084103678da3b4f9d11
commit: 5f1754f29aba0e4910d757ab7c318abc9d22b66b [21/35] Hexagon: Make virt=
_to_pfn() a static inline
:::::: branch date: 2 days ago
:::::: commit date: 6 days ago
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


includecheck warnings: (new ones prefixed by >>)
>> arch/hexagon/include/asm/page.h: asm/mem-layout.h is included more than =
once.

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7370977245992631744==--

