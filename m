Content-Type: multipart/mixed; boundary="===============4016888718992276107=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/mfd/arizona-irq.c:374:7-27: WARNING: Threaded IRQ with no primary handler requested without IRQF_ONESHOT (unless it is nested IRQ)
Date: Sat, 23 Apr 2022 23:37:59 +0800
Message-ID: <202204232333.3Mi2fbcA-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4016888718992276107==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Krzysztof Kozlowski <krzk@kernel.org>
CC: Julia Lawall <Julia.Lawall@inria.fr>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   c00c5e1d157bec0ef0b0b59aa5482eb8dc7e8e49
commit: 5d2db9bb5f8a850d037983f0df72ad59cefa9e3d coccinelle: irqf_oneshot: =
reduce the severity due to false positives
date:   12 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 12 months ago
config: x86_64-randconfig-c022 (https://download.01.org/0day-ci/archive/202=
20423/202204232333.3Mi2fbcA-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-20) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/mfd/arizona-irq.c:374:7-27: WARNING: Threaded IRQ with no primar=
y handler requested without IRQF_ONESHOT (unless it is nested IRQ)
--
>> drivers/power/supply/max17042_battery.c:1116:8-33: WARNING: Threaded IRQ=
 with no primary handler requested without IRQF_ONESHOT (unless it is neste=
d IRQ)
--
>> drivers/regulator/mt6360-regulator.c:386:8-33: WARNING: Threaded IRQ wit=
h no primary handler requested without IRQF_ONESHOT (unless it is nested IR=
Q)
--
>> drivers/regulator/pca9450-regulator.c:781:7-32: WARNING: Threaded IRQ wi=
th no primary handler requested without IRQF_ONESHOT (unless it is nested I=
RQ)
--
>> drivers/pinctrl/pinctrl-mcp23s08.c:513:7-32: WARNING: Threaded IRQ with =
no primary handler requested without IRQF_ONESHOT (unless it is nested IRQ)
--
>> drivers/regulator/slg51000-regulator.c:480:8-33: WARNING: Threaded IRQ w=
ith no primary handler requested without IRQF_ONESHOT (unless it is nested =
IRQ)
--
>> drivers/mfd/wm8994-irq.c:232:8-28: WARNING: Threaded IRQ with no primary=
 handler requested without IRQF_ONESHOT (unless it is nested IRQ)

Please review and possibly fold the followup patch.

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4016888718992276107==--

