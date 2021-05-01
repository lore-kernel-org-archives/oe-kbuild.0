Content-Type: multipart/mixed; boundary="===============3751615132815864291=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/dsa/sja1105/sja1105_main.c:255 sja1105_init_static_fdb() warn: should '(((1))) << port' be a 64 bit type?
Date: Sat, 01 May 2021 14:43:34 +0800
Message-ID: <202105011428.fZdVXFjn-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3751615132815864291==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Vladimir Oltean <vladimir.oltean@nxp.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   9f67672a817ec046f7554a885f0fe0d60e1bf99f
commit: 4d9423549501812dafe6551d4a78db079ea87648 net: dsa: sja1105: offload=
 bridge port flags to device
date:   3 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 3 months ago
config: i386-randconfig-m021-20210501 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/net/dsa/sja1105/sja1105_main.c:255 sja1105_init_static_fdb() warn: =
should '(((1))) << port' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:417 sja1105_init_l2_forwarding() war=
n: should '(((1))) << upstream' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:3370 sja1105_port_mcast_flood() warn=
: should '(((1))) << to' be a 64 bit type?

Old smatch warnings:
drivers/net/dsa/sja1105/sja1105_main.c:48 sja1105_port_allow_traffic() warn=
: should '(((1))) << to' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:185 sja1105_init_mii_settings() warn=
: is 'table->entries' large enough for 'struct sja1105_xmii_params_entry'? 1
drivers/net/dsa/sja1105/sja1105_main.c:188 sja1105_init_mii_settings() warn=
: is 'table->entries' large enough for 'struct sja1105_xmii_params_entry'? 1
drivers/net/dsa/sja1105/sja1105_main.c:194 sja1105_init_mii_settings() warn=
: is 'table->entries' large enough for 'struct sja1105_xmii_params_entry'? 1
drivers/net/dsa/sja1105/sja1105_main.c:199 sja1105_init_mii_settings() warn=
: is 'table->entries' large enough for 'struct sja1105_xmii_params_entry'? 1
drivers/net/dsa/sja1105/sja1105_main.c:359 sja1105_init_static_vlan() warn:=
 should '(((1))) << port' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:360 sja1105_init_static_vlan() warn:=
 should '(((1))) << port' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:418 sja1105_init_l2_forwarding() war=
n: should '(((1))) << upstream' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:591 sja1105_init_avb_params() warn: =
is 'table->entries' large enough for 'struct sja1105_avb_params_entry'? 1
drivers/net/dsa/sja1105/sja1105_main.c:1183 sja1105_find_static_fdb_entry()=
 warn: should '((((1))) << port)' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:1301 sja1105et_fdb_add() warn: shoul=
d '((((1))) << port)' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:1303 sja1105et_fdb_add() warn: shoul=
d '(((1))) << port' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:1311 sja1105et_fdb_add() warn: shoul=
d '(((1))) << port' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:1397 sja1105pqrs_fdb_add() warn: sho=
uld '(((1))) << port' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:1405 sja1105pqrs_fdb_add() warn: sho=
uld '((((1))) << port)' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:1410 sja1105pqrs_fdb_add() warn: sho=
uld '(((1))) << port' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:1460 sja1105pqrs_fdb_del() warn: sho=
uld '(((1))) << port' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:1544 sja1105_fdb_dump() warn: should=
 '((((1))) << port)' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:1865 sja1105_static_config_reload() =
warn: bitwise AND condition is false here
drivers/net/dsa/sja1105/sja1105_main.c:2212 sja1105_build_bridge_vlans() wa=
rn: should '(((1))) << (v->port)' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:2213 sja1105_build_bridge_vlans() wa=
rn: should '(((1))) << (v->port)' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:2215 sja1105_build_bridge_vlans() wa=
rn: should '(((1))) << (v->port)' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:2234 sja1105_build_dsa_8021q_vlans()=
 warn: should '(((1))) << (v->port)' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:2235 sja1105_build_dsa_8021q_vlans()=
 warn: should '(((1))) << (v->port)' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:2237 sja1105_build_dsa_8021q_vlans()=
 warn: should '(((1))) << (v->port)' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:2287 sja1105_build_subvlans() warn: =
