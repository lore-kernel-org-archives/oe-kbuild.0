Content-Type: multipart/mixed; boundary="===============0898833664653294321=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/ethernet/mellanox/mlx5/core/lib/dm.c:34 mlx5_dm_create() warn: should '(((1))) << (((((*((dev->caps.hca[15]->cur) + (($expr_0x7f03ab74d9f0(30)) / 32)))) >> (32 - 8 - (($expr_0x7f03ab74df90(30)) & 31))) & (((1 << 8) - 1))) - (((((*((dev->caps.h...
Date: Sun, 28 Nov 2021 02:25:22 +0800
Message-ID: <202111280225.L607YNp5-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0898833664653294321==
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
head:   c5c17547b778975b3d83a73c8d84e8fb5ecf3ba5
commit: 5958a6fad623ad3b67a9e4d8dbd5f1874cc7039e net/mlx5: Reorganize curre=
nt and maximal capabilities to be per-type
date:   4 months ago
:::::: branch date: 21 hours ago
:::::: commit date: 4 months ago
config: microblaze-randconfig-m031-20211011 (https://download.01.org/0day-c=
i/archive/20211128/202111280225.L607YNp5-lkp(a)intel.com/config)
compiler: microblaze-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/net/ethernet/mellanox/mlx5/core/lib/dm.c:34 mlx5_dm_create() warn: =
should '(((1))) << (((((*((dev->caps.hca[15]->cur) + (($expr_0x7f03ab74d9f0=
(30)) / 32)))) >> (32 - 8 - (($expr_0x7f03ab74df90(30)) & 31))) & (((1 << 8=
) - 1))) - (((((*((dev->caps.hca[15]->cur) + (($expr_0x7f03ab726c90(30)) / =
32)))) >> (32 - 6 - (($expr_0x7f03ab727230(30)) & 31))) & (((1 << 6) - 1)))=
))' be a 64 bit type?

Old smatch warnings:
drivers/net/ethernet/mellanox/mlx5/core/lib/dm.c:46 mlx5_dm_create() warn: =
should '(((1))) << (((((*((dev->caps.hca[15]->cur) + (($expr_0x7f03ab7295d0=
(30)) / 32)))) >> (32 - 8 - (($expr_0x7f03ab729b70(30)) & 31))) & (((1 << 8=
) - 1))) - (((((*((dev->caps.hca[15]->cur) + (($expr_0x7f03ab72a840(30)) / =
32)))) >> (32 - 6 - (($expr_0x7f03ab72ade0(30)) & 31))) & (((1 << 6) - 1)))=
))' be a 64 bit type?

vim +34 drivers/net/ethernet/mellanox/mlx5/core/lib/dm.c

c9b9dcb430b3cd Ariel Levkovich 2019-08-29  16  =

