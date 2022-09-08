Content-Type: multipart/mixed; boundary="===============4956426567156778068=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/ethernet/davicom/dm9000.c:1684 dm9000_probe() error: we previously assumed 'pdata' could be null (see line 1576)
Date: Thu, 08 Sep 2022 23:51:44 +0800
Message-ID: <202209082321.zrPS5yWh-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4956426567156778068==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Jakub Kicinski <kuba@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   0066f1b0e27556381402db3ff31f85d2a2265858
commit: 4abd7cffc09a38015fa14a22471e3de48a4ca032 ethernet: use eth_hw_addr_=
set() in unmaintained drivers
date:   11 months ago
:::::: branch date: 2 days ago
:::::: commit date: 11 months ago
config: arc-randconfig-m031-20220908 (https://download.01.org/0day-ci/archi=
ve/20220908/202209082321.zrPS5yWh-lkp(a)intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/net/ethernet/davicom/dm9000.c:1684 dm9000_probe() error: we previou=
sly assumed 'pdata' could be null (see line 1576)

vim +/pdata +1684 drivers/net/ethernet/davicom/dm9000.c

0b8bf1baabe56f drivers/net/ethernet/davicom/dm9000.c Tomasz Figa           =
    2013-05-20  1408  =

a1365275e745bb drivers/net/dm9000.c                  Sascha Hauer          =
    2005-05-05  1409  /*
f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1410   * Search DM9000 board, allocate space and register it
a1365275e745bb drivers/net/dm9000.c                  Sascha Hauer          =
    2005-05-05  1411   */
6b6a3e7f65e573 drivers/net/ethernet/davicom/dm9000.c Bill Pemberton        =
    2012-12-03  1412  static int
f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1413  dm9000_probe(struct platform_device *pdev)
a1365275e745bb drivers/net/dm9000.c                  Sascha Hauer          =
    2005-05-05  1414  {
cd4e2e4b368fd5 drivers/net/ethernet/davicom/dm9000.c Jingoo Han            =
    2013-08-30  1415  	struct dm9000_plat_data *pdata =3D dev_get_platdata(=
&pdev->dev);
f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1416  	struct board_info *db;	/* Point a board information =
structure */
f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1417  	struct net_device *ndev;
7994fe55a4a200 drivers/net/ethernet/davicom/dm9000.c Zubair Lutfullah Kakak=
hel 2015-01-15  1418  	struct device *dev =3D &pdev->dev;
f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1419  	const unsigned char *mac_src;
f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1420  	int ret =3D 0;
f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1421  	int iosize;
f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1422  	int i;
f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1423  	u32 id_val;
7994fe55a4a200 drivers/net/ethernet/davicom/dm9000.c Zubair Lutfullah Kakak=
hel 2015-01-15  1424  	int reset_gpios;
7994fe55a4a200 drivers/net/ethernet/davicom/dm9000.c Zubair Lutfullah Kakak=
hel 2015-01-15  1425  	enum of_gpio_flags flags;
7994fe55a4a200 drivers/net/ethernet/davicom/dm9000.c Zubair Lutfullah Kakak=
hel 2015-01-15  1426  	struct regulator *power;
3274940bd3d870 drivers/net/ethernet/davicom/dm9000.c Harvey Hunt           =
    2016-05-17  1427  	bool inv_mac_addr =3D false;
4abd7cffc09a38 drivers/net/ethernet/davicom/dm9000.c Jakub Kicinski        =
    2021-10-15  1428  	u8 addr[ETH_ALEN];
7994fe55a4a200 drivers/net/ethernet/davicom/dm9000.c Zubair Lutfullah Kakak=
hel 2015-01-15  1429  =

7994fe55a4a200 drivers/net/ethernet/davicom/dm9000.c Zubair Lutfullah Kakak=
hel 2015-01-15  1430  	power =3D devm_regulator_get(dev, "vcc");
7994fe55a4a200 drivers/net/ethernet/davicom/dm9000.c Zubair Lutfullah Kakak=
hel 2015-01-15  1431  	if (IS_ERR(power)) {
7994fe55a4a200 drivers/net/ethernet/davicom/dm9000.c Zubair Lutfullah Kakak=
hel 2015-01-15  1432  		if (PTR_ERR(power) =3D=3D -EPROBE_DEFER)
7994fe55a4a200 drivers/net/ethernet/davicom/dm9000.c Zubair Lutfullah Kakak=
hel 2015-01-15  1433  			return -EPROBE_DEFER;
7994fe55a4a200 drivers/net/ethernet/davicom/dm9000.c Zubair Lutfullah Kakak=
hel 2015-01-15  1434  		dev_dbg(dev, "no regulator provided\n");
7994fe55a4a200 drivers/net/ethernet/davicom/dm9000.c Zubair Lutfullah Kakak=
hel 2015-01-15  1435  	} else {
7994fe55a4a200 drivers/net/ethernet/davicom/dm9000.c Zubair Lutfullah Kakak=
hel 2015-01-15  1436  		ret =3D regulator_enable(power);
7994fe55a4a200 drivers/net/ethernet/davicom/dm9000.c Zubair Lutfullah Kakak=
hel 2015-01-15  1437  		if (ret !=3D 0) {
7994fe55a4a200 drivers/net/ethernet/davicom/dm9000.c Zubair Lutfullah Kakak=
hel 2015-01-15  1438  			dev_err(dev,
7994fe55a4a200 drivers/net/ethernet/davicom/dm9000.c Zubair Lutfullah Kakak=
hel 2015-01-15  1439  				"Failed to enable power regulator: %d\n", ret);
7994fe55a4a200 drivers/net/ethernet/davicom/dm9000.c Zubair Lutfullah Kakak=
hel 2015-01-15  1440  			return ret;
7994fe55a4a200 drivers/net/ethernet/davicom/dm9000.c Zubair Lutfullah Kakak=
hel 2015-01-15  1441  		}
7994fe55a4a200 drivers/net/ethernet/davicom/dm9000.c Zubair Lutfullah Kakak=
hel 2015-01-15  1442  		dev_dbg(dev, "regulator enabled\n");
7994fe55a4a200 drivers/net/ethernet/davicom/dm9000.c Zubair Lutfullah Kakak=
hel 2015-01-15  1443  	}
7994fe55a4a200 drivers/net/ethernet/davicom/dm9000.c Zubair Lutfullah Kakak=
hel 2015-01-15  1444  =

7994fe55a4a200 drivers/net/ethernet/davicom/dm9000.c Zubair Lutfullah Kakak=
hel 2015-01-15  1445  	reset_gpios =3D of_get_named_gpio_flags(dev->of_node=
, "reset-gpios", 0,
7994fe55a4a200 drivers/net/ethernet/davicom/dm9000.c Zubair Lutfullah Kakak=
hel 2015-01-15  1446  					      &flags);
7994fe55a4a200 drivers/net/ethernet/davicom/dm9000.c Zubair Lutfullah Kakak=
hel 2015-01-15  1447  	if (gpio_is_valid(reset_gpios)) {
7994fe55a4a200 drivers/net/ethernet/davicom/dm9000.c Zubair Lutfullah Kakak=
hel 2015-01-15  1448  		ret =3D devm_gpio_request_one(dev, reset_gpios, fla=
gs,
7994fe55a4a200 drivers/net/ethernet/davicom/dm9000.c Zubair Lutfullah Kakak=
hel 2015-01-15  1449  					    "dm9000_reset");
7994fe55a4a200 drivers/net/ethernet/davicom/dm9000.c Zubair Lutfullah Kakak=
hel 2015-01-15  1450  		if (ret) {
7994fe55a4a200 drivers/net/ethernet/davicom/dm9000.c Zubair Lutfullah Kakak=
hel 2015-01-15  1451  			dev_err(dev, "failed to request reset gpio %d: %d\=
n",
7994fe55a4a200 drivers/net/ethernet/davicom/dm9000.c Zubair Lutfullah Kakak=
hel 2015-01-15  1452  				reset_gpios, ret);
ac88c531a5b388 drivers/net/ethernet/davicom/dm9000.c Paul Cercueil         =
    2021-03-07  1453  			goto out_regulator_disable;
7994fe55a4a200 drivers/net/ethernet/davicom/dm9000.c Zubair Lutfullah Kakak=
hel 2015-01-15  1454  		}
7994fe55a4a200 drivers/net/ethernet/davicom/dm9000.c Zubair Lutfullah Kakak=
hel 2015-01-15  1455  =

7994fe55a4a200 drivers/net/ethernet/davicom/dm9000.c Zubair Lutfullah Kakak=
hel 2015-01-15  1456  		/* According to manual PWRST# Low Period Min 1ms */
7994fe55a4a200 drivers/net/ethernet/davicom/dm9000.c Zubair Lutfullah Kakak=
hel 2015-01-15  1457  		msleep(2);
7994fe55a4a200 drivers/net/ethernet/davicom/dm9000.c Zubair Lutfullah Kakak=
hel 2015-01-15  1458  		gpio_set_value(reset_gpios, 1);
7994fe55a4a200 drivers/net/ethernet/davicom/dm9000.c Zubair Lutfullah Kakak=
hel 2015-01-15  1459  		/* Needs 3ms to read eeprom when PWRST is deasserte=
d */
7994fe55a4a200 drivers/net/ethernet/davicom/dm9000.c Zubair Lutfullah Kakak=
hel 2015-01-15  1460  		msleep(4);
7994fe55a4a200 drivers/net/ethernet/davicom/dm9000.c Zubair Lutfullah Kakak=
hel 2015-01-15  1461  	}
a1365275e745bb drivers/net/dm9000.c                  Sascha Hauer          =
    2005-05-05  1462  =

0b8bf1baabe56f drivers/net/ethernet/davicom/dm9000.c Tomasz Figa           =
    2013-05-20  1463  	if (!pdata) {
0b8bf1baabe56f drivers/net/ethernet/davicom/dm9000.c Tomasz Figa           =
    2013-05-20  1464  		pdata =3D dm9000_parse_dt(&pdev->dev);
ac88c531a5b388 drivers/net/ethernet/davicom/dm9000.c Paul Cercueil         =
    2021-03-07  1465  		if (IS_ERR(pdata)) {
ac88c531a5b388 drivers/net/ethernet/davicom/dm9000.c Paul Cercueil         =
    2021-03-07  1466  			ret =3D PTR_ERR(pdata);
ac88c531a5b388 drivers/net/ethernet/davicom/dm9000.c Paul Cercueil         =
    2021-03-07  1467  			goto out_regulator_disable;
ac88c531a5b388 drivers/net/ethernet/davicom/dm9000.c Paul Cercueil         =
    2021-03-07  1468  		}
0b8bf1baabe56f drivers/net/ethernet/davicom/dm9000.c Tomasz Figa           =
    2013-05-20  1469  	}
0b8bf1baabe56f drivers/net/ethernet/davicom/dm9000.c Tomasz Figa           =
    2013-05-20  1470  =

f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1471  	/* Init network device */
f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1472  	ndev =3D alloc_etherdev(sizeof(struct board_info));
31457db3750c0b drivers/net/ethernet/davicom/dm9000.c Christophe JAILLET    =
    2021-04-11  1473  	if (!ndev) {
31457db3750c0b drivers/net/ethernet/davicom/dm9000.c Christophe JAILLET    =
    2021-04-11  1474  		ret =3D -ENOMEM;
31457db3750c0b drivers/net/ethernet/davicom/dm9000.c Christophe JAILLET    =
    2021-04-11  1475  		goto out_regulator_disable;
31457db3750c0b drivers/net/ethernet/davicom/dm9000.c Christophe JAILLET    =
    2021-04-11  1476  	}
9a2f037cdbe840 drivers/net/dm9000.c                  Ben Dooks             =
    2008-02-05  1477  =

f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1478  	SET_NETDEV_DEV(ndev, &pdev->dev);
9ef9ac51cc5fa5 drivers/net/dm9000.c                  Ben Dooks             =
    2005-07-23  1479  =

f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1480  	dev_dbg(&pdev->dev, "dm9000_probe()\n");
9ef9ac51cc5fa5 drivers/net/dm9000.c                  Ben Dooks             =
    2005-07-23  1481  =

f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1482  	/* setup board info structure */
4cf1653aa90c63 drivers/net/dm9000.c                  Wang Chen             =
    2008-11-12  1483  	db =3D netdev_priv(ndev);
a1365275e745bb drivers/net/dm9000.c                  Sascha Hauer          =
    2005-05-05  1484  =

f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1485  	db->dev =3D &pdev->dev;
f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1486  	db->ndev =3D ndev;
cf9e60aa69ae6c drivers/net/ethernet/davicom/dm9000.c Paul Cercueil         =
    2021-03-07  1487  	if (!IS_ERR(power))
cf9e60aa69ae6c drivers/net/ethernet/davicom/dm9000.c Paul Cercueil         =
    2021-03-07  1488  		db->power_supply =3D power;
89c8b0e6cd3859 drivers/net/dm9000.c                  Ben Dooks             =
    2008-02-05  1489  =

f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1490  	spin_lock_init(&db->lock);
f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1491  	mutex_init(&db->addr_lock);
89c8b0e6cd3859 drivers/net/dm9000.c                  Ben Dooks             =
    2008-02-05  1492  =

f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1493  	INIT_DELAYED_WORK(&db->phy_poll, dm9000_poll_work);
89c8b0e6cd3859 drivers/net/dm9000.c                  Ben Dooks             =
    2008-02-05  1494  =

f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1495  	db->addr_res =3D platform_get_resource(pdev, IORESOU=
RCE_MEM, 0);
f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1496  	db->data_res =3D platform_get_resource(pdev, IORESOU=
RCE_MEM, 1);
89c8b0e6cd3859 drivers/net/dm9000.c                  Ben Dooks             =
    2008-02-05  1497  =

b5a099c67a1c36 drivers/net/ethernet/davicom/dm9000.c Robert Jarzmik        =
    2016-02-20  1498  	if (!db->addr_res || !db->data_res) {
b5a099c67a1c36 drivers/net/ethernet/davicom/dm9000.c Robert Jarzmik        =
    2016-02-20  1499  		dev_err(db->dev, "insufficient resources addr=3D%p =
data=3D%p\n",
b5a099c67a1c36 drivers/net/ethernet/davicom/dm9000.c Robert Jarzmik        =
    2016-02-20  1500  			db->addr_res, db->data_res);
f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1501  		ret =3D -ENOENT;
f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1502  		goto out;
f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1503  	}
a1365275e745bb drivers/net/dm9000.c                  Sascha Hauer          =
    2005-05-05  1504  =

b5a099c67a1c36 drivers/net/ethernet/davicom/dm9000.c Robert Jarzmik        =
    2016-02-20  1505  	ndev->irq =3D platform_get_irq(pdev, 0);
b5a099c67a1c36 drivers/net/ethernet/davicom/dm9000.c Robert Jarzmik        =
    2016-02-20  1506  	if (ndev->irq < 0) {
b5a099c67a1c36 drivers/net/ethernet/davicom/dm9000.c Robert Jarzmik        =
    2016-02-20  1507  		ret =3D ndev->irq;
b5a099c67a1c36 drivers/net/ethernet/davicom/dm9000.c Robert Jarzmik        =
    2016-02-20  1508  		goto out;
b5a099c67a1c36 drivers/net/ethernet/davicom/dm9000.c Robert Jarzmik        =
    2016-02-20  1509  	}
b5a099c67a1c36 drivers/net/ethernet/davicom/dm9000.c Robert Jarzmik        =
    2016-02-20  1510  =

2e2696223676d5 drivers/net/ethernet/davicom/dm9000.c Paul Cercueil         =
    2021-03-07  1511  	db->irq_wake =3D platform_get_irq_optional(pdev, 1);
c029f4440fd3f0 drivers/net/dm9000.c                  Ben Dooks             =
    2009-11-10  1512  	if (db->irq_wake >=3D 0) {
c029f4440fd3f0 drivers/net/dm9000.c                  Ben Dooks             =
    2009-11-10  1513  		dev_dbg(db->dev, "wakeup irq %d\n", db->irq_wake);
c029f4440fd3f0 drivers/net/dm9000.c                  Ben Dooks             =
    2009-11-10  1514  =

c029f4440fd3f0 drivers/net/dm9000.c                  Ben Dooks             =
    2009-11-10  1515  		ret =3D request_irq(db->irq_wake, dm9000_wol_interr=
upt,
c029f4440fd3f0 drivers/net/dm9000.c                  Ben Dooks             =
    2009-11-10  1516  				  IRQF_SHARED, dev_name(db->dev), ndev);
c029f4440fd3f0 drivers/net/dm9000.c                  Ben Dooks             =
    2009-11-10  1517  		if (ret) {
c029f4440fd3f0 drivers/net/dm9000.c                  Ben Dooks             =
    2009-11-10  1518  			dev_err(db->dev, "cannot get wakeup irq (%d)\n", r=
et);
c029f4440fd3f0 drivers/net/dm9000.c                  Ben Dooks             =
    2009-11-10  1519  		} else {
c029f4440fd3f0 drivers/net/dm9000.c                  Ben Dooks             =
    2009-11-10  1520  =

c029f4440fd3f0 drivers/net/dm9000.c                  Ben Dooks             =
    2009-11-10  1521  			/* test to see if irq is really wakeup capable */
dced35aeb0367d drivers/net/dm9000.c                  Thomas Gleixner       =
    2011-03-28  1522  			ret =3D irq_set_irq_wake(db->irq_wake, 1);
c029f4440fd3f0 drivers/net/dm9000.c                  Ben Dooks             =
    2009-11-10  1523  			if (ret) {
c029f4440fd3f0 drivers/net/dm9000.c                  Ben Dooks             =
    2009-11-10  1524  				dev_err(db->dev, "irq %d cannot set wakeup (%d)\n=
",
c029f4440fd3f0 drivers/net/dm9000.c                  Ben Dooks             =
    2009-11-10  1525  					db->irq_wake, ret);
c029f4440fd3f0 drivers/net/dm9000.c                  Ben Dooks             =
    2009-11-10  1526  			} else {
dced35aeb0367d drivers/net/dm9000.c                  Thomas Gleixner       =
    2011-03-28  1527  				irq_set_irq_wake(db->irq_wake, 0);
c029f4440fd3f0 drivers/net/dm9000.c                  Ben Dooks             =
    2009-11-10  1528  				db->wake_supported =3D 1;
c029f4440fd3f0 drivers/net/dm9000.c                  Ben Dooks             =
    2009-11-10  1529  			}
c029f4440fd3f0 drivers/net/dm9000.c                  Ben Dooks             =
    2009-11-10  1530  		}
c029f4440fd3f0 drivers/net/dm9000.c                  Ben Dooks             =
    2009-11-10  1531  	}
c029f4440fd3f0 drivers/net/dm9000.c                  Ben Dooks             =
    2009-11-10  1532  =

ec282e9225be92 drivers/net/dm9000.c                  Tobias Klauser        =
    2009-09-09  1533  	iosize =3D resource_size(db->addr_res);
f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1534  	db->addr_req =3D request_mem_region(db->addr_res->st=
art, iosize,
f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1535  					  pdev->name);
a1365275e745bb drivers/net/dm9000.c                  Sascha Hauer          =
    2005-05-05  1536  =

f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1537  	if (db->addr_req =3D=3D NULL) {
f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1538  		dev_err(db->dev, "cannot claim address reg area\n");
f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1539  		ret =3D -EIO;
f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1540  		goto out;
f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1541  	}
a1365275e745bb drivers/net/dm9000.c                  Sascha Hauer          =
    2005-05-05  1542  =

f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1543  	db->io_addr =3D ioremap(db->addr_res->start, iosize);
37d5dca6af6b62 drivers/net/dm9000.c                  Enrico Scholz         =
    2008-05-08  1544  =

f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1545  	if (db->io_addr =3D=3D NULL) {
f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1546  		dev_err(db->dev, "failed to ioremap address reg\n");
f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1547  		ret =3D -EINVAL;
f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1548  		goto out;
a1365275e745bb drivers/net/dm9000.c                  Sascha Hauer          =
    2005-05-05  1549  	}
a1365275e745bb drivers/net/dm9000.c                  Sascha Hauer          =
    2005-05-05  1550  =

ec282e9225be92 drivers/net/dm9000.c                  Tobias Klauser        =
    2009-09-09  1551  	iosize =3D resource_size(db->data_res);
f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1552  	db->data_req =3D request_mem_region(db->data_res->st=
art, iosize,
f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1553  					  pdev->name);
a1365275e745bb drivers/net/dm9000.c                  Sascha Hauer          =
    2005-05-05  1554  =

f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1555  	if (db->data_req =3D=3D NULL) {
f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1556  		dev_err(db->dev, "cannot claim data reg area\n");
f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1557  		ret =3D -EIO;
f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1558  		goto out;
f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1559  	}
9a2f037cdbe840 drivers/net/dm9000.c                  Ben Dooks             =
    2008-02-05  1560  =

f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1561  	db->io_data =3D ioremap(db->data_res->start, iosize);
a1365275e745bb drivers/net/dm9000.c                  Sascha Hauer          =
    2005-05-05  1562  =

f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1563  	if (db->io_data =3D=3D NULL) {
f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1564  		dev_err(db->dev, "failed to ioremap data reg\n");
f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1565  		ret =3D -EINVAL;
f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1566  		goto out;
f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1567  	}
9ef9ac51cc5fa5 drivers/net/dm9000.c                  Ben Dooks             =
    2005-07-23  1568  =

f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1569  	/* fill in parameters for net-dev structure */
f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1570  	ndev->base_addr =3D (unsigned long)db->io_addr;
a1365275e745bb drivers/net/dm9000.c                  Sascha Hauer          =
    2005-05-05  1571  =

f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1572  	/* ensure at least we have a default set of IO routi=
nes */
f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1573  	dm9000_set_io(db, iosize);
a1365275e745bb drivers/net/dm9000.c                  Sascha Hauer          =
    2005-05-05  1574  =

f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1575  	/* check to see if anything is being over-ridden */
f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24 @1576  	if (pdata !=3D NULL) {
f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1577  		/* check to see if the driver wants to over-ride the
f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1578  		 * default IO width */
89c8b0e6cd3859 drivers/net/dm9000.c                  Ben Dooks             =
    2008-02-05  1579  =

f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1580  		if (pdata->flags & DM9000_PLATF_8BITONLY)
f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1581  			dm9000_set_io(db, 1);
89c8b0e6cd3859 drivers/net/dm9000.c                  Ben Dooks             =
    2008-02-05  1582  =

f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1583  		if (pdata->flags & DM9000_PLATF_16BITONLY)
f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1584  			dm9000_set_io(db, 2);
89c8b0e6cd3859 drivers/net/dm9000.c                  Ben Dooks             =
    2008-02-05  1585  =

f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1586  		if (pdata->flags & DM9000_PLATF_32BITONLY)
f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1587  			dm9000_set_io(db, 4);
89c8b0e6cd3859 drivers/net/dm9000.c                  Ben Dooks             =
    2008-02-05  1588  =

f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1589  		/* check to see if there are any IO routine
f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1590  		 * over-rides */
a1365275e745bb drivers/net/dm9000.c                  Sascha Hauer          =
    2005-05-05  1591  =

f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1592  		if (pdata->inblk !=3D NULL)
f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1593  			db->inblk =3D pdata->inblk;
9ef9ac51cc5fa5 drivers/net/dm9000.c                  Ben Dooks             =
    2005-07-23  1594  =

f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1595  		if (pdata->outblk !=3D NULL)
f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1596  			db->outblk =3D pdata->outblk;
f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1597  =

f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1598  		if (pdata->dumpblk !=3D NULL)
f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1599  			db->dumpblk =3D pdata->dumpblk;
f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1600  =

f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1601  		db->flags =3D pdata->flags;
f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1602  	}
f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1603  =

f8dd0ecbb74d4b drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1604  #ifdef CONFIG_DM9000_FORCE_SIMPLE_PHY_POLL
f8dd0ecbb74d4b drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1605  	db->flags |=3D DM9000_PLATF_SIMPLE_PHY;
f8dd0ecbb74d4b drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1606  #endif
f8dd0ecbb74d4b drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1607  =

751bb6fd80b728 drivers/net/ethernet/davicom/dm9000.c Andrew Ruder          =
    2014-06-04  1608  	dm9000_reset(db);
f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1609  =

f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1610  	/* try multiple times, DM9000 sometimes gets the rea=
d wrong */
f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1611  	for (i =3D 0; i < 8; i++) {
f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1612  		id_val  =3D ior(db, DM9000_VIDL);
f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1613  		id_val |=3D (u32)ior(db, DM9000_VIDH) << 8;
f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1614  		id_val |=3D (u32)ior(db, DM9000_PIDL) << 16;
f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1615  		id_val |=3D (u32)ior(db, DM9000_PIDH) << 24;
f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1616  =

f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1617  		if (id_val =3D=3D DM9000_ID)
f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1618  			break;
f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1619  		dev_err(db->dev, "read wrong id 0x%08x\n", id_val);
f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1620  	}
f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1621  =

f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1622  	if (id_val !=3D DM9000_ID) {
f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1623  		dev_err(db->dev, "wrong id: 0x%08x\n", id_val);
f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1624  		ret =3D -ENODEV;
f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1625  		goto out;
f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1626  	}
f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1627  =

f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1628  	/* Identify what type of DM9000 we are working on */
f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1629  =

f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1630  	id_val =3D ior(db, DM9000_CHIPR);
f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1631  	dev_dbg(db->dev, "dm9000 revision 0x%02x\n", id_val);
f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1632  =

f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1633  	switch (id_val) {
f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1634  	case CHIPR_DM9000A:
f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1635  		db->type =3D TYPE_DM9000A;
f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1636  		break;
f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1637  	case CHIPR_DM9000B:
f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1638  		db->type =3D TYPE_DM9000B;
f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1639  		break;
f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1640  	default:
f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1641  		dev_dbg(db->dev, "ID %02x =3D> defaulting to DM9000=
E\n", id_val);
f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1642  		db->type =3D TYPE_DM9000E;
f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1643  	}
f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1644  =

5dcc60b7188679 drivers/net/dm9000.c                  Yeasah Pell           =
    2009-07-06  1645  	/* dm9000a/b are capable of hardware checksum offloa=
d */
5dcc60b7188679 drivers/net/dm9000.c                  Yeasah Pell           =
    2009-07-06  1646  	if (db->type =3D=3D TYPE_DM9000A || db->type =3D=3D =
TYPE_DM9000B) {
c88fcb3d8265cf drivers/net/dm9000.c                  Micha=C5=82 Miros=C5=
=82aw           2011-04-15  1647  		ndev->hw_features =3D NETIF_F_RXCSUM | =
NETIF_F_IP_CSUM;
c88fcb3d8265cf drivers/net/dm9000.c                  Micha=C5=82 Miros=C5=
=82aw           2011-04-15  1648  		ndev->features |=3D ndev->hw_features;
5dcc60b7188679 drivers/net/dm9000.c                  Yeasah Pell           =
    2009-07-06  1649  	}
5dcc60b7188679 drivers/net/dm9000.c                  Yeasah Pell           =
    2009-07-06  1650  =

f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1651  	/* from this point we assume that we have found a DM=
9000 */
f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1652  =

d88106b70178a8 drivers/net/dm9000.c                  Alexander Beregalov   =
    2009-04-15  1653  	ndev->netdev_ops	=3D &dm9000_netdev_ops;
f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1654  	ndev->watchdog_timeo	=3D msecs_to_jiffies(watchdog);
f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1655  	ndev->ethtool_ops	=3D &dm9000_ethtool_ops;
f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1656  =

f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1657  	db->msg_enable       =3D NETIF_MSG_LINK;
f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1658  	db->mii.phy_id_mask  =3D 0x1f;
f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1659  	db->mii.reg_num_mask =3D 0x1f;
f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1660  	db->mii.force_media  =3D 0;
f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1661  	db->mii.full_duplex  =3D 0;
f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1662  	db->mii.dev	     =3D ndev;
f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1663  	db->mii.mdio_read    =3D dm9000_phy_read;
f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1664  	db->mii.mdio_write   =3D dm9000_phy_write;
f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1665  =

f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1666  	mac_src =3D "eeprom";
f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1667  =

f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1668  	/* try reading the node address from the attached EE=
PROM */
f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1669  	for (i =3D 0; i < 6; i +=3D 2)
4abd7cffc09a38 drivers/net/ethernet/davicom/dm9000.c Jakub Kicinski        =
    2021-10-15  1670  		dm9000_read_eeprom(db, i / 2, addr + i);
4abd7cffc09a38 drivers/net/ethernet/davicom/dm9000.c Jakub Kicinski        =
    2021-10-15  1671  	eth_hw_addr_set(ndev, addr);
f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1672  =

fe414248551e28 drivers/net/dm9000.c                  Laurent Pinchart      =
    2008-07-23  1673  	if (!is_valid_ether_addr(ndev->dev_addr) && pdata !=
=3D NULL) {
fe414248551e28 drivers/net/dm9000.c                  Laurent Pinchart      =
    2008-07-23  1674  		mac_src =3D "platform data";
a96d317fb1a30b drivers/net/ethernet/davicom/dm9000.c Jakub Kicinski        =
    2021-10-01  1675  		eth_hw_addr_set(ndev, pdata->dev_addr);
fe414248551e28 drivers/net/dm9000.c                  Laurent Pinchart      =
    2008-07-23  1676  	}
fe414248551e28 drivers/net/dm9000.c                  Laurent Pinchart      =
    2008-07-23  1677  =

f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1678  	if (!is_valid_ether_addr(ndev->dev_addr)) {
f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1679  		/* try reading from mac */
f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1680  =

f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1681  		mac_src =3D "chip";
f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1682  		for (i =3D 0; i < 6; i++)
4abd7cffc09a38 drivers/net/ethernet/davicom/dm9000.c Jakub Kicinski        =
    2021-10-15  1683  			addr[i] =3D ior(db, i + DM9000_PAR);
4abd7cffc09a38 drivers/net/ethernet/davicom/dm9000.c Jakub Kicinski        =
    2021-10-15 @1684  		eth_hw_addr_set(ndev, pdata->dev_addr);
f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1685  	}
f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1686  =

85e6b8c5d8be1e drivers/net/dm9000.c                  Ben Dooks             =
    2011-02-24  1687  	if (!is_valid_ether_addr(ndev->dev_addr)) {
3274940bd3d870 drivers/net/ethernet/davicom/dm9000.c Harvey Hunt           =
    2016-05-17  1688  		inv_mac_addr =3D true;
f2cedb63df1434 drivers/net/ethernet/davicom/dm9000.c Danny Kukawka         =
    2012-02-15  1689  		eth_hw_addr_random(ndev);
85e6b8c5d8be1e drivers/net/dm9000.c                  Ben Dooks             =
    2011-02-24  1690  		mac_src =3D "random";
85e6b8c5d8be1e drivers/net/dm9000.c                  Ben Dooks             =
    2011-02-24  1691  	}
85e6b8c5d8be1e drivers/net/dm9000.c                  Ben Dooks             =
    2011-02-24  1692  =

85e6b8c5d8be1e drivers/net/dm9000.c                  Ben Dooks             =
    2011-02-24  1693  =

f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1694  	platform_set_drvdata(pdev, ndev);
f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1695  	ret =3D register_netdev(ndev);
f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1696  =

3274940bd3d870 drivers/net/ethernet/davicom/dm9000.c Harvey Hunt           =
    2016-05-17  1697  	if (ret =3D=3D 0) {
3274940bd3d870 drivers/net/ethernet/davicom/dm9000.c Harvey Hunt           =
    2016-05-17  1698  		if (inv_mac_addr)
3274940bd3d870 drivers/net/ethernet/davicom/dm9000.c Harvey Hunt           =
    2016-05-17  1699  			dev_warn(db->dev, "%s: Invalid ethernet MAC addres=
s. Please set using ip\n",
3274940bd3d870 drivers/net/ethernet/davicom/dm9000.c Harvey Hunt           =
    2016-05-17  1700  				 ndev->name);
e174961ca1a0b2 drivers/net/dm9000.c                  Johannes Berg         =
    2008-10-27  1701  		printk(KERN_INFO "%s: dm9000%c at %p,%p IRQ %d MAC:=
 %pM (%s)\n",
f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1702  		       ndev->name, dm9000_type_to_char(db->type),
f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1703  		       db->io_addr, db->io_data, ndev->irq,
e174961ca1a0b2 drivers/net/dm9000.c                  Johannes Berg         =
    2008-10-27  1704  		       ndev->dev_addr, mac_src);
3274940bd3d870 drivers/net/ethernet/davicom/dm9000.c Harvey Hunt           =
    2016-05-17  1705  	}
f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1706  	return 0;
f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1707  =

f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1708  out:
f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1709  	dev_err(db->dev, "not found (%d).\n", ret);
f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1710  =

f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1711  	dm9000_release_board(pdev, db);
f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1712  	free_netdev(ndev);
f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1713  =

ac88c531a5b388 drivers/net/ethernet/davicom/dm9000.c Paul Cercueil         =
    2021-03-07  1714  out_regulator_disable:
ac88c531a5b388 drivers/net/ethernet/davicom/dm9000.c Paul Cercueil         =
    2021-03-07  1715  	if (!IS_ERR(power))
ac88c531a5b388 drivers/net/ethernet/davicom/dm9000.c Paul Cercueil         =
    2021-03-07  1716  		regulator_disable(power);
ac88c531a5b388 drivers/net/ethernet/davicom/dm9000.c Paul Cercueil         =
    2021-03-07  1717  =

f8d79e79a1700f drivers/net/dm9000.c                  Ben Dooks             =
    2008-06-24  1718  	return ret;
a1365275e745bb drivers/net/dm9000.c                  Sascha Hauer          =
    2005-05-05  1719  }
a1365275e745bb drivers/net/dm9000.c                  Sascha Hauer          =
    2005-05-05  1720  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4956426567156778068==--

