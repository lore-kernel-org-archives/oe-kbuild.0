Content-Type: multipart/mixed; boundary="===============8210552935669872768=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/power/supply/goldfish_battery.c:225:2-9: line 225 is redundant because platform_get_irq() already prints an error
Date: Tue, 08 Feb 2022 22:27:59 +0800
Message-ID: <202202082202.xd3nJtkk-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8210552935669872768==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Roman Kiryanov <rkir@google.com>
CC: Sebastian Reichel <sre@kernel.org>

Hi Roman,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   555f3d7be91a873114c9656069f1a9fa476ec41a
commit: 570b7c0ea20c0156411394bc215114f7b1dc18ff power: supply: goldfish: R=
emove the GOLDFISH dependency
date:   10 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 10 months ago
config: x86_64-randconfig-c022-20220117 (https://download.01.org/0day-ci/ar=
chive/20220208/202202082202.xd3nJtkk-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/power/supply/goldfish_battery.c:225:2-9: line 225 is redundant b=
ecause platform_get_irq() already prints an error

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8210552935669872768==--

