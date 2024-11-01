Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EDAB10F4
	for <oe-kbuild@lists.linux.dev>; Fri,  1 Nov 2024 00:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730420046; cv=none; b=S6Fg1vfP2vZJEvUYD5l6yiG0LLLheAGtnV50/8zQRizBQEXf/dbP2/O2zYgoVuAwdtXEfBJak09o79Bol+npU/lHAgWHeAkNyF+c+bKJAPUO1Ps8o1nrvT/dtdlIRo0teF+EG6dsubRZ02uO4v8BmGfXkmN6KEA9V6pmoV8AMX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730420046; c=relaxed/simple;
	bh=+AIO643kzSJ6CZrwb7hkH7SeOvCfJn2Wq3HAOHSs4l8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=H1/fWjB+eiVmWEB+cVptAaT5dmgCDG1dSIGiTYuCf9YsNIub+GtfUiTKenqXHsxZ2d/4H+pBfIK8egp0OGxzBdJe8hj5sEPLH4X0bSco90ZcMwqVB7q4ErKxqJ0oLqjnyIMqqXuODqbqRAEUw2dGHgmTDDi5g+9lQCLb7QgOn/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CXEuDPoO; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CXEuDPoO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730420040; x=1761956040;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=+AIO643kzSJ6CZrwb7hkH7SeOvCfJn2Wq3HAOHSs4l8=;
  b=CXEuDPoOxMSWVTLfRI0UmbUxnSQCmG0hE7otJMrpyPwt/Yhn/rDFwtfC
   ocp2dcCLEykXMQ0lkLO90Pma6BWWK9d6r2DtgAJPvx94KORMrMQZlXnUf
   S7VsPuTLOsQ8RjHqpZZsGNW6p/nlwMfAd4PdcjSNnv3ppxoDZtU5NhAcJ
   9Mk8ZpeZizN36wdl4cSGHJR2CtRiLN9yHZJrn7rHUOX8qgeuNdolY5WDG
   03YFp8BSSmSmHJKMzwJ3a0GX1Y2ZPOg8m/KFei8lKK8VlkHVZscFpQQkL
   gWJKSt1wOOlIj9fxRYcIsqUxCgMBGYnNrMd9Tx3+WcbzTGGvv2tfE7yRR
   w==;
X-CSE-ConnectionGUID: I9fAeWHMT++0kPsZ2n27Lg==
X-CSE-MsgGUID: YlAD7qzzTDydPl1U2CM3/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11242"; a="30400978"
X-IronPort-AV: E=Sophos;i="6.11,248,1725346800"; 
   d="scan'208";a="30400978"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 17:13:53 -0700
X-CSE-ConnectionGUID: pQUwaR4hSi2NpHLQ5gL5LQ==
X-CSE-MsgGUID: W9Rv4HUqQKSVhHaN2lTb5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,248,1725346800"; 
   d="scan'208";a="82920035"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 31 Oct 2024 17:13:51 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6fIT-000gra-1G;
	Fri, 01 Nov 2024 00:13:49 +0000
Date: Fri, 1 Nov 2024 08:13:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v1 2/4] iio: accel: kxcjk-1013: Drop duplicate NULL check
 in kxcjk1013_probe()
Message-ID: <202411010750.Uc3KuV6p-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20241030160756.2099326-3-andriy.shevchenko@linux.intel.com>
References: <20241030160756.2099326-3-andriy.shevchenko@linux.intel.com>
TO: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
TO: Jonathan Cameron <Jonathan.Cameron@huawei.com>
TO: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
TO: Hans de Goede <hdegoede@redhat.com>
TO: linux-iio@vger.kernel.org
TO: linux-kernel@vger.kernel.org
CC: "Lars-Peter Clausen" <lars@metafoo.de>

Hi Andy,

kernel test robot noticed the following build warnings:

