Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A64DC2FD7C3
	for <oe-kbuild@lists.linux.dev>; Sun, 11 Oct 2026 17:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791739342; cv=none; b=kAG82SNyqDhxOgg2/69D84DoTVUvzro1L2biQLtAIRpNI4F/LUnk3LKMwqZBiRnkIuPFPt1EqVveQujKYi/y2fyy3SLWsgTU01HbM4VLveeKY+/t9VbmlrJ7OOWU6Fi44B+Vly/Q3pMbIi69b9NMYkCCqfl9K5wYtu0EsQB6zIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791739342; c=relaxed/simple;
	bh=+gUCeMlI8hOR2ywttZn9BzzZcP7tsoZVqltsHFb2Rk0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=gsX4e5Glg0VW4VBR/04GO9aUk7n2UlBTWlapaer8SyLNfQkaCoVmtBvY8eYHONFdsb7GIpvNDjJPdbX0cmz7TpWl/6vHhC979MUtluOKcDoMsypDBdnSHo/TVMeZGhDL0jUPWKSAbFUgP0MU2PeKK3xg/VsmsmzxNVXJLSTaNJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HsnHuY65; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HsnHuY65"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791739339; x=1823275339;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=+gUCeMlI8hOR2ywttZn9BzzZcP7tsoZVqltsHFb2Rk0=;
  b=HsnHuY65ocqyw/LXBMzvFethsAx8j5c9cwtn4fmP2Z4lxLVJPki9OBmu
   /8d1xJi7mvXhj0FI5+FlJ0ELoIL76qoKritaYxwxa56ZMpHGP3QxkBFNj
   AoXNBF2Wzd/mCybSRAl1IxDfpQOekLym9zv8uigok1PuAi8F1bq4aVAHH
   4BcWHLzRgHWWZb2KDiDgOaT+4iBAGwouU7wZA+EULK68D0ryjvUcsAivH
   I7ffnR8O7emKb/f27PVNaUcMaAp1CvOZ6//MUUcjfI96grdWmSEfknzT3
   QALLqoqZQ/RufWDpMWKHcgFRtBMRV1qWk7wL7hcGFMODAj7cbIY+i8Pqh
   Q==;
X-CSE-ConnectionGUID: yYzDg/qLR9WXjlJgCjbu1Q==
X-CSE-MsgGUID: UmH89n1BSVG7j51MubZ9nQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11932"; a="486127"
X-IronPort-AV: E=Sophos;i="6.27,152,1787036400"; 
   d="scan'208";a="486127"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2026 10:22:18 -0700
X-CSE-ConnectionGUID: nqe6nJVfRcKen0j5fghLKw==
X-CSE-MsgGUID: 2JTlgbRxRC+tL29B8CrjCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,152,1787036400"; 
   d="scan'208";a="805316"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 11 Oct 2026 10:22:17 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xFxFW-000000009bT-1dYa;
	Sun, 11 Oct 2026 17:22:14 +0000
Date: Sun, 11 Oct 2026 19:21:35 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [jic23-iio:testing 25/30]
 drivers/iio/accel/mma8452.c:1680:8-28: WARNING: Threaded IRQ with no primary
 handler requested without IRQF_ONESHOT (unless it is nested IRQ)
