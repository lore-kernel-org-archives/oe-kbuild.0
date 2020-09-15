Content-Type: multipart/mixed; boundary="===============0780373522944714455=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [net:master 21/39] drivers/net/phy/phy_device.c:1429:9: warning: Identical condition 'err', second condition is always false
Date: Tue, 15 Sep 2020 08:50:24 +0800
Message-ID: <202009150810.Sa7miMql%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0780373522944714455==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: netdev(a)vger.kernel.org
TO: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net.git master
head:   1869e226a7b3ef75b4f70ede2f1b7229f7157fa4
commit: 7d3ba9360c6dac7c077fbd6631e08f32ea2bcd53 [21/39] net: phy: call phy=
_disable_interrupts() in phy_attach_direct() instead
:::::: branch date: 3 hours ago
:::::: commit date: 4 days ago
compiler: h8300-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> drivers/net/phy/phy_device.c:1429:9: warning: Identical condition 'err',=
 second condition is always false [identicalConditionAfterEarlyExit]
    return err;
           ^
   drivers/net/phy/phy_device.c:1423:6: note: first condition
    if (err)
        ^
   drivers/net/phy/phy_device.c:1429:9: note: second condition
    return err;
           ^

# https://git.kernel.org/pub/scm/linux/kernel/git/davem/net.git/commit/?id=
=3D7d3ba9360c6dac7c077fbd6631e08f32ea2bcd53
git remote add net https://git.kernel.org/pub/scm/linux/kernel/git/davem/ne=
t.git
git fetch --no-tags net master
git checkout 7d3ba9360c6dac7c077fbd6631e08f32ea2bcd53
vim +/err +1429 drivers/net/phy/phy_device.c

298e54fa810e02 Russell King          2019-11-15  1302  =

