Content-Type: multipart/mixed; boundary="===============5114157732906389890=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/irqchip/irq-apple-aic.c:941 aic_of_ic_init() error: uninitialized symbol 'off'.
Date: Sat, 04 Jun 2022 10:29:00 +0800
Message-ID: <202206041021.KT16mbyS-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5114157732906389890==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Hector Martin <marcan@marcan.st>
CC: Marc Zyngier <maz@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   1f952675835bfe18d6ae494a5581724d68c52352
commit: dc97fd6fec009957e81026055fc99a03877ff3b8 irqchip/apple-aic: Dynamic=
ally compute register offsets
date:   3 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 3 months ago
config: arm64-randconfig-m031-20220530 (https://download.01.org/0day-ci/arc=
hive/20220604/202206041021.KT16mbyS-lkp(a)intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/irqchip/irq-apple-aic.c:941 aic_of_ic_init() error: uninitialized s=
ymbol 'off'.

Old smatch warnings:
drivers/irqchip/irq-apple-aic.c:920 aic_of_ic_init() warn: possible memory =
leak of 'irqc'
drivers/irqchip/irq-apple-aic.c:998 aic_of_ic_init() warn: 'regs' from of_i=
omap() not released on lines: 914,920.

vim +/off +941 drivers/irqchip/irq-apple-aic.c

b6ca556c352979 Marc Zyngier  2021-02-28   899  =

76cde26394114f Hector Martin 2021-01-21   900  static int __init aic_of_ic_=
init(struct device_node *node, struct device_node *parent)
76cde26394114f Hector Martin 2021-01-21   901  {
76cde26394114f Hector Martin 2021-01-21   902  	int i;
dc97fd6fec0099 Hector Martin 2022-03-10   903  	u32 off;
76cde26394114f Hector Martin 2021-01-21   904  	void __iomem *regs;
76cde26394114f Hector Martin 2021-01-21   905  	struct aic_irq_chip *irqc;
2cf68211664acd Hector Martin 2022-03-10   906  	const struct of_device_id *=
match;
76cde26394114f Hector Martin 2021-01-21   907  =

76cde26394114f Hector Martin 2021-01-21   908  	regs =3D of_iomap(node, 0);
76cde26394114f Hector Martin 2021-01-21   909  	if (WARN_ON(!regs))
76cde26394114f Hector Martin 2021-01-21   910  		return -EIO;
76cde26394114f Hector Martin 2021-01-21   911  =

76cde26394114f Hector Martin 2021-01-21   912  	irqc =3D kzalloc(sizeof(*ir=
qc), GFP_KERNEL);
76cde26394114f Hector Martin 2021-01-21   913  	if (!irqc)
76cde26394114f Hector Martin 2021-01-21   914  		return -ENOMEM;
76cde26394114f Hector Martin 2021-01-21   915  =

76cde26394114f Hector Martin 2021-01-21   916  	irqc->base =3D regs;
76cde26394114f Hector Martin 2021-01-21   917  =

2cf68211664acd Hector Martin 2022-03-10   918  	match =3D of_match_node(aic=
_info_match, node);
2cf68211664acd Hector Martin 2022-03-10   919  	if (!match)
2cf68211664acd Hector Martin 2022-03-10   920  		return -ENODEV;
2cf68211664acd Hector Martin 2022-03-10   921  =

2cf68211664acd Hector Martin 2022-03-10   922  	irqc->info =3D *(struct aic=
_info *)match->data;
2cf68211664acd Hector Martin 2022-03-10   923  =

2cf68211664acd Hector Martin 2022-03-10   924  	aic_irqc =3D irqc;
2cf68211664acd Hector Martin 2022-03-10   925  =

dc97fd6fec0099 Hector Martin 2022-03-10   926  	switch (irqc->info.version)=
 {
dc97fd6fec0099 Hector Martin 2022-03-10   927  	case 1: {
dc97fd6fec0099 Hector Martin 2022-03-10   928  		u32 info;
dc97fd6fec0099 Hector Martin 2022-03-10   929  =

76cde26394114f Hector Martin 2021-01-21   930  		info =3D aic_ic_read(irqc,=
 AIC_INFO);
7c841f5f6fa3f9 Hector Martin 2022-03-10   931  		irqc->nr_irq =3D FIELD_GET=
(AIC_INFO_NR_IRQ, info);
dc97fd6fec0099 Hector Martin 2022-03-10   932  		irqc->max_irq =3D AIC_MAX_=
IRQ;
dc97fd6fec0099 Hector Martin 2022-03-10   933  =

dc97fd6fec0099 Hector Martin 2022-03-10   934  		off =3D irqc->info.target_=
cpu;
dc97fd6fec0099 Hector Martin 2022-03-10   935  		off +=3D sizeof(u32) * irq=
c->max_irq; /* TARGET_CPU */
dc97fd6fec0099 Hector Martin 2022-03-10   936  =

dc97fd6fec0099 Hector Martin 2022-03-10   937  		break;
dc97fd6fec0099 Hector Martin 2022-03-10   938  	}
dc97fd6fec0099 Hector Martin 2022-03-10   939  	}
dc97fd6fec0099 Hector Martin 2022-03-10   940  =

dc97fd6fec0099 Hector Martin 2022-03-10  @941  	irqc->info.sw_set =3D off;
dc97fd6fec0099 Hector Martin 2022-03-10   942  	off +=3D sizeof(u32) * (irq=
c->max_irq >> 5); /* SW_SET */
dc97fd6fec0099 Hector Martin 2022-03-10   943  	irqc->info.sw_clr =3D off;
dc97fd6fec0099 Hector Martin 2022-03-10   944  	off +=3D sizeof(u32) * (irq=
c->max_irq >> 5); /* SW_CLR */
dc97fd6fec0099 Hector Martin 2022-03-10   945  	irqc->info.mask_set =3D off;
dc97fd6fec0099 Hector Martin 2022-03-10   946  	off +=3D sizeof(u32) * (irq=
c->max_irq >> 5); /* MASK_SET */
dc97fd6fec0099 Hector Martin 2022-03-10   947  	irqc->info.mask_clr =3D off;
dc97fd6fec0099 Hector Martin 2022-03-10   948  	off +=3D sizeof(u32) * (irq=
c->max_irq >> 5); /* MASK_CLR */
dc97fd6fec0099 Hector Martin 2022-03-10   949  	off +=3D sizeof(u32) * (irq=
c->max_irq >> 5); /* HW_STATE */
76cde26394114f Hector Martin 2021-01-21   950  =

2cf68211664acd Hector Martin 2022-03-10   951  	if (irqc->info.fast_ipi)
2cf68211664acd Hector Martin 2022-03-10   952  		static_branch_enable(&use_=
fast_ipi);
2cf68211664acd Hector Martin 2022-03-10   953  	else
2cf68211664acd Hector Martin 2022-03-10   954  		static_branch_disable(&use=
_fast_ipi);
2cf68211664acd Hector Martin 2022-03-10   955  =

7c841f5f6fa3f9 Hector Martin 2022-03-10   956  	irqc->hw_domain =3D irq_dom=
ain_create_tree(of_node_to_fwnode(node),
76cde26394114f Hector Martin 2021-01-21   957  						 &aic_irq_domain_ops, =
irqc);
76cde26394114f Hector Martin 2021-01-21   958  	if (WARN_ON(!irqc->hw_domai=
n)) {
76cde26394114f Hector Martin 2021-01-21   959  		iounmap(irqc->base);
76cde26394114f Hector Martin 2021-01-21   960  		kfree(irqc);
76cde26394114f Hector Martin 2021-01-21   961  		return -ENODEV;
76cde26394114f Hector Martin 2021-01-21   962  	}
76cde26394114f Hector Martin 2021-01-21   963  =

76cde26394114f Hector Martin 2021-01-21   964  	irq_domain_update_bus_token=
(irqc->hw_domain, DOMAIN_BUS_WIRED);
76cde26394114f Hector Martin 2021-01-21   965  =

76cde26394114f Hector Martin 2021-01-21   966  	if (aic_init_smp(irqc, node=
)) {
76cde26394114f Hector Martin 2021-01-21   967  		irq_domain_remove(irqc->hw=
_domain);
76cde26394114f Hector Martin 2021-01-21   968  		iounmap(irqc->base);
76cde26394114f Hector Martin 2021-01-21   969  		kfree(irqc);
76cde26394114f Hector Martin 2021-01-21   970  		return -ENODEV;
76cde26394114f Hector Martin 2021-01-21   971  	}
76cde26394114f Hector Martin 2021-01-21   972  =

76cde26394114f Hector Martin 2021-01-21   973  	set_handle_irq(aic_handle_i=
rq);
76cde26394114f Hector Martin 2021-01-21   974  	set_handle_fiq(aic_handle_f=
iq);
76cde26394114f Hector Martin 2021-01-21   975  =

7c841f5f6fa3f9 Hector Martin 2022-03-10   976  	for (i =3D 0; i < BITS_TO_U=
32(irqc->nr_irq); i++)
dc97fd6fec0099 Hector Martin 2022-03-10   977  		aic_ic_write(irqc, irqc->i=
nfo.mask_set + i * 4, U32_MAX);
7c841f5f6fa3f9 Hector Martin 2022-03-10   978  	for (i =3D 0; i < BITS_TO_U=
32(irqc->nr_irq); i++)
dc97fd6fec0099 Hector Martin 2022-03-10   979  		aic_ic_write(irqc, irqc->i=
nfo.sw_clr + i * 4, U32_MAX);
7c841f5f6fa3f9 Hector Martin 2022-03-10   980  	for (i =3D 0; i < irqc->nr_=
irq; i++)
dc97fd6fec0099 Hector Martin 2022-03-10   981  		aic_ic_write(irqc, irqc->i=
nfo.target_cpu + i * 4, 1);
76cde26394114f Hector Martin 2021-01-21   982  =

76cde26394114f Hector Martin 2021-01-21   983  	if (!is_kernel_in_hyp_mode(=
))
76cde26394114f Hector Martin 2021-01-21   984  		pr_info("Kernel running in=
 EL1, mapping interrupts");
76cde26394114f Hector Martin 2021-01-21   985  =

2cf68211664acd Hector Martin 2022-03-10   986  	if (static_branch_likely(&u=
se_fast_ipi))
2cf68211664acd Hector Martin 2022-03-10   987  		pr_info("Using Fast IPIs");
2cf68211664acd Hector Martin 2022-03-10   988  =

76cde26394114f Hector Martin 2021-01-21   989  	cpuhp_setup_state(CPUHP_AP_=
IRQ_APPLE_AIC_STARTING,
76cde26394114f Hector Martin 2021-01-21   990  			  "irqchip/apple-aic/ipi:=
starting",
76cde26394114f Hector Martin 2021-01-21   991  			  aic_init_cpu, NULL);
76cde26394114f Hector Martin 2021-01-21   992  =

b6ca556c352979 Marc Zyngier  2021-02-28   993  	vgic_set_kvm_info(&vgic_inf=
o);
b6ca556c352979 Marc Zyngier  2021-02-28   994  =

dc97fd6fec0099 Hector Martin 2022-03-10   995  	pr_info("Initialized with %=
d/%d IRQs, %d FIQs, %d vIPIs",
dc97fd6fec0099 Hector Martin 2022-03-10   996  		irqc->nr_irq, irqc->max_ir=
q, AIC_NR_FIQ, AIC_NR_SWIPI);
76cde26394114f Hector Martin 2021-01-21   997  =

76cde26394114f Hector Martin 2021-01-21   998  	return 0;
76cde26394114f Hector Martin 2021-01-21   999  }
76cde26394114f Hector Martin 2021-01-21  1000  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5114157732906389890==--

