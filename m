Content-Type: multipart/mixed; boundary="===============4776844800617785996=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [esmil:visionfive 28/64] drivers/char/hw_random/starfive-vic-rng.c:209:2-9: line 209 is redundant because platform_get_irq() already prints an error
Date: Thu, 10 Mar 2022 23:22:47 +0800
Message-ID: <202203102320.uRLz7hUG-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4776844800617785996==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Huan Feng <huan.feng@starfivetech.com>
CC: Emil Renner Berthing <kernel@esmil.dk>

tree:   https://github.com/esmil/linux visionfive
head:   996f88ea65b2f557926d7fe73d69fdc2da92430a
commit: 43592cbfb311e82075d50641a6359ed6c0a28ea1 [28/64] drivers/hw_random:=
 Add StarFive JH7100 Random Number Generator driver
:::::: branch date: 19 hours ago
:::::: commit date: 4 days ago
config: sparc64-randconfig-c024-20220310 (https://download.01.org/0day-ci/a=
rchive/20220310/202203102320.uRLz7hUG-lkp(a)intel.com/config)
compiler: sparc64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/char/hw_random/starfive-vic-rng.c:209:2-9: line 209 is redundant=
 because platform_get_irq() already prints an error

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4776844800617785996==--

