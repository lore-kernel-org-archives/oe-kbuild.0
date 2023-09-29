Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02219CA41
	for <oe-kbuild@lists.linux.dev>; Fri, 29 Sep 2023 08:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695975802; x=1727511802;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=B4pcMUO5XUnyMJIHhg4Q32xTVPFJzBXmlGglG94CoOo=;
  b=BHvzPh9GYANQFBJRb1bAq+ccWRIFEzTvtbu3Q/MFCyUJfmZ185F/IVGE
   YaAYSPoxE995YIX+Mz64+1ebt8bmKiK4dQs9E/N/ZObltHeNtmgOs02k4
   ym0+vKqDEneSKTj/DpEuQ6u/5WzkfIEH+KXvQoplpFDC3H6Vj8Ju5Dn0X
   mjbxyHPJSk+t+mL+xd4EwhpPrRbN9t9UdG2ddhMiSP67PshuXNfjHl5Yz
   Qvrtki/Z0GMjACJ/l7FVpUn7MuqJAUA7opGHdIKof9PmurCTu09+XFcfU
   YPXcQNjLgZ/WgX3zgngkHuAo4C4sJVE3Smtldj6kFwfNfYy1ZUvcmKlK1
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="468531632"
X-IronPort-AV: E=Sophos;i="6.03,186,1694761200"; 
   d="scan'208";a="468531632"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2023 00:51:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="923533645"
X-IronPort-AV: E=Sophos;i="6.03,186,1694761200"; 
   d="scan'208";a="923533645"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 29 Sep 2023 00:51:38 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qm8Hg-0002b5-2C;
	Fri, 29 Sep 2023 07:51:36 +0000
Date: Fri, 29 Sep 2023 15:51:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 1206/8790] sound/pci/hda/cs35l41_hda.c:1559
 cs35l41_hda_probe() warn: passing zero to 'dev_err_probe'
