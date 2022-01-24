Content-Type: multipart/mixed; boundary="===============8922293242729497239=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/infiniband/sw/siw/iwarp.h:114 __ddp_get_version() warn: mask and shift to zero
Date: Mon, 24 Jan 2022 22:20:11 +0800
Message-ID: <202201242202.GVCQaLEl-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8922293242729497239==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   dd81e1c7d5fb126e5fbc5c9e334d7b3ec29a16a0
commit: d991bb1c8da842a2a0b9dc83b1005e655783f861 include/linux/compiler-gcc=
.h: sparse can do constant folding of __builtin_bswap*()
date:   9 months ago
:::::: branch date: 22 hours ago
:::::: commit date: 9 months ago
config: x86_64-randconfig-m001-20220124 (https://download.01.org/0day-ci/ar=
chive/20220124/202201242202.GVCQaLEl-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/infiniband/sw/siw/iwarp.h:114 __ddp_get_version() warn: mask and sh=
ift to zero

vim +114 drivers/infiniband/sw/siw/iwarp.h

0e935ae6afcdbe Bernard Metzler 2019-06-20  111  =

0e935ae6afcdbe Bernard Metzler 2019-06-20  112  static inline u8 __ddp_get_=
version(struct iwarp_ctrl *ctrl)
0e935ae6afcdbe Bernard Metzler 2019-06-20  113  {
0e935ae6afcdbe Bernard Metzler 2019-06-20 @114  	return be16_to_cpu(ctrl->d=
dp_rdmap_ctrl & DDP_MASK_VERSION) >> 8;
0e935ae6afcdbe Bernard Metzler 2019-06-20  115  }
0e935ae6afcdbe Bernard Metzler 2019-06-20  116  =


:::::: The code at line 114 was first introduced by commit
:::::: 0e935ae6afcdbe6f0c0aa457ae57feccc63bb9be rdma/siw: iWarp wire packet=
 format

:::::: TO: Bernard Metzler <bmt@zurich.ibm.com>
:::::: CC: Jason Gunthorpe <jgg@mellanox.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8922293242729497239==--

