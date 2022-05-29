Content-Type: multipart/mixed; boundary="===============6558523957232486870=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/dsa/sja1105/sja1105_main.c:1818 sja1105_fast_age() warn: should '((((1))) << port)' be a 64 bit type?
Date: Sun, 29 May 2022 15:28:43 +0800
Message-ID: <202205291521.2PGI5RQ6-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6558523957232486870==
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
commit: 5126ec72a094bd3a721941323c48cc80c60139d9 net: dsa: sja1105: add FDB=
 fast ageing support
date:   10 months ago
:::::: branch date: 27 hours ago
:::::: commit date: 10 months ago
config: arc-randconfig-m031-20220524 (https://download.01.org/0day-ci/archi=
ve/20220529/202205291521.2PGI5RQ6-lkp(a)intel.com/config)
compiler: arceb-elf-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/net/dsa/sja1105/sja1105_main.c:1818 sja1105_fast_age() warn: should=
 '((((1))) << port)' be a 64 bit type?

Old smatch warnings:
drivers/net/dsa/sja1105/sja1105_main.c:49 sja1105_port_allow_traffic() warn=
: should '(((1))) << to' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:57 sja1105_can_forward() warn: shoul=
d '((((1))) << to)' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:129 sja1105_commit_pvid() warn: shou=
ld '((((1))) << port)' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:255 sja1105_init_mii_settings() warn=
: is 'table->entries' large enough for 'struct sja1105_xmii_params_entry'? 0
drivers/net/dsa/sja1105/sja1105_main.c:267 sja1105_init_mii_settings() warn=
: is 'table->entries' large enough for 'struct sja1105_xmii_params_entry'? 0
drivers/net/dsa/sja1105/sja1105_main.c:276 sja1105_init_mii_settings() warn=
: is 'table->entries' large enough for 'struct sja1105_xmii_params_entry'? 0
drivers/net/dsa/sja1105/sja1105_main.c:285 sja1105_init_mii_settings() warn=
: is 'table->entries' large enough for 'struct sja1105_xmii_params_entry'? 0
drivers/net/dsa/sja1105/sja1105_main.c:291 sja1105_init_mii_settings() warn=
: is 'table->entries' large enough for 'struct sja1105_xmii_params_entry'? 0
drivers/net/dsa/sja1105/sja1105_main.c:298 sja1105_init_mii_settings() warn=
: is 'table->entries' large enough for 'struct sja1105_xmii_params_entry'? 0
drivers/net/dsa/sja1105/sja1105_main.c:530 sja1105_init_l2_forwarding() war=
n: should '(((1))) << to' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:531 sja1105_init_l2_forwarding() war=
n: should '(((1))) << to' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:552 sja1105_init_l2_forwarding() war=
n: should '(((1))) << to' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:553 sja1105_init_l2_forwarding() war=
n: should '(((1))) << to' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:676 sja1105_init_l2_forwarding_param=
s() warn: is 'table->entries' large enough for 'struct sja1105_l2_forwardin=
g_params_entry'? 0
drivers/net/dsa/sja1105/sja1105_main.c:809 sja1105_init_topology() warn: sh=
ould '(((1))) << port' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:920 sja1105_init_avb_params() warn: =
is 'table->entries' large enough for 'struct sja1105_avb_params_entry'? 0
drivers/net/dsa/sja1105/sja1105_main.c:1387 sja1105_find_static_fdb_entry()=
 warn: should '((((1))) << port)' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:1506 sja1105et_fdb_add() warn: shoul=
d '((((1))) << port)' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:1508 sja1105et_fdb_add() warn: shoul=
d '(((1))) << port' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:1516 sja1105et_fdb_add() warn: shoul=
d '(((1))) << port' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:1619 sja1105pqrs_fdb_add() warn: sho=
uld '(((1))) << port' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:1629 sja1105pqrs_fdb_add() warn: sho=
uld '((((1))) << port)' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:1637 sja1105pqrs_fdb_add() warn: sho=
uld '(((1))) << port' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:1710 sja1105pqrs_fdb_del() warn: sho=
uld '(((1))) << port' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:1779 sja1105_fdb_dump() warn: should=
 '((((1))) << port)' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:1871 sja1105_manage_flood_domains() =
warn: should '(((1))) << to' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:1873 sja1105_manage_flood_domains() =
warn: should '(((1))) << to' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:2367 sja1105_vlan_add() warn: should=
 '(((1))) << port' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:2368 sja1105_vlan_add() warn: should=
 '(((1))) << port' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:2372 sja1105_vlan_add() warn: should=
 '(((1))) << port' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:2682 sja1105_mgmt_xmit() warn: shoul=
