Content-Type: multipart/mixed; boundary="===============0986936494860523313=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/powerpc/kernel/sysfs.c:456:36-37: WARNING opportunity for max()
Date: Wed, 09 Feb 2022 05:58:53 +0800
Message-ID: <202202090521.NbGseFCj-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0986936494860523313==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Denis Efremov <efremov@linux.com>
CC: Julia Lawall <Julia.Lawall@inria.fr>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   555f3d7be91a873114c9656069f1a9fa476ec41a
commit: 5f66f73b9ff4dcabd4e2405ba9c32e80e02f9408 coccinelle: misc: add minm=
ax script
date:   9 months ago
:::::: branch date: 22 hours ago
:::::: commit date: 9 months ago
config: powerpc64-randconfig-c003-20220208 (https://download.01.org/0day-ci=
/archive/20220209/202202090521.NbGseFCj-lkp(a)intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> arch/powerpc/kernel/sysfs.c:456:36-37: WARNING opportunity for max()
   arch/powerpc/kernel/sysfs.c:334:36-37: WARNING opportunity for max()

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0986936494860523313==--

