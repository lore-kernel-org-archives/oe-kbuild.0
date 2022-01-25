Content-Type: multipart/mixed; boundary="===============5854584537520867125=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/power/supply/goldfish_battery.c:225:2-9: line 225 is redundant because platform_get_irq() already prints an error
Date: Wed, 26 Jan 2022 03:17:40 +0800
Message-ID: <202201260249.9xk92N9M-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5854584537520867125==
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
head:   a08b41ab9e2e468647f78eb17c28e29b93006394
commit: 570b7c0ea20c0156411394bc215114f7b1dc18ff power: supply: goldfish: R=
emove the GOLDFISH dependency
date:   10 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 10 months ago
config: x86_64-randconfig-c022-20220117 (https://download.01.org/0day-ci/ar=
chive/20220126/202201260249.9xk92N9M-lkp(a)intel.com/config)
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
--===============5854584537520867125==--

