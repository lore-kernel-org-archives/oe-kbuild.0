Content-Type: multipart/mixed; boundary="===============9114437757688070708=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 3085/4780] drivers/net/ethernet/mellanox/mlx5/core/en/rep/bond.c:1:0: warning: dual license is used, are you sure you want to do this.
Date: Mon, 24 May 2021 18:36:48 +0800
Message-ID: <202105241838.7dzuS2ie-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============9114437757688070708==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Roi Dayan <roid@nvidia.com>
CC: dave.hansen(a)intel.com
CC: dan.j.williams(a)intel.com
CC: Saeed Mahameed <saeedm@nvidia.com>
CC: Maor Dickman <maord@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   674dc447b09fb668976c6ab1356b11e02ff209ed
commit: 83026d83186bc48bb41ee4872f339b83f31dfc55 [3085/4780] net/mlx5e: Fix=
 null deref accessing lag dev
:::::: branch date: 5 hours ago
:::::: commit date: 5 days ago
While copyright holders are free to license their software any
way they see fit, the kernel community prefers GPL-2.0-only or
GPL-2.0-or-later for kernel contributions.

If you are sure you want to submit with a dual license, please
ensure that your commit message calls out the practical reasons
for which you want to do this, including the specific other
projects you expect to make use of this code.

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


dualliccheck warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/mellanox/mlx5/core/en/rep/bond.c:1:0: warning: dual=
 license is used, are you sure you want to do this.

vim +1 drivers/net/ethernet/mellanox/mlx5/core/en/rep/bond.c

7e51891a237f9e Or Gerlitz 2019-06-21 @1  // SPDX-License-Identifier: GPL-2.=
0 OR Linux-OpenIB
7e51891a237f9e Or Gerlitz 2019-06-21  2  /* Copyright (c) 2020 Mellanox Tec=
hnologies Inc. All rights reserved. */
7e51891a237f9e Or Gerlitz 2019-06-21  3  =


:::::: The code at line 1 was first introduced by commit
:::::: 7e51891a237f9ea319f53f9beb83afb0077d88e6 net/mlx5e: Use netdev event=
s to set/del egress acl forward-to-vport rule

:::::: TO: Or Gerlitz <ogerlitz@mellanox.com>
:::::: CC: Saeed Mahameed <saeedm@mellanox.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============9114437757688070708==--

