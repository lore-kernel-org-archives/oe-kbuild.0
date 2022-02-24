Content-Type: multipart/mixed; boundary="===============3053978581890864744=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [chenxing:msc313_mainlining 46/93] drivers/gpio/gpiolib.c:1166 gpiochip_hierarchy_irq_domain_alloc() warn: variable dereferenced before check 'd->parent' (see line 1155)
Date: Thu, 24 Feb 2022 08:14:36 +0800
Message-ID: <202202240817.tUm7FhAK-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3053978581890864744==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Daniel Palmer <daniel@0x0f.com>

tree:   git://github.com/linux-chenxing/linux.git msc313_mainlining
head:   99a396728dcff78ca3eddcbd2085f11eeb8a01b8
commit: b1c18474d73ad17638f8369a7e8be6582a12c1ee [46/93] gpiolib: Move sett=
ing the flow handler and don't set it at all if there is a parent domain
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
config: x86_64-randconfig-m001-20220221 (https://download.01.org/0day-ci/ar=
chive/20220224/202202240817.tUm7FhAK-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/gpio/gpiolib.c:1166 gpiochip_hierarchy_irq_domain_alloc() warn: var=
iable dereferenced before check 'd->parent' (see line 1155)

vim +1166 drivers/gpio/gpiolib.c

fdd61a013a24f2 Linus Walleij 2019-08-08  1106  =

fdd61a013a24f2 Linus Walleij 2019-08-08  1107  static int gpiochip_hierarch=
y_irq_domain_alloc(struct irq_domain *d,
fdd61a013a24f2 Linus Walleij 2019-08-08  1108  					       unsigned int irq,
fdd61a013a24f2 Linus Walleij 2019-08-08  1109  					       unsigned int nr_=
irqs,
fdd61a013a24f2 Linus Walleij 2019-08-08  1110  					       void *data)
fdd61a013a24f2 Linus Walleij 2019-08-08  1111  {
fdd61a013a24f2 Linus Walleij 2019-08-08  1112  	struct gpio_chip *gc =3D d-=
>host_data;
fdd61a013a24f2 Linus Walleij 2019-08-08  1113  	irq_hw_number_t hwirq;
fdd61a013a24f2 Linus Walleij 2019-08-08  1114  	unsigned int type =3D IRQ_T=
YPE_NONE;
fdd61a013a24f2 Linus Walleij 2019-08-08  1115  	struct irq_fwspec *fwspec =
=3D data;
24258761671057 Kevin Hao     2020-01-14  1116  	void *parent_arg;
fdd61a013a24f2 Linus Walleij 2019-08-08  1117  	unsigned int parent_hwirq;
fdd61a013a24f2 Linus Walleij 2019-08-08  1118  	unsigned int parent_type;
fdd61a013a24f2 Linus Walleij 2019-08-08  1119  	struct gpio_irq_chip *girq =
=3D &gc->irq;
fdd61a013a24f2 Linus Walleij 2019-08-08  1120  	int ret;
fdd61a013a24f2 Linus Walleij 2019-08-08  1121  =

fdd61a013a24f2 Linus Walleij 2019-08-08  1122  	/*
fdd61a013a24f2 Linus Walleij 2019-08-08  1123  	 * The nr_irqs parameter is=
 always one except for PCI multi-MSI
fdd61a013a24f2 Linus Walleij 2019-08-08  1124  	 * so this should not happe=
n.
fdd61a013a24f2 Linus Walleij 2019-08-08  1125  	 */
fdd61a013a24f2 Linus Walleij 2019-08-08  1126  	WARN_ON(nr_irqs !=3D 1);
fdd61a013a24f2 Linus Walleij 2019-08-08  1127  =

fdd61a013a24f2 Linus Walleij 2019-08-08  1128  	ret =3D gc->irq.child_irq_d=
omain_ops.translate(d, fwspec, &hwirq, &type);
fdd61a013a24f2 Linus Walleij 2019-08-08  1129  	if (ret)
fdd61a013a24f2 Linus Walleij 2019-08-08  1130  		return ret;
fdd61a013a24f2 Linus Walleij 2019-08-08  1131  =

366950eeb6ee7b Kevin Hao     2020-01-20  1132  	chip_dbg(gc, "allocate IRQ =
%d, hwirq %lu\n", irq,  hwirq);
fdd61a013a24f2 Linus Walleij 2019-08-08  1133  =

fdd61a013a24f2 Linus Walleij 2019-08-08  1134  	ret =3D girq->child_to_pare=
nt_hwirq(gc, hwirq, type,
fdd61a013a24f2 Linus Walleij 2019-08-08  1135  					  &parent_hwirq, &paren=
t_type);
fdd61a013a24f2 Linus Walleij 2019-08-08  1136  	if (ret) {
fdd61a013a24f2 Linus Walleij 2019-08-08  1137  		chip_err(gc, "can't look u=
p hwirq %lu\n", hwirq);
fdd61a013a24f2 Linus Walleij 2019-08-08  1138  		return ret;
fdd61a013a24f2 Linus Walleij 2019-08-08  1139  	}
366950eeb6ee7b Kevin Hao     2020-01-20  1140  	chip_dbg(gc, "found parent =
hwirq %u\n", parent_hwirq);
fdd61a013a24f2 Linus Walleij 2019-08-08  1141  =

fdd61a013a24f2 Linus Walleij 2019-08-08  1142  	/* This parent only handles=
 asserted level IRQs */
24258761671057 Kevin Hao     2020-01-14  1143  	parent_arg =3D girq->popula=
te_parent_alloc_arg(gc, parent_hwirq, parent_type);
24258761671057 Kevin Hao     2020-01-14  1144  	if (!parent_arg)
24258761671057 Kevin Hao     2020-01-14  1145  		return -ENOMEM;
24258761671057 Kevin Hao     2020-01-14  1146  =

366950eeb6ee7b Kevin Hao     2020-01-20  1147  	chip_dbg(gc, "alloc_irqs_pa=
rent for %d parent hwirq %d\n",
fdd61a013a24f2 Linus Walleij 2019-08-08  1148  		  irq, parent_hwirq);
c34f6dc8c9e6bb Stephen Boyd  2020-01-14  1149  	irq_set_lockdep_class(irq, =
gc->irq.lock_key, gc->irq.request_key);
24258761671057 Kevin Hao     2020-01-14  1150  	ret =3D irq_domain_alloc_ir=
qs_parent(d, irq, 1, parent_arg);
880b7cf22e8ca0 Kevin Hao     2020-01-14  1151  	/*
880b7cf22e8ca0 Kevin Hao     2020-01-14  1152  	 * If the parent irqdomain =
is msi, the interrupts have already
880b7cf22e8ca0 Kevin Hao     2020-01-14  1153  	 * been allocated, so the E=
EXIST is good.
880b7cf22e8ca0 Kevin Hao     2020-01-14  1154  	 */
880b7cf22e8ca0 Kevin Hao     2020-01-14 @1155  	if (irq_domain_is_msi(d->pa=
rent) && (ret =3D=3D -EEXIST))
880b7cf22e8ca0 Kevin Hao     2020-01-14  1156  		ret =3D 0;
fdd61a013a24f2 Linus Walleij 2019-08-08  1157  	if (ret)
fdd61a013a24f2 Linus Walleij 2019-08-08  1158  		chip_err(gc,
fdd61a013a24f2 Linus Walleij 2019-08-08  1159  			 "failed to allocate pare=
nt hwirq %d for hwirq %lu\n",
fdd61a013a24f2 Linus Walleij 2019-08-08  1160  			 parent_hwirq, hwirq);
fdd61a013a24f2 Linus Walleij 2019-08-08  1161  =

24258761671057 Kevin Hao     2020-01-14  1162  	kfree(parent_arg);
b1c18474d73ad1 Daniel Palmer 2021-09-30  1163  =

b1c18474d73ad1 Daniel Palmer 2021-09-30  1164  	if (!ret) {
b1c18474d73ad1 Daniel Palmer 2021-09-30  1165  		/* If there is a parent do=
main leave the flow handler alone */
b1c18474d73ad1 Daniel Palmer 2021-09-30 @1166  		if (d->parent)
b1c18474d73ad1 Daniel Palmer 2021-09-30  1167  			irq_domain_set_hwirq_and_=
chip(d,
b1c18474d73ad1 Daniel Palmer 2021-09-30  1168  						      irq,
b1c18474d73ad1 Daniel Palmer 2021-09-30  1169  						      hwirq,
b1c18474d73ad1 Daniel Palmer 2021-09-30  1170  						      gc->irq.chip,
b1c18474d73ad1 Daniel Palmer 2021-09-30  1171  						      gc);
b1c18474d73ad1 Daniel Palmer 2021-09-30  1172  		/* Otherwise set the flow =
handler supplied by the gpio driver */
b1c18474d73ad1 Daniel Palmer 2021-09-30  1173  		else
b1c18474d73ad1 Daniel Palmer 2021-09-30  1174  			irq_domain_set_info(d,
b1c18474d73ad1 Daniel Palmer 2021-09-30  1175  					    irq,
b1c18474d73ad1 Daniel Palmer 2021-09-30  1176  					    hwirq,
b1c18474d73ad1 Daniel Palmer 2021-09-30  1177  					    gc->irq.chip,
b1c18474d73ad1 Daniel Palmer 2021-09-30  1178  					    gc,
b1c18474d73ad1 Daniel Palmer 2021-09-30  1179  					    girq->handler,
b1c18474d73ad1 Daniel Palmer 2021-09-30  1180  					    NULL, NULL);
b1c18474d73ad1 Daniel Palmer 2021-09-30  1181  		irq_set_probe(irq);
b1c18474d73ad1 Daniel Palmer 2021-09-30  1182  	}
b1c18474d73ad1 Daniel Palmer 2021-09-30  1183  =

fdd61a013a24f2 Linus Walleij 2019-08-08  1184  	return ret;
fdd61a013a24f2 Linus Walleij 2019-08-08  1185  }
fdd61a013a24f2 Linus Walleij 2019-08-08  1186  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3053978581890864744==--

