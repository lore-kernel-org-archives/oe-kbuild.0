Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD39A1368
	for <oe-kbuild@lists.linux.dev>; Sun, 21 Jan 2024 09:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705829293; cv=none; b=RMLcnzPo4hLzM29uVqk59gatGtpp6WJMsyd/pzmoX5XR4/rI7bI605OruEppXgoIeqV487zVZaU4ciganvk9IMieUEpKL3jchI3U+dcpTkP0lUsqy9oFqXPrZxpggO0RctlTbGqiPGyxDBmM4RSjXuMd/irXiConjA5QR1L4IfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705829293; c=relaxed/simple;
	bh=frUt9/Q7L5eSiPmzgyZaWJVtZY1a2cfvUCgNxOcmAzQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=niwctoMytNTSWu+H+MCfe6qp8dkxUuwRYyZuwV/dn8pDoa670aDyzOSzHg3iSj8uSD8Il/HctemJRL8USWqKvoikTdInUXzfpTjYx71SDVm+dj7kP0A8ohw/eu21fTzLIBI17YX9XOV1QfsAqBDzkBwP3oSJJqh3ZA0loBT0n0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dsc7AwQq; arc=none smtp.client-ip=134.134.136.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dsc7AwQq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705829290; x=1737365290;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=frUt9/Q7L5eSiPmzgyZaWJVtZY1a2cfvUCgNxOcmAzQ=;
  b=Dsc7AwQqdf/6waa6k6Hp/tBvhOLzKxWmA+7CPgFih+Ar4yKFyQ7dqP0x
   XBLkjk6PUtvhxKpKfNETMLPwMCnoudrTcoEIP0JJGGJ+W27sg3vc61zoX
   CCK/l9YAHefZAcdpb5CeCSOgyV03rY/yClMPSBQZdVckqEUqWsWL5PYQ7
   slNRL6m7UG3iYo60rTDBPnMiyO/kQEbDRBACR7OOK6FQS1bzwy3zGW/51
   99WKRRQDeAU4QNDqDTUSfZlE46SRX680Hc6Mbw8g8Uj30CJShsYiIHbkC
   0g5SG4UiyJy8wPNlqNM9hnbJXHAn6KfF2f9ozt7oKDtNjdUgXiOAjdOOq
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10959"; a="465278144"
X-IronPort-AV: E=Sophos;i="6.05,209,1701158400"; 
   d="scan'208";a="465278144"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2024 01:28:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,209,1701158400"; 
   d="scan'208";a="1032869"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 21 Jan 2024 01:28:09 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rRU7a-0005pK-09;
	Sun, 21 Jan 2024 09:28:06 +0000
Date: Sun, 21 Jan 2024 17:27:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/iio/light/tsl2563.c:768:8-33: WARNING: Threaded IRQ with no
 primary handler requested without IRQF_ONESHOT (unless it is nested IRQ)
