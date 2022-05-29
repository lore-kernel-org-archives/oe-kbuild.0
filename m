Content-Type: multipart/mixed; boundary="===============0883376334685657683=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/dsa/sja1105/sja1105_main.c:521 sja1105_init_l2_forwarding() warn: should '(((1))) << to' be a 64 bit type?
Date: Sun, 29 May 2022 11:45:25 +0800
Message-ID: <202205291142.dQeOKrZs-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0883376334685657683==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Vladimir Oltean <vladimir.oltean@nxp.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   9d004b2f4fea97cde123e7f1939b80e77bf2e695
commit: 3fa212707b8e6026cea6a92faea87f556e0cba9b net: dsa: sja1105: manage =
the forwarding domain towards DSA ports
date:   10 months ago
:::::: branch date: 23 hours ago
:::::: commit date: 10 months ago
config: arc-randconfig-m031-20220524 (https://download.01.org/0day-ci/archi=
ve/20220529/202205291142.dQeOKrZs-lkp(a)intel.com/config)
compiler: arceb-elf-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/net/dsa/sja1105/sja1105_main.c:521 sja1105_init_l2_forwarding() war=
n: should '(((1))) << to' be a 64 bit type?

Old smatch warnings:
drivers/net/dsa/sja1105/sja1105_main.c:49 sja1105_port_allow_traffic() warn=
: should '(((1))) << to' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:57 sja1105_can_forward() warn: shoul=
d '((((1))) << to)' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:129 sja1105_commit_pvid() warn: shou=
ld '((((1))) << port)' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:248 sja1105_init_mii_settings() warn=
: is 'table->entries' large enough for 'struct sja1105_xmii_params_entry'? 0
drivers/net/dsa/sja1105/sja1105_main.c:260 sja1105_init_mii_settings() warn=
: is 'table->entries' large enough for 'struct sja1105_xmii_params_entry'? 0
drivers/net/dsa/sja1105/sja1105_main.c:269 sja1105_init_mii_settings() warn=
: is 'table->entries' large enough for 'struct sja1105_xmii_params_entry'? 0
drivers/net/dsa/sja1105/sja1105_main.c:278 sja1105_init_mii_settings() warn=
: is 'table->entries' large enough for 'struct sja1105_xmii_params_entry'? 0
drivers/net/dsa/sja1105/sja1105_main.c:284 sja1105_init_mii_settings() warn=
: is 'table->entries' large enough for 'struct sja1105_xmii_params_entry'? 0
drivers/net/dsa/sja1105/sja1105_main.c:291 sja1105_init_mii_settings() warn=
: is 'table->entries' large enough for 'struct sja1105_xmii_params_entry'? 0
drivers/net/dsa/sja1105/sja1105_main.c:522 sja1105_init_l2_forwarding() war=
n: should '(((1))) << to' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:543 sja1105_init_l2_forwarding() war=
n: should '(((1))) << to' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:544 sja1105_init_l2_forwarding() war=
n: should '(((1))) << to' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:640 sja1105_init_l2_forwarding_param=
s() warn: is 'table->entries' large enough for 'struct sja1105_l2_forwardin=
g_params_entry'? 0
drivers/net/dsa/sja1105/sja1105_main.c:773 sja1105_init_topology() warn: sh=
ould '(((1))) << port' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:884 sja1105_init_avb_params() warn: =
is 'table->entries' large enough for 'struct sja1105_avb_params_entry'? 0
drivers/net/dsa/sja1105/sja1105_main.c:1351 sja1105_find_static_fdb_entry()=
 warn: should '((((1))) << port)' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:1469 sja1105et_fdb_add() warn: shoul=
d '((((1))) << port)' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:1471 sja1105et_fdb_add() warn: shoul=
d '(((1))) << port' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:1479 sja1105et_fdb_add() warn: shoul=
d '(((1))) << port' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:1565 sja1105pqrs_fdb_add() warn: sho=
uld '(((1))) << port' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:1573 sja1105pqrs_fdb_add() warn: sho=
uld '((((1))) << port)' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:1578 sja1105pqrs_fdb_add() warn: sho=
uld '(((1))) << port' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:1628 sja1105pqrs_fdb_del() warn: sho=
uld '(((1))) << port' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:1697 sja1105_fdb_dump() warn: should=
 '((((1))) << port)' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:1749 sja1105_manage_flood_domains() =
