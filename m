Content-Type: multipart/mixed; boundary="===============2880426747680364080=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [esmil:visionfive 28/62] drivers/char/hw_random/starfive-vic-rng.c:209:2-9: line 209 is redundant because platform_get_irq() already prints an error
Date: Thu, 31 Mar 2022 14:21:02 +0800
Message-ID: <202203311416.FRqOJZon-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2880426747680364080==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Huan Feng <huan.feng@starfivetech.com>
CC: Emil Renner Berthing <kernel@esmil.dk>

tree:   https://github.com/esmil/linux visionfive
head:   6c7cd35771680c033c40b4af48cbe7e3093eab3d
commit: 1d3f42fdd786e76c5138aff9663180a7f17c68bd [28/62] drivers/hw_random:=
 Add StarFive JH7100 Random Number Generator driver
:::::: branch date: 14 hours ago
:::::: commit date: 9 days ago
config: nios2-randconfig-c003-20220331 (https://download.01.org/0day-ci/arc=
hive/20220331/202203311416.FRqOJZon-lkp(a)intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/char/hw_random/starfive-vic-rng.c:209:2-9: line 209 is redundant=
 because platform_get_irq() already prints an error

Please review and possibly fold the followup patch.

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2880426747680364080==--