should '(((1))) << (v->port)' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:2288 sja1105_build_subvlans() warn: =
should '(((1))) << upstream' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:2289 sja1105_build_subvlans() warn: =
should '(((1))) << (v->port)' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:2290 sja1105_build_subvlans() warn: =
should '(((1))) << upstream' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:2295 sja1105_build_subvlans() warn: =
should '(((1))) << (v->port)' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:2297 sja1105_build_subvlans() warn: =
should '(((1))) << upstream' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:2313 sja1105_build_subvlans() warn: =
should '(((1))) << (v->port)' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:2314 sja1105_build_subvlans() warn: =
should '(((1))) << upstream' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:2454 sja1105_build_crosschip_subvlan=
s() warn: should '(((1))) << (tmp->port)' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:2455 sja1105_build_crosschip_subvlan=
s() warn: should '(((1))) << upstream' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:2463 sja1105_build_crosschip_subvlan=
s() warn: should '(((1))) << (tmp->port)' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:2464 sja1105_build_crosschip_subvlan=
s() warn: should '(((1))) << upstream' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:2489 sja1105_build_crosschip_subvlan=
s() warn: should '(((1))) << upstream' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:2490 sja1105_build_crosschip_subvlan=
s() warn: should '(((1))) << (tmp->port)' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:3026 sja1105_mgmt_xmit() warn: shoul=
d '(((1))) << port' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:3326 sja1105_port_ucast_bcast_flood(=
) warn: should '(((1))) << to' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:3333 sja1105_port_ucast_bcast_flood(=
) warn: should '(((1))) << to' be a 64 bit type?

vim +255 drivers/net/dsa/sja1105/sja1105_main.c

8aa9ebccae8762 Vladimir Oltean 2019-05-02  217  =

8aa9ebccae8762 Vladimir Oltean 2019-05-02  218  static int sja1105_init_sta=
tic_fdb(struct sja1105_private *priv)
8aa9ebccae8762 Vladimir Oltean 2019-05-02  219  {
4d942354950181 Vladimir Oltean 2021-02-12  220  	struct sja1105_l2_lookup_e=
ntry *l2_lookup;
8aa9ebccae8762 Vladimir Oltean 2019-05-02  221  	struct sja1105_table *tabl=
e;
4d942354950181 Vladimir Oltean 2021-02-12  222  	int port;
8aa9ebccae8762 Vladimir Oltean 2019-05-02  223  =

8aa9ebccae8762 Vladimir Oltean 2019-05-02  224  	table =3D &priv->static_co=
nfig.tables[BLK_IDX_L2_LOOKUP];
8aa9ebccae8762 Vladimir Oltean 2019-05-02  225  =

4d942354950181 Vladimir Oltean 2021-02-12  226  	/* We only populate the FD=
B table through dynamic L2 Address Lookup
4d942354950181 Vladimir Oltean 2021-02-12  227  	 * entries, except for a s=
pecial entry at the end which is a catch-all
4d942354950181 Vladimir Oltean 2021-02-12  228  	 * for unknown multicast a=
nd will be used to control flooding domain.
291d1e72b75642 Vladimir Oltean 2019-05-02  229  	 */
8aa9ebccae8762 Vladimir Oltean 2019-05-02  230  	if (table->entry_count) {
8aa9ebccae8762 Vladimir Oltean 2019-05-02  231  		kfree(table->entries);
8aa9ebccae8762 Vladimir Oltean 2019-05-02  232  		table->entry_count =3D 0;
8aa9ebccae8762 Vladimir Oltean 2019-05-02  233  	}
4d942354950181 Vladimir Oltean 2021-02-12  234  =

4d942354950181 Vladimir Oltean 2021-02-12  235  	if (!priv->info->can_limit=
_mcast_flood)
4d942354950181 Vladimir Oltean 2021-02-12  236  		return 0;
4d942354950181 Vladimir Oltean 2021-02-12  237  =

4d942354950181 Vladimir Oltean 2021-02-12  238  	table->entries =3D kcalloc=
(1, table->ops->unpacked_entry_size,
4d942354950181 Vladimir Oltean 2021-02-12  239  				 GFP_KERNEL);
4d942354950181 Vladimir Oltean 2021-02-12  240  	if (!table->entries)
4d942354950181 Vladimir Oltean 2021-02-12  241  		return -ENOMEM;
4d942354950181 Vladimir Oltean 2021-02-12  242  =

4d942354950181 Vladimir Oltean 2021-02-12  243  	table->entry_count =3D 1;
4d942354950181 Vladimir Oltean 2021-02-12  244  	l2_lookup =3D table->entri=
es;
4d942354950181 Vladimir Oltean 2021-02-12  245  =

4d942354950181 Vladimir Oltean 2021-02-12  246  	/* All L2 multicast addres=
ses have an odd first octet */
4d942354950181 Vladimir Oltean 2021-02-12  247  	l2_lookup[0].macaddr =3D S=
JA1105_UNKNOWN_MULTICAST;
4d942354950181 Vladimir Oltean 2021-02-12  248  	l2_lookup[0].mask_macaddr =
=3D SJA1105_UNKNOWN_MULTICAST;
4d942354950181 Vladimir Oltean 2021-02-12  249  	l2_lookup[0].lockeds =3D t=
rue;
4d942354950181 Vladimir Oltean 2021-02-12  250  	l2_lookup[0].index =3D SJA=
1105_MAX_L2_LOOKUP_COUNT - 1;
4d942354950181 Vladimir Oltean 2021-02-12  251  =

4d942354950181 Vladimir Oltean 2021-02-12  252  	/* Flood multicast to ever=
y port by default */
4d942354950181 Vladimir Oltean 2021-02-12  253  	for (port =3D 0; port < pr=
iv->ds->num_ports; port++)
4d942354950181 Vladimir Oltean 2021-02-12  254  		if (!dsa_is_unused_port(p=
riv->ds, port))
4d942354950181 Vladimir Oltean 2021-02-12 @255  			l2_lookup[0].destports |=
=3D BIT(port);
4d942354950181 Vladimir Oltean 2021-02-12  256  =

8aa9ebccae8762 Vladimir Oltean 2019-05-02  257  	return 0;
8aa9ebccae8762 Vladimir Oltean 2019-05-02  258  }
8aa9ebccae8762 Vladimir Oltean 2019-05-02  259  =

