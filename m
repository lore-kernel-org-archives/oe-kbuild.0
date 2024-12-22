Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F6B018C004
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Dec 2024 14:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734878835; cv=none; b=ZuqHGEJTsREZtdNXYTayBoxxuQJghDR2RmYQ73tXeoXmDct3a2tzpuGG3EqWzoumV3EcDrDL4UFHjhurdSk2cr1MddUJ+kjJFLWkX1UXW/AaajU03U2HXhjxzbnOd/CZN3SSdXe+BwNKINIRM4opG83yXIlwKMhvnieCgQ3smk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734878835; c=relaxed/simple;
	bh=HyUqtbeChA1JXntS+B29do9W9zboE4JM/Rlqe9PZ0Pg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MxqGIcj5j9elaTef2H8zlTAG8/hRsLvXsi7M9gLmmQ9EdgQkCf4EY28m7D1wCMV69kqYI7o4ypOawVcWac6ZTID6g2CmNNM8R0sS4PPg2ERTboFL/wK5R3wz96R9KBTaKZhRrTXyMvui8MmtLQKjszZmiEUZxGntQVKbHSIjrEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nmtx4Nlg; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nmtx4Nlg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734878834; x=1766414834;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HyUqtbeChA1JXntS+B29do9W9zboE4JM/Rlqe9PZ0Pg=;
  b=nmtx4Nlg+ON+f4umY6D/Ooppo32KdoB5fiTG4u/+NEMbPsVsQ4TZpdbv
   Q6WBbURp3p3YLft5zZzl0gu3EdVJskdNFAw8BbWC+onNV031dAwsYb1Tc
   t2PLvi8gQvoLPS7RaLPoZgrMR0VPSpPQY7Y+ZPtZBot6P9FVnYlh3LByi
   UNdFQr7Woke6dm9Wmk2F6rbf2/19rTlxQnMWEG2L80D6PugTtX8v9K2LF
   zP2zG761jfZlMR5N9aZI3qw/cDpSHuq5gTfmucxzdqQCg+O+q8CqGrK/t
   Jzh93tPtB9PIhY5tueHiN9QbOwMKd3AoSbLHThbmCIh/E7JmvLtW5HGrW
   g==;
X-CSE-ConnectionGUID: 0S3S/G42QNuMNfBM6fJ0NA==
X-CSE-MsgGUID: vqjldvdWTaGp6KZEmZbvaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11294"; a="39143363"
X-IronPort-AV: E=Sophos;i="6.12,255,1728975600"; 
   d="scan'208";a="39143363"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2024 06:47:13 -0800
X-CSE-ConnectionGUID: 85hZPToXTv60RpOuos5nJA==
X-CSE-MsgGUID: BYdmmBz8SnShfBxdxdfgmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,255,1728975600"; 
   d="scan'208";a="99495048"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 22 Dec 2024 06:47:11 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPNEb-00030d-0e;
	Sun, 22 Dec 2024 14:47:09 +0000
Date: Sun, 22 Dec 2024 22:46:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [frank-w-bpi-r2-4.14:6.13-rsslro 68/85] drivers/spi/spi.c:1510
 spi_do_calibration() warn: variable dereferenced before check
 'ctlr->cal_rule' (see line 1497)
Message-ID: <202412222247.9wXWimMF-lkp@intel.com>
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
TO: Frank Wunderlich <frank-w@public-files.de>

