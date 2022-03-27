Content-Type: multipart/mixed; boundary="===============4899909684158380787=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/powerpc/sysdev/xive/common.c:1155:3: warning: %d in format string (no. 1) requires 'int' but the argument type is 'unsigned int'. [invalidPrintfArgType_sint]
Date: Mon, 28 Mar 2022 07:22:10 +0800
Message-ID: <202203280710.GiBVvs6e-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4899909684158380787==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: "C=C3=A9dric Le Goater" <clg@kaod.org>
CC: Michael Ellerman <mpe@ellerman.id.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   50d602d81f35621042fa0cdae25808662caffda8
commit: 7dcc37b3eff97379b194adb17eb9a8270512dd1d powerpc/xive: Map one IPI =
interrupt per node
date:   12 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 12 months ago
compiler: powerpc64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


vim +1155 arch/powerpc/sysdev/xive/common.c

7d348494136c8b C=C3=A9dric Le Goater       2021-03-31  1115  =

7d348494136c8b C=C3=A9dric Le Goater       2021-03-31  1116  static int __i=
nit xive_request_ipi(void)
7d348494136c8b C=C3=A9dric Le Goater       2021-03-31  1117  {
7d348494136c8b C=C3=A9dric Le Goater       2021-03-31  1118  	struct fwnode=
_handle *fwnode;
7d348494136c8b C=C3=A9dric Le Goater       2021-03-31  1119  	struct irq_do=
main *ipi_domain;
7dcc37b3eff973 C=C3=A9dric Le Goater       2021-03-31  1120  	unsigned int =
node;
7d348494136c8b C=C3=A9dric Le Goater       2021-03-31  1121  	int ret =3D -=
ENOMEM;
243e25112d06b3 Benjamin Herrenschmidt 2017-04-05  1122  =

7d348494136c8b C=C3=A9dric Le Goater       2021-03-31  1123  	fwnode =3D ir=
q_domain_alloc_named_fwnode("XIVE-IPI");
7d348494136c8b C=C3=A9dric Le Goater       2021-03-31  1124  	if (!fwnode)
7d348494136c8b C=C3=A9dric Le Goater       2021-03-31  1125  		goto out;
7d348494136c8b C=C3=A9dric Le Goater       2021-03-31  1126  =

7dcc37b3eff973 C=C3=A9dric Le Goater       2021-03-31  1127  	ipi_domain =
=3D irq_domain_create_linear(fwnode, nr_node_ids,
7d348494136c8b C=C3=A9dric Le Goater       2021-03-31  1128  					      &xi=
ve_ipi_irq_domain_ops, NULL);
7d348494136c8b C=C3=A9dric Le Goater       2021-03-31  1129  	if (!ipi_doma=
in)
7d348494136c8b C=C3=A9dric Le Goater       2021-03-31  1130  		goto out_fre=
e_fwnode;
243e25112d06b3 Benjamin Herrenschmidt 2017-04-05  1131  =

7dcc37b3eff973 C=C3=A9dric Le Goater       2021-03-31  1132  	xive_ipis =3D=
 kcalloc(nr_node_ids, sizeof(*xive_ipis), GFP_KERNEL | __GFP_NOFAIL);
7dcc37b3eff973 C=C3=A9dric Le Goater       2021-03-31  1133  	if (!xive_ipi=
s)
7d348494136c8b C=C3=A9dric Le Goater       2021-03-31  1134  		goto out_fre=
e_domain;
7dcc37b3eff973 C=C3=A9dric Le Goater       2021-03-31  1135  =

7dcc37b3eff973 C=C3=A9dric Le Goater       2021-03-31  1136  	for_each_node=
(node) {
7dcc37b3eff973 C=C3=A9dric Le Goater       2021-03-31  1137  		struct xive_=
ipi_desc *xid =3D &xive_ipis[node];
7dcc37b3eff973 C=C3=A9dric Le Goater       2021-03-31  1138  		irq_hw_numbe=
r_t ipi_hwirq =3D node;
7dcc37b3eff973 C=C3=A9dric Le Goater       2021-03-31  1139  =

7dcc37b3eff973 C=C3=A9dric Le Goater       2021-03-31  1140  		/* Skip node=
s without CPUs */
7dcc37b3eff973 C=C3=A9dric Le Goater       2021-03-31  1141  		if (cpumask_=
empty(cpumask_of_node(node)))
7dcc37b3eff973 C=C3=A9dric Le Goater       2021-03-31  1142  			continue;
7dcc37b3eff973 C=C3=A9dric Le Goater       2021-03-31  1143  =

7dcc37b3eff973 C=C3=A9dric Le Goater       2021-03-31  1144  		/*
7dcc37b3eff973 C=C3=A9dric Le Goater       2021-03-31  1145  		 * Map one I=
PI interrupt per node for all cpus of that node.
7dcc37b3eff973 C=C3=A9dric Le Goater       2021-03-31  1146  		 * Since the=
 HW interrupt number doesn't have any meaning,
7dcc37b3eff973 C=C3=A9dric Le Goater       2021-03-31  1147  		 * simply us=
e the node number.
7dcc37b3eff973 C=C3=A9dric Le Goater       2021-03-31  1148  		 */
7dcc37b3eff973 C=C3=A9dric Le Goater       2021-03-31  1149  		xid->irq =3D=
 irq_create_mapping(ipi_domain, ipi_hwirq);
7dcc37b3eff973 C=C3=A9dric Le Goater       2021-03-31  1150  		if (!xid->ir=
q) {
7dcc37b3eff973 C=C3=A9dric Le Goater       2021-03-31  1151  			ret =3D -EI=
NVAL;
7dcc37b3eff973 C=C3=A9dric Le Goater       2021-03-31  1152  			goto out_fr=
ee_xive_ipis;
7d348494136c8b C=C3=A9dric Le Goater       2021-03-31  1153  		}
7d348494136c8b C=C3=A9dric Le Goater       2021-03-31  1154  =

7dcc37b3eff973 C=C3=A9dric Le Goater       2021-03-31 @1155  		snprintf(xid=
->name, sizeof(xid->name), "IPI-%d", node);
7dcc37b3eff973 C=C3=A9dric Le Goater       2021-03-31  1156  =

7dcc37b3eff973 C=C3=A9dric Le Goater       2021-03-31  1157  		ret =3D requ=
est_irq(xid->irq, xive_muxed_ipi_action,
7dcc37b3eff973 C=C3=A9dric Le Goater       2021-03-31  1158  				  IRQF_PER=
CPU | IRQF_NO_THREAD, xid->name, NULL);
243e25112d06b3 Benjamin Herrenschmidt 2017-04-05  1159  =

7dcc37b3eff973 C=C3=A9dric Le Goater       2021-03-31  1160  		WARN(ret < 0=
, "Failed to request IPI %d: %d\n", xid->irq, ret);
7dcc37b3eff973 C=C3=A9dric Le Goater       2021-03-31  1161  	}
7d348494136c8b C=C3=A9dric Le Goater       2021-03-31  1162  =

7d348494136c8b C=C3=A9dric Le Goater       2021-03-31  1163  	return ret;
7d348494136c8b C=C3=A9dric Le Goater       2021-03-31  1164  =

7dcc37b3eff973 C=C3=A9dric Le Goater       2021-03-31  1165  out_free_xive_=
ipis:
7dcc37b3eff973 C=C3=A9dric Le Goater       2021-03-31  1166  	kfree(xive_ip=
is);
7d348494136c8b C=C3=A9dric Le Goater       2021-03-31  1167  out_free_domai=
n:
7d348494136c8b C=C3=A9dric Le Goater       2021-03-31  1168  	irq_domain_re=
move(ipi_domain);
7d348494136c8b C=C3=A9dric Le Goater       2021-03-31  1169  out_free_fwnod=
e:
7d348494136c8b C=C3=A9dric Le Goater       2021-03-31  1170  	irq_domain_fr=
ee_fwnode(fwnode);
7d348494136c8b C=C3=A9dric Le Goater       2021-03-31  1171  out:
7d348494136c8b C=C3=A9dric Le Goater       2021-03-31  1172  	return ret;
243e25112d06b3 Benjamin Herrenschmidt 2017-04-05  1173  }
243e25112d06b3 Benjamin Herrenschmidt 2017-04-05  1174  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4899909684158380787==--