8aa9ebccae8762 Vladimir Oltean 2019-05-02  260  static int sja1105_init_l2_=
lookup_params(struct sja1105_private *priv)
8aa9ebccae8762 Vladimir Oltean 2019-05-02  261  {
8aa9ebccae8762 Vladimir Oltean 2019-05-02  262  	struct sja1105_table *tabl=
e;
6c56e167cc1b60 Vladimir Oltean 2019-06-26  263  	u64 max_fdb_entries =3D SJ=
A1105_MAX_L2_LOOKUP_COUNT / SJA1105_NUM_PORTS;
8aa9ebccae8762 Vladimir Oltean 2019-05-02  264  	struct sja1105_l2_lookup_p=
arams_entry default_l2_lookup_params =3D {
8456721dd4ec77 Vladimir Oltean 2019-05-02  265  		/* Learned FDB entries ar=
e forgotten after 300 seconds */
8456721dd4ec77 Vladimir Oltean 2019-05-02  266  		.maxage =3D SJA1105_AGEIN=
G_TIME_MS(300000),
8aa9ebccae8762 Vladimir Oltean 2019-05-02  267  		/* All entries within a F=
DB bin are available for learning */
8aa9ebccae8762 Vladimir Oltean 2019-05-02  268  		.dyn_tbsz =3D SJA1105ET_F=
DB_BIN_SIZE,
1da73821343c7d Vladimir Oltean 2019-06-03  269  		/* And the P/Q/R/S equiva=
lent setting: */
1da73821343c7d Vladimir Oltean 2019-06-03  270  		.start_dynspc =3D 0,
6c56e167cc1b60 Vladimir Oltean 2019-06-26  271  		.maxaddrp =3D {max_fdb_en=
tries, max_fdb_entries, max_fdb_entries,
6c56e167cc1b60 Vladimir Oltean 2019-06-26  272  			     max_fdb_entries, ma=
x_fdb_entries, },
8aa9ebccae8762 Vladimir Oltean 2019-05-02  273  		/* 2^8 + 2^5 + 2^3 + 2^2 =
+ 2^1 + 1 in Koopman notation */
8aa9ebccae8762 Vladimir Oltean 2019-05-02  274  		.poly =3D 0x97,
8aa9ebccae8762 Vladimir Oltean 2019-05-02  275  		/* This selects between I=
ndependent VLAN Learning (IVL) and
8aa9ebccae8762 Vladimir Oltean 2019-05-02  276  		 * Shared VLAN Learning (=
SVL)
8aa9ebccae8762 Vladimir Oltean 2019-05-02  277  		 */
6d7c7d948a2e9f Vladimir Oltean 2019-08-05  278  		.shared_learn =3D true,
8aa9ebccae8762 Vladimir Oltean 2019-05-02  279  		/* Don't discard manageme=
nt traffic based on ENFPORT -
8aa9ebccae8762 Vladimir Oltean 2019-05-02  280  		 * we don't perform SMAC =
port enforcement anyway, so
8aa9ebccae8762 Vladimir Oltean 2019-05-02  281  		 * what we are setting he=
re doesn't matter.
8aa9ebccae8762 Vladimir Oltean 2019-05-02  282  		 */
8aa9ebccae8762 Vladimir Oltean 2019-05-02  283  		.no_enf_hostprt =3D false,
8aa9ebccae8762 Vladimir Oltean 2019-05-02  284  		/* Don't learn SMAC for m=
ac_fltres1 and mac_fltres0.
8aa9ebccae8762 Vladimir Oltean 2019-05-02  285  		 * Maybe correlate with n=
o_linklocal_learn from bridge driver?
8aa9ebccae8762 Vladimir Oltean 2019-05-02  286  		 */
8aa9ebccae8762 Vladimir Oltean 2019-05-02  287  		.no_mgmt_learn =3D true,
1da73821343c7d Vladimir Oltean 2019-06-03  288  		/* P/Q/R/S only */
1da73821343c7d Vladimir Oltean 2019-06-03  289  		.use_static =3D true,
1da73821343c7d Vladimir Oltean 2019-06-03  290  		/* Dynamically learned FD=
B entries can overwrite other (older)
1da73821343c7d Vladimir Oltean 2019-06-03  291  		 * dynamic FDB entries
1da73821343c7d Vladimir Oltean 2019-06-03  292  		 */
1da73821343c7d Vladimir Oltean 2019-06-03  293  		.owr_dyn =3D true,
1da73821343c7d Vladimir Oltean 2019-06-03  294  		.drpnolearn =3D true,
8aa9ebccae8762 Vladimir Oltean 2019-05-02  295  	};
8aa9ebccae8762 Vladimir Oltean 2019-05-02  296  =

8aa9ebccae8762 Vladimir Oltean 2019-05-02  297  	table =3D &priv->static_co=
nfig.tables[BLK_IDX_L2_LOOKUP_PARAMS];
8aa9ebccae8762 Vladimir Oltean 2019-05-02  298  =

8aa9ebccae8762 Vladimir Oltean 2019-05-02  299  	if (table->entry_count) {
8aa9ebccae8762 Vladimir Oltean 2019-05-02  300  		kfree(table->entries);
8aa9ebccae8762 Vladimir Oltean 2019-05-02  301  		table->entry_count =3D 0;
8aa9ebccae8762 Vladimir Oltean 2019-05-02  302  	}
8aa9ebccae8762 Vladimir Oltean 2019-05-02  303  =

8aa9ebccae8762 Vladimir Oltean 2019-05-02  304  	table->entries =3D kcalloc=
(SJA1105_MAX_L2_LOOKUP_PARAMS_COUNT,
8aa9ebccae8762 Vladimir Oltean 2019-05-02  305  				 table->ops->unpacked_e=
ntry_size, GFP_KERNEL);
8aa9ebccae8762 Vladimir Oltean 2019-05-02  306  	if (!table->entries)
8aa9ebccae8762 Vladimir Oltean 2019-05-02  307  		return -ENOMEM;
8aa9ebccae8762 Vladimir Oltean 2019-05-02  308  =

8aa9ebccae8762 Vladimir Oltean 2019-05-02  309  	table->entry_count =3D SJA=
1105_MAX_L2_LOOKUP_PARAMS_COUNT;
8aa9ebccae8762 Vladimir Oltean 2019-05-02  310  =

8aa9ebccae8762 Vladimir Oltean 2019-05-02  311  	/* This table only has a s=
ingle entry */
8aa9ebccae8762 Vladimir Oltean 2019-05-02  312  	((struct sja1105_l2_lookup=
_params_entry *)table->entries)[0] =3D
8aa9ebccae8762 Vladimir Oltean 2019-05-02  313  				default_l2_lookup_param=
s;
8aa9ebccae8762 Vladimir Oltean 2019-05-02  314  =

8aa9ebccae8762 Vladimir Oltean 2019-05-02  315  	return 0;
8aa9ebccae8762 Vladimir Oltean 2019-05-02  316  }
8aa9ebccae8762 Vladimir Oltean 2019-05-02  317  =

