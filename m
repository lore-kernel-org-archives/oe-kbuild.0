Content-Type: multipart/mixed; boundary="===============4278150416321756800=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 3091/4780] include/linux/mlx5/mpfs.h:1:0: warning: dual license is used, are you sure you want to do this.
Date: Mon, 24 May 2021 19:21:04 +0800
Message-ID: <202105241902.2dCXimvI-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4278150416321756800==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Eli Cohen <elic@nvidia.com>
CC: dave.hansen(a)intel.com
CC: dan.j.williams(a)intel.com
CC: Saeed Mahameed <saeedm@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   674dc447b09fb668976c6ab1356b11e02ff209ed
commit: 7c9f131f366ab414691907fa0407124ea2b2f3bc [3091/4780] {net,vdpa}/mlx=
5: Configure interface MAC into mpfs L2 table
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
>> include/linux/mlx5/mpfs.h:1:0: warning: dual license is used, are you su=
re you want to do this.

vim +1 include/linux/mlx5/mpfs.h

7c9f131f366ab4 Eli Cohen 2021-04-22 @1  /* SPDX-License-Identifier: GPL-2.0=
 OR Linux-OpenIB
7c9f131f366ab4 Eli Cohen 2021-04-22  2   * Copyright (c) 2021 Mellanox Tech=
nologies Ltd.
7c9f131f366ab4 Eli Cohen 2021-04-22  3   */
7c9f131f366ab4 Eli Cohen 2021-04-22  4  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4278150416321756800==--

