Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794732287;
	b=t6XfthkAdAgu29GEJ+cGR/LHbZVYrr+hq5mPvktpxPnBE+jCslp4h/1PNxodSI9FD/CI
	 eSxINNQNQhmiX4YUqsuQwfLo8XLk/E6WYJusV1A29qirTaQjgp4VFCXiK915bDL0JhTM4
	 bJMhVjY4CdVVsDl7txNKaMABrvkZ+ZGvKNYkAS9Bbgcl9yeoGi5a7FLgYedM0aqOmubwi
	 4E9xJoy3wrToZ+IDo9KJ8KE8JrCcLBVapDzl9dHKtWqdqveMknNUD0TU98SKoaieA2oST
	 2INHrNXvY5HpmnXpF+gYfyOcrTsXlcB1PDg+r2bSQloxG1nOzwy7ESZeQqNc20OM8Tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794732287;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=nbCQWpSaN0/YPYmktb9plqp+nWDdkW+csJ5C0Q/ZKnE=;
	b=iFojvSItMBqqjZuXPol0+WPCVRG5WWQx14tUJz+SF8/WHQlawNWeMs2YOkKqEEYHYfcR
	 DbW6lmpJ6wvVO7RbIDjNG4/WHIw/tPSm4I7gRbwC27rtZcuoQgQSLKkgFdzB3NQAuawrn
	 kstKMyYAzFHmwydqwI8rxNZjy2mdfFjs+3l2yW7UDIcEnUMFd+JPTSWAcaDnYNrDrWzh0
	 1ovxxmnxMvAaMxFjO/no36jteHhYE4koAzT7/OtjsUSYSH1CxRhJXOWI8ykdUt8JjAPdd
	 U9IZyfA2fa8YXuCPvKrWlABJuNjtoV1/XIeLjq4ti2DR9WiTBKIDsIi9xknvJvsJ/+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Z+hDq+Um;
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 671D0606A31E
	for <oe-kbuild@lists.linux.dev>; Sun, 15 Nov 2026 08:44:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 671D0606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Z+hDq+Um
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794732287; x=1826268287;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=9VdW7s+XZCXGz/qK/l7SmVKEmKmuEmqDyzNhOTCYOR0=;
  b=Z+hDq+UmJpGnkTgr/CWn/Bzse4Yw6jFxFze5jlDw8RfwsKBgH2cbzi6e
   H2h4fUEaAGtTmWf0lNI0Idhmi90UXz3LGRJVhCgx4Yl9z5UbOtz0HYEYb
   HmfQnFuUNO+ZV6eUhu1/qVBInnscGR0U6Swlp8uI3Ywfm9T2jk8R99Tnn
   WID13PO0zx3kIhCv8PjjrjhznZzyn9VotGWpELMaLXpJVtOFUQtVDIb1n
   h2jb5LpzEufgkWprnrtm00yxu+Ogeif+qhDXOU7XPlrUnV4/lM+ybPjv7
   N+xk0Itu0epq0MY5yq7GcxE2y6Dh/b2kE7DhrxIVYXzjJ3BHzR5dPoRi0
   w==;
X-CSE-ConnectionGUID: E5QbunZRShCfQ6gLgUxz+w==
X-CSE-MsgGUID: 5nXeaAYGTB2TVcFY/dJuvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11966"; a="3395129"
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="3395129"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2026 00:44:46 -0800
X-CSE-ConnectionGUID: /GTUb3TpRSihLeF8M9ZL3Q==
X-CSE-MsgGUID: 4daDanOBQlWmtH2C1UXD8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="9455367"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 15 Nov 2026 00:44:44 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSVqs-0000000027c-0HWU;
	Sun, 15 Nov 2026 08:44:42 +0000
Date: Sun, 15 Nov 2026 09:43:44 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [jic23-iio:testing 24/308]
 drivers/iio/accel/mma8452.c:1680:8-28: WARNING: Threaded IRQ with no primary
 handler requested without IRQF_ONESHOT (unless it is nested IRQ)
