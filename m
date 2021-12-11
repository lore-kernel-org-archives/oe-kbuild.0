Content-Type: multipart/mixed; boundary="===============8941247966896523309=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/ethernet/mellanox/mlx5/core/sf/dev/dev.c:231 mlx5_sf_dev_table_create() warn: should '1 << (((__builtin_bswap32(((*((dev->caps.hca[0]->cur) + (($expr_0x7f761af90ec0(30)) / 32))))) >> (32 - 8 - (($expr_0x7f761af91460(30)) & 31))) & (((1 << 8) -...
Date: Sun, 12 Dec 2021 05:12:24 +0800
Message-ID: <202112120558.1vMoWE3H-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8941247966896523309==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Parav Pandit <parav@nvidia.com>
CC: Saeed Mahameed <saeedm@nvidia.com>
CC: Leon Romanovsky <leonro@nvidia.com>
CC: Shay Drory <shayd@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   eccea80be2576dee642bc6cab20f1a242d58a08c
commit: 5958a6fad623ad3b67a9e4d8dbd5f1874cc7039e net/mlx5: Reorganize curre=
nt and maximal capabilities to be per-type
date:   4 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 4 months ago
config: i386-randconfig-m031-20211211 (https://download.01.org/0day-ci/arch=
ive/20211212/202112120558.1vMoWE3H-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/net/ethernet/mellanox/mlx5/core/sf/dev/dev.c:231 mlx5_sf_dev_table_=
create() warn: should '1 << (((__builtin_bswap32(((*((dev->caps.hca[0]->cur=
) + (($expr_0x7f761af90ec0(30)) / 32))))) >> (32 - 8 - (($expr_0x7f761af914=
60(30)) & 31))) & (((1 << 8) - 1))) + 12)' be a 64 bit type?

vim +231 drivers/net/ethernet/mellanox/mlx5/core/sf/dev/dev.c

90d010b8634b89 Parav Pandit 2020-12-11  209  =

90d010b8634b89 Parav Pandit 2020-12-11  210  void mlx5_sf_dev_table_create(=
struct mlx5_core_dev *dev)
90d010b8634b89 Parav Pandit 2020-12-11  211  {
90d010b8634b89 Parav Pandit 2020-12-11  212  	struct mlx5_sf_dev_table *tab=
le;
90d010b8634b89 Parav Pandit 2020-12-11  213  	unsigned int max_sfs;
90d010b8634b89 Parav Pandit 2020-12-11  214  	int err;
90d010b8634b89 Parav Pandit 2020-12-11  215  =

90d010b8634b89 Parav Pandit 2020-12-11  216  	if (!mlx5_sf_dev_supported(de=
v) || !mlx5_vhca_event_supported(dev))
90d010b8634b89 Parav Pandit 2020-12-11  217  		return;
90d010b8634b89 Parav Pandit 2020-12-11  218  =

90d010b8634b89 Parav Pandit 2020-12-11  219  	table =3D kzalloc(sizeof(*tab=
le), GFP_KERNEL);
90d010b8634b89 Parav Pandit 2020-12-11  220  	if (!table) {
90d010b8634b89 Parav Pandit 2020-12-11  221  		err =3D -ENOMEM;
90d010b8634b89 Parav Pandit 2020-12-11  222  		goto table_err;
90d010b8634b89 Parav Pandit 2020-12-11  223  	}
90d010b8634b89 Parav Pandit 2020-12-11  224  =

90d010b8634b89 Parav Pandit 2020-12-11  225  	table->nb.notifier_call =3D m=
lx5_sf_dev_state_change_handler;
90d010b8634b89 Parav Pandit 2020-12-11  226  	table->dev =3D dev;
90d010b8634b89 Parav Pandit 2020-12-11  227  	if (MLX5_CAP_GEN(dev, max_num=
_sf))
90d010b8634b89 Parav Pandit 2020-12-11  228  		max_sfs =3D MLX5_CAP_GEN(dev=
, max_num_sf);
90d010b8634b89 Parav Pandit 2020-12-11  229  	else
90d010b8634b89 Parav Pandit 2020-12-11  230  		max_sfs =3D 1 << MLX5_CAP_GE=
N(dev, log_max_sf);
90d010b8634b89 Parav Pandit 2020-12-11 @231  	table->sf_bar_length =3D 1 <<=
 (MLX5_CAP_GEN(dev, log_min_sf_size) + 12);
90d010b8634b89 Parav Pandit 2020-12-11  232  	table->base_address =3D pci_r=
esource_start(dev->pdev, 2);
90d010b8634b89 Parav Pandit 2020-12-11  233  	table->max_sfs =3D max_sfs;
90d010b8634b89 Parav Pandit 2020-12-11  234  	xa_init(&table->devices);
90d010b8634b89 Parav Pandit 2020-12-11  235  	dev->priv.sf_dev_table =3D ta=
ble;
90d010b8634b89 Parav Pandit 2020-12-11  236  =

90d010b8634b89 Parav Pandit 2020-12-11  237  	err =3D mlx5_vhca_event_notif=
ier_register(dev, &table->nb);
90d010b8634b89 Parav Pandit 2020-12-11  238  	if (err)
90d010b8634b89 Parav Pandit 2020-12-11  239  		goto vhca_err;
90d010b8634b89 Parav Pandit 2020-12-11  240  	err =3D mlx5_sf_dev_vhca_arm_=
all(table);
90d010b8634b89 Parav Pandit 2020-12-11  241  	if (err)
90d010b8634b89 Parav Pandit 2020-12-11  242  		goto arm_err;
90d010b8634b89 Parav Pandit 2020-12-11  243  	mlx5_core_dbg(dev, "SF DEV: m=
ax sf devices=3D%d\n", max_sfs);
90d010b8634b89 Parav Pandit 2020-12-11  244  	return;
90d010b8634b89 Parav Pandit 2020-12-11  245  =

90d010b8634b89 Parav Pandit 2020-12-11  246  arm_err:
90d010b8634b89 Parav Pandit 2020-12-11  247  	mlx5_vhca_event_notifier_unre=
gister(dev, &table->nb);
90d010b8634b89 Parav Pandit 2020-12-11  248  vhca_err:
90d010b8634b89 Parav Pandit 2020-12-11  249  	table->max_sfs =3D 0;
90d010b8634b89 Parav Pandit 2020-12-11  250  	kfree(table);
90d010b8634b89 Parav Pandit 2020-12-11  251  	dev->priv.sf_dev_table =3D NU=
LL;
90d010b8634b89 Parav Pandit 2020-12-11  252  table_err:
90d010b8634b89 Parav Pandit 2020-12-11  253  	mlx5_core_err(dev, "SF DEV ta=
ble create err =3D %d\n", err);
90d010b8634b89 Parav Pandit 2020-12-11  254  }
90d010b8634b89 Parav Pandit 2020-12-11  255  =


:::::: The code at line 231 was first introduced by commit
:::::: 90d010b8634b89a97ca3b7aa6a88fd566fc77717 net/mlx5: SF, Add auxiliary=
 device support

:::::: TO: Parav Pandit <parav@nvidia.com>
:::::: CC: Saeed Mahameed <saeedm@nvidia.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8941247966896523309==--

