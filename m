Content-Type: multipart/mixed; boundary="===============1317634764495942997=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/dsa/sja1105/sja1105_main.c:3370 sja1105_port_mcast_flood() warn: should '(((1))) << to' be a 64 bit type?
Date: Fri, 11 Feb 2022 16:40:22 +0800
Message-ID: <202202111635.N11UnMJE-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1317634764495942997==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Vladimir Oltean <vladimir.oltean@nxp.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   f1baf68e1383f6ed93eb9cff2866d46562607a43
commit: 4d9423549501812dafe6551d4a78db079ea87648 net: dsa: sja1105: offload=
 bridge port flags to device
date:   12 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 12 months ago
config: m68k-randconfig-m031-20220211 (https://download.01.org/0day-ci/arch=
ive/20220211/202202111635.N11UnMJE-lkp(a)intel.com/config)
compiler: m68k-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
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
drivers/net/dsa/sja1105/sja1105_main.c:417 sja1105_init_l2_forwarding() war=
n: should '(((1))) << upstream' be a 64 bit type?
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

vim +3370 drivers/net/dsa/sja1105/sja1105_main.c

4d942354950181 Vladimir Oltean 2021-02-12  3346  =

4d942354950181 Vladimir Oltean 2021-02-12  3347  static int sja1105_port_mc=
ast_flood(struct sja1105_private *priv, int to,
4d942354950181 Vladimir Oltean 2021-02-12  3348  				    struct switchdev_b=
rport_flags flags,
4d942354950181 Vladimir Oltean 2021-02-12  3349  				    struct netlink_ext=
_ack *extack)
4d942354950181 Vladimir Oltean 2021-02-12  3350  {
4d942354950181 Vladimir Oltean 2021-02-12  3351  	struct sja1105_l2_lookup_=
entry *l2_lookup;
4d942354950181 Vladimir Oltean 2021-02-12  3352  	struct sja1105_table *tab=
le;
4d942354950181 Vladimir Oltean 2021-02-12  3353  	int match;
4d942354950181 Vladimir Oltean 2021-02-12  3354  =

4d942354950181 Vladimir Oltean 2021-02-12  3355  	table =3D &priv->static_c=
onfig.tables[BLK_IDX_L2_LOOKUP];
4d942354950181 Vladimir Oltean 2021-02-12  3356  	l2_lookup =3D table->entr=
ies;
4d942354950181 Vladimir Oltean 2021-02-12  3357  =

4d942354950181 Vladimir Oltean 2021-02-12  3358  	for (match =3D 0; match <=
 table->entry_count; match++)
4d942354950181 Vladimir Oltean 2021-02-12  3359  		if (l2_lookup[match].mac=
addr =3D=3D SJA1105_UNKNOWN_MULTICAST &&
4d942354950181 Vladimir Oltean 2021-02-12  3360  		    l2_lookup[match].mas=
k_macaddr =3D=3D SJA1105_UNKNOWN_MULTICAST)
4d942354950181 Vladimir Oltean 2021-02-12  3361  			break;
4d942354950181 Vladimir Oltean 2021-02-12  3362  =

4d942354950181 Vladimir Oltean 2021-02-12  3363  	if (match =3D=3D table->e=
ntry_count) {
4d942354950181 Vladimir Oltean 2021-02-12  3364  		NL_SET_ERR_MSG_MOD(extac=
k,
4d942354950181 Vladimir Oltean 2021-02-12  3365  				   "Could not find FDB=
 entry for unknown multicast");
4d942354950181 Vladimir Oltean 2021-02-12  3366  		return -ENOSPC;
4d942354950181 Vladimir Oltean 2021-02-12  3367  	}
4d942354950181 Vladimir Oltean 2021-02-12  3368  =

4d942354950181 Vladimir Oltean 2021-02-12  3369  	if (flags.val & BR_MCAST_=
FLOOD)
4d942354950181 Vladimir Oltean 2021-02-12 @3370  		l2_lookup[match].destpor=
ts |=3D BIT(to);
4d942354950181 Vladimir Oltean 2021-02-12  3371  	else
4d942354950181 Vladimir Oltean 2021-02-12  3372  		l2_lookup[match].destpor=
ts &=3D ~BIT(to);
4d942354950181 Vladimir Oltean 2021-02-12  3373  =

4d942354950181 Vladimir Oltean 2021-02-12  3374  	return sja1105_dynamic_co=
nfig_write(priv, BLK_IDX_L2_LOOKUP,
4d942354950181 Vladimir Oltean 2021-02-12  3375  					    l2_lookup[match].=
index,
4d942354950181 Vladimir Oltean 2021-02-12  3376  					    &l2_lookup[match],
4d942354950181 Vladimir Oltean 2021-02-12  3377  					    true);
4d942354950181 Vladimir Oltean 2021-02-12  3378  }
4d942354950181 Vladimir Oltean 2021-02-12  3379  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1317634764495942997==--

