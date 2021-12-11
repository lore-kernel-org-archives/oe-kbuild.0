Content-Type: multipart/mixed; boundary="===============2322137007381035693=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/mfd/arizona-irq.c:374:7-27: WARNING: Threaded IRQ with no primary handler requested without IRQF_ONESHOT (unless it is nested IRQ)
Date: Sun, 12 Dec 2021 02:19:08 +0800
Message-ID: <202112120209.RVlfdLX3-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2322137007381035693==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Krzysztof Kozlowski <krzk@kernel.org>
CC: Julia Lawall <Julia.Lawall@inria.fr>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   6f513529296fd4f696afb4354c46508abe646541
commit: 5d2db9bb5f8a850d037983f0df72ad59cefa9e3d coccinelle: irqf_oneshot: =
reduce the severity due to false positives
date:   7 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 7 months ago
config: x86_64-randconfig-c022-20211210 (https://download.01.org/0day-ci/ar=
chive/20211212/202112120209.RVlfdLX3-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

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
>> drivers/regulator/pca9450-regulator.c:781:7-32: WARNING: Threaded IRQ wi=
th no primary handler requested without IRQF_ONESHOT (unless it is nested I=
RQ)
--
>> drivers/rtc/rtc-max8997.c:495:7-32: WARNING: Threaded IRQ with no primar=
y handler requested without IRQF_ONESHOT (unless it is nested IRQ)
--
>> drivers/gpu/drm/i2c/tda998x_drv.c:1916:8-28: WARNING: Threaded IRQ with =
no primary handler requested without IRQF_ONESHOT (unless it is nested IRQ)
--
>> drivers/mfd/wm8350-irq.c:527:7-27: WARNING: Threaded IRQ with no primary=
 handler requested without IRQF_ONESHOT (unless it is nested IRQ)

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2322137007381035693==--

