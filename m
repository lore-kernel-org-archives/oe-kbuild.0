Content-Type: multipart/mixed; boundary="===============3095635561146269089=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [rdma-rdma:wip/jgg-for-next 3/42] drivers/net/ethernet/mellanox/mlx5/core/fs_core.c:2861 create_fdb_bypass() warn: passing a valid pointer to 'PTR_ERR'
Date: Sat, 08 Jan 2022 10:33:19 +0800
Message-ID: <202201081009.wRxqZ4hz-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3095635561146269089==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Maor Gottlieb <maorg@nvidia.com>
CC: Saeed Mahameed <saeedm@nvidia.com>
CC: Mark Bloch <mbloch@nvidia.com>
CC: Leon Romanovsky <leonro@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rdma/rdma.git wip/j=
gg-for-next
head:   104f062fd1b9c8571dba6a3020649da6bbc66259
commit: c7d5fa105b5d2630ab9428914d36730eda13876c [3/42] net/mlx5: Create mo=
re priorities for FDB bypass namespace
:::::: branch date: 3 hours ago
:::::: commit date: 4 weeks ago
config: i386-randconfig-m021-20220107 (https://download.01.org/0day-ci/arch=
ive/20220108/202201081009.wRxqZ4hz-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/net/ethernet/mellanox/mlx5/core/fs_core.c:2861 create_fdb_bypass() =
warn: passing a valid pointer to 'PTR_ERR'

Old smatch warnings:
drivers/net/ethernet/mellanox/mlx5/core/fs_core.c:1666 dest_is_valid() erro=
r: we previously assumed 'dest' could be null (see line 1655)
drivers/net/ethernet/mellanox/mlx5/core/fs_core.c:1941 _mlx5_add_flow_rules=
() warn: passing a valid pointer to 'PTR_ERR'
drivers/net/ethernet/mellanox/mlx5/core/fs_core.c:2456 init_root_tree_recur=
sive() warn: passing a valid pointer to 'PTR_ERR'
drivers/net/ethernet/mellanox/mlx5/core/fs_core.c:2790 create_fdb_sub_ns_pr=
io_chain() warn: passing a valid pointer to 'PTR_ERR'

vim +/PTR_ERR +2861 drivers/net/ethernet/mellanox/mlx5/core/fs_core.c

1033665e63b6d9 Or Gerlitz    2016-07-14  2848  =

c7d5fa105b5d26 Maor Gottlieb 2021-12-01  2849  static int create_fdb_bypass=
(struct mlx5_flow_steering *steering)
c7d5fa105b5d26 Maor Gottlieb 2021-12-01  2850  {
c7d5fa105b5d26 Maor Gottlieb 2021-12-01  2851  	struct mlx5_flow_namespace =
*ns;
c7d5fa105b5d26 Maor Gottlieb 2021-12-01  2852  	struct fs_prio *prio;
c7d5fa105b5d26 Maor Gottlieb 2021-12-01  2853  	int i;
c7d5fa105b5d26 Maor Gottlieb 2021-12-01  2854  =

c7d5fa105b5d26 Maor Gottlieb 2021-12-01  2855  	prio =3D fs_create_prio(&st=
eering->fdb_root_ns->ns, FDB_BYPASS_PATH, 0);
c7d5fa105b5d26 Maor Gottlieb 2021-12-01  2856  	if (IS_ERR(prio))
c7d5fa105b5d26 Maor Gottlieb 2021-12-01  2857  		return PTR_ERR(prio);
c7d5fa105b5d26 Maor Gottlieb 2021-12-01  2858  =

c7d5fa105b5d26 Maor Gottlieb 2021-12-01  2859  	ns =3D fs_create_namespace(=
prio, MLX5_FLOW_TABLE_MISS_ACTION_DEF);
c7d5fa105b5d26 Maor Gottlieb 2021-12-01  2860  	if (IS_ERR(ns))
c7d5fa105b5d26 Maor Gottlieb 2021-12-01 @2861  		return PTR_ERR(ns);
c7d5fa105b5d26 Maor Gottlieb 2021-12-01  2862  =

c7d5fa105b5d26 Maor Gottlieb 2021-12-01  2863  	for (i =3D 0; i < MLX5_BY_P=
ASS_NUM_REGULAR_PRIOS; i++) {
c7d5fa105b5d26 Maor Gottlieb 2021-12-01  2864  		prio =3D fs_create_prio(ns=
, i, 1);
c7d5fa105b5d26 Maor Gottlieb 2021-12-01  2865  		if (IS_ERR(prio))
c7d5fa105b5d26 Maor Gottlieb 2021-12-01  2866  			return PTR_ERR(prio);
c7d5fa105b5d26 Maor Gottlieb 2021-12-01  2867  	}
c7d5fa105b5d26 Maor Gottlieb 2021-12-01  2868  	return 0;
c7d5fa105b5d26 Maor Gottlieb 2021-12-01  2869  }
c7d5fa105b5d26 Maor Gottlieb 2021-12-01  2870  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============3095635561146269089==--

