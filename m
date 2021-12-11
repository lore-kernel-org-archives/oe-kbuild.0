Content-Type: multipart/mixed; boundary="===============0604119502153927438=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/infiniband/hw/mlx5/dm.c:239 mlx5_ib_alloc_dm() error: uninitialized symbol '_val'.
Date: Sun, 12 Dec 2021 07:36:39 +0800
Message-ID: <202112120713.XjxYiB6k-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0604119502153927438==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Maor Gottlieb <maorg@nvidia.com>
CC: Jason Gunthorpe <jgg@nvidia.com>
CC: Leon Romanovsky <leonro@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   eccea80be2576dee642bc6cab20f1a242d58a08c
commit: 831df88381f73bca0f5624b69ab985cac3d036bc RDMA/mlx5: Move all DM log=
ic to separate file
date:   8 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 8 months ago
config: i386-randconfig-m021-20211209 (https://download.01.org/0day-ci/arch=
ive/20211212/202112120713.XjxYiB6k-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/infiniband/hw/mlx5/dm.c:239 mlx5_ib_alloc_dm() error: uninitialized=
 symbol '_val'.

vim +/_val +239 drivers/infiniband/hw/mlx5/dm.c

831df88381f73b Maor Gottlieb 2021-04-11  229  =

831df88381f73b Maor Gottlieb 2021-04-11  230  struct ib_dm *mlx5_ib_alloc_d=
m(struct ib_device *ibdev,
831df88381f73b Maor Gottlieb 2021-04-11  231  			       struct ib_ucontext =
*context,
831df88381f73b Maor Gottlieb 2021-04-11  232  			       struct ib_dm_alloc_=
attr *attr,
831df88381f73b Maor Gottlieb 2021-04-11  233  			       struct uverbs_attr_=
bundle *attrs)
831df88381f73b Maor Gottlieb 2021-04-11  234  {
831df88381f73b Maor Gottlieb 2021-04-11  235  	struct mlx5_ib_dm *dm;
831df88381f73b Maor Gottlieb 2021-04-11  236  	enum mlx5_ib_uapi_dm_type ty=
pe;
831df88381f73b Maor Gottlieb 2021-04-11  237  	int err;
831df88381f73b Maor Gottlieb 2021-04-11  238  =

831df88381f73b Maor Gottlieb 2021-04-11 @239  	err =3D uverbs_get_const_def=
ault(&type, attrs,
831df88381f73b Maor Gottlieb 2021-04-11  240  				       MLX5_IB_ATTR_ALLOC=
_DM_REQ_TYPE,
831df88381f73b Maor Gottlieb 2021-04-11  241  				       MLX5_IB_UAPI_DM_TY=
PE_MEMIC);
831df88381f73b Maor Gottlieb 2021-04-11  242  	if (err)
831df88381f73b Maor Gottlieb 2021-04-11  243  		return ERR_PTR(err);
831df88381f73b Maor Gottlieb 2021-04-11  244  =

831df88381f73b Maor Gottlieb 2021-04-11  245  	mlx5_ib_dbg(to_mdev(ibdev), =
"alloc_dm req: dm_type=3D%d user_length=3D0x%llx log_alignment=3D%d\n",
831df88381f73b Maor Gottlieb 2021-04-11  246  		    type, attr->length, att=
r->alignment);
831df88381f73b Maor Gottlieb 2021-04-11  247  =

831df88381f73b Maor Gottlieb 2021-04-11  248  	err =3D check_dm_type_suppor=
t(to_mdev(ibdev), type);
831df88381f73b Maor Gottlieb 2021-04-11  249  	if (err)
831df88381f73b Maor Gottlieb 2021-04-11  250  		return ERR_PTR(err);
831df88381f73b Maor Gottlieb 2021-04-11  251  =

831df88381f73b Maor Gottlieb 2021-04-11  252  	dm =3D kzalloc(sizeof(*dm), =
GFP_KERNEL);
831df88381f73b Maor Gottlieb 2021-04-11  253  	if (!dm)
831df88381f73b Maor Gottlieb 2021-04-11  254  		return ERR_PTR(-ENOMEM);
831df88381f73b Maor Gottlieb 2021-04-11  255  =

831df88381f73b Maor Gottlieb 2021-04-11  256  	dm->type =3D type;
831df88381f73b Maor Gottlieb 2021-04-11  257  =

831df88381f73b Maor Gottlieb 2021-04-11  258  	switch (type) {
831df88381f73b Maor Gottlieb 2021-04-11  259  	case MLX5_IB_UAPI_DM_TYPE_ME=
MIC:
831df88381f73b Maor Gottlieb 2021-04-11  260  		err =3D handle_alloc_dm_mem=
ic(context, dm,
831df88381f73b Maor Gottlieb 2021-04-11  261  					    attr,
831df88381f73b Maor Gottlieb 2021-04-11  262  					    attrs);
831df88381f73b Maor Gottlieb 2021-04-11  263  		break;
831df88381f73b Maor Gottlieb 2021-04-11  264  	case MLX5_IB_UAPI_DM_TYPE_ST=
EERING_SW_ICM:
831df88381f73b Maor Gottlieb 2021-04-11  265  		err =3D handle_alloc_dm_sw_=
icm(context, dm,
831df88381f73b Maor Gottlieb 2021-04-11  266  					     attr, attrs,
831df88381f73b Maor Gottlieb 2021-04-11  267  					     MLX5_SW_ICM_TYPE_ST=
EERING);
831df88381f73b Maor Gottlieb 2021-04-11  268  		break;
831df88381f73b Maor Gottlieb 2021-04-11  269  	case MLX5_IB_UAPI_DM_TYPE_HE=
ADER_MODIFY_SW_ICM:
831df88381f73b Maor Gottlieb 2021-04-11  270  		err =3D handle_alloc_dm_sw_=
icm(context, dm,
831df88381f73b Maor Gottlieb 2021-04-11  271  					     attr, attrs,
831df88381f73b Maor Gottlieb 2021-04-11  272  					     MLX5_SW_ICM_TYPE_HE=
ADER_MODIFY);
831df88381f73b Maor Gottlieb 2021-04-11  273  		break;
831df88381f73b Maor Gottlieb 2021-04-11  274  	default:
831df88381f73b Maor Gottlieb 2021-04-11  275  		err =3D -EOPNOTSUPP;
831df88381f73b Maor Gottlieb 2021-04-11  276  	}
831df88381f73b Maor Gottlieb 2021-04-11  277  =

831df88381f73b Maor Gottlieb 2021-04-11  278  	if (err)
831df88381f73b Maor Gottlieb 2021-04-11  279  		goto err_free;
831df88381f73b Maor Gottlieb 2021-04-11  280  =

831df88381f73b Maor Gottlieb 2021-04-11  281  	return &dm->ibdm;
831df88381f73b Maor Gottlieb 2021-04-11  282  =

831df88381f73b Maor Gottlieb 2021-04-11  283  err_free:
831df88381f73b Maor Gottlieb 2021-04-11  284  	kfree(dm);
831df88381f73b Maor Gottlieb 2021-04-11  285  	return ERR_PTR(err);
831df88381f73b Maor Gottlieb 2021-04-11  286  }
831df88381f73b Maor Gottlieb 2021-04-11  287  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0604119502153927438==--

