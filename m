Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93739749C
	for <oe-kbuild@lists.linux.dev>; Fri, 27 Sep 2024 05:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727416261; cv=none; b=QfbYinM7xv0PjrglfN7O2RSP0DmiRDx2e2cpSBuyr49F6RjEmprDt1A43LZ3BGPWBpfAyOEKjOrR0Wkv9LJuUlV/BzsK9FxfVqcVsr1QbWWqUcgXmGypTlGhRRw0IYJaaWUGuOudtYdsi8JXGi8EfdnOjW4D9E7gumSINR0wrFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727416261; c=relaxed/simple;
	bh=UOf0DncmTbveepfbIEBRNZuJbQinJ0nYH2Z/RQrLNAk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lufPKLGb9VlgLcOasxmo+g2KtJYRfqO9UvH6jVBJ5y0Lv2i1b4BXpvofCu6tbm3fvIcUi8s2NIuypeKz1SNrCQg21msLOwKu78j9MHQH9GI2ZdhIAT1YcG/wJ1newVm3FGQW9ocG2MQKoFHGGGF7V5L7tQRFfXlOXMyajg4wsfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X0/f5jVc; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X0/f5jVc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727416260; x=1758952260;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UOf0DncmTbveepfbIEBRNZuJbQinJ0nYH2Z/RQrLNAk=;
  b=X0/f5jVcAIRfjKQjjhR2OxY605KxNBR27201qX+MYCrADJ+r/5mggLiB
   c+taVEMheIoxTi3usYQvVakam2blmMc87xjI1Sv4GlR0cBu0G7YPXGMqP
   TLwoCchFhIusHfu/I0tis+2crA0/AVtO/wXd/c8AA2oBvcnpW70FtNvIZ
   pAQ63lkl1qgWPCVvh6MzkLtKGHDdPsfVM5QZoWSz3In+ONvSxglyr6DS9
   0AO7yAneoVA6l+0fnb8lj+TJlmnIkqSH00m8o8npVgaXw2RETQ37KtBv3
   eoD+1IXauv4nOsd0GYZLcXtpr8tmqF0AtelGZO3a/1kfaiQxLxnfRz3EU
   A==;
X-CSE-ConnectionGUID: HkV1Vz1kQIOC+T3Ub6xC4A==
X-CSE-MsgGUID: obVvNv+nRHe0odnVpopkCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="26684948"
X-IronPort-AV: E=Sophos;i="6.11,157,1725346800"; 
   d="scan'208";a="26684948"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2024 22:50:59 -0700
X-CSE-ConnectionGUID: lGtKDubmQBmXbk/d+Ux60g==
X-CSE-MsgGUID: /yfNgF/2Q0ygq4iOTRN0Jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,157,1725346800"; 
   d="scan'208";a="103235120"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 26 Sep 2024 22:50:57 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1su3sV-000LXF-17;
	Fri, 27 Sep 2024 05:50:55 +0000
Date: Fri, 27 Sep 2024 13:49:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [RFC PATCH] cleanup: make scoped_guard() to be return-friendly
Message-ID: <202409271312.hshEAZox-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20240926134347.19371-1-przemyslaw.kitszel@intel.com>
References: <20240926134347.19371-1-przemyslaw.kitszel@intel.com>
TO: Przemek Kitszel <przemyslaw.kitszel@intel.com>

Hi Przemek,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 151ac45348afc5b56baa584c7cd4876addf461ff]