8aa9ebccae8762 Vladimir Oltean 2019-05-02  318  static int sja1105_init_sta=
tic_vlan(struct sja1105_private *priv)
8aa9ebccae8762 Vladimir Oltean 2019-05-02  319  {
8aa9ebccae8762 Vladimir Oltean 2019-05-02  320  	struct sja1105_table *tabl=
e;
8aa9ebccae8762 Vladimir Oltean 2019-05-02  321  	struct sja1105_vlan_lookup=
_entry pvid =3D {
8aa9ebccae8762 Vladimir Oltean 2019-05-02  322  		.ving_mirr =3D 0,
8aa9ebccae8762 Vladimir Oltean 2019-05-02  323  		.vegr_mirr =3D 0,
8aa9ebccae8762 Vladimir Oltean 2019-05-02  324  		.vmemb_port =3D 0,
8aa9ebccae8762 Vladimir Oltean 2019-05-02  325  		.vlan_bc =3D 0,
8aa9ebccae8762 Vladimir Oltean 2019-05-02  326  		.tag_port =3D 0,
e3502b82978781 Vladimir Oltean 2019-06-26  327  		.vlanid =3D 1,
8aa9ebccae8762 Vladimir Oltean 2019-05-02  328  	};
ec5ae61076d07b Vladimir Oltean 2020-05-12  329  	struct dsa_switch *ds =3D =
priv->ds;
ec5ae61076d07b Vladimir Oltean 2020-05-12  330  	int port;
8aa9ebccae8762 Vladimir Oltean 2019-05-02  331  =

8aa9ebccae8762 Vladimir Oltean 2019-05-02  332  	table =3D &priv->static_co=
nfig.tables[BLK_IDX_VLAN_LOOKUP];
8aa9ebccae8762 Vladimir Oltean 2019-05-02  333  =

e3502b82978781 Vladimir Oltean 2019-06-26  334  	/* The static VLAN table w=
ill only contain the initial pvid of 1.
6666cebc5e306f Vladimir Oltean 2019-05-02  335  	 * All other VLANs are to =
be configured through dynamic entries,
6666cebc5e306f Vladimir Oltean 2019-05-02  336  	 * and kept in the static =
configuration table as backing memory.
8aa9ebccae8762 Vladimir Oltean 2019-05-02  337  	 */
8aa9ebccae8762 Vladimir Oltean 2019-05-02  338  	if (table->entry_count) {
8aa9ebccae8762 Vladimir Oltean 2019-05-02  339  		kfree(table->entries);
8aa9ebccae8762 Vladimir Oltean 2019-05-02  340  		table->entry_count =3D 0;
8aa9ebccae8762 Vladimir Oltean 2019-05-02  341  	}
8aa9ebccae8762 Vladimir Oltean 2019-05-02  342  =

c75857b055561e Zheng Yongjun   2020-12-29  343  	table->entries =3D kzalloc=
(table->ops->unpacked_entry_size,
8aa9ebccae8762 Vladimir Oltean 2019-05-02  344  				 GFP_KERNEL);
8aa9ebccae8762 Vladimir Oltean 2019-05-02  345  	if (!table->entries)
8aa9ebccae8762 Vladimir Oltean 2019-05-02  346  		return -ENOMEM;
8aa9ebccae8762 Vladimir Oltean 2019-05-02  347  =

8aa9ebccae8762 Vladimir Oltean 2019-05-02  348  	table->entry_count =3D 1;
8aa9ebccae8762 Vladimir Oltean 2019-05-02  349  =

e3502b82978781 Vladimir Oltean 2019-06-26  350  	/* VLAN 1: all DT-defined =
ports are members; no restrictions on
ec5ae61076d07b Vladimir Oltean 2020-05-12  351  	 * forwarding; always tran=
smit as untagged.
8aa9ebccae8762 Vladimir Oltean 2019-05-02  352  	 */
ec5ae61076d07b Vladimir Oltean 2020-05-12  353  	for (port =3D 0; port < ds=
->num_ports; port++) {
ec5ae61076d07b Vladimir Oltean 2020-05-12  354  		struct sja1105_bridge_vla=
n *v;
ec5ae61076d07b Vladimir Oltean 2020-05-12  355  =

ec5ae61076d07b Vladimir Oltean 2020-05-12  356  		if (dsa_is_unused_port(ds=
, port))
ec5ae61076d07b Vladimir Oltean 2020-05-12  357  			continue;
ec5ae61076d07b Vladimir Oltean 2020-05-12  358  =

ec5ae61076d07b Vladimir Oltean 2020-05-12  359  		pvid.vmemb_port |=3D BIT(=
port);
ec5ae61076d07b Vladimir Oltean 2020-05-12  360  		pvid.vlan_bc |=3D BIT(por=
t);
ec5ae61076d07b Vladimir Oltean 2020-05-12  361  		pvid.tag_port &=3D ~BIT(p=
ort);
ec5ae61076d07b Vladimir Oltean 2020-05-12  362  =

ec5ae61076d07b Vladimir Oltean 2020-05-12  363  		/* Let traffic that don't=
 need dsa_8021q (e.g. STP, PTP) be
ec5ae61076d07b Vladimir Oltean 2020-05-12  364  		 * transmitted as untagge=
d.
ec5ae61076d07b Vladimir Oltean 2020-05-12  365  		 */
ec5ae61076d07b Vladimir Oltean 2020-05-12  366  		v =3D kzalloc(sizeof(*v),=
 GFP_KERNEL);
ec5ae61076d07b Vladimir Oltean 2020-05-12  367  		if (!v)
ec5ae61076d07b Vladimir Oltean 2020-05-12  368  			return -ENOMEM;
ec5ae61076d07b Vladimir Oltean 2020-05-12  369  =

ec5ae61076d07b Vladimir Oltean 2020-05-12  370  		v->port =3D port;
ec5ae61076d07b Vladimir Oltean 2020-05-12  371  		v->vid =3D 1;
ec5ae61076d07b Vladimir Oltean 2020-05-12  372  		v->untagged =3D true;
ec5ae61076d07b Vladimir Oltean 2020-05-12  373  		if (dsa_is_cpu_port(ds, p=
ort))
ec5ae61076d07b Vladimir Oltean 2020-05-12  374  			v->pvid =3D true;
ec5ae61076d07b Vladimir Oltean 2020-05-12  375  		list_add(&v->list, &priv-=
>dsa_8021q_vlans);
8aa9ebccae8762 Vladimir Oltean 2019-05-02  376  	}
8aa9ebccae8762 Vladimir Oltean 2019-05-02  377  =

8aa9ebccae8762 Vladimir Oltean 2019-05-02  378  	((struct sja1105_vlan_look=
up_entry *)table->entries)[0] =3D pvid;
8aa9ebccae8762 Vladimir Oltean 2019-05-02  379  	return 0;
8aa9ebccae8762 Vladimir Oltean 2019-05-02  380  }
8aa9ebccae8762 Vladimir Oltean 2019-05-02  381  =

