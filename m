Content-Type: multipart/mixed; boundary="===============7279302676358771556=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/infiniband/sw/siw/iwarp.h:114 __ddp_get_version() warn: mask and shift to zero
Date: Tue, 12 Apr 2022 00:50:10 +0800
Message-ID: <202204120010.X72uNDzF-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7279302676358771556==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   ce522ba9ef7e2d9fb22a39eb3371c0c64e2a433e
commit: d991bb1c8da842a2a0b9dc83b1005e655783f861 include/linux/compiler-gcc=
.h: sparse can do constant folding of __builtin_bswap*()
date:   12 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 12 months ago
config: x86_64-randconfig-m001-20220411 (https://download.01.org/0day-ci/ar=
chive/20220412/202204120010.X72uNDzF-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-19) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/infiniband/sw/siw/iwarp.h:114 __ddp_get_version() warn: mask and sh=
ift to zero

vim +114 drivers/infiniband/sw/siw/iwarp.h

0e935ae6afcdbe6 Bernard Metzler 2019-06-20  111  =

0e935ae6afcdbe6 Bernard Metzler 2019-06-20  112  static inline u8 __ddp_get=
_version(struct iwarp_ctrl *ctrl)
0e935ae6afcdbe6 Bernard Metzler 2019-06-20  113  {
0e935ae6afcdbe6 Bernard Metzler 2019-06-20 @114  	return be16_to_cpu(ctrl->=
ddp_rdmap_ctrl & DDP_MASK_VERSION) >> 8;
0e935ae6afcdbe6 Bernard Metzler 2019-06-20  115  }
0e935ae6afcdbe6 Bernard Metzler 2019-06-20  116  =


:::::: The code at line 114 was first introduced by commit
:::::: 0e935ae6afcdbe6f0c0aa457ae57feccc63bb9be rdma/siw: iWarp wire packet=
 format

:::::: TO: Bernard Metzler <bmt@zurich.ibm.com>
:::::: CC: Jason Gunthorpe <jgg@mellanox.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7279302676358771556==--

