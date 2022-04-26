Content-Type: multipart/mixed; boundary="===============5045194491724226815=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/dsa/sja1105/sja1105_main.c:2146 sja1105_vlan_add() warn: should '(((1))) << port' be a 64 bit type?
Date: Tue, 26 Apr 2022 14:07:52 +0800
Message-ID: <202204261342.A6HkKVu1-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5045194491724226815==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Vladimir Oltean <vladimir.oltean@nxp.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   d615b5416f8a1afeb82d13b238f8152c572d59c0
commit: 6dfd23d35e75098ac61a605f6c591ce42e95cdcb net: dsa: sja1105: delete =
vlan delta save/restore logic
date:   9 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 9 months ago
config: openrisc-randconfig-m031-20220425 (https://download.01.org/0day-ci/=
archive/20220426/202204261342.A6HkKVu1-lkp(a)intel.com/config)
compiler: or1k-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/net/dsa/sja1105/sja1105_main.c:2146 sja1105_vlan_add() warn: should=
 '(((1))) << port' be a 64 bit type?

Old smatch warnings:
drivers/net/dsa/sja1105/sja1105_main.c:49 sja1105_port_allow_traffic() warn=
: should '(((1))) << to' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:57 sja1105_can_forward() warn: shoul=
d '((((1))) << to)' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:173 sja1105_init_mii_settings() warn=
: is 'table->entries' large enough for 'struct sja1105_xmii_params_entry'? 0
drivers/net/dsa/sja1105/sja1105_main.c:185 sja1105_init_mii_settings() warn=
: is 'table->entries' large enough for 'struct sja1105_xmii_params_entry'? 0
drivers/net/dsa/sja1105/sja1105_main.c:194 sja1105_init_mii_settings() warn=
: is 'table->entries' large enough for 'struct sja1105_xmii_params_entry'? 0
drivers/net/dsa/sja1105/sja1105_main.c:203 sja1105_init_mii_settings() warn=
: is 'table->entries' large enough for 'struct sja1105_xmii_params_entry'? 0
drivers/net/dsa/sja1105/sja1105_main.c:209 sja1105_init_mii_settings() warn=
: is 'table->entries' large enough for 'struct sja1105_xmii_params_entry'? 0
drivers/net/dsa/sja1105/sja1105_main.c:216 sja1105_init_mii_settings() warn=
: is 'table->entries' large enough for 'struct sja1105_xmii_params_entry'? 0
drivers/net/dsa/sja1105/sja1105_main.c:443 sja1105_init_l2_forwarding() war=
n: should '(((1))) << upstream' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:444 sja1105_init_l2_forwarding() war=
n: should '(((1))) << upstream' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:529 sja1105_init_l2_forwarding_param=
s() warn: is 'table->entries' large enough for 'struct sja1105_l2_forwardin=
g_params_entry'? 0
drivers/net/dsa/sja1105/sja1105_main.c:702 sja1105_init_general_params() wa=
rn: is 'table->entries' large enough for 'struct sja1105_general_params_ent=
ry'? 0
drivers/net/dsa/sja1105/sja1105_main.c:730 sja1105_init_avb_params() warn: =
is 'table->entries' large enough for 'struct sja1105_avb_params_entry'? 0
drivers/net/dsa/sja1105/sja1105_main.c:1197 sja1105_find_static_fdb_entry()=
 warn: should '((((1))) << port)' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:1315 sja1105et_fdb_add() warn: shoul=
d '((((1))) << port)' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:1317 sja1105et_fdb_add() warn: shoul=
d '(((1))) << port' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:1325 sja1105et_fdb_add() warn: shoul=
d '(((1))) << port' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:1411 sja1105pqrs_fdb_add() warn: sho=
uld '(((1))) << port' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:1419 sja1105pqrs_fdb_add() warn: sho=
uld '((((1))) << port)' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:1424 sja1105pqrs_fdb_add() warn: sho=
uld '(((1))) << port' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:1474 sja1105pqrs_fdb_del() warn: sho=
uld '(((1))) << port' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:1558 sja1105_fdb_dump() warn: should=
 '((((1))) << port)' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:1610 sja1105_manage_flood_domains() =
warn: should '(((1))) << to' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:1612 sja1105_manage_flood_domains() =
warn: should '(((1))) << to' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:2147 sja1105_vlan_add() warn: should=
 '(((1))) << port' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:2151 sja1105_vlan_add() warn: should=
 '(((1))) << port' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:2417 sja1105_mgmt_xmit() warn: shoul=