url:    https://github.com/intel-lab-lkp/linux/commits/Przemek-Kitszel/cleanup-make-scoped_guard-to-be-return-friendly/20240926-214521
base:   151ac45348afc5b56baa584c7cd4876addf461ff
patch link:    https://lore.kernel.org/r/20240926134347.19371-1-przemyslaw.kitszel%40intel.com
patch subject: [RFC PATCH] cleanup: make scoped_guard() to be return-friendly
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: i386-randconfig-141-20240927 (https://download.01.org/0day-ci/archive/20240927/202409271312.hshEAZox-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409271312.hshEAZox-lkp@intel.com/

smatch warnings:
drivers/iio/imu/adis16480.c:1341 adis16480_trigger_handler() warn: iterator 'i' not incremented

vim +/i +1341 drivers/iio/imu/adis16480.c

941f130881fa90 Nuno Sa           2021-04-22  1333  
941f130881fa90 Nuno Sa           2021-04-22  1334  static irqreturn_t adis16480_trigger_handler(int irq, void *p)
941f130881fa90 Nuno Sa           2021-04-22  1335  {
941f130881fa90 Nuno Sa           2021-04-22  1336  	struct iio_poll_func *pf = p;
941f130881fa90 Nuno Sa           2021-04-22  1337  	struct iio_dev *indio_dev = pf->indio_dev;
941f130881fa90 Nuno Sa           2021-04-22  1338  	struct adis16480 *st = iio_priv(indio_dev);
941f130881fa90 Nuno Sa           2021-04-22  1339  	struct adis *adis = &st->adis;
79f4dc9dec0e0b Andy Shevchenko   2022-04-14  1340  	struct device *dev = &adis->spi->dev;
85b2aeaa2f4cb4 Ramona Gradinariu 2024-05-28 @1341  	int ret, bit, offset, i = 0, buff_offset = 0;
941f130881fa90 Nuno Sa           2021-04-22  1342  	__be16 *buffer;
941f130881fa90 Nuno Sa           2021-04-22  1343  	u32 crc;
941f130881fa90 Nuno Sa           2021-04-22  1344  	bool valid;
941f130881fa90 Nuno Sa           2021-04-22  1345  
d6a60d76173d47 Nuno Sa           2024-06-18  1346  	adis_dev_auto_scoped_lock(adis) {
941f130881fa90 Nuno Sa           2021-04-22  1347  		if (adis->current_page != 0) {
941f130881fa90 Nuno Sa           2021-04-22  1348  			adis->tx[0] = ADIS_WRITE_REG(ADIS_REG_PAGE_ID);
941f130881fa90 Nuno Sa           2021-04-22  1349  			adis->tx[1] = 0;
941f130881fa90 Nuno Sa           2021-04-22  1350  			ret = spi_write(adis->spi, adis->tx, 2);
941f130881fa90 Nuno Sa           2021-04-22  1351  			if (ret) {
79f4dc9dec0e0b Andy Shevchenko   2022-04-14  1352  				dev_err(dev, "Failed to change device page: %d\n", ret);
941f130881fa90 Nuno Sa           2021-04-22  1353  				goto irq_done;
941f130881fa90 Nuno Sa           2021-04-22  1354  			}
941f130881fa90 Nuno Sa           2021-04-22  1355  
941f130881fa90 Nuno Sa           2021-04-22  1356  			adis->current_page = 0;
941f130881fa90 Nuno Sa           2021-04-22  1357  		}
941f130881fa90 Nuno Sa           2021-04-22  1358  
941f130881fa90 Nuno Sa           2021-04-22  1359  		ret = spi_sync(adis->spi, &adis->msg);
941f130881fa90 Nuno Sa           2021-04-22  1360  		if (ret) {
79f4dc9dec0e0b Andy Shevchenko   2022-04-14  1361  			dev_err(dev, "Failed to read data: %d\n", ret);
941f130881fa90 Nuno Sa           2021-04-22  1362  			goto irq_done;
941f130881fa90 Nuno Sa           2021-04-22  1363  		}
d6a60d76173d47 Nuno Sa           2024-06-18  1364  	}
941f130881fa90 Nuno Sa           2021-04-22  1365  
941f130881fa90 Nuno Sa           2021-04-22  1366  	/*
941f130881fa90 Nuno Sa           2021-04-22  1367  	 * After making the burst request, the response can have one or two
941f130881fa90 Nuno Sa           2021-04-22  1368  	 * 16-bit responses containing the BURST_ID depending on the sclk. If
941f130881fa90 Nuno Sa           2021-04-22  1369  	 * clk > 3.6MHz, then we will have two BURST_ID in a row. If clk < 3MHZ,
941f130881fa90 Nuno Sa           2021-04-22  1370  	 * we have only one. To manage that variation, we use the transition from the
85b2aeaa2f4cb4 Ramona Gradinariu 2024-05-28  1371  	 * BURST_ID to the SYS_E_FLAG register, which will not be equal to 0xA5A5/0xC3C3.
85b2aeaa2f4cb4 Ramona Gradinariu 2024-05-28  1372  	 * If we not find this variation in the first 4 segments, then the data should
941f130881fa90 Nuno Sa           2021-04-22  1373  	 * not be valid.
941f130881fa90 Nuno Sa           2021-04-22  1374  	 */
941f130881fa90 Nuno Sa           2021-04-22  1375  	buffer = adis->buffer;
941f130881fa90 Nuno Sa           2021-04-22  1376  	for (offset = 0; offset < 4; offset++) {
941f130881fa90 Nuno Sa           2021-04-22  1377  		u16 curr = be16_to_cpu(buffer[offset]);
941f130881fa90 Nuno Sa           2021-04-22  1378  		u16 next = be16_to_cpu(buffer[offset + 1]);
941f130881fa90 Nuno Sa           2021-04-22  1379  
85b2aeaa2f4cb4 Ramona Gradinariu 2024-05-28  1380  		if (curr == st->burst_id && next != st->burst_id) {
941f130881fa90 Nuno Sa           2021-04-22  1381  			offset++;
941f130881fa90 Nuno Sa           2021-04-22  1382  			break;
941f130881fa90 Nuno Sa           2021-04-22  1383  		}
941f130881fa90 Nuno Sa           2021-04-22  1384  	}
941f130881fa90 Nuno Sa           2021-04-22  1385  
941f130881fa90 Nuno Sa           2021-04-22  1386  	if (offset == 4) {
79f4dc9dec0e0b Andy Shevchenko   2022-04-14  1387  		dev_err(dev, "Invalid burst data\n");
941f130881fa90 Nuno Sa           2021-04-22  1388  		goto irq_done;
941f130881fa90 Nuno Sa           2021-04-22  1389  	}
941f130881fa90 Nuno Sa           2021-04-22  1390  
941f130881fa90 Nuno Sa           2021-04-22  1391  	crc = be16_to_cpu(buffer[offset + 16]) << 16 | be16_to_cpu(buffer[offset + 15]);
941f130881fa90 Nuno Sa           2021-04-22  1392  	valid = adis16480_validate_crc((u16 *)&buffer[offset], 15, crc);
941f130881fa90 Nuno Sa           2021-04-22  1393  	if (!valid) {
79f4dc9dec0e0b Andy Shevchenko   2022-04-14  1394  		dev_err(dev, "Invalid crc\n");
941f130881fa90 Nuno Sa           2021-04-22  1395  		goto irq_done;
941f130881fa90 Nuno Sa           2021-04-22  1396  	}
941f130881fa90 Nuno Sa           2021-04-22  1397  
941f130881fa90 Nuno Sa           2021-04-22  1398  	for_each_set_bit(bit, indio_dev->active_scan_mask, indio_dev->masklength) {
941f130881fa90 Nuno Sa           2021-04-22  1399  		/*
941f130881fa90 Nuno Sa           2021-04-22  1400  		 * When burst mode is used, temperature is the first data
941f130881fa90 Nuno Sa           2021-04-22  1401  		 * channel in the sequence, but the temperature scan index
941f130881fa90 Nuno Sa           2021-04-22  1402  		 * is 10.
941f130881fa90 Nuno Sa           2021-04-22  1403  		 */
941f130881fa90 Nuno Sa           2021-04-22  1404  		switch (bit) {
941f130881fa90 Nuno Sa           2021-04-22  1405  		case ADIS16480_SCAN_TEMP:
941f130881fa90 Nuno Sa           2021-04-22  1406  			st->data[i++] = buffer[offset + 1];
85b2aeaa2f4cb4 Ramona Gradinariu 2024-05-28  1407  			/*
85b2aeaa2f4cb4 Ramona Gradinariu 2024-05-28  1408  			 * The temperature channel has 16-bit storage size.
85b2aeaa2f4cb4 Ramona Gradinariu 2024-05-28  1409  			 * We need to perform the padding to have the buffer
85b2aeaa2f4cb4 Ramona Gradinariu 2024-05-28  1410  			 * elements naturally aligned in case there are any
85b2aeaa2f4cb4 Ramona Gradinariu 2024-05-28  1411  			 * 32-bit storage size channels enabled which are added
85b2aeaa2f4cb4 Ramona Gradinariu 2024-05-28  1412  			 * in the buffer after the temprature data. In case
85b2aeaa2f4cb4 Ramona Gradinariu 2024-05-28  1413  			 * there is no data being added after the temperature
85b2aeaa2f4cb4 Ramona Gradinariu 2024-05-28  1414  			 * data, the padding is harmless.
85b2aeaa2f4cb4 Ramona Gradinariu 2024-05-28  1415  			 */
85b2aeaa2f4cb4 Ramona Gradinariu 2024-05-28  1416  			st->data[i++] = 0;
941f130881fa90 Nuno Sa           2021-04-22  1417  			break;
85b2aeaa2f4cb4 Ramona Gradinariu 2024-05-28  1418  		case ADIS16480_SCAN_DELTANG_X ... ADIS16480_SCAN_DELTVEL_Z:
85b2aeaa2f4cb4 Ramona Gradinariu 2024-05-28  1419  			buff_offset = ADIS16480_SCAN_DELTANG_X;
85b2aeaa2f4cb4 Ramona Gradinariu 2024-05-28  1420  			fallthrough;
941f130881fa90 Nuno Sa           2021-04-22  1421  		case ADIS16480_SCAN_GYRO_X ... ADIS16480_SCAN_ACCEL_Z:
941f130881fa90 Nuno Sa           2021-04-22  1422  			/* The lower register data is sequenced first */
85b2aeaa2f4cb4 Ramona Gradinariu 2024-05-28  1423  			st->data[i++] = buffer[2 * (bit - buff_offset) + offset + 3];
85b2aeaa2f4cb4 Ramona Gradinariu 2024-05-28  1424  			st->data[i++] = buffer[2 * (bit - buff_offset) + offset + 2];
941f130881fa90 Nuno Sa           2021-04-22  1425  			break;
941f130881fa90 Nuno Sa           2021-04-22  1426  		}
941f130881fa90 Nuno Sa           2021-04-22  1427  	}
941f130881fa90 Nuno Sa           2021-04-22  1428  
941f130881fa90 Nuno Sa           2021-04-22  1429  	iio_push_to_buffers_with_timestamp(indio_dev, st->data, pf->timestamp);
941f130881fa90 Nuno Sa           2021-04-22  1430  irq_done:
941f130881fa90 Nuno Sa           2021-04-22  1431  	iio_trigger_notify_done(indio_dev->trig);
941f130881fa90 Nuno Sa           2021-04-22  1432  
941f130881fa90 Nuno Sa           2021-04-22  1433  	return IRQ_HANDLED;
941f130881fa90 Nuno Sa           2021-04-22  1434  }
941f130881fa90 Nuno Sa           2021-04-22  1435  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
