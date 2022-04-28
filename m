Content-Type: multipart/mixed; boundary="===============3019068477010461625=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/dma/sprd-dma.c:685:23-24: WARNING opportunity for max()
Date: Thu, 28 Apr 2022 23:23:52 +0800
Message-ID: <202204282335.IY3pbtDK-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3019068477010461625==
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
head:   8f4dd16603ce834d1c5c4da67803ea82dd282511
commit: 5f66f73b9ff4dcabd4e2405ba9c32e80e02f9408 coccinelle: misc: add minm=
ax script
date:   12 months ago
:::::: branch date: 19 hours ago
:::::: commit date: 12 months ago
config: mips-randconfig-c023-20220428 (https://download.01.org/0day-ci/arch=
ive/20220428/202204282335.IY3pbtDK-lkp(a)intel.com/config)
compiler: mips64-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/dma/sprd-dma.c:685:23-24: WARNING opportunity for max()

Please review and possibly fold the followup patch.

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3019068477010461625==--

