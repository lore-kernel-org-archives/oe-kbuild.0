Content-Type: multipart/mixed; boundary="===============8781266283533334019=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/ethernet/mellanox/mlx5/core/en_main.c:339 mlx5e_get_mpwqe_offset() warn: should '(wqe_ix * ((((((((((1))) << (((18 - 12 > 0) ?18 - 12:0))) + 1)) + (((8)) - 1)) & ~(((8)) - 1))))) << 12' be a 64 bit type?
Date: Fri, 07 Jan 2022 01:47:40 +0800
Message-ID: <202201070155.i5tcNPZU-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8781266283533334019==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Tariq Toukan <tariqt@nvidia.com>
CC: Saeed Mahameed <saeedm@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   75acfdb6fd922598a408a0d864486aeb167c1a97
commit: d5dd03b26ba49c4ffe67ee1937add82293c19794 net/mlx5e: RX, Mind the MP=
WQE gaps when calculating offsets
date:   10 months ago
:::::: branch date: 20 hours ago
:::::: commit date: 10 months ago
config: i386-randconfig-m021-20220105 (https://download.01.org/0day-ci/arch=
ive/20220107/202201070155.i5tcNPZU-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/net/ethernet/mellanox/mlx5/core/en_main.c:339 mlx5e_get_mpwqe_offse=
t() warn: should '(wqe_ix * ((((((((((1))) << (((18 - 12 > 0) ?18 - 12:0)))=
 + 1)) + (((8)) - 1)) & ~(((8)) - 1))))) << 12' be a 64 bit type?

vim +339 drivers/net/ethernet/mellanox/mlx5/core/en_main.c

ec8b9981ad3f3e Tariq Toukan 2016-11-30  336  =

d5dd03b26ba49c Tariq Toukan 2021-01-12  337  static u64 mlx5e_get_mpwqe_off=
set(u16 wqe_ix)
b8a98a4cf3221d Tariq Toukan 2017-12-20  338  {
d5dd03b26ba49c Tariq Toukan 2021-01-12 @339  	return MLX5E_REQUIRED_MTTS(wq=
e_ix) << PAGE_SHIFT;
b8a98a4cf3221d Tariq Toukan 2017-12-20  340  }
b8a98a4cf3221d Tariq Toukan 2017-12-20  341  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============8781266283533334019==--

