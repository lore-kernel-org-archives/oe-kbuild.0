Content-Type: multipart/mixed; boundary="===============2246627840462054194=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/spi/spi-dw-dma.c:85:26-27: WARNING opportunity for max()
Date: Sat, 12 Feb 2022 10:49:57 +0800
Message-ID: <202202121022.hDlOynHu-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2246627840462054194==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Denis Efremov <efremov@linux.com>
CC: Julia Lawall <Julia.Lawall@inria.fr>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   f1baf68e1383f6ed93eb9cff2866d46562607a43
commit: 5f66f73b9ff4dcabd4e2405ba9c32e80e02f9408 coccinelle: misc: add minm=
ax script
date:   10 months ago
:::::: branch date: 27 hours ago
:::::: commit date: 10 months ago
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/2022021=
2/202202121022.hDlOynHu-lkp(a)intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/spi/spi-dw-dma.c:85:26-27: WARNING opportunity for max()
--
>> drivers/spi/spi-fsl-lpspi.c:446:12-14: WARNING opportunity for min()

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2246627840462054194==--

