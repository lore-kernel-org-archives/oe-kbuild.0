Content-Type: multipart/mixed; boundary="===============2007848254416493583=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [mellanox:queue-next 1128/1139] drivers/net/ethernet/mellanox/mlx5/core/fs_core.c:2861 create_fdb_bypass() warn: passing a valid pointer to 'PTR_ERR'
Date: Fri, 10 Dec 2021 07:06:33 +0800
Message-ID: <202112100628.2IZ1oCxt-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2007848254416493583==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Maor Gottlieb <maorg@nvidia.com>
CC: Saeed Mahameed <saeedm@nvidia.com>
CC: Mark Bloch <mbloch@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mellanox/linux.git =
queue-next
head:   e95f87f80da02c09d1f36b39c0d0b0801794197a
commit: f2bcebbed2b79f27c40755455b8b88a192bdf00f [1128/1139] net/mlx5: Crea=
te more priorities for FDB bypass namespace
:::::: branch date: 16 hours ago
:::::: commit date: 29 hours ago
config: i386-randconfig-m021-20211209 (https://download.01.org/0day-ci/arch=
ive/20211210/202112100628.2IZ1oCxt-lkp(a)intel.com/config)
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

1033665e63b6d98 Or Gerlitz    2016-07-14  2848  =

f2bcebbed2b79f2 Maor Gottlieb 2021-09-29  2849  static int create_fdb_bypas=
s(struct mlx5_flow_steering *steering)
f2bcebbed2b79f2 Maor Gottlieb 2021-09-29  2850  {
f2bcebbed2b79f2 Maor Gottlieb 2021-09-29  2851  	struct mlx5_flow_namespace=
 *ns;
f2bcebbed2b79f2 Maor Gottlieb 2021-09-29  2852  	struct fs_prio *prio;
f2bcebbed2b79f2 Maor Gottlieb 2021-09-29  2853  	int i;
f2bcebbed2b79f2 Maor Gottlieb 2021-09-29  2854  =

f2bcebbed2b79f2 Maor Gottlieb 2021-09-29  2855  	prio =3D fs_create_prio(&s=
teering->fdb_root_ns->ns, FDB_BYPASS_PATH, 0);
f2bcebbed2b79f2 Maor Gottlieb 2021-09-29  2856  	if (IS_ERR(prio))
f2bcebbed2b79f2 Maor Gottlieb 2021-09-29  2857  		return PTR_ERR(prio);
f2bcebbed2b79f2 Maor Gottlieb 2021-09-29  2858  =

f2bcebbed2b79f2 Maor Gottlieb 2021-09-29  2859  	ns =3D fs_create_namespace=
(prio, MLX5_FLOW_TABLE_MISS_ACTION_DEF);
f2bcebbed2b79f2 Maor Gottlieb 2021-09-29  2860  	if (IS_ERR(ns))
f2bcebbed2b79f2 Maor Gottlieb 2021-09-29 @2861  		return PTR_ERR(ns);
f2bcebbed2b79f2 Maor Gottlieb 2021-09-29  2862  =

f2bcebbed2b79f2 Maor Gottlieb 2021-09-29  2863  	for (i =3D 0; i < MLX5_BY_=
PASS_NUM_REGULAR_PRIOS; i++) {
f2bcebbed2b79f2 Maor Gottlieb 2021-09-29  2864  		prio =3D fs_create_prio(n=
s, i, 1);
f2bcebbed2b79f2 Maor Gottlieb 2021-09-29  2865  		if (IS_ERR(prio))
f2bcebbed2b79f2 Maor Gottlieb 2021-09-29  2866  			return PTR_ERR(prio);
f2bcebbed2b79f2 Maor Gottlieb 2021-09-29  2867  	}
f2bcebbed2b79f2 Maor Gottlieb 2021-09-29  2868  	return 0;
f2bcebbed2b79f2 Maor Gottlieb 2021-09-29  2869  }
f2bcebbed2b79f2 Maor Gottlieb 2021-09-29  2870  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============2007848254416493583==--

