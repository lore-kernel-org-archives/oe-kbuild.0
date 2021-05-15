Content-Type: multipart/mixed; boundary="===============8503065398273492330=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [arm-platforms:irq/domain_cleanup 25/25] drivers/irqchip/irq-al-fic.c:114:15: warning: Unused variable: irq [unusedVariable]
Date: Sun, 16 May 2021 01:48:35 +0800
Message-ID: <202105160131.Clk132Ls-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8503065398273492330==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-arm-kernel(a)lists.infradead.org
TO: Marc Zyngier <maz@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.g=
it irq/domain_cleanup
head:   dee94333f76d0bd7b6c8302e377654b6e103b71b
commit: dee94333f76d0bd7b6c8302e377654b6e103b71b [25/25] irqchip: Bulk conv=
ersion to generic_handle_domain_irq()
:::::: branch date: 4 hours ago
:::::: commit date: 4 hours ago
compiler: alpha-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/irqchip/irq-al-fic.c:114:15: warning: Unused variable: irq [unus=
edVariable]
    unsigned int irq;
                 ^

vim +114 drivers/irqchip/irq-al-fic.c

1eb77c3bcdb70f Talel Shenhar 2019-06-10  106  =

1eb77c3bcdb70f Talel Shenhar 2019-06-10  107  static void al_fic_irq_handle=
r(struct irq_desc *desc)
1eb77c3bcdb70f Talel Shenhar 2019-06-10  108  {
1eb77c3bcdb70f Talel Shenhar 2019-06-10  109  	struct al_fic *fic =3D irq_d=
esc_get_handler_data(desc);
1eb77c3bcdb70f Talel Shenhar 2019-06-10  110  	struct irq_domain *domain =
=3D fic->domain;
1eb77c3bcdb70f Talel Shenhar 2019-06-10  111  	struct irq_chip *irqchip =3D=
 irq_desc_get_chip(desc);
1eb77c3bcdb70f Talel Shenhar 2019-06-10  112  	struct irq_chip_generic *gc =
=3D irq_get_domain_generic_chip(domain, 0);
1eb77c3bcdb70f Talel Shenhar 2019-06-10  113  	unsigned long pending;
1eb77c3bcdb70f Talel Shenhar 2019-06-10 @114  	unsigned int irq;
1eb77c3bcdb70f Talel Shenhar 2019-06-10  115  	u32 hwirq;
1eb77c3bcdb70f Talel Shenhar 2019-06-10  116  =

1eb77c3bcdb70f Talel Shenhar 2019-06-10  117  	chained_irq_enter(irqchip, d=
esc);
1eb77c3bcdb70f Talel Shenhar 2019-06-10  118  =

1eb77c3bcdb70f Talel Shenhar 2019-06-10  119  	pending =3D readl_relaxed(fi=
c->base + AL_FIC_CAUSE);
1eb77c3bcdb70f Talel Shenhar 2019-06-10  120  	pending &=3D ~gc->mask_cache;
1eb77c3bcdb70f Talel Shenhar 2019-06-10  121  =

dee94333f76d0b Marc Zyngier  2021-05-04  122  	for_each_set_bit(hwirq, &pen=
ding, NR_FIC_IRQS)
dee94333f76d0b Marc Zyngier  2021-05-04  123  		generic_handle_domain_irq(d=
omain, hwirq);
1eb77c3bcdb70f Talel Shenhar 2019-06-10  124  =

1eb77c3bcdb70f Talel Shenhar 2019-06-10  125  	chained_irq_exit(irqchip, de=
sc);
1eb77c3bcdb70f Talel Shenhar 2019-06-10  126  }
1eb77c3bcdb70f Talel Shenhar 2019-06-10  127  =


:::::: The code at line 114 was first introduced by commit
:::::: 1eb77c3bcdb70f2501f419b3da45b19acaf01072 irqchip/al-fic: Introduce A=
mazon's Annapurna Labs Fabric Interrupt Controller Driver

:::::: TO: Talel Shenhar <talel@amazon.com>
:::::: CC: Marc Zyngier <marc.zyngier@arm.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8503065398273492330==--

