Content-Type: multipart/mixed; boundary="===============7529325664103051413=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/input/touchscreen/cyttsp4_core.c:2093:6-26: WARNING: Threaded IRQ with no primary handler requested without IRQF_ONESHOT (unless it is nested IRQ)
Date: Thu, 20 Jan 2022 05:24:27 +0800
Message-ID: <202201200516.w0lBynSC-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7529325664103051413==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Krzysztof Kozlowski <krzk@kernel.org>
CC: Julia Lawall <Julia.Lawall@inria.fr>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   1d1df41c5a33359a00e919d54eaebfb789711fdc
commit: 5d2db9bb5f8a850d037983f0df72ad59cefa9e3d coccinelle: irqf_oneshot: =
reduce the severity due to false positives
date:   9 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 9 months ago
config: x86_64-randconfig-c022-20220117 (https://download.01.org/0day-ci/ar=
chive/20220120/202201200516.w0lBynSC-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/input/touchscreen/cyttsp4_core.c:2093:6-26: WARNING: Threaded IR=
Q with no primary handler requested without IRQF_ONESHOT (unless it is nest=
ed IRQ)
--
>> drivers/input/touchscreen/edt-ft5x06.c:1220:9-34: WARNING: Threaded IRQ =
with no primary handler requested without IRQF_ONESHOT (unless it is nested=
 IRQ)
--
>> drivers/extcon/extcon-max8997.c:665:8-28: WARNING: Threaded IRQ with no =
primary handler requested without IRQF_ONESHOT (unless it is nested IRQ)
--
>> drivers/power/supply/max17042_battery.c:1116:8-33: WARNING: Threaded IRQ=
 with no primary handler requested without IRQF_ONESHOT (unless it is neste=
d IRQ)
--
>> drivers/regulator/pca9450-regulator.c:781:7-32: WARNING: Threaded IRQ wi=
th no primary handler requested without IRQF_ONESHOT (unless it is nested I=
RQ)
--
>> drivers/usb/phy/phy-generic.c:300:8-33: WARNING: Threaded IRQ with no pr=
imary handler requested without IRQF_ONESHOT (unless it is nested IRQ)
--
>> drivers/regulator/qcom-labibb-regulator.c:364:8-33: WARNING: Threaded IR=
Q with no primary handler requested without IRQF_ONESHOT (unless it is nest=
ed IRQ)
--
>> drivers/rtc/rtc-max8998.c:283:7-32: WARNING: Threaded IRQ with no primar=
y handler requested without IRQF_ONESHOT (unless it is nested IRQ)
--
>> drivers/rtc/rtc-rk808.c:441:7-32: WARNING: Threaded IRQ with no primary =
handler requested without IRQF_ONESHOT (unless it is nested IRQ)
--
>> drivers/rtc/rtc-s5m.c:810:7-32: WARNING: Threaded IRQ with no primary ha=
ndler requested without IRQF_ONESHOT (unless it is nested IRQ)
--
>> drivers/rtc/rtc-tps65910.c:414:7-32: WARNING: Threaded IRQ with no prima=
ry handler requested without IRQF_ONESHOT (unless it is nested IRQ)
--
>> drivers/usb/common/usb-conn-gpio.c:229:8-33: WARNING: Threaded IRQ with =
no primary handler requested without IRQF_ONESHOT (unless it is nested IRQ)
   drivers/usb/common/usb-conn-gpio.c:246:8-33: WARNING: Threaded IRQ with =
no primary handler requested without IRQF_ONESHOT (unless it is nested IRQ)
--
>> drivers/mfd/wm8994-irq.c:232:8-28: WARNING: Threaded IRQ with no primary=
 handler requested without IRQF_ONESHOT (unless it is nested IRQ)

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7529325664103051413==--

