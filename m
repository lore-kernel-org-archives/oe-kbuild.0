Content-Type: multipart/mixed; boundary="===============0985590420800347225=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/infiniband/hw/mlx5/odp.c:1541 mlx5r_odp_create_eq() warn: missing error code 'err'
Date: Fri, 26 Nov 2021 16:43:56 +0800
Message-ID: <202111261644.TxVvfVGX-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0985590420800347225==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Shay Drory <shayd@nvidia.com>
CC: Jason Gunthorpe <jgg@nvidia.com>
CC: Maor Gottlieb <maorg@nvidia.com>
CC: Leon Romanovsky <leonro@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   a4849f6000e29235a2707f22e39da6b897bb9543
commit: ad50294d4d6b573654cddf09a689592414b28b45 RDMA/mlx5: Create ODP EQ o=
nly when ODP MR is created
date:   8 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 8 months ago
config: ia64-randconfig-m031-20211122 (https://download.01.org/0day-ci/arch=
ive/20211126/202111261644.TxVvfVGX-lkp(a)intel.com/config)
compiler: ia64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/infiniband/hw/mlx5/odp.c:1541 mlx5r_odp_create_eq() warn: missing e=
rror code 'err'

vim +/err +1541 drivers/infiniband/hw/mlx5/odp.c

d5d284b829a6eb7 Saeed Mahameed  2018-11-19  1533  =

