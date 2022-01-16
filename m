Content-Type: multipart/mixed; boundary="===============6080427693769385737=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/mfd/arizona-irq.c:374:7-27: WARNING: Threaded IRQ with no primary handler requested without IRQF_ONESHOT (unless it is nested IRQ)
Date: Sun, 16 Jan 2022 19:42:14 +0800
Message-ID: <202201161925.6QTzwT86-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6080427693769385737==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Krzysztof Kozlowski <krzk@kernel.org>
CC: Julia Lawall <Julia.Lawall@inria.fr>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   4d66020dcef83314092f2c8c89152a8d122627e2
commit: 5d2db9bb5f8a850d037983f0df72ad59cefa9e3d coccinelle: irqf_oneshot: =
reduce the severity due to false positives
date:   9 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 9 months ago
config: x86_64-randconfig-c002 (https://download.01.org/0day-ci/archive/202=
20116/202201161925.6QTzwT86-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/mfd/arizona-irq.c:374:7-27: WARNING: Threaded IRQ with no primar=
y handler requested without IRQF_ONESHOT (unless it is nested IRQ)
--
>> drivers/extcon/extcon-max14577.c:699:8-33: WARNING: Threaded IRQ with no=
 primary handler requested without IRQF_ONESHOT (unless it is nested IRQ)
--
>> drivers/regulator/mt6360-regulator.c:386:8-33: WARNING: Threaded IRQ wit=
h no primary handler requested without IRQF_ONESHOT (unless it is nested IR=
Q)
--
>> drivers/regulator/pca9450-regulator.c:781:7-32: WARNING: Threaded IRQ wi=
th no primary handler requested without IRQF_ONESHOT (unless it is nested I=
RQ)
--
>> drivers/regulator/slg51000-regulator.c:480:8-33: WARNING: Threaded IRQ w=
ith no primary handler requested without IRQF_ONESHOT (unless it is nested =
IRQ)
--
>> drivers/platform/surface/surface_hotplug.c:180:10-35: WARNING: Threaded =
IRQ with no primary handler requested without IRQF_ONESHOT (unless it is ne=
sted IRQ)
--
>> drivers/gpu/drm/i2c/tda998x_drv.c:1916:8-28: WARNING: Threaded IRQ with =
no primary handler requested without IRQF_ONESHOT (unless it is nested IRQ)
--
>> drivers/mfd/wm8994-irq.c:232:8-28: WARNING: Threaded IRQ with no primary=
 handler requested without IRQF_ONESHOT (unless it is nested IRQ)

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6080427693769385737==--

