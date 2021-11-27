Content-Type: multipart/mixed; boundary="===============3108709985822280758=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/ethernet/mellanox/mlx5/core/pci_irq.c:233 irq_request() error: passing non negative 536870911 to ERR_PTR
Date: Sun, 28 Nov 2021 00:42:29 +0800
Message-ID: <202111280034.72b2CZ7M-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3108709985822280758==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Shay Drory <shayd@nvidia.com>
CC: Saeed Mahameed <saeedm@nvidia.com>
CC: Leon Romanovsky <leonro@nvidia.com>
CC: Tariq Toukan <tariqt@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   c5c17547b778975b3d83a73c8d84e8fb5ecf3ba5
commit: c36326d38d933199014aba5a17d384cf52e4b558 net/mlx5: Round-Robin EQs =
over IRQs
date:   6 months ago
:::::: branch date: 20 hours ago
:::::: commit date: 6 months ago
config: microblaze-randconfig-m031-20211011 (https://download.01.org/0day-c=
i/archive/20211128/202111280034.72b2CZ7M-lkp(a)intel.com/config)
compiler: microblaze-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/net/ethernet/mellanox/mlx5/core/pci_irq.c:233 irq_request() error: =
passing non negative 536870911 to ERR_PTR

vim +233 drivers/net/ethernet/mellanox/mlx5/core/pci_irq.c

256cf690af0668 Yuval Avnery    2019-06-10  187  =

71e084e26414b0 Shay Drory      2021-02-23  188  static struct mlx5_irq *irq=
_request(struct mlx5_irq_pool *pool, int i)
256cf690af0668 Yuval Avnery    2019-06-10  189  {
71e084e26414b0 Shay Drory      2021-02-23  190  	struct mlx5_core_dev *dev =
=3D pool->dev;
256cf690af0668 Yuval Avnery    2019-06-10  191  	char name[MLX5_MAX_IRQ_NAM=
E];
2d74524c0106ab Shay Drory      2021-02-23  192  	struct mlx5_irq *irq;
256cf690af0668 Yuval Avnery    2019-06-10  193  	int err;
256cf690af0668 Yuval Avnery    2019-06-10  194  =

fc63dd2a85be1f Shay Drory      2021-02-23  195  	irq =3D kzalloc(sizeof(*ir=
q), GFP_KERNEL);
fc63dd2a85be1f Shay Drory      2021-02-23  196  	if (!irq)
fc63dd2a85be1f Shay Drory      2021-02-23  197  		return ERR_PTR(-ENOMEM);
c38421abcf21d4 Leon Romanovsky 2021-02-23  198  	irq->irqn =3D pci_irq_vect=
or(dev->pdev, i);
71e084e26414b0 Shay Drory      2021-02-23  199  	if (!pool->name[0])
256cf690af0668 Yuval Avnery    2019-06-10  200  		irq_set_name(name, i);
71e084e26414b0 Shay Drory      2021-02-23  201  	else
71e084e26414b0 Shay Drory      2021-02-23  202  		irq_sf_set_name(pool, nam=
e, i);
cf49f41d29467c Yuval Avnery    2019-06-10  203  	ATOMIC_INIT_NOTIFIER_HEAD(=
&irq->nh);
cf49f41d29467c Yuval Avnery    2019-06-10  204  	snprintf(irq->name, MLX5_M=
AX_IRQ_NAME,
256cf690af0668 Yuval Avnery    2019-06-10  205  		 "%s(a)pci:%s", name, pci=
_name(dev->pdev));
e8abebb3a48e86 Shay Drory      2021-02-23  206  	err =3D request_irq(irq->i=
rqn, irq_int_handler, 0, irq->name,
cf49f41d29467c Yuval Avnery    2019-06-10  207  			  &irq->nh);
256cf690af0668 Yuval Avnery    2019-06-10  208  	if (err) {
e8abebb3a48e86 Shay Drory      2021-02-23  209  		mlx5_core_err(dev, "Faile=
d to request irq. err =3D %d\n", err);
2d74524c0106ab Shay Drory      2021-02-23  210  		goto err_req_irq;
256cf690af0668 Yuval Avnery    2019-06-10  211  	}
e4e3f24b822f9d Leon Romanovsky 2021-02-23  212  	if (!zalloc_cpumask_var(&i=
rq->mask, GFP_KERNEL)) {
e4e3f24b822f9d Leon Romanovsky 2021-02-23  213  		mlx5_core_warn(dev, "zall=
oc_cpumask_var failed\n");
2d74524c0106ab Shay Drory      2021-02-23  214  		err =3D -ENOMEM;
2d74524c0106ab Shay Drory      2021-02-23  215  		goto err_cpumask;
e4e3f24b822f9d Leon Romanovsky 2021-02-23  216  	}
c36326d38d9331 Shay Drory      2021-02-23  217  	kref_init(&irq->kref);
c36326d38d9331 Shay Drory      2021-02-23  218  	irq->index =3D i;
c36326d38d9331 Shay Drory      2021-02-23  219  	err =3D xa_err(xa_store(&p=
ool->irqs, irq->index, irq, GFP_KERNEL));
fc63dd2a85be1f Shay Drory      2021-02-23  220  	if (err) {
fc63dd2a85be1f Shay Drory      2021-02-23  221  		mlx5_core_err(dev, "Faile=
d to alloc xa entry for irq(%u). err =3D %d\n",
fc63dd2a85be1f Shay Drory      2021-02-23  222  			      irq->index, err);
fc63dd2a85be1f Shay Drory      2021-02-23  223  		goto err_xa;
fc63dd2a85be1f Shay Drory      2021-02-23  224  	}
71e084e26414b0 Shay Drory      2021-02-23  225  	irq->pool =3D pool;
fc63dd2a85be1f Shay Drory      2021-02-23  226  	return irq;
fc63dd2a85be1f Shay Drory      2021-02-23  227  err_xa:
fc63dd2a85be1f Shay Drory      2021-02-23  228  	free_cpumask_var(irq->mask=
);
2d74524c0106ab Shay Drory      2021-02-23  229  err_cpumask:
2d74524c0106ab Shay Drory      2021-02-23  230  	free_irq(irq->irqn, &irq->=
nh);
2d74524c0106ab Shay Drory      2021-02-23  231  err_req_irq:
fc63dd2a85be1f Shay Drory      2021-02-23  232  	kfree(irq);
fc63dd2a85be1f Shay Drory      2021-02-23 @233  	return ERR_PTR(err);
e8abebb3a48e86 Shay Drory      2021-02-23  234  }
256cf690af0668 Yuval Avnery    2019-06-10  235  =


:::::: The code at line 233 was first introduced by commit
:::::: fc63dd2a85be1f37fb822594101e9219b7be7460 net/mlx5: Change IRQ storag=
e logic from static to dynamic

:::::: TO: Shay Drory <shayd@nvidia.com>
:::::: CC: Saeed Mahameed <saeedm@nvidia.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3108709985822280758==--

