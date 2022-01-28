Content-Type: multipart/mixed; boundary="===============6047600847811117246=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/input/misc/ad714x.c:1153:9-34: WARNING: Threaded IRQ with no primary handler requested without IRQF_ONESHOT (unless it is nested IRQ)
Date: Sat, 29 Jan 2022 05:55:00 +0800
Message-ID: <202201290510.zLzohE2x-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6047600847811117246==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Krzysztof Kozlowski <krzk@kernel.org>
CC: Julia Lawall <Julia.Lawall@inria.fr>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   169387e2aa291a4e3cb856053730fe99d6cec06f
commit: 5d2db9bb5f8a850d037983f0df72ad59cefa9e3d coccinelle: irqf_oneshot: =
reduce the severity due to false positives
date:   9 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 9 months ago
config: x86_64-randconfig-c024-20220124 (https://download.01.org/0day-ci/ar=
chive/20220129/202201290510.zLzohE2x-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/input/misc/ad714x.c:1153:9-34: WARNING: Threaded IRQ with no pri=
mary handler requested without IRQF_ONESHOT (unless it is nested IRQ)
--
>> drivers/extcon/extcon-max77843.c:907:8-33: WARNING: Threaded IRQ with no=
 primary handler requested without IRQF_ONESHOT (unless it is nested IRQ)
--
>> drivers/mfd/wm8350-irq.c:527:7-27: WARNING: Threaded IRQ with no primary=
 handler requested without IRQF_ONESHOT (unless it is nested IRQ)

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6047600847811117246==--