ad50294d4d6b573 Shay Drory      2021-03-14  1534  int mlx5r_odp_create_eq(s=
truct mlx5_ib_dev *dev, struct mlx5_ib_pf_eq *eq)
d5d284b829a6eb7 Saeed Mahameed  2018-11-19  1535  {
d5d284b829a6eb7 Saeed Mahameed  2018-11-19  1536  	struct mlx5_eq_param par=
am =3D {};
ad50294d4d6b573 Shay Drory      2021-03-14  1537  	int err =3D 0;
d5d284b829a6eb7 Saeed Mahameed  2018-11-19  1538  =

ad50294d4d6b573 Shay Drory      2021-03-14  1539  	mutex_lock(&dev->odp_eq_=
mutex);
ad50294d4d6b573 Shay Drory      2021-03-14  1540  	if (eq->core)
ad50294d4d6b573 Shay Drory      2021-03-14 @1541  		goto unlock;
d5d284b829a6eb7 Saeed Mahameed  2018-11-19  1542  	INIT_WORK(&eq->work, mlx=
5_ib_eq_pf_action);
d5d284b829a6eb7 Saeed Mahameed  2018-11-19  1543  	spin_lock_init(&eq->lock=
);
d5d284b829a6eb7 Saeed Mahameed  2018-11-19  1544  	eq->dev =3D dev;
d5d284b829a6eb7 Saeed Mahameed  2018-11-19  1545  =

d5d284b829a6eb7 Saeed Mahameed  2018-11-19  1546  	eq->pool =3D mempool_cre=
ate_kmalloc_pool(MLX5_IB_NUM_PF_DRAIN,
d5d284b829a6eb7 Saeed Mahameed  2018-11-19  1547  					       sizeof(struct=
 mlx5_pagefault));
ad50294d4d6b573 Shay Drory      2021-03-14  1548  	if (!eq->pool) {
ad50294d4d6b573 Shay Drory      2021-03-14  1549  		err =3D -ENOMEM;
ad50294d4d6b573 Shay Drory      2021-03-14  1550  		goto unlock;
ad50294d4d6b573 Shay Drory      2021-03-14  1551  	}
d5d284b829a6eb7 Saeed Mahameed  2018-11-19  1552  =

d5d284b829a6eb7 Saeed Mahameed  2018-11-19  1553  	eq->wq =3D alloc_workque=
ue("mlx5_ib_page_fault",
d5d284b829a6eb7 Saeed Mahameed  2018-11-19  1554  				 WQ_HIGHPRI | WQ_UNBO=
UND | WQ_MEM_RECLAIM,
d5d284b829a6eb7 Saeed Mahameed  2018-11-19  1555  				 MLX5_NUM_CMD_EQE);
d5d284b829a6eb7 Saeed Mahameed  2018-11-19  1556  	if (!eq->wq) {
d5d284b829a6eb7 Saeed Mahameed  2018-11-19  1557  		err =3D -ENOMEM;
d5d284b829a6eb7 Saeed Mahameed  2018-11-19  1558  		goto err_mempool;
d5d284b829a6eb7 Saeed Mahameed  2018-11-19  1559  	}
d5d284b829a6eb7 Saeed Mahameed  2018-11-19  1560  =

ca390799c2aa036 Yuval Avnery    2019-06-10  1561  	eq->irq_nb.notifier_call=
 =3D mlx5_ib_eq_pf_int;
d5d284b829a6eb7 Saeed Mahameed  2018-11-19  1562  	param =3D (struct mlx5_e=
q_param){
81bfa206032a67f Ariel Levkovich 2019-06-10  1563  		.irq_index =3D 0,
d5d284b829a6eb7 Saeed Mahameed  2018-11-19  1564  		.nent =3D MLX5_IB_NUM_P=
F_EQE,
d5d284b829a6eb7 Saeed Mahameed  2018-11-19  1565  	};
b9a7ba556207485 Yishai Hadas    2019-06-30  1566  	param.mask[0] =3D 1ull <=
< MLX5_EVENT_TYPE_PAGE_FAULT;
24163189da487b4 Yuval Avnery    2019-06-10  1567  	eq->core =3D mlx5_eq_cre=
ate_generic(dev->mdev, &param);
d5d284b829a6eb7 Saeed Mahameed  2018-11-19  1568  	if (IS_ERR(eq->core)) {
d5d284b829a6eb7 Saeed Mahameed  2018-11-19  1569  		err =3D PTR_ERR(eq->cor=
e);
d5d284b829a6eb7 Saeed Mahameed  2018-11-19  1570  		goto err_wq;
d5d284b829a6eb7 Saeed Mahameed  2018-11-19  1571  	}
1f8a7bee27e63d7 Yuval Avnery    2019-06-10  1572  	err =3D mlx5_eq_enable(d=
ev->mdev, eq->core, &eq->irq_nb);
1f8a7bee27e63d7 Yuval Avnery    2019-06-10  1573  	if (err) {
1f8a7bee27e63d7 Yuval Avnery    2019-06-10  1574  		mlx5_ib_err(dev, "faile=
d to enable odp EQ %d\n", err);
1f8a7bee27e63d7 Yuval Avnery    2019-06-10  1575  		goto err_eq;
1f8a7bee27e63d7 Yuval Avnery    2019-06-10  1576  	}
d5d284b829a6eb7 Saeed Mahameed  2018-11-19  1577  =

ad50294d4d6b573 Shay Drory      2021-03-14  1578  	mutex_unlock(&dev->odp_e=
q_mutex);
d5d284b829a6eb7 Saeed Mahameed  2018-11-19  1579  	return 0;
1f8a7bee27e63d7 Yuval Avnery    2019-06-10  1580  err_eq:
1f8a7bee27e63d7 Yuval Avnery    2019-06-10  1581  	mlx5_eq_destroy_generic(=
dev->mdev, eq->core);
d5d284b829a6eb7 Saeed Mahameed  2018-11-19  1582  err_wq:
ad50294d4d6b573 Shay Drory      2021-03-14  1583  	eq->core =3D NULL;
d5d284b829a6eb7 Saeed Mahameed  2018-11-19  1584  	destroy_workqueue(eq->wq=
);
d5d284b829a6eb7 Saeed Mahameed  2018-11-19  1585  err_mempool:
d5d284b829a6eb7 Saeed Mahameed  2018-11-19  1586  	mempool_destroy(eq->pool=
);
ad50294d4d6b573 Shay Drory      2021-03-14  1587  unlock:
ad50294d4d6b573 Shay Drory      2021-03-14  1588  	mutex_unlock(&dev->odp_e=
q_mutex);
d5d284b829a6eb7 Saeed Mahameed  2018-11-19  1589  	return err;
d5d284b829a6eb7 Saeed Mahameed  2018-11-19  1590  }
d5d284b829a6eb7 Saeed Mahameed  2018-11-19  1591  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0985590420800347225==--

