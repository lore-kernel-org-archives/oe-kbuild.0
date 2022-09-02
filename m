Content-Type: multipart/mixed; boundary="===============8710778324954092754=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [arm-integrator:virt-to-pfn-v6.0-rc1 15/24] arch/hexagon/include/asm/page.h: asm/mem-layout.h is included more than once.
Date: Sat, 03 Sep 2022 06:40:38 +0800
Message-ID: <202209030657.suwczn4n-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8710778324954092754==
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
commit: d84271d8be074ced1466e090698fe9a40bed2351 [15/24] Hexagon: Make pfn =
accessors statics inlines
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
compiler: gcc-11 (Debian 11.3.0-5) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

includecheck warnings: (new ones prefixed by >>)
>> arch/hexagon/include/asm/page.h: asm/mem-layout.h is included more than =
once.

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8710778324954092754==--

