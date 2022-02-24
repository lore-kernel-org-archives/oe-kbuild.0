Content-Type: multipart/mixed; boundary="===============4887506206428505206=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/dma/dmatest.c:1033:23-24: WARNING opportunity for max()
Date: Thu, 24 Feb 2022 14:58:27 +0800
Message-ID: <202202241408.Zy8vwY5X-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4887506206428505206==
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
head:   23d04328444a8fa0ca060c5e532220dac8e8bc26
commit: 5f66f73b9ff4dcabd4e2405ba9c32e80e02f9408 coccinelle: misc: add minm=
ax script
date:   10 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 10 months ago
config: i386-randconfig-c001 (https://download.01.org/0day-ci/archive/20220=
224/202202241408.Zy8vwY5X-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/dma/dmatest.c:1033:23-24: WARNING opportunity for max()
   drivers/dma/dmatest.c:1040:23-24: WARNING opportunity for max()
   drivers/dma/dmatest.c:1046:22-23: WARNING opportunity for max()
   drivers/dma/dmatest.c:1050:22-23: WARNING opportunity for max()

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4887506206428505206==--

