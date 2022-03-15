Content-Type: multipart/mixed; boundary="===============5194428303310418506=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/vdpa/mlx5/net/mlx5_vnet.c:638 set_umem_size() error: uninitialized symbol 'p_a'.
Date: Tue, 15 Mar 2022 09:24:12 +0800
Message-ID: <202203150908.Wto3MD0o-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5194428303310418506==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Eli Cohen <elic@nvidia.com>
CC: "Michael S. Tsirkin" <mst@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   09688c0166e76ce2fb85e86b9d99be8b0084cdf9
commit: 71ab6a7cfbae27f86a3901daab10bfe13b3a1e3a vdpa/mlx5: Fix possible fa=
ilure in umem size calculation
date:   9 months ago
:::::: branch date: 29 hours ago
:::::: commit date: 9 months ago
config: riscv-randconfig-m031-20220313 (https://download.01.org/0day-ci/arc=
hive/20220315/202203150908.Wto3MD0o-lkp(a)intel.com/config)
compiler: riscv64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/vdpa/mlx5/net/mlx5_vnet.c:638 set_umem_size() error: uninitialized =
symbol 'p_a'.
drivers/vdpa/mlx5/net/mlx5_vnet.c:638 set_umem_size() error: uninitialized =
symbol 'p_b'.

Old smatch warnings:
drivers/vdpa/mlx5/net/mlx5_vnet.c:715 umem_destroy() error: potentially der=
eferencing uninitialized 'umem'.
drivers/vdpa/mlx5/net/mlx5_vnet.c:2058 mlx5_vdpa_dev_add() error: uninitial=
ized symbol 'pfmdev'.

vim +/p_a +638 drivers/vdpa/mlx5/net/mlx5_vnet.c

1a86b377aa2147a Eli Cohen 2020-08-04  613  =

71ab6a7cfbae27f Eli Cohen 2021-05-30  614  static void set_umem_size(struct=
 mlx5_vdpa_net *ndev, struct mlx5_vdpa_virtqueue *mvq, int num,
1a86b377aa2147a Eli Cohen 2020-08-04  615  			  struct mlx5_vdpa_umem **ume=
mp)
1a86b377aa2147a Eli Cohen 2020-08-04  616  {
1a86b377aa2147a Eli Cohen 2020-08-04  617  	struct mlx5_core_dev *mdev =3D =
ndev->mvdev.mdev;
1a86b377aa2147a Eli Cohen 2020-08-04  618  	int p_a;
1a86b377aa2147a Eli Cohen 2020-08-04  619  	int p_b;
1a86b377aa2147a Eli Cohen 2020-08-04  620  =

1a86b377aa2147a Eli Cohen 2020-08-04  621  	switch (num) {
1a86b377aa2147a Eli Cohen 2020-08-04  622  	case 1:
1a86b377aa2147a Eli Cohen 2020-08-04  623  		p_a =3D MLX5_CAP_DEV_VDPA_EMUL=
ATION(mdev, umem_1_buffer_param_a);
1a86b377aa2147a Eli Cohen 2020-08-04  624  		p_b =3D MLX5_CAP_DEV_VDPA_EMUL=
ATION(mdev, umem_1_buffer_param_b);
1a86b377aa2147a Eli Cohen 2020-08-04  625  		*umemp =3D &mvq->umem1;
1a86b377aa2147a Eli Cohen 2020-08-04  626  		break;
1a86b377aa2147a Eli Cohen 2020-08-04  627  	case 2:
1a86b377aa2147a Eli Cohen 2020-08-04  628  		p_a =3D MLX5_CAP_DEV_VDPA_EMUL=
ATION(mdev, umem_2_buffer_param_a);
1a86b377aa2147a Eli Cohen 2020-08-04  629  		p_b =3D MLX5_CAP_DEV_VDPA_EMUL=
ATION(mdev, umem_2_buffer_param_b);
1a86b377aa2147a Eli Cohen 2020-08-04  630  		*umemp =3D &mvq->umem2;
1a86b377aa2147a Eli Cohen 2020-08-04  631  		break;
1a86b377aa2147a Eli Cohen 2020-08-04  632  	case 3:
1a86b377aa2147a Eli Cohen 2020-08-04  633  		p_a =3D MLX5_CAP_DEV_VDPA_EMUL=
ATION(mdev, umem_3_buffer_param_a);
1a86b377aa2147a Eli Cohen 2020-08-04  634  		p_b =3D MLX5_CAP_DEV_VDPA_EMUL=
ATION(mdev, umem_3_buffer_param_b);
1a86b377aa2147a Eli Cohen 2020-08-04  635  		*umemp =3D &mvq->umem3;
1a86b377aa2147a Eli Cohen 2020-08-04  636  		break;
1a86b377aa2147a Eli Cohen 2020-08-04  637  	}
71ab6a7cfbae27f Eli Cohen 2021-05-30 @638  	(*umemp)->size =3D p_a * mvq->n=
um_ent + p_b;
1a86b377aa2147a Eli Cohen 2020-08-04  639  }
1a86b377aa2147a Eli Cohen 2020-08-04  640  =


---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5194428303310418506==--

