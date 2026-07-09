Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F5503AA182
	for <oe-kbuild@lists.linux.dev>; Thu,  9 Jul 2026 06:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783576825; cv=none; b=sk5c6y7OQG68gq01iZkdtv5Vw0MzhiY2k66hRx9HgEh6xMhCb4l/NkjGexSkjCnY4UKdgTcTvGEjvCgYXVkRG8zgXYOnss1giIDdmM3NUzQEAnqUkA4Qu4jqg+oll+skTRhxDVlo8S5Gw6wclPw4Gkt7twKchERgY2JEPAmbyhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783576825; c=relaxed/simple;
	bh=6dbk8ylap3rWUQUqqi1ESXG/b48c71cQo/wgmLy2T0U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YoXFXLXWdkRcF1vIw7Q4sNKEw3+2YLDVsQSa9zf00m5Z+XNr1pi+ZLp0ucuoq+6uzgfYmmMyI5qjGWD5SU9wCHaehay/ZW5fRZq898epVXKsse0DUJEBfkdGkysDw1uaygtfCcbUEp/BRZyCFlhgEggOE+i1G4PBCW47QawUV7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jO0IjXUp; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jO0IjXUp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783576824; x=1815112824;
  h=date:from:to:cc:subject:message-id;
  bh=6dbk8ylap3rWUQUqqi1ESXG/b48c71cQo/wgmLy2T0U=;
  b=jO0IjXUpNPPoeDPJfKm6HxCkIY/vebfHLV1XqcNXEr2I6fmypI3C90DI
   lPAABXMIt5SsZCKAaoUfA+jIL39iXT20hyV/4k3idDmbuCaY3ipSjpv/5
   xtKysOcbRqQCHJ5PBeIXeZI9PwHfQ9cX6QE7SfpqdaxTVgH0lHW/MAuHd
   woN4d5mGAlOF0xhH1uLyh4GiI+Mc3TAdDv80gFgKuEUAi88Bl/c55lLRR
   EoEN1vHETeqXIx2s/lOVoHkf9FgrHhtOeN8Ju751b10lB4Pn31oNzhuUy
   dt1aTsSEkWWwC3T9pTBGB4IugqDY9qoLkoRm2ItCHLuH5/AfxdpYDD7Dx
   A==;
X-CSE-ConnectionGUID: NsCtYu/GT0y7/Uj+c3pvFQ==
X-CSE-MsgGUID: moyako4TSU+xQuY8NbOwqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="71769326"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="71769326"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 23:00:23 -0700
X-CSE-ConnectionGUID: q2qwM9BKQdmKVm/w3O0TXQ==
X-CSE-MsgGUID: C3efGQnVS+2RdrLF05M9OQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="256408691"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 08 Jul 2026 23:00:21 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whho2-00000000HKR-2ViQ;
	Thu, 09 Jul 2026 06:00:18 +0000
Date: Thu, 09 Jul 2026 13:59:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android14-kiwi-6.1 180/180]
 drivers/i2c/busses/i2c-pxa.c:1364 i2c_pxa_init_recovery() warn: passing zero
 to 'PTR_ERR'
