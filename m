Content-Type: multipart/mixed; boundary="===============1946080353581224846=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/powerpc/sysdev/xive/common.c:1155:3: warning: %d in format string (no. 1) requires 'int' but the argument type is 'unsigned int'. [invalidPrintfArgType_sint]
Date: Fri, 26 Nov 2021 07:55:34 +0800
Message-ID: <202111260755.MHIV7l35-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1946080353581224846==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: "C=C3=A9dric Le Goater" <clg@kaod.org>
CC: Michael Ellerman <mpe@ellerman.id.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   b501b85957deb17f1fe0a861fee820255519d526
commit: 7dcc37b3eff97379b194adb17eb9a8270512dd1d powerpc/xive: Map one IPI =
interrupt per node
date:   8 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 8 months ago
compiler: powerpc64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


vim +1155 arch/powerpc/sysdev/xive/common.c

7d348494136c8b4 C=C3=A9dric Le Goater       2021-03-31  1115  =

7d348494136c8b4 C=C3=A9dric Le Goater       2021-03-31  1116  static int __=
init xive_request_ipi(void)
7d348494136c8b4 C=C3=A9dric Le Goater       2021-03-31  1117  {
7d348494136c8b4 C=C3=A9dric Le Goater       2021-03-31  1118  	struct fwnod=
e_handle *fwnode;
7d348494136c8b4 C=C3=A9dric Le Goater       2021-03-31  1119  	struct irq_d=
omain *ipi_domain;
7dcc37b3eff9737 C=C3=A9dric Le Goater       2021-03-31  1120  	unsigned int=
 node;
7d348494136c8b4 C=C3=A9dric Le Goater       2021-03-31  1121  	int ret =3D =
-ENOMEM;
243e25112d06b34 Benjamin Herrenschmidt 2017-04-05  1122  =

7d348494136c8b4 C=C3=A9dric Le Goater       2021-03-31  1123  	fwnode =3D i=
rq_domain_alloc_named_fwnode("XIVE-IPI");
7d348494136c8b4 C=C3=A9dric Le Goater       2021-03-31  1124  	if (!fwnode)
7d348494136c8b4 C=C3=A9dric Le Goater       2021-03-31  1125  		goto out;
7d348494136c8b4 C=C3=A9dric Le Goater       2021-03-31  1126  =

7dcc37b3eff9737 C=C3=A9dric Le Goater       2021-03-31  1127  	ipi_domain =
=3D irq_domain_create_linear(fwnode, nr_node_ids,
7d348494136c8b4 C=C3=A9dric Le Goater       2021-03-31  1128  					      &x=
ive_ipi_irq_domain_ops, NULL);
7d348494136c8b4 C=C3=A9dric Le Goater       2021-03-31  1129  	if (!ipi_dom=
ain)
7d348494136c8b4 C=C3=A9dric Le Goater       2021-03-31  1130  		goto out_fr=
ee_fwnode;
243e25112d06b34 Benjamin Herrenschmidt 2017-04-05  1131  =

7dcc37b3eff9737 C=C3=A9dric Le Goater       2021-03-31  1132  	xive_ipis =
=3D kcalloc(nr_node_ids, sizeof(*xive_ipis), GFP_KERNEL | __GFP_NOFAIL);
7dcc37b3eff9737 C=C3=A9dric Le Goater       2021-03-31  1133  	if (!xive_ip=
is)
7d348494136c8b4 C=C3=A9dric Le Goater       2021-03-31  1134  		goto out_fr=
ee_domain;
7dcc37b3eff9737 C=C3=A9dric Le Goater       2021-03-31  1135  =

7dcc37b3eff9737 C=C3=A9dric Le Goater       2021-03-31  1136  	for_each_nod=
e(node) {
7dcc37b3eff9737 C=C3=A9dric Le Goater       2021-03-31  1137  		struct xive=
_ipi_desc *xid =3D &xive_ipis[node];
7dcc37b3eff9737 C=C3=A9dric Le Goater       2021-03-31  1138  		irq_hw_numb=
er_t ipi_hwirq =3D node;
7dcc37b3eff9737 C=C3=A9dric Le Goater       2021-03-31  1139  =

7dcc37b3eff9737 C=C3=A9dric Le Goater       2021-03-31  1140  		/* Skip nod=
es without CPUs */
7dcc37b3eff9737 C=C3=A9dric Le Goater       2021-03-31  1141  		if (cpumask=
_empty(cpumask_of_node(node)))
7dcc37b3eff9737 C=C3=A9dric Le Goater       2021-03-31  1142  			continue;
7dcc37b3eff9737 C=C3=A9dric Le Goater       2021-03-31  1143  =

7dcc37b3eff9737 C=C3=A9dric Le Goater       2021-03-31  1144  		/*
7dcc37b3eff9737 C=C3=A9dric Le Goater       2021-03-31  1145  		 * Map one =
IPI interrupt per node for all cpus of that node.
7dcc37b3eff9737 C=C3=A9dric Le Goater       2021-03-31  1146  		 * Since th=
e HW interrupt number doesn't have any meaning,
7dcc37b3eff9737 C=C3=A9dric Le Goater       2021-03-31  1147  		 * simply u=
se the node number.
7dcc37b3eff9737 C=C3=A9dric Le Goater       2021-03-31  1148  		 */
7dcc37b3eff9737 C=C3=A9dric Le Goater       2021-03-31  1149  		xid->irq =
=3D irq_create_mapping(ipi_domain, ipi_hwirq);
7dcc37b3eff9737 C=C3=A9dric Le Goater       2021-03-31  1150  		if (!xid->i=
rq) {
7dcc37b3eff9737 C=C3=A9dric Le Goater       2021-03-31  1151  			ret =3D -E=
INVAL;
7dcc37b3eff9737 C=C3=A9dric Le Goater       2021-03-31  1152  			goto out_f=
ree_xive_ipis;
7d348494136c8b4 C=C3=A9dric Le Goater       2021-03-31  1153  		}
7d348494136c8b4 C=C3=A9dric Le Goater       2021-03-31  1154  =

7dcc37b3eff9737 C=C3=A9dric Le Goater       2021-03-31 @1155  		snprintf(xi=
d->name, sizeof(xid->name), "IPI-%d", node);
7dcc37b3eff9737 C=C3=A9dric Le Goater       2021-03-31  1156  =

7dcc37b3eff9737 C=C3=A9dric Le Goater       2021-03-31  1157  		ret =3D req=
uest_irq(xid->irq, xive_muxed_ipi_action,
7dcc37b3eff9737 C=C3=A9dric Le Goater       2021-03-31  1158  				  IRQF_PE=
RCPU | IRQF_NO_THREAD, xid->name, NULL);
243e25112d06b34 Benjamin Herrenschmidt 2017-04-05  1159  =

7dcc37b3eff9737 C=C3=A9dric Le Goater       2021-03-31  1160  		WARN(ret < =
0, "Failed to request IPI %d: %d\n", xid->irq, ret);
7dcc37b3eff9737 C=C3=A9dric Le Goater       2021-03-31  1161  	}
7d348494136c8b4 C=C3=A9dric Le Goater       2021-03-31  1162  =

7d348494136c8b4 C=C3=A9dric Le Goater       2021-03-31  1163  	return ret;
7d348494136c8b4 C=C3=A9dric Le Goater       2021-03-31  1164  =

7dcc37b3eff9737 C=C3=A9dric Le Goater       2021-03-31  1165  out_free_xive=
_ipis:
7dcc37b3eff9737 C=C3=A9dric Le Goater       2021-03-31  1166  	kfree(xive_i=
pis);
7d348494136c8b4 C=C3=A9dric Le Goater       2021-03-31  1167  out_free_doma=
in:
7d348494136c8b4 C=C3=A9dric Le Goater       2021-03-31  1168  	irq_domain_r=
emove(ipi_domain);
7d348494136c8b4 C=C3=A9dric Le Goater       2021-03-31  1169  out_free_fwno=
de:
7d348494136c8b4 C=C3=A9dric Le Goater       2021-03-31  1170  	irq_domain_f=
ree_fwnode(fwnode);
7d348494136c8b4 C=C3=A9dric Le Goater       2021-03-31  1171  out:
7d348494136c8b4 C=C3=A9dric Le Goater       2021-03-31  1172  	return ret;
243e25112d06b34 Benjamin Herrenschmidt 2017-04-05  1173  }
243e25112d06b34 Benjamin Herrenschmidt 2017-04-05  1174  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1946080353581224846==--