d '(((1))) << port' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:2735 sja1105_port_mcast_flood() warn=
: should '(((1))) << to' be a 64 bit type?

vim +2146 drivers/net/dsa/sja1105/sja1105_main.c

6666cebc5e306f Vladimir Oltean 2019-05-02  2123  =

6dfd23d35e7509 Vladimir Oltean 2021-07-26  2124  static int sja1105_vlan_ad=
d(struct sja1105_private *priv, int port, u16 vid,
6dfd23d35e7509 Vladimir Oltean 2021-07-26  2125  			    u16 flags)
6666cebc5e306f Vladimir Oltean 2019-05-02  2126  {
6dfd23d35e7509 Vladimir Oltean 2021-07-26  2127  	struct sja1105_vlan_looku=
p_entry *vlan;
6dfd23d35e7509 Vladimir Oltean 2021-07-26  2128  	struct sja1105_table *tab=
le;
6dfd23d35e7509 Vladimir Oltean 2021-07-26  2129  	int match, rc;
ec5ae61076d07b Vladimir Oltean 2020-05-12  2130  =

6dfd23d35e7509 Vladimir Oltean 2021-07-26  2131  	table =3D &priv->static_c=
onfig.tables[BLK_IDX_VLAN_LOOKUP];
ec5ae61076d07b Vladimir Oltean 2020-05-12  2132  =

6dfd23d35e7509 Vladimir Oltean 2021-07-26  2133  	match =3D sja1105_is_vlan=
_configured(priv, vid);
6dfd23d35e7509 Vladimir Oltean 2021-07-26  2134  	if (match < 0) {
6dfd23d35e7509 Vladimir Oltean 2021-07-26  2135  		rc =3D sja1105_table_res=
ize(table, table->entry_count + 1);
6dfd23d35e7509 Vladimir Oltean 2021-07-26  2136  		if (rc)
6dfd23d35e7509 Vladimir Oltean 2021-07-26  2137  			return rc;
6dfd23d35e7509 Vladimir Oltean 2021-07-26  2138  		match =3D table->entry_c=
ount - 1;
b38e659de966a1 Vladimir Oltean 2021-05-24  2139  	}
b38e659de966a1 Vladimir Oltean 2021-05-24  2140  =

6dfd23d35e7509 Vladimir Oltean 2021-07-26  2141  	/* Assign pointer after t=
he resize (it's new memory) */
6dfd23d35e7509 Vladimir Oltean 2021-07-26  2142  	vlan =3D table->entries;
ec5ae61076d07b Vladimir Oltean 2020-05-12  2143  =

6dfd23d35e7509 Vladimir Oltean 2021-07-26  2144  	vlan[match].type_entry =
=3D SJA1110_VLAN_D_TAG;
6dfd23d35e7509 Vladimir Oltean 2021-07-26  2145  	vlan[match].vlanid =3D vi=
d;
6dfd23d35e7509 Vladimir Oltean 2021-07-26 @2146  	vlan[match].vlan_bc |=3D =
BIT(port);
6dfd23d35e7509 Vladimir Oltean 2021-07-26  2147  	vlan[match].vmemb_port |=
=3D BIT(port);
6dfd23d35e7509 Vladimir Oltean 2021-07-26  2148  	if (flags & BRIDGE_VLAN_I=
NFO_UNTAGGED)
6dfd23d35e7509 Vladimir Oltean 2021-07-26  2149  		vlan[match].tag_port &=
=3D ~BIT(port);
6dfd23d35e7509 Vladimir Oltean 2021-07-26  2150  	else
6dfd23d35e7509 Vladimir Oltean 2021-07-26  2151  		vlan[match].tag_port |=
=3D BIT(port);
ec5ae61076d07b Vladimir Oltean 2020-05-12  2152  =

6dfd23d35e7509 Vladimir Oltean 2021-07-26  2153  	return sja1105_dynamic_co=
nfig_write(priv, BLK_IDX_VLAN_LOOKUP, vid,
6dfd23d35e7509 Vladimir Oltean 2021-07-26  2154  					    &vlan[match], tru=
e);
5899ee367ab3fe Vladimir Oltean 2020-09-10  2155  }
5899ee367ab3fe Vladimir Oltean 2020-09-10  2156  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5045194491724226815==--

