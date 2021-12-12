Content-Type: multipart/mixed; boundary="===============4267065647331006442=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/platform/surface/aggregator/controller.c:2499:10-30: WARNING: Threaded IRQ with no primary handler requested without IRQF_ONESHOT (unless it is nested IRQ)
Date: Sun, 12 Dec 2021 13:15:14 +0800
Message-ID: <202112121333.cY0yDRem-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4267065647331006442==
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
config: x86_64-randconfig-c002-20211210 (https://download.01.org/0day-ci/ar=
chive/20211212/202112121333.cY0yDRem-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/platform/surface/aggregator/controller.c:2499:10-30: WARNING: Th=
readed IRQ with no primary handler requested without IRQF_ONESHOT (unless i=
t is nested IRQ)
--
>> drivers/extcon/extcon-max14577.c:699:8-33: WARNING: Threaded IRQ with no=
 primary handler requested without IRQF_ONESHOT (unless it is nested IRQ)
--
>> drivers/extcon/extcon-max77843.c:907:8-33: WARNING: Threaded IRQ with no=
 primary handler requested without IRQF_ONESHOT (unless it is nested IRQ)
--
>> drivers/usb/phy/phy-generic.c:300:8-33: WARNING: Threaded IRQ with no pr=
imary handler requested without IRQF_ONESHOT (unless it is nested IRQ)

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4267065647331006442==--

