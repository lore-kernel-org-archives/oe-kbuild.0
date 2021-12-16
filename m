Content-Type: multipart/mixed; boundary="===============8864970925712600504=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/powerpc/kernel/fadump.c:1285:34-35: WARNING opportunity for swap()
Date: Thu, 16 Dec 2021 22:05:08 +0800
Message-ID: <202112162157.CU6nkwiB-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8864970925712600504==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Denis Efremov <efremov@linux.com>
CC: Julia Lawall <Julia.Lawall@inria.fr>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   2b14864acbaaf03d9c01982e243a84632524c3ac
commit: 7845daa8bd72efa8bbc1de122edfce6e058bbe41 coccinelle: misc: add swap=
 script
date:   8 months ago
:::::: branch date: 19 hours ago
:::::: commit date: 8 months ago
config: powerpc64-randconfig-c024-20211216 (https://download.01.org/0day-ci=
/archive/20211216/202112162157.CU6nkwiB-lkp(a)intel.com/config)
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
--===============8864970925712600504==--