Message-ID: <202611150958.553wHmYA-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Esben Haabendal <esben@geanix.com>
CC: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
CC: Andy Shevchenko <andriy.shevchenko@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git testi=
ng
head:   94921bc9eb214f838481faa847cda5c42e486013
commit: 5883de8ce9d5d7b29c8da7401e2e92de702ab441 [24/308] iio: accel: mma84=
52: Only apply trigger type when not set by firmware
:::::: branch date: 7 hours ago
:::::: commit date: 13 days ago
config: x86_64-randconfig-2104-20261115 (https://download.01.org/0day-ci/ar=
chive/20261115/202611150958.553wHmYA-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202611150958.553wHmYA-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/iio/accel/mma8452.c:1680:8-28: WARNING: Threaded IRQ with no pri=
mary handler requested without IRQF_ONESHOT (unless it is nested IRQ)

vim +1680 drivers/iio/accel/mma8452.c

c3cdd6e48e35b7 Martin Kepplinger     2015-09-01  1545 =20
226d6dbac88336 Uwe Kleine-K=C3=B6nig      2022-11-18  1546  static int mma8=
452_probe(struct i2c_client *client)
c7eeea93ac60ab Peter Meerwald        2014-02-05  1547  {
32a5c04d457540 Sanjay Chitroda       2026-05-05  1548  	struct device *dev =
=3D &client->dev;
c7eeea93ac60ab Peter Meerwald        2014-02-05  1549  	struct mma8452_data=
 *data;
c7eeea93ac60ab Peter Meerwald        2014-02-05  1550  	struct iio_dev *ind=
io_dev;
c7eeea93ac60ab Peter Meerwald        2014-02-05  1551  	int ret;
c3cdd6e48e35b7 Martin Kepplinger     2015-09-01  1552 =20
a47a45567852ad Sanjay Chitroda       2026-08-08  1553  	indio_dev =3D devm_=
iio_device_alloc(dev, sizeof(*data));
c7eeea93ac60ab Peter Meerwald        2014-02-05  1554  	if (!indio_dev)
c7eeea93ac60ab Peter Meerwald        2014-02-05  1555  		return -ENOMEM;
c7eeea93ac60ab Peter Meerwald        2014-02-05  1556 =20
c7eeea93ac60ab Peter Meerwald        2014-02-05  1557  	data =3D iio_priv(i=
ndio_dev);
c7eeea93ac60ab Peter Meerwald        2014-02-05  1558  	data->client =3D cl=
ient;
c7eeea93ac60ab Peter Meerwald        2014-02-05  1559  	mutex_init(&data->l=
ock);
a47ac019e7e812 Hans de Goede         2022-02-08  1560 =20
0f8eaeda7659d0 Biju Das              2023-08-18  1561  	data->chip_info =3D =
i2c_get_match_data(client);
0f8eaeda7659d0 Biju Das              2023-08-18  1562  	if (!data->chip_inf=
o)
a47a45567852ad Sanjay Chitroda       2026-08-08  1563  		return dev_err_pro=
be(dev, -ENODEV, "unknown device model\n");
c3cdd6e48e35b7 Martin Kepplinger     2015-09-01  1564 =20
a47a45567852ad Sanjay Chitroda       2026-08-08  1565  	ret =3D iio_read_mo=
unt_matrix(dev, &data->orientation);
b863f2e3a83f99 Hans de Goede         2022-02-08  1566  	if (ret)
b863f2e3a83f99 Hans de Goede         2022-02-08  1567  		return ret;
b863f2e3a83f99 Hans de Goede         2022-02-08  1568 =20
37fbab78f94fce Sanjay Chitroda       2026-08-08  1569  	data->regs[0].suppl=
y =3D "vdd";
37fbab78f94fce Sanjay Chitroda       2026-08-08  1570  	data->regs[1].suppl=
y =3D "vddio";
37fbab78f94fce Sanjay Chitroda       2026-08-08  1571  	ret =3D devm_regula=
tor_bulk_get(dev, ARRAY_SIZE(data->regs), data->regs);
32a5c04d457540 Sanjay Chitroda       2026-05-05  1572  	if (ret)
37fbab78f94fce Sanjay Chitroda       2026-08-08  1573  		return dev_err_pro=
be(dev, ret, "failed to get regulators\n");
f6ff49b8a3b6f7 Anson Huang           2019-01-08  1574 =20
37fbab78f94fce Sanjay Chitroda       2026-08-08  1575  	ret =3D regulator_b=
ulk_enable(ARRAY_SIZE(data->regs), data->regs);
37fbab78f94fce Sanjay Chitroda       2026-08-08  1576  	if (ret)
37fbab78f94fce Sanjay Chitroda       2026-08-08  1577  		return dev_err_pro=
be(dev, ret, "failed to enable regulators\n");
f6ff49b8a3b6f7 Anson Huang           2019-01-08  1578 =20
417e008ba9db7c Martin Kepplinger     2015-09-01  1579  	ret =3D i2c_smbus_r=
ead_byte_data(client, MMA8452_WHO_AM_I);
417e008ba9db7c Martin Kepplinger     2015-09-01  1580  	if (ret < 0)
f6ff49b8a3b6f7 Anson Huang           2019-01-08  1581  		goto disable_regul=
ators;
417e008ba9db7c Martin Kepplinger     2015-09-01  1582 =20
417e008ba9db7c Martin Kepplinger     2015-09-01  1583  	switch (ret) {
244a93f651937a Martin Kepplinger     2016-01-16  1584  	case MMA8451_DEVICE=
_ID:
417e008ba9db7c Martin Kepplinger     2015-09-01  1585  	case MMA8452_DEVICE=
_ID:
417e008ba9db7c Martin Kepplinger     2015-09-01  1586  	case MMA8453_DEVICE=
_ID:
417e008ba9db7c Martin Kepplinger     2015-09-01  1587  	case MMA8652_DEVICE=
_ID:
417e008ba9db7c Martin Kepplinger     2015-09-01  1588  	case MMA8653_DEVICE=
_ID:
e8731180fbf6fd Martin Kepplinger     2016-03-09  1589  	case FXLS8471_DEVIC=
E_ID:
417e008ba9db7c Martin Kepplinger     2015-09-01  1590  		if (ret =3D=3D dat=
a->chip_info->chip_id)
417e008ba9db7c Martin Kepplinger     2015-09-01  1591  			break;
df561f6688fef7 Gustavo A. R. Silva   2020-08-23  1592  		fallthrough;
417e008ba9db7c Martin Kepplinger     2015-09-01  1593  	default:
f6ff49b8a3b6f7 Anson Huang           2019-01-08  1594  		ret =3D -ENODEV;
f6ff49b8a3b6f7 Anson Huang           2019-01-08  1595  		goto disable_regul=
ators;
417e008ba9db7c Martin Kepplinger     2015-09-01  1596  	}
417e008ba9db7c Martin Kepplinger     2015-09-01  1597 =20
a47a45567852ad Sanjay Chitroda       2026-08-08  1598  	dev_info(dev, "regi=
stering %s accelerometer; ID 0x%x\n",
a47ac019e7e812 Hans de Goede         2022-02-08  1599  		 data->chip_info->=
name, data->chip_info->chip_id);
c7eeea93ac60ab Peter Meerwald        2014-02-05  1600 =20
c7eeea93ac60ab Peter Meerwald        2014-02-05  1601  	i2c_set_clientdata(=
client, indio_dev);
c7eeea93ac60ab Peter Meerwald        2014-02-05  1602  	indio_dev->info =3D =
&mma8452_info;
a47ac019e7e812 Hans de Goede         2022-02-08  1603  	indio_dev->name =3D =
data->chip_info->name;
c7eeea93ac60ab Peter Meerwald        2014-02-05  1604  	indio_dev->modes =
=3D INDIO_DIRECT_MODE;
c3cdd6e48e35b7 Martin Kepplinger     2015-09-01  1605  	indio_dev->channels=
 =3D data->chip_info->channels;
c3cdd6e48e35b7 Martin Kepplinger     2015-09-01  1606  	indio_dev->num_chan=
nels =3D data->chip_info->num_channels;
c7eeea93ac60ab Peter Meerwald        2014-02-05  1607  	indio_dev->availabl=
e_scan_masks =3D mma8452_scan_masks;
c7eeea93ac60ab Peter Meerwald        2014-02-05  1608 =20
ecabae71319695 Martin Fuzzey         2015-05-13  1609  	ret =3D mma8452_res=
et(client);
c7eeea93ac60ab Peter Meerwald        2014-02-05  1610  	if (ret < 0)
f6ff49b8a3b6f7 Anson Huang           2019-01-08  1611  		goto disable_regul=
ators;
c7eeea93ac60ab Peter Meerwald        2014-02-05  1612 =20
c7eeea93ac60ab Peter Meerwald        2014-02-05  1613  	data->data_cfg =3D =
MMA8452_DATA_CFG_FS_2G;
c7eeea93ac60ab Peter Meerwald        2014-02-05  1614  	ret =3D i2c_smbus_w=
rite_byte_data(client, MMA8452_DATA_CFG,
c7eeea93ac60ab Peter Meerwald        2014-02-05  1615  					data->data_cfg);
c7eeea93ac60ab Peter Meerwald        2014-02-05  1616  	if (ret < 0)
f6ff49b8a3b6f7 Anson Huang           2019-01-08  1617  		goto disable_regul=
ators;
c7eeea93ac60ab Peter Meerwald        2014-02-05  1618 =20
28e3427824ccc8 Martin Fuzzey         2015-06-01  1619  	/*
28e3427824ccc8 Martin Fuzzey         2015-06-01  1620  	 * By default set t=
ransient threshold to max to avoid events if
28e3427824ccc8 Martin Fuzzey         2015-06-01  1621  	 * enabling without=
 configuring threshold.
28e3427824ccc8 Martin Fuzzey         2015-06-01  1622  	 */
28e3427824ccc8 Martin Fuzzey         2015-06-01  1623  	ret =3D i2c_smbus_w=
rite_byte_data(client, MMA8452_TRANSIENT_THS,
28e3427824ccc8 Martin Fuzzey         2015-06-01  1624  					MMA8452_TRANSIE=
NT_THS_MASK);
28e3427824ccc8 Martin Fuzzey         2015-06-01  1625  	if (ret < 0)
f6ff49b8a3b6f7 Anson Huang           2019-01-08  1626  		goto disable_regul=
ators;
28e3427824ccc8 Martin Fuzzey         2015-06-01  1627 =20
28e3427824ccc8 Martin Fuzzey         2015-06-01  1628  	if (client->irq) {
d2a3e0931a8f3b Martin Kepplinger     2015-10-15  1629  		int irq2;
28e3427824ccc8 Martin Fuzzey         2015-06-01  1630 =20
a47a45567852ad Sanjay Chitroda       2026-08-08  1631  		irq2 =3D fwnode_ir=
q_get_byname(dev_fwnode(dev), "INT2");
d2a3e0931a8f3b Martin Kepplinger     2015-10-15  1632 =20
d2a3e0931a8f3b Martin Kepplinger     2015-10-15  1633  		if (irq2 =3D=3D cl=
ient->irq) {
a47a45567852ad Sanjay Chitroda       2026-08-08  1634  			dev_dbg(dev, "usi=
ng interrupt line INT2\n");
d2a3e0931a8f3b Martin Kepplinger     2015-10-15  1635  		} else {
28e3427824ccc8 Martin Fuzzey         2015-06-01  1636  			ret =3D i2c_smbus=
_write_byte_data(client,
28e3427824ccc8 Martin Fuzzey         2015-06-01  1637  							MMA8452_CTRL_=
REG5,
605f72de137ad9 Harinath Nampally     2017-09-09  1638  							data->chip_in=
fo->all_events);
28e3427824ccc8 Martin Fuzzey         2015-06-01  1639  			if (ret < 0)
f6ff49b8a3b6f7 Anson Huang           2019-01-08  1640  				goto disable_reg=
ulators;
28e3427824ccc8 Martin Fuzzey         2015-06-01  1641 =20
a47a45567852ad Sanjay Chitroda       2026-08-08  1642  			dev_dbg(dev, "usi=
ng interrupt line INT1\n");
d2a3e0931a8f3b Martin Kepplinger     2015-10-15  1643  		}
d2a3e0931a8f3b Martin Kepplinger     2015-10-15  1644 =20
28e3427824ccc8 Martin Fuzzey         2015-06-01  1645  		ret =3D i2c_smbus_=
write_byte_data(client,
28e3427824ccc8 Martin Fuzzey         2015-06-01  1646  						MMA8452_CTRL_R=
EG4,
605f72de137ad9 Harinath Nampally     2017-09-09  1647  						data->chip_inf=
o->enabled_events);
ae6d9ce05691bf Martin Fuzzey         2015-06-01  1648  		if (ret < 0)
f6ff49b8a3b6f7 Anson Huang           2019-01-08  1649  			goto disable_regu=
lators;
ae6d9ce05691bf Martin Fuzzey         2015-06-01  1650 =20
ae6d9ce05691bf Martin Fuzzey         2015-06-01  1651  		ret =3D mma8452_tr=
igger_setup(indio_dev);
28e3427824ccc8 Martin Fuzzey         2015-06-01  1652  		if (ret < 0)
f6ff49b8a3b6f7 Anson Huang           2019-01-08  1653  			goto disable_regu=
lators;
28e3427824ccc8 Martin Fuzzey         2015-06-01  1654  	}
28e3427824ccc8 Martin Fuzzey         2015-06-01  1655 =20
ecabae71319695 Martin Fuzzey         2015-05-13  1656  	data->ctrl_reg1 =3D =
MMA8452_CTRL_ACTIVE |
ecabae71319695 Martin Fuzzey         2015-05-13  1657  			  (MMA8452_CTRL_D=
R_DEFAULT << MMA8452_CTRL_DR_SHIFT);
a45d1238870446 Richard Tresidder     2018-05-11  1658 =20
a45d1238870446 Richard Tresidder     2018-05-11  1659  	data->sleep_val =3D =
mma8452_calculate_sleep(data);
a45d1238870446 Richard Tresidder     2018-05-11  1660 =20
ecabae71319695 Martin Fuzzey         2015-05-13  1661  	ret =3D i2c_smbus_w=
rite_byte_data(client, MMA8452_CTRL_REG1,
ecabae71319695 Martin Fuzzey         2015-05-13  1662  					data->ctrl_reg1=
);
ecabae71319695 Martin Fuzzey         2015-05-13  1663  	if (ret < 0)
ae6d9ce05691bf Martin Fuzzey         2015-06-01  1664  		goto trigger_clean=
up;
ecabae71319695 Martin Fuzzey         2015-05-13  1665 =20
c7eeea93ac60ab Peter Meerwald        2014-02-05  1666  	ret =3D iio_trigger=
ed_buffer_setup(indio_dev, NULL,
c7eeea93ac60ab Peter Meerwald        2014-02-05  1667  					 mma8452_trigge=
r_handler, NULL);
c7eeea93ac60ab Peter Meerwald        2014-02-05  1668  	if (ret < 0)
ae6d9ce05691bf Martin Fuzzey         2015-06-01  1669  		goto trigger_clean=
up;
c7eeea93ac60ab Peter Meerwald        2014-02-05  1670 =20
28e3427824ccc8 Martin Fuzzey         2015-06-01  1671  	if (client->irq) {
5883de8ce9d5d7 Esben Haabendal       2026-09-28  1672  		unsigned long irq_=
flags;
5883de8ce9d5d7 Esben Haabendal       2026-09-28  1673 =20
5883de8ce9d5d7 Esben Haabendal       2026-09-28  1674  		irq_flags =3D irq_=
get_trigger_type(client->irq);
5883de8ce9d5d7 Esben Haabendal       2026-09-28  1675  		if (irq_flags =3D=
=3D IRQ_TYPE_NONE) {
5883de8ce9d5d7 Esben Haabendal       2026-09-28  1676  			dev_info(dev, "in=
valid irq type, setting default active low\n");
5883de8ce9d5d7 Esben Haabendal       2026-09-28  1677  			irq_flags =3D IRQ=
F_TRIGGER_LOW;
5883de8ce9d5d7 Esben Haabendal       2026-09-28  1678  		}
5883de8ce9d5d7 Esben Haabendal       2026-09-28  1679  		irq_flags |=3D IRQ=
F_ONESHOT;
0a6726ec20cd4c Sanjay Chitroda       2026-05-05 @1680  		ret =3D request_th=
readed_irq(client->irq, NULL, mma8452_interrupt,
5883de8ce9d5d7 Esben Haabendal       2026-09-28  1681  					   irq_flags, c=
lient->name, indio_dev);
28e3427824ccc8 Martin Fuzzey         2015-06-01  1682  		if (ret)
28e3427824ccc8 Martin Fuzzey         2015-06-01  1683  			goto buffer_clean=
up;
28e3427824ccc8 Martin Fuzzey         2015-06-01  1684  	}
28e3427824ccc8 Martin Fuzzey         2015-06-01  1685 =20
a47a45567852ad Sanjay Chitroda       2026-08-08  1686  	ret =3D pm_runtime_=
set_active(dev);
96c0cb2bbfe0a5 Martin Kepplinger     2016-03-03  1687  	if (ret < 0)
0a6726ec20cd4c Sanjay Chitroda       2026-05-05  1688  		goto free_irq;
96c0cb2bbfe0a5 Martin Kepplinger     2016-03-03  1689 =20
a47a45567852ad Sanjay Chitroda       2026-08-08  1690  	pm_runtime_enable(d=
ev);
a47a45567852ad Sanjay Chitroda       2026-08-08  1691  	pm_runtime_set_auto=
suspend_delay(dev, MMA8452_AUTO_SUSPEND_DELAY_MS);
a47a45567852ad Sanjay Chitroda       2026-08-08  1692  	pm_runtime_use_auto=
suspend(dev);
96c0cb2bbfe0a5 Martin Kepplinger     2016-03-03  1693 =20
c7eeea93ac60ab Peter Meerwald        2014-02-05  1694  	ret =3D iio_device_=
register(indio_dev);
c7eeea93ac60ab Peter Meerwald        2014-02-05  1695  	if (ret < 0)
49ff01e1519f86 Esben Haabendal       2026-09-28  1696  		goto runtime_suspe=
nd;
28e3427824ccc8 Martin Fuzzey         2015-06-01  1697 =20
4b04266abe3ea0 Martin Kepplinger     2016-01-16  1698  	ret =3D mma8452_set=
_freefall_mode(data, false);
1a965d405fc6f6 Bijosh Thykkoottathil 2016-07-04  1699  	if (ret < 0)
d7369ae1f4d7cf Chuhong Yuan          2020-05-28  1700  		goto unregister_de=
vice;
4b04266abe3ea0 Martin Kepplinger     2016-01-16  1701 =20
c7eeea93ac60ab Peter Meerwald        2014-02-05  1702  	return 0;
c7eeea93ac60ab Peter Meerwald        2014-02-05  1703 =20
d7369ae1f4d7cf Chuhong Yuan          2020-05-28  1704  unregister_device:
d7369ae1f4d7cf Chuhong Yuan          2020-05-28  1705  	iio_device_unregist=
er(indio_dev);
d7369ae1f4d7cf Chuhong Yuan          2020-05-28  1706 =20
49ff01e1519f86 Esben Haabendal       2026-09-28  1707  runtime_suspend:
49ff01e1519f86 Esben Haabendal       2026-09-28  1708  	pm_runtime_disable(=
dev);
49ff01e1519f86 Esben Haabendal       2026-09-28  1709  	pm_runtime_set_susp=
ended(dev);
49ff01e1519f86 Esben Haabendal       2026-09-28  1710 =20
0a6726ec20cd4c Sanjay Chitroda       2026-05-05  1711  free_irq:
0a6726ec20cd4c Sanjay Chitroda       2026-05-05  1712  	if (client->irq)
0a6726ec20cd4c Sanjay Chitroda       2026-05-05  1713  		free_irq(client->i=
rq, indio_dev);
0a6726ec20cd4c Sanjay Chitroda       2026-05-05  1714 =20
c7eeea93ac60ab Peter Meerwald        2014-02-05  1715  buffer_cleanup:
c7eeea93ac60ab Peter Meerwald        2014-02-05  1716  	iio_triggered_buffe=
r_cleanup(indio_dev);
ae6d9ce05691bf Martin Fuzzey         2015-06-01  1717 =20
ae6d9ce05691bf Martin Fuzzey         2015-06-01  1718  trigger_cleanup:
ae6d9ce05691bf Martin Fuzzey         2015-06-01  1719  	mma8452_trigger_cle=
anup(indio_dev);
ae6d9ce05691bf Martin Fuzzey         2015-06-01  1720 =20
f6ff49b8a3b6f7 Anson Huang           2019-01-08  1721  disable_regulators:
37fbab78f94fce Sanjay Chitroda       2026-08-08  1722  	regulator_bulk_disa=
ble(ARRAY_SIZE(data->regs), data->regs);
f6ff49b8a3b6f7 Anson Huang           2019-01-08  1723 =20
c7eeea93ac60ab Peter Meerwald        2014-02-05  1724  	return ret;
c7eeea93ac60ab Peter Meerwald        2014-02-05  1725  }
c7eeea93ac60ab Peter Meerwald        2014-02-05  1726 =20

:::::: The code at line 1680 was first introduced by commit
:::::: 0a6726ec20cd4c0101f2de0ca485a11676224dea iio: accel: mma8452: switch=
 to non-devm request_threaded_irq()

:::::: TO: Sanjay Chitroda <sanjayembeddedse@gmail.com>
:::::: CC: Jonathan Cameron <jic23@kernel.org>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