8aa9ebccae8762 Vladimir Oltean 2019-05-02  382  static int sja1105_init_l2_=
forwarding(struct sja1105_private *priv)
8aa9ebccae8762 Vladimir Oltean 2019-05-02  383  {
8aa9ebccae8762 Vladimir Oltean 2019-05-02  384  	struct sja1105_l2_forwardi=
ng_entry *l2fwd;
8aa9ebccae8762 Vladimir Oltean 2019-05-02  385  	struct sja1105_table *tabl=
e;
8aa9ebccae8762 Vladimir Oltean 2019-05-02  386  	int i, j;
8aa9ebccae8762 Vladimir Oltean 2019-05-02  387  =

8aa9ebccae8762 Vladimir Oltean 2019-05-02  388  	table =3D &priv->static_co=
nfig.tables[BLK_IDX_L2_FORWARDING];
8aa9ebccae8762 Vladimir Oltean 2019-05-02  389  =

8aa9ebccae8762 Vladimir Oltean 2019-05-02  390  	if (table->entry_count) {
8aa9ebccae8762 Vladimir Oltean 2019-05-02  391  		kfree(table->entries);
8aa9ebccae8762 Vladimir Oltean 2019-05-02  392  		table->entry_count =3D 0;
8aa9ebccae8762 Vladimir Oltean 2019-05-02  393  	}
8aa9ebccae8762 Vladimir Oltean 2019-05-02  394  =

8aa9ebccae8762 Vladimir Oltean 2019-05-02  395  	table->entries =3D kcalloc=
(SJA1105_MAX_L2_FORWARDING_COUNT,
8aa9ebccae8762 Vladimir Oltean 2019-05-02  396  				 table->ops->unpacked_e=
ntry_size, GFP_KERNEL);
8aa9ebccae8762 Vladimir Oltean 2019-05-02  397  	if (!table->entries)
8aa9ebccae8762 Vladimir Oltean 2019-05-02  398  		return -ENOMEM;
8aa9ebccae8762 Vladimir Oltean 2019-05-02  399  =

8aa9ebccae8762 Vladimir Oltean 2019-05-02  400  	table->entry_count =3D SJA=
1105_MAX_L2_FORWARDING_COUNT;
8aa9ebccae8762 Vladimir Oltean 2019-05-02  401  =

8aa9ebccae8762 Vladimir Oltean 2019-05-02  402  	l2fwd =3D table->entries;
8aa9ebccae8762 Vladimir Oltean 2019-05-02  403  =

8aa9ebccae8762 Vladimir Oltean 2019-05-02  404  	/* First 5 entries define =
the forwarding rules */
8aa9ebccae8762 Vladimir Oltean 2019-05-02  405  	for (i =3D 0; i < SJA1105_=
NUM_PORTS; i++) {
8aa9ebccae8762 Vladimir Oltean 2019-05-02  406  		unsigned int upstream =3D=
 dsa_upstream_port(priv->ds, i);
8aa9ebccae8762 Vladimir Oltean 2019-05-02  407  =

8aa9ebccae8762 Vladimir Oltean 2019-05-02  408  		for (j =3D 0; j < SJA1105=
_NUM_TC; j++)
8aa9ebccae8762 Vladimir Oltean 2019-05-02  409  			l2fwd[i].vlan_pmap[j] =
=3D j;
8aa9ebccae8762 Vladimir Oltean 2019-05-02  410  =

8aa9ebccae8762 Vladimir Oltean 2019-05-02  411  		if (i =3D=3D upstream)
8aa9ebccae8762 Vladimir Oltean 2019-05-02  412  			continue;
8aa9ebccae8762 Vladimir Oltean 2019-05-02  413  =

8aa9ebccae8762 Vladimir Oltean 2019-05-02  414  		sja1105_port_allow_traffi=
c(l2fwd, i, upstream, true);
8aa9ebccae8762 Vladimir Oltean 2019-05-02  415  		sja1105_port_allow_traffi=
c(l2fwd, upstream, i, true);
4d942354950181 Vladimir Oltean 2021-02-12  416  =

4d942354950181 Vladimir Oltean 2021-02-12 @417  		l2fwd[i].bc_domain =3D BI=
T(upstream);
4d942354950181 Vladimir Oltean 2021-02-12  418  		l2fwd[i].fl_domain =3D BI=
T(upstream);
4d942354950181 Vladimir Oltean 2021-02-12  419  =

4d942354950181 Vladimir Oltean 2021-02-12  420  		l2fwd[upstream].bc_domain=
 |=3D BIT(i);
4d942354950181 Vladimir Oltean 2021-02-12  421  		l2fwd[upstream].fl_domain=
 |=3D BIT(i);
8aa9ebccae8762 Vladimir Oltean 2019-05-02  422  	}
8aa9ebccae8762 Vladimir Oltean 2019-05-02  423  	/* Next 8 entries define V=
LAN PCP mapping from ingress to egress.
8aa9ebccae8762 Vladimir Oltean 2019-05-02  424  	 * Create a one-to-one map=
ping.
8aa9ebccae8762 Vladimir Oltean 2019-05-02  425  	 */
8aa9ebccae8762 Vladimir Oltean 2019-05-02  426  	for (i =3D 0; i < SJA1105_=
NUM_TC; i++)
8aa9ebccae8762 Vladimir Oltean 2019-05-02  427  		for (j =3D 0; j < SJA1105=
_NUM_PORTS; j++)
8aa9ebccae8762 Vladimir Oltean 2019-05-02  428  			l2fwd[SJA1105_NUM_PORTS =
+ i].vlan_pmap[j] =3D i;
8aa9ebccae8762 Vladimir Oltean 2019-05-02  429  =

8aa9ebccae8762 Vladimir Oltean 2019-05-02  430  	return 0;
8aa9ebccae8762 Vladimir Oltean 2019-05-02  431  }
8aa9ebccae8762 Vladimir Oltean 2019-05-02  432  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--===============3751615132815864291==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
z3ECAA==
--===============3751615132815864291==--

