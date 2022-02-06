Content-Type: multipart/mixed; boundary="===============5379801372335944622=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [jic23-iio:fixes-togreg 11/12] drivers/iio/accel/mma8452.c:1595 mma8452_probe() error: we previously assumed 'id' could be null (see line 1536)
Date: Mon, 07 Feb 2022 02:57:44 +0800
Message-ID: <202202070226.OXoWo6JP-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5379801372335944622==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Hans de Goede <hdegoede@redhat.com>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git fixes=
-togreg
head:   21472ddd425831f6cf39b3034e825df2825ec850
commit: 4787cdbfbcb9590e6d9fb4809e0b667a3f491747 [11/12] iio: mma8452: Fix =
probe failing when an i2c_device_id is used
:::::: branch date: 3 hours ago
:::::: commit date: 7 days ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/202=
20207/202202070226.OXoWo6JP-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/iio/accel/mma8452.c:1595 mma8452_probe() error: we previously assum=
ed 'id' could be null (see line 1536)

vim +/id +1595 drivers/iio/accel/mma8452.c

c3cdd6e48e35b7 Martin Kepplinger     2015-09-01  1518  =

c7eeea93ac60ab Peter Meerwald        2014-02-05  1519  static int mma8452_p=
robe(struct i2c_client *client,
c7eeea93ac60ab Peter Meerwald        2014-02-05  1520  			 const struct i2c=
_device_id *id)
c7eeea93ac60ab Peter Meerwald        2014-02-05  1521  {
c7eeea93ac60ab Peter Meerwald        2014-02-05  1522  	struct mma8452_data=
 *data;
c7eeea93ac60ab Peter Meerwald        2014-02-05  1523  	struct iio_dev *ind=
io_dev;
c7eeea93ac60ab Peter Meerwald        2014-02-05  1524  	int ret;
c3cdd6e48e35b7 Martin Kepplinger     2015-09-01  1525  	const struct of_dev=
ice_id *match;
4787cdbfbcb959 Hans de Goede         2022-01-06  1526  	const char *compati=
ble;
c3cdd6e48e35b7 Martin Kepplinger     2015-09-01  1527  =

c7eeea93ac60ab Peter Meerwald        2014-02-05  1528  	indio_dev =3D devm_=
iio_device_alloc(&client->dev, sizeof(*data));
c7eeea93ac60ab Peter Meerwald        2014-02-05  1529  	if (!indio_dev)
c7eeea93ac60ab Peter Meerwald        2014-02-05  1530  		return -ENOMEM;
c7eeea93ac60ab Peter Meerwald        2014-02-05  1531  =

c7eeea93ac60ab Peter Meerwald        2014-02-05  1532  	data =3D iio_priv(i=
ndio_dev);
c7eeea93ac60ab Peter Meerwald        2014-02-05  1533  	data->client =3D cl=
ient;
c7eeea93ac60ab Peter Meerwald        2014-02-05  1534  	mutex_init(&data->l=
ock);
4787cdbfbcb959 Hans de Goede         2022-01-06  1535  =

4787cdbfbcb959 Hans de Goede         2022-01-06 @1536  	if (id) {
4787cdbfbcb959 Hans de Goede         2022-01-06  1537  		compatible =3D id-=
>name;
4787cdbfbcb959 Hans de Goede         2022-01-06  1538  		data->chip_info =
=3D &mma_chip_info_table[id->driver_data];
4787cdbfbcb959 Hans de Goede         2022-01-06  1539  	} else {
4787cdbfbcb959 Hans de Goede         2022-01-06  1540  		match =3D of_match=
_device(mma8452_dt_ids, &client->dev);
4787cdbfbcb959 Hans de Goede         2022-01-06  1541  		if (!match) {
4787cdbfbcb959 Hans de Goede         2022-01-06  1542  			dev_err(&client->=
dev, "unknown device model\n");
4787cdbfbcb959 Hans de Goede         2022-01-06  1543  			return -ENODEV;
4787cdbfbcb959 Hans de Goede         2022-01-06  1544  		}
4787cdbfbcb959 Hans de Goede         2022-01-06  1545  		compatible =3D mat=
ch->compatible;
c3cdd6e48e35b7 Martin Kepplinger     2015-09-01  1546  		data->chip_info =
=3D match->data;
4787cdbfbcb959 Hans de Goede         2022-01-06  1547  	}
c3cdd6e48e35b7 Martin Kepplinger     2015-09-01  1548  =

f6ff49b8a3b6f7 Anson Huang           2019-01-08  1549  	data->vdd_reg =3D d=
evm_regulator_get(&client->dev, "vdd");
c8b9a02361d993 Krzysztof Kozlowski   2020-08-29  1550  	if (IS_ERR(data->vd=
d_reg))
c8b9a02361d993 Krzysztof Kozlowski   2020-08-29  1551  		return dev_err_pro=
be(&client->dev, PTR_ERR(data->vdd_reg),
c8b9a02361d993 Krzysztof Kozlowski   2020-08-29  1552  				     "failed to =
get VDD regulator!\n");
f6ff49b8a3b6f7 Anson Huang           2019-01-08  1553  =

f6ff49b8a3b6f7 Anson Huang           2019-01-08  1554  	data->vddio_reg =3D=
 devm_regulator_get(&client->dev, "vddio");
c8b9a02361d993 Krzysztof Kozlowski   2020-08-29  1555  	if (IS_ERR(data->vd=
dio_reg))
c8b9a02361d993 Krzysztof Kozlowski   2020-08-29  1556  		return dev_err_pro=
be(&client->dev, PTR_ERR(data->vddio_reg),
c8b9a02361d993 Krzysztof Kozlowski   2020-08-29  1557  				     "failed to =
get VDDIO regulator!\n");
f6ff49b8a3b6f7 Anson Huang           2019-01-08  1558  =

f6ff49b8a3b6f7 Anson Huang           2019-01-08  1559  	ret =3D regulator_e=
nable(data->vdd_reg);
f6ff49b8a3b6f7 Anson Huang           2019-01-08  1560  	if (ret) {
f6ff49b8a3b6f7 Anson Huang           2019-01-08  1561  		dev_err(&client->d=
ev, "failed to enable VDD regulator!\n");
f6ff49b8a3b6f7 Anson Huang           2019-01-08  1562  		return ret;
f6ff49b8a3b6f7 Anson Huang           2019-01-08  1563  	}
f6ff49b8a3b6f7 Anson Huang           2019-01-08  1564  =

f6ff49b8a3b6f7 Anson Huang           2019-01-08  1565  	ret =3D regulator_e=
nable(data->vddio_reg);
f6ff49b8a3b6f7 Anson Huang           2019-01-08  1566  	if (ret) {
f6ff49b8a3b6f7 Anson Huang           2019-01-08  1567  		dev_err(&client->d=
ev, "failed to enable VDDIO regulator!\n");
f6ff49b8a3b6f7 Anson Huang           2019-01-08  1568  		goto disable_regul=
ator_vdd;
f6ff49b8a3b6f7 Anson Huang           2019-01-08  1569  	}
f6ff49b8a3b6f7 Anson Huang           2019-01-08  1570  =

417e008ba9db7c Martin Kepplinger     2015-09-01  1571  	ret =3D i2c_smbus_r=
ead_byte_data(client, MMA8452_WHO_AM_I);
417e008ba9db7c Martin Kepplinger     2015-09-01  1572  	if (ret < 0)
f6ff49b8a3b6f7 Anson Huang           2019-01-08  1573  		goto disable_regul=
ators;
417e008ba9db7c Martin Kepplinger     2015-09-01  1574  =

417e008ba9db7c Martin Kepplinger     2015-09-01  1575  	switch (ret) {
244a93f651937a Martin Kepplinger     2016-01-16  1576  	case MMA8451_DEVICE=
_ID:
417e008ba9db7c Martin Kepplinger     2015-09-01  1577  	case MMA8452_DEVICE=
_ID:
417e008ba9db7c Martin Kepplinger     2015-09-01  1578  	case MMA8453_DEVICE=
_ID:
417e008ba9db7c Martin Kepplinger     2015-09-01  1579  	case MMA8652_DEVICE=
_ID:
417e008ba9db7c Martin Kepplinger     2015-09-01  1580  	case MMA8653_DEVICE=
_ID:
e8731180fbf6fd Martin Kepplinger     2016-03-09  1581  	case FXLS8471_DEVIC=
E_ID:
417e008ba9db7c Martin Kepplinger     2015-09-01  1582  		if (ret =3D=3D dat=
a->chip_info->chip_id)
417e008ba9db7c Martin Kepplinger     2015-09-01  1583  			break;
df561f6688fef7 Gustavo A. R. Silva   2020-08-23  1584  		fallthrough;
417e008ba9db7c Martin Kepplinger     2015-09-01  1585  	default:
f6ff49b8a3b6f7 Anson Huang           2019-01-08  1586  		ret =3D -ENODEV;
f6ff49b8a3b6f7 Anson Huang           2019-01-08  1587  		goto disable_regul=
ators;
417e008ba9db7c Martin Kepplinger     2015-09-01  1588  	}
417e008ba9db7c Martin Kepplinger     2015-09-01  1589  =

c3cdd6e48e35b7 Martin Kepplinger     2015-09-01  1590  	dev_info(&client->d=
ev, "registering %s accelerometer; ID 0x%x\n",
4787cdbfbcb959 Hans de Goede         2022-01-06  1591  		 compatible, data-=
>chip_info->chip_id);
c7eeea93ac60ab Peter Meerwald        2014-02-05  1592  =

c7eeea93ac60ab Peter Meerwald        2014-02-05  1593  	i2c_set_clientdata(=
client, indio_dev);
c7eeea93ac60ab Peter Meerwald        2014-02-05  1594  	indio_dev->info =3D=
 &mma8452_info;
c7eeea93ac60ab Peter Meerwald        2014-02-05 @1595  	indio_dev->name =3D=
 id->name;
c7eeea93ac60ab Peter Meerwald        2014-02-05  1596  	indio_dev->modes =
=3D INDIO_DIRECT_MODE;
c3cdd6e48e35b7 Martin Kepplinger     2015-09-01  1597  	indio_dev->channels=
 =3D data->chip_info->channels;
c3cdd6e48e35b7 Martin Kepplinger     2015-09-01  1598  	indio_dev->num_chan=
nels =3D data->chip_info->num_channels;
c7eeea93ac60ab Peter Meerwald        2014-02-05  1599  	indio_dev->availabl=
e_scan_masks =3D mma8452_scan_masks;
c7eeea93ac60ab Peter Meerwald        2014-02-05  1600  =

ecabae71319695 Martin Fuzzey         2015-05-13  1601  	ret =3D mma8452_res=
et(client);
c7eeea93ac60ab Peter Meerwald        2014-02-05  1602  	if (ret < 0)
f6ff49b8a3b6f7 Anson Huang           2019-01-08  1603  		goto disable_regul=
ators;
c7eeea93ac60ab Peter Meerwald        2014-02-05  1604  =

c7eeea93ac60ab Peter Meerwald        2014-02-05  1605  	data->data_cfg =3D =
MMA8452_DATA_CFG_FS_2G;
c7eeea93ac60ab Peter Meerwald        2014-02-05  1606  	ret =3D i2c_smbus_w=
rite_byte_data(client, MMA8452_DATA_CFG,
c7eeea93ac60ab Peter Meerwald        2014-02-05  1607  					data->data_cfg);
c7eeea93ac60ab Peter Meerwald        2014-02-05  1608  	if (ret < 0)
f6ff49b8a3b6f7 Anson Huang           2019-01-08  1609  		goto disable_regul=
ators;
c7eeea93ac60ab Peter Meerwald        2014-02-05  1610  =

28e3427824ccc8 Martin Fuzzey         2015-06-01  1611  	/*
28e3427824ccc8 Martin Fuzzey         2015-06-01  1612  	 * By default set t=
ransient threshold to max to avoid events if
28e3427824ccc8 Martin Fuzzey         2015-06-01  1613  	 * enabling without=
 configuring threshold.
28e3427824ccc8 Martin Fuzzey         2015-06-01  1614  	 */
28e3427824ccc8 Martin Fuzzey         2015-06-01  1615  	ret =3D i2c_smbus_w=
rite_byte_data(client, MMA8452_TRANSIENT_THS,
28e3427824ccc8 Martin Fuzzey         2015-06-01  1616  					MMA8452_TRANSIE=
NT_THS_MASK);
28e3427824ccc8 Martin Fuzzey         2015-06-01  1617  	if (ret < 0)
f6ff49b8a3b6f7 Anson Huang           2019-01-08  1618  		goto disable_regul=
ators;
28e3427824ccc8 Martin Fuzzey         2015-06-01  1619  =

28e3427824ccc8 Martin Fuzzey         2015-06-01  1620  	if (client->irq) {
d2a3e0931a8f3b Martin Kepplinger     2015-10-15  1621  		int irq2;
28e3427824ccc8 Martin Fuzzey         2015-06-01  1622  =

d2a3e0931a8f3b Martin Kepplinger     2015-10-15  1623  		irq2 =3D of_irq_ge=
t_byname(client->dev.of_node, "INT2");
d2a3e0931a8f3b Martin Kepplinger     2015-10-15  1624  =

d2a3e0931a8f3b Martin Kepplinger     2015-10-15  1625  		if (irq2 =3D=3D cl=
ient->irq) {
d2a3e0931a8f3b Martin Kepplinger     2015-10-15  1626  			dev_dbg(&client->=
dev, "using interrupt line INT2\n");
d2a3e0931a8f3b Martin Kepplinger     2015-10-15  1627  		} else {
28e3427824ccc8 Martin Fuzzey         2015-06-01  1628  			ret =3D i2c_smbus=
_write_byte_data(client,
28e3427824ccc8 Martin Fuzzey         2015-06-01  1629  						MMA8452_CTRL_R=
EG5,
605f72de137ad9 Harinath Nampally     2017-09-09  1630  						data->chip_inf=
o->all_events);
28e3427824ccc8 Martin Fuzzey         2015-06-01  1631  			if (ret < 0)
f6ff49b8a3b6f7 Anson Huang           2019-01-08  1632  				goto disable_reg=
ulators;
28e3427824ccc8 Martin Fuzzey         2015-06-01  1633  =

d2a3e0931a8f3b Martin Kepplinger     2015-10-15  1634  			dev_dbg(&client->=
dev, "using interrupt line INT1\n");
d2a3e0931a8f3b Martin Kepplinger     2015-10-15  1635  		}
d2a3e0931a8f3b Martin Kepplinger     2015-10-15  1636  =

28e3427824ccc8 Martin Fuzzey         2015-06-01  1637  		ret =3D i2c_smbus_=
write_byte_data(client,
28e3427824ccc8 Martin Fuzzey         2015-06-01  1638  					MMA8452_CTRL_RE=
G4,
605f72de137ad9 Harinath Nampally     2017-09-09  1639  					data->chip_info=
->enabled_events);
ae6d9ce05691bf Martin Fuzzey         2015-06-01  1640  		if (ret < 0)
f6ff49b8a3b6f7 Anson Huang           2019-01-08  1641  			goto disable_regu=
lators;
ae6d9ce05691bf Martin Fuzzey         2015-06-01  1642  =

ae6d9ce05691bf Martin Fuzzey         2015-06-01  1643  		ret =3D mma8452_tr=
igger_setup(indio_dev);
28e3427824ccc8 Martin Fuzzey         2015-06-01  1644  		if (ret < 0)
f6ff49b8a3b6f7 Anson Huang           2019-01-08  1645  			goto disable_regu=
lators;
28e3427824ccc8 Martin Fuzzey         2015-06-01  1646  	}
28e3427824ccc8 Martin Fuzzey         2015-06-01  1647  =

ecabae71319695 Martin Fuzzey         2015-05-13  1648  	data->ctrl_reg1 =3D=
 MMA8452_CTRL_ACTIVE |
ecabae71319695 Martin Fuzzey         2015-05-13  1649  			  (MMA8452_CTRL_D=
R_DEFAULT << MMA8452_CTRL_DR_SHIFT);
a45d1238870446 Richard Tresidder     2018-05-11  1650  =

a45d1238870446 Richard Tresidder     2018-05-11  1651  	data->sleep_val =3D=
 mma8452_calculate_sleep(data);
a45d1238870446 Richard Tresidder     2018-05-11  1652  =

ecabae71319695 Martin Fuzzey         2015-05-13  1653  	ret =3D i2c_smbus_w=
rite_byte_data(client, MMA8452_CTRL_REG1,
ecabae71319695 Martin Fuzzey         2015-05-13  1654  					data->ctrl_reg1=
);
ecabae71319695 Martin Fuzzey         2015-05-13  1655  	if (ret < 0)
ae6d9ce05691bf Martin Fuzzey         2015-06-01  1656  		goto trigger_clean=
up;
ecabae71319695 Martin Fuzzey         2015-05-13  1657  =

c7eeea93ac60ab Peter Meerwald        2014-02-05  1658  	ret =3D iio_trigger=
ed_buffer_setup(indio_dev, NULL,
c7eeea93ac60ab Peter Meerwald        2014-02-05  1659  					 mma8452_trigge=
r_handler, NULL);
c7eeea93ac60ab Peter Meerwald        2014-02-05  1660  	if (ret < 0)
ae6d9ce05691bf Martin Fuzzey         2015-06-01  1661  		goto trigger_clean=
up;
c7eeea93ac60ab Peter Meerwald        2014-02-05  1662  =

28e3427824ccc8 Martin Fuzzey         2015-06-01  1663  	if (client->irq) {
28e3427824ccc8 Martin Fuzzey         2015-06-01  1664  		ret =3D devm_reque=
st_threaded_irq(&client->dev,
28e3427824ccc8 Martin Fuzzey         2015-06-01  1665  						client->irq,
28e3427824ccc8 Martin Fuzzey         2015-06-01  1666  						NULL, mma8452_=
interrupt,
28e3427824ccc8 Martin Fuzzey         2015-06-01  1667  						IRQF_TRIGGER_L=
OW | IRQF_ONESHOT,
28e3427824ccc8 Martin Fuzzey         2015-06-01  1668  						client->name, =
indio_dev);
28e3427824ccc8 Martin Fuzzey         2015-06-01  1669  		if (ret)
28e3427824ccc8 Martin Fuzzey         2015-06-01  1670  			goto buffer_clean=
up;
28e3427824ccc8 Martin Fuzzey         2015-06-01  1671  	}
28e3427824ccc8 Martin Fuzzey         2015-06-01  1672  =

96c0cb2bbfe0a5 Martin Kepplinger     2016-03-03  1673  	ret =3D pm_runtime_=
set_active(&client->dev);
96c0cb2bbfe0a5 Martin Kepplinger     2016-03-03  1674  	if (ret < 0)
96c0cb2bbfe0a5 Martin Kepplinger     2016-03-03  1675  		goto buffer_cleanu=
p;
96c0cb2bbfe0a5 Martin Kepplinger     2016-03-03  1676  =

96c0cb2bbfe0a5 Martin Kepplinger     2016-03-03  1677  	pm_runtime_enable(&=
client->dev);
96c0cb2bbfe0a5 Martin Kepplinger     2016-03-03  1678  	pm_runtime_set_auto=
suspend_delay(&client->dev,
96c0cb2bbfe0a5 Martin Kepplinger     2016-03-03  1679  					 MMA8452_AUTO_S=
USPEND_DELAY_MS);
96c0cb2bbfe0a5 Martin Kepplinger     2016-03-03  1680  	pm_runtime_use_auto=
suspend(&client->dev);
96c0cb2bbfe0a5 Martin Kepplinger     2016-03-03  1681  =

c7eeea93ac60ab Peter Meerwald        2014-02-05  1682  	ret =3D iio_device_=
register(indio_dev);
c7eeea93ac60ab Peter Meerwald        2014-02-05  1683  	if (ret < 0)
c7eeea93ac60ab Peter Meerwald        2014-02-05  1684  		goto buffer_cleanu=
p;
28e3427824ccc8 Martin Fuzzey         2015-06-01  1685  =

4b04266abe3ea0 Martin Kepplinger     2016-01-16  1686  	ret =3D mma8452_set=
_freefall_mode(data, false);
1a965d405fc6f6 Bijosh Thykkoottathil 2016-07-04  1687  	if (ret < 0)
d7369ae1f4d7cf Chuhong Yuan          2020-05-28  1688  		goto unregister_de=
vice;
4b04266abe3ea0 Martin Kepplinger     2016-01-16  1689  =

c7eeea93ac60ab Peter Meerwald        2014-02-05  1690  	return 0;
c7eeea93ac60ab Peter Meerwald        2014-02-05  1691  =

d7369ae1f4d7cf Chuhong Yuan          2020-05-28  1692  unregister_device:
d7369ae1f4d7cf Chuhong Yuan          2020-05-28  1693  	iio_device_unregist=
er(indio_dev);
d7369ae1f4d7cf Chuhong Yuan          2020-05-28  1694  =

c7eeea93ac60ab Peter Meerwald        2014-02-05  1695  buffer_cleanup:
c7eeea93ac60ab Peter Meerwald        2014-02-05  1696  	iio_triggered_buffe=
r_cleanup(indio_dev);
ae6d9ce05691bf Martin Fuzzey         2015-06-01  1697  =

ae6d9ce05691bf Martin Fuzzey         2015-06-01  1698  trigger_cleanup:
ae6d9ce05691bf Martin Fuzzey         2015-06-01  1699  	mma8452_trigger_cle=
anup(indio_dev);
ae6d9ce05691bf Martin Fuzzey         2015-06-01  1700  =

f6ff49b8a3b6f7 Anson Huang           2019-01-08  1701  disable_regulators:
f6ff49b8a3b6f7 Anson Huang           2019-01-08  1702  	regulator_disable(d=
ata->vddio_reg);
f6ff49b8a3b6f7 Anson Huang           2019-01-08  1703  =

f6ff49b8a3b6f7 Anson Huang           2019-01-08  1704  disable_regulator_vd=
d:
f6ff49b8a3b6f7 Anson Huang           2019-01-08  1705  	regulator_disable(d=
ata->vdd_reg);
f6ff49b8a3b6f7 Anson Huang           2019-01-08  1706  =

c7eeea93ac60ab Peter Meerwald        2014-02-05  1707  	return ret;
c7eeea93ac60ab Peter Meerwald        2014-02-05  1708  }
c7eeea93ac60ab Peter Meerwald        2014-02-05  1709  =


:::::: The code at line 1595 was first introduced by commit
:::::: c7eeea93ac60aba3c037af8933a7ffc96ccd495c iio: Add Freescale MMA8452Q=
 3-axis accelerometer driver

:::::: TO: Peter Meerwald <pmeerw@pmeerw.net>
:::::: CC: Jonathan Cameron <jic23@kernel.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5379801372335944622==--

