Content-Type: multipart/mixed; boundary="===============1990627942221127833=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [nbd168-wireless:mt76 63/120] drivers/net/wireless/mediatek/mt76/mt7615/mac.c:1451 mt7615_mac_adjust_sensitivity() warn: if statement not indented
Date: Mon, 03 Feb 2020 13:21:01 +0300
Message-ID: <20200203102101.GL11068@kadam>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1990627942221127833==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/nbd168/wireless mt76
head:   ce1154404fd63e1ff567395382f716044bbe972f
commit: 7c9eb168979ee1222205ee624d1fca59830acabe [63/120] mt76: mt7615: add=
 missing settings for simultaneous dual-band support

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/net/wireless/mediatek/mt76/mt7615/mac.c:1451 mt7615_mac_adjust_sens=
itivity() warn: if statement not indented

Old smatch warnings:
drivers/net/wireless/mediatek/mt76/mt7615/mac.c:1402 mt7615_mac_adjust_sens=
itivity() warn: assigning (-98) to unsigned variable 'def_th'
drivers/net/wireless/mediatek/mt76/mt7615/mac.c:1402 mt7615_mac_adjust_sens=
itivity() warn: assigning (-110) to unsigned variable 'def_th'

# https://github.com/nbd168/wireless/commit/7c9eb168979ee1222205ee624d1fca5=
9830acabe
git remote add nbd168-wireless https://github.com/nbd168/wireless
git remote update nbd168-wireless
git checkout 7c9eb168979ee1222205ee624d1fca59830acabe
vim +1451 drivers/net/wireless/mediatek/mt76/mt7615/mac.c

49de79ad9a748c Lorenzo Bianconi 2019-07-28  1436  	if (*sensitivity > signa=
l) {
49de79ad9a748c Lorenzo Bianconi 2019-07-28  1437  		*sensitivity =3D signal;
49de79ad9a748c Lorenzo Bianconi 2019-07-28  1438  		update =3D true;
49de79ad9a748c Lorenzo Bianconi 2019-07-28  1439  	}
49de79ad9a748c Lorenzo Bianconi 2019-07-28  1440  =

49de79ad9a748c Lorenzo Bianconi 2019-07-28  1441  	if (update) {
49de79ad9a748c Lorenzo Bianconi 2019-07-28  1442  		u16 val;
49de79ad9a748c Lorenzo Bianconi 2019-07-28  1443  =

49de79ad9a748c Lorenzo Bianconi 2019-07-28  1444  		if (ofdm) {
49de79ad9a748c Lorenzo Bianconi 2019-07-28  1445  			val =3D *sensitivity *=
 2 + 512;
7c9eb168979ee1 Ryder Lee        2019-12-24  1446  			mt76_rmw(dev, MT_WF_PH=
Y_MIN_PRI_PWR(ext_phy),
7c9eb168979ee1 Ryder Lee        2019-12-24  1447  				 MT_WF_PHY_PD_OFDM_MA=
SK(ext_phy),
7c9eb168979ee1 Ryder Lee        2019-12-24  1448  				 MT_WF_PHY_PD_OFDM(ex=
t_phy, val));
49de79ad9a748c Lorenzo Bianconi 2019-07-28  1449  		} else {
49de79ad9a748c Lorenzo Bianconi 2019-07-28  1450  			val =3D *sensitivity +=
 256;
e65b8bc2cbc0a0 Felix Fietkau    2019-10-26 @1451  			if (!ext_phy)

Missing if return or something?

7c9eb168979ee1 Ryder Lee        2019-12-24  1452  			mt76_rmw(dev, MT_WF_PH=
Y_RXTD_CCK_PD(ext_phy),
7c9eb168979ee1 Ryder Lee        2019-12-24  1453  				 MT_WF_PHY_PD_CCK_MAS=
K(ext_phy),
7c9eb168979ee1 Ryder Lee        2019-12-24  1454  				 MT_WF_PHY_PD_CCK(ext=
_phy, val));
49de79ad9a748c Lorenzo Bianconi 2019-07-28  1455  		}
e65b8bc2cbc0a0 Felix Fietkau    2019-10-26  1456  		phy->last_cca_adj =3D j=
iffies;
49de79ad9a748c Lorenzo Bianconi 2019-07-28  1457  	}
49de79ad9a748c Lorenzo Bianconi 2019-07-28  1458  }
49de79ad9a748c Lorenzo Bianconi 2019-07-28  1459  =


---
0-DAY kernel test infrastructure                 Open Source Technology Cen=
ter
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org Intel Corpor=
ation
--===============1990627942221127833==--

