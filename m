Content-Type: multipart/mixed; boundary="===============8216334080298427166=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/input/misc/ad714x.c:1153:9-34: WARNING: Threaded IRQ with no primary handler requested without IRQF_ONESHOT (unless it is nested IRQ)
Date: Sun, 12 Dec 2021 13:36:17 +0800
Message-ID: <202112121307.UKYwoeFT-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8216334080298427166==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Krzysztof Kozlowski <krzk@kernel.org>
CC: Julia Lawall <Julia.Lawall@inria.fr>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   a763d5a5abd65797aec3dd1bf01fe2ccbec32967
commit: 5d2db9bb5f8a850d037983f0df72ad59cefa9e3d coccinelle: irqf_oneshot: =
reduce the severity due to false positives
date:   7 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 7 months ago
config: x86_64-randconfig-c003-20211210 (https://download.01.org/0day-ci/ar=
chive/20211212/202112121307.UKYwoeFT-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/input/misc/ad714x.c:1153:9-34: WARNING: Threaded IRQ with no pri=
mary handler requested without IRQF_ONESHOT (unless it is nested IRQ)
--
>> drivers/extcon/extcon-max8997.c:665:8-28: WARNING: Threaded IRQ with no =
primary handler requested without IRQF_ONESHOT (unless it is nested IRQ)
--
>> drivers/regulator/qcom-labibb-regulator.c:364:8-33: WARNING: Threaded IR=
Q with no primary handler requested without IRQF_ONESHOT (unless it is nest=
ed IRQ)
--
>> drivers/regulator/slg51000-regulator.c:480:8-33: WARNING: Threaded IRQ w=
ith no primary handler requested without IRQF_ONESHOT (unless it is nested =
IRQ)
--
>> drivers/input/keyboard/twl4030_keypad.c:413:9-34: WARNING: Threaded IRQ =
with no primary handler requested without IRQF_ONESHOT (unless it is nested=
 IRQ)

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8216334080298427166==--