c9b9dcb430b3cd Ariel Levkovich 2019-08-29  17  struct mlx5_dm *mlx5_dm_crea=
te(struct mlx5_core_dev *dev)
c9b9dcb430b3cd Ariel Levkovich 2019-08-29  18  {
c9b9dcb430b3cd Ariel Levkovich 2019-08-29  19  	u64 header_modify_icm_block=
s =3D 0;
c9b9dcb430b3cd Ariel Levkovich 2019-08-29  20  	u64 steering_icm_blocks =3D=
 0;
c9b9dcb430b3cd Ariel Levkovich 2019-08-29  21  	struct mlx5_dm *dm;
c9b9dcb430b3cd Ariel Levkovich 2019-08-29  22  =

c9b9dcb430b3cd Ariel Levkovich 2019-08-29  23  	if (!(MLX5_CAP_GEN_64(dev, =
general_obj_types) & MLX5_GENERAL_OBJ_TYPES_CAP_SW_ICM))
586ee9e8a3b007 Saeed Mahameed  2020-01-22  24  		return NULL;
c9b9dcb430b3cd Ariel Levkovich 2019-08-29  25  =

c9b9dcb430b3cd Ariel Levkovich 2019-08-29  26  	dm =3D kzalloc(sizeof(*dm),=
 GFP_KERNEL);
c9b9dcb430b3cd Ariel Levkovich 2019-08-29  27  	if (!dm)
c9b9dcb430b3cd Ariel Levkovich 2019-08-29  28  		return ERR_PTR(-ENOMEM);
c9b9dcb430b3cd Ariel Levkovich 2019-08-29  29  =

c9b9dcb430b3cd Ariel Levkovich 2019-08-29  30  	spin_lock_init(&dm->lock);
c9b9dcb430b3cd Ariel Levkovich 2019-08-29  31  =

c9b9dcb430b3cd Ariel Levkovich 2019-08-29  32  	if (MLX5_CAP64_DEV_MEM(dev,=
 steering_sw_icm_start_address)) {
c9b9dcb430b3cd Ariel Levkovich 2019-08-29  33  		steering_icm_blocks =3D
c9b9dcb430b3cd Ariel Levkovich 2019-08-29 @34  			BIT(MLX5_CAP_DEV_MEM(dev,=
 log_steering_sw_icm_size) -
c9b9dcb430b3cd Ariel Levkovich 2019-08-29  35  			    MLX5_LOG_SW_ICM_BLOCK=
_SIZE(dev));
c9b9dcb430b3cd Ariel Levkovich 2019-08-29  36  =

c9b9dcb430b3cd Ariel Levkovich 2019-08-29  37  		dm->steering_sw_icm_alloc_=
blocks =3D
c9b9dcb430b3cd Ariel Levkovich 2019-08-29  38  			kcalloc(BITS_TO_LONGS(ste=
ering_icm_blocks),
c9b9dcb430b3cd Ariel Levkovich 2019-08-29  39  				sizeof(unsigned long), G=
FP_KERNEL);
c9b9dcb430b3cd Ariel Levkovich 2019-08-29  40  		if (!dm->steering_sw_icm_a=
lloc_blocks)
c9b9dcb430b3cd Ariel Levkovich 2019-08-29  41  			goto err_steering;
c9b9dcb430b3cd Ariel Levkovich 2019-08-29  42  	}
c9b9dcb430b3cd Ariel Levkovich 2019-08-29  43  =

c9b9dcb430b3cd Ariel Levkovich 2019-08-29  44  	if (MLX5_CAP64_DEV_MEM(dev,=
 header_modify_sw_icm_start_address)) {
c9b9dcb430b3cd Ariel Levkovich 2019-08-29  45  		header_modify_icm_blocks =
=3D
c9b9dcb430b3cd Ariel Levkovich 2019-08-29  46  			BIT(MLX5_CAP_DEV_MEM(dev,=
 log_header_modify_sw_icm_size) -
c9b9dcb430b3cd Ariel Levkovich 2019-08-29  47  			    MLX5_LOG_SW_ICM_BLOCK=
_SIZE(dev));
c9b9dcb430b3cd Ariel Levkovich 2019-08-29  48  =

c9b9dcb430b3cd Ariel Levkovich 2019-08-29  49  		dm->header_modify_sw_icm_a=
lloc_blocks =3D
c9b9dcb430b3cd Ariel Levkovich 2019-08-29  50  			kcalloc(BITS_TO_LONGS(hea=
der_modify_icm_blocks),
c9b9dcb430b3cd Ariel Levkovich 2019-08-29  51  				sizeof(unsigned long), G=
FP_KERNEL);
c9b9dcb430b3cd Ariel Levkovich 2019-08-29  52  		if (!dm->header_modify_sw_=
icm_alloc_blocks)
c9b9dcb430b3cd Ariel Levkovich 2019-08-29  53  			goto err_modify_hdr;
c9b9dcb430b3cd Ariel Levkovich 2019-08-29  54  	}
c9b9dcb430b3cd Ariel Levkovich 2019-08-29  55  =

c9b9dcb430b3cd Ariel Levkovich 2019-08-29  56  	return dm;
c9b9dcb430b3cd Ariel Levkovich 2019-08-29  57  =

c9b9dcb430b3cd Ariel Levkovich 2019-08-29  58  err_modify_hdr:
c9b9dcb430b3cd Ariel Levkovich 2019-08-29  59  	kfree(dm->steering_sw_icm_a=
lloc_blocks);
c9b9dcb430b3cd Ariel Levkovich 2019-08-29  60  =

c9b9dcb430b3cd Ariel Levkovich 2019-08-29  61  err_steering:
c9b9dcb430b3cd Ariel Levkovich 2019-08-29  62  	kfree(dm);
c9b9dcb430b3cd Ariel Levkovich 2019-08-29  63  =

c9b9dcb430b3cd Ariel Levkovich 2019-08-29  64  	return ERR_PTR(-ENOMEM);
c9b9dcb430b3cd Ariel Levkovich 2019-08-29  65  }
c9b9dcb430b3cd Ariel Levkovich 2019-08-29  66  =


:::::: The code at line 34 was first introduced by commit
:::::: c9b9dcb430b3cd0ad2b04c360c4e528d73430481 net/mlx5: Move device memor=
y management to mlx5_core

:::::: TO: Ariel Levkovich <lariel@mellanox.com>
:::::: CC: Saeed Mahameed <saeedm@mellanox.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0898833664653294321==--

