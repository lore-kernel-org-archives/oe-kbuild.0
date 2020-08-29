Content-Type: multipart/mixed; boundary="===============0134024045551049402=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/dsa/sja1105/sja1105_main.c:1608 sja1105_static_config_reload() warn: bitwise AND condition is false here
Date: Sat, 29 Aug 2020 16:58:22 +0800
Message-ID: <202008291619.9bsgazD5%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0134024045551049402==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Vladimir Oltean <vladimir.oltean@nxp.com>
CC: Russell King <rmk+kernel@armlinux.org.uk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   4d41ead6ead97c3730bbd186a601a64828668f01
commit: ffe10e679cec9a99f19049459cb27c2fbb1e913a net: dsa: sja1105: Add sup=
port for the SGMII port
date:   5 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 5 months ago
config: arm-randconfig-m031-20200829 (attached as .config)
compiler: arm-linux-gnueabi-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/net/dsa/sja1105/sja1105_main.c:1608 sja1105_static_config_reload() =
warn: bitwise AND condition is false here

Old smatch warnings:
drivers/net/dsa/sja1105/sja1105_main.c:44 sja1105_port_allow_traffic() warn=
: should '(((1))) << to' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:45 sja1105_port_allow_traffic() warn=
: should '(((1))) << to' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:46 sja1105_port_allow_traffic() warn=
: should '(((1))) << to' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:186 sja1105_init_mii_settings() warn=
: is 'table->entries' large enough for 'struct sja1105_xmii_params_entry'? 1
drivers/net/dsa/sja1105/sja1105_main.c:189 sja1105_init_mii_settings() warn=
: is 'table->entries' large enough for 'struct sja1105_xmii_params_entry'? 1
drivers/net/dsa/sja1105/sja1105_main.c:195 sja1105_init_mii_settings() warn=
: is 'table->entries' large enough for 'struct sja1105_xmii_params_entry'? 1
drivers/net/dsa/sja1105/sja1105_main.c:200 sja1105_init_mii_settings() warn=
: is 'table->entries' large enough for 'struct sja1105_xmii_params_entry'? 1
drivers/net/dsa/sja1105/sja1105_main.c:1013 sja1105_find_static_fdb_entry()=
 warn: should '((((1))) << port)' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:1131 sja1105et_fdb_add() warn: shoul=
d '((((1))) << port)' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:1133 sja1105et_fdb_add() warn: shoul=
d '(((1))) << port' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:1141 sja1105et_fdb_add() warn: shoul=
d '(((1))) << port' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:1227 sja1105pqrs_fdb_add() warn: sho=
uld '(((1))) << port' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:1235 sja1105pqrs_fdb_add() warn: sho=
uld '((((1))) << port)' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:1240 sja1105pqrs_fdb_add() warn: sho=
uld '(((1))) << port' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:1290 sja1105pqrs_fdb_del() warn: sho=
uld '(((1))) << port' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:1374 sja1105_fdb_dump() warn: should=
 '((((1))) << port)' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:1672 sja1105_vlan_apply() warn: shou=
ld '(((1))) << port' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:1673 sja1105_vlan_apply() warn: shou=
ld '(((1))) << port' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:1684 sja1105_vlan_apply() warn: shou=
ld '(((1))) << port' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:1981 sja1105_mgmt_xmit() warn: shoul=
d '(((1))) << port' be a 64 bit type?

# https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3Dffe10e679cec9a99f19049459cb27c2fbb1e913a
git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torval=
ds/linux.git
git fetch --no-tags linus master
git checkout ffe10e679cec9a99f19049459cb27c2fbb1e913a
vim +1608 drivers/net/dsa/sja1105/sja1105_main.c

2eea1fa82f681b Vladimir Oltean 2019-11-12  1508  =

