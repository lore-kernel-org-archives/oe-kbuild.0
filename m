Content-Type: multipart/mixed; boundary="===============2315121458187425916=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/powerpc/kernel/fadump.c:1285:34-35: WARNING opportunity for swap()
Date: Sat, 01 Jan 2022 01:49:27 +0800
Message-ID: <202201010139.lznvHHZR-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2315121458187425916==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Denis Efremov <efremov@linux.com>
CC: Julia Lawall <Julia.Lawall@inria.fr>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   4f3d93c6eaff6b84e43b63e0d7a119c5920e1020
commit: 7845daa8bd72efa8bbc1de122edfce6e058bbe41 coccinelle: misc: add swap=
 script
date:   8 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 8 months ago
config: powerpc64-randconfig-c024-20211231 (https://download.01.org/0day-ci=
/archive/20220101/202201010139.lznvHHZR-lkp(a)intel.com/config)
compiler: powerpc64le-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> arch/powerpc/kernel/fadump.c:1285:34-35: WARNING opportunity for swap()

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2315121458187425916==--

