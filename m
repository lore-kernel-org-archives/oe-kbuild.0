Content-Type: multipart/mixed; boundary="===============5275353133616521950=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [avpatel:riscv_aia_v1 16/18] drivers/irqchip/irq-riscv-imsic.c:851 imsic_init() warn: possible memory leak of 'priv'
Date: Thu, 08 Jul 2021 10:48:53 +0800
Message-ID: <202107081051.Rool3tJA-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5275353133616521950==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Anup Patel <anup.patel@wdc.com>

tree:   https://github.com/avpatel/linux.git riscv_aia_v1
head:   e4b6f153340e5471c82603f7b08226ba6e2c6249
commit: d180bb1147b8790d605daf66388a2a827806b2ed [16/18] irqchip: Add RISC-=
V incoming MSI controller driver
:::::: branch date: 23 hours ago
:::::: commit date: 23 hours ago
config: riscv-randconfig-m031-20210707 (attached as .config)
compiler: riscv64-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/irqchip/irq-riscv-imsic.c:851 imsic_init() warn: possible memory le=
ak of 'priv'

vim +/priv +851 drivers/irqchip/irq-riscv-imsic.c

d180bb1147b879 Anup Patel 2021-04-26   826  =

d180bb1147b879 Anup Patel 2021-04-26   827  static int __init imsic_init(st=
ruct device_node *node,
d180bb1147b879 Anup Patel 2021-04-26   828  			     struct device_node *par=
ent)
d180bb1147b879 Anup Patel 2021-04-26   829  {
d180bb1147b879 Anup Patel 2021-04-26   830  	struct resource res;
d180bb1147b879 Anup Patel 2021-04-26   831  	phys_addr_t base_addr;
d180bb1147b879 Anup Patel 2021-04-26   832  	int rc, nr_parent_irqs;
d180bb1147b879 Anup Patel 2021-04-26   833  	struct imsic_mmio *mmio;
d180bb1147b879 Anup Patel 2021-04-26   834  	struct imsic_priv *priv;
d180bb1147b879 Anup Patel 2021-04-26   835  	struct imsic_handler *handler;
d180bb1147b879 Anup Patel 2021-04-26   836  	u32 i, tmp, nr_handlers =3D 0;
d180bb1147b879 Anup Patel 2021-04-26   837  =

d180bb1147b879 Anup Patel 2021-04-26   838  	if (imsic_init_done) {
d180bb1147b879 Anup Patel 2021-04-26   839  		pr_err("%pOFP: already initia=
lized hence ignoring\n", node);
d180bb1147b879 Anup Patel 2021-04-26   840  		return -ENODEV;
d180bb1147b879 Anup Patel 2021-04-26   841  	}
d180bb1147b879 Anup Patel 2021-04-26   842  =

d180bb1147b879 Anup Patel 2021-04-26   843  	priv =3D kzalloc(sizeof(*priv)=
, GFP_KERNEL);
d180bb1147b879 Anup Patel 2021-04-26   844  	if (!priv)
d180bb1147b879 Anup Patel 2021-04-26   845  		return -ENOMEM;
d180bb1147b879 Anup Patel 2021-04-26   846  =

d180bb1147b879 Anup Patel 2021-04-26   847  	/* Find number of parent inter=
rupts */
d180bb1147b879 Anup Patel 2021-04-26   848  	nr_parent_irqs =3D of_irq_coun=
t(node);
d180bb1147b879 Anup Patel 2021-04-26   849  	if (!nr_parent_irqs) {
d180bb1147b879 Anup Patel 2021-04-26   850  		pr_err("%pOFP: no parent irqs=
 available\n", node);
d180bb1147b879 Anup Patel 2021-04-26  @851  		return -EINVAL;
d180bb1147b879 Anup Patel 2021-04-26   852  	}
d180bb1147b879 Anup Patel 2021-04-26   853  =

d180bb1147b879 Anup Patel 2021-04-26   854  	/* Find number of guest index =
bits in MSI address */
d180bb1147b879 Anup Patel 2021-04-26   855  	rc =3D of_property_read_u32(no=
de, "imsic,guest-index-bits",
d180bb1147b879 Anup Patel 2021-04-26   856  				  &priv->guest_index_bits);
d180bb1147b879 Anup Patel 2021-04-26   857  	if (rc)
d180bb1147b879 Anup Patel 2021-04-26   858  		priv->guest_index_bits =3D 0;
d180bb1147b879 Anup Patel 2021-04-26   859  	tmp =3D BITS_PER_LONG - IMSIC_=
MMIO_PAGE_SHIFT;
d180bb1147b879 Anup Patel 2021-04-26   860  	if (tmp < priv->guest_index_bi=
ts) {
d180bb1147b879 Anup Patel 2021-04-26   861  		pr_err("%pOFP: guest index bi=
ts too big\n", node);
d180bb1147b879 Anup Patel 2021-04-26   862  		return -EINVAL;
d180bb1147b879 Anup Patel 2021-04-26   863  	}
d180bb1147b879 Anup Patel 2021-04-26   864  =

d180bb1147b879 Anup Patel 2021-04-26   865  	/* Find number of HART index b=
its */
d180bb1147b879 Anup Patel 2021-04-26   866  	rc =3D of_property_read_u32(no=
de, "imsic,hart-index-bits",
d180bb1147b879 Anup Patel 2021-04-26   867  				  &priv->hart_index_bits);
d180bb1147b879 Anup Patel 2021-04-26   868  	if (rc) {
d180bb1147b879 Anup Patel 2021-04-26   869  		/* Assume default value */
d180bb1147b879 Anup Patel 2021-04-26   870  		priv->hart_index_bits =3D __f=
ls(nr_parent_irqs);
d180bb1147b879 Anup Patel 2021-04-26   871  		if (BIT(priv->hart_index_bits=
) < nr_parent_irqs)
d180bb1147b879 Anup Patel 2021-04-26   872  			priv->hart_index_bits++;
d180bb1147b879 Anup Patel 2021-04-26   873  	}
d180bb1147b879 Anup Patel 2021-04-26   874  	tmp =3D BITS_PER_LONG - IMSIC_=
MMIO_PAGE_SHIFT -
d180bb1147b879 Anup Patel 2021-04-26   875  	      priv->guest_index_bits;
d180bb1147b879 Anup Patel 2021-04-26   876  	if (tmp < priv->hart_index_bit=
s) {
d180bb1147b879 Anup Patel 2021-04-26   877  		pr_err("%pOFP: HART index bit=
s too big\n", node);
d180bb1147b879 Anup Patel 2021-04-26   878  		return -EINVAL;
d180bb1147b879 Anup Patel 2021-04-26   879  	}
d180bb1147b879 Anup Patel 2021-04-26   880  =

d180bb1147b879 Anup Patel 2021-04-26   881  	/* Find number of group index =
bits */
d180bb1147b879 Anup Patel 2021-04-26   882  	rc =3D of_property_read_u32(no=
de, "imsic,group-index-bits",
d180bb1147b879 Anup Patel 2021-04-26   883  				  &priv->group_index_bits);
d180bb1147b879 Anup Patel 2021-04-26   884  	if (rc)
d180bb1147b879 Anup Patel 2021-04-26   885  		priv->group_index_bits =3D 0;
d180bb1147b879 Anup Patel 2021-04-26   886  	tmp =3D BITS_PER_LONG - IMSIC_=
MMIO_PAGE_SHIFT -
d180bb1147b879 Anup Patel 2021-04-26   887  	      priv->guest_index_bits -=
 priv->hart_index_bits;
d180bb1147b879 Anup Patel 2021-04-26   888  	if (tmp < priv->group_index_bi=
ts) {
d180bb1147b879 Anup Patel 2021-04-26   889  		pr_err("%pOFP: group index bi=
ts too big\n", node);
d180bb1147b879 Anup Patel 2021-04-26   890  		return -EINVAL;
d180bb1147b879 Anup Patel 2021-04-26   891  	}
d180bb1147b879 Anup Patel 2021-04-26   892  =

d180bb1147b879 Anup Patel 2021-04-26   893  	/* Find first bit position of =
group index */
d180bb1147b879 Anup Patel 2021-04-26   894  	tmp =3D IMSIC_MMIO_PAGE_SHIFT =
+ priv->guest_index_bits +
d180bb1147b879 Anup Patel 2021-04-26   895  	      priv->hart_index_bits;
d180bb1147b879 Anup Patel 2021-04-26   896  	rc =3D of_property_read_u32(no=
de, "imsic,group-index-shift",
d180bb1147b879 Anup Patel 2021-04-26   897  				  &priv->group_index_shift);
d180bb1147b879 Anup Patel 2021-04-26   898  	if (rc)
d180bb1147b879 Anup Patel 2021-04-26   899  		priv->group_index_shift =3D t=
mp;
d180bb1147b879 Anup Patel 2021-04-26   900  	if (priv->group_index_shift < =
tmp) {
d180bb1147b879 Anup Patel 2021-04-26   901  		pr_err("%pOFP: group index sh=
ift too small\n", node);
d180bb1147b879 Anup Patel 2021-04-26   902  		return -EINVAL;
d180bb1147b879 Anup Patel 2021-04-26   903  	}
d180bb1147b879 Anup Patel 2021-04-26   904  	tmp =3D priv->group_index_bits=
 + priv->group_index_shift - 1;
d180bb1147b879 Anup Patel 2021-04-26   905  	if (tmp >=3D BITS_PER_LONG) {
d180bb1147b879 Anup Patel 2021-04-26   906  		pr_err("%pOFP: group index sh=
ift too big\n", node);
d180bb1147b879 Anup Patel 2021-04-26   907  		return -EINVAL;
d180bb1147b879 Anup Patel 2021-04-26   908  	}
d180bb1147b879 Anup Patel 2021-04-26   909  =

d180bb1147b879 Anup Patel 2021-04-26   910  	/* Find number of interrupt id=
entities */
d180bb1147b879 Anup Patel 2021-04-26   911  	rc =3D of_property_read_u32(no=
de, "imsic,num-ids", &priv->nr_ids);
d180bb1147b879 Anup Patel 2021-04-26   912  	if (rc) {
d180bb1147b879 Anup Patel 2021-04-26   913  		pr_err("%pOFP: number of inte=
rrupt identities not found\n",
d180bb1147b879 Anup Patel 2021-04-26   914  		       node);
d180bb1147b879 Anup Patel 2021-04-26   915  		return rc;
d180bb1147b879 Anup Patel 2021-04-26   916  	}
d180bb1147b879 Anup Patel 2021-04-26   917  	if ((priv->nr_ids < IMSIC_MIN_=
ID) ||
d180bb1147b879 Anup Patel 2021-04-26   918  	    (priv->nr_ids >=3D IMSIC_M=
AX_ID) ||
d180bb1147b879 Anup Patel 2021-04-26   919  	    ((priv->nr_ids & IMSIC_MIN=
_ID) !=3D IMSIC_MIN_ID)) {
d180bb1147b879 Anup Patel 2021-04-26   920  		pr_err("%pOFP: invalid number=
 of interrupt identities\n",
d180bb1147b879 Anup Patel 2021-04-26   921  		       node);
d180bb1147b879 Anup Patel 2021-04-26   922  		return -EINVAL;
d180bb1147b879 Anup Patel 2021-04-26   923  	}
d180bb1147b879 Anup Patel 2021-04-26   924  =

d180bb1147b879 Anup Patel 2021-04-26   925  	/* Compute base address */
d180bb1147b879 Anup Patel 2021-04-26   926  	rc =3D of_address_to_resource(=
node, 0, &res);
d180bb1147b879 Anup Patel 2021-04-26   927  	if (rc) {
d180bb1147b879 Anup Patel 2021-04-26   928  		pr_err("%pOFP: first MMIO res=
ource not found\n", node);
d180bb1147b879 Anup Patel 2021-04-26   929  		return -EINVAL;
d180bb1147b879 Anup Patel 2021-04-26   930  	}
d180bb1147b879 Anup Patel 2021-04-26   931  	priv->base_addr =3D res.start;
d180bb1147b879 Anup Patel 2021-04-26   932  	priv->base_addr &=3D ~(BIT(pri=
v->guest_index_bits +
d180bb1147b879 Anup Patel 2021-04-26   933  				 priv->hart_index_bits +
d180bb1147b879 Anup Patel 2021-04-26   934  				 IMSIC_MMIO_PAGE_SHIFT) - 1=
);
d180bb1147b879 Anup Patel 2021-04-26   935  	priv->base_addr &=3D ~((BIT(pr=
iv->group_index_bits) - 1) <<
d180bb1147b879 Anup Patel 2021-04-26   936  			     priv->group_index_shift=
);
d180bb1147b879 Anup Patel 2021-04-26   937  =

d180bb1147b879 Anup Patel 2021-04-26   938  	/* Find number of MMIO registe=
r sets */
d180bb1147b879 Anup Patel 2021-04-26   939  	while (!of_address_to_resource=
(node, priv->num_mmios, &res))
d180bb1147b879 Anup Patel 2021-04-26   940  		priv->num_mmios++;
d180bb1147b879 Anup Patel 2021-04-26   941  =

d180bb1147b879 Anup Patel 2021-04-26   942  	/* Allocate MMIO register sets=
 */
d180bb1147b879 Anup Patel 2021-04-26   943  	priv->mmios =3D kcalloc(priv->=
num_mmios, sizeof(*mmio), GFP_KERNEL);
d180bb1147b879 Anup Patel 2021-04-26   944  	if (!priv->mmios) {
d180bb1147b879 Anup Patel 2021-04-26   945  		rc =3D -ENOMEM;
d180bb1147b879 Anup Patel 2021-04-26   946  		goto out_free_priv;
d180bb1147b879 Anup Patel 2021-04-26   947  	}
d180bb1147b879 Anup Patel 2021-04-26   948  =

d180bb1147b879 Anup Patel 2021-04-26   949  	/* Parse and map MMIO register=
 sets */
d180bb1147b879 Anup Patel 2021-04-26   950  	for (i =3D 0; i < priv->num_mm=
ios; i++) {
d180bb1147b879 Anup Patel 2021-04-26   951  		mmio =3D &priv->mmios[i];
d180bb1147b879 Anup Patel 2021-04-26   952  		rc =3D of_address_to_resource=
(node, i, &res);
d180bb1147b879 Anup Patel 2021-04-26   953  		if (rc) {
d180bb1147b879 Anup Patel 2021-04-26   954  			pr_err("%pOFP: unable to par=
se MMIO regset %d\n",
d180bb1147b879 Anup Patel 2021-04-26   955  				node, i);
d180bb1147b879 Anup Patel 2021-04-26   956  			goto out_iounmap;
d180bb1147b879 Anup Patel 2021-04-26   957  		}
d180bb1147b879 Anup Patel 2021-04-26   958  		mmio->pa =3D res.start;
d180bb1147b879 Anup Patel 2021-04-26   959  		mmio->size =3D res.end - res.=
start + 1;
d180bb1147b879 Anup Patel 2021-04-26   960  =

d180bb1147b879 Anup Patel 2021-04-26   961  		base_addr =3D mmio->pa;
d180bb1147b879 Anup Patel 2021-04-26   962  		base_addr &=3D ~(BIT(priv->gu=
est_index_bits +
d180bb1147b879 Anup Patel 2021-04-26   963  				   priv->hart_index_bits +
d180bb1147b879 Anup Patel 2021-04-26   964  				   IMSIC_MMIO_PAGE_SHIFT) -=
 1);
d180bb1147b879 Anup Patel 2021-04-26   965  		base_addr &=3D ~((BIT(priv->g=
roup_index_bits) - 1) <<
d180bb1147b879 Anup Patel 2021-04-26   966  				priv->group_index_shift);
d180bb1147b879 Anup Patel 2021-04-26   967  		if (base_addr !=3D priv->base=
_addr) {
d180bb1147b879 Anup Patel 2021-04-26   968  			rc =3D -EINVAL;
d180bb1147b879 Anup Patel 2021-04-26   969  			pr_err("%pOFP: address misma=
tch for regset %d\n",
d180bb1147b879 Anup Patel 2021-04-26   970  				node, i);
d180bb1147b879 Anup Patel 2021-04-26   971  			goto out_iounmap;
d180bb1147b879 Anup Patel 2021-04-26   972  		}
d180bb1147b879 Anup Patel 2021-04-26   973  =

d180bb1147b879 Anup Patel 2021-04-26   974  		tmp =3D BIT(priv->guest_index=
_bits) - 1;
d180bb1147b879 Anup Patel 2021-04-26   975  		if ((mmio->size / IMSIC_MMIO_=
PAGE_SZ) & tmp) {
d180bb1147b879 Anup Patel 2021-04-26   976  			rc =3D -EINVAL;
d180bb1147b879 Anup Patel 2021-04-26   977  			pr_err("%pOFP: size mismatch=
 for regset %d\n",
d180bb1147b879 Anup Patel 2021-04-26   978  			       node, i);
d180bb1147b879 Anup Patel 2021-04-26   979  			goto out_iounmap;
d180bb1147b879 Anup Patel 2021-04-26   980  		}
d180bb1147b879 Anup Patel 2021-04-26   981  =

d180bb1147b879 Anup Patel 2021-04-26   982  		mmio->va =3D of_iomap(node, i=
);
d180bb1147b879 Anup Patel 2021-04-26   983  		if (!mmio->va) {
d180bb1147b879 Anup Patel 2021-04-26   984  			rc =3D -EIO;
d180bb1147b879 Anup Patel 2021-04-26   985  			pr_err("%pOFP: unable to map=
 MMIO regset %d\n",
d180bb1147b879 Anup Patel 2021-04-26   986  				node, i);
d180bb1147b879 Anup Patel 2021-04-26   987  			goto out_iounmap;
d180bb1147b879 Anup Patel 2021-04-26   988  		}
d180bb1147b879 Anup Patel 2021-04-26   989  	}
d180bb1147b879 Anup Patel 2021-04-26   990  =

d180bb1147b879 Anup Patel 2021-04-26   991  	/* Initialize interrupt identi=
ty management */
d180bb1147b879 Anup Patel 2021-04-26   992  	rc =3D imsic_ids_init(priv);
d180bb1147b879 Anup Patel 2021-04-26   993  	if (rc) {
d180bb1147b879 Anup Patel 2021-04-26   994  		pr_err("%pOFP: failed to init=
ialize interrupt management\n",
d180bb1147b879 Anup Patel 2021-04-26   995  		       node);
d180bb1147b879 Anup Patel 2021-04-26   996  		goto out_iounmap;
d180bb1147b879 Anup Patel 2021-04-26   997  	}
d180bb1147b879 Anup Patel 2021-04-26   998  =

d180bb1147b879 Anup Patel 2021-04-26   999  	/* Configure handlers for targ=
et CPUs */
d180bb1147b879 Anup Patel 2021-04-26  1000  	for (i =3D 0; i < nr_parent_ir=
qs; i++) {
d180bb1147b879 Anup Patel 2021-04-26  1001  		struct of_phandle_args parent;
d180bb1147b879 Anup Patel 2021-04-26  1002  		unsigned long reloff;
d180bb1147b879 Anup Patel 2021-04-26  1003  		int j, cpu, hartid;
d180bb1147b879 Anup Patel 2021-04-26  1004  =

d180bb1147b879 Anup Patel 2021-04-26  1005  		if (of_irq_parse_one(node, i,=
 &parent)) {
d180bb1147b879 Anup Patel 2021-04-26  1006  			pr_warn("%pOFP: failed to pa=
rse parent irq%d\n",
d180bb1147b879 Anup Patel 2021-04-26  1007  				node, i);
d180bb1147b879 Anup Patel 2021-04-26  1008  			continue;
d180bb1147b879 Anup Patel 2021-04-26  1009  		}
d180bb1147b879 Anup Patel 2021-04-26  1010  =

d180bb1147b879 Anup Patel 2021-04-26  1011  		/*
d180bb1147b879 Anup Patel 2021-04-26  1012  		 * Skip interrupt pages other=
 than external interrupts for
d180bb1147b879 Anup Patel 2021-04-26  1013  		 * out privilege level.
d180bb1147b879 Anup Patel 2021-04-26  1014  		 */
d180bb1147b879 Anup Patel 2021-04-26  1015  		if (parent.args[0] !=3D RV_IR=
Q_EXT) {
d180bb1147b879 Anup Patel 2021-04-26  1016  			pr_warn("%pOFP: invalid hwir=
q for parent irq%d\n",
d180bb1147b879 Anup Patel 2021-04-26  1017  				node, i);
d180bb1147b879 Anup Patel 2021-04-26  1018  			continue;
d180bb1147b879 Anup Patel 2021-04-26  1019  		}
d180bb1147b879 Anup Patel 2021-04-26  1020  =

d180bb1147b879 Anup Patel 2021-04-26  1021  		hartid =3D riscv_of_parent_ha=
rtid(parent.np);
d180bb1147b879 Anup Patel 2021-04-26  1022  		if (hartid < 0) {
d180bb1147b879 Anup Patel 2021-04-26  1023  			pr_warn("%pOFP: hart ID for =
parent irq%d not found\n",
d180bb1147b879 Anup Patel 2021-04-26  1024  				node, i);
d180bb1147b879 Anup Patel 2021-04-26  1025  			continue;
d180bb1147b879 Anup Patel 2021-04-26  1026  		}
d180bb1147b879 Anup Patel 2021-04-26  1027  =

d180bb1147b879 Anup Patel 2021-04-26  1028  		cpu =3D riscv_hartid_to_cpuid=
(hartid);
d180bb1147b879 Anup Patel 2021-04-26  1029  		if (cpu < 0) {
d180bb1147b879 Anup Patel 2021-04-26  1030  			pr_warn("%pOFP: invalid cpui=
d for parent irq%d\n",
d180bb1147b879 Anup Patel 2021-04-26  1031  				node, i);
d180bb1147b879 Anup Patel 2021-04-26  1032  			continue;
d180bb1147b879 Anup Patel 2021-04-26  1033  		}
d180bb1147b879 Anup Patel 2021-04-26  1034  =

d180bb1147b879 Anup Patel 2021-04-26  1035  		/* Find parent domain and reg=
ister chained handler */
d180bb1147b879 Anup Patel 2021-04-26  1036  		if (!imsic_parent_irq && irq_=
find_host(parent.np)) {
d180bb1147b879 Anup Patel 2021-04-26  1037  			imsic_parent_irq =3D irq_of_=
parse_and_map(node, i);
d180bb1147b879 Anup Patel 2021-04-26  1038  			if (imsic_parent_irq)
d180bb1147b879 Anup Patel 2021-04-26  1039  				irq_set_chained_handler(ims=
ic_parent_irq,
d180bb1147b879 Anup Patel 2021-04-26  1040  							imsic_handle_irq);
d180bb1147b879 Anup Patel 2021-04-26  1041  		}
d180bb1147b879 Anup Patel 2021-04-26  1042  =

d180bb1147b879 Anup Patel 2021-04-26  1043  		/* Find MMIO location of MSI =
page */
d180bb1147b879 Anup Patel 2021-04-26  1044  		mmio =3D NULL;
d180bb1147b879 Anup Patel 2021-04-26  1045  		reloff =3D i * BIT(priv->gues=
t_index_bits) *
d180bb1147b879 Anup Patel 2021-04-26  1046  			  IMSIC_MMIO_PAGE_SZ;
d180bb1147b879 Anup Patel 2021-04-26  1047  		for (j =3D 0; priv->num_mmios=
; j++) {
d180bb1147b879 Anup Patel 2021-04-26  1048  			if (reloff < priv->mmios[j].=
size) {
d180bb1147b879 Anup Patel 2021-04-26  1049  				mmio =3D &priv->mmios[j];
d180bb1147b879 Anup Patel 2021-04-26  1050  				break;
d180bb1147b879 Anup Patel 2021-04-26  1051  			}
d180bb1147b879 Anup Patel 2021-04-26  1052  =

d180bb1147b879 Anup Patel 2021-04-26  1053  			reloff -=3D priv->mmios[j].s=
ize;
d180bb1147b879 Anup Patel 2021-04-26  1054  		}
d180bb1147b879 Anup Patel 2021-04-26  1055  		if (!mmio) {
d180bb1147b879 Anup Patel 2021-04-26  1056  			pr_warn("%pOFP: MMIO not fou=
nd for parent irq%d\n",
d180bb1147b879 Anup Patel 2021-04-26  1057  				node, i);
d180bb1147b879 Anup Patel 2021-04-26  1058  			continue;
d180bb1147b879 Anup Patel 2021-04-26  1059  		}
d180bb1147b879 Anup Patel 2021-04-26  1060  =

d180bb1147b879 Anup Patel 2021-04-26  1061  		handler =3D per_cpu_ptr(&imsi=
c_handlers, cpu);
d180bb1147b879 Anup Patel 2021-04-26  1062  		if (handler->priv) {
d180bb1147b879 Anup Patel 2021-04-26  1063  			pr_warn("%pOFP: CPU%d handle=
r already configured.\n",
d180bb1147b879 Anup Patel 2021-04-26  1064  				node, cpu);
d180bb1147b879 Anup Patel 2021-04-26  1065  			goto done;
d180bb1147b879 Anup Patel 2021-04-26  1066  		}
d180bb1147b879 Anup Patel 2021-04-26  1067  =

d180bb1147b879 Anup Patel 2021-04-26  1068  		cpumask_set_cpu(cpu, &priv->l=
mask);
d180bb1147b879 Anup Patel 2021-04-26  1069  		handler->msi_pa =3D mmio->pa =
+ reloff;
d180bb1147b879 Anup Patel 2021-04-26  1070  		handler->msi_va =3D mmio->va =
+ reloff;
d180bb1147b879 Anup Patel 2021-04-26  1071  		handler->priv =3D priv;
d180bb1147b879 Anup Patel 2021-04-26  1072  =

d180bb1147b879 Anup Patel 2021-04-26  1073  done:
d180bb1147b879 Anup Patel 2021-04-26  1074  		nr_handlers++;
d180bb1147b879 Anup Patel 2021-04-26  1075  	}
d180bb1147b879 Anup Patel 2021-04-26  1076  =

d180bb1147b879 Anup Patel 2021-04-26  1077  	/* Initialize IPI domain */
d180bb1147b879 Anup Patel 2021-04-26  1078  	rc =3D imsic_ipi_domain_init(p=
riv, node);
d180bb1147b879 Anup Patel 2021-04-26  1079  	if (rc) {
d180bb1147b879 Anup Patel 2021-04-26  1080  		pr_err("%pOFP: Failed to init=
ialize IPI domain\n", node);
d180bb1147b879 Anup Patel 2021-04-26  1081  		goto out_ids_cleanup;
d180bb1147b879 Anup Patel 2021-04-26  1082  	}
d180bb1147b879 Anup Patel 2021-04-26  1083  =

d180bb1147b879 Anup Patel 2021-04-26  1084  	/* Initialize IRQ and MSI doma=
ins */
d180bb1147b879 Anup Patel 2021-04-26  1085  	rc =3D imsic_irq_domains_init(=
priv, node);
d180bb1147b879 Anup Patel 2021-04-26  1086  	if (rc) {
d180bb1147b879 Anup Patel 2021-04-26  1087  		pr_err("%pOFP: Failed to init=
ialize IRQ and MSI domains\n",
d180bb1147b879 Anup Patel 2021-04-26  1088  		       node);
d180bb1147b879 Anup Patel 2021-04-26  1089  		goto out_ipi_domain_cleanup;
d180bb1147b879 Anup Patel 2021-04-26  1090  	}
d180bb1147b879 Anup Patel 2021-04-26  1091  =

d180bb1147b879 Anup Patel 2021-04-26  1092  	/* Setup cpuhp state */
d180bb1147b879 Anup Patel 2021-04-26  1093  	cpuhp_setup_state(CPUHP_AP_ONL=
INE_DYN,
d180bb1147b879 Anup Patel 2021-04-26  1094  			  "irqchip/riscv/imsic:start=
ing",
d180bb1147b879 Anup Patel 2021-04-26  1095  			  imsic_starting_cpu, imsic_=
dying_cpu);
d180bb1147b879 Anup Patel 2021-04-26  1096  =

d180bb1147b879 Anup Patel 2021-04-26  1097  	/*
d180bb1147b879 Anup Patel 2021-04-26  1098  	 * Only one IMSIC instance all=
owed in a platform for clean
d180bb1147b879 Anup Patel 2021-04-26  1099  	 * implementation of SMP IRQ a=
ffinity and per-CPU IPIs.
d180bb1147b879 Anup Patel 2021-04-26  1100  	 *
d180bb1147b879 Anup Patel 2021-04-26  1101  	 * This means on a multi-socke=
t (or multi-die) platform we
d180bb1147b879 Anup Patel 2021-04-26  1102  	 * will have multiple MMIO reg=
ions for one IMSIC instance.
d180bb1147b879 Anup Patel 2021-04-26  1103  	 */
d180bb1147b879 Anup Patel 2021-04-26  1104  	imsic_init_done =3D true;
d180bb1147b879 Anup Patel 2021-04-26  1105  =

d180bb1147b879 Anup Patel 2021-04-26  1106  	pr_info("%pOFP: mapped %d inte=
rrupts using %d handlers\n",
d180bb1147b879 Anup Patel 2021-04-26  1107  		node, priv->nr_ids, nr_handle=
rs);
d180bb1147b879 Anup Patel 2021-04-26  1108  =

d180bb1147b879 Anup Patel 2021-04-26  1109  	return 0;
d180bb1147b879 Anup Patel 2021-04-26  1110  =

d180bb1147b879 Anup Patel 2021-04-26  1111  out_ipi_domain_cleanup:
d180bb1147b879 Anup Patel 2021-04-26  1112  	imsic_ipi_domain_cleanup(priv);
d180bb1147b879 Anup Patel 2021-04-26  1113  out_ids_cleanup:
d180bb1147b879 Anup Patel 2021-04-26  1114  	imsic_ids_cleanup(priv);
d180bb1147b879 Anup Patel 2021-04-26  1115  out_iounmap:
d180bb1147b879 Anup Patel 2021-04-26  1116  	for (i =3D 0; i < priv->num_mm=
ios; i++) {
d180bb1147b879 Anup Patel 2021-04-26  1117  		if (priv->mmios[i].va)
d180bb1147b879 Anup Patel 2021-04-26  1118  			iounmap(priv->mmios[i].va);
d180bb1147b879 Anup Patel 2021-04-26  1119  	}
d180bb1147b879 Anup Patel 2021-04-26  1120  	kfree(priv->mmios);
d180bb1147b879 Anup Patel 2021-04-26  1121  out_free_priv:
d180bb1147b879 Anup Patel 2021-04-26  1122  	kfree(priv);
d180bb1147b879 Anup Patel 2021-04-26  1123  	return rc;
d180bb1147b879 Anup Patel 2021-04-26  1124  }
d180bb1147b879 Anup Patel 2021-04-26  1125  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============5275353133616521950==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============5275353133616521950==--

