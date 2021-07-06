Content-Type: multipart/mixed; boundary="===============8805884941813400542=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [arm:zii 27/44] drivers/net/phy/marvell10g.c:739:6: warning: Unused variable: val [unusedVariable]
Date: Tue, 06 Jul 2021 08:46:14 +0800
Message-ID: <202107060803.F4qS7S9s-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8805884941813400542==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-arm-kernel(a)lists.infradead.org
TO: Russell King <rmk+kernel@armlinux.org.uk>

tree:   git://git.armlinux.org.uk/~rmk/linux-arm.git zii
head:   2204ce3ae7d42297a56dbbee583ea05408f01cfe
commit: d3a04468f32dbaa68aaef7dc6851fb882f9ee01f [27/44] net: phy: marvell1=
0g: select host interface configuration
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
compiler: m68k-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/net/phy/marvell10g.c:739:6: warning: Unused variable: val [unuse=
dVariable]
    int val, ret, err, mactype =3D -1;
        ^

vim +739 drivers/net/phy/marvell10g.c

d3a04468f32dba Russell King      2020-08-16  734  =

97bbe3bd6922e7 Marek Beh=C3=BAn       2021-04-07  735  static int mv3310_co=
nfig_init(struct phy_device *phydev)
97bbe3bd6922e7 Marek Beh=C3=BAn       2021-04-07  736  {
261a74c64bb67f Marek Beh=C3=BAn       2021-04-07  737  	struct mv3310_priv =
*priv =3D dev_get_drvdata(&phydev->mdio.dev);
97bbe3bd6922e7 Marek Beh=C3=BAn       2021-04-07  738  	const struct mv3310=
_chip *chip =3D to_mv3310_chip(phydev);
d3a04468f32dba Russell King      2020-08-16 @739  	int val, ret, err, macty=
pe =3D -1;
c9cc1c815d36f9 Russell King      2020-03-03  740  =

20b2af32ff3f0a Russell King      2017-06-05  741  	/* Check that the PHY in=
terface type is compatible */
d3a04468f32dba Russell King      2020-08-16  742  	if (!phy_interface_empty=
(phydev->host_interfaces)) {
d3a04468f32dba Russell King      2020-08-16  743  		mactype =3D mv3310_sele=
ct_mode(phydev, phydev->host_interfaces);
d3a04468f32dba Russell King      2020-08-16  744  	} else if (!test_bit(phy=
dev->interface, priv->supported_interfaces)) {
20b2af32ff3f0a Russell King      2017-06-05  745  		return -ENODEV;
d3a04468f32dba Russell King      2020-08-16  746  	}
20b2af32ff3f0a Russell King      2017-06-05  747  =

8d8963c3db6c38 Russell King      2020-03-03  748  	phydev->mdix_ctrl =3D ET=
H_TP_MDI_AUTO;
8d8963c3db6c38 Russell King      2020-03-03  749  =

c9cc1c815d36f9 Russell King      2020-03-03  750  	/* Power up so reset wor=
ks */
c9cc1c815d36f9 Russell King      2020-03-03  751  	err =3D mv3310_power_up(=
phydev);
c9cc1c815d36f9 Russell King      2020-03-03  752  	if (err)
c9cc1c815d36f9 Russell King      2020-03-03  753  		return err;
c9cc1c815d36f9 Russell King      2020-03-03  754  =

d3a04468f32dba Russell King      2020-08-16  755  	if (mactype =3D=3D -1) {
97bbe3bd6922e7 Marek Beh=C3=BAn       2021-04-07  756  		mactype =3D chip->=
get_mactype(phydev);
97bbe3bd6922e7 Marek Beh=C3=BAn       2021-04-07  757  		if (mactype < 0)
97bbe3bd6922e7 Marek Beh=C3=BAn       2021-04-07  758  			return mactype;
d3a04468f32dba Russell King      2020-08-16  759  	} else {
d3a04468f32dba Russell King      2020-08-16  760  		/* FIXME For 88x2210 */
d3a04468f32dba Russell King      2020-08-16  761  		ret =3D phy_modify_mmd_=
changed(phydev, MDIO_MMD_VEND2,
d3a04468f32dba Russell King      2020-08-16  762  					     MV_V2_PORT_CTRL,
d3a04468f32dba Russell King      2020-08-16  763  					     MV_V2_33X0_PORT=
_CTRL_MACTYPE_MASK,
d3a04468f32dba Russell King      2020-08-16  764  					     mactype);
d3a04468f32dba Russell King      2020-08-16  765  		if (ret > 0)
d3a04468f32dba Russell King      2020-08-16  766  			ret =3D phy_modify_mmd=
(phydev, MDIO_MMD_VEND2,
d3a04468f32dba Russell King      2020-08-16  767  					     MV_V2_PORT_CTRL,
d3a04468f32dba Russell King      2020-08-16  768  					     MV_V2_33X0_PORT=
_CTRL_SWRST,
d3a04468f32dba Russell King      2020-08-16  769  					     MV_V2_33X0_PORT=
_CTRL_SWRST);
d3a04468f32dba Russell King      2020-08-16  770  =

d3a04468f32dba Russell King      2020-08-16  771  		if (ret < 0)
d3a04468f32dba Russell King      2020-08-16  772  			return ret;
d3a04468f32dba Russell King      2020-08-16  773  	}
97bbe3bd6922e7 Marek Beh=C3=BAn       2021-04-07  774  =

97bbe3bd6922e7 Marek Beh=C3=BAn       2021-04-07  775  	err =3D chip->init_=
interface(phydev, mactype);
ccbf2891de9813 Marek Beh=C3=BAn       2021-04-07  776  	if (err) {
ccbf2891de9813 Marek Beh=C3=BAn       2021-04-07  777  		phydev_err(phydev,=
 "MACTYPE configuration invalid\n");
97bbe3bd6922e7 Marek Beh=C3=BAn       2021-04-07  778  		return err;
ccbf2891de9813 Marek Beh=C3=BAn       2021-04-07  779  	}
e11703330a5df4 Baruch Siach      2020-06-28  780  =

a585c03e63fd35 Russell King      2020-03-03  781  	/* Enable EDPD mode - sa=
ving 600mW */
94167cec916c65 Russell King      2019-11-29  782  	err =3D mv3310_set_edpd(=
phydev, ETHTOOL_PHY_EDPD_DFLT_TX_MSECS);
94167cec916c65 Russell King      2019-11-29  783  	if (err)
94167cec916c65 Russell King      2019-11-29  784  		return err;
94167cec916c65 Russell King      2019-11-29  785  =

94167cec916c65 Russell King      2019-11-29  786  	/* Allow downshift */
94167cec916c65 Russell King      2019-11-29  787  	err =3D mv3310_set_downs=
hift(phydev, DOWNSHIFT_DEV_DEFAULT_COUNT);
94167cec916c65 Russell King      2019-11-29  788  	if (err && err !=3D -EOP=
NOTSUPP)
94167cec916c65 Russell King      2019-11-29  789  		return err;
94167cec916c65 Russell King      2019-11-29  790  =

dadd276498b77d Russell King      2019-12-01  791  	return mv3310_leds_write=
(phydev);
7414542406cd38 Maxime Chevallier 2019-02-23  792  }
7414542406cd38 Maxime Chevallier 2019-02-23  793  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8805884941813400542==--

