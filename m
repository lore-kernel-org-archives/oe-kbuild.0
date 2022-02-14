Content-Type: multipart/mixed; boundary="===============5652256633879941302=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/usb/host/xhci-mem.c:436:27-28: WARNING opportunity for max()
Date: Mon, 14 Feb 2022 11:48:37 +0800
Message-ID: <202202141111.f3sebCI1-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5652256633879941302==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Denis Efremov <efremov@linux.com>
CC: Julia Lawall <Julia.Lawall@inria.fr>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   754e0b0e35608ed5206d6a67a791563c631cec07
commit: 5f66f73b9ff4dcabd4e2405ba9c32e80e02f9408 coccinelle: misc: add minm=
ax script
date:   10 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 10 months ago
config: alpha-randconfig-c024-20220208 (https://download.01.org/0day-ci/arc=
hive/20220214/202202141111.f3sebCI1-lkp(a)intel.com/config)
compiler: alpha-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/usb/host/xhci-mem.c:436:27-28: WARNING opportunity for max()
--
>> drivers/usb/host/xhci.c:4986:15-16: WARNING opportunity for max()

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5652256633879941302==--