Message-ID: <202610111910.zMG5EPVQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
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
head:   a22dc7ebb21a6bd4c8b63bc2c1dd46a24945aae7
commit: a9d3a7ceebe9d8c83702e09b284f67ebd58b8463 [25/30] iio: accel: mma845=
2: Only apply trigger type when not set by firmware
:::::: branch date: 4 hours ago
:::::: commit date: 5 hours ago
config: x86_64-randconfig-2105-20261011 (https://download.01.org/0day-ci/ar=
chive/20261011/202610111910.zMG5EPVQ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202610111910.zMG5EPVQ-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/iio/accel/mma8452.c:1680:8-28: WARNING: Threaded IRQ with no pri=
mary handler requested without IRQF_ONESHOT (unless it is nested IRQ)

vim +1680 drivers/iio/accel/mma8452.c

c3cdd6e48e35b7a Martin Kepplinger     2015-09-01  1545 =20
226d6dbac88336f Uwe Kleine-K=C3=B6nig      2022-11-18  1546  static int mma=
8452_probe(struct i2c_client *client)
c7eeea93ac60aba Peter Meerwald        2014-02-05  1547  {
32a5c04d457540a Sanjay Chitroda       2026-05-05  1548  	struct device *dev=
 =3D &client->dev;
c7eeea93ac60aba Peter Meerwald        2014-02-05  1549  	struct mma8452_dat=
a *data;
c7eeea93ac60aba Peter Meerwald        2014-02-05  1550  	struct iio_dev *in=
dio_dev;
c7eeea93ac60aba Peter Meerwald        2014-02-05  1551  	int ret;
c3cdd6e48e35b7a Martin Kepplinger     2015-09-01  1552 =20
a47a45567852ad3 Sanjay Chitroda       2026-08-08  1553  	indio_dev =3D devm=
_iio_device_alloc(dev, sizeof(*data));
c7eeea93ac60aba Peter Meerwald        2014-02-05  1554  	if (!indio_dev)
c7eeea93ac60aba Peter Meerwald        2014-02-05  1555  		return -ENOMEM;
c7eeea93ac60aba Peter Meerwald        2014-02-05  1556 =20
c7eeea93ac60aba Peter Meerwald        2014-02-05  1557  	data =3D iio_priv(=
indio_dev);
c7eeea93ac60aba Peter Meerwald        2014-02-05  1558  	data->client =3D c=
lient;
c7eeea93ac60aba Peter Meerwald        2014-02-05  1559  	mutex_init(&data->=
lock);
a47ac019e7e8129 Hans de Goede         2022-02-08  1560 =20
0f8eaeda7659d02 Biju Das              2023-08-18  1561  	data->chip_info =
=3D i2c_get_match_data(client);
0f8eaeda7659d02 Biju Das              2023-08-18  1562  	if (!data->chip_in=
fo)
a47a45567852ad3 Sanjay Chitroda       2026-08-08  1563  		return dev_err_pr=
obe(dev, -ENODEV, "unknown device model\n");
c3cdd6e48e35b7a Martin Kepplinger     2015-09-01  1564 =20
a47a45567852ad3 Sanjay Chitroda       2026-08-08  1565  	ret =3D iio_read_m=
ount_matrix(dev, &data->orientation);
b863f2e3a83f990 Hans de Goede         2022-02-08  1566  	if (ret)
b863f2e3a83f990 Hans de Goede         2022-02-08  1567  		return ret;
b863f2e3a83f990 Hans de Goede         2022-02-08  1568 =20
37fbab78f94fce1 Sanjay Chitroda       2026-08-08  1569  	data->regs[0].supp=
ly =3D "vdd";
37fbab78f94fce1 Sanjay Chitroda       2026-08-08  1570  	data->regs[1].supp=
ly =3D "vddio";
37fbab78f94fce1 Sanjay Chitroda       2026-08-08  1571  	ret =3D devm_regul=
ator_bulk_get(dev, ARRAY_SIZE(data->regs), data->regs);
32a5c04d457540a Sanjay Chitroda       2026-05-05  1572  	if (ret)
37fbab78f94fce1 Sanjay Chitroda       2026-08-08  1573  		return dev_err_pr=
obe(dev, ret, "failed to get regulators\n");
f6ff49b8a3b6f77 Anson Huang           2019-01-08  1574 =20
37fbab78f94fce1 Sanjay Chitroda       2026-08-08  1575  	ret =3D regulator_=
bulk_enable(ARRAY_SIZE(data->regs), data->regs);
37fbab78f94fce1 Sanjay Chitroda       2026-08-08  1576  	if (ret)
37fbab78f94fce1 Sanjay Chitroda       2026-08-08  1577  		return dev_err_pr=
obe(dev, ret, "failed to enable regulators\n");
f6ff49b8a3b6f77 Anson Huang           2019-01-08  1578 =20
417e008ba9db7ce Martin Kepplinger     2015-09-01  1579  	ret =3D i2c_smbus_=
read_byte_data(client, MMA8452_WHO_AM_I);
417e008ba9db7ce Martin Kepplinger     2015-09-01  1580  	if (ret < 0)
f6ff49b8a3b6f77 Anson Huang           2019-01-08  1581  		goto disable_regu=
lators;
417e008ba9db7ce Martin Kepplinger     2015-09-01  1582 =20
417e008ba9db7ce Martin Kepplinger     2015-09-01  1583  	switch (ret) {
244a93f651937a7 Martin Kepplinger     2016-01-16  1584  	case MMA8451_DEVIC=
E_ID:
417e008ba9db7ce Martin Kepplinger     2015-09-01  1585  	case MMA8452_DEVIC=
E_ID:
417e008ba9db7ce Martin Kepplinger     2015-09-01  1586  	case MMA8453_DEVIC=
E_ID:
417e008ba9db7ce Martin Kepplinger     2015-09-01  1587  	case MMA8652_DEVIC=
E_ID:
417e008ba9db7ce Martin Kepplinger     2015-09-01  1588  	case MMA8653_DEVIC=
E_ID:
e8731180fbf6fd4 Martin Kepplinger     2016-03-09  1589  	case FXLS8471_DEVI=
CE_ID:
417e008ba9db7ce Martin Kepplinger     2015-09-01  1590  		if (ret =3D=3D da=
ta->chip_info->chip_id)
417e008ba9db7ce Martin Kepplinger     2015-09-01  1591  			break;
df561f6688fef77 Gustavo A. R. Silva   2020-08-23  1592  		fallthrough;
417e008ba9db7ce Martin Kepplinger     2015-09-01  1593  	default:
f6ff49b8a3b6f77 Anson Huang           2019-01-08  1594  		ret =3D -ENODEV;
f6ff49b8a3b6f77 Anson Huang           2019-01-08  1595  		goto disable_regu=
lators;
417e008ba9db7ce Martin Kepplinger     2015-09-01  1596  	}
417e008ba9db7ce Martin Kepplinger     2015-09-01  1597 =20
a47a45567852ad3 Sanjay Chitroda       2026-08-08  1598  	dev_info(dev, "reg=
istering %s accelerometer; ID 0x%x\n",
a47ac019e7e8129 Hans de Goede         2022-02-08  1599  		 data->chip_info-=
>name, data->chip_info->chip_id);
c7eeea93ac60aba Peter Meerwald        2014-02-05  1600 =20
c7eeea93ac60aba Peter Meerwald        2014-02-05  1601  	i2c_set_clientdata=
(client, indio_dev);
c7eeea93ac60aba Peter Meerwald        2014-02-05  1602  	indio_dev->info =
=3D &mma8452_info;
a47ac019e7e8129 Hans de Goede         2022-02-08  1603  	indio_dev->name =
=3D data->chip_info->name;
c7eeea93ac60aba Peter Meerwald        2014-02-05  1604  	indio_dev->modes =
=3D INDIO_DIRECT_MODE;
c3cdd6e48e35b7a Martin Kepplinger     2015-09-01  1605  	indio_dev->channel=
s =3D data->chip_info->channels;
c3cdd6e48e35b7a Martin Kepplinger     2015-09-01  1606  	indio_dev->num_cha=
nnels =3D data->chip_info->num_channels;
c7eeea93ac60aba Peter Meerwald        2014-02-05  1607  	indio_dev->availab=
le_scan_masks =3D mma8452_scan_masks;
c7eeea93ac60aba Peter Meerwald        2014-02-05  1608 =20
ecabae71319695f Martin Fuzzey         2015-05-13  1609  	ret =3D mma8452_re=
set(client);
c7eeea93ac60aba Peter Meerwald        2014-02-05  1610  	if (ret < 0)
f6ff49b8a3b6f77 Anson Huang           2019-01-08  1611  		goto disable_regu=
lators;
c7eeea93ac60aba Peter Meerwald        2014-02-05  1612 =20
c7eeea93ac60aba Peter Meerwald        2014-02-05  1613  	data->data_cfg =3D =
MMA8452_DATA_CFG_FS_2G;
c7eeea93ac60aba Peter Meerwald        2014-02-05  1614  	ret =3D i2c_smbus_=
write_byte_data(client, MMA8452_DATA_CFG,
c7eeea93ac60aba Peter Meerwald        2014-02-05  1615  					data->data_cfg=
);
c7eeea93ac60aba Peter Meerwald        2014-02-05  1616  	if (ret < 0)
f6ff49b8a3b6f77 Anson Huang           2019-01-08  1617  		goto disable_regu=
lators;
c7eeea93ac60aba Peter Meerwald        2014-02-05  1618 =20
28e3427824ccc86 Martin Fuzzey         2015-06-01  1619  	/*
28e3427824ccc86 Martin Fuzzey         2015-06-01  1620  	 * By default set =
transient threshold to max to avoid events if
28e3427824ccc86 Martin Fuzzey         2015-06-01  1621  	 * enabling withou=
t configuring threshold.
28e3427824ccc86 Martin Fuzzey         2015-06-01  1622  	 */
28e3427824ccc86 Martin Fuzzey         2015-06-01  1623  	ret =3D i2c_smbus_=
write_byte_data(client, MMA8452_TRANSIENT_THS,
28e3427824ccc86 Martin Fuzzey         2015-06-01  1624  					MMA8452_TRANSI=
ENT_THS_MASK);
28e3427824ccc86 Martin Fuzzey         2015-06-01  1625  	if (ret < 0)
f6ff49b8a3b6f77 Anson Huang           2019-01-08  1626  		goto disable_regu=
lators;
28e3427824ccc86 Martin Fuzzey         2015-06-01  1627 =20
28e3427824ccc86 Martin Fuzzey         2015-06-01  1628  	if (client->irq) {
d2a3e0931a8f3b9 Martin Kepplinger     2015-10-15  1629  		int irq2;
28e3427824ccc86 Martin Fuzzey         2015-06-01  1630 =20
a47a45567852ad3 Sanjay Chitroda       2026-08-08  1631  		irq2 =3D fwnode_i=
rq_get_byname(dev_fwnode(dev), "INT2");
d2a3e0931a8f3b9 Martin Kepplinger     2015-10-15  1632 =20
d2a3e0931a8f3b9 Martin Kepplinger     2015-10-15  1633  		if (irq2 =3D=3D c=
lient->irq) {
a47a45567852ad3 Sanjay Chitroda       2026-08-08  1634  			dev_dbg(dev, "us=
ing interrupt line INT2\n");
d2a3e0931a8f3b9 Martin Kepplinger     2015-10-15  1635  		} else {
28e3427824ccc86 Martin Fuzzey         2015-06-01  1636  			ret =3D i2c_smbu=
s_write_byte_data(client,
28e3427824ccc86 Martin Fuzzey         2015-06-01  1637  							MMA8452_CTRL=
_REG5,
605f72de137ad92 Harinath Nampally     2017-09-09  1638  							data->chip_i=
nfo->all_events);
28e3427824ccc86 Martin Fuzzey         2015-06-01  1639  			if (ret < 0)
f6ff49b8a3b6f77 Anson Huang           2019-01-08  1640  				goto disable_re=
gulators;
28e3427824ccc86 Martin Fuzzey         2015-06-01  1641 =20
a47a45567852ad3 Sanjay Chitroda       2026-08-08  1642  			dev_dbg(dev, "us=
ing interrupt line INT1\n");
d2a3e0931a8f3b9 Martin Kepplinger     2015-10-15  1643  		}
d2a3e0931a8f3b9 Martin Kepplinger     2015-10-15  1644 =20
28e3427824ccc86 Martin Fuzzey         2015-06-01  1645  		ret =3D i2c_smbus=
_write_byte_data(client,
28e3427824ccc86 Martin Fuzzey         2015-06-01  1646  						MMA8452_CTRL_=
REG4,
605f72de137ad92 Harinath Nampally     2017-09-09  1647  						data->chip_in=
fo->enabled_events);
ae6d9ce05691bf7 Martin Fuzzey         2015-06-01  1648  		if (ret < 0)
f6ff49b8a3b6f77 Anson Huang           2019-01-08  1649  			goto disable_reg=
ulators;
ae6d9ce05691bf7 Martin Fuzzey         2015-06-01  1650 =20
ae6d9ce05691bf7 Martin Fuzzey         2015-06-01  1651  		ret =3D mma8452_t=
rigger_setup(indio_dev);
28e3427824ccc86 Martin Fuzzey         2015-06-01  1652  		if (ret < 0)
f6ff49b8a3b6f77 Anson Huang           2019-01-08  1653  			goto disable_reg=
ulators;
28e3427824ccc86 Martin Fuzzey         2015-06-01  1654  	}
28e3427824ccc86 Martin Fuzzey         2015-06-01  1655 =20
ecabae71319695f Martin Fuzzey         2015-05-13  1656  	data->ctrl_reg1 =
=3D MMA8452_CTRL_ACTIVE |
ecabae71319695f Martin Fuzzey         2015-05-13  1657  			  (MMA8452_CTRL_=
DR_DEFAULT << MMA8452_CTRL_DR_SHIFT);
a45d12388704462 Richard Tresidder     2018-05-11  1658 =20
a45d12388704462 Richard Tresidder     2018-05-11  1659  	data->sleep_val =
=3D mma8452_calculate_sleep(data);
a45d12388704462 Richard Tresidder     2018-05-11  1660 =20
ecabae71319695f Martin Fuzzey         2015-05-13  1661  	ret =3D i2c_smbus_=
write_byte_data(client, MMA8452_CTRL_REG1,
ecabae71319695f Martin Fuzzey         2015-05-13  1662  					data->ctrl_reg=
1);
ecabae71319695f Martin Fuzzey         2015-05-13  1663  	if (ret < 0)
ae6d9ce05691bf7 Martin Fuzzey         2015-06-01  1664  		goto trigger_clea=
nup;
ecabae71319695f Martin Fuzzey         2015-05-13  1665 =20
c7eeea93ac60aba Peter Meerwald        2014-02-05  1666  	ret =3D iio_trigge=
red_buffer_setup(indio_dev, NULL,
c7eeea93ac60aba Peter Meerwald        2014-02-05  1667  					 mma8452_trigg=
er_handler, NULL);
c7eeea93ac60aba Peter Meerwald        2014-02-05  1668  	if (ret < 0)
ae6d9ce05691bf7 Martin Fuzzey         2015-06-01  1669  		goto trigger_clea=
nup;
c7eeea93ac60aba Peter Meerwald        2014-02-05  1670 =20
28e3427824ccc86 Martin Fuzzey         2015-06-01  1671  	if (client->irq) {
a9d3a7ceebe9d8c Esben Haabendal       2026-09-28  1672  		unsigned long irq=
_flags;
a9d3a7ceebe9d8c Esben Haabendal       2026-09-28  1673 =20
a9d3a7ceebe9d8c Esben Haabendal       2026-09-28  1674  		irq_flags =3D irq=
_get_trigger_type(client->irq);
a9d3a7ceebe9d8c Esben Haabendal       2026-09-28  1675  		if (irq_flags =3D=
=3D IRQ_TYPE_NONE) {
a9d3a7ceebe9d8c Esben Haabendal       2026-09-28  1676  			dev_info(dev, "i=
nvalid irq type, setting default active low\n");
a9d3a7ceebe9d8c Esben Haabendal       2026-09-28  1677  			irq_flags =3D IR=
QF_TRIGGER_LOW;
a9d3a7ceebe9d8c Esben Haabendal       2026-09-28  1678  		}
a9d3a7ceebe9d8c Esben Haabendal       2026-09-28  1679  		irq_flags |=3D IR=
QF_ONESHOT;
0a6726ec20cd4c0 Sanjay Chitroda       2026-05-05 @1680  		ret =3D request_t=
hreaded_irq(client->irq, NULL, mma8452_interrupt,
a9d3a7ceebe9d8c Esben Haabendal       2026-09-28  1681  					   irq_flags, =
client->name, indio_dev);
28e3427824ccc86 Martin Fuzzey         2015-06-01  1682  		if (ret)
28e3427824ccc86 Martin Fuzzey         2015-06-01  1683  			goto buffer_clea=
nup;
28e3427824ccc86 Martin Fuzzey         2015-06-01  1684  	}
28e3427824ccc86 Martin Fuzzey         2015-06-01  1685 =20
a47a45567852ad3 Sanjay Chitroda       2026-08-08  1686  	ret =3D pm_runtime=
_set_active(dev);
96c0cb2bbfe0a58 Martin Kepplinger     2016-03-03  1687  	if (ret < 0)
0a6726ec20cd4c0 Sanjay Chitroda       2026-05-05  1688  		goto free_irq;
96c0cb2bbfe0a58 Martin Kepplinger     2016-03-03  1689 =20
a47a45567852ad3 Sanjay Chitroda       2026-08-08  1690  	pm_runtime_enable(=
dev);
a47a45567852ad3 Sanjay Chitroda       2026-08-08  1691  	pm_runtime_set_aut=
osuspend_delay(dev, MMA8452_AUTO_SUSPEND_DELAY_MS);
a47a45567852ad3 Sanjay Chitroda       2026-08-08  1692  	pm_runtime_use_aut=
osuspend(dev);
96c0cb2bbfe0a58 Martin Kepplinger     2016-03-03  1693 =20
c7eeea93ac60aba Peter Meerwald        2014-02-05  1694  	ret =3D iio_device=
_register(indio_dev);
c7eeea93ac60aba Peter Meerwald        2014-02-05  1695  	if (ret < 0)
5fc9b63208a3a4a Esben Haabendal       2026-09-28  1696  		goto runtime_susp=
end;
28e3427824ccc86 Martin Fuzzey         2015-06-01  1697 =20
4b04266abe3ea0c Martin Kepplinger     2016-01-16  1698  	ret =3D mma8452_se=
t_freefall_mode(data, false);
1a965d405fc6f6b Bijosh Thykkoottathil 2016-07-04  1699  	if (ret < 0)
d7369ae1f4d7cff Chuhong Yuan          2020-05-28  1700  		goto unregister_d=
evice;
4b04266abe3ea0c Martin Kepplinger     2016-01-16  1701 =20
c7eeea93ac60aba Peter Meerwald        2014-02-05  1702  	return 0;
c7eeea93ac60aba Peter Meerwald        2014-02-05  1703 =20
d7369ae1f4d7cff Chuhong Yuan          2020-05-28  1704  unregister_device:
d7369ae1f4d7cff Chuhong Yuan          2020-05-28  1705  	iio_device_unregis=
ter(indio_dev);
d7369ae1f4d7cff Chuhong Yuan          2020-05-28  1706 =20
5fc9b63208a3a4a Esben Haabendal       2026-09-28  1707  runtime_suspend:
5fc9b63208a3a4a Esben Haabendal       2026-09-28  1708  	pm_runtime_disable=
(dev);
5fc9b63208a3a4a Esben Haabendal       2026-09-28  1709  	pm_runtime_set_sus=
pended(dev);
5fc9b63208a3a4a Esben Haabendal       2026-09-28  1710 =20
0a6726ec20cd4c0 Sanjay Chitroda       2026-05-05  1711  free_irq:
0a6726ec20cd4c0 Sanjay Chitroda       2026-05-05  1712  	if (client->irq)
0a6726ec20cd4c0 Sanjay Chitroda       2026-05-05  1713  		free_irq(client->=
irq, indio_dev);
0a6726ec20cd4c0 Sanjay Chitroda       2026-05-05  1714 =20
c7eeea93ac60aba Peter Meerwald        2014-02-05  1715  buffer_cleanup:
c7eeea93ac60aba Peter Meerwald        2014-02-05  1716  	iio_triggered_buff=
er_cleanup(indio_dev);
ae6d9ce05691bf7 Martin Fuzzey         2015-06-01  1717 =20
ae6d9ce05691bf7 Martin Fuzzey         2015-06-01  1718  trigger_cleanup:
ae6d9ce05691bf7 Martin Fuzzey         2015-06-01  1719  	mma8452_trigger_cl=
eanup(indio_dev);
ae6d9ce05691bf7 Martin Fuzzey         2015-06-01  1720 =20
f6ff49b8a3b6f77 Anson Huang           2019-01-08  1721  disable_regulators:
37fbab78f94fce1 Sanjay Chitroda       2026-08-08  1722  	regulator_bulk_dis=
able(ARRAY_SIZE(data->regs), data->regs);
f6ff49b8a3b6f77 Anson Huang           2019-01-08  1723 =20
c7eeea93ac60aba Peter Meerwald        2014-02-05  1724  	return ret;
c7eeea93ac60aba Peter Meerwald        2014-02-05  1725  }
c7eeea93ac60aba Peter Meerwald        2014-02-05  1726 =20

:::::: The code at line 1680 was first introduced by commit
:::::: 0a6726ec20cd4c0101f2de0ca485a11676224dea iio: accel: mma8452: switch=
 to non-devm request_threaded_irq()

:::::: TO: Sanjay Chitroda <sanjayembeddedse@gmail.com>
:::::: CC: Jonathan Cameron <jic23@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
