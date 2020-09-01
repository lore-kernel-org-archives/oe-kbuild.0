Content-Type: multipart/mixed; boundary="===============3326383441695069614=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 2/4] mmc: core: add a 'doing_init_tune' flag and a 'mmc_doing_tune' helper
Date: Wed, 02 Sep 2020 06:11:32 +0800
Message-ID: <202009020600.UG6xATmo%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3326383441695069614==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20200901150250.26236-3-wsa+renesas@sang-engineering.com>
References: <20200901150250.26236-3-wsa+renesas@sang-engineering.com>
TO: Wolfram Sang <wsa-dev@sang-engineering.com>

Hi Wolfram,

I love your patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v5.9-rc3 next-20200828]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Wolfram-Sang/renesas_sdhi-=
fix-hang-when-SCC-loses-its-clock/20200901-230407
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
b51594df17d0ce80b9f9f35394a1f42d7ac94472
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
compiler: s390-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> drivers/mmc/core/mmc.c:1776:25: warning: Variable 'host->doing_init_tune=
' is reassigned a value before the old one has been used. [redundantAssignm=
ent]
     host->doing_init_tune =3D 0;
                           ^
   drivers/mmc/core/mmc.c:1766:25: note: Variable 'host->doing_init_tune' i=
s reassigned a value before the old one has been used.
     host->doing_init_tune =3D 1;
                           ^
   drivers/mmc/core/mmc.c:1776:25: note: Variable 'host->doing_init_tune' i=
s reassigned a value before the old one has been used.
     host->doing_init_tune =3D 0;
                           ^

# https://github.com/0day-ci/linux/commit/92e69233509a1bf26b26a5128f22022e3=
a46bd37
git remote add linux-review https://github.com/0day-ci/linux
git fetch --no-tags linux-review Wolfram-Sang/renesas_sdhi-fix-hang-when-SC=
C-loses-its-clock/20200901-230407
git checkout 92e69233509a1bf26b26a5128f22022e3a46bd37
vim +1776 drivers/mmc/core/mmc.c

577fb13199b11d Seungwon Jeon     2014-04-23  1546  =

