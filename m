Content-Type: multipart/mixed; boundary="===============7895105336007637463=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/dsa/sja1105/sja1105_main.c:737 sja1105_init_topology() warn: should '(((1))) << port' be a 64 bit type?
Date: Wed, 27 Apr 2022 12:16:03 +0800
Message-ID: <202204271228.PqESNs8C-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7895105336007637463==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Vladimir Oltean <vladimir.oltean@nxp.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   46cf2c613f4b10eb12f749207b0fd2c1bfae3088
commit: 30a100e60cf36ade9902dc71610f93563d0bd7b0 net: dsa: sja1105: configu=
re the cascade ports based on topology
date:   9 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 9 months ago
config: openrisc-randconfig-m031-20220425 (https://download.01.org/0day-ci/=
archive/20220427/202204271228.PqESNs8C-lkp(a)intel.com/config)
compiler: or1k-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/net/dsa/sja1105/sja1105_main.c:737 sja1105_init_topology() warn: sh=
ould '(((1))) << port' be a 64 bit type?

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
drivers/net/dsa/sja1105/sja1105_main.c:518 sja1105_init_l2_forwarding() war=
n: should '(((1))) << upstream' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:519 sja1105_init_l2_forwarding() war=
n: should '(((1))) << upstream' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:604 sja1105_init_l2_forwarding_param=
s() warn: is 'table->entries' large enough for 'struct sja1105_l2_forwardin=
g_params_entry'? 0
drivers/net/dsa/sja1105/sja1105_main.c:848 sja1105_init_avb_params() warn: =
is 'table->entries' large enough for 'struct sja1105_avb_params_entry'? 0
drivers/net/dsa/sja1105/sja1105_main.c:1315 sja1105_find_static_fdb_entry()=
 warn: should '((((1))) << port)' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:1433 sja1105et_fdb_add() warn: shoul=
d '((((1))) << port)' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:1435 sja1105et_fdb_add() warn: shoul=
d '(((1))) << port' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:1443 sja1105et_fdb_add() warn: shoul=
d '(((1))) << port' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:1529 sja1105pqrs_fdb_add() warn: sho=
uld '(((1))) << port' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:1537 sja1105pqrs_fdb_add() warn: sho=
uld '((((1))) << port)' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:1542 sja1105pqrs_fdb_add() warn: sho=
uld '(((1))) << port' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:1592 sja1105pqrs_fdb_del() warn: sho=
uld '(((1))) << port' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:1661 sja1105_fdb_dump() warn: should=
 '((((1))) << port)' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:1713 sja1105_manage_flood_domains() =
warn: should '(((1))) << to' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:1715 sja1105_manage_flood_domains() =
warn: should '(((1))) << to' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:2208 sja1105_vlan_add() warn: should=
 '(((1))) << port' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:2209 sja1105_vlan_add() warn: should=
 '(((1))) << port' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:2213 sja1105_vlan_add() warn: should=
 '(((1))) << port' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:2522 sja1105_mgmt_xmit() warn: shoul=
d '(((1))) << port' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:2840 sja1105_port_mcast_flood() warn=
: should '(((1))) << to' be a 64 bit type?

vim +737 drivers/net/dsa/sja1105/sja1105_main.c

ceec8bc0988dca Vladimir Oltean 2021-06-08  690  =