6666cebc5e306f Vladimir Oltean 2019-05-02  1509  /* For situations where we=
 need to change a setting at runtime that is only
6666cebc5e306f Vladimir Oltean 2019-05-02  1510   * available through the s=
tatic configuration, resetting the switch in order
6666cebc5e306f Vladimir Oltean 2019-05-02  1511   * to upload the new stati=
c config is unavoidable. Back up the settings we
6666cebc5e306f Vladimir Oltean 2019-05-02  1512   * modify@runtime (curr=
ently only MAC) and restore them after uploading,
6666cebc5e306f Vladimir Oltean 2019-05-02  1513   * such that this operatio=
n is relatively seamless.
6666cebc5e306f Vladimir Oltean 2019-05-02  1514   */
2eea1fa82f681b Vladimir Oltean 2019-11-12  1515  int sja1105_static_config_=
reload(struct sja1105_private *priv,
2eea1fa82f681b Vladimir Oltean 2019-11-12  1516  				 enum sja1105_reset_re=
ason reason)
6666cebc5e306f Vladimir Oltean 2019-05-02  1517  {
6cf99c13ea07b5 Vladimir Oltean 2019-11-09  1518  	struct ptp_system_timesta=
mp ptp_sts_before;
6cf99c13ea07b5 Vladimir Oltean 2019-11-09  1519  	struct ptp_system_timesta=
mp ptp_sts_after;
6666cebc5e306f Vladimir Oltean 2019-05-02  1520  	struct sja1105_mac_config=
_entry *mac;
6666cebc5e306f Vladimir Oltean 2019-05-02  1521  	int speed_mbps[SJA1105_NU=
M_PORTS];
6cf99c13ea07b5 Vladimir Oltean 2019-11-09  1522  	struct dsa_switch *ds =3D=
 priv->ds;
6cf99c13ea07b5 Vladimir Oltean 2019-11-09  1523  	s64 t1, t2, t3, t4;
6cf99c13ea07b5 Vladimir Oltean 2019-11-09  1524  	s64 t12, t34;
ffe10e679cec9a Vladimir Oltean 2020-03-20  1525  	u16 bmcr =3D 0;
6666cebc5e306f Vladimir Oltean 2019-05-02  1526  	int rc, i;
6cf99c13ea07b5 Vladimir Oltean 2019-11-09  1527  	s64 now;
6666cebc5e306f Vladimir Oltean 2019-05-02  1528  =

af580ae2dcb250 Vladimir Oltean 2019-11-09  1529  	mutex_lock(&priv->mgmt_lo=
ck);
af580ae2dcb250 Vladimir Oltean 2019-11-09  1530  =

6666cebc5e306f Vladimir Oltean 2019-05-02  1531  	mac =3D priv->static_conf=
ig.tables[BLK_IDX_MAC_CONFIG].entries;
6666cebc5e306f Vladimir Oltean 2019-05-02  1532  =

8400cff60b472c Vladimir Oltean 2019-06-08  1533  	/* Back up the dynamic li=
nk speed changed by sja1105_adjust_port_config
8400cff60b472c Vladimir Oltean 2019-06-08  1534  	 * in order to temporaril=
y restore it to SJA1105_SPEED_AUTO - which the
8400cff60b472c Vladimir Oltean 2019-06-08  1535  	 * switch wants to see in=
 the static config in order to allow us to
8400cff60b472c Vladimir Oltean 2019-06-08  1536  	 * change it through the =
dynamic interface later.
6666cebc5e306f Vladimir Oltean 2019-05-02  1537  	 */
6666cebc5e306f Vladimir Oltean 2019-05-02  1538  	for (i =3D 0; i < SJA1105=
_NUM_PORTS; i++) {
6666cebc5e306f Vladimir Oltean 2019-05-02  1539  		speed_mbps[i] =3D sja110=
5_speed[mac[i].speed];
6666cebc5e306f Vladimir Oltean 2019-05-02  1540  		mac[i].speed =3D SJA1105=
_SPEED_AUTO;
6666cebc5e306f Vladimir Oltean 2019-05-02  1541  	}
6666cebc5e306f Vladimir Oltean 2019-05-02  1542  =

ffe10e679cec9a Vladimir Oltean 2020-03-20  1543  	if (sja1105_supports_sgmi=
i(priv, SJA1105_SGMII_PORT))
ffe10e679cec9a Vladimir Oltean 2020-03-20  1544  		bmcr =3D sja1105_sgmii_r=
ead(priv, MII_BMCR);
ffe10e679cec9a Vladimir Oltean 2020-03-20  1545  =

6cf99c13ea07b5 Vladimir Oltean 2019-11-09  1546  	/* No PTP operations can =
run right now */
6cf99c13ea07b5 Vladimir Oltean 2019-11-09  1547  	mutex_lock(&priv->ptp_dat=
a.lock);
6cf99c13ea07b5 Vladimir Oltean 2019-11-09  1548  =

6cf99c13ea07b5 Vladimir Oltean 2019-11-09  1549  	rc =3D __sja1105_ptp_gett=
imex(ds, &now, &ptp_sts_before);
6cf99c13ea07b5 Vladimir Oltean 2019-11-09  1550  	if (rc < 0)
6cf99c13ea07b5 Vladimir Oltean 2019-11-09  1551  		goto out_unlock_ptp;
6cf99c13ea07b5 Vladimir Oltean 2019-11-09  1552  =

6666cebc5e306f Vladimir Oltean 2019-05-02  1553  	/* Reset switch and send =
updated static configuration */
6666cebc5e306f Vladimir Oltean 2019-05-02  1554  	rc =3D sja1105_static_con=
fig_upload(priv);
6666cebc5e306f Vladimir Oltean 2019-05-02  1555  	if (rc < 0)
6cf99c13ea07b5 Vladimir Oltean 2019-11-09  1556  		goto out_unlock_ptp;
6cf99c13ea07b5 Vladimir Oltean 2019-11-09  1557  =

6cf99c13ea07b5 Vladimir Oltean 2019-11-09  1558  	rc =3D __sja1105_ptp_sett=
ime(ds, 0, &ptp_sts_after);
6cf99c13ea07b5 Vladimir Oltean 2019-11-09  1559  	if (rc < 0)
6cf99c13ea07b5 Vladimir Oltean 2019-11-09  1560  		goto out_unlock_ptp;
6cf99c13ea07b5 Vladimir Oltean 2019-11-09  1561  =

6cf99c13ea07b5 Vladimir Oltean 2019-11-09  1562  	t1 =3D timespec64_to_ns(&=
ptp_sts_before.pre_ts);
6cf99c13ea07b5 Vladimir Oltean 2019-11-09  1563  	t2 =3D timespec64_to_ns(&=
ptp_sts_before.post_ts);
6cf99c13ea07b5 Vladimir Oltean 2019-11-09  1564  	t3 =3D timespec64_to_ns(&=
ptp_sts_after.pre_ts);
6cf99c13ea07b5 Vladimir Oltean 2019-11-09  1565  	t4 =3D timespec64_to_ns(&=
ptp_sts_after.post_ts);
6cf99c13ea07b5 Vladimir Oltean 2019-11-09  1566  	/* Mid point, corresponds=
 to pre-reset PTPCLKVAL */
6cf99c13ea07b5 Vladimir Oltean 2019-11-09  1567  	t12 =3D t1 + (t2 - t1) / =
2;
6cf99c13ea07b5 Vladimir Oltean 2019-11-09  1568  	/* Mid point, corresponds=
 to post-reset PTPCLKVAL, aka 0 */
6cf99c13ea07b5 Vladimir Oltean 2019-11-09  1569  	t34 =3D t3 + (t4 - t3) / =
2;
6cf99c13ea07b5 Vladimir Oltean 2019-11-09  1570  	/* Advance PTPCLKVAL by t=
he time it took since its readout */
6cf99c13ea07b5 Vladimir Oltean 2019-11-09  1571  	now +=3D (t34 - t12);
6cf99c13ea07b5 Vladimir Oltean 2019-11-09  1572  =

6cf99c13ea07b5 Vladimir Oltean 2019-11-09  1573  	__sja1105_ptp_adjtime(ds,=
 now);
6cf99c13ea07b5 Vladimir Oltean 2019-11-09  1574  =

6cf99c13ea07b5 Vladimir Oltean 2019-11-09  1575  out_unlock_ptp:
6cf99c13ea07b5 Vladimir Oltean 2019-11-09  1576  	mutex_unlock(&priv->ptp_d=
ata.lock);
6666cebc5e306f Vladimir Oltean 2019-05-02  1577  =

2eea1fa82f681b Vladimir Oltean 2019-11-12  1578  	dev_info(priv->ds->dev,
2eea1fa82f681b Vladimir Oltean 2019-11-12  1579  		 "Reset switch and progr=
ammed static config. Reason: %s\n",
2eea1fa82f681b Vladimir Oltean 2019-11-12  1580  		 sja1105_reset_reasons[r=
eason]);
2eea1fa82f681b Vladimir Oltean 2019-11-12  1581  =

6666cebc5e306f Vladimir Oltean 2019-05-02  1582  	/* Configure the CGU (PLL=
s) for MII and RMII PHYs.
6666cebc5e306f Vladimir Oltean 2019-05-02  1583  	 * For these interfaces t=
here is no dynamic configuration
6666cebc5e306f Vladimir Oltean 2019-05-02  1584  	 * needed, since PLLs hav=
e same settings at all speeds.
6666cebc5e306f Vladimir Oltean 2019-05-02  1585  	 */
6666cebc5e306f Vladimir Oltean 2019-05-02  1586  	rc =3D sja1105_clocking_s=
etup(priv);
6666cebc5e306f Vladimir Oltean 2019-05-02  1587  	if (rc < 0)
6666cebc5e306f Vladimir Oltean 2019-05-02  1588  		goto out;
6666cebc5e306f Vladimir Oltean 2019-05-02  1589  =

6666cebc5e306f Vladimir Oltean 2019-05-02  1590  	for (i =3D 0; i < SJA1105=
_NUM_PORTS; i++) {
8400cff60b472c Vladimir Oltean 2019-06-08  1591  		rc =3D sja1105_adjust_po=
rt_config(priv, i, speed_mbps[i]);
6666cebc5e306f Vladimir Oltean 2019-05-02  1592  		if (rc < 0)
6666cebc5e306f Vladimir Oltean 2019-05-02  1593  			goto out;
6666cebc5e306f Vladimir Oltean 2019-05-02  1594  	}
ffe10e679cec9a Vladimir Oltean 2020-03-20  1595  =

ffe10e679cec9a Vladimir Oltean 2020-03-20  1596  	if (sja1105_supports_sgmi=
i(priv, SJA1105_SGMII_PORT)) {
ffe10e679cec9a Vladimir Oltean 2020-03-20  1597  		bool an_enabled =3D !!(b=
mcr & BMCR_ANENABLE);
ffe10e679cec9a Vladimir Oltean 2020-03-20  1598  =

ffe10e679cec9a Vladimir Oltean 2020-03-20  1599  		sja1105_sgmii_pcs_config=
(priv, an_enabled, false);
ffe10e679cec9a Vladimir Oltean 2020-03-20  1600  =

ffe10e679cec9a Vladimir Oltean 2020-03-20  1601  		if (!an_enabled) {
ffe10e679cec9a Vladimir Oltean 2020-03-20  1602  			int speed =3D SPEED_UNK=
NOWN;
ffe10e679cec9a Vladimir Oltean 2020-03-20  1603  =

ffe10e679cec9a Vladimir Oltean 2020-03-20  1604  			if (bmcr & BMCR_SPEED10=
00)
ffe10e679cec9a Vladimir Oltean 2020-03-20  1605  				speed =3D SPEED_1000;
ffe10e679cec9a Vladimir Oltean 2020-03-20  1606  			else if (bmcr & BMCR_SP=
EED100)
ffe10e679cec9a Vladimir Oltean 2020-03-20  1607  				speed =3D SPEED_100;
ffe10e679cec9a Vladimir Oltean 2020-03-20 @1608  			else if (bmcr & BMCR_SP=
EED10)
ffe10e679cec9a Vladimir Oltean 2020-03-20  1609  				speed =3D SPEED_10;
ffe10e679cec9a Vladimir Oltean 2020-03-20  1610  =

ffe10e679cec9a Vladimir Oltean 2020-03-20  1611  			sja1105_sgmii_pcs_force=
_speed(priv, speed);
ffe10e679cec9a Vladimir Oltean 2020-03-20  1612  		}
ffe10e679cec9a Vladimir Oltean 2020-03-20  1613  	}
6666cebc5e306f Vladimir Oltean 2019-05-02  1614  out:
af580ae2dcb250 Vladimir Oltean 2019-11-09  1615  	mutex_unlock(&priv->mgmt_=
lock);
af580ae2dcb250 Vladimir Oltean 2019-11-09  1616  =

6666cebc5e306f Vladimir Oltean 2019-05-02  1617  	return rc;
6666cebc5e306f Vladimir Oltean 2019-05-02  1618  }
6666cebc5e306f Vladimir Oltean 2019-05-02  1619  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============0134024045551049402==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============0134024045551049402==--