tree:   https://github.com/frank-w/BPI-R2-4.14 6.13-rsslro
head:   71039e5e1e5f0b4e55c5f6279c659b58e05819c8
commit: 3f003bfdabf11d3f9fc47fecd2fe46b5447deea2 [68/85] drivers: spi: Add support for dynamic calibration
:::::: branch date: 25 hours ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-161-20241222 (https://download.01.org/0day-ci/archive/20241222/202412222247.9wXWimMF-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412222247.9wXWimMF-lkp@intel.com/

smatch warnings:
drivers/spi/spi.c:1510 spi_do_calibration() warn: variable dereferenced before check 'ctlr->cal_rule' (see line 1497)

vim +1510 drivers/spi/spi.c

810923f3bf06c1 Lubomir Rintel 2018-11-13  1493  
3f003bfdabf11d SkyLake.Huang  2022-06-23  1494  int spi_do_calibration(struct spi_controller *ctlr, struct spi_device *spi,
3f003bfdabf11d SkyLake.Huang  2022-06-23  1495  	int (*cal_read)(void *priv, u32 *addr, int addrlen, u8 *buf, int readlen), void *drv_priv)
3f003bfdabf11d SkyLake.Huang  2022-06-23  1496  {
3f003bfdabf11d SkyLake.Huang  2022-06-23 @1497  	int datalen = ctlr->cal_rule->datalen;
3f003bfdabf11d SkyLake.Huang  2022-06-23  1498  	int addrlen = ctlr->cal_rule->addrlen;
3f003bfdabf11d SkyLake.Huang  2022-06-23  1499  	u8 *buf;
3f003bfdabf11d SkyLake.Huang  2022-06-23  1500  	int ret;
3f003bfdabf11d SkyLake.Huang  2022-06-23  1501  	int i;
3f003bfdabf11d SkyLake.Huang  2022-06-23  1502  	struct list_head *cal_head, *listptr;
3f003bfdabf11d SkyLake.Huang  2022-06-23  1503  	struct spi_cal_target *target;
3f003bfdabf11d SkyLake.Huang  2022-06-23  1504  
3f003bfdabf11d SkyLake.Huang  2022-06-23  1505  	/* Calculate calibration result */
3f003bfdabf11d SkyLake.Huang  2022-06-23  1506  	int hit_val, total_hit, origin;
3f003bfdabf11d SkyLake.Huang  2022-06-23  1507  	bool hit;
3f003bfdabf11d SkyLake.Huang  2022-06-23  1508  
3f003bfdabf11d SkyLake.Huang  2022-06-23  1509  	/* Make sure we can start calibration */
3f003bfdabf11d SkyLake.Huang  2022-06-23 @1510  	if(!ctlr->cal_target || !ctlr->cal_rule || !ctlr->append_caldata)
3f003bfdabf11d SkyLake.Huang  2022-06-23  1511  		return 0;
3f003bfdabf11d SkyLake.Huang  2022-06-23  1512  
3f003bfdabf11d SkyLake.Huang  2022-06-23  1513  	buf = kzalloc(datalen * sizeof(u8), GFP_KERNEL);
3f003bfdabf11d SkyLake.Huang  2022-06-23  1514  	if(!buf)
3f003bfdabf11d SkyLake.Huang  2022-06-23  1515  		return -ENOMEM;
3f003bfdabf11d SkyLake.Huang  2022-06-23  1516  
3f003bfdabf11d SkyLake.Huang  2022-06-23  1517  	ret = ctlr->append_caldata(ctlr);
3f003bfdabf11d SkyLake.Huang  2022-06-23  1518  	if (ret)
3f003bfdabf11d SkyLake.Huang  2022-06-23  1519  		goto cal_end;
3f003bfdabf11d SkyLake.Huang  2022-06-23  1520  
3f003bfdabf11d SkyLake.Huang  2022-06-23  1521  	cal_head = ctlr->cal_target;
3f003bfdabf11d SkyLake.Huang  2022-06-23  1522  	list_for_each(listptr, cal_head) {
3f003bfdabf11d SkyLake.Huang  2022-06-23  1523  		target = list_entry(listptr, struct spi_cal_target, list);
3f003bfdabf11d SkyLake.Huang  2022-06-23  1524  
3f003bfdabf11d SkyLake.Huang  2022-06-23  1525  		hit = false;
3f003bfdabf11d SkyLake.Huang  2022-06-23  1526  		hit_val = 0;
3f003bfdabf11d SkyLake.Huang  2022-06-23  1527  		total_hit = 0;
3f003bfdabf11d SkyLake.Huang  2022-06-23  1528  		origin = *target->cal_item;
3f003bfdabf11d SkyLake.Huang  2022-06-23  1529  
3f003bfdabf11d SkyLake.Huang  2022-06-23  1530  		for(i=target->cal_min; i<=target->cal_max; i+=target->step) {
3f003bfdabf11d SkyLake.Huang  2022-06-23  1531  			*target->cal_item = i;
3f003bfdabf11d SkyLake.Huang  2022-06-23  1532  			ret = (*cal_read)(drv_priv, ctlr->cal_rule->addr, addrlen, buf, datalen);
3f003bfdabf11d SkyLake.Huang  2022-06-23  1533  			if(ret)
3f003bfdabf11d SkyLake.Huang  2022-06-23  1534  				break;
3f003bfdabf11d SkyLake.Huang  2022-06-23  1535  			dev_dbg(&spi->dev, "controller cal item value: 0x%x\n", i);
3f003bfdabf11d SkyLake.Huang  2022-06-23  1536  			if(memcmp(ctlr->cal_rule->match_data, buf, datalen * sizeof(u8)) == 0) {
3f003bfdabf11d SkyLake.Huang  2022-06-23  1537  				hit = true;
3f003bfdabf11d SkyLake.Huang  2022-06-23  1538  				hit_val += i;
3f003bfdabf11d SkyLake.Huang  2022-06-23  1539  				total_hit++;
3f003bfdabf11d SkyLake.Huang  2022-06-23  1540  				dev_dbg(&spi->dev, "golden data matches data read!\n");
3f003bfdabf11d SkyLake.Huang  2022-06-23  1541  			}
3f003bfdabf11d SkyLake.Huang  2022-06-23  1542  		}
3f003bfdabf11d SkyLake.Huang  2022-06-23  1543  		if(hit) {
3f003bfdabf11d SkyLake.Huang  2022-06-23  1544  			*target->cal_item = DIV_ROUND_CLOSEST(hit_val, total_hit);
3f003bfdabf11d SkyLake.Huang  2022-06-23  1545  			dev_info(&spi->dev, "calibration result: 0x%x", *target->cal_item);
3f003bfdabf11d SkyLake.Huang  2022-06-23  1546  		} else {
3f003bfdabf11d SkyLake.Huang  2022-06-23  1547  			*target->cal_item = origin;
3f003bfdabf11d SkyLake.Huang  2022-06-23  1548  			dev_warn(&spi->dev, "calibration failed, fallback to default: 0x%x", origin);
3f003bfdabf11d SkyLake.Huang  2022-06-23  1549  		}
3f003bfdabf11d SkyLake.Huang  2022-06-23  1550  	}
3f003bfdabf11d SkyLake.Huang  2022-06-23  1551  
3f003bfdabf11d SkyLake.Huang  2022-06-23  1552  cal_end:
3f003bfdabf11d SkyLake.Huang  2022-06-23  1553  	kfree(buf);
3f003bfdabf11d SkyLake.Huang  2022-06-23  1554  	return ret? ret: 0;
3f003bfdabf11d SkyLake.Huang  2022-06-23  1555  }
3f003bfdabf11d SkyLake.Huang  2022-06-23  1556  EXPORT_SYMBOL_GPL(spi_do_calibration);
3f003bfdabf11d SkyLake.Huang  2022-06-23  1557  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