30a100e60cf36a Vladimir Oltean 2021-08-04  691  static int sja1105_init_top=
ology(struct sja1105_private *priv,
30a100e60cf36a Vladimir Oltean 2021-08-04  692  				 struct sja1105_general=
_params_entry *general_params)
30a100e60cf36a Vladimir Oltean 2021-08-04  693  {
30a100e60cf36a Vladimir Oltean 2021-08-04  694  	struct dsa_switch *ds =3D =
priv->ds;
30a100e60cf36a Vladimir Oltean 2021-08-04  695  	int port;
30a100e60cf36a Vladimir Oltean 2021-08-04  696  =

30a100e60cf36a Vladimir Oltean 2021-08-04  697  	/* The host port is the de=
stination for traffic matching mac_fltres1
30a100e60cf36a Vladimir Oltean 2021-08-04  698  	 * and mac_fltres0 on all =
ports except itself. Default to an invalid
30a100e60cf36a Vladimir Oltean 2021-08-04  699  	 * value.
30a100e60cf36a Vladimir Oltean 2021-08-04  700  	 */
30a100e60cf36a Vladimir Oltean 2021-08-04  701  	general_params->host_port =
=3D ds->num_ports;
30a100e60cf36a Vladimir Oltean 2021-08-04  702  =

30a100e60cf36a Vladimir Oltean 2021-08-04  703  	/* Link-local traffic rece=
ived on casc_port will be forwarded
30a100e60cf36a Vladimir Oltean 2021-08-04  704  	 * to host_port without em=
bedding the source port and device ID
30a100e60cf36a Vladimir Oltean 2021-08-04  705  	 * info in the destination=
 MAC address, and no RX timestamps will be
30a100e60cf36a Vladimir Oltean 2021-08-04  706  	 * taken either (presumabl=
y because it is a cascaded port and a
30a100e60cf36a Vladimir Oltean 2021-08-04  707  	 * downstream SJA switch a=
lready did that).
30a100e60cf36a Vladimir Oltean 2021-08-04  708  	 * To disable the feature,=
 we need to do different things depending on
30a100e60cf36a Vladimir Oltean 2021-08-04  709  	 * switch generation. On S=
JA1105 we need to set an invalid port, while
30a100e60cf36a Vladimir Oltean 2021-08-04  710  	 * on SJA1110 which suppor=
t multiple cascaded ports, this field is a
30a100e60cf36a Vladimir Oltean 2021-08-04  711  	 * bitmask so it must be l=
eft zero.
30a100e60cf36a Vladimir Oltean 2021-08-04  712  	 */
30a100e60cf36a Vladimir Oltean 2021-08-04  713  	if (!priv->info->multiple_=
cascade_ports)
30a100e60cf36a Vladimir Oltean 2021-08-04  714  		general_params->casc_port=
 =3D ds->num_ports;
30a100e60cf36a Vladimir Oltean 2021-08-04  715  =

30a100e60cf36a Vladimir Oltean 2021-08-04  716  	for (port =3D 0; port < ds=
->num_ports; port++) {
30a100e60cf36a Vladimir Oltean 2021-08-04  717  		bool is_upstream =3D dsa_=
is_upstream_port(ds, port);
30a100e60cf36a Vladimir Oltean 2021-08-04  718  		bool is_dsa_link =3D dsa_=
is_dsa_port(ds, port);
30a100e60cf36a Vladimir Oltean 2021-08-04  719  =

30a100e60cf36a Vladimir Oltean 2021-08-04  720  		/* Upstream ports can be =
dedicated CPU ports or
30a100e60cf36a Vladimir Oltean 2021-08-04  721  		 * upstream-facing DSA li=
nks
30a100e60cf36a Vladimir Oltean 2021-08-04  722  		 */
30a100e60cf36a Vladimir Oltean 2021-08-04  723  		if (is_upstream) {
30a100e60cf36a Vladimir Oltean 2021-08-04  724  			if (general_params->host=
_port =3D=3D ds->num_ports) {
30a100e60cf36a Vladimir Oltean 2021-08-04  725  				general_params->host_po=
rt =3D port;
30a100e60cf36a Vladimir Oltean 2021-08-04  726  			} else {
30a100e60cf36a Vladimir Oltean 2021-08-04  727  				dev_err(ds->dev,
30a100e60cf36a Vladimir Oltean 2021-08-04  728  					"Port %llu is already =
a host port, configuring %d as one too is not supported\n",
30a100e60cf36a Vladimir Oltean 2021-08-04  729  					general_params->host_p=
ort, port);
30a100e60cf36a Vladimir Oltean 2021-08-04  730  				return -EINVAL;
30a100e60cf36a Vladimir Oltean 2021-08-04  731  			}
30a100e60cf36a Vladimir Oltean 2021-08-04  732  		}
30a100e60cf36a Vladimir Oltean 2021-08-04  733  =

30a100e60cf36a Vladimir Oltean 2021-08-04  734  		/* Cascade ports are down=
stream-facing DSA links */
30a100e60cf36a Vladimir Oltean 2021-08-04  735  		if (is_dsa_link && !is_up=
stream) {
30a100e60cf36a Vladimir Oltean 2021-08-04  736  			if (priv->info->multiple=
_cascade_ports) {
30a100e60cf36a Vladimir Oltean 2021-08-04 @737  				general_params->casc_po=
rt |=3D BIT(port);
30a100e60cf36a Vladimir Oltean 2021-08-04  738  			} else if (general_param=
s->casc_port =3D=3D ds->num_ports) {
30a100e60cf36a Vladimir Oltean 2021-08-04  739  				general_params->casc_po=
rt =3D port;
30a100e60cf36a Vladimir Oltean 2021-08-04  740  			} else {
30a100e60cf36a Vladimir Oltean 2021-08-04  741  				dev_err(ds->dev,
30a100e60cf36a Vladimir Oltean 2021-08-04  742  					"Port %llu is already =
a cascade port, configuring %d as one too is not supported\n",
30a100e60cf36a Vladimir Oltean 2021-08-04  743  					general_params->casc_p=
ort, port);
30a100e60cf36a Vladimir Oltean 2021-08-04  744  				return -EINVAL;
30a100e60cf36a Vladimir Oltean 2021-08-04  745  			}
30a100e60cf36a Vladimir Oltean 2021-08-04  746  		}
30a100e60cf36a Vladimir Oltean 2021-08-04  747  	}
30a100e60cf36a Vladimir Oltean 2021-08-04  748  =

30a100e60cf36a Vladimir Oltean 2021-08-04  749  	if (general_params->host_p=
ort =3D=3D ds->num_ports) {
30a100e60cf36a Vladimir Oltean 2021-08-04  750  		dev_err(ds->dev, "No host=
 port configured\n");
30a100e60cf36a Vladimir Oltean 2021-08-04  751  		return -EINVAL;
30a100e60cf36a Vladimir Oltean 2021-08-04  752  	}
30a100e60cf36a Vladimir Oltean 2021-08-04  753  =

30a100e60cf36a Vladimir Oltean 2021-08-04  754  	return 0;
30a100e60cf36a Vladimir Oltean 2021-08-04  755  }
30a100e60cf36a Vladimir Oltean 2021-08-04  756  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7895105336007637463==--

