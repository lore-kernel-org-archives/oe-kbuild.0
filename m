Content-Type: multipart/mixed; boundary="===============0377990687122007049=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/spi/spi-fsl-lpspi.c:446:12-14: WARNING opportunity for min()
Date: Thu, 21 Apr 2022 18:13:48 +0800
Message-ID: <202204211827.SCcqsNw4-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0377990687122007049==
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
head:   b253435746d9a4a701b5f09211b9c14d3370d0da
commit: 5f66f73b9ff4dcabd4e2405ba9c32e80e02f9408 coccinelle: misc: add minm=
ax script
date:   12 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 12 months ago
config: xtensa-randconfig-c024-20220420 (https://download.01.org/0day-ci/ar=
chive/20220421/202204211827.SCcqsNw4-lkp(a)intel.com/config)
compiler: xtensa-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/spi/spi-fsl-lpspi.c:446:12-14: WARNING opportunity for min()

Please review and possibly fold the followup patch.

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0377990687122007049==--