b3df0da886ffdb Randy Dunlap          2007-03-06  1303  /**
fa94f6d93c5382 Grant Likely          2009-04-25  1304   * phy_attach_direct=
 - attach a network device to a given PHY device pointer
b3df0da886ffdb Randy Dunlap          2007-03-06  1305   * @dev: network dev=
ice to attach
fa94f6d93c5382 Grant Likely          2009-04-25  1306   * @phydev: Pointer =
to phy_device to attach
b3df0da886ffdb Randy Dunlap          2007-03-06  1307   * @flags: PHY devic=
e's dev_flags
b3df0da886ffdb Randy Dunlap          2007-03-06  1308   * @interface: PHY d=
evice's interface
e13934563db047 Andy Fleming          2005-08-24  1309   *
b3df0da886ffdb Randy Dunlap          2007-03-06  1310   * Description: Call=
ed by drivers to attach to a particular PHY
e13934563db047 Andy Fleming          2005-08-24  1311   *     device. The p=
hy_device is found, and properly hooked up
257184d7cc0351 Andy Fleming          2014-01-10  1312   *     to the phy_dr=
iver.  If no driver is attached, then a
257184d7cc0351 Andy Fleming          2014-01-10  1313   *     generic drive=
r is used.  The phy_device is given a ptr to
e13934563db047 Andy Fleming          2005-08-24  1314   *     the attaching=
 device, and given a callback for link status
b3df0da886ffdb Randy Dunlap          2007-03-06  1315   *     change.  The =
phy_device is returned to the attaching driver.
7322967bc1bd97 Russell King          2015-09-24  1316   *     This function=
 takes a reference on the phy device.
e13934563db047 Andy Fleming          2005-08-24  1317   */
257184d7cc0351 Andy Fleming          2014-01-10  1318  int phy_attach_direc=
t(struct net_device *dev, struct phy_device *phydev,
fa94f6d93c5382 Grant Likely          2009-04-25  1319  		      u32 flags, p=
hy_interface_t interface)
e13934563db047 Andy Fleming          2005-08-24  1320  {
e5a03bfd873c29 Andrew Lunn           2016-01-06  1321  	struct mii_bus *bus=
 =3D phydev->mdio.bus;
e5a03bfd873c29 Andrew Lunn           2016-01-06  1322  	struct device *d =
=3D &phydev->mdio.dev;
2db2d9d1ac3722 Ioana Ciornei         2019-05-28  1323  	struct module *ndev=
_owner =3D NULL;
6d9f66ac7fec2a Florian Fainelli      2017-02-08  1324  	bool using_genphy =
=3D false;
d005a09edf8b12 Marc Kleine-Budde     2011-03-28  1325  	int err;
e13934563db047 Andy Fleming          2005-08-24  1326  =

ec988ad78ed6d1 Florian Fainelli      2016-12-06  1327  	/* For Ethernet dev=
ice drivers that register their own MDIO bus, we
ec988ad78ed6d1 Florian Fainelli      2016-12-06  1328  	 * will have bus->o=
wner match ndev_mod, so we do not want to increment
ec988ad78ed6d1 Florian Fainelli      2016-12-06  1329  	 * our own module->=
refcnt here, otherwise we would not be able to
ec988ad78ed6d1 Florian Fainelli      2016-12-06  1330  	 * unload later on.
ec988ad78ed6d1 Florian Fainelli      2016-12-06  1331  	 */
2db2d9d1ac3722 Ioana Ciornei         2019-05-28  1332  	if (dev)
2db2d9d1ac3722 Ioana Ciornei         2019-05-28  1333  		ndev_owner =3D dev=
->dev.parent->driver->owner;
ec988ad78ed6d1 Florian Fainelli      2016-12-06  1334  	if (ndev_owner !=3D=
 bus->owner && !try_module_get(bus->owner)) {
2db2d9d1ac3722 Ioana Ciornei         2019-05-28  1335  		phydev_err(phydev,=
 "failed to get the bus module\n");
3e3aaf64941698 Russell King          2015-09-24  1336  		return -EIO;
3e3aaf64941698 Russell King          2015-09-24  1337  	}
3e3aaf64941698 Russell King          2015-09-24  1338  =

7322967bc1bd97 Russell King          2015-09-24  1339  	get_device(d);
7322967bc1bd97 Russell King          2015-09-24  1340  =

e13934563db047 Andy Fleming          2005-08-24  1341  	/* Assume that if t=
here is no driver, that it doesn't
2f53e9047e79b6 Sergei Shtylyov       2014-01-05  1342  	 * exist, and we sh=
ould use the genphy driver.
2f53e9047e79b6 Sergei Shtylyov       2014-01-05  1343  	 */
ef899c0778a390 Sergei Shtylyov       2015-08-28  1344  	if (!d->driver) {
257184d7cc0351 Andy Fleming          2014-01-10  1345  		if (phydev->is_c45)
22b56e827093dd Heiner Kallweit       2019-04-07  1346  			d->driver =3D &ge=
nphy_c45_driver.mdiodrv.driver;
257184d7cc0351 Andy Fleming          2014-01-10  1347  		else
921690f2aa8830 Russell King          2017-06-05  1348  			d->driver =3D &ge=
nphy_driver.mdiodrv.driver;
e13934563db047 Andy Fleming          2005-08-24  1349  =

6d9f66ac7fec2a Florian Fainelli      2017-02-08  1350  		using_genphy =3D t=
rue;
6d9f66ac7fec2a Florian Fainelli      2017-02-08  1351  	}
6d9f66ac7fec2a Florian Fainelli      2017-02-08  1352  =

6d9f66ac7fec2a Florian Fainelli      2017-02-08  1353  	if (!try_module_get=
(d->driver->owner)) {
2db2d9d1ac3722 Ioana Ciornei         2019-05-28  1354  		phydev_err(phydev,=
 "failed to get the device driver module\n");
6d9f66ac7fec2a Florian Fainelli      2017-02-08  1355  		err =3D -EIO;
6d9f66ac7fec2a Florian Fainelli      2017-02-08  1356  		goto error_put_dev=
ice;
6d9f66ac7fec2a Florian Fainelli      2017-02-08  1357  	}
6d9f66ac7fec2a Florian Fainelli      2017-02-08  1358  =

6d9f66ac7fec2a Florian Fainelli      2017-02-08  1359  	if (using_genphy) {
e13934563db047 Andy Fleming          2005-08-24  1360  		err =3D d->driver-=
>probe(d);
b7a00ecd557859 Jeff Garzik           2006-10-01  1361  		if (err >=3D 0)
b7a00ecd557859 Jeff Garzik           2006-10-01  1362  			err =3D device_bi=
nd_driver(d);
e13934563db047 Andy Fleming          2005-08-24  1363  =

b7a00ecd557859 Jeff Garzik           2006-10-01  1364  		if (err)
6d9f66ac7fec2a Florian Fainelli      2017-02-08  1365  			goto error_module=
_put;
e13934563db047 Andy Fleming          2005-08-24  1366  	}
e13934563db047 Andy Fleming          2005-08-24  1367  =

e13934563db047 Andy Fleming          2005-08-24  1368  	if (phydev->attache=
d_dev) {
fa94f6d93c5382 Grant Likely          2009-04-25  1369  		dev_err(&dev->dev,=
 "PHY already attached\n");
3e3aaf64941698 Russell King          2015-09-24  1370  		err =3D -EBUSY;
3e3aaf64941698 Russell King          2015-09-24  1371  		goto error;
b3565f278a9bab Ezequiel Garcia       2014-07-23  1372  	}
b3565f278a9bab Ezequiel Garcia       2014-07-23  1373  =

a81497bee70eb1 Russell King          2017-07-25  1374  	phydev->phy_link_ch=
ange =3D phy_link_change;
2db2d9d1ac3722 Ioana Ciornei         2019-05-28  1375  	if (dev) {
e13934563db047 Andy Fleming          2005-08-24  1376  		phydev->attached_d=
ev =3D dev;
c1f19b51d1d87f Richard Cochran       2010-07-17  1377  		dev->phydev =3D ph=
ydev;
298e54fa810e02 Russell King          2019-11-15  1378  =

298e54fa810e02 Russell King          2019-11-15  1379  		if (phydev->sfp_bu=
s_attached)
298e54fa810e02 Russell King          2019-11-15  1380  			dev->sfp_bus =3D =
phydev->sfp_bus;
2db2d9d1ac3722 Ioana Ciornei         2019-05-28  1381  	}
a3995460491d45 Florian Fainelli      2017-05-27  1382  =

a3995460491d45 Florian Fainelli      2017-05-27  1383  	/* Some Ethernet dr=
ivers try to connect to a PHY device before
a3995460491d45 Florian Fainelli      2017-05-27  1384  	 * calling register=
_netdevice() -> netdev_register_kobject() and
a3995460491d45 Florian Fainelli      2017-05-27  1385  	 * does the dev->de=
v.kobj initialization. Here we only check for
a3995460491d45 Florian Fainelli      2017-05-27  1386  	 * success which in=
dicates that the network device kobject is
a3995460491d45 Florian Fainelli      2017-05-27  1387  	 * ready. Once we d=
o that we still need to keep track of whether
a3995460491d45 Florian Fainelli      2017-05-27  1388  	 * links were succe=
ssfully set up or not for phy_detach() to
a3995460491d45 Florian Fainelli      2017-05-27  1389  	 * remove them acco=
rdingly.
a3995460491d45 Florian Fainelli      2017-05-27  1390  	 */
a3995460491d45 Florian Fainelli      2017-05-27  1391  	phydev->sysfs_links=
 =3D false;
a3995460491d45 Florian Fainelli      2017-05-27  1392  =

53cfca2d6b934b Vladimir Oltean       2019-05-28  1393  	phy_sysfs_create_li=
nks(phydev);
a3995460491d45 Florian Fainelli      2017-05-27  1394  =

c920f745f45d46 Ioana Ciornei         2019-05-28  1395  	if (!phydev->attach=
ed_dev) {
c920f745f45d46 Ioana Ciornei         2019-05-28  1396  		err =3D sysfs_crea=
te_file(&phydev->mdio.dev.kobj,
c920f745f45d46 Ioana Ciornei         2019-05-28  1397  					&dev_attr_phy_s=
tandalone.attr);
c920f745f45d46 Ioana Ciornei         2019-05-28  1398  		if (err)
c920f745f45d46 Ioana Ciornei         2019-05-28  1399  			phydev_err(phydev=
, "error creating 'phy_standalone' sysfs entry\n");
c920f745f45d46 Ioana Ciornei         2019-05-28  1400  	}
c920f745f45d46 Ioana Ciornei         2019-05-28  1401  =

e7312efbd5dec5 Tao Ren               2019-10-22  1402  	phydev->dev_flags |=
=3D flags;
e13934563db047 Andy Fleming          2005-08-24  1403  =

e8a2b6a4207332 Andy Fleming          2006-12-01  1404  	phydev->interface =
=3D interface;
e8a2b6a4207332 Andy Fleming          2006-12-01  1405  =

ef24b16b5d67c8 Anton Vorontsov       2010-08-24  1406  	phydev->state =3D P=
HY_READY;
ef24b16b5d67c8 Anton Vorontsov       2010-08-24  1407  =

113c74d83eef87 Sjoerd Simons         2016-01-14  1408  	/* Initial carrier =
state is off as the phy is about to be
113c74d83eef87 Sjoerd Simons         2016-01-14  1409  	 * (re)initialized.
113c74d83eef87 Sjoerd Simons         2016-01-14  1410  	 */
2db2d9d1ac3722 Ioana Ciornei         2019-05-28  1411  	if (dev)
113c74d83eef87 Sjoerd Simons         2016-01-14  1412  		netif_carrier_off(=
phydev->attached_dev);
113c74d83eef87 Sjoerd Simons         2016-01-14  1413  =

e8a2b6a4207332 Andy Fleming          2006-12-01  1414  	/* Do initial confi=
guration here, now that
e8a2b6a4207332 Andy Fleming          2006-12-01  1415  	 * we have certain =
key parameters
2f53e9047e79b6 Sergei Shtylyov       2014-01-05  1416  	 * (dev_flags and i=
nterface)
2f53e9047e79b6 Sergei Shtylyov       2014-01-05  1417  	 */
d005a09edf8b12 Marc Kleine-Budde     2011-03-28  1418  	err =3D phy_init_hw=
(phydev);
d005a09edf8b12 Marc Kleine-Budde     2011-03-28  1419  	if (err)
a7dac9f9c1695d Woojung Huh           2016-11-23  1420  		goto error;
1211ce53077164 Sebastian Hesselbarth 2013-12-13  1421  =

7d3ba9360c6dac Yoshihiro Shimoda     2020-09-09  1422  	err =3D phy_disable=
_interrupts(phydev);
7d3ba9360c6dac Yoshihiro Shimoda     2020-09-09  1423  	if (err)
7d3ba9360c6dac Yoshihiro Shimoda     2020-09-09  1424  		return err;
7d3ba9360c6dac Yoshihiro Shimoda     2020-09-09  1425  =

a7dac9f9c1695d Woojung Huh           2016-11-23  1426  	phy_resume(phydev);
2e0bc452f47215 Zach Brown            2016-10-17  1427  	phy_led_triggers_re=
gister(phydev);
2e0bc452f47215 Zach Brown            2016-10-17  1428  =

d005a09edf8b12 Marc Kleine-Budde     2011-03-28 @1429  	return err;
3e3aaf64941698 Russell King          2015-09-24  1430  =

3e3aaf64941698 Russell King          2015-09-24  1431  error:
6d9f66ac7fec2a Florian Fainelli      2017-02-08  1432  	/* phy_detach() doe=
s all of the cleanup below */
a7dac9f9c1695d Woojung Huh           2016-11-23  1433  	phy_detach(phydev);
6d9f66ac7fec2a Florian Fainelli      2017-02-08  1434  	return err;
6d9f66ac7fec2a Florian Fainelli      2017-02-08  1435  =

6d9f66ac7fec2a Florian Fainelli      2017-02-08  1436  error_module_put:
cafe8df8b9bc9a Mao Wenan             2017-01-31  1437  	module_put(d->drive=
r->owner);
6d9f66ac7fec2a Florian Fainelli      2017-02-08  1438  error_put_device:
6d9f66ac7fec2a Florian Fainelli      2017-02-08  1439  	put_device(d);
ec988ad78ed6d1 Florian Fainelli      2016-12-06  1440  	if (ndev_owner !=3D=
 bus->owner)
3e3aaf64941698 Russell King          2015-09-24  1441  		module_put(bus->ow=
ner);
3e3aaf64941698 Russell King          2015-09-24  1442  	return err;
e8a2b6a4207332 Andy Fleming          2006-12-01  1443  }
257184d7cc0351 Andy Fleming          2014-01-10  1444  EXPORT_SYMBOL(phy_at=
tach_direct);
fa94f6d93c5382 Grant Likely          2009-04-25  1445  =


:::::: The code at line 1429 was first introduced by commit
:::::: d005a09edf8b12dd1bec651b2cf94caa0e7bb1be phylib: phy_attach_direct: =
phy_init_hw can fail, add cleanup

:::::: TO: Marc Kleine-Budde <mkl@pengutronix.de>
:::::: CC: David S. Miller <davem@davemloft.net>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0780373522944714455==--

