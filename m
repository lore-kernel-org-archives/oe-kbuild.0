Content-Type: multipart/mixed; boundary="===============1282768512559924844=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: [frank-w-bpi-r2-4.14:5.6-main 37/41] drivers/net/wireless/mediatek/mt76_new/mt7615/mac.c:1515 mt7615_mac_adjust_sensitivity() warn: assigning (-98) to unsigned variable 'def_th'
Date: Wed, 22 Apr 2020 20:06:52 +0800
Message-ID: <202004222048.YzGPPt7j%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1282768512559924844==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Frank Wunderlich <frank-w@public-files.de>

tree:   https://github.com/frank-w/BPI-R2-4.14 5.6-main
head:   1944ca382365022a8bf3895ee49b47f24e810b5d
commit: 53a7ee94e2f945237664b17bf744c9a2889c81de [37/41] mt7622: add mt76 w=
ireless driver folder from openwrt
:::::: branch date: 10 days ago
:::::: commit date: 11 days ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/net/wireless/mediatek/mt76_new/mt7615/mac.c:1515 mt7615_mac_adjust_=
sensitivity() warn: assigning (-98) to unsigned variable 'def_th'
drivers/net/wireless/mediatek/mt76_new/agg-rx.c:135 mt76_rx_aggr_check_ctl(=
) warn: potential spectre issue 'wcid->aggr' [w]
drivers/net/wireless/mediatek/mt76_new/agg-rx.c:135 mt76_rx_aggr_check_ctl(=
) warn: possible spectre second half.  '__u.__val'

Old smatch warnings:
drivers/net/wireless/mediatek/mt76_new/mt7615/mac.c:1515 mt7615_mac_adjust_=
sensitivity() warn: assigning (-110) to unsigned variable 'def_th'
drivers/net/wireless/mediatek/mt76_new/mt7615/mac.c:1564 mt7615_mac_adjust_=
sensitivity() warn: if statement not indented

# https://github.com/frank-w/BPI-R2-4.14/commit/53a7ee94e2f945237664b17bf74=
4c9a2889c81de
git remote add frank-w-bpi-r2-4.14 https://github.com/frank-w/BPI-R2-4.14
git remote update frank-w-bpi-r2-4.14
git checkout 53a7ee94e2f945237664b17bf744c9a2889c81de
vim +/def_th +1515 drivers/net/wireless/mediatek/mt76_new/mt7615/mac.c

53a7ee94e2f945 Frank Wunderlich 2020-04-11  1507  =

