Content-Type: multipart/mixed; boundary="===============4850765907266474064=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/vdpa/mlx5/net/mlx5_vnet.c:2063 mlx5_vdpa_dev_add() error: uninitialized symbol 'pfmdev'.
Date: Fri, 26 Nov 2021 20:18:15 +0800
Message-ID: <202111262052.K4MjKwss-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4850765907266474064==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Eli Cohen <elic@nvidia.com>
CC: Saeed Mahameed <saeedm@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   a4849f6000e29235a2707f22e39da6b897bb9543
commit: 7c9f131f366ab414691907fa0407124ea2b2f3bc {net,vdpa}/mlx5: Configure=
 interface MAC into mpfs L2 table
date:   6 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 6 months ago
config: ia64-randconfig-m031-20211122 (https://download.01.org/0day-ci/arch=
ive/20211126/202111262052.K4MjKwss-lkp(a)intel.com/config)
compiler: ia64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/vdpa/mlx5/net/mlx5_vnet.c:2063 mlx5_vdpa_dev_add() error: uninitial=
ized symbol 'pfmdev'.

Old smatch warnings:
drivers/vdpa/mlx5/net/mlx5_vnet.c:638 umem_size() error: uninitialized symb=
ol 'p_a'.
drivers/vdpa/mlx5/net/mlx5_vnet.c:638 umem_size() error: uninitialized symb=
ol 'p_b'.
drivers/vdpa/mlx5/net/mlx5_vnet.c:720 umem_destroy() error: potentially der=
eferencing uninitialized 'umem'.

vim +/pfmdev +2063 drivers/vdpa/mlx5/net/mlx5_vnet.c

58926c8aab104da Eli Cohen       2021-04-08  1994  =