7ea239d9e6d699 Pierre Ossman     2006-12-31  1547  /*
6abaa0c9fec563 Pierre Ossman     2007-05-01  1548   * Handle the detection =
and initialisation of a card.
6abaa0c9fec563 Pierre Ossman     2007-05-01  1549   *
8769392b1918ec Deepak Saxena     2008-06-16  1550   * In the case of a resu=
me, "oldcard" will contain the card
6abaa0c9fec563 Pierre Ossman     2007-05-01  1551   * we're trying to reini=
tialise.
7ea239d9e6d699 Pierre Ossman     2006-12-31  1552   */
8c75deae1ab996 Pierre Ossman     2007-05-19  1553  static int mmc_init_card=
(struct mmc_host *host, u32 ocr,
6abaa0c9fec563 Pierre Ossman     2007-05-01  1554  	struct mmc_card *oldcar=
d)
7ea239d9e6d699 Pierre Ossman     2006-12-31  1555  {
7ea239d9e6d699 Pierre Ossman     2006-12-31  1556  	struct mmc_card *card;
577fb13199b11d Seungwon Jeon     2014-04-23  1557  	int err;
7ea239d9e6d699 Pierre Ossman     2006-12-31  1558  	u32 cid[4];
b676f0391a5f68 Philip Rakity     2011-02-13  1559  	u32 rocr;
7ea239d9e6d699 Pierre Ossman     2006-12-31  1560  =

d84075c8aed771 Pierre Ossman     2007-08-09  1561  	WARN_ON(!host->claimed);
7ea239d9e6d699 Pierre Ossman     2006-12-31  1562  =

44669034815a7a Stefan Nilsson XK 2011-09-15  1563  	/* Set correct bus mode=
 for MMC before attempting init */
44669034815a7a Stefan Nilsson XK 2011-09-15  1564  	if (!mmc_host_is_spi(ho=
st))
44669034815a7a Stefan Nilsson XK 2011-09-15  1565  		mmc_set_bus_mode(host,=
 MMC_BUSMODE_OPENDRAIN);
44669034815a7a Stefan Nilsson XK 2011-09-15  1566  =

7ea239d9e6d699 Pierre Ossman     2006-12-31  1567  	/*
7ea239d9e6d699 Pierre Ossman     2006-12-31  1568  	 * Since we're changing=
 the OCR value, we seem to
7ea239d9e6d699 Pierre Ossman     2006-12-31  1569  	 * need to tell some ca=
rds to go back to the idle
7ea239d9e6d699 Pierre Ossman     2006-12-31  1570  	 * state.  We wait 1ms =
to give cards time to
7ea239d9e6d699 Pierre Ossman     2006-12-31  1571  	 * respond.
c3805467aad7ce Balaji T K        2011-09-08  1572  	 * mmc_go_idle is neede=
d for eMMC that are asleep
7ea239d9e6d699 Pierre Ossman     2006-12-31  1573  	 */
7ea239d9e6d699 Pierre Ossman     2006-12-31  1574  	mmc_go_idle(host);
7ea239d9e6d699 Pierre Ossman     2006-12-31  1575  =

7ea239d9e6d699 Pierre Ossman     2006-12-31  1576  	/* The extra bit indica=
tes that we support high capacity */
b676f0391a5f68 Philip Rakity     2011-02-13  1577  	err =3D mmc_send_op_con=
d(host, ocr | (1 << 30), &rocr);
17b0429dde9ab6 Pierre Ossman     2007-07-22  1578  	if (err)
6abaa0c9fec563 Pierre Ossman     2007-05-01  1579  		goto err;
7ea239d9e6d699 Pierre Ossman     2006-12-31  1580  =

af51715079e7fb David Brownell    2007-08-08  1581  	/*
af51715079e7fb David Brownell    2007-08-08  1582  	 * For SPI, enable CRC =
as appropriate.
af51715079e7fb David Brownell    2007-08-08  1583  	 */
af51715079e7fb David Brownell    2007-08-08  1584  	if (mmc_host_is_spi(hos=
t)) {
af51715079e7fb David Brownell    2007-08-08  1585  		err =3D mmc_spi_set_cr=
c(host, use_spi_crc);
af51715079e7fb David Brownell    2007-08-08  1586  		if (err)
af51715079e7fb David Brownell    2007-08-08  1587  			goto err;
af51715079e7fb David Brownell    2007-08-08  1588  	}
af51715079e7fb David Brownell    2007-08-08  1589  =

7ea239d9e6d699 Pierre Ossman     2006-12-31  1590  	/*
7ea239d9e6d699 Pierre Ossman     2006-12-31  1591  	 * Fetch CID from card.
7ea239d9e6d699 Pierre Ossman     2006-12-31  1592  	 */
af51715079e7fb David Brownell    2007-08-08  1593  	err =3D mmc_send_cid(ho=
st, cid);
17b0429dde9ab6 Pierre Ossman     2007-07-22  1594  	if (err)
7ea239d9e6d699 Pierre Ossman     2006-12-31  1595  		goto err;
7ea239d9e6d699 Pierre Ossman     2006-12-31  1596  =

6abaa0c9fec563 Pierre Ossman     2007-05-01  1597  	if (oldcard) {
adf66a0dc5e8be Pierre Ossman     2007-07-22  1598  		if (memcmp(cid, oldcar=
d->raw_cid, sizeof(cid)) !=3D 0) {
099b648116090a hongjiefang       2019-02-28  1599  			pr_debug("%s: Perhaps=
 the card was replaced\n",
099b648116090a hongjiefang       2019-02-28  1600  				mmc_hostname(host));
adf66a0dc5e8be Pierre Ossman     2007-07-22  1601  			err =3D -ENOENT;
6abaa0c9fec563 Pierre Ossman     2007-05-01  1602  			goto err;
adf66a0dc5e8be Pierre Ossman     2007-07-22  1603  		}
6abaa0c9fec563 Pierre Ossman     2007-05-01  1604  =

6abaa0c9fec563 Pierre Ossman     2007-05-01  1605  		card =3D oldcard;
6abaa0c9fec563 Pierre Ossman     2007-05-01  1606  	} else {
7ea239d9e6d699 Pierre Ossman     2006-12-31  1607  		/*
7ea239d9e6d699 Pierre Ossman     2006-12-31  1608  		 * Allocate card struc=
ture.
7ea239d9e6d699 Pierre Ossman     2006-12-31  1609  		 */
51ec92e295d563 Pierre Ossman     2008-03-21  1610  		card =3D mmc_alloc_car=
d(host, &mmc_type);
adf66a0dc5e8be Pierre Ossman     2007-07-22  1611  		if (IS_ERR(card)) {
adf66a0dc5e8be Pierre Ossman     2007-07-22  1612  			err =3D PTR_ERR(card);
7ea239d9e6d699 Pierre Ossman     2006-12-31  1613  			goto err;
adf66a0dc5e8be Pierre Ossman     2007-07-22  1614  		}
7ea239d9e6d699 Pierre Ossman     2006-12-31  1615  =

6904115095ad60 Ulf Hansson       2013-09-13  1616  		card->ocr =3D ocr;
7ea239d9e6d699 Pierre Ossman     2006-12-31  1617  		card->type =3D MMC_TYP=
E_MMC;
7ea239d9e6d699 Pierre Ossman     2006-12-31  1618  		card->rca =3D 1;
7ea239d9e6d699 Pierre Ossman     2006-12-31  1619  		memcpy(card->raw_cid, =
cid, sizeof(card->raw_cid));
6abaa0c9fec563 Pierre Ossman     2007-05-01  1620  	}
7ea239d9e6d699 Pierre Ossman     2006-12-31  1621  =

eac86321b5c33e Doug Anderson     2014-12-02  1622  	/*
eac86321b5c33e Doug Anderson     2014-12-02  1623  	 * Call the optional HC=
's init_card function to handle quirks.
eac86321b5c33e Doug Anderson     2014-12-02  1624  	 */
eac86321b5c33e Doug Anderson     2014-12-02  1625  	if (host->ops->init_car=
d)
eac86321b5c33e Doug Anderson     2014-12-02  1626  		host->ops->init_card(h=
ost, card);
eac86321b5c33e Doug Anderson     2014-12-02  1627  =

7ea239d9e6d699 Pierre Ossman     2006-12-31  1628  	/*
af51715079e7fb David Brownell    2007-08-08  1629  	 * For native busses:  =
set card RCA and quit open drain mode.
7ea239d9e6d699 Pierre Ossman     2006-12-31  1630  	 */
af51715079e7fb David Brownell    2007-08-08  1631  	if (!mmc_host_is_spi(ho=
st)) {
7ea239d9e6d699 Pierre Ossman     2006-12-31  1632  		err =3D mmc_set_relati=
ve_addr(card);
17b0429dde9ab6 Pierre Ossman     2007-07-22  1633  		if (err)
7ea239d9e6d699 Pierre Ossman     2006-12-31  1634  			goto free_card;
7ea239d9e6d699 Pierre Ossman     2006-12-31  1635  =

7ea239d9e6d699 Pierre Ossman     2006-12-31  1636  		mmc_set_bus_mode(host,=
 MMC_BUSMODE_PUSHPULL);
af51715079e7fb David Brownell    2007-08-08  1637  	}
7ea239d9e6d699 Pierre Ossman     2006-12-31  1638  =

6abaa0c9fec563 Pierre Ossman     2007-05-01  1639  	if (!oldcard) {
7ea239d9e6d699 Pierre Ossman     2006-12-31  1640  		/*
7ea239d9e6d699 Pierre Ossman     2006-12-31  1641  		 * Fetch CSD from card.
7ea239d9e6d699 Pierre Ossman     2006-12-31  1642  		 */
7ea239d9e6d699 Pierre Ossman     2006-12-31  1643  		err =3D mmc_send_csd(c=
ard, card->raw_csd);
17b0429dde9ab6 Pierre Ossman     2007-07-22  1644  		if (err)
7ea239d9e6d699 Pierre Ossman     2006-12-31  1645  			goto free_card;
7ea239d9e6d699 Pierre Ossman     2006-12-31  1646  =

bd766312618d2e Pierre Ossman     2007-05-01  1647  		err =3D mmc_decode_csd=
(card);
adf66a0dc5e8be Pierre Ossman     2007-07-22  1648  		if (err)
bd766312618d2e Pierre Ossman     2007-05-01  1649  			goto free_card;
bd766312618d2e Pierre Ossman     2007-05-01  1650  		err =3D mmc_decode_cid=
(card);
adf66a0dc5e8be Pierre Ossman     2007-07-22  1651  		if (err)
bd766312618d2e Pierre Ossman     2007-05-01  1652  			goto free_card;
6abaa0c9fec563 Pierre Ossman     2007-05-01  1653  	}
7ea239d9e6d699 Pierre Ossman     2006-12-31  1654  =

3d705d14fe4c72 Sascha Hauer      2014-08-19  1655  	/*
3d705d14fe4c72 Sascha Hauer      2014-08-19  1656  	 * handling only for ca=
rds supporting DSR and hosts requesting
3d705d14fe4c72 Sascha Hauer      2014-08-19  1657  	 * DSR configuration
3d705d14fe4c72 Sascha Hauer      2014-08-19  1658  	 */
3d705d14fe4c72 Sascha Hauer      2014-08-19  1659  	if (card->csd.dsr_imp &=
& host->dsr_req)
3d705d14fe4c72 Sascha Hauer      2014-08-19  1660  		mmc_set_dsr(host);
3d705d14fe4c72 Sascha Hauer      2014-08-19  1661  =

7ea239d9e6d699 Pierre Ossman     2006-12-31  1662  	/*
89a73cf52ba2ae Pierre Ossman     2007-05-01  1663  	 * Select card, as all =
following commands rely on that.
7ea239d9e6d699 Pierre Ossman     2006-12-31  1664  	 */
af51715079e7fb David Brownell    2007-08-08  1665  	if (!mmc_host_is_spi(ho=
st)) {
7ea239d9e6d699 Pierre Ossman     2006-12-31  1666  		err =3D mmc_select_car=
d(card);
17b0429dde9ab6 Pierre Ossman     2007-07-22  1667  		if (err)
7ea239d9e6d699 Pierre Ossman     2006-12-31  1668  			goto free_card;
af51715079e7fb David Brownell    2007-08-08  1669  	}
7ea239d9e6d699 Pierre Ossman     2006-12-31  1670  =

6abaa0c9fec563 Pierre Ossman     2007-05-01  1671  	if (!oldcard) {
076ec38a58584d Ulf Hansson       2014-10-20  1672  		/* Read extended CSD. =
*/
076ec38a58584d Ulf Hansson       2014-10-20  1673  		err =3D mmc_read_ext_c=
sd(card);
17b0429dde9ab6 Pierre Ossman     2007-07-22  1674  		if (err)
7ea239d9e6d699 Pierre Ossman     2006-12-31  1675  			goto free_card;
b676f0391a5f68 Philip Rakity     2011-02-13  1676  =

87e88659afd1dc Masahiro Yamada   2016-04-15  1677  		/*
87e88659afd1dc Masahiro Yamada   2016-04-15  1678  		 * If doing byte addre=
ssing, check if required to do sector
b676f0391a5f68 Philip Rakity     2011-02-13  1679  		 * addressing.  Handle=
 the case of <2GB cards needing sector
b676f0391a5f68 Philip Rakity     2011-02-13  1680  		 * addressing.  See se=
ction 8.1 JEDEC Standard JED84-A441;
b676f0391a5f68 Philip Rakity     2011-02-13  1681  		 * ocr register has bi=
t 30 set for sector addressing.
b676f0391a5f68 Philip Rakity     2011-02-13  1682  		 */
87e88659afd1dc Masahiro Yamada   2016-04-15  1683  		if (rocr & BIT(30))
b676f0391a5f68 Philip Rakity     2011-02-13  1684  			mmc_card_set_blockadd=
r(card);
b676f0391a5f68 Philip Rakity     2011-02-13  1685  =

dfe86cba7676d5 Adrian Hunter     2010-08-11  1686  		/* Erase size depends =
on CSD and Extended CSD */
dfe86cba7676d5 Adrian Hunter     2010-08-11  1687  		mmc_set_erase_size(car=
d);
6abaa0c9fec563 Pierre Ossman     2007-05-01  1688  	}
7ea239d9e6d699 Pierre Ossman     2006-12-31  1689  =

d2a47176a877b1 Ulf Hansson       2017-06-08  1690  	/* Enable ERASE_GRP_DEF=
. This bit is lost after a reset or power off. */
d2a47176a877b1 Ulf Hansson       2017-06-08  1691  	if (card->ext_csd.rev >=
=3D 3) {
709de99df0ecf3 Chuanxiao Dong    2011-01-22  1692  		err =3D mmc_switch(car=
d, EXT_CSD_CMD_SET_NORMAL,
b23cf0bd55b0c6 Seungwon Jeon     2011-09-23  1693  				 EXT_CSD_ERASE_GROUP=
_DEF, 1,
b23cf0bd55b0c6 Seungwon Jeon     2011-09-23  1694  				 card->ext_csd.gener=
ic_cmd6_time);
709de99df0ecf3 Chuanxiao Dong    2011-01-22  1695  =

709de99df0ecf3 Chuanxiao Dong    2011-01-22  1696  		if (err && err !=3D -E=
BADMSG)
709de99df0ecf3 Chuanxiao Dong    2011-01-22  1697  			goto free_card;
709de99df0ecf3 Chuanxiao Dong    2011-01-22  1698  =

709de99df0ecf3 Chuanxiao Dong    2011-01-22  1699  		if (err) {
709de99df0ecf3 Chuanxiao Dong    2011-01-22  1700  			err =3D 0;
709de99df0ecf3 Chuanxiao Dong    2011-01-22  1701  			/*
709de99df0ecf3 Chuanxiao Dong    2011-01-22  1702  			 * Just disable enhan=
ced area off & sz
709de99df0ecf3 Chuanxiao Dong    2011-01-22  1703  			 * will try to enable=
 ERASE_GROUP_DEF
709de99df0ecf3 Chuanxiao Dong    2011-01-22  1704  			 * during next time r=
einit
709de99df0ecf3 Chuanxiao Dong    2011-01-22  1705  			 */
709de99df0ecf3 Chuanxiao Dong    2011-01-22  1706  			card->ext_csd.enhance=
d_area_offset =3D -EINVAL;
709de99df0ecf3 Chuanxiao Dong    2011-01-22  1707  			card->ext_csd.enhance=
d_area_size =3D -EINVAL;
709de99df0ecf3 Chuanxiao Dong    2011-01-22  1708  		} else {
709de99df0ecf3 Chuanxiao Dong    2011-01-22  1709  			card->ext_csd.erase_g=
roup_def =3D 1;
709de99df0ecf3 Chuanxiao Dong    2011-01-22  1710  			/*
709de99df0ecf3 Chuanxiao Dong    2011-01-22  1711  			 * enable ERASE_GRP_D=
EF successfully.
709de99df0ecf3 Chuanxiao Dong    2011-01-22  1712  			 * This will affect t=
he erase size, so
709de99df0ecf3 Chuanxiao Dong    2011-01-22  1713  			 * here need to reset=
 erase size
709de99df0ecf3 Chuanxiao Dong    2011-01-22  1714  			 */
709de99df0ecf3 Chuanxiao Dong    2011-01-22  1715  			mmc_set_erase_size(ca=
rd);
709de99df0ecf3 Chuanxiao Dong    2011-01-22  1716  		}
709de99df0ecf3 Chuanxiao Dong    2011-01-22  1717  	}
709de99df0ecf3 Chuanxiao Dong    2011-01-22  1718  =

41e2a4893566ce Philip Rakity     2011-03-19  1719  	/*
41e2a4893566ce Philip Rakity     2011-03-19  1720  	 * Ensure eMMC user def=
ault partition is enabled
41e2a4893566ce Philip Rakity     2011-03-19  1721  	 */
371a689f64b0da Andrei Warkentin  2011-04-11  1722  	if (card->ext_csd.part_=
config & EXT_CSD_PART_CONFIG_ACC_MASK) {
371a689f64b0da Andrei Warkentin  2011-04-11  1723  		card->ext_csd.part_con=
fig &=3D ~EXT_CSD_PART_CONFIG_ACC_MASK;
371a689f64b0da Andrei Warkentin  2011-04-11  1724  		err =3D mmc_switch(car=
d, EXT_CSD_CMD_SET_NORMAL, EXT_CSD_PART_CONFIG,
371a689f64b0da Andrei Warkentin  2011-04-11  1725  				 card->ext_csd.part_=
config,
371a689f64b0da Andrei Warkentin  2011-04-11  1726  				 card->ext_csd.part_=
time);
371a689f64b0da Andrei Warkentin  2011-04-11  1727  		if (err && err !=3D -E=
BADMSG)
371a689f64b0da Andrei Warkentin  2011-04-11  1728  			goto free_card;
41e2a4893566ce Philip Rakity     2011-03-19  1729  	}
41e2a4893566ce Philip Rakity     2011-03-19  1730  =

bec8726abc72bf Girish K S        2011-10-13  1731  	/*
43235679341510 Ulf Hansson       2013-06-10  1732  	 * Enable power_off_not=
ification byte in the ext_csd register
bec8726abc72bf Girish K S        2011-10-13  1733  	 */
43235679341510 Ulf Hansson       2013-06-10  1734  	if (card->ext_csd.rev >=
=3D 6) {
bec8726abc72bf Girish K S        2011-10-13  1735  		err =3D mmc_switch(car=
d, EXT_CSD_CMD_SET_NORMAL,
bec8726abc72bf Girish K S        2011-10-13  1736  				 EXT_CSD_POWER_OFF_N=
OTIFICATION,
bec8726abc72bf Girish K S        2011-10-13  1737  				 EXT_CSD_POWER_ON,
bec8726abc72bf Girish K S        2011-10-13  1738  				 card->ext_csd.gener=
ic_cmd6_time);
bec8726abc72bf Girish K S        2011-10-13  1739  		if (err && err !=3D -E=
BADMSG)
bec8726abc72bf Girish K S        2011-10-13  1740  			goto free_card;
bec8726abc72bf Girish K S        2011-10-13  1741  =

96a85d548bf960 Girish K S        2011-11-04  1742  		/*
96a85d548bf960 Girish K S        2011-11-04  1743  		 * The err can be -EBA=
DMSG or 0,
96a85d548bf960 Girish K S        2011-11-04  1744  		 * so check for succes=
s and update the flag
96a85d548bf960 Girish K S        2011-11-04  1745  		 */
bec8726abc72bf Girish K S        2011-10-13  1746  		if (!err)
e6c085863f97f0 Ulf Hansson       2012-10-05  1747  			card->ext_csd.power_o=
ff_notification =3D EXT_CSD_POWER_ON;
96a85d548bf960 Girish K S        2011-11-04  1748  	}
bec8726abc72bf Girish K S        2011-10-13  1749  =

01904ff77676ca Avri Altman       2019-02-06  1750  	/* set erase_arg */
01904ff77676ca Avri Altman       2019-02-06  1751  	if (mmc_can_discard(car=
d))
01904ff77676ca Avri Altman       2019-02-06  1752  		card->erase_arg =3D MM=
C_DISCARD_ARG;
01904ff77676ca Avri Altman       2019-02-06  1753  	else if (mmc_can_trim(c=
ard))
01904ff77676ca Avri Altman       2019-02-06  1754  		card->erase_arg =3D MM=
C_TRIM_ARG;
01904ff77676ca Avri Altman       2019-02-06  1755  	else
01904ff77676ca Avri Altman       2019-02-06  1756  		card->erase_arg =3D MM=
C_ERASE_ARG;
01904ff77676ca Avri Altman       2019-02-06  1757  =

89a73cf52ba2ae Pierre Ossman     2007-05-01  1758  	/*
577fb13199b11d Seungwon Jeon     2014-04-23  1759  	 * Select timing interf=
ace
89a73cf52ba2ae Pierre Ossman     2007-05-01  1760  	 */
577fb13199b11d Seungwon Jeon     2014-04-23  1761  	err =3D mmc_select_timi=
ng(card);
577fb13199b11d Seungwon Jeon     2014-04-23  1762  	if (err)
89a73cf52ba2ae Pierre Ossman     2007-05-01  1763  		goto free_card;
89a73cf52ba2ae Pierre Ossman     2007-05-01  1764  =

a4924c71aa43d4 Girish K S        2012-01-11  1765  	if (mmc_card_hs200(card=
)) {
92e69233509a1b Wolfram Sang      2020-09-01  1766  		host->doing_init_tune =
=3D 1;
92e69233509a1b Wolfram Sang      2020-09-01  1767  =

577fb13199b11d Seungwon Jeon     2014-04-23  1768  		err =3D mmc_hs200_tuni=
ng(card);
577fb13199b11d Seungwon Jeon     2014-04-23  1769  		if (err)
4b75bffc77c40a Andrew Gabbasov   2014-10-01  1770  			goto free_card;
0a5b6438ee4826 Seungwon Jeon     2014-04-23  1771  =

0a5b6438ee4826 Seungwon Jeon     2014-04-23  1772  		err =3D mmc_select_hs4=
00(card);
0a5b6438ee4826 Seungwon Jeon     2014-04-23  1773  		if (err)
4b75bffc77c40a Andrew Gabbasov   2014-10-01  1774  			goto free_card;
92e69233509a1b Wolfram Sang      2020-09-01  1775  =

92e69233509a1b Wolfram Sang      2020-09-01 @1776  		host->doing_init_tune =
=3D 0;
773dc118756b1f Guenter Roeck     2017-03-01  1777  	} else if (!mmc_card_hs=
400es(card)) {
577fb13199b11d Seungwon Jeon     2014-04-23  1778  		/* Select the desired =
bus width optionally */
577fb13199b11d Seungwon Jeon     2014-04-23  1779  		err =3D mmc_select_bus=
_width(card);
3d4ef329757cfd Anssi Hannula     2017-02-13  1780  		if (err > 0 && mmc_car=
d_hs(card)) {
577fb13199b11d Seungwon Jeon     2014-04-23  1781  			err =3D mmc_select_hs=
_ddr(card);
4c4cb171054230 Philip Rakity     2011-05-13  1782  			if (err)
4b75bffc77c40a Andrew Gabbasov   2014-10-01  1783  				goto free_card;
4c4cb171054230 Philip Rakity     2011-05-13  1784  		}
ef0b27d4ccacac Adrian Hunter     2009-09-22  1785  	}
89a73cf52ba2ae Pierre Ossman     2007-05-01  1786  =

2385049dd52b79 Seungwon Jeon     2014-04-23  1787  	/*
2385049dd52b79 Seungwon Jeon     2014-04-23  1788  	 * Choose the power cla=
ss with selected bus interface
2385049dd52b79 Seungwon Jeon     2014-04-23  1789  	 */
2385049dd52b79 Seungwon Jeon     2014-04-23  1790  	mmc_select_powerclass(c=
ard);
2385049dd52b79 Seungwon Jeon     2014-04-23  1791  =

52d0974e36761f Subhash Jadavani  2012-03-06  1792  	/*
52d0974e36761f Subhash Jadavani  2012-03-06  1793  	 * Enable HPI feature (=
if supported)
52d0974e36761f Subhash Jadavani  2012-03-06  1794  	 */
52d0974e36761f Subhash Jadavani  2012-03-06  1795  	if (card->ext_csd.hpi) {
52d0974e36761f Subhash Jadavani  2012-03-06  1796  		err =3D mmc_switch(car=
d, EXT_CSD_CMD_SET_NORMAL,
52d0974e36761f Subhash Jadavani  2012-03-06  1797  				EXT_CSD_HPI_MGMT, 1,
52d0974e36761f Subhash Jadavani  2012-03-06  1798  				card->ext_csd.generi=
c_cmd6_time);
52d0974e36761f Subhash Jadavani  2012-03-06  1799  		if (err && err !=3D -E=
BADMSG)
52d0974e36761f Subhash Jadavani  2012-03-06  1800  			goto free_card;
52d0974e36761f Subhash Jadavani  2012-03-06  1801  		if (err) {
6606110d89aefc Joe Perches       2014-09-12  1802  			pr_warn("%s: Enabling=
 HPI failed\n",
52d0974e36761f Subhash Jadavani  2012-03-06  1803  				mmc_hostname(card->h=
ost));
a0741ba40a009f Ulf Hansson       2018-12-10  1804  			card->ext_csd.hpi_en =
=3D 0;
52d0974e36761f Subhash Jadavani  2012-03-06  1805  			err =3D 0;
a0741ba40a009f Ulf Hansson       2018-12-10  1806  		} else {
52d0974e36761f Subhash Jadavani  2012-03-06  1807  			card->ext_csd.hpi_en =
=3D 1;
52d0974e36761f Subhash Jadavani  2012-03-06  1808  		}
a0741ba40a009f Ulf Hansson       2018-12-10  1809  	}
52d0974e36761f Subhash Jadavani  2012-03-06  1810  =

881d1c25f76593 Seungwon Jeon     2011-10-14  1811  	/*
e3ae3401aa1943 Ulf Hansson       2018-12-10  1812  	 * If cache size is hig=
her than 0, this indicates the existence of cache
e3ae3401aa1943 Ulf Hansson       2018-12-10  1813  	 * and it can be turned=
 on. Note that some eMMCs from Micron has been
e3ae3401aa1943 Ulf Hansson       2018-12-10  1814  	 * reported to need ~80=
0 ms timeout, while enabling the cache after
e3ae3401aa1943 Ulf Hansson       2018-12-10  1815  	 * sudden power failure=
 tests. Let's extend the timeout to a minimum of
e3ae3401aa1943 Ulf Hansson       2018-12-10  1816  	 * DEFAULT_CACHE_EN_TIM=
EOUT_MS and do it for all cards.
881d1c25f76593 Seungwon Jeon     2011-10-14  1817  	 */
ba9f39a785a997 Ulf Hansson       2018-12-10  1818  	if (card->ext_csd.cache=
_size > 0) {
e3ae3401aa1943 Ulf Hansson       2018-12-10  1819  		unsigned int timeout_m=
s =3D MIN_CACHE_EN_TIMEOUT_MS;
e3ae3401aa1943 Ulf Hansson       2018-12-10  1820  =

e3ae3401aa1943 Ulf Hansson       2018-12-10  1821  		timeout_ms =3D max(car=
d->ext_csd.generic_cmd6_time, timeout_ms);
881d1c25f76593 Seungwon Jeon     2011-10-14  1822  		err =3D mmc_switch(car=
d, EXT_CSD_CMD_SET_NORMAL,
e3ae3401aa1943 Ulf Hansson       2018-12-10  1823  				EXT_CSD_CACHE_CTRL, =
1, timeout_ms);
881d1c25f76593 Seungwon Jeon     2011-10-14  1824  		if (err && err !=3D -E=
BADMSG)
881d1c25f76593 Seungwon Jeon     2011-10-14  1825  			goto free_card;
881d1c25f76593 Seungwon Jeon     2011-10-14  1826  =

881d1c25f76593 Seungwon Jeon     2011-10-14  1827  		/*
881d1c25f76593 Seungwon Jeon     2011-10-14  1828  		 * Only if no error, c=
ache is turned on successfully.
881d1c25f76593 Seungwon Jeon     2011-10-14  1829  		 */
8bc0678b845531 Seungwon Jeon     2011-12-09  1830  		if (err) {
6606110d89aefc Joe Perches       2014-09-12  1831  			pr_warn("%s: Cache is=
 supported, but failed to turn on (%d)\n",
8bc0678b845531 Seungwon Jeon     2011-12-09  1832  				mmc_hostname(card->h=
ost), err);
8bc0678b845531 Seungwon Jeon     2011-12-09  1833  			card->ext_csd.cache_c=
trl =3D 0;
8bc0678b845531 Seungwon Jeon     2011-12-09  1834  			err =3D 0;
8bc0678b845531 Seungwon Jeon     2011-12-09  1835  		} else {
8bc0678b845531 Seungwon Jeon     2011-12-09  1836  			card->ext_csd.cache_c=
trl =3D 1;
8bc0678b845531 Seungwon Jeon     2011-12-09  1837  		}
881d1c25f76593 Seungwon Jeon     2011-10-14  1838  	}
881d1c25f76593 Seungwon Jeon     2011-10-14  1839  =

98d4f7809d99bb Adrian Hunter     2017-09-22  1840  	/*
98d4f7809d99bb Adrian Hunter     2017-09-22  1841  	 * Enable Command Queue=
 if supported. Note that Packed Commands cannot
98d4f7809d99bb Adrian Hunter     2017-09-22  1842  	 * be used with Command=
 Queue.
98d4f7809d99bb Adrian Hunter     2017-09-22  1843  	 */
98d4f7809d99bb Adrian Hunter     2017-09-22  1844  	card->ext_csd.cmdq_en =
=3D false;
98d4f7809d99bb Adrian Hunter     2017-09-22  1845  	if (card->ext_csd.cmdq_=
support && host->caps2 & MMC_CAP2_CQE) {
98d4f7809d99bb Adrian Hunter     2017-09-22  1846  		err =3D mmc_cmdq_enabl=
e(card);
98d4f7809d99bb Adrian Hunter     2017-09-22  1847  		if (err && err !=3D -E=
BADMSG)
98d4f7809d99bb Adrian Hunter     2017-09-22  1848  			goto free_card;
98d4f7809d99bb Adrian Hunter     2017-09-22  1849  		if (err) {
98d4f7809d99bb Adrian Hunter     2017-09-22  1850  			pr_warn("%s: Enabling=
 CMDQ failed\n",
98d4f7809d99bb Adrian Hunter     2017-09-22  1851  				mmc_hostname(card->h=
ost));
98d4f7809d99bb Adrian Hunter     2017-09-22  1852  			card->ext_csd.cmdq_su=
pport =3D false;
98d4f7809d99bb Adrian Hunter     2017-09-22  1853  			card->ext_csd.cmdq_de=
pth =3D 0;
98d4f7809d99bb Adrian Hunter     2017-09-22  1854  			err =3D 0;
98d4f7809d99bb Adrian Hunter     2017-09-22  1855  		}
98d4f7809d99bb Adrian Hunter     2017-09-22  1856  	}
9d4579a85c8434 Adrian Hunter     2017-03-13  1857  	/*
9d4579a85c8434 Adrian Hunter     2017-03-13  1858  	 * In some cases (e.g. =
RPMB or mmc_test), the Command Queue must be
9d4579a85c8434 Adrian Hunter     2017-03-13  1859  	 * disabled for a time,=
 so a flag is needed to indicate to re-enable the
9d4579a85c8434 Adrian Hunter     2017-03-13  1860  	 * Command Queue.
9d4579a85c8434 Adrian Hunter     2017-03-13  1861  	 */
9d4579a85c8434 Adrian Hunter     2017-03-13  1862  	card->reenable_cmdq =3D=
 card->ext_csd.cmdq_en;
9d4579a85c8434 Adrian Hunter     2017-03-13  1863  =

511ce378e16f07 Baolin Wang       2020-02-12  1864  	if (host->cqe_ops && !h=
ost->cqe_enabled) {
f690f4409ddd79 Adrian Hunter     2017-09-22  1865  		err =3D host->cqe_ops-=
>cqe_enable(host, card);
511ce378e16f07 Baolin Wang       2020-02-12  1866  		if (!err) {
f690f4409ddd79 Adrian Hunter     2017-09-22  1867  			host->cqe_enabled =3D=
 true;
511ce378e16f07 Baolin Wang       2020-02-12  1868  =

511ce378e16f07 Baolin Wang       2020-02-12  1869  			if (card->ext_csd.cmd=
q_en) {
f690f4409ddd79 Adrian Hunter     2017-09-22  1870  				pr_info("%s: Command=
 Queue Engine enabled\n",
f690f4409ddd79 Adrian Hunter     2017-09-22  1871  					mmc_hostname(host));
511ce378e16f07 Baolin Wang       2020-02-12  1872  			} else {
511ce378e16f07 Baolin Wang       2020-02-12  1873  				host->hsq_enabled =
=3D true;
511ce378e16f07 Baolin Wang       2020-02-12  1874  				pr_info("%s: Host So=
ftware Queue enabled\n",
511ce378e16f07 Baolin Wang       2020-02-12  1875  					mmc_hostname(host));
511ce378e16f07 Baolin Wang       2020-02-12  1876  			}
f690f4409ddd79 Adrian Hunter     2017-09-22  1877  		}
f690f4409ddd79 Adrian Hunter     2017-09-22  1878  	}
f690f4409ddd79 Adrian Hunter     2017-09-22  1879  =

247cfe53557524 Kyle Roeschley    2018-04-13  1880  	if (host->caps2 & MMC_C=
AP2_AVOID_3_3V &&
247cfe53557524 Kyle Roeschley    2018-04-13  1881  	    host->ios.signal_vo=
ltage =3D=3D MMC_SIGNAL_VOLTAGE_330) {
247cfe53557524 Kyle Roeschley    2018-04-13  1882  		pr_err("%s: Host faile=
d to negotiate down from 3.3V\n",
247cfe53557524 Kyle Roeschley    2018-04-13  1883  			mmc_hostname(host));
247cfe53557524 Kyle Roeschley    2018-04-13  1884  		err =3D -EINVAL;
247cfe53557524 Kyle Roeschley    2018-04-13  1885  		goto free_card;
247cfe53557524 Kyle Roeschley    2018-04-13  1886  	}
247cfe53557524 Kyle Roeschley    2018-04-13  1887  =

6abaa0c9fec563 Pierre Ossman     2007-05-01  1888  	if (!oldcard)
7ea239d9e6d699 Pierre Ossman     2006-12-31  1889  		host->card =3D card;
7ea239d9e6d699 Pierre Ossman     2006-12-31  1890  =

17b0429dde9ab6 Pierre Ossman     2007-07-22  1891  	return 0;
6abaa0c9fec563 Pierre Ossman     2007-05-01  1892  =

6abaa0c9fec563 Pierre Ossman     2007-05-01  1893  free_card:
6abaa0c9fec563 Pierre Ossman     2007-05-01  1894  	if (!oldcard)
6abaa0c9fec563 Pierre Ossman     2007-05-01  1895  		mmc_remove_card(card);
6abaa0c9fec563 Pierre Ossman     2007-05-01  1896  err:
adf66a0dc5e8be Pierre Ossman     2007-07-22  1897  	return err;
6abaa0c9fec563 Pierre Ossman     2007-05-01  1898  }
6abaa0c9fec563 Pierre Ossman     2007-05-01  1899  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3326383441695069614==--