[auto build test WARNING on jic23-iio/togreg]
[also build test WARNING on next-20241031]
[cannot apply to linus/master v6.12-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/iio-acpi-Fill-data-with-NULL-when-iio_get_acpi_device_name_and_data-fails/20241031-001052
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
patch link:    https://lore.kernel.org/r/20241030160756.2099326-3-andriy.shevchenko%40linux.intel.com
patch subject: [PATCH v1 2/4] iio: accel: kxcjk-1013: Drop duplicate NULL check in kxcjk1013_probe()
:::::: branch date: 32 hours ago
:::::: commit date: 32 hours ago
config: parisc-randconfig-r071-20241101 (https://download.01.org/0day-ci/archive/20241101/202411010750.Uc3KuV6p-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411010750.Uc3KuV6p-lkp@intel.com/

smatch warnings:
drivers/iio/accel/kxcjk-1013.c:1510 kxcjk1013_probe() error: uninitialized symbol 'ddata'.

vim +/ddata +1510 drivers/iio/accel/kxcjk-1013.c

b4b491c0832ef9 Srinivas Pandruvada 2014-08-22  1457  
09cec0835243b1 Uwe Kleine-König    2022-11-18  1458  static int kxcjk1013_probe(struct i2c_client *client)
1a4fbf6a9286a6 Srinivas Pandruvada 2014-11-06  1459  {
09cec0835243b1 Uwe Kleine-König    2022-11-18  1460  	const struct i2c_device_id *id = i2c_client_get_device_id(client);
1fa4ff1f249983 Jonathan Cameron    2022-10-16  1461  	static const char * const regulator_names[] = { "vdd", "vddio" };
1a4fbf6a9286a6 Srinivas Pandruvada 2014-11-06  1462  	struct kxcjk1013_data *data;
1a4fbf6a9286a6 Srinivas Pandruvada 2014-11-06  1463  	struct iio_dev *indio_dev;
1a4fbf6a9286a6 Srinivas Pandruvada 2014-11-06  1464  	struct kxcjk_1013_platform_data *pdata;
4b040217281ee2 Andy Shevchenko     2024-10-24  1465  	const void *ddata;
c68613777517e5 Daniel Baluta       2014-03-09  1466  	const char *name;
1a4fbf6a9286a6 Srinivas Pandruvada 2014-11-06  1467  	int ret;
1a4fbf6a9286a6 Srinivas Pandruvada 2014-11-06  1468  
1a4fbf6a9286a6 Srinivas Pandruvada 2014-11-06  1469  	indio_dev = devm_iio_device_alloc(&client->dev, sizeof(*data));
1a4fbf6a9286a6 Srinivas Pandruvada 2014-11-06  1470  	if (!indio_dev)
1a4fbf6a9286a6 Srinivas Pandruvada 2014-11-06  1471  		return -ENOMEM;
1a4fbf6a9286a6 Srinivas Pandruvada 2014-11-06  1472  
1a4fbf6a9286a6 Srinivas Pandruvada 2014-11-06  1473  	data = iio_priv(indio_dev);
1a4fbf6a9286a6 Srinivas Pandruvada 2014-11-06  1474  	i2c_set_clientdata(client, indio_dev);
1a4fbf6a9286a6 Srinivas Pandruvada 2014-11-06  1475  	data->client = client;
1a4fbf6a9286a6 Srinivas Pandruvada 2014-11-06  1476  
1a4fbf6a9286a6 Srinivas Pandruvada 2014-11-06  1477  	pdata = dev_get_platdata(&client->dev);
1bde330ca0e817 Dmitry Osipenko     2020-01-12  1478  	if (pdata) {
1a4fbf6a9286a6 Srinivas Pandruvada 2014-11-06  1479  		data->active_high_intr = pdata->active_high_intr;
1bde330ca0e817 Dmitry Osipenko     2020-01-12  1480  		data->orientation = pdata->orientation;
1bde330ca0e817 Dmitry Osipenko     2020-01-12  1481  	} else {
1a4fbf6a9286a6 Srinivas Pandruvada 2014-11-06  1482  		data->active_high_intr = true; /* default polarity */
1a4fbf6a9286a6 Srinivas Pandruvada 2014-11-06  1483  
e074cc3080d507 Hans de Goede       2024-04-25  1484  		if (!iio_read_acpi_mount_matrix(&client->dev, &data->orientation, "ROTM")) {
b892770a2c553f Andy Shevchenko     2021-05-18  1485  			ret = iio_read_mount_matrix(&client->dev, &data->orientation);
1bde330ca0e817 Dmitry Osipenko     2020-01-12  1486  			if (ret)
1bde330ca0e817 Dmitry Osipenko     2020-01-12  1487  				return ret;
1bde330ca0e817 Dmitry Osipenko     2020-01-12  1488  		}
1bde330ca0e817 Dmitry Osipenko     2020-01-12  1489  
3b4ebff2a1a9e8 Sean Rhodes         2024-02-18  1490  	}
3b4ebff2a1a9e8 Sean Rhodes         2024-02-18  1491  
1fa4ff1f249983 Jonathan Cameron    2022-10-16  1492  	ret = devm_regulator_bulk_get_enable(&client->dev,
1fa4ff1f249983 Jonathan Cameron    2022-10-16  1493  					     ARRAY_SIZE(regulator_names),
1fa4ff1f249983 Jonathan Cameron    2022-10-16  1494  					     regulator_names);
1d2e91a2db664f Devajith V S        2020-12-13  1495  	if (ret)
1d2e91a2db664f Devajith V S        2020-12-13  1496  		return dev_err_probe(&client->dev, ret, "Failed to get regulators\n");
1d2e91a2db664f Devajith V S        2020-12-13  1497  
1d2e91a2db664f Devajith V S        2020-12-13  1498  	/*
1d2e91a2db664f Devajith V S        2020-12-13  1499  	 * A typical delay of 10ms is required for powering up
1d2e91a2db664f Devajith V S        2020-12-13  1500  	 * according to the data sheets of supported chips.
1d2e91a2db664f Devajith V S        2020-12-13  1501  	 * Hence double that to play safe.
1d2e91a2db664f Devajith V S        2020-12-13  1502  	 */
1d2e91a2db664f Devajith V S        2020-12-13  1503  	msleep(20);
1d2e91a2db664f Devajith V S        2020-12-13  1504  
c68613777517e5 Daniel Baluta       2014-03-09  1505  	if (id) {
c68613777517e5 Daniel Baluta       2014-03-09  1506  		name = id->name;
4861883cf0a72a Andy Shevchenko     2024-10-24  1507  		data->info = (const struct kx_chipset_info *)(id->driver_data);
4b040217281ee2 Andy Shevchenko     2024-10-24  1508  	} else {
4b040217281ee2 Andy Shevchenko     2024-10-24  1509  		name = iio_get_acpi_device_name_and_data(&client->dev, &ddata);
4b040217281ee2 Andy Shevchenko     2024-10-24 @1510  		data->info = ddata;
4b040217281ee2 Andy Shevchenko     2024-10-24  1511  		if (data->info == &kxcj91008_kiox010a_info)
4b040217281ee2 Andy Shevchenko     2024-10-24  1512  			indio_dev->label = "accel-display";
4b040217281ee2 Andy Shevchenko     2024-10-24  1513  		else if (data->info == &kxcj91008_kiox020a_info)
4b040217281ee2 Andy Shevchenko     2024-10-24  1514  			indio_dev->label = "accel-base";
4b040217281ee2 Andy Shevchenko     2024-10-24  1515  	}
4b040217281ee2 Andy Shevchenko     2024-10-24  1516  	if (!name)
c68613777517e5 Daniel Baluta       2014-03-09  1517  		return -ENODEV;
c68613777517e5 Daniel Baluta       2014-03-09  1518  
1a4fbf6a9286a6 Srinivas Pandruvada 2014-11-06  1519  	ret = kxcjk1013_chip_init(data);
1a4fbf6a9286a6 Srinivas Pandruvada 2014-11-06  1520  	if (ret < 0)
1a4fbf6a9286a6 Srinivas Pandruvada 2014-11-06  1521  		return ret;
1a4fbf6a9286a6 Srinivas Pandruvada 2014-11-06  1522  
1a4fbf6a9286a6 Srinivas Pandruvada 2014-11-06  1523  	mutex_init(&data->mutex);
1a4fbf6a9286a6 Srinivas Pandruvada 2014-11-06  1524  
1a4fbf6a9286a6 Srinivas Pandruvada 2014-11-06  1525  	indio_dev->channels = kxcjk1013_channels;
1a4fbf6a9286a6 Srinivas Pandruvada 2014-11-06  1526  	indio_dev->num_channels = ARRAY_SIZE(kxcjk1013_channels);
09cf1b321ad353 Adriana Reus        2016-03-24  1527  	indio_dev->available_scan_masks = kxcjk1013_scan_masks;
c68613777517e5 Daniel Baluta       2014-03-09  1528  	indio_dev->name = name;
1a4fbf6a9286a6 Srinivas Pandruvada 2014-11-06  1529  	indio_dev->modes = INDIO_DIRECT_MODE;
ef4b042d202200 Andy Shevchenko     2024-10-24  1530  	indio_dev->info = &kxcjk1013_iio_info;
1a4fbf6a9286a6 Srinivas Pandruvada 2014-11-06  1531  
4861883cf0a72a Andy Shevchenko     2024-10-24  1532  	if (client->irq > 0 && data->info->acpi_type != ACPI_SMO8500) {
b4b491c0832ef9 Srinivas Pandruvada 2014-08-22  1533  		ret = devm_request_threaded_irq(&client->dev, client->irq,
b4b491c0832ef9 Srinivas Pandruvada 2014-08-22  1534  						kxcjk1013_data_rdy_trig_poll,
b4b491c0832ef9 Srinivas Pandruvada 2014-08-22  1535  						kxcjk1013_event_handler,
b4b491c0832ef9 Srinivas Pandruvada 2014-08-22  1536  						IRQF_TRIGGER_RISING,
b4b491c0832ef9 Srinivas Pandruvada 2014-08-22  1537  						KXCJK1013_IRQ_NAME,
b4b491c0832ef9 Srinivas Pandruvada 2014-08-22  1538  						indio_dev);
b4b491c0832ef9 Srinivas Pandruvada 2014-08-22  1539  		if (ret)
9d02daf738bf01 Irina Tirdea        2014-12-10  1540  			goto err_poweroff;
b4b491c0832ef9 Srinivas Pandruvada 2014-08-22  1541  
b4b491c0832ef9 Srinivas Pandruvada 2014-08-22  1542  		data->dready_trig = devm_iio_trigger_alloc(&client->dev,
b4b491c0832ef9 Srinivas Pandruvada 2014-08-22  1543  							   "%s-dev%d",
b4b491c0832ef9 Srinivas Pandruvada 2014-08-22  1544  							   indio_dev->name,
15ea2878bfb255 Jonathan Cameron    2021-04-26  1545  							   iio_device_id(indio_dev));
9d02daf738bf01 Irina Tirdea        2014-12-10  1546  		if (!data->dready_trig) {
9d02daf738bf01 Irina Tirdea        2014-12-10  1547  			ret = -ENOMEM;
9d02daf738bf01 Irina Tirdea        2014-12-10  1548  			goto err_poweroff;
9d02daf738bf01 Irina Tirdea        2014-12-10  1549  		}
1a4fbf6a9286a6 Srinivas Pandruvada 2014-11-06  1550  
b4b491c0832ef9 Srinivas Pandruvada 2014-08-22  1551  		data->motion_trig = devm_iio_trigger_alloc(&client->dev,
b4b491c0832ef9 Srinivas Pandruvada 2014-08-22  1552  							  "%s-any-motion-dev%d",
b4b491c0832ef9 Srinivas Pandruvada 2014-08-22  1553  							  indio_dev->name,
15ea2878bfb255 Jonathan Cameron    2021-04-26  1554  							  iio_device_id(indio_dev));
9d02daf738bf01 Irina Tirdea        2014-12-10  1555  		if (!data->motion_trig) {
9d02daf738bf01 Irina Tirdea        2014-12-10  1556  			ret = -ENOMEM;
9d02daf738bf01 Irina Tirdea        2014-12-10  1557  			goto err_poweroff;
9d02daf738bf01 Irina Tirdea        2014-12-10  1558  		}
1a4fbf6a9286a6 Srinivas Pandruvada 2014-11-06  1559  
b4b491c0832ef9 Srinivas Pandruvada 2014-08-22  1560  		data->dready_trig->ops = &kxcjk1013_trigger_ops;
b4b491c0832ef9 Srinivas Pandruvada 2014-08-22  1561  		iio_trigger_set_drvdata(data->dready_trig, indio_dev);
b4b491c0832ef9 Srinivas Pandruvada 2014-08-22  1562  		ret = iio_trigger_register(data->dready_trig);
1a4fbf6a9286a6 Srinivas Pandruvada 2014-11-06  1563  		if (ret)
9d02daf738bf01 Irina Tirdea        2014-12-10  1564  			goto err_poweroff;
b4b491c0832ef9 Srinivas Pandruvada 2014-08-22  1565  
ed302925d708f2 Dmitry Rokosov      2022-05-24  1566  		indio_dev->trig = iio_trigger_get(data->dready_trig);
ed302925d708f2 Dmitry Rokosov      2022-05-24  1567  
b4b491c0832ef9 Srinivas Pandruvada 2014-08-22  1568  		data->motion_trig->ops = &kxcjk1013_trigger_ops;
b4b491c0832ef9 Srinivas Pandruvada 2014-08-22  1569  		iio_trigger_set_drvdata(data->motion_trig, indio_dev);
b4b491c0832ef9 Srinivas Pandruvada 2014-08-22  1570  		ret = iio_trigger_register(data->motion_trig);
b4b491c0832ef9 Srinivas Pandruvada 2014-08-22  1571  		if (ret) {
b4b491c0832ef9 Srinivas Pandruvada 2014-08-22  1572  			data->motion_trig = NULL;
b4b491c0832ef9 Srinivas Pandruvada 2014-08-22  1573  			goto err_trigger_unregister;
b4b491c0832ef9 Srinivas Pandruvada 2014-08-22  1574  		}
a25691c1f96740 Vlad Dogaru         2015-04-03  1575  	}
1a4fbf6a9286a6 Srinivas Pandruvada 2014-11-06  1576  
1a4fbf6a9286a6 Srinivas Pandruvada 2014-11-06  1577  	ret = iio_triggered_buffer_setup(indio_dev,
1a4fbf6a9286a6 Srinivas Pandruvada 2014-11-06  1578  					 &iio_pollfunc_store_time,
1a4fbf6a9286a6 Srinivas Pandruvada 2014-11-06  1579  					 kxcjk1013_trigger_handler,
a25691c1f96740 Vlad Dogaru         2015-04-03  1580  					 &kxcjk1013_buffer_setup_ops);
1a4fbf6a9286a6 Srinivas Pandruvada 2014-11-06  1581  	if (ret < 0) {
a25691c1f96740 Vlad Dogaru         2015-04-03  1582  		dev_err(&client->dev, "iio triggered buffer setup failed\n");
1a4fbf6a9286a6 Srinivas Pandruvada 2014-11-06  1583  		goto err_trigger_unregister;
1a4fbf6a9286a6 Srinivas Pandruvada 2014-11-06  1584  	}
1a4fbf6a9286a6 Srinivas Pandruvada 2014-11-06  1585  
124e1b1d0924ca Srinivas Pandruvada 2014-05-08  1586  	ret = pm_runtime_set_active(&client->dev);
124e1b1d0924ca Srinivas Pandruvada 2014-05-08  1587  	if (ret)
7d0ead5c3f00a0 Adriana Reus        2015-11-05  1588  		goto err_buffer_cleanup;
124e1b1d0924ca Srinivas Pandruvada 2014-05-08  1589  
124e1b1d0924ca Srinivas Pandruvada 2014-05-08  1590  	pm_runtime_enable(&client->dev);
124e1b1d0924ca Srinivas Pandruvada 2014-05-08  1591  	pm_runtime_set_autosuspend_delay(&client->dev,
124e1b1d0924ca Srinivas Pandruvada 2014-05-08  1592  					 KXCJK1013_SLEEP_DELAY_MS);
124e1b1d0924ca Srinivas Pandruvada 2014-05-08  1593  	pm_runtime_use_autosuspend(&client->dev);
124e1b1d0924ca Srinivas Pandruvada 2014-05-08  1594  
7d0ead5c3f00a0 Adriana Reus        2015-11-05  1595  	ret = iio_device_register(indio_dev);
7d0ead5c3f00a0 Adriana Reus        2015-11-05  1596  	if (ret < 0) {
7d0ead5c3f00a0 Adriana Reus        2015-11-05  1597  		dev_err(&client->dev, "unable to register iio device\n");
632fe0bb8c5b9c Miaoqian Lin        2022-01-06  1598  		goto err_pm_cleanup;
7d0ead5c3f00a0 Adriana Reus        2015-11-05  1599  	}
7d0ead5c3f00a0 Adriana Reus        2015-11-05  1600  
1a4fbf6a9286a6 Srinivas Pandruvada 2014-11-06  1601  	return 0;
1a4fbf6a9286a6 Srinivas Pandruvada 2014-11-06  1602  
632fe0bb8c5b9c Miaoqian Lin        2022-01-06  1603  err_pm_cleanup:
632fe0bb8c5b9c Miaoqian Lin        2022-01-06  1604  	pm_runtime_dont_use_autosuspend(&client->dev);
632fe0bb8c5b9c Miaoqian Lin        2022-01-06  1605  	pm_runtime_disable(&client->dev);
1a4fbf6a9286a6 Srinivas Pandruvada 2014-11-06  1606  err_buffer_cleanup:
1a4fbf6a9286a6 Srinivas Pandruvada 2014-11-06  1607  	iio_triggered_buffer_cleanup(indio_dev);
1a4fbf6a9286a6 Srinivas Pandruvada 2014-11-06  1608  err_trigger_unregister:
b4b491c0832ef9 Srinivas Pandruvada 2014-08-22  1609  	if (data->dready_trig)
b4b491c0832ef9 Srinivas Pandruvada 2014-08-22  1610  		iio_trigger_unregister(data->dready_trig);
b4b491c0832ef9 Srinivas Pandruvada 2014-08-22  1611  	if (data->motion_trig)
b4b491c0832ef9 Srinivas Pandruvada 2014-08-22  1612  		iio_trigger_unregister(data->motion_trig);
9d02daf738bf01 Irina Tirdea        2014-12-10  1613  err_poweroff:
9d02daf738bf01 Irina Tirdea        2014-12-10  1614  	kxcjk1013_set_mode(data, STANDBY);
1a4fbf6a9286a6 Srinivas Pandruvada 2014-11-06  1615  
1a4fbf6a9286a6 Srinivas Pandruvada 2014-11-06  1616  	return ret;
1a4fbf6a9286a6 Srinivas Pandruvada 2014-11-06  1617  }
1a4fbf6a9286a6 Srinivas Pandruvada 2014-11-06  1618  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