58926c8aab104da Eli Cohen       2021-04-08  1995  static int mlx5_vdpa_dev_=
add(struct vdpa_mgmt_dev *v_mdev, const char *name)
1a86b377aa2147a Eli Cohen       2020-08-04  1996  {
58926c8aab104da Eli Cohen       2021-04-08  1997  	struct mlx5_vdpa_mgmtdev=
 *mgtdev =3D container_of(v_mdev, struct mlx5_vdpa_mgmtdev, mgtdev);
1a86b377aa2147a Eli Cohen       2020-08-04  1998  	struct virtio_net_config=
 *config;
7c9f131f366ab41 Eli Cohen       2021-04-22  1999  	struct mlx5_core_dev *pf=
mdev;
1a86b377aa2147a Eli Cohen       2020-08-04  2000  	struct mlx5_vdpa_dev *mv=
dev;
1a86b377aa2147a Eli Cohen       2020-08-04  2001  	struct mlx5_vdpa_net *nd=
ev;
58926c8aab104da Eli Cohen       2021-04-08  2002  	struct mlx5_core_dev *md=
ev;
1a86b377aa2147a Eli Cohen       2020-08-04  2003  	u32 max_vqs;
1a86b377aa2147a Eli Cohen       2020-08-04  2004  	int err;
1a86b377aa2147a Eli Cohen       2020-08-04  2005  =

58926c8aab104da Eli Cohen       2021-04-08  2006  	if (mgtdev->ndev)
58926c8aab104da Eli Cohen       2021-04-08  2007  		return -ENOSPC;
58926c8aab104da Eli Cohen       2021-04-08  2008  =

58926c8aab104da Eli Cohen       2021-04-08  2009  	mdev =3D mgtdev->madev->=
mdev;
1a86b377aa2147a Eli Cohen       2020-08-04  2010  	/* we save one virtqueue=
 for control virtqueue should we require it */
1a86b377aa2147a Eli Cohen       2020-08-04  2011  	max_vqs =3D MLX5_CAP_DEV=
_VDPA_EMULATION(mdev, max_num_virtio_queues);
1a86b377aa2147a Eli Cohen       2020-08-04  2012  	max_vqs =3D min_t(u32, m=
ax_vqs, MLX5_MAX_SUPPORTED_VQS);
1a86b377aa2147a Eli Cohen       2020-08-04  2013  =

1a86b377aa2147a Eli Cohen       2020-08-04  2014  	ndev =3D vdpa_alloc_devi=
ce(struct mlx5_vdpa_net, mvdev.vdev, mdev->device, &mlx5_vdpa_ops,
58926c8aab104da Eli Cohen       2021-04-08  2015  				 name);
1a86b377aa2147a Eli Cohen       2020-08-04  2016  	if (IS_ERR(ndev))
74c9729dd892a1b Leon Romanovsky 2020-10-04  2017  		return PTR_ERR(ndev);
1a86b377aa2147a Eli Cohen       2020-08-04  2018  =

1a86b377aa2147a Eli Cohen       2020-08-04  2019  	ndev->mvdev.max_vqs =3D =
max_vqs;
1a86b377aa2147a Eli Cohen       2020-08-04  2020  	mvdev =3D &ndev->mvdev;
1a86b377aa2147a Eli Cohen       2020-08-04  2021  	mvdev->mdev =3D mdev;
1a86b377aa2147a Eli Cohen       2020-08-04  2022  	init_mvqs(ndev);
1a86b377aa2147a Eli Cohen       2020-08-04  2023  	mutex_init(&ndev->resloc=
k);
1a86b377aa2147a Eli Cohen       2020-08-04  2024  	config =3D &ndev->config;
d084d996aaf53c0 Si-Wei Liu      2021-04-08  2025  	err =3D query_mtu(mdev, =
&ndev->mtu);
1a86b377aa2147a Eli Cohen       2020-08-04  2026  	if (err)
1a86b377aa2147a Eli Cohen       2020-08-04  2027  		goto err_mtu;
1a86b377aa2147a Eli Cohen       2020-08-04  2028  =

1a86b377aa2147a Eli Cohen       2020-08-04  2029  	err =3D mlx5_query_nic_v=
port_mac_address(mdev, 0, 0, config->mac);
1a86b377aa2147a Eli Cohen       2020-08-04  2030  	if (err)
1a86b377aa2147a Eli Cohen       2020-08-04  2031  		goto err_mtu;
1a86b377aa2147a Eli Cohen       2020-08-04  2032  =

7c9f131f366ab41 Eli Cohen       2021-04-22  2033  	if (!is_zero_ether_addr(=
config->mac)) {
7c9f131f366ab41 Eli Cohen       2021-04-22  2034  		pfmdev =3D pci_get_drvd=
ata(pci_physfn(mdev->pdev));
7c9f131f366ab41 Eli Cohen       2021-04-22  2035  		err =3D mlx5_mpfs_add_m=
ac(pfmdev, config->mac);
7c9f131f366ab41 Eli Cohen       2021-04-22  2036  		if (err)
7c9f131f366ab41 Eli Cohen       2021-04-22  2037  			goto err_mtu;
7c9f131f366ab41 Eli Cohen       2021-04-22  2038  	}
7c9f131f366ab41 Eli Cohen       2021-04-22  2039  =

1a86b377aa2147a Eli Cohen       2020-08-04  2040  	mvdev->vdev.dma_dev =3D =
mdev->device;
1a86b377aa2147a Eli Cohen       2020-08-04  2041  	err =3D mlx5_vdpa_alloc_=
resources(&ndev->mvdev);
1a86b377aa2147a Eli Cohen       2020-08-04  2042  	if (err)
7c9f131f366ab41 Eli Cohen       2021-04-22  2043  		goto err_mpfs;
1a86b377aa2147a Eli Cohen       2020-08-04  2044  =

1a86b377aa2147a Eli Cohen       2020-08-04  2045  	err =3D alloc_resources(=
ndev);
1a86b377aa2147a Eli Cohen       2020-08-04  2046  	if (err)
1a86b377aa2147a Eli Cohen       2020-08-04  2047  		goto err_res;
1a86b377aa2147a Eli Cohen       2020-08-04  2048  =

58926c8aab104da Eli Cohen       2021-04-08  2049  	mvdev->vdev.mdev =3D &mg=
tdev->mgtdev;
58926c8aab104da Eli Cohen       2021-04-08  2050  	err =3D _vdpa_register_d=
evice(&mvdev->vdev, 2 * mlx5_vdpa_max_qps(max_vqs));
1a86b377aa2147a Eli Cohen       2020-08-04  2051  	if (err)
1a86b377aa2147a Eli Cohen       2020-08-04  2052  		goto err_reg;
1a86b377aa2147a Eli Cohen       2020-08-04  2053  =

58926c8aab104da Eli Cohen       2021-04-08  2054  	mgtdev->ndev =3D ndev;
74c9729dd892a1b Leon Romanovsky 2020-10-04  2055  	return 0;
1a86b377aa2147a Eli Cohen       2020-08-04  2056  =

1a86b377aa2147a Eli Cohen       2020-08-04  2057  err_reg:
1a86b377aa2147a Eli Cohen       2020-08-04  2058  	free_resources(ndev);
1a86b377aa2147a Eli Cohen       2020-08-04  2059  err_res:
1a86b377aa2147a Eli Cohen       2020-08-04  2060  	mlx5_vdpa_free_resources=
(&ndev->mvdev);
7c9f131f366ab41 Eli Cohen       2021-04-22  2061  err_mpfs:
7c9f131f366ab41 Eli Cohen       2021-04-22  2062  	if (!is_zero_ether_addr(=
config->mac))
7c9f131f366ab41 Eli Cohen       2021-04-22 @2063  		mlx5_mpfs_del_mac(pfmde=
v, config->mac);
1a86b377aa2147a Eli Cohen       2020-08-04  2064  err_mtu:
1a86b377aa2147a Eli Cohen       2020-08-04  2065  	mutex_destroy(&ndev->res=
lock);
1a86b377aa2147a Eli Cohen       2020-08-04  2066  	put_device(&mvdev->vdev.=
dev);
74c9729dd892a1b Leon Romanovsky 2020-10-04  2067  	return err;
1a86b377aa2147a Eli Cohen       2020-08-04  2068  }
1a86b377aa2147a Eli Cohen       2020-08-04  2069  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4850765907266474064==--

