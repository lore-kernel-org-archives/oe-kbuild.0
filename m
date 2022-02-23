Content-Type: multipart/mixed; boundary="===============5788610649783358794=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: kernel/irq/affinity.c:399:12-13: WARNING opportunity for min()
Date: Wed, 23 Feb 2022 21:09:07 +0800
Message-ID: <202202232117.F13tHPz0-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5788610649783358794==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Denis Efremov <efremov@linux.com>
CC: Julia Lawall <Julia.Lawall@inria.fr>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   5c1ee569660d4a205dced9cb4d0306b907fb7599
commit: 5f66f73b9ff4dcabd4e2405ba9c32e80e02f9408 coccinelle: misc: add minm=
ax script
date:   10 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 10 months ago
config: x86_64-randconfig-c002-20220221 (https://download.01.org/0day-ci/ar=
chive/20220223/202202232117.F13tHPz0-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> kernel/irq/affinity.c:399:12-13: WARNING opportunity for min()
--
>> kernel/audit.c:1512:12-13: WARNING opportunity for min()
--
>> kernel/time/clockevents.c:75:12-13: WARNING opportunity for max()
--
>> kernel/time/tick-sched.c:772:23-24: WARNING opportunity for min()
--
>> kernel/trace/trace.c:8100:12-13: WARNING opportunity for min()

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5788610649783358794==--