d '(((1))) << port' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:2990 sja1105_port_mcast_flood() warn=
: should '(((1))) << to' be a 64 bit type?

vim +1818 drivers/net/dsa/sja1105/sja1105_main.c

291d1e72b75642 Vladimir Oltean 2019-05-02  1796  =

5126ec72a094bd Vladimir Oltean 2021-08-08  1797  static void sja1105_fast_a=
ge(struct dsa_switch *ds, int port)
5126ec72a094bd Vladimir Oltean 2021-08-08  1798  {
5126ec72a094bd Vladimir Oltean 2021-08-08  1799  	struct sja1105_private *p=
riv =3D ds->priv;
5126ec72a094bd Vladimir Oltean 2021-08-08  1800  	int i;
5126ec72a094bd Vladimir Oltean 2021-08-08  1801  =

5126ec72a094bd Vladimir Oltean 2021-08-08  1802  	for (i =3D 0; i < SJA1105=
_MAX_L2_LOOKUP_COUNT; i++) {
5126ec72a094bd Vladimir Oltean 2021-08-08  1803  		struct sja1105_l2_lookup=
_entry l2_lookup =3D {0};
5126ec72a094bd Vladimir Oltean 2021-08-08  1804  		u8 macaddr[ETH_ALEN];
5126ec72a094bd Vladimir Oltean 2021-08-08  1805  		int rc;
5126ec72a094bd Vladimir Oltean 2021-08-08  1806  =

5126ec72a094bd Vladimir Oltean 2021-08-08  1807  		rc =3D sja1105_dynamic_c=
onfig_read(priv, BLK_IDX_L2_LOOKUP,
5126ec72a094bd Vladimir Oltean 2021-08-08  1808  						 i, &l2_lookup);
5126ec72a094bd Vladimir Oltean 2021-08-08  1809  		/* No fdb entry@i, no=
t an issue */
5126ec72a094bd Vladimir Oltean 2021-08-08  1810  		if (rc =3D=3D -ENOENT)
5126ec72a094bd Vladimir Oltean 2021-08-08  1811  			continue;
5126ec72a094bd Vladimir Oltean 2021-08-08  1812  		if (rc) {
5126ec72a094bd Vladimir Oltean 2021-08-08  1813  			dev_err(ds->dev, "Faile=
d to read FDB: %pe\n",
5126ec72a094bd Vladimir Oltean 2021-08-08  1814  				ERR_PTR(rc));
5126ec72a094bd Vladimir Oltean 2021-08-08  1815  			return;
5126ec72a094bd Vladimir Oltean 2021-08-08  1816  		}
5126ec72a094bd Vladimir Oltean 2021-08-08  1817  =

5126ec72a094bd Vladimir Oltean 2021-08-08 @1818  		if (!(l2_lookup.destport=
s & BIT(port)))
5126ec72a094bd Vladimir Oltean 2021-08-08  1819  			continue;
5126ec72a094bd Vladimir Oltean 2021-08-08  1820  =

5126ec72a094bd Vladimir Oltean 2021-08-08  1821  		/* Don't delete static F=
DB entries */
5126ec72a094bd Vladimir Oltean 2021-08-08  1822  		if (l2_lookup.lockeds)
5126ec72a094bd Vladimir Oltean 2021-08-08  1823  			continue;
5126ec72a094bd Vladimir Oltean 2021-08-08  1824  =

5126ec72a094bd Vladimir Oltean 2021-08-08  1825  		u64_to_ether_addr(l2_loo=
kup.macaddr, macaddr);
5126ec72a094bd Vladimir Oltean 2021-08-08  1826  =

5126ec72a094bd Vladimir Oltean 2021-08-08  1827  		rc =3D sja1105_fdb_del(d=
s, port, macaddr, l2_lookup.vlanid);
5126ec72a094bd Vladimir Oltean 2021-08-08  1828  		if (rc) {
5126ec72a094bd Vladimir Oltean 2021-08-08  1829  			dev_err(ds->dev,
5126ec72a094bd Vladimir Oltean 2021-08-08  1830  				"Failed to delete FDB =
entry %pM vid %lld: %pe\n",
5126ec72a094bd Vladimir Oltean 2021-08-08  1831  				macaddr, l2_lookup.vla=
nid, ERR_PTR(rc));
5126ec72a094bd Vladimir Oltean 2021-08-08  1832  			return;
5126ec72a094bd Vladimir Oltean 2021-08-08  1833  		}
5126ec72a094bd Vladimir Oltean 2021-08-08  1834  	}
5126ec72a094bd Vladimir Oltean 2021-08-08  1835  }
5126ec72a094bd Vladimir Oltean 2021-08-08  1836  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6558523957232486870==--

