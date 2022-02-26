Content-Type: multipart/mixed; boundary="===============6273729810350181203=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/w1/slaves/w1_therm.c:1452:18-19: WARNING opportunity for max()
Date: Sat, 26 Feb 2022 20:02:10 +0800
Message-ID: <202202261914.RRt3jpY2-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6273729810350181203==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Denis Efremov <efremov@linux.com>
CC: Julia Lawall <Julia.Lawall@inria.fr>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   9137eda53752ef73148e42b0d7640a00f1bc96b1
commit: 5f66f73b9ff4dcabd4e2405ba9c32e80e02f9408 coccinelle: misc: add minm=
ax script
date:   10 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 10 months ago
config: i386-randconfig-c001 (https://download.01.org/0day-ci/archive/20220=
226/202202261914.RRt3jpY2-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/w1/slaves/w1_therm.c:1452:18-19: WARNING opportunity for max()

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6273729810350181203==--

