Content-Type: multipart/mixed; boundary="===============8147218731349782266=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/dsa/sja1105/sja1105_main.c:129 sja1105_commit_pvid() warn: should '((((1))) << port)' be a 64 bit type?
Date: Tue, 26 Apr 2022 19:54:33 +0800
Message-ID: <202204261914.eOrkTEiS-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8147218731349782266==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Vladimir Oltean <vladimir.oltean@nxp.com>
CC: Florian Fainelli <f.fainelli@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   d615b5416f8a1afeb82d13b238f8152c572d59c0
commit: bef0746cf4cce238b1943df5d5b8f3103da92ead net: dsa: sja1105: make su=
re untagged packets are dropped on ingress ports with no pvid
date:   9 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 9 months ago
config: openrisc-randconfig-m031-20220425 (https://download.01.org/0day-ci/=
archive/20220426/202204261914.eOrkTEiS-lkp(a)intel.com/config)
compiler: or1k-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/net/dsa/sja1105/sja1105_main.c:129 sja1105_commit_pvid() warn: shou=
ld '((((1))) << port)' be a 64 bit type?

Old smatch warnings:
drivers/net/dsa/sja1105/sja1105_main.c:49 sja1105_port_allow_traffic() warn=
: should '(((1))) << to' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:57 sja1105_can_forward() warn: shoul=
d '((((1))) << to)' be a 64 bit type?
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
drivers/net/dsa/sja1105/sja1105_main.c:518 sja1105_init_l2_forwarding() war=
n: should '(((1))) << upstream' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:519 sja1105_init_l2_forwarding() war=
n: should '(((1))) << upstream' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:604 sja1105_init_l2_forwarding_param=
s() warn: is 'table->entries' large enough for 'struct sja1105_l2_forwardin=
g_params_entry'? 0
drivers/net/dsa/sja1105/sja1105_main.c:777 sja1105_init_general_params() wa=
rn: is 'table->entries' large enough for 'struct sja1105_general_params_ent=
ry'? 0
drivers/net/dsa/sja1105/sja1105_main.c:805 sja1105_init_avb_params() warn: =
is 'table->entries' large enough for 'struct sja1105_avb_params_entry'? 0
drivers/net/dsa/sja1105/sja1105_main.c:1272 sja1105_find_static_fdb_entry()=
 warn: should '((((1))) << port)' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:1390 sja1105et_fdb_add() warn: shoul=
d '((((1))) << port)' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:1392 sja1105et_fdb_add() warn: shoul=
d '(((1))) << port' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:1400 sja1105et_fdb_add() warn: shoul=
d '(((1))) << port' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:1486 sja1105pqrs_fdb_add() warn: sho=
uld '(((1))) << port' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:1494 sja1105pqrs_fdb_add() warn: sho=
uld '((((1))) << port)' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:1499 sja1105pqrs_fdb_add() warn: sho=
uld '(((1))) << port' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:1549 sja1105pqrs_fdb_del() warn: sho=
uld '(((1))) << port' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:1618 sja1105_fdb_dump() warn: should=
 '((((1))) << port)' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:1670 sja1105_manage_flood_domains() =
warn: should '(((1))) << to' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:1672 sja1105_manage_flood_domains() =
warn: should '(((1))) << to' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:2165 sja1105_vlan_add() warn: should=
 '(((1))) << port' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:2166 sja1105_vlan_add() warn: should=
 '(((1))) << port' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:2170 sja1105_vlan_add() warn: should=
 '(((1))) << port' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:2479 sja1105_mgmt_xmit() warn: shoul=
d '(((1))) << port' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:2797 sja1105_port_mcast_flood() warn=
: should '(((1))) << to' be a 64 bit type?

vim +129 drivers/net/dsa/sja1105/sja1105_main.c

cde8078e83e320 Vladimir Oltean 2021-07-29  106  =

cde8078e83e320 Vladimir Oltean 2021-07-29  107  static int sja1105_commit_p=
vid(struct dsa_switch *ds, int port)
cde8078e83e320 Vladimir Oltean 2021-07-29  108  {
cde8078e83e320 Vladimir Oltean 2021-07-29  109  	struct dsa_port *dp =3D ds=
a_to_port(ds, port);
cde8078e83e320 Vladimir Oltean 2021-07-29  110  	struct sja1105_private *pr=
iv =3D ds->priv;
bef0746cf4cce2 Vladimir Oltean 2021-07-29  111  	struct sja1105_vlan_lookup=
_entry *vlan;
bef0746cf4cce2 Vladimir Oltean 2021-07-29  112  	bool drop_untagged =3D fal=
se;
bef0746cf4cce2 Vladimir Oltean 2021-07-29  113  	int match, rc;
cde8078e83e320 Vladimir Oltean 2021-07-29  114  	u16 pvid;
cde8078e83e320 Vladimir Oltean 2021-07-29  115  =

cde8078e83e320 Vladimir Oltean 2021-07-29  116  	if (dp->bridge_dev && br_v=
lan_enabled(dp->bridge_dev))
cde8078e83e320 Vladimir Oltean 2021-07-29  117  		pvid =3D priv->bridge_pvi=
d[port];
cde8078e83e320 Vladimir Oltean 2021-07-29  118  	else
cde8078e83e320 Vladimir Oltean 2021-07-29  119  		pvid =3D priv->tag_8021q_=
pvid[port];
cde8078e83e320 Vladimir Oltean 2021-07-29  120  =

bef0746cf4cce2 Vladimir Oltean 2021-07-29  121  	rc =3D sja1105_pvid_apply(=
priv, port, pvid);
bef0746cf4cce2 Vladimir Oltean 2021-07-29  122  	if (rc)
bef0746cf4cce2 Vladimir Oltean 2021-07-29  123  		return rc;
bef0746cf4cce2 Vladimir Oltean 2021-07-29  124  =

bef0746cf4cce2 Vladimir Oltean 2021-07-29  125  	vlan =3D priv->static_conf=
ig.tables[BLK_IDX_VLAN_LOOKUP].entries;
bef0746cf4cce2 Vladimir Oltean 2021-07-29  126  =

bef0746cf4cce2 Vladimir Oltean 2021-07-29  127  	match =3D sja1105_is_vlan_=
configured(priv, pvid);
bef0746cf4cce2 Vladimir Oltean 2021-07-29  128  =

bef0746cf4cce2 Vladimir Oltean 2021-07-29 @129  	if (match < 0 || !(vlan[ma=
tch].vmemb_port & BIT(port)))
bef0746cf4cce2 Vladimir Oltean 2021-07-29  130  		drop_untagged =3D true;
bef0746cf4cce2 Vladimir Oltean 2021-07-29  131  =

bef0746cf4cce2 Vladimir Oltean 2021-07-29  132  	return sja1105_drop_untagg=
ed(ds, port, drop_untagged);
cde8078e83e320 Vladimir Oltean 2021-07-29  133  }
cde8078e83e320 Vladimir Oltean 2021-07-29  134  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8147218731349782266==--

