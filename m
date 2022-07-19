Content-Type: multipart/mixed; boundary="===============4356062312814996278=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/phy/phy_device.c:1772 phy_detach() error: we previously assumed 'dev' could be null (see line 1752)
Date: Wed, 20 Jul 2022 00:55:29 +0800
Message-ID: <202207200005.1kAdinkP-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4356062312814996278==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Dongjin Kim <tobetter@gmail.com>

tree:   https://github.com/tobetter/linux odroid-5.19.y
head:   0569e1291a824471ea27c9e90132881c0232a3a0
commit: 898624b63a33622330468fd8007048dc1981492d ODROID-COMMON: phy/realtek=
: add Wake-on-Lan to Realtek PHY
date:   8 days ago
:::::: branch date: 7 days ago
:::::: commit date: 8 days ago
config: i386-randconfig-m021-20220718 (https://download.01.org/0day-ci/arch=
ive/20220720/202207200005.1kAdinkP-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/net/phy/phy_device.c:1772 phy_detach() error: we previously assumed=
 'dev' could be null (see line 1752)
drivers/net/phy/phy_device.c:1784 phy_detach() warn: variable dereferenced =
before check 'dev' (see line 1772)

vim +/dev +1772 drivers/net/phy/phy_device.c

6349084746ff4f Michael Walle      2020-05-06  1727  =

b3df0da886ffdb Randy Dunlap       2007-03-06  1728  /**
b3df0da886ffdb Randy Dunlap       2007-03-06  1729   * phy_detach - detach =
a PHY device from its network device
b3df0da886ffdb Randy Dunlap       2007-03-06  1730   * @phydev: target phy_=
device struct
7322967bc1bd97 Russell King       2015-09-24  1731   *
7322967bc1bd97 Russell King       2015-09-24  1732   * This detaches the ph=
y device from its network device and the phy
7322967bc1bd97 Russell King       2015-09-24  1733   * driver, and drops th=
e reference count taken in phy_attach_direct().
b3df0da886ffdb Randy Dunlap       2007-03-06  1734   */
e13934563db047 Andy Fleming       2005-08-24  1735  void phy_detach(struct =
phy_device *phydev)
e13934563db047 Andy Fleming       2005-08-24  1736  {
ec988ad78ed6d1 Florian Fainelli   2016-12-06  1737  	struct net_device *dev=
 =3D phydev->attached_dev;
2db2d9d1ac3722 Ioana Ciornei      2019-05-28  1738  	struct module *ndev_ow=
ner =3D NULL;
3e3aaf64941698 Russell King       2015-09-24  1739  	struct mii_bus *bus;
b3565f278a9bab Ezequiel Garcia    2014-07-23  1740  =

a3995460491d45 Florian Fainelli   2017-05-27  1741  	if (phydev->sysfs_link=
s) {
2db2d9d1ac3722 Ioana Ciornei      2019-05-28  1742  		if (dev)
5568363f0cb358 Florian Fainelli   2017-05-25  1743  			sysfs_remove_link(&d=
ev->dev.kobj, "phydev");
5568363f0cb358 Florian Fainelli   2017-05-25  1744  		sysfs_remove_link(&ph=
ydev->mdio.dev.kobj, "attached_dev");
a3995460491d45 Florian Fainelli   2017-05-27  1745  	}
c920f745f45d46 Ioana Ciornei      2019-05-28  1746  =

c920f745f45d46 Ioana Ciornei      2019-05-28  1747  	if (!phydev->attached_=
dev)
c920f745f45d46 Ioana Ciornei      2019-05-28  1748  		sysfs_remove_file(&ph=
ydev->mdio.dev.kobj,
c920f745f45d46 Ioana Ciornei      2019-05-28  1749  				  &dev_attr_phy_sta=
ndalone.attr);
c920f745f45d46 Ioana Ciornei      2019-05-28  1750  =

93f41e67dc8ff0 Heiner Kallweit    2018-09-24  1751  	phy_suspend(phydev);
2db2d9d1ac3722 Ioana Ciornei      2019-05-28 @1752  	if (dev) {
c1f19b51d1d87f Richard Cochran    2010-07-17  1753  		phydev->attached_dev-=
>phydev =3D NULL;
e13934563db047 Andy Fleming       2005-08-24  1754  		phydev->attached_dev =
=3D NULL;
2db2d9d1ac3722 Ioana Ciornei      2019-05-28  1755  	}
9525ae83959b60 Russell King       2017-07-25  1756  	phydev->phylink =3D NU=
LL;
e13934563db047 Andy Fleming       2005-08-24  1757  =

0075bd692dca03 Geert Uytterhoeven 2016-11-28  1758  	phy_led_triggers_unreg=
ister(phydev);
0075bd692dca03 Geert Uytterhoeven 2016-11-28  1759  =

c2b727df7caa33 Florian Fainelli   2020-09-16  1760  	if (phydev->mdio.dev.d=
river)
6d9f66ac7fec2a Florian Fainelli   2017-02-08  1761  		module_put(phydev->md=
io.dev.driver->owner);
6d9f66ac7fec2a Florian Fainelli   2017-02-08  1762  =

e13934563db047 Andy Fleming       2005-08-24  1763  	/* If the device had n=
o specific driver before (i.e. - it
e13934563db047 Andy Fleming       2005-08-24  1764  	 * was using the gener=
ic driver), we unbind the device
e13934563db047 Andy Fleming       2005-08-24  1765  	 * from the generic dr=
iver so that there's a chance a
2f53e9047e79b6 Sergei Shtylyov    2014-01-05  1766  	 * real driver could b=
e loaded
2f53e9047e79b6 Sergei Shtylyov    2014-01-05  1767  	 */
5db5ea995fc2fa Florian Fainelli   2019-01-15  1768  	if (phy_driver_is_genp=
hy(phydev) ||
5db5ea995fc2fa Florian Fainelli   2019-01-15  1769  	    phy_driver_is_genp=
hy_10g(phydev))
e5a03bfd873c29 Andrew Lunn        2016-01-06  1770  		device_release_driver=
(&phydev->mdio.dev);
3e3aaf64941698 Russell King       2015-09-24  1771  =

898624b63a3362 Dongjin Kim        2021-11-17 @1772  	if (!dev->wol_enabled)=
 {
cbda1b16687580 Marek Beh=C3=BAn        2022-01-19  1773  		/* Assert the re=
set signal */
cbda1b16687580 Marek Beh=C3=BAn        2022-01-19  1774  		phy_device_reset=
(phydev, 1);
898624b63a3362 Dongjin Kim        2021-11-17  1775  	}
cbda1b16687580 Marek Beh=C3=BAn        2022-01-19  1776  =

7322967bc1bd97 Russell King       2015-09-24  1777  	/*
7322967bc1bd97 Russell King       2015-09-24  1778  	 * The phydev might go=
 away on the put_device() below, so avoid
7322967bc1bd97 Russell King       2015-09-24  1779  	 * a use-after-free bu=
g by reading the underlying bus first.
7322967bc1bd97 Russell King       2015-09-24  1780  	 */
e5a03bfd873c29 Andrew Lunn        2016-01-06  1781  	bus =3D phydev->mdio.b=
us;
3e3aaf64941698 Russell King       2015-09-24  1782  =

e5a03bfd873c29 Andrew Lunn        2016-01-06  1783  	put_device(&phydev->md=
io.dev);
2db2d9d1ac3722 Ioana Ciornei      2019-05-28 @1784  	if (dev)
2db2d9d1ac3722 Ioana Ciornei      2019-05-28  1785  		ndev_owner =3D dev->d=
ev.parent->driver->owner;
ec988ad78ed6d1 Florian Fainelli   2016-12-06  1786  	if (ndev_owner !=3D bu=
s->owner)
3e3aaf64941698 Russell King       2015-09-24  1787  		module_put(bus->owner=
);
e13934563db047 Andy Fleming       2005-08-24  1788  }
e13934563db047 Andy Fleming       2005-08-24  1789  EXPORT_SYMBOL(phy_detac=
h);
e13934563db047 Andy Fleming       2005-08-24  1790  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4356062312814996278==--

