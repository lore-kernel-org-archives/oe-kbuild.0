Content-Type: multipart/mixed; boundary="===============6327928164345676004=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/staging/wfx/bus_sdio.c:133:8-33: WARNING: Threaded IRQ with no primary handler requested without IRQF_ONESHOT (unless it is nested IRQ)
Date: Tue, 25 Jan 2022 21:10:55 +0800
Message-ID: <202201252158.U4FizUGp-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6327928164345676004==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Krzysztof Kozlowski <krzk@kernel.org>
CC: Julia Lawall <Julia.Lawall@inria.fr>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   a08b41ab9e2e468647f78eb17c28e29b93006394
commit: 5d2db9bb5f8a850d037983f0df72ad59cefa9e3d coccinelle: irqf_oneshot: =
reduce the severity due to false positives
date:   9 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 9 months ago
config: x86_64-randconfig-c002-20220124 (https://download.01.org/0day-ci/ar=
chive/20220125/202201252158.U4FizUGp-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/staging/wfx/bus_sdio.c:133:8-33: WARNING: Threaded IRQ with no p=
rimary handler requested without IRQF_ONESHOT (unless it is nested IRQ)
--
>> drivers/mfd/htc-i2cpld.c:546:8-28: WARNING: Threaded IRQ with no primary=
 handler requested without IRQF_ONESHOT (unless it is nested IRQ)
--
>> drivers/rtc/rtc-max77686.c:779:7-27: WARNING: Threaded IRQ with no prima=
ry handler requested without IRQF_ONESHOT (unless it is nested IRQ)
--
>> drivers/rtc/rtc-max8997.c:495:7-32: WARNING: Threaded IRQ with no primar=
y handler requested without IRQF_ONESHOT (unless it is nested IRQ)

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6327928164345676004==--

