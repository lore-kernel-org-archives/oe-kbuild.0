Content-Type: multipart/mixed; boundary="===============4794468851548801494=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [arm:cex7 143/148] drivers/net/phy/qsfp.c:1750:8-33: WARNING: Threaded IRQ with no primary handler requested without IRQF_ONESHOT (unless it is nested IRQ)
Date: Fri, 08 Apr 2022 11:12:49 +0800
Message-ID: <202204081109.2CqiF4YR-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4794468851548801494==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-arm-kernel(a)lists.infradead.org
TO: Russell King <rmk+kernel@armlinux.org.uk>

tree:   git://git.armlinux.org.uk/~rmk/linux-arm.git cex7
head:   d4b5e6687e034b7408f75fcbeccda90fd424b853
commit: 15b70689e8853e6983ab01bad883aca045d7b4ae [143/148] net: add qsfp su=
pport                              [*experimental*]
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: microblaze-randconfig-c024-20220408 (https://download.01.org/0day-c=
i/archive/20220408/202204081109.2CqiF4YR-lkp(a)intel.com/config)
compiler: microblaze-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/net/phy/qsfp.c:1750:8-33: WARNING: Threaded IRQ with no primary =
handler requested without IRQF_ONESHOT (unless it is nested IRQ)

Please review and possibly fold the followup patch.

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4794468851548801494==--

