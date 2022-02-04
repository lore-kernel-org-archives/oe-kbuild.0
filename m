Content-Type: multipart/mixed; boundary="===============1831887152978885057=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/mfd/arizona-irq.c:374:7-27: WARNING: Threaded IRQ with no primary handler requested without IRQF_ONESHOT (unless it is nested IRQ)
Date: Fri, 04 Feb 2022 19:52:43 +0800
Message-ID: <202202041928.A0VF4zkK-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1831887152978885057==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Krzysztof Kozlowski <krzk@kernel.org>
CC: Julia Lawall <Julia.Lawall@inria.fr>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   dcb85f85fa6f142aae1fe86f399d4503d49f2b60
commit: 5d2db9bb5f8a850d037983f0df72ad59cefa9e3d coccinelle: irqf_oneshot: =
reduce the severity due to false positives
date:   9 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 9 months ago
config: x86_64-randconfig-c002 (https://download.01.org/0day-ci/archive/202=
20204/202202041928.A0VF4zkK-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/mfd/arizona-irq.c:374:7-27: WARNING: Threaded IRQ with no primar=
y handler requested without IRQF_ONESHOT (unless it is nested IRQ)
--
>> drivers/platform/surface/surface_hotplug.c:180:10-35: WARNING: Threaded =
IRQ with no primary handler requested without IRQF_ONESHOT (unless it is ne=
sted IRQ)

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1831887152978885057==--

