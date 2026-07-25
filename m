Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 682FD376A1E
	for <oe-kbuild@lists.linux.dev>; Sat, 25 Jul 2026 02:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784946396; cv=none; b=gxb3NbiMrtcFrGmQONvHPD/X+nDVjatdANJCKxxKX1yo6BqO27VKZt1RzRnv9/hzbNhalqmU/m9cvvfBwRed/PU0Gmw8XXxfUhxU+zwEnxWMV3BreWDcGqHg6TA62Zeu0gyv1OcD262Z7RCllCsd9TjRr2s0li3z0qNCRQOcLFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784946396; c=relaxed/simple;
	bh=HpNrGjZLTGDgL+vGnNOkF/6WiQktJrIlhq9KkbKMBhI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MupxF+ej5BQt09qE4TBCxr/yX70grBD31ptI7DxCU5hwz5v9rqAUnklAiNGqtC2k25IwpBUmAaxHr3KoZT5bxEei8uhRYHK9qxBAopR3K6eokHeqA/9Xe9Gm8Cr7aqyCoyUYxI7krqdfhaHd/U5rZNSnGZfz37i9BqRbESaFeNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n4LiNlbX; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n4LiNlbX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784946391; x=1816482391;
  h=date:from:to:cc:subject:message-id;
  bh=HpNrGjZLTGDgL+vGnNOkF/6WiQktJrIlhq9KkbKMBhI=;
  b=n4LiNlbX6CG6FATCU9R0PKuHHeX2sYCrJD5XAJ46vsI1f7OJ8YkjQ8VH
   qf3ToFgHi0VN5gx2KfE/GC2fum8UERiD9CasNWOcsZfhW65r9PS/xSd9K
   bCWnm4ae1lJVb+kqgFH8ZMvIxqPT1OFw8gx1/2ZjV7w1OPSusM9I3K9Vh
   y5b1hPZ5viQ8Y/ABtO4nTnQXlJt135l1g2zEKsMeYoTVJNwScQ9QHVJD5
   r7qFlTFCVdOeJqgyNg3pGYzHHGZXAJKn/XlTArvkwLFKBYmSF5rKy2PrI
   aRk8cGYFv3/6WzKr5Im2uaWen8MQohN8JNVWpNL7WGHQYSntxSkiHk/UH
   Q==;
X-CSE-ConnectionGUID: tmNPFddPSSWdU+C8a47exw==
X-CSE-MsgGUID: YRejfKYWTiSmyhrBt21vyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11855"; a="96204518"
X-IronPort-AV: E=Sophos;i="6.25,183,1779174000"; 
   d="scan'208";a="96204518"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2026 19:26:30 -0700
X-CSE-ConnectionGUID: tIxf2CA4RAGUFi5RvqVG9A==
X-CSE-MsgGUID: pgWhx2/xRJeRlot9cy2WLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,183,1779174000"; 
   d="scan'208";a="283374211"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 24 Jul 2026 19:26:28 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wnS5q-00000000bQU-2fep;
	Sat, 25 Jul 2026 02:26:26 +0000
Date: Sat, 25 Jul 2026 10:25:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: sound/soc/codecs/rt1320-sdw.c:1575 rt1320_rae_load() warn:
 'rae_fw' from request_firmware() not released on lines: 1575.
