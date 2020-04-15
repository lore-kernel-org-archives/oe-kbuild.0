Content-Type: multipart/mixed; boundary="===============4975189909796948162=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: [jkirsher-next-queue:rdma 24/25] drivers/infiniband/hw/irdma/irdma_if.c:138:56-61: WARNING: conversion to bool not needed here
Date: Wed, 15 Apr 2020 22:04:23 +0800
Message-ID: <202004152206.IJXxklkz%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4975189909796948162==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: Intel Wired LAN <intel-wired-lan@lists.osuosl.org>
TO: Shiraz Saleem <shiraz.saleem@intel.com>
CC: Jeff Kirsher <jeffrey.t.kirsher@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jkirsher/next-queue=
.git rdma
head:   4d75d9adac8df983bc733b92711683a7cd7ddd40
commit: f473122f41f69394e29a834fbfcd569dcdd1d879 [24/25] RDMA/irdma: Add ir=
dma Kconfig/Makefile and remove i40iw
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


coccinelle warnings: (new ones prefixed by >>)

>> drivers/infiniband/hw/irdma/irdma_if.c:138:56-61: WARNING: conversion to=
 bool not needed here
--
>> drivers/infiniband/hw/irdma/ctrl.c:581:7-59: duplicated argument to & or=
 |
--
>> drivers/infiniband/hw/irdma/verbs.c:2387:2-3: Unneeded semicolon

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4975189909796948162==--

