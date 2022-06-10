Content-Type: multipart/mixed; boundary="===============4230782967389543792=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [esmil:visionfive 21/54] drivers/char/hw_random/starfive-vic-rng.c:209:2-9: line 209 is redundant because platform_get_irq() already prints an error
Date: Fri, 10 Jun 2022 21:57:18 +0800
Message-ID: <202206102133.rJwlnZLS-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4230782967389543792==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Huan Feng <huan.feng@starfivetech.com>
CC: Emil Renner Berthing <kernel@esmil.dk>

tree:   https://github.com/esmil/linux visionfive
head:   906be7ef2fb9e2f1fcb740d3d506768cddfc52ca
commit: b422a122c72a7448306ad60808c748d57b98da71 [21/54] drivers/hw_random:=
 Add StarFive JH7100 Random Number Generator driver
:::::: branch date: 3 days ago
:::::: commit date: 4 days ago
config: riscv-randconfig-c004-20220609 (https://download.01.org/0day-ci/arc=
hive/20220610/202206102133.rJwlnZLS-lkp(a)intel.com/config)
compiler: riscv32-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/char/hw_random/starfive-vic-rng.c:209:2-9: line 209 is redundant=
 because platform_get_irq() already prints an error

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4230782967389543792==--

