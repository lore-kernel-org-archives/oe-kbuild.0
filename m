Content-Type: multipart/mixed; boundary="===============6114279582941293817=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/ethernet/mellanox/mlx5/core/en/trap.c:359 mlx5e_handle_action_trap() error: we previously assumed 'priv->en_trap' could be null (see line 346)
Date: Sat, 11 Dec 2021 23:52:37 +0800
Message-ID: <202112112314.dMcofsrG-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6114279582941293817==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Aya Levin <ayal@nvidia.com>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Tariq Toukan <tariqt@nvidia.com>
CC: Saeed Mahameed <saeedm@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   6f513529296fd4f696afb4354c46508abe646541
commit: 5543e989fe5e2fe6a5829ee42c00152cac2bb8a0 net/mlx5e: Add trap entity=
 to ETH driver
date:   11 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 11 months ago
config: i386-randconfig-m021-20211209 (https://download.01.org/0day-ci/arch=
ive/20211211/202112112314.dMcofsrG-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/net/ethernet/mellanox/mlx5/core/en/trap.c:359 mlx5e_handle_action_t=
rap() error: we previously assumed 'priv->en_trap' could be null (see line =
346)

vim +359 drivers/net/ethernet/mellanox/mlx5/core/en/trap.c

5543e989fe5e2f Aya Levin 2021-01-26  343  =

5543e989fe5e2f Aya Levin 2021-01-26  344  static int mlx5e_handle_action_tr=
ap(struct mlx5e_priv *priv, int trap_id)
5543e989fe5e2f Aya Levin 2021-01-26  345  {
5543e989fe5e2f Aya Levin 2021-01-26 @346  	bool open_queue =3D !priv->en_tr=
ap;
5543e989fe5e2f Aya Levin 2021-01-26  347  	struct mlx5e_trap *trap;
5543e989fe5e2f Aya Levin 2021-01-26  348  	int err;
5543e989fe5e2f Aya Levin 2021-01-26  349  =

5543e989fe5e2f Aya Levin 2021-01-26  350  	if (open_queue) {
5543e989fe5e2f Aya Levin 2021-01-26  351  		trap =3D mlx5e_add_trap_queue(p=
riv);
5543e989fe5e2f Aya Levin 2021-01-26  352  		if (IS_ERR(trap))
5543e989fe5e2f Aya Levin 2021-01-26  353  			return PTR_ERR(trap);
5543e989fe5e2f Aya Levin 2021-01-26  354  		priv->en_trap =3D trap;
5543e989fe5e2f Aya Levin 2021-01-26  355  	}
5543e989fe5e2f Aya Levin 2021-01-26  356  =

5543e989fe5e2f Aya Levin 2021-01-26  357  	switch (trap_id) {
5543e989fe5e2f Aya Levin 2021-01-26  358  	case DEVLINK_TRAP_GENERIC_ID_ING=
RESS_VLAN_FILTER:
5543e989fe5e2f Aya Levin 2021-01-26 @359  		err =3D mlx5e_add_vlan_trap(pri=
v, trap_id, mlx5e_trap_get_tirn(priv->en_trap));
5543e989fe5e2f Aya Levin 2021-01-26  360  		if (err)
5543e989fe5e2f Aya Levin 2021-01-26  361  			goto err_out;
5543e989fe5e2f Aya Levin 2021-01-26  362  		break;
5543e989fe5e2f Aya Levin 2021-01-26  363  	default:
5543e989fe5e2f Aya Levin 2021-01-26  364  		netdev_warn(priv->netdev, "%s: =
Unknown trap id %d\n", __func__, trap_id);
5543e989fe5e2f Aya Levin 2021-01-26  365  		err =3D -EINVAL;
5543e989fe5e2f Aya Levin 2021-01-26  366  		goto err_out;
5543e989fe5e2f Aya Levin 2021-01-26  367  	}
5543e989fe5e2f Aya Levin 2021-01-26  368  	return 0;
5543e989fe5e2f Aya Levin 2021-01-26  369  =

5543e989fe5e2f Aya Levin 2021-01-26  370  err_out:
5543e989fe5e2f Aya Levin 2021-01-26  371  	if (open_queue)
5543e989fe5e2f Aya Levin 2021-01-26  372  		mlx5e_del_trap_queue(priv);
5543e989fe5e2f Aya Levin 2021-01-26  373  	return err;
5543e989fe5e2f Aya Levin 2021-01-26  374  }
5543e989fe5e2f Aya Levin 2021-01-26  375  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6114279582941293817==--