Message-ID: <202309291552.x9o0voiU-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
CC: Mark Brown <broonie@kernel.org>
CC: Takashi Iwai <tiwai@suse.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   df964ce9ef9fea10cf131bf6bad8658fde7956f6
commit: 206b250c3e9be44c096bb9bb1f9d6b7f3440bfbb [1206/8790] ALSA: hda: cs35l41: Consistently use dev_err_probe()
:::::: branch date: 3 hours ago
:::::: commit date: 3 weeks ago
config: x86_64-randconfig-161-20230929 (https://download.01.org/0day-ci/archive/20230929/202309291552.x9o0voiU-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230929/202309291552.x9o0voiU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309291552.x9o0voiU-lkp@intel.com/

New smatch warnings:
sound/pci/hda/cs35l41_hda.c:1559 cs35l41_hda_probe() warn: passing zero to 'dev_err_probe'

Old smatch warnings:
sound/pci/hda/cs35l41_hda.c:311 cs35l41_request_firmware_files() error: double free of '*wmfw_filename'

vim +/dev_err_probe +1559 sound/pci/hda/cs35l41_hda.c

7b2f3eb492dac7 Lucas Tanure       2021-12-17  1506  
7b2f3eb492dac7 Lucas Tanure       2021-12-17  1507  int cs35l41_hda_probe(struct device *dev, const char *device_name, int id, int irq,
7b2f3eb492dac7 Lucas Tanure       2021-12-17  1508  		      struct regmap *regmap)
7b2f3eb492dac7 Lucas Tanure       2021-12-17  1509  {
7b2f3eb492dac7 Lucas Tanure       2021-12-17  1510  	unsigned int int_sts, regid, reg_revid, mtl_revid, chipid, int_status;
7b2f3eb492dac7 Lucas Tanure       2021-12-17  1511  	struct cs35l41_hda *cs35l41;
7b2f3eb492dac7 Lucas Tanure       2021-12-17  1512  	int ret;
7b2f3eb492dac7 Lucas Tanure       2021-12-17  1513  
aa4a38af97e9f1 Stefan Binding     2022-05-09  1514  	BUILD_BUG_ON(ARRAY_SIZE(cs35l41_irqs) != ARRAY_SIZE(cs35l41_reg_irqs));
aa4a38af97e9f1 Stefan Binding     2022-05-09  1515  	BUILD_BUG_ON(ARRAY_SIZE(cs35l41_irqs) != CS35L41_NUM_IRQ);
aa4a38af97e9f1 Stefan Binding     2022-05-09  1516  
7b2f3eb492dac7 Lucas Tanure       2021-12-17  1517  	if (IS_ERR(regmap))
7b2f3eb492dac7 Lucas Tanure       2021-12-17  1518  		return PTR_ERR(regmap);
7b2f3eb492dac7 Lucas Tanure       2021-12-17  1519  
7b2f3eb492dac7 Lucas Tanure       2021-12-17  1520  	cs35l41 = devm_kzalloc(dev, sizeof(*cs35l41), GFP_KERNEL);
7b2f3eb492dac7 Lucas Tanure       2021-12-17  1521  	if (!cs35l41)
7b2f3eb492dac7 Lucas Tanure       2021-12-17  1522  		return -ENOMEM;
7b2f3eb492dac7 Lucas Tanure       2021-12-17  1523  
7b2f3eb492dac7 Lucas Tanure       2021-12-17  1524  	cs35l41->dev = dev;
7b2f3eb492dac7 Lucas Tanure       2021-12-17  1525  	cs35l41->irq = irq;
7b2f3eb492dac7 Lucas Tanure       2021-12-17  1526  	cs35l41->regmap = regmap;
7b2f3eb492dac7 Lucas Tanure       2021-12-17  1527  	dev_set_drvdata(dev, cs35l41);
7b2f3eb492dac7 Lucas Tanure       2021-12-17  1528  
f7f207375d4e6e Lucas Tanure       2022-04-13  1529  	ret = cs35l41_hda_read_acpi(cs35l41, device_name, id);
e35cd6881dd56d Andy Shevchenko    2022-07-11  1530  	if (ret)
e35cd6881dd56d Andy Shevchenko    2022-07-11  1531  		return dev_err_probe(cs35l41->dev, ret, "Platform not supported\n");
7b2f3eb492dac7 Lucas Tanure       2021-12-17  1532  
7b2f3eb492dac7 Lucas Tanure       2021-12-17  1533  	if (IS_ERR(cs35l41->reset_gpio)) {
7b2f3eb492dac7 Lucas Tanure       2021-12-17  1534  		ret = PTR_ERR(cs35l41->reset_gpio);
7b2f3eb492dac7 Lucas Tanure       2021-12-17  1535  		cs35l41->reset_gpio = NULL;
7b2f3eb492dac7 Lucas Tanure       2021-12-17  1536  		if (ret == -EBUSY) {
7b2f3eb492dac7 Lucas Tanure       2021-12-17  1537  			dev_info(cs35l41->dev, "Reset line busy, assuming shared reset\n");
7b2f3eb492dac7 Lucas Tanure       2021-12-17  1538  		} else {
e35cd6881dd56d Andy Shevchenko    2022-07-11  1539  			dev_err_probe(cs35l41->dev, ret, "Failed to get reset GPIO\n");
7b2f3eb492dac7 Lucas Tanure       2021-12-17  1540  			goto err;
7b2f3eb492dac7 Lucas Tanure       2021-12-17  1541  		}
7b2f3eb492dac7 Lucas Tanure       2021-12-17  1542  	}
7b2f3eb492dac7 Lucas Tanure       2021-12-17  1543  	if (cs35l41->reset_gpio) {
7b2f3eb492dac7 Lucas Tanure       2021-12-17  1544  		usleep_range(2000, 2100);
7b2f3eb492dac7 Lucas Tanure       2021-12-17  1545  		gpiod_set_value_cansleep(cs35l41->reset_gpio, 1);
7b2f3eb492dac7 Lucas Tanure       2021-12-17  1546  	}
7b2f3eb492dac7 Lucas Tanure       2021-12-17  1547  
7b2f3eb492dac7 Lucas Tanure       2021-12-17  1548  	usleep_range(2000, 2100);
7b2f3eb492dac7 Lucas Tanure       2021-12-17  1549  
7b2f3eb492dac7 Lucas Tanure       2021-12-17  1550  	ret = regmap_read_poll_timeout(cs35l41->regmap, CS35L41_IRQ1_STATUS4, int_status,
7b2f3eb492dac7 Lucas Tanure       2021-12-17  1551  				       int_status & CS35L41_OTP_BOOT_DONE, 1000, 100000);
7b2f3eb492dac7 Lucas Tanure       2021-12-17  1552  	if (ret) {
206b250c3e9be4 Cristian Ciocaltea 2023-09-07  1553  		dev_err_probe(cs35l41->dev, ret, "Failed waiting for OTP_BOOT_DONE\n");
7b2f3eb492dac7 Lucas Tanure       2021-12-17  1554  		goto err;
7b2f3eb492dac7 Lucas Tanure       2021-12-17  1555  	}
7b2f3eb492dac7 Lucas Tanure       2021-12-17  1556  
7b2f3eb492dac7 Lucas Tanure       2021-12-17  1557  	ret = regmap_read(cs35l41->regmap, CS35L41_IRQ1_STATUS3, &int_sts);
7b2f3eb492dac7 Lucas Tanure       2021-12-17  1558  	if (ret || (int_sts & CS35L41_OTP_BOOT_ERR)) {
206b250c3e9be4 Cristian Ciocaltea 2023-09-07 @1559  		dev_err_probe(cs35l41->dev, ret, "OTP Boot status %x error\n",
206b250c3e9be4 Cristian Ciocaltea 2023-09-07  1560  			      int_sts & CS35L41_OTP_BOOT_ERR);
7b2f3eb492dac7 Lucas Tanure       2021-12-17  1561  		ret = -EIO;
7b2f3eb492dac7 Lucas Tanure       2021-12-17  1562  		goto err;
7b2f3eb492dac7 Lucas Tanure       2021-12-17  1563  	}
7b2f3eb492dac7 Lucas Tanure       2021-12-17  1564  
7b2f3eb492dac7 Lucas Tanure       2021-12-17  1565  	ret = regmap_read(cs35l41->regmap, CS35L41_DEVID, &regid);
7b2f3eb492dac7 Lucas Tanure       2021-12-17  1566  	if (ret) {
206b250c3e9be4 Cristian Ciocaltea 2023-09-07  1567  		dev_err_probe(cs35l41->dev, ret, "Get Device ID failed\n");
7b2f3eb492dac7 Lucas Tanure       2021-12-17  1568  		goto err;
7b2f3eb492dac7 Lucas Tanure       2021-12-17  1569  	}
7b2f3eb492dac7 Lucas Tanure       2021-12-17  1570  
7b2f3eb492dac7 Lucas Tanure       2021-12-17  1571  	ret = regmap_read(cs35l41->regmap, CS35L41_REVID, &reg_revid);
7b2f3eb492dac7 Lucas Tanure       2021-12-17  1572  	if (ret) {
206b250c3e9be4 Cristian Ciocaltea 2023-09-07  1573  		dev_err_probe(cs35l41->dev, ret, "Get Revision ID failed\n");
7b2f3eb492dac7 Lucas Tanure       2021-12-17  1574  		goto err;
7b2f3eb492dac7 Lucas Tanure       2021-12-17  1575  	}
7b2f3eb492dac7 Lucas Tanure       2021-12-17  1576  
7b2f3eb492dac7 Lucas Tanure       2021-12-17  1577  	mtl_revid = reg_revid & CS35L41_MTLREVID_MASK;
7b2f3eb492dac7 Lucas Tanure       2021-12-17  1578  
7b2f3eb492dac7 Lucas Tanure       2021-12-17  1579  	chipid = (mtl_revid % 2) ? CS35L41R_CHIP_ID : CS35L41_CHIP_ID;
7b2f3eb492dac7 Lucas Tanure       2021-12-17  1580  	if (regid != chipid) {
7b2f3eb492dac7 Lucas Tanure       2021-12-17  1581  		dev_err(cs35l41->dev, "CS35L41 Device ID (%X). Expected ID %X\n", regid, chipid);
7b2f3eb492dac7 Lucas Tanure       2021-12-17  1582  		ret = -ENODEV;
7b2f3eb492dac7 Lucas Tanure       2021-12-17  1583  		goto err;
7b2f3eb492dac7 Lucas Tanure       2021-12-17  1584  	}
7b2f3eb492dac7 Lucas Tanure       2021-12-17  1585  
6e4320d8ecbc87 Charles Keepax     2022-01-17  1586  	ret = cs35l41_test_key_unlock(cs35l41->dev, cs35l41->regmap);
6e4320d8ecbc87 Charles Keepax     2022-01-17  1587  	if (ret)
6e4320d8ecbc87 Charles Keepax     2022-01-17  1588  		goto err;
6e4320d8ecbc87 Charles Keepax     2022-01-17  1589  
7b2f3eb492dac7 Lucas Tanure       2021-12-17  1590  	ret = cs35l41_register_errata_patch(cs35l41->dev, cs35l41->regmap, reg_revid);
7b2f3eb492dac7 Lucas Tanure       2021-12-17  1591  	if (ret)
7b2f3eb492dac7 Lucas Tanure       2021-12-17  1592  		goto err;
7b2f3eb492dac7 Lucas Tanure       2021-12-17  1593  
7b2f3eb492dac7 Lucas Tanure       2021-12-17  1594  	ret = cs35l41_otp_unpack(cs35l41->dev, cs35l41->regmap);
7b2f3eb492dac7 Lucas Tanure       2021-12-17  1595  	if (ret) {
206b250c3e9be4 Cristian Ciocaltea 2023-09-07  1596  		dev_err_probe(cs35l41->dev, ret, "OTP Unpack failed\n");
7b2f3eb492dac7 Lucas Tanure       2021-12-17  1597  		goto err;
7b2f3eb492dac7 Lucas Tanure       2021-12-17  1598  	}
7b2f3eb492dac7 Lucas Tanure       2021-12-17  1599  
6e4320d8ecbc87 Charles Keepax     2022-01-17  1600  	ret = cs35l41_test_key_lock(cs35l41->dev, cs35l41->regmap);
6e4320d8ecbc87 Charles Keepax     2022-01-17  1601  	if (ret)
6e4320d8ecbc87 Charles Keepax     2022-01-17  1602  		goto err;
6e4320d8ecbc87 Charles Keepax     2022-01-17  1603  
2d816d4f92086c Stefan Binding     2023-07-21  1604  	ret = regmap_multi_reg_write(cs35l41->regmap, cs35l41_hda_mute,
2d816d4f92086c Stefan Binding     2023-07-21  1605  				     ARRAY_SIZE(cs35l41_hda_mute));
2d816d4f92086c Stefan Binding     2023-07-21  1606  	if (ret)
2d816d4f92086c Stefan Binding     2023-07-21  1607  		goto err;
2d816d4f92086c Stefan Binding     2023-07-21  1608  
47ceabd99a2839 Stefan Binding     2022-06-30  1609  	INIT_WORK(&cs35l41->fw_load_work, cs35l41_fw_load_work);
2e81e1fffd53ba Vitaly Rodionov    2022-06-30  1610  	mutex_init(&cs35l41->fw_mutex);
2e81e1fffd53ba Vitaly Rodionov    2022-06-30  1611  
1873ebd30cc818 Stefan Binding     2022-06-30  1612  	pm_runtime_set_autosuspend_delay(cs35l41->dev, 3000);
1873ebd30cc818 Stefan Binding     2022-06-30  1613  	pm_runtime_use_autosuspend(cs35l41->dev);
1873ebd30cc818 Stefan Binding     2022-06-30  1614  	pm_runtime_mark_last_busy(cs35l41->dev);
1873ebd30cc818 Stefan Binding     2022-06-30  1615  	pm_runtime_set_active(cs35l41->dev);
1873ebd30cc818 Stefan Binding     2022-06-30  1616  	pm_runtime_get_noresume(cs35l41->dev);
1873ebd30cc818 Stefan Binding     2022-06-30  1617  	pm_runtime_enable(cs35l41->dev);
1873ebd30cc818 Stefan Binding     2022-06-30  1618  
f7f207375d4e6e Lucas Tanure       2022-04-13  1619  	ret = cs35l41_hda_apply_properties(cs35l41);
7b2f3eb492dac7 Lucas Tanure       2021-12-17  1620  	if (ret)
1873ebd30cc818 Stefan Binding     2022-06-30  1621  		goto err_pm;
1873ebd30cc818 Stefan Binding     2022-06-30  1622  
1873ebd30cc818 Stefan Binding     2022-06-30  1623  	pm_runtime_put_autosuspend(cs35l41->dev);
7b2f3eb492dac7 Lucas Tanure       2021-12-17  1624  
7b2f3eb492dac7 Lucas Tanure       2021-12-17  1625  	ret = component_add(cs35l41->dev, &cs35l41_hda_comp_ops);
7b2f3eb492dac7 Lucas Tanure       2021-12-17  1626  	if (ret) {
206b250c3e9be4 Cristian Ciocaltea 2023-09-07  1627  		dev_err_probe(cs35l41->dev, ret, "Register component failed\n");
486465508f8a5f Cristian Ciocaltea 2023-09-07  1628  		goto err_pm;
7b2f3eb492dac7 Lucas Tanure       2021-12-17  1629  	}
7b2f3eb492dac7 Lucas Tanure       2021-12-17  1630  
7b2f3eb492dac7 Lucas Tanure       2021-12-17  1631  	dev_info(cs35l41->dev, "Cirrus Logic CS35L41 (%x), Revision: %02X\n", regid, reg_revid);
7b2f3eb492dac7 Lucas Tanure       2021-12-17  1632  
7b2f3eb492dac7 Lucas Tanure       2021-12-17  1633  	return 0;
7b2f3eb492dac7 Lucas Tanure       2021-12-17  1634  
1873ebd30cc818 Stefan Binding     2022-06-30  1635  err_pm:
85a1bf86fac0c1 Cristian Ciocaltea 2023-09-07  1636  	pm_runtime_dont_use_autosuspend(cs35l41->dev);
1873ebd30cc818 Stefan Binding     2022-06-30  1637  	pm_runtime_disable(cs35l41->dev);
1873ebd30cc818 Stefan Binding     2022-06-30  1638  	pm_runtime_put_noidle(cs35l41->dev);
1873ebd30cc818 Stefan Binding     2022-06-30  1639  
7b2f3eb492dac7 Lucas Tanure       2021-12-17  1640  err:
5577dd2329d03e Lucas Tanure       2022-04-13  1641  	if (cs35l41_safe_reset(cs35l41->regmap, cs35l41->hw_cfg.bst_type))
7b2f3eb492dac7 Lucas Tanure       2021-12-17  1642  		gpiod_set_value_cansleep(cs35l41->reset_gpio, 0);
7b2f3eb492dac7 Lucas Tanure       2021-12-17  1643  	gpiod_put(cs35l41->reset_gpio);
7269734abbf596 Andy Shevchenko    2022-09-05  1644  	kfree(cs35l41->acpi_subsystem_id);
7b2f3eb492dac7 Lucas Tanure       2021-12-17  1645  
7b2f3eb492dac7 Lucas Tanure       2021-12-17  1646  	return ret;
7b2f3eb492dac7 Lucas Tanure       2021-12-17  1647  }
77dc3a6ee2eb58 Lucas Tanure       2022-01-17  1648  EXPORT_SYMBOL_NS_GPL(cs35l41_hda_probe, SND_HDA_SCODEC_CS35L41);
7b2f3eb492dac7 Lucas Tanure       2021-12-17  1649  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