53a7ee94e2f945 Frank Wunderlich 2020-04-11  1508  static void
53a7ee94e2f945 Frank Wunderlich 2020-04-11  1509  mt7615_mac_adjust_sensiti=
vity(struct mt7615_phy *phy,
53a7ee94e2f945 Frank Wunderlich 2020-04-11  1510  			      u32 rts_err_rate=
, bool ofdm)
53a7ee94e2f945 Frank Wunderlich 2020-04-11  1511  {
53a7ee94e2f945 Frank Wunderlich 2020-04-11  1512  	struct mt7615_dev *dev =
=3D phy->dev;
53a7ee94e2f945 Frank Wunderlich 2020-04-11  1513  	int false_cca =3D ofdm ?=
 phy->false_cca_ofdm : phy->false_cca_cck;
53a7ee94e2f945 Frank Wunderlich 2020-04-11  1514  	bool ext_phy =3D phy !=
=3D &dev->phy;
53a7ee94e2f945 Frank Wunderlich 2020-04-11 @1515  	u16 def_th =3D ofdm ? -9=
8 : -110;
53a7ee94e2f945 Frank Wunderlich 2020-04-11  1516  	bool update =3D false;
53a7ee94e2f945 Frank Wunderlich 2020-04-11  1517  	s8 *sensitivity;
53a7ee94e2f945 Frank Wunderlich 2020-04-11  1518  	int signal;
53a7ee94e2f945 Frank Wunderlich 2020-04-11  1519  =

53a7ee94e2f945 Frank Wunderlich 2020-04-11  1520  	sensitivity =3D ofdm ? &=
phy->ofdm_sensitivity : &phy->cck_sensitivity;
53a7ee94e2f945 Frank Wunderlich 2020-04-11  1521  	signal =3D mt76_get_min_=
avg_rssi(&dev->mt76, ext_phy);
53a7ee94e2f945 Frank Wunderlich 2020-04-11  1522  	if (!signal) {
53a7ee94e2f945 Frank Wunderlich 2020-04-11  1523  		mt7615_mac_set_default_=
sensitivity(phy);
53a7ee94e2f945 Frank Wunderlich 2020-04-11  1524  		return;
53a7ee94e2f945 Frank Wunderlich 2020-04-11  1525  	}
53a7ee94e2f945 Frank Wunderlich 2020-04-11  1526  =

53a7ee94e2f945 Frank Wunderlich 2020-04-11  1527  	signal =3D min(signal, -=
72);
53a7ee94e2f945 Frank Wunderlich 2020-04-11  1528  	if (false_cca > 500) {
53a7ee94e2f945 Frank Wunderlich 2020-04-11  1529  		if (rts_err_rate > MT_F=
RAC(40, 100))
53a7ee94e2f945 Frank Wunderlich 2020-04-11  1530  			return;
53a7ee94e2f945 Frank Wunderlich 2020-04-11  1531  =

53a7ee94e2f945 Frank Wunderlich 2020-04-11  1532  		/* decrease coverage */
53a7ee94e2f945 Frank Wunderlich 2020-04-11  1533  		if (*sensitivity =3D=3D=
 def_th && signal > -90) {
53a7ee94e2f945 Frank Wunderlich 2020-04-11  1534  			*sensitivity =3D -90;
53a7ee94e2f945 Frank Wunderlich 2020-04-11  1535  			update =3D true;
53a7ee94e2f945 Frank Wunderlich 2020-04-11  1536  		} else if (*sensitivity=
 + 2 < signal) {
53a7ee94e2f945 Frank Wunderlich 2020-04-11  1537  			*sensitivity +=3D 2;
53a7ee94e2f945 Frank Wunderlich 2020-04-11  1538  			update =3D true;
53a7ee94e2f945 Frank Wunderlich 2020-04-11  1539  		}
53a7ee94e2f945 Frank Wunderlich 2020-04-11  1540  	} else if ((false_cca > =
0 && false_cca < 50) ||
53a7ee94e2f945 Frank Wunderlich 2020-04-11  1541  		   rts_err_rate > MT_FR=
AC(60, 100)) {
53a7ee94e2f945 Frank Wunderlich 2020-04-11  1542  		/* increase coverage */
53a7ee94e2f945 Frank Wunderlich 2020-04-11  1543  		if (*sensitivity - 2 >=
=3D def_th) {
53a7ee94e2f945 Frank Wunderlich 2020-04-11  1544  			*sensitivity -=3D 2;
53a7ee94e2f945 Frank Wunderlich 2020-04-11  1545  			update =3D true;
53a7ee94e2f945 Frank Wunderlich 2020-04-11  1546  		}
53a7ee94e2f945 Frank Wunderlich 2020-04-11  1547  	}
53a7ee94e2f945 Frank Wunderlich 2020-04-11  1548  =

53a7ee94e2f945 Frank Wunderlich 2020-04-11  1549  	if (*sensitivity > signa=
l) {
53a7ee94e2f945 Frank Wunderlich 2020-04-11  1550  		*sensitivity =3D signal;
53a7ee94e2f945 Frank Wunderlich 2020-04-11  1551  		update =3D true;
53a7ee94e2f945 Frank Wunderlich 2020-04-11  1552  	}
53a7ee94e2f945 Frank Wunderlich 2020-04-11  1553  =

53a7ee94e2f945 Frank Wunderlich 2020-04-11  1554  	if (update) {
53a7ee94e2f945 Frank Wunderlich 2020-04-11  1555  		u16 val;
53a7ee94e2f945 Frank Wunderlich 2020-04-11  1556  =

53a7ee94e2f945 Frank Wunderlich 2020-04-11  1557  		if (ofdm) {
53a7ee94e2f945 Frank Wunderlich 2020-04-11  1558  			val =3D *sensitivity *=
 2 + 512;
53a7ee94e2f945 Frank Wunderlich 2020-04-11  1559  			mt76_rmw(dev, MT_WF_PH=
Y_MIN_PRI_PWR(ext_phy),
53a7ee94e2f945 Frank Wunderlich 2020-04-11  1560  				 MT_WF_PHY_PD_OFDM_MA=
SK(ext_phy),
53a7ee94e2f945 Frank Wunderlich 2020-04-11  1561  				 MT_WF_PHY_PD_OFDM(ex=
t_phy, val));
53a7ee94e2f945 Frank Wunderlich 2020-04-11  1562  		} else {
53a7ee94e2f945 Frank Wunderlich 2020-04-11  1563  			val =3D *sensitivity +=
 256;
53a7ee94e2f945 Frank Wunderlich 2020-04-11  1564  			if (!ext_phy)
53a7ee94e2f945 Frank Wunderlich 2020-04-11  1565  			mt76_rmw(dev, MT_WF_PH=
Y_RXTD_CCK_PD(ext_phy),
53a7ee94e2f945 Frank Wunderlich 2020-04-11  1566  				 MT_WF_PHY_PD_CCK_MAS=
K(ext_phy),
53a7ee94e2f945 Frank Wunderlich 2020-04-11  1567  				 MT_WF_PHY_PD_CCK(ext=
_phy, val));
53a7ee94e2f945 Frank Wunderlich 2020-04-11  1568  		}
53a7ee94e2f945 Frank Wunderlich 2020-04-11  1569  		phy->last_cca_adj =3D j=
iffies;
53a7ee94e2f945 Frank Wunderlich 2020-04-11  1570  	}
53a7ee94e2f945 Frank Wunderlich 2020-04-11  1571  }
53a7ee94e2f945 Frank Wunderlich 2020-04-11  1572  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1282768512559924844==--