Message-ID: <202607091344.tyIUh9ZX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   7b80053b707666e258e504127dd1bf5ac555f5e1
commit: b3fd9db79e30d5eb5f76ef1f5b7e4f444af574ea [180/180] Revert "i2c: pxa: move to generic GPIO recovery"
:::::: branch date: 2 days ago
:::::: commit date: 2 years, 7 months ago
config: i386-randconfig-141-20260708 (https://download.01.org/0day-ci/archive/20260709/202607091344.tyIUh9ZX-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607091344.tyIUh9ZX-lkp@intel.com/

smatch warnings:
drivers/i2c/busses/i2c-pxa.c:1364 i2c_pxa_init_recovery() warn: passing zero to 'PTR_ERR'
drivers/i2c/busses/i2c-pxa.c:1364 i2c_pxa_init_recovery() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +1364 drivers/i2c/busses/i2c-pxa.c

7c9ec2c5251851 Russell King 2020-05-13  1335  
7c9ec2c5251851 Russell King 2020-05-13  1336  static int i2c_pxa_init_recovery(struct pxa_i2c *i2c)
7c9ec2c5251851 Russell King 2020-05-13  1337  {
7c9ec2c5251851 Russell King 2020-05-13  1338  	struct i2c_bus_recovery_info *bri = &i2c->recovery;
7c9ec2c5251851 Russell King 2020-05-13  1339  	struct device *dev = i2c->adap.dev.parent;
7c9ec2c5251851 Russell King 2020-05-13  1340  
7c9ec2c5251851 Russell King 2020-05-13  1341  	/*
7c9ec2c5251851 Russell King 2020-05-13  1342  	 * When slave mode is enabled, we are not the only master on the bus.
7c9ec2c5251851 Russell King 2020-05-13  1343  	 * Bus recovery can only be performed when we are the master, which
7c9ec2c5251851 Russell King 2020-05-13  1344  	 * we can't be certain of. Therefore, when slave mode is enabled, do
7c9ec2c5251851 Russell King 2020-05-13  1345  	 * not configure bus recovery.
7c9ec2c5251851 Russell King 2020-05-13  1346  	 */
7c9ec2c5251851 Russell King 2020-05-13  1347  	if (IS_ENABLED(CONFIG_I2C_PXA_SLAVE))
7c9ec2c5251851 Russell King 2020-05-13  1348  		return 0;
7c9ec2c5251851 Russell King 2020-05-13  1349  
b3fd9db79e30d5 Robert Marko 2023-11-10  1350  	i2c->pinctrl = devm_pinctrl_get(dev);
b3fd9db79e30d5 Robert Marko 2023-11-10  1351  	if (PTR_ERR(i2c->pinctrl) == -ENODEV)
b3fd9db79e30d5 Robert Marko 2023-11-10  1352  		i2c->pinctrl = NULL;
b3fd9db79e30d5 Robert Marko 2023-11-10  1353  	if (IS_ERR(i2c->pinctrl))
b3fd9db79e30d5 Robert Marko 2023-11-10  1354  		return PTR_ERR(i2c->pinctrl);
b3fd9db79e30d5 Robert Marko 2023-11-10  1355  
b3fd9db79e30d5 Robert Marko 2023-11-10  1356  	if (!i2c->pinctrl)
b3fd9db79e30d5 Robert Marko 2023-11-10  1357  		return 0;
b3fd9db79e30d5 Robert Marko 2023-11-10  1358  
b3fd9db79e30d5 Robert Marko 2023-11-10  1359  	i2c->pinctrl_default = pinctrl_lookup_state(i2c->pinctrl,
b3fd9db79e30d5 Robert Marko 2023-11-10  1360  						    PINCTRL_STATE_DEFAULT);
b3fd9db79e30d5 Robert Marko 2023-11-10  1361  	i2c->pinctrl_recovery = pinctrl_lookup_state(i2c->pinctrl, "recovery");
b3fd9db79e30d5 Robert Marko 2023-11-10  1362  
b3fd9db79e30d5 Robert Marko 2023-11-10  1363  	if (IS_ERR(i2c->pinctrl_default) || IS_ERR(i2c->pinctrl_recovery)) {
b3fd9db79e30d5 Robert Marko 2023-11-10 @1364  		dev_info(dev, "missing pinmux recovery information: %ld %ld\n",
b3fd9db79e30d5 Robert Marko 2023-11-10  1365  			 PTR_ERR(i2c->pinctrl_default),
b3fd9db79e30d5 Robert Marko 2023-11-10  1366  			 PTR_ERR(i2c->pinctrl_recovery));
b3fd9db79e30d5 Robert Marko 2023-11-10  1367  		return 0;
b3fd9db79e30d5 Robert Marko 2023-11-10  1368  	}
b3fd9db79e30d5 Robert Marko 2023-11-10  1369  
b3fd9db79e30d5 Robert Marko 2023-11-10  1370  	/*
b3fd9db79e30d5 Robert Marko 2023-11-10  1371  	 * Claiming GPIOs can influence the pinmux state, and may glitch the
b3fd9db79e30d5 Robert Marko 2023-11-10  1372  	 * I2C bus. Do this carefully.
b3fd9db79e30d5 Robert Marko 2023-11-10  1373  	 */
b3fd9db79e30d5 Robert Marko 2023-11-10  1374  	bri->scl_gpiod = devm_gpiod_get(dev, "scl", GPIOD_OUT_HIGH_OPEN_DRAIN);
b3fd9db79e30d5 Robert Marko 2023-11-10  1375  	if (bri->scl_gpiod == ERR_PTR(-EPROBE_DEFER))
b3fd9db79e30d5 Robert Marko 2023-11-10  1376  		return -EPROBE_DEFER;
b3fd9db79e30d5 Robert Marko 2023-11-10  1377  	if (IS_ERR(bri->scl_gpiod)) {
b3fd9db79e30d5 Robert Marko 2023-11-10  1378  		dev_info(dev, "missing scl gpio recovery information: %pe\n",
b3fd9db79e30d5 Robert Marko 2023-11-10  1379  			 bri->scl_gpiod);
b3fd9db79e30d5 Robert Marko 2023-11-10  1380  		return 0;
b3fd9db79e30d5 Robert Marko 2023-11-10  1381  	}
b3fd9db79e30d5 Robert Marko 2023-11-10  1382  
b3fd9db79e30d5 Robert Marko 2023-11-10  1383  	/*
b3fd9db79e30d5 Robert Marko 2023-11-10  1384  	 * We have SCL. Pull SCL low and wait a bit so that SDA glitches
b3fd9db79e30d5 Robert Marko 2023-11-10  1385  	 * have no effect.
b3fd9db79e30d5 Robert Marko 2023-11-10  1386  	 */
b3fd9db79e30d5 Robert Marko 2023-11-10  1387  	gpiod_direction_output(bri->scl_gpiod, 0);
b3fd9db79e30d5 Robert Marko 2023-11-10  1388  	udelay(10);
b3fd9db79e30d5 Robert Marko 2023-11-10  1389  	bri->sda_gpiod = devm_gpiod_get(dev, "sda", GPIOD_OUT_HIGH_OPEN_DRAIN);
b3fd9db79e30d5 Robert Marko 2023-11-10  1390  
b3fd9db79e30d5 Robert Marko 2023-11-10  1391  	/* Wait a bit in case of a SDA glitch, and then release SCL. */
b3fd9db79e30d5 Robert Marko 2023-11-10  1392  	udelay(10);
b3fd9db79e30d5 Robert Marko 2023-11-10  1393  	gpiod_direction_output(bri->scl_gpiod, 1);
b3fd9db79e30d5 Robert Marko 2023-11-10  1394  
b3fd9db79e30d5 Robert Marko 2023-11-10  1395  	if (bri->sda_gpiod == ERR_PTR(-EPROBE_DEFER))
b3fd9db79e30d5 Robert Marko 2023-11-10  1396  		return -EPROBE_DEFER;
b3fd9db79e30d5 Robert Marko 2023-11-10  1397  
b3fd9db79e30d5 Robert Marko 2023-11-10  1398  	if (IS_ERR(bri->sda_gpiod)) {
b3fd9db79e30d5 Robert Marko 2023-11-10  1399  		dev_info(dev, "missing sda gpio recovery information: %pe\n",
b3fd9db79e30d5 Robert Marko 2023-11-10  1400  			 bri->sda_gpiod);
7c9ec2c5251851 Russell King 2020-05-13  1401  		return 0;
7c9ec2c5251851 Russell King 2020-05-13  1402  	}
7c9ec2c5251851 Russell King 2020-05-13  1403  
7c9ec2c5251851 Russell King 2020-05-13  1404  	bri->prepare_recovery = i2c_pxa_prepare_recovery;
7c9ec2c5251851 Russell King 2020-05-13  1405  	bri->unprepare_recovery = i2c_pxa_unprepare_recovery;
b3fd9db79e30d5 Robert Marko 2023-11-10  1406  	bri->recover_bus = i2c_generic_scl_recovery;
7c9ec2c5251851 Russell King 2020-05-13  1407  
7c9ec2c5251851 Russell King 2020-05-13  1408  	i2c->adap.bus_recovery_info = bri;
7c9ec2c5251851 Russell King 2020-05-13  1409  
b3fd9db79e30d5 Robert Marko 2023-11-10  1410  	/*
b3fd9db79e30d5 Robert Marko 2023-11-10  1411  	 * Claiming GPIOs can change the pinmux state, which confuses the
b3fd9db79e30d5 Robert Marko 2023-11-10  1412  	 * pinctrl since pinctrl's idea of the current setting is unaffected
b3fd9db79e30d5 Robert Marko 2023-11-10  1413  	 * by the pinmux change caused by claiming the GPIO. Work around that
b3fd9db79e30d5 Robert Marko 2023-11-10  1414  	 * by switching pinctrl to the GPIO state here. We do it this way to
b3fd9db79e30d5 Robert Marko 2023-11-10  1415  	 * avoid glitching the I2C bus.
b3fd9db79e30d5 Robert Marko 2023-11-10  1416  	 */
b3fd9db79e30d5 Robert Marko 2023-11-10  1417  	pinctrl_select_state(i2c->pinctrl, i2c->pinctrl_recovery);
b3fd9db79e30d5 Robert Marko 2023-11-10  1418  
b3fd9db79e30d5 Robert Marko 2023-11-10  1419  	return pinctrl_select_state(i2c->pinctrl, i2c->pinctrl_default);
7c9ec2c5251851 Russell King 2020-05-13  1420  }
7c9ec2c5251851 Russell King 2020-05-13  1421  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