Message-ID: <202401211748.v2QSqcEy-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Ferry Toth <ftoth@exalondelft.nl>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>
CC: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7a396820222d6d4c02057f41658b162bdcdadd0e
commit: 027641b52fe37b64af61025298ce160c8b9b7a73 iio: light: tsl2563: Do not hardcode interrupt trigger type
date:   1 year, 1 month ago
:::::: branch date: 8 hours ago
:::::: commit date: 1 year, 1 month ago
config: arm-randconfig-r062-20240117 (https://download.01.org/0day-ci/archive/20240121/202401211748.v2QSqcEy-lkp@intel.com/config)
compiler: clang version 18.0.0git (https://github.com/llvm/llvm-project 9bde5becb44ea071f5e1fa1f5d4071dc8788b18c)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202401211748.v2QSqcEy-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/iio/light/tsl2563.c:768:8-33: WARNING: Threaded IRQ with no primary handler requested without IRQF_ONESHOT (unless it is nested IRQ)

vim +768 drivers/iio/light/tsl2563.c

6fe8135fccd66a drivers/staging/iio/light/tsl2563.c Jonathan Cameron   2011-05-18  701  
74cd01b3f9041e drivers/iio/light/tsl2563.c         Uwe Kleine-König   2022-11-18  702  static int tsl2563_probe(struct i2c_client *client)
ee1f1fa4071416 drivers/staging/iio/light/tsl2563.c Amit Kucheria      2009-11-09  703  {
33789dce549895 drivers/staging/iio/light/tsl2563.c Jonathan Cameron   2011-04-18  704  	struct iio_dev *indio_dev;
ee1f1fa4071416 drivers/staging/iio/light/tsl2563.c Amit Kucheria      2009-11-09  705  	struct tsl2563_chip *chip;
ee1f1fa4071416 drivers/staging/iio/light/tsl2563.c Amit Kucheria      2009-11-09  706  	struct tsl2563_platform_data *pdata = client->dev.platform_data;
027641b52fe37b drivers/iio/light/tsl2563.c         Ferry Toth         2022-12-07  707  	unsigned long irq_flags;
ee1f1fa4071416 drivers/staging/iio/light/tsl2563.c Amit Kucheria      2009-11-09  708  	int err = 0;
deda386deb537d drivers/staging/iio/light/tsl2563.c Jonathan Cameron   2011-08-12  709  	u8 id = 0;
ee1f1fa4071416 drivers/staging/iio/light/tsl2563.c Amit Kucheria      2009-11-09  710  
bace48f44adb95 drivers/iio/light/tsl2563.c         Sachin Kamat       2013-07-30  711  	indio_dev = devm_iio_device_alloc(&client->dev, sizeof(*chip));
33789dce549895 drivers/staging/iio/light/tsl2563.c Jonathan Cameron   2011-04-18  712  	if (!indio_dev)
ee1f1fa4071416 drivers/staging/iio/light/tsl2563.c Amit Kucheria      2009-11-09  713  		return -ENOMEM;
ee1f1fa4071416 drivers/staging/iio/light/tsl2563.c Amit Kucheria      2009-11-09  714  
33789dce549895 drivers/staging/iio/light/tsl2563.c Jonathan Cameron   2011-04-18  715  	chip = iio_priv(indio_dev);
33789dce549895 drivers/staging/iio/light/tsl2563.c Jonathan Cameron   2011-04-18  716  
70804e560b072d drivers/iio/light/tsl2563.c         Alexandru Ardelean 2020-05-22  717  	i2c_set_clientdata(client, indio_dev);
ee1f1fa4071416 drivers/staging/iio/light/tsl2563.c Amit Kucheria      2009-11-09  718  	chip->client = client;
ee1f1fa4071416 drivers/staging/iio/light/tsl2563.c Amit Kucheria      2009-11-09  719  
ee1f1fa4071416 drivers/staging/iio/light/tsl2563.c Amit Kucheria      2009-11-09  720  	err = tsl2563_detect(chip);
ee1f1fa4071416 drivers/staging/iio/light/tsl2563.c Amit Kucheria      2009-11-09  721  	if (err) {
dbf717fd9a0d5f drivers/staging/iio/light/tsl2563.c Grant Grundler     2012-03-05  722  		dev_err(&client->dev, "detect error %d\n", -err);
bace48f44adb95 drivers/iio/light/tsl2563.c         Sachin Kamat       2013-07-30  723  		return err;
ee1f1fa4071416 drivers/staging/iio/light/tsl2563.c Amit Kucheria      2009-11-09  724  	}
ee1f1fa4071416 drivers/staging/iio/light/tsl2563.c Amit Kucheria      2009-11-09  725  
ee1f1fa4071416 drivers/staging/iio/light/tsl2563.c Amit Kucheria      2009-11-09  726  	err = tsl2563_read_id(chip, &id);
dbf717fd9a0d5f drivers/staging/iio/light/tsl2563.c Grant Grundler     2012-03-05  727  	if (err) {
dbf717fd9a0d5f drivers/staging/iio/light/tsl2563.c Grant Grundler     2012-03-05  728  		dev_err(&client->dev, "read id error %d\n", -err);
bace48f44adb95 drivers/iio/light/tsl2563.c         Sachin Kamat       2013-07-30  729  		return err;
dbf717fd9a0d5f drivers/staging/iio/light/tsl2563.c Grant Grundler     2012-03-05  730  	}
ee1f1fa4071416 drivers/staging/iio/light/tsl2563.c Amit Kucheria      2009-11-09  731  
ee1f1fa4071416 drivers/staging/iio/light/tsl2563.c Amit Kucheria      2009-11-09  732  	mutex_init(&chip->lock);
ee1f1fa4071416 drivers/staging/iio/light/tsl2563.c Amit Kucheria      2009-11-09  733  
ee1f1fa4071416 drivers/staging/iio/light/tsl2563.c Amit Kucheria      2009-11-09  734  	/* Default values used until userspace says otherwise */
ee1f1fa4071416 drivers/staging/iio/light/tsl2563.c Amit Kucheria      2009-11-09  735  	chip->low_thres = 0x0;
ee1f1fa4071416 drivers/staging/iio/light/tsl2563.c Amit Kucheria      2009-11-09  736  	chip->high_thres = 0xffff;
ee1f1fa4071416 drivers/staging/iio/light/tsl2563.c Amit Kucheria      2009-11-09  737  	chip->gainlevel = tsl2563_gainlevel_table;
ee1f1fa4071416 drivers/staging/iio/light/tsl2563.c Amit Kucheria      2009-11-09  738  	chip->intr = TSL2563_INT_PERSIST(4);
6fa273c1aaa0ab drivers/iio/light/tsl2563.c         Peter Meerwald     2015-04-15  739  	chip->calib0 = tsl2563_calib_from_sysfs(CALIB_BASE_SYSFS);
6fa273c1aaa0ab drivers/iio/light/tsl2563.c         Peter Meerwald     2015-04-15  740  	chip->calib1 = tsl2563_calib_from_sysfs(CALIB_BASE_SYSFS);
ee1f1fa4071416 drivers/staging/iio/light/tsl2563.c Amit Kucheria      2009-11-09  741  
d884da1a75489e drivers/iio/light/tsl2563.c         Vaishnav M A       2020-10-19  742  	if (pdata) {
ee1f1fa4071416 drivers/staging/iio/light/tsl2563.c Amit Kucheria      2009-11-09  743  		chip->cover_comp_gain = pdata->cover_comp_gain;
d884da1a75489e drivers/iio/light/tsl2563.c         Vaishnav M A       2020-10-19  744  	} else {
d884da1a75489e drivers/iio/light/tsl2563.c         Vaishnav M A       2020-10-19  745  		err = device_property_read_u32(&client->dev, "amstaos,cover-comp-gain",
8175bff5b47eae drivers/iio/light/tsl2563.c         Sebastian Reichel  2013-10-25  746  					       &chip->cover_comp_gain);
d884da1a75489e drivers/iio/light/tsl2563.c         Vaishnav M A       2020-10-19  747  		if (err)
ee1f1fa4071416 drivers/staging/iio/light/tsl2563.c Amit Kucheria      2009-11-09  748  			chip->cover_comp_gain = 1;
d884da1a75489e drivers/iio/light/tsl2563.c         Vaishnav M A       2020-10-19  749  	}
ee1f1fa4071416 drivers/staging/iio/light/tsl2563.c Amit Kucheria      2009-11-09  750  
ee1f1fa4071416 drivers/staging/iio/light/tsl2563.c Amit Kucheria      2009-11-09  751  	dev_info(&client->dev, "model %d, rev. %d\n", id >> 4, id & 0x0f);
cbcdf4dd4fb109 drivers/staging/iio/light/tsl2563.c Jonathan Cameron   2011-05-18  752  	indio_dev->name = client->name;
cbcdf4dd4fb109 drivers/staging/iio/light/tsl2563.c Jonathan Cameron   2011-05-18  753  	indio_dev->channels = tsl2563_channels;
cbcdf4dd4fb109 drivers/staging/iio/light/tsl2563.c Jonathan Cameron   2011-05-18  754  	indio_dev->num_channels = ARRAY_SIZE(tsl2563_channels);
33789dce549895 drivers/staging/iio/light/tsl2563.c Jonathan Cameron   2011-04-18  755  	indio_dev->modes = INDIO_DIRECT_MODE;
dbf717fd9a0d5f drivers/staging/iio/light/tsl2563.c Grant Grundler     2012-03-05  756  
cbcdf4dd4fb109 drivers/staging/iio/light/tsl2563.c Jonathan Cameron   2011-05-18  757  	if (client->irq)
6fe8135fccd66a drivers/staging/iio/light/tsl2563.c Jonathan Cameron   2011-05-18  758  		indio_dev->info = &tsl2563_info;
6fe8135fccd66a drivers/staging/iio/light/tsl2563.c Jonathan Cameron   2011-05-18  759  	else
6fe8135fccd66a drivers/staging/iio/light/tsl2563.c Jonathan Cameron   2011-05-18  760  		indio_dev->info = &tsl2563_info_no_irq;
dbf717fd9a0d5f drivers/staging/iio/light/tsl2563.c Grant Grundler     2012-03-05  761  
388be488395287 drivers/staging/iio/light/tsl2563.c Jonathan Cameron   2010-06-26  762  	if (client->irq) {
027641b52fe37b drivers/iio/light/tsl2563.c         Ferry Toth         2022-12-07  763  		irq_flags = irq_get_trigger_type(client->irq);
027641b52fe37b drivers/iio/light/tsl2563.c         Ferry Toth         2022-12-07  764  		if (irq_flags == IRQF_TRIGGER_NONE)
027641b52fe37b drivers/iio/light/tsl2563.c         Ferry Toth         2022-12-07  765  			irq_flags = IRQF_TRIGGER_RISING;
027641b52fe37b drivers/iio/light/tsl2563.c         Ferry Toth         2022-12-07  766  		irq_flags |= IRQF_ONESHOT;
027641b52fe37b drivers/iio/light/tsl2563.c         Ferry Toth         2022-12-07  767  
bace48f44adb95 drivers/iio/light/tsl2563.c         Sachin Kamat       2013-07-30 @768  		err = devm_request_threaded_irq(&client->dev, client->irq,
bdab1001738f4e drivers/staging/iio/light/tsl2563.c Jonathan Cameron   2011-05-18  769  					   NULL,
bdab1001738f4e drivers/staging/iio/light/tsl2563.c Jonathan Cameron   2011-05-18  770  					   &tsl2563_event_handler,
027641b52fe37b drivers/iio/light/tsl2563.c         Ferry Toth         2022-12-07  771  					   irq_flags,
bdab1001738f4e drivers/staging/iio/light/tsl2563.c Jonathan Cameron   2011-05-18  772  					   "tsl2563_event",
bdab1001738f4e drivers/staging/iio/light/tsl2563.c Jonathan Cameron   2011-05-18  773  					   indio_dev);
dbf717fd9a0d5f drivers/staging/iio/light/tsl2563.c Grant Grundler     2012-03-05  774  		if (err) {
dbf717fd9a0d5f drivers/staging/iio/light/tsl2563.c Grant Grundler     2012-03-05  775  			dev_err(&client->dev, "irq request error %d\n", -err);
bace48f44adb95 drivers/iio/light/tsl2563.c         Sachin Kamat       2013-07-30  776  			return err;
dbf717fd9a0d5f drivers/staging/iio/light/tsl2563.c Grant Grundler     2012-03-05  777  		}
388be488395287 drivers/staging/iio/light/tsl2563.c Jonathan Cameron   2010-06-26  778  	}
dbf717fd9a0d5f drivers/staging/iio/light/tsl2563.c Grant Grundler     2012-03-05  779  
ee1f1fa4071416 drivers/staging/iio/light/tsl2563.c Amit Kucheria      2009-11-09  780  	err = tsl2563_configure(chip);
dbf717fd9a0d5f drivers/staging/iio/light/tsl2563.c Grant Grundler     2012-03-05  781  	if (err) {
dbf717fd9a0d5f drivers/staging/iio/light/tsl2563.c Grant Grundler     2012-03-05  782  		dev_err(&client->dev, "configure error %d\n", -err);
bace48f44adb95 drivers/iio/light/tsl2563.c         Sachin Kamat       2013-07-30  783  		return err;
dbf717fd9a0d5f drivers/staging/iio/light/tsl2563.c Grant Grundler     2012-03-05  784  	}
ee1f1fa4071416 drivers/staging/iio/light/tsl2563.c Amit Kucheria      2009-11-09  785  
ee1f1fa4071416 drivers/staging/iio/light/tsl2563.c Amit Kucheria      2009-11-09  786  	INIT_DELAYED_WORK(&chip->poweroff_work, tsl2563_poweroff_work);
dbf717fd9a0d5f drivers/staging/iio/light/tsl2563.c Grant Grundler     2012-03-05  787  
388be488395287 drivers/staging/iio/light/tsl2563.c Jonathan Cameron   2010-06-26  788  	/* The interrupt cannot yet be enabled so this is fine without lock */
ee1f1fa4071416 drivers/staging/iio/light/tsl2563.c Amit Kucheria      2009-11-09  789  	schedule_delayed_work(&chip->poweroff_work, 5 * HZ);
ee1f1fa4071416 drivers/staging/iio/light/tsl2563.c Amit Kucheria      2009-11-09  790  
dbf717fd9a0d5f drivers/staging/iio/light/tsl2563.c Grant Grundler     2012-03-05  791  	err = iio_device_register(indio_dev);
dbf717fd9a0d5f drivers/staging/iio/light/tsl2563.c Grant Grundler     2012-03-05  792  	if (err) {
dbf717fd9a0d5f drivers/staging/iio/light/tsl2563.c Grant Grundler     2012-03-05  793  		dev_err(&client->dev, "iio registration error %d\n", -err);
bace48f44adb95 drivers/iio/light/tsl2563.c         Sachin Kamat       2013-07-30  794  		goto fail;
dbf717fd9a0d5f drivers/staging/iio/light/tsl2563.c Grant Grundler     2012-03-05  795  	}
26d25ae3f0d8ff drivers/staging/iio/light/tsl2563.c Jonathan Cameron   2011-09-02  796  
ee1f1fa4071416 drivers/staging/iio/light/tsl2563.c Amit Kucheria      2009-11-09  797  	return 0;
dbf717fd9a0d5f drivers/staging/iio/light/tsl2563.c Grant Grundler     2012-03-05  798  
bace48f44adb95 drivers/iio/light/tsl2563.c         Sachin Kamat       2013-07-30  799  fail:
9e61d901155bcd drivers/iio/light/tsl2563.c         Amitoj Kaur Chawla 2016-03-17  800  	cancel_delayed_work_sync(&chip->poweroff_work);
ee1f1fa4071416 drivers/staging/iio/light/tsl2563.c Amit Kucheria      2009-11-09  801  	return err;
ee1f1fa4071416 drivers/staging/iio/light/tsl2563.c Amit Kucheria      2009-11-09  802  }
ee1f1fa4071416 drivers/staging/iio/light/tsl2563.c Amit Kucheria      2009-11-09  803  

:::::: The code at line 768 was first introduced by commit
:::::: bace48f44adb954ad71e62779d1be52dae3f0caf iio: light: tsl2563: Use devm_* APIs

:::::: TO: Sachin Kamat <sachin.kamat@linaro.org>
:::::: CC: Jonathan Cameron <jic23@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