warn: should '(((1))) << to' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:1751 sja1105_manage_flood_domains() =
warn: should '(((1))) << to' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:2244 sja1105_vlan_add() warn: should=
 '(((1))) << port' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:2245 sja1105_vlan_add() warn: should=
 '(((1))) << port' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:2249 sja1105_vlan_add() warn: should=
 '(((1))) << port' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:2558 sja1105_mgmt_xmit() warn: shoul=
d '(((1))) << port' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:2876 sja1105_port_mcast_flood() warn=
: should '(((1))) << to' be a 64 bit type?

vim +521 drivers/net/dsa/sja1105/sja1105_main.c

8aa9ebccae8762 Vladimir Oltean 2019-05-02  472  =

8aa9ebccae8762 Vladimir Oltean 2019-05-02  473  static int sja1105_init_l2_=
forwarding(struct sja1105_private *priv)
8aa9ebccae8762 Vladimir Oltean 2019-05-02  474  {
8aa9ebccae8762 Vladimir Oltean 2019-05-02  475  	struct sja1105_l2_forwardi=
ng_entry *l2fwd;
542043e91df452 Vladimir Oltean 2021-05-24  476  	struct dsa_switch *ds =3D =
priv->ds;
8aa9ebccae8762 Vladimir Oltean 2019-05-02  477  	struct sja1105_table *tabl=
e;
3fa212707b8e60 Vladimir Oltean 2021-08-04  478  	int port, tc;
3fa212707b8e60 Vladimir Oltean 2021-08-04  479  	int from, to;
8aa9ebccae8762 Vladimir Oltean 2019-05-02  480  =

8aa9ebccae8762 Vladimir Oltean 2019-05-02  481  	table =3D &priv->static_co=
nfig.tables[BLK_IDX_L2_FORWARDING];
8aa9ebccae8762 Vladimir Oltean 2019-05-02  482  =

8aa9ebccae8762 Vladimir Oltean 2019-05-02  483  	if (table->entry_count) {
8aa9ebccae8762 Vladimir Oltean 2019-05-02  484  		kfree(table->entries);
8aa9ebccae8762 Vladimir Oltean 2019-05-02  485  		table->entry_count =3D 0;
8aa9ebccae8762 Vladimir Oltean 2019-05-02  486  	}
8aa9ebccae8762 Vladimir Oltean 2019-05-02  487  =

fd6f2c257b0bc0 Vladimir Oltean 2021-05-24  488  	table->entries =3D kcalloc=
(table->ops->max_entry_count,
8aa9ebccae8762 Vladimir Oltean 2019-05-02  489  				 table->ops->unpacked_e=
ntry_size, GFP_KERNEL);
8aa9ebccae8762 Vladimir Oltean 2019-05-02  490  	if (!table->entries)
8aa9ebccae8762 Vladimir Oltean 2019-05-02  491  		return -ENOMEM;
8aa9ebccae8762 Vladimir Oltean 2019-05-02  492  =

fd6f2c257b0bc0 Vladimir Oltean 2021-05-24  493  	table->entry_count =3D tab=
le->ops->max_entry_count;
8aa9ebccae8762 Vladimir Oltean 2019-05-02  494  =

8aa9ebccae8762 Vladimir Oltean 2019-05-02  495  	l2fwd =3D table->entries;
8aa9ebccae8762 Vladimir Oltean 2019-05-02  496  =

3fa212707b8e60 Vladimir Oltean 2021-08-04  497  	/* First 5 entries in the =
L2 Forwarding Table define the forwarding
3fa212707b8e60 Vladimir Oltean 2021-08-04  498  	 * rules and the VLAN PCP =
to ingress queue mapping.
3fa212707b8e60 Vladimir Oltean 2021-08-04  499  	 * Set up the ingress queu=
e mapping first.
3fa212707b8e60 Vladimir Oltean 2021-08-04  500  	 */
3fa212707b8e60 Vladimir Oltean 2021-08-04  501  	for (port =3D 0; port < ds=
->num_ports; port++) {
3fa212707b8e60 Vladimir Oltean 2021-08-04  502  		if (dsa_is_unused_port(ds=
, port))
3fa212707b8e60 Vladimir Oltean 2021-08-04  503  			continue;
3fa212707b8e60 Vladimir Oltean 2021-08-04  504  =

3fa212707b8e60 Vladimir Oltean 2021-08-04  505  		for (tc =3D 0; tc < SJA11=
05_NUM_TC; tc++)
3fa212707b8e60 Vladimir Oltean 2021-08-04  506  			l2fwd[port].vlan_pmap[tc=
] =3D tc;
3fa212707b8e60 Vladimir Oltean 2021-08-04  507  	}
8aa9ebccae8762 Vladimir Oltean 2019-05-02  508  =

3fa212707b8e60 Vladimir Oltean 2021-08-04  509  	/* Then manage the forward=
ing domain for user ports. These can forward
3fa212707b8e60 Vladimir Oltean 2021-08-04  510  	 * only to the always-on d=
omain (CPU port and DSA links)
3fa212707b8e60 Vladimir Oltean 2021-08-04  511  	 */
3fa212707b8e60 Vladimir Oltean 2021-08-04  512  	for (from =3D 0; from < ds=
->num_ports; from++) {
3fa212707b8e60 Vladimir Oltean 2021-08-04  513  		if (!dsa_is_user_port(ds,=
 from))
f238fef1b3de2f Vladimir Oltean 2021-05-24  514  			continue;
f238fef1b3de2f Vladimir Oltean 2021-05-24  515  =

3fa212707b8e60 Vladimir Oltean 2021-08-04  516  		for (to =3D 0; to < ds->n=
um_ports; to++) {
3fa212707b8e60 Vladimir Oltean 2021-08-04  517  			if (!dsa_is_cpu_port(ds,=
 to) &&
3fa212707b8e60 Vladimir Oltean 2021-08-04  518  			    !dsa_is_dsa_port(ds,=
 to))
3fa212707b8e60 Vladimir Oltean 2021-08-04  519  				continue;
8aa9ebccae8762 Vladimir Oltean 2019-05-02  520  =

3fa212707b8e60 Vladimir Oltean 2021-08-04 @521  			l2fwd[from].bc_domain |=
=3D BIT(to);
3fa212707b8e60 Vladimir Oltean 2021-08-04  522  			l2fwd[from].fl_domain |=
=3D BIT(to);
3fa212707b8e60 Vladimir Oltean 2021-08-04  523  =

3fa212707b8e60 Vladimir Oltean 2021-08-04  524  			sja1105_port_allow_traff=
ic(l2fwd, from, to, true);
3fa212707b8e60 Vladimir Oltean 2021-08-04  525  		}
3fa212707b8e60 Vladimir Oltean 2021-08-04  526  	}
3fa212707b8e60 Vladimir Oltean 2021-08-04  527  =

3fa212707b8e60 Vladimir Oltean 2021-08-04  528  	/* Then manage the forward=
ing domain for DSA links and CPU ports (the
3fa212707b8e60 Vladimir Oltean 2021-08-04  529  	 * always-on domain). Thes=
e can send packets to any enabled port except
3fa212707b8e60 Vladimir Oltean 2021-08-04  530  	 * themselves.
7f7ccdea8c730f Vladimir Oltean 2021-02-16  531  	 */
3fa212707b8e60 Vladimir Oltean 2021-08-04  532  	for (from =3D 0; from < ds=
->num_ports; from++) {
3fa212707b8e60 Vladimir Oltean 2021-08-04  533  		if (!dsa_is_cpu_port(ds, =
from) && !dsa_is_dsa_port(ds, from))
3fa212707b8e60 Vladimir Oltean 2021-08-04  534  			continue;
7f7ccdea8c730f Vladimir Oltean 2021-02-16  535  =

3fa212707b8e60 Vladimir Oltean 2021-08-04  536  		for (to =3D 0; to < ds->n=
um_ports; to++) {
3fa212707b8e60 Vladimir Oltean 2021-08-04  537  			if (dsa_is_unused_port(d=
s, to))
8aa9ebccae8762 Vladimir Oltean 2019-05-02  538  				continue;
8aa9ebccae8762 Vladimir Oltean 2019-05-02  539  =

3fa212707b8e60 Vladimir Oltean 2021-08-04  540  			if (from =3D=3D to)
3fa212707b8e60 Vladimir Oltean 2021-08-04  541  				continue;
4d942354950181 Vladimir Oltean 2021-02-12  542  =

3fa212707b8e60 Vladimir Oltean 2021-08-04  543  			l2fwd[from].bc_domain |=
=3D BIT(to);
3fa212707b8e60 Vladimir Oltean 2021-08-04  544  			l2fwd[from].fl_domain |=
=3D BIT(to);
4d942354950181 Vladimir Oltean 2021-02-12  545  =

3fa212707b8e60 Vladimir Oltean 2021-08-04  546  			sja1105_port_allow_traff=
ic(l2fwd, from, to, true);
3fa212707b8e60 Vladimir Oltean 2021-08-04  547  		}
3fa212707b8e60 Vladimir Oltean 2021-08-04  548  	}
3fa212707b8e60 Vladimir Oltean 2021-08-04  549  =

3fa212707b8e60 Vladimir Oltean 2021-08-04  550  	/* Finally, manage the egr=
ess flooding domain. All ports start up with
3fa212707b8e60 Vladimir Oltean 2021-08-04  551  	 * flooding enabled, inclu=
ding the CPU port and DSA links.
3fa212707b8e60 Vladimir Oltean 2021-08-04  552  	 */
3fa212707b8e60 Vladimir Oltean 2021-08-04  553  	for (port =3D 0; port < ds=
->num_ports; port++) {
3fa212707b8e60 Vladimir Oltean 2021-08-04  554  		if (dsa_is_unused_port(ds=
, port))
3fa212707b8e60 Vladimir Oltean 2021-08-04  555  			continue;
3fa212707b8e60 Vladimir Oltean 2021-08-04  556  =

3fa212707b8e60 Vladimir Oltean 2021-08-04  557  		priv->ucast_egress_floods=
 |=3D BIT(port);
3fa212707b8e60 Vladimir Oltean 2021-08-04  558  		priv->bcast_egress_floods=
 |=3D BIT(port);
8aa9ebccae8762 Vladimir Oltean 2019-05-02  559  	}
f238fef1b3de2f Vladimir Oltean 2021-05-24  560  =

8aa9ebccae8762 Vladimir Oltean 2019-05-02  561  	/* Next 8 entries define V=
LAN PCP mapping from ingress to egress.
8aa9ebccae8762 Vladimir Oltean 2019-05-02  562  	 * Create a one-to-one map=
ping.
8aa9ebccae8762 Vladimir Oltean 2019-05-02  563  	 */
3fa212707b8e60 Vladimir Oltean 2021-08-04  564  	for (tc =3D 0; tc < SJA110=
5_NUM_TC; tc++) {
3fa212707b8e60 Vladimir Oltean 2021-08-04  565  		for (port =3D 0; port < d=
s->num_ports; port++) {
3fa212707b8e60 Vladimir Oltean 2021-08-04  566  			if (dsa_is_unused_port(d=
s, port))
f238fef1b3de2f Vladimir Oltean 2021-05-24  567  				continue;
f238fef1b3de2f Vladimir Oltean 2021-05-24  568  =

3fa212707b8e60 Vladimir Oltean 2021-08-04  569  			l2fwd[ds->num_ports + tc=
].vlan_pmap[port] =3D tc;
f238fef1b3de2f Vladimir Oltean 2021-05-24  570  		}
3e77e59bf8cf10 Vladimir Oltean 2021-06-08  571  =

3fa212707b8e60 Vladimir Oltean 2021-08-04  572  		l2fwd[ds->num_ports + tc]=
.type_egrpcp2outputq =3D true;
3e77e59bf8cf10 Vladimir Oltean 2021-06-08  573  	}
3e77e59bf8cf10 Vladimir Oltean 2021-06-08  574  =

3e77e59bf8cf10 Vladimir Oltean 2021-06-08  575  	return 0;
3e77e59bf8cf10 Vladimir Oltean 2021-06-08  576  }
3e77e59bf8cf10 Vladimir Oltean 2021-06-08  577  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0883376334685657683==--