Message-ID: <202607251021.4AyV4TWD-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Shuming Fan <shumingf@realtek.com>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   48a5a7ab8d6ab7090564339e039c421f315de912
commit: 22937af75abb3260c2d563739181f4b61ddac2c1 ASoC: rt1320: support RAE parameters loading
date:   7 months ago
:::::: branch date: 29 hours ago
:::::: commit date: 7 months ago
config: x86_64-randconfig-161-20260725 (https://download.01.org/0day-ci/archive/20260725/202607251021.4AyV4TWD-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 22937af75abb ("ASoC: rt1320: support RAE parameters loading")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607251021.4AyV4TWD-lkp@intel.com/

New smatch warnings:
sound/soc/codecs/rt1320-sdw.c:1575 rt1320_rae_load() warn: 'rae_fw' from request_firmware() not released on lines: 1575.

Old smatch warnings:
sound/soc/codecs/rt1320-sdw.c:1491 rt1320_rae_load() warn: should this be 'retry == -1'
sound/soc/codecs/rt1320-sdw.c:1591 rt1320_dspfw_load_code() warn: inconsistent indenting

vim +/rae_fw +1575 sound/soc/codecs/rt1320-sdw.c

da1682d5e8b53a Shuming Fan 2025-12-16  1425  
22937af75abb32 Shuming Fan 2025-12-16  1426  static int rt1320_rae_load(struct rt1320_sdw_priv *rt1320)
22937af75abb32 Shuming Fan 2025-12-16  1427  {
22937af75abb32 Shuming Fan 2025-12-16  1428  	struct device *dev = &rt1320->sdw_slave->dev;
22937af75abb32 Shuming Fan 2025-12-16  1429  	static const char func_tag[] = "FUNC";
22937af75abb32 Shuming Fan 2025-12-16  1430  	static const char xu_tag[] = "XU";
22937af75abb32 Shuming Fan 2025-12-16  1431  	const struct firmware *rae_fw = NULL;
22937af75abb32 Shuming Fan 2025-12-16  1432  	unsigned int fw_offset;
22937af75abb32 Shuming Fan 2025-12-16  1433  	unsigned char *fw_data;
22937af75abb32 Shuming Fan 2025-12-16  1434  	unsigned char *param_data;
22937af75abb32 Shuming Fan 2025-12-16  1435  	unsigned int addr, size;
22937af75abb32 Shuming Fan 2025-12-16  1436  	unsigned int func, value;
22937af75abb32 Shuming Fan 2025-12-16  1437  	const char *dmi_vendor, *dmi_product, *dmi_sku;
22937af75abb32 Shuming Fan 2025-12-16  1438  	char vendor[128], product[128], sku[128];
22937af75abb32 Shuming Fan 2025-12-16  1439  	char *ptr_vendor, *ptr_product, *ptr_sku;
22937af75abb32 Shuming Fan 2025-12-16  1440  	char rae_filename[128];
22937af75abb32 Shuming Fan 2025-12-16  1441  	char tag[5];
22937af75abb32 Shuming Fan 2025-12-16  1442  	int ret = 0;
22937af75abb32 Shuming Fan 2025-12-16  1443  	int retry = 200;
22937af75abb32 Shuming Fan 2025-12-16  1444  
22937af75abb32 Shuming Fan 2025-12-16  1445  	dmi_vendor = dmi_get_system_info(DMI_SYS_VENDOR);
22937af75abb32 Shuming Fan 2025-12-16  1446  	dmi_product = dmi_get_system_info(DMI_PRODUCT_NAME);
22937af75abb32 Shuming Fan 2025-12-16  1447  	dmi_sku = dmi_get_system_info(DMI_PRODUCT_SKU);
22937af75abb32 Shuming Fan 2025-12-16  1448  
22937af75abb32 Shuming Fan 2025-12-16  1449  	if (dmi_vendor && dmi_product && dmi_sku) {
22937af75abb32 Shuming Fan 2025-12-16  1450  		strscpy(vendor, dmi_vendor);
22937af75abb32 Shuming Fan 2025-12-16  1451  		strscpy(product, dmi_product);
22937af75abb32 Shuming Fan 2025-12-16  1452  		strscpy(sku, dmi_sku);
22937af75abb32 Shuming Fan 2025-12-16  1453  		ptr_vendor = &vendor[0];
22937af75abb32 Shuming Fan 2025-12-16  1454  		ptr_product = &product[0];
22937af75abb32 Shuming Fan 2025-12-16  1455  		ptr_sku = &sku[0];
22937af75abb32 Shuming Fan 2025-12-16  1456  		ptr_vendor = strsep(&ptr_vendor, " ");
22937af75abb32 Shuming Fan 2025-12-16  1457  		ptr_product = strsep(&ptr_product, " ");
22937af75abb32 Shuming Fan 2025-12-16  1458  		ptr_sku = strsep(&ptr_sku, " ");
22937af75abb32 Shuming Fan 2025-12-16  1459  
22937af75abb32 Shuming Fan 2025-12-16  1460  		dev_dbg(dev, "%s: DMI vendor=%s, product=%s, sku=%s\n", __func__,
22937af75abb32 Shuming Fan 2025-12-16  1461  			vendor, product, sku);
22937af75abb32 Shuming Fan 2025-12-16  1462  
22937af75abb32 Shuming Fan 2025-12-16  1463  		snprintf(rae_filename, sizeof(rae_filename),
22937af75abb32 Shuming Fan 2025-12-16  1464  			 "realtek/rt1320/rt1320_RAE_%s_%s_%s.dat", vendor, product, sku);
22937af75abb32 Shuming Fan 2025-12-16  1465  		dev_dbg(dev, "%s: try to load RAE file %s\n", __func__, rae_filename);
22937af75abb32 Shuming Fan 2025-12-16  1466  	} else {
22937af75abb32 Shuming Fan 2025-12-16  1467  		dev_warn(dev, "%s: Can't find proper RAE file name\n", __func__);
22937af75abb32 Shuming Fan 2025-12-16  1468  		return -EINVAL;
22937af75abb32 Shuming Fan 2025-12-16  1469  	}
22937af75abb32 Shuming Fan 2025-12-16  1470  
22937af75abb32 Shuming Fan 2025-12-16  1471  	regmap_write(rt1320->regmap,
22937af75abb32 Shuming Fan 2025-12-16  1472  			SDW_SDCA_CTL(FUNC_NUM_AMP, RT1320_SDCA_ENT_PDE23,
22937af75abb32 Shuming Fan 2025-12-16  1473  				RT1320_SDCA_CTL_REQ_POWER_STATE, 0), 0x00);
22937af75abb32 Shuming Fan 2025-12-16  1474  	rt1320_pde_transition_delay(rt1320, FUNC_NUM_AMP, RT1320_SDCA_ENT_PDE23, 0x00);
22937af75abb32 Shuming Fan 2025-12-16  1475  
22937af75abb32 Shuming Fan 2025-12-16  1476  	request_firmware(&rae_fw, rae_filename, dev);
22937af75abb32 Shuming Fan 2025-12-16  1477  	if (rae_fw) {
22937af75abb32 Shuming Fan 2025-12-16  1478  
22937af75abb32 Shuming Fan 2025-12-16  1479  		/* RAE CRC clear */
22937af75abb32 Shuming Fan 2025-12-16  1480  		regmap_write(rt1320->regmap, 0xe80b, 0x0f);
22937af75abb32 Shuming Fan 2025-12-16  1481  
22937af75abb32 Shuming Fan 2025-12-16  1482  		/* RAE stop & CRC disable */
22937af75abb32 Shuming Fan 2025-12-16  1483  		regmap_update_bits(rt1320->regmap, 0xe803, 0xbc, 0x00);
22937af75abb32 Shuming Fan 2025-12-16  1484  
22937af75abb32 Shuming Fan 2025-12-16  1485  		while (retry--) {
22937af75abb32 Shuming Fan 2025-12-16  1486  			regmap_read(rt1320->regmap, 0xe83f, &value);
22937af75abb32 Shuming Fan 2025-12-16  1487  			if (value & 0x40)
22937af75abb32 Shuming Fan 2025-12-16  1488  				break;
22937af75abb32 Shuming Fan 2025-12-16  1489  			usleep_range(1000, 1100);
22937af75abb32 Shuming Fan 2025-12-16  1490  		}
22937af75abb32 Shuming Fan 2025-12-16  1491  		if (!retry && !(value & 0x40)) {
22937af75abb32 Shuming Fan 2025-12-16  1492  			dev_err(dev, "%s: RAE is not ready to load\n", __func__);
22937af75abb32 Shuming Fan 2025-12-16  1493  			return -ETIMEDOUT;
22937af75abb32 Shuming Fan 2025-12-16  1494  		}
22937af75abb32 Shuming Fan 2025-12-16  1495  
22937af75abb32 Shuming Fan 2025-12-16  1496  		dev_dbg(dev, "%s, rae_fw size=0x%lx\n", __func__, rae_fw->size);
22937af75abb32 Shuming Fan 2025-12-16  1497  		regcache_cache_bypass(rt1320->regmap, true);
22937af75abb32 Shuming Fan 2025-12-16  1498  		for (fw_offset = 0; fw_offset < rae_fw->size;) {
22937af75abb32 Shuming Fan 2025-12-16  1499  
22937af75abb32 Shuming Fan 2025-12-16  1500  			dev_dbg(dev, "%s, fw_offset=0x%x\n", __func__, fw_offset);
22937af75abb32 Shuming Fan 2025-12-16  1501  
22937af75abb32 Shuming Fan 2025-12-16  1502  			fw_data = (unsigned char *)&rae_fw->data[fw_offset];
22937af75abb32 Shuming Fan 2025-12-16  1503  
22937af75abb32 Shuming Fan 2025-12-16  1504  			memcpy(tag, fw_data, 4);
22937af75abb32 Shuming Fan 2025-12-16  1505  			tag[4] = '\0';
22937af75abb32 Shuming Fan 2025-12-16  1506  			dev_dbg(dev, "%s, tag=%s\n", __func__, tag);
22937af75abb32 Shuming Fan 2025-12-16  1507  			if (strcmp(tag, xu_tag) == 0) {
22937af75abb32 Shuming Fan 2025-12-16  1508  				dev_dbg(dev, "%s: This is a XU tag", __func__);
22937af75abb32 Shuming Fan 2025-12-16  1509  				memcpy(&addr, (fw_data + 4), 4);
22937af75abb32 Shuming Fan 2025-12-16  1510  				memcpy(&size, (fw_data + 8), 4);
22937af75abb32 Shuming Fan 2025-12-16  1511  				param_data = (unsigned char *)(fw_data + 12);
22937af75abb32 Shuming Fan 2025-12-16  1512  
22937af75abb32 Shuming Fan 2025-12-16  1513  				dev_dbg(dev, "%s: addr=0x%x, size=0x%x\n", __func__, addr, size);
22937af75abb32 Shuming Fan 2025-12-16  1514  
22937af75abb32 Shuming Fan 2025-12-16  1515  				/*
22937af75abb32 Shuming Fan 2025-12-16  1516  				 * UI register ranges from 0x1000d000 to 0x1000d7ff
22937af75abb32 Shuming Fan 2025-12-16  1517  				 * UI registers should be accessed by tuning tool.
22937af75abb32 Shuming Fan 2025-12-16  1518  				 * So, there registers should be cached.
22937af75abb32 Shuming Fan 2025-12-16  1519  				 */
22937af75abb32 Shuming Fan 2025-12-16  1520  				if (addr <= 0x1000d7ff && addr >= 0x1000d000)
22937af75abb32 Shuming Fan 2025-12-16  1521  					regcache_cache_bypass(rt1320->regmap, false);
22937af75abb32 Shuming Fan 2025-12-16  1522  
22937af75abb32 Shuming Fan 2025-12-16  1523  				rt1320_data_rw(rt1320, addr, param_data, size, RT1320_PARAM_WRITE);
22937af75abb32 Shuming Fan 2025-12-16  1524  
22937af75abb32 Shuming Fan 2025-12-16  1525  				regcache_cache_bypass(rt1320->regmap, true);
22937af75abb32 Shuming Fan 2025-12-16  1526  
22937af75abb32 Shuming Fan 2025-12-16  1527  				fw_offset += (size + 12);
22937af75abb32 Shuming Fan 2025-12-16  1528  			} else if (strcmp(tag, func_tag) == 0) {
22937af75abb32 Shuming Fan 2025-12-16  1529  				dev_err(dev, "%s: This is a FUNC tag", __func__);
22937af75abb32 Shuming Fan 2025-12-16  1530  
22937af75abb32 Shuming Fan 2025-12-16  1531  				memcpy(&func, (fw_data + 4), 4);
22937af75abb32 Shuming Fan 2025-12-16  1532  				memcpy(&value, (fw_data + 8), 4);
22937af75abb32 Shuming Fan 2025-12-16  1533  
22937af75abb32 Shuming Fan 2025-12-16  1534  				dev_dbg(dev, "%s: func=0x%x, value=0x%x\n", __func__, func, value);
22937af75abb32 Shuming Fan 2025-12-16  1535  				if (func == 1)  //DelayMs
22937af75abb32 Shuming Fan 2025-12-16  1536  					msleep(value);
22937af75abb32 Shuming Fan 2025-12-16  1537  
22937af75abb32 Shuming Fan 2025-12-16  1538  				fw_offset += 12;
22937af75abb32 Shuming Fan 2025-12-16  1539  			} else {
22937af75abb32 Shuming Fan 2025-12-16  1540  				dev_err(dev, "%s: This is NOT a XU file (wrong tag)", __func__);
22937af75abb32 Shuming Fan 2025-12-16  1541  				break;
22937af75abb32 Shuming Fan 2025-12-16  1542  			}
22937af75abb32 Shuming Fan 2025-12-16  1543  		}
22937af75abb32 Shuming Fan 2025-12-16  1544  
22937af75abb32 Shuming Fan 2025-12-16  1545  		regcache_cache_bypass(rt1320->regmap, false);
22937af75abb32 Shuming Fan 2025-12-16  1546  		release_firmware(rae_fw);
22937af75abb32 Shuming Fan 2025-12-16  1547  
22937af75abb32 Shuming Fan 2025-12-16  1548  	} else {
22937af75abb32 Shuming Fan 2025-12-16  1549  		dev_err(dev, "%s: Failed to load %s firmware\n", __func__, rae_filename);
22937af75abb32 Shuming Fan 2025-12-16  1550  		ret = -EINVAL;
22937af75abb32 Shuming Fan 2025-12-16  1551  		goto _exit_;
22937af75abb32 Shuming Fan 2025-12-16  1552  	}
22937af75abb32 Shuming Fan 2025-12-16  1553  
22937af75abb32 Shuming Fan 2025-12-16  1554  	/* RAE CRC enable */
22937af75abb32 Shuming Fan 2025-12-16  1555  	regmap_update_bits(rt1320->regmap, 0xe803, 0x0c, 0x0c);
22937af75abb32 Shuming Fan 2025-12-16  1556  
22937af75abb32 Shuming Fan 2025-12-16  1557  	/* RAE update */
22937af75abb32 Shuming Fan 2025-12-16  1558  	regmap_update_bits(rt1320->regmap, 0xe80b, 0x80, 0x00);
22937af75abb32 Shuming Fan 2025-12-16  1559  	regmap_update_bits(rt1320->regmap, 0xe80b, 0x80, 0x80);
22937af75abb32 Shuming Fan 2025-12-16  1560  
22937af75abb32 Shuming Fan 2025-12-16  1561  	/* RAE run */
22937af75abb32 Shuming Fan 2025-12-16  1562  	regmap_update_bits(rt1320->regmap, 0xe803, 0x80, 0x80);
22937af75abb32 Shuming Fan 2025-12-16  1563  
22937af75abb32 Shuming Fan 2025-12-16  1564  	regmap_read(rt1320->regmap, 0xe80b, &value);
22937af75abb32 Shuming Fan 2025-12-16  1565  	dev_dbg(dev, "%s: CAE run => 0xe80b reg = 0x%x\n", __func__, value);
22937af75abb32 Shuming Fan 2025-12-16  1566  
22937af75abb32 Shuming Fan 2025-12-16  1567  	rt1320->rae_update_done = true;
22937af75abb32 Shuming Fan 2025-12-16  1568  
22937af75abb32 Shuming Fan 2025-12-16  1569  _exit_:
22937af75abb32 Shuming Fan 2025-12-16  1570  	regmap_write(rt1320->regmap,
22937af75abb32 Shuming Fan 2025-12-16  1571  			SDW_SDCA_CTL(FUNC_NUM_AMP, RT1320_SDCA_ENT_PDE23,
22937af75abb32 Shuming Fan 2025-12-16  1572  				RT1320_SDCA_CTL_REQ_POWER_STATE, 0), 0x03);
22937af75abb32 Shuming Fan 2025-12-16  1573  	rt1320_pde_transition_delay(rt1320, FUNC_NUM_AMP, RT1320_SDCA_ENT_PDE23, 0x03);
22937af75abb32 Shuming Fan 2025-12-16  1574  
22937af75abb32 Shuming Fan 2025-12-16 @1575  	return ret;
22937af75abb32 Shuming Fan 2025-12-16  1576  }
22937af75abb32 Shuming Fan 2025-12-16  1577  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
