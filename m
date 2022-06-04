Content-Type: multipart/mixed; boundary="===============5097358237552691184=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/irqchip/irq-apple-aic.c:980 aic_of_ic_init() error: uninitialized symbol 'start_off'.
Date: Sat, 04 Jun 2022 13:31:11 +0800
Message-ID: <202206041300.b8BwT9Np-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5097358237552691184==
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
head:   032dcf09e2bf7c822be25b4abef7a6c913870d98
commit: a801f0ee563b8180caf186493806a145a75b4a3c irqchip/apple-aic: Support=
 multiple dies
date:   3 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 3 months ago
config: arm64-randconfig-m031-20220530 (https://download.01.org/0day-ci/arc=
hive/20220604/202206041300.b8BwT9Np-lkp(a)intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/irqchip/irq-apple-aic.c:980 aic_of_ic_init() error: uninitialized s=
ymbol 'start_off'.

Old smatch warnings:
drivers/irqchip/irq-apple-aic.c:943 aic_of_ic_init() warn: possible memory =
leak of 'irqc'
drivers/irqchip/irq-apple-aic.c:965 aic_of_ic_init() error: uninitialized s=
ymbol 'off'.
drivers/irqchip/irq-apple-aic.c:1029 aic_of_ic_init() warn: 'regs' from of_=
iomap() not released on lines: 937,943.

vim +/start_off +980 drivers/irqchip/irq-apple-aic.c

b6ca556c352979 Marc Zyngier  2021-02-28   922  =

76cde26394114f Hector Martin 2021-01-21   923  static int __init aic_of_ic_=
init(struct device_node *node, struct device_node *parent)
76cde26394114f Hector Martin 2021-01-21   924  {
a801f0ee563b81 Hector Martin 2022-03-10   925  	int i, die;
a801f0ee563b81 Hector Martin 2022-03-10   926  	u32 off, start_off;
76cde26394114f Hector Martin 2021-01-21   927  	void __iomem *regs;
76cde26394114f Hector Martin 2021-01-21   928  	struct aic_irq_chip *irqc;
2cf68211664acd Hector Martin 2022-03-10   929  	const struct of_device_id *=
match;
76cde26394114f Hector Martin 2021-01-21   930  =

76cde26394114f Hector Martin 2021-01-21   931  	regs =3D of_iomap(node, 0);
76cde26394114f Hector Martin 2021-01-21   932  	if (WARN_ON(!regs))
76cde26394114f Hector Martin 2021-01-21   933  		return -EIO;
76cde26394114f Hector Martin 2021-01-21   934  =

76cde26394114f Hector Martin 2021-01-21   935  	irqc =3D kzalloc(sizeof(*ir=
qc), GFP_KERNEL);
76cde26394114f Hector Martin 2021-01-21   936  	if (!irqc)
76cde26394114f Hector Martin 2021-01-21   937  		return -ENOMEM;
76cde26394114f Hector Martin 2021-01-21   938  =

76cde26394114f Hector Martin 2021-01-21   939  	irqc->base =3D regs;
76cde26394114f Hector Martin 2021-01-21   940  =

2cf68211664acd Hector Martin 2022-03-10   941  	match =3D of_match_node(aic=
_info_match, node);
2cf68211664acd Hector Martin 2022-03-10   942  	if (!match)
2cf68211664acd Hector Martin 2022-03-10   943  		return -ENODEV;
2cf68211664acd Hector Martin 2022-03-10   944  =

2cf68211664acd Hector Martin 2022-03-10   945  	irqc->info =3D *(struct aic=
_info *)match->data;
2cf68211664acd Hector Martin 2022-03-10   946  =

2cf68211664acd Hector Martin 2022-03-10   947  	aic_irqc =3D irqc;
2cf68211664acd Hector Martin 2022-03-10   948  =

dc97fd6fec0099 Hector Martin 2022-03-10   949  	switch (irqc->info.version)=
 {
dc97fd6fec0099 Hector Martin 2022-03-10   950  	case 1: {
dc97fd6fec0099 Hector Martin 2022-03-10   951  		u32 info;
dc97fd6fec0099 Hector Martin 2022-03-10   952  =

76cde26394114f Hector Martin 2021-01-21   953  		info =3D aic_ic_read(irqc,=
 AIC_INFO);
7c841f5f6fa3f9 Hector Martin 2022-03-10   954  		irqc->nr_irq =3D FIELD_GET=
(AIC_INFO_NR_IRQ, info);
dc97fd6fec0099 Hector Martin 2022-03-10   955  		irqc->max_irq =3D AIC_MAX_=
IRQ;
a801f0ee563b81 Hector Martin 2022-03-10   956  		irqc->nr_die =3D irqc->max=
_die =3D 1;
dc97fd6fec0099 Hector Martin 2022-03-10   957  =

a801f0ee563b81 Hector Martin 2022-03-10   958  		off =3D start_off =3D irqc=
->info.target_cpu;
dc97fd6fec0099 Hector Martin 2022-03-10   959  		off +=3D sizeof(u32) * irq=
c->max_irq; /* TARGET_CPU */
dc97fd6fec0099 Hector Martin 2022-03-10   960  =

dc97fd6fec0099 Hector Martin 2022-03-10   961  		break;
dc97fd6fec0099 Hector Martin 2022-03-10   962  	}
dc97fd6fec0099 Hector Martin 2022-03-10   963  	}
dc97fd6fec0099 Hector Martin 2022-03-10   964  =

dc97fd6fec0099 Hector Martin 2022-03-10   965  	irqc->info.sw_set =3D off;
dc97fd6fec0099 Hector Martin 2022-03-10   966  	off +=3D sizeof(u32) * (irq=
c->max_irq >> 5); /* SW_SET */
dc97fd6fec0099 Hector Martin 2022-03-10   967  	irqc->info.sw_clr =3D off;
dc97fd6fec0099 Hector Martin 2022-03-10   968  	off +=3D sizeof(u32) * (irq=
c->max_irq >> 5); /* SW_CLR */
dc97fd6fec0099 Hector Martin 2022-03-10   969  	irqc->info.mask_set =3D off;
dc97fd6fec0099 Hector Martin 2022-03-10   970  	off +=3D sizeof(u32) * (irq=
c->max_irq >> 5); /* MASK_SET */
dc97fd6fec0099 Hector Martin 2022-03-10   971  	irqc->info.mask_clr =3D off;
dc97fd6fec0099 Hector Martin 2022-03-10   972  	off +=3D sizeof(u32) * (irq=
c->max_irq >> 5); /* MASK_CLR */
dc97fd6fec0099 Hector Martin 2022-03-10   973  	off +=3D sizeof(u32) * (irq=
c->max_irq >> 5); /* HW_STATE */
76cde26394114f Hector Martin 2021-01-21   974  =

2cf68211664acd Hector Martin 2022-03-10   975  	if (irqc->info.fast_ipi)
2cf68211664acd Hector Martin 2022-03-10   976  		static_branch_enable(&use_=
fast_ipi);
2cf68211664acd Hector Martin 2022-03-10   977  	else
2cf68211664acd Hector Martin 2022-03-10   978  		static_branch_disable(&use=
_fast_ipi);
2cf68211664acd Hector Martin 2022-03-10   979  =

a801f0ee563b81 Hector Martin 2022-03-10  @980  	irqc->info.die_stride =3D o=
ff - start_off;
a801f0ee563b81 Hector Martin 2022-03-10   981  =

7c841f5f6fa3f9 Hector Martin 2022-03-10   982  	irqc->hw_domain =3D irq_dom=
ain_create_tree(of_node_to_fwnode(node),
76cde26394114f Hector Martin 2021-01-21   983  						 &aic_irq_domain_ops, =
irqc);
76cde26394114f Hector Martin 2021-01-21   984  	if (WARN_ON(!irqc->hw_domai=
n)) {
76cde26394114f Hector Martin 2021-01-21   985  		iounmap(irqc->base);
76cde26394114f Hector Martin 2021-01-21   986  		kfree(irqc);
76cde26394114f Hector Martin 2021-01-21   987  		return -ENODEV;
76cde26394114f Hector Martin 2021-01-21   988  	}
76cde26394114f Hector Martin 2021-01-21   989  =

76cde26394114f Hector Martin 2021-01-21   990  	irq_domain_update_bus_token=
(irqc->hw_domain, DOMAIN_BUS_WIRED);
76cde26394114f Hector Martin 2021-01-21   991  =

76cde26394114f Hector Martin 2021-01-21   992  	if (aic_init_smp(irqc, node=
)) {
76cde26394114f Hector Martin 2021-01-21   993  		irq_domain_remove(irqc->hw=
_domain);
76cde26394114f Hector Martin 2021-01-21   994  		iounmap(irqc->base);
76cde26394114f Hector Martin 2021-01-21   995  		kfree(irqc);
76cde26394114f Hector Martin 2021-01-21   996  		return -ENODEV;
76cde26394114f Hector Martin 2021-01-21   997  	}
76cde26394114f Hector Martin 2021-01-21   998  =

76cde26394114f Hector Martin 2021-01-21   999  	set_handle_irq(aic_handle_i=
rq);
76cde26394114f Hector Martin 2021-01-21  1000  	set_handle_fiq(aic_handle_f=
iq);
76cde26394114f Hector Martin 2021-01-21  1001  =

a801f0ee563b81 Hector Martin 2022-03-10  1002  	off =3D 0;
a801f0ee563b81 Hector Martin 2022-03-10  1003  	for (die =3D 0; die < irqc-=
>nr_die; die++) {
7c841f5f6fa3f9 Hector Martin 2022-03-10  1004  		for (i =3D 0; i < BITS_TO_=
U32(irqc->nr_irq); i++)
a801f0ee563b81 Hector Martin 2022-03-10  1005  			aic_ic_write(irqc, irqc->=
info.mask_set + off + i * 4, U32_MAX);
7c841f5f6fa3f9 Hector Martin 2022-03-10  1006  		for (i =3D 0; i < BITS_TO_=
U32(irqc->nr_irq); i++)
a801f0ee563b81 Hector Martin 2022-03-10  1007  			aic_ic_write(irqc, irqc->=
info.sw_clr + off + i * 4, U32_MAX);
a801f0ee563b81 Hector Martin 2022-03-10  1008  		if (irqc->info.target_cpu)
7c841f5f6fa3f9 Hector Martin 2022-03-10  1009  			for (i =3D 0; i < irqc->n=
r_irq; i++)
a801f0ee563b81 Hector Martin 2022-03-10  1010  				aic_ic_write(irqc, irqc-=
>info.target_cpu + off + i * 4, 1);
a801f0ee563b81 Hector Martin 2022-03-10  1011  		off +=3D irqc->info.die_st=
ride;
a801f0ee563b81 Hector Martin 2022-03-10  1012  	}
76cde26394114f Hector Martin 2021-01-21  1013  =

76cde26394114f Hector Martin 2021-01-21  1014  	if (!is_kernel_in_hyp_mode(=
))
76cde26394114f Hector Martin 2021-01-21  1015  		pr_info("Kernel running in=
 EL1, mapping interrupts");
76cde26394114f Hector Martin 2021-01-21  1016  =

2cf68211664acd Hector Martin 2022-03-10  1017  	if (static_branch_likely(&u=
se_fast_ipi))
2cf68211664acd Hector Martin 2022-03-10  1018  		pr_info("Using Fast IPIs");
2cf68211664acd Hector Martin 2022-03-10  1019  =

76cde26394114f Hector Martin 2021-01-21  1020  	cpuhp_setup_state(CPUHP_AP_=
IRQ_APPLE_AIC_STARTING,
76cde26394114f Hector Martin 2021-01-21  1021  			  "irqchip/apple-aic/ipi:=
starting",
76cde26394114f Hector Martin 2021-01-21  1022  			  aic_init_cpu, NULL);
76cde26394114f Hector Martin 2021-01-21  1023  =

b6ca556c352979 Marc Zyngier  2021-02-28  1024  	vgic_set_kvm_info(&vgic_inf=
o);
b6ca556c352979 Marc Zyngier  2021-02-28  1025  =

a801f0ee563b81 Hector Martin 2022-03-10  1026  	pr_info("Initialized with %=
d/%d IRQs * %d/%d die(s), %d FIQs, %d vIPIs",
a801f0ee563b81 Hector Martin 2022-03-10  1027  		irqc->nr_irq, irqc->max_ir=
q, irqc->nr_die, irqc->max_die, AIC_NR_FIQ, AIC_NR_SWIPI);
76cde26394114f Hector Martin 2021-01-21  1028  =

76cde26394114f Hector Martin 2021-01-21  1029  	return 0;
76cde26394114f Hector Martin 2021-01-21  1030  }
76cde26394114f Hector Martin 2021-01-21  1031  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5097358237552691184==--

