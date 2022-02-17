Content-Type: multipart/mixed; boundary="===============7049628234714313614=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/irqchip/irq-nvic.c:131 nvic_of_init() warn: 'nvic_base' not released on lines: 97.
Date: Thu, 17 Feb 2022 22:28:40 +0800
Message-ID: <202202172219.xHulCgzu-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7049628234714313614==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   f71077a4d84bbe8c7b91b7db7c4ef815755ac5e3
commit: d991bb1c8da842a2a0b9dc83b1005e655783f861 include/linux/compiler-gcc=
.h: sparse can do constant folding of __builtin_bswap*()
date:   10 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 10 months ago
config: arm-randconfig-m031-20220217 (https://download.01.org/0day-ci/archi=
ve/20220217/202202172219.xHulCgzu-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/irqchip/irq-nvic.c:131 nvic_of_init() warn: 'nvic_base' not release=
d on lines: 97.

vim +/nvic_base +131 drivers/irqchip/irq-nvic.c

2d9f59f7bf8ef5 Stefan Agner     2015-05-16   71  =

292ec080491d87 Uwe Kleine-K=C3=B6nig 2013-06-26   72  static int __init nvi=
c_of_init(struct device_node *node,
292ec080491d87 Uwe Kleine-K=C3=B6nig 2013-06-26   73  			       struct devi=
ce_node *parent)
292ec080491d87 Uwe Kleine-K=C3=B6nig 2013-06-26   74  {
292ec080491d87 Uwe Kleine-K=C3=B6nig 2013-06-26   75  	unsigned int clr =3D=
 IRQ_NOREQUEST | IRQ_NOPROBE | IRQ_NOAUTOEN;
292ec080491d87 Uwe Kleine-K=C3=B6nig 2013-06-26   76  	unsigned int irqs, i=
, ret, numbanks;
292ec080491d87 Uwe Kleine-K=C3=B6nig 2013-06-26   77  	void __iomem *nvic_b=
ase;
292ec080491d87 Uwe Kleine-K=C3=B6nig 2013-06-26   78  =

292ec080491d87 Uwe Kleine-K=C3=B6nig 2013-06-26   79  	numbanks =3D (readl_=
relaxed(V7M_SCS_ICTR) &
292ec080491d87 Uwe Kleine-K=C3=B6nig 2013-06-26   80  		    V7M_SCS_ICTR_IN=
TLINESNUM_MASK) + 1;
292ec080491d87 Uwe Kleine-K=C3=B6nig 2013-06-26   81  =

292ec080491d87 Uwe Kleine-K=C3=B6nig 2013-06-26   82  	nvic_base =3D of_iom=
ap(node, 0);
292ec080491d87 Uwe Kleine-K=C3=B6nig 2013-06-26   83  	if (!nvic_base) {
292ec080491d87 Uwe Kleine-K=C3=B6nig 2013-06-26   84  		pr_warn("unable to =
map nvic registers\n");
292ec080491d87 Uwe Kleine-K=C3=B6nig 2013-06-26   85  		return -ENOMEM;
292ec080491d87 Uwe Kleine-K=C3=B6nig 2013-06-26   86  	}
292ec080491d87 Uwe Kleine-K=C3=B6nig 2013-06-26   87  =

292ec080491d87 Uwe Kleine-K=C3=B6nig 2013-06-26   88  	irqs =3D numbanks * =
32;
292ec080491d87 Uwe Kleine-K=C3=B6nig 2013-06-26   89  	if (irqs > NVIC_MAX_=
IRQ)
292ec080491d87 Uwe Kleine-K=C3=B6nig 2013-06-26   90  		irqs =3D NVIC_MAX_I=
RQ;
292ec080491d87 Uwe Kleine-K=C3=B6nig 2013-06-26   91  =

292ec080491d87 Uwe Kleine-K=C3=B6nig 2013-06-26   92  	nvic_irq_domain =3D
2d9f59f7bf8ef5 Stefan Agner     2015-05-16   93  		irq_domain_add_linear(no=
de, irqs, &nvic_irq_domain_ops, NULL);
2d9f59f7bf8ef5 Stefan Agner     2015-05-16   94  =

292ec080491d87 Uwe Kleine-K=C3=B6nig 2013-06-26   95  	if (!nvic_irq_domain=
) {
292ec080491d87 Uwe Kleine-K=C3=B6nig 2013-06-26   96  		pr_warn("Failed to =
allocate irq domain\n");
292ec080491d87 Uwe Kleine-K=C3=B6nig 2013-06-26   97  		return -ENOMEM;
292ec080491d87 Uwe Kleine-K=C3=B6nig 2013-06-26   98  	}
292ec080491d87 Uwe Kleine-K=C3=B6nig 2013-06-26   99  =

5b8aae489a07ac Axel Lin         2013-07-05  100  	ret =3D irq_alloc_domain_=
generic_chips(nvic_irq_domain, 32, 1,
292ec080491d87 Uwe Kleine-K=C3=B6nig 2013-06-26  101  					     "nvic_irq",=
 handle_fasteoi_irq,
292ec080491d87 Uwe Kleine-K=C3=B6nig 2013-06-26  102  					     clr, 0, IRQ=
_GC_INIT_MASK_CACHE);
292ec080491d87 Uwe Kleine-K=C3=B6nig 2013-06-26  103  	if (ret) {
292ec080491d87 Uwe Kleine-K=C3=B6nig 2013-06-26  104  		pr_warn("Failed to =
allocate irq chips\n");
292ec080491d87 Uwe Kleine-K=C3=B6nig 2013-06-26  105  		irq_domain_remove(n=
vic_irq_domain);
292ec080491d87 Uwe Kleine-K=C3=B6nig 2013-06-26  106  		return ret;
292ec080491d87 Uwe Kleine-K=C3=B6nig 2013-06-26  107  	}
292ec080491d87 Uwe Kleine-K=C3=B6nig 2013-06-26  108  =

292ec080491d87 Uwe Kleine-K=C3=B6nig 2013-06-26  109  	for (i =3D 0; i < nu=
mbanks; ++i) {
292ec080491d87 Uwe Kleine-K=C3=B6nig 2013-06-26  110  		struct irq_chip_gen=
eric *gc;
292ec080491d87 Uwe Kleine-K=C3=B6nig 2013-06-26  111  =

292ec080491d87 Uwe Kleine-K=C3=B6nig 2013-06-26  112  		gc =3D irq_get_doma=
in_generic_chip(nvic_irq_domain, 32 * i);
292ec080491d87 Uwe Kleine-K=C3=B6nig 2013-06-26  113  		gc->reg_base =3D nv=
ic_base + 4 * i;
292ec080491d87 Uwe Kleine-K=C3=B6nig 2013-06-26  114  		gc->chip_types[0].r=
egs.enable =3D NVIC_ISER;
292ec080491d87 Uwe Kleine-K=C3=B6nig 2013-06-26  115  		gc->chip_types[0].r=
egs.disable =3D NVIC_ICER;
292ec080491d87 Uwe Kleine-K=C3=B6nig 2013-06-26  116  		gc->chip_types[0].c=
hip.irq_mask =3D irq_gc_mask_disable_reg;
292ec080491d87 Uwe Kleine-K=C3=B6nig 2013-06-26  117  		gc->chip_types[0].c=
hip.irq_unmask =3D irq_gc_unmask_enable_reg;
8b53ec260e601d Daniel Thompson  2014-06-04  118  		/* This is a no-op as en=
d of interrupt is signaled by the
8b53ec260e601d Daniel Thompson  2014-06-04  119  		 * exception return sequ=
ence.
8b53ec260e601d Daniel Thompson  2014-06-04  120  		 */
8b53ec260e601d Daniel Thompson  2014-06-04  121  		gc->chip_types[0].chip.i=
rq_eoi =3D irq_gc_noop;
292ec080491d87 Uwe Kleine-K=C3=B6nig 2013-06-26  122  =

292ec080491d87 Uwe Kleine-K=C3=B6nig 2013-06-26  123  		/* disable interrup=
ts */
292ec080491d87 Uwe Kleine-K=C3=B6nig 2013-06-26  124  		writel_relaxed(~0, =
gc->reg_base + NVIC_ICER);
292ec080491d87 Uwe Kleine-K=C3=B6nig 2013-06-26  125  	}
292ec080491d87 Uwe Kleine-K=C3=B6nig 2013-06-26  126  =

292ec080491d87 Uwe Kleine-K=C3=B6nig 2013-06-26  127  	/* Set priority on a=
ll interrupts */
292ec080491d87 Uwe Kleine-K=C3=B6nig 2013-06-26  128  	for (i =3D 0; i < ir=
qs; i +=3D 4)
292ec080491d87 Uwe Kleine-K=C3=B6nig 2013-06-26  129  		writel_relaxed(0, n=
vic_base + NVIC_IPR + i);
292ec080491d87 Uwe Kleine-K=C3=B6nig 2013-06-26  130  =

292ec080491d87 Uwe Kleine-K=C3=B6nig 2013-06-26 @131  	return 0;

:::::: The code@line 131 was first introduced by commit
:::::: 292ec080491d87c888c29c5e161c10eb86e5961e irqchip: Add support for AR=
Mv7-M NVIC

:::::: TO: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7049628234714313614==--

