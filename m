Content-Type: multipart/mixed; boundary="===============0615660581522707215=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/infiniband/hw/mlx5/dm.c:239 mlx5_ib_alloc_dm() error: uninitialized symbol '_val'.
Date: Tue, 15 Mar 2022 03:47:00 +0800
Message-ID: <202203150314.5feBEpRz-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0615660581522707215==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Maor Gottlieb <maorg@nvidia.com>
CC: Jason Gunthorpe <jgg@nvidia.com>
CC: Leon Romanovsky <leonro@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   09688c0166e76ce2fb85e86b9d99be8b0084cdf9
commit: 831df88381f73bca0f5624b69ab985cac3d036bc RDMA/mlx5: Move all DM log=
ic to separate file
date:   11 months ago
:::::: branch date: 23 hours ago
:::::: commit date: 11 months ago
config: riscv-randconfig-m031-20220313 (https://download.01.org/0day-ci/arc=
hive/20220315/202203150314.5feBEpRz-lkp(a)intel.com/config)
compiler: riscv64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/infiniband/hw/mlx5/dm.c:239 mlx5_ib_alloc_dm() error: uninitialized=
 symbol '_val'.

vim +/_val +239 drivers/infiniband/hw/mlx5/dm.c

831df88381f73bc Maor Gottlieb 2021-04-11  229  =

831df88381f73bc Maor Gottlieb 2021-04-11  230  struct ib_dm *mlx5_ib_alloc_=
dm(struct ib_device *ibdev,
831df88381f73bc Maor Gottlieb 2021-04-11  231  			       struct ib_ucontext=
 *context,
831df88381f73bc Maor Gottlieb 2021-04-11  232  			       struct ib_dm_alloc=
_attr *attr,
831df88381f73bc Maor Gottlieb 2021-04-11  233  			       struct uverbs_attr=
_bundle *attrs)
831df88381f73bc Maor Gottlieb 2021-04-11  234  {
831df88381f73bc Maor Gottlieb 2021-04-11  235  	struct mlx5_ib_dm *dm;
831df88381f73bc Maor Gottlieb 2021-04-11  236  	enum mlx5_ib_uapi_dm_type t=
ype;
831df88381f73bc Maor Gottlieb 2021-04-11  237  	int err;
831df88381f73bc Maor Gottlieb 2021-04-11  238  =

831df88381f73bc Maor Gottlieb 2021-04-11 @239  	err =3D uverbs_get_const_de=
fault(&type, attrs,
831df88381f73bc Maor Gottlieb 2021-04-11  240  				       MLX5_IB_ATTR_ALLO=
C_DM_REQ_TYPE,
831df88381f73bc Maor Gottlieb 2021-04-11  241  				       MLX5_IB_UAPI_DM_T=
YPE_MEMIC);
831df88381f73bc Maor Gottlieb 2021-04-11  242  	if (err)
831df88381f73bc Maor Gottlieb 2021-04-11  243  		return ERR_PTR(err);
831df88381f73bc Maor Gottlieb 2021-04-11  244  =

831df88381f73bc Maor Gottlieb 2021-04-11  245  	mlx5_ib_dbg(to_mdev(ibdev),=
 "alloc_dm req: dm_type=3D%d user_length=3D0x%llx log_alignment=3D%d\n",
831df88381f73bc Maor Gottlieb 2021-04-11  246  		    type, attr->length, at=
tr->alignment);
831df88381f73bc Maor Gottlieb 2021-04-11  247  =

831df88381f73bc Maor Gottlieb 2021-04-11  248  	err =3D check_dm_type_suppo=
rt(to_mdev(ibdev), type);
831df88381f73bc Maor Gottlieb 2021-04-11  249  	if (err)
831df88381f73bc Maor Gottlieb 2021-04-11  250  		return ERR_PTR(err);
831df88381f73bc Maor Gottlieb 2021-04-11  251  =

831df88381f73bc Maor Gottlieb 2021-04-11  252  	dm =3D kzalloc(sizeof(*dm),=
 GFP_KERNEL);
831df88381f73bc Maor Gottlieb 2021-04-11  253  	if (!dm)
831df88381f73bc Maor Gottlieb 2021-04-11  254  		return ERR_PTR(-ENOMEM);
831df88381f73bc Maor Gottlieb 2021-04-11  255  =

831df88381f73bc Maor Gottlieb 2021-04-11  256  	dm->type =3D type;
831df88381f73bc Maor Gottlieb 2021-04-11  257  =

831df88381f73bc Maor Gottlieb 2021-04-11  258  	switch (type) {
831df88381f73bc Maor Gottlieb 2021-04-11  259  	case MLX5_IB_UAPI_DM_TYPE_M=
EMIC:
831df88381f73bc Maor Gottlieb 2021-04-11  260  		err =3D handle_alloc_dm_me=
mic(context, dm,
831df88381f73bc Maor Gottlieb 2021-04-11  261  					    attr,
831df88381f73bc Maor Gottlieb 2021-04-11  262  					    attrs);
831df88381f73bc Maor Gottlieb 2021-04-11  263  		break;
831df88381f73bc Maor Gottlieb 2021-04-11  264  	case MLX5_IB_UAPI_DM_TYPE_S=
TEERING_SW_ICM:
831df88381f73bc Maor Gottlieb 2021-04-11  265  		err =3D handle_alloc_dm_sw=
_icm(context, dm,
831df88381f73bc Maor Gottlieb 2021-04-11  266  					     attr, attrs,
831df88381f73bc Maor Gottlieb 2021-04-11  267  					     MLX5_SW_ICM_TYPE_S=
TEERING);
831df88381f73bc Maor Gottlieb 2021-04-11  268  		break;
831df88381f73bc Maor Gottlieb 2021-04-11  269  	case MLX5_IB_UAPI_DM_TYPE_H=
EADER_MODIFY_SW_ICM:
831df88381f73bc Maor Gottlieb 2021-04-11  270  		err =3D handle_alloc_dm_sw=
_icm(context, dm,
831df88381f73bc Maor Gottlieb 2021-04-11  271  					     attr, attrs,
831df88381f73bc Maor Gottlieb 2021-04-11  272  					     MLX5_SW_ICM_TYPE_H=
EADER_MODIFY);
831df88381f73bc Maor Gottlieb 2021-04-11  273  		break;
831df88381f73bc Maor Gottlieb 2021-04-11  274  	default:
831df88381f73bc Maor Gottlieb 2021-04-11  275  		err =3D -EOPNOTSUPP;
831df88381f73bc Maor Gottlieb 2021-04-11  276  	}
831df88381f73bc Maor Gottlieb 2021-04-11  277  =

831df88381f73bc Maor Gottlieb 2021-04-11  278  	if (err)
831df88381f73bc Maor Gottlieb 2021-04-11  279  		goto err_free;
831df88381f73bc Maor Gottlieb 2021-04-11  280  =

831df88381f73bc Maor Gottlieb 2021-04-11  281  	return &dm->ibdm;
831df88381f73bc Maor Gottlieb 2021-04-11  282  =

831df88381f73bc Maor Gottlieb 2021-04-11  283  err_free:
831df88381f73bc Maor Gottlieb 2021-04-11  284  	kfree(dm);
831df88381f73bc Maor Gottlieb 2021-04-11  285  	return ERR_PTR(err);
831df88381f73bc Maor Gottlieb 2021-04-11  286  }
831df88381f73bc Maor Gottlieb 2021-04-11  287  =


---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0615660581522707215==--

