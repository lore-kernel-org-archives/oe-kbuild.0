Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88EA13C6608
	for <oe-kbuild@lists.linux.dev>; Thu,  7 May 2026 17:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778173285; cv=none; b=DJGT+LX/i9DQy3yK2z/hytp5ZosXWAMWXHAWQbZCNrE1+yIcJTmjiXyoboNmhnsRW1MfEf8FEr/1ieeBz6TOHRI4qFTHJLc6ZsGsKwOhdlKuXagN4BEY/2cvWXexafuKYnQGofuHSiqqdUSfPC8/xMReljeLBrg0J3ZZakZRQa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778173285; c=relaxed/simple;
	bh=4HY5p0lmDbjoshKX3Klm88nvc3zm9X+CT4ikxrmp3UQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fngNxKfNdWXQStjZ2zuSBE9xieEQ1BWu5F6NzWmqFYpQ4P2A+VEfrvrEOSj2u4QyC7bSg9UK6SEpHd5chxBQlA3GrQu9n3shucOG/QHQYqYQwwVdZGOW+NvbtEGJ505QgPYwTF0fTQpiackQ56Xwl/CGjlDE16o8QCdRoqasPnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fImwhsJG; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fImwhsJG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778173283; x=1809709283;
  h=date:from:to:cc:subject:message-id;
  bh=4HY5p0lmDbjoshKX3Klm88nvc3zm9X+CT4ikxrmp3UQ=;
  b=fImwhsJGpdAQQW5Glg6j2Mc7Ft3Nv9IJf59BNMK66JKl6hHKmzBdkV04
   t8//lkO2qyTGzCK2C+f8Kume2RHGl8G+Gv8kLQEZzJa+IDCwZxHJaLPZy
   wCK/j+3BTZqDZo0mOa1f5Oc+alMViAaBadKVIru31p+E7BWAzEOeQMv7f
   bzDH12rD02XlbH/f7PAEWHP4PJXmBaaugCyULdPl4sJF3xpmxpJood1SK
   SCD1GFjEmMVqc34FhJ6q4qOLhjmQMKT7iwDl/TRzIqci2ahw7/bb+nemf
   1vEk5ARwf5/kEVbooqIoAnhvzSVtUxtSr4wa/vWycZ2ASfohY7lrR6aHm
   g==;
X-CSE-ConnectionGUID: rc+mCxYJSnaJfKBOi1swNw==
X-CSE-MsgGUID: WxrOTpteTIiMMiyaQDFtjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="104591938"
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="104591938"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 10:01:23 -0700
X-CSE-ConnectionGUID: S3+uHg6tTwaJqBLK6Fc63A==
X-CSE-MsgGUID: MzI09RzdSHO+RXvDVRYTPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="240853775"
Received: from lkp-server01.sh.intel.com (HELO d6e19f2f5857) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 07 May 2026 10:01:22 -0700
Received: from kbuild by d6e19f2f5857 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wL26B-000000000JN-2FG1;
	Thu, 07 May 2026 17:01:19 +0000
Date: Fri, 08 May 2026 01:00:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [frank-w-bpi-r2-4.14:7.1-rc 127/157]
 drivers/net/dsa/mxl862xx/mxl862xx.c:4518:18: sparse: sparse: unsigned value
 that used to be signed checked against zero?
Message-ID: <202605080039.h5Cp2ehp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/net/dsa/mxl862xx/mxl862xx.c:4518:18: sparse: sparse: unsigned value that used to be signed checked against zero?"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Frank Wunderlich <frank-w@public-files.de>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.1-rc
head:   ce3735b05f8971cb2a88ba66c5df025751f12b10
commit: 8e531f9a7cd0bad533227122a736f8352499d480 [127/157] net: dsa: mxl862xx: add ds-mux (WIP)
:::::: branch date: 24 hours ago
:::::: commit date: 6 days ago
config: parisc-randconfig-r112-20260507 (https://download.01.org/0day-ci/archive/20260508/202605080039.h5Cp2ehp-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 11.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260508/202605080039.h5Cp2ehp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605080039.h5Cp2ehp-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/dsa/mxl862xx/mxl862xx.c:4518:18: sparse: sparse: unsigned value that used to be signed checked against zero?
   drivers/net/dsa/mxl862xx/mxl862xx.c: note: in included file (through include/linux/byteorder/big_endian.h, arch/parisc/include/uapi/asm/byteorder.h, include/linux/bitfield.h):
   include/uapi/linux/byteorder/big_endian.h:83:32: sparse: signed value source

vim +4518 drivers/net/dsa/mxl862xx/mxl862xx.c

8e531f9a7cd0ba Frank Wunderlich 2025-10-21  4503  
8e531f9a7cd0ba Frank Wunderlich 2025-10-21  4504  static int ds_add_mux(struct mxl862xx_priv *priv, struct device_node *np)
8e531f9a7cd0ba Frank Wunderlich 2025-10-21  4505  {
8e531f9a7cd0ba Frank Wunderlich 2025-10-21  4506  	const __be32 *_id = of_get_property(np, "reg", NULL);
8e531f9a7cd0ba Frank Wunderlich 2025-10-21  4507  	struct device_node *child;
8e531f9a7cd0ba Frank Wunderlich 2025-10-21  4508  	struct combo_port_mux *mux;
8e531f9a7cd0ba Frank Wunderlich 2025-10-21  4509  	unsigned int id;
8e531f9a7cd0ba Frank Wunderlich 2025-10-21  4510  	int err;
8e531f9a7cd0ba Frank Wunderlich 2025-10-21  4511  
8e531f9a7cd0ba Frank Wunderlich 2025-10-21  4512  	if (!_id) {
8e531f9a7cd0ba Frank Wunderlich 2025-10-21  4513  		dev_err(priv->ds->dev, "missing attach dp id\n");
8e531f9a7cd0ba Frank Wunderlich 2025-10-21  4514  		return -EINVAL;
8e531f9a7cd0ba Frank Wunderlich 2025-10-21  4515  	}
8e531f9a7cd0ba Frank Wunderlich 2025-10-21  4516  
8e531f9a7cd0ba Frank Wunderlich 2025-10-21  4517  	id = be32_to_cpup(_id);
8e531f9a7cd0ba Frank Wunderlich 2025-10-21 @4518  	if (id < 0 || id >= MXL862XX_MAX_PORTS) {
8e531f9a7cd0ba Frank Wunderlich 2025-10-21  4519  		dev_err(priv->ds->dev, "%d is not a valid attach dp id\n", id);
8e531f9a7cd0ba Frank Wunderlich 2025-10-21  4520  		return -EINVAL;
8e531f9a7cd0ba Frank Wunderlich 2025-10-21  4521  	}
8e531f9a7cd0ba Frank Wunderlich 2025-10-21  4522  
8e531f9a7cd0ba Frank Wunderlich 2025-10-21  4523  	mux = kmalloc(sizeof(struct combo_port_mux), GFP_KERNEL);
8e531f9a7cd0ba Frank Wunderlich 2025-10-21  4524  	if (unlikely(!mux)) {
8e531f9a7cd0ba Frank Wunderlich 2025-10-21  4525  		dev_err(priv->ds->dev, "failed to create mux structure\n");
8e531f9a7cd0ba Frank Wunderlich 2025-10-21  4526  		return -ENOMEM;
8e531f9a7cd0ba Frank Wunderlich 2025-10-21  4527  	}
8e531f9a7cd0ba Frank Wunderlich 2025-10-21  4528  
8e531f9a7cd0ba Frank Wunderlich 2025-10-21  4529  	mux->mod_def0_gpio = fwnode_gpiod_get_index(of_fwnode_handle(np),
8e531f9a7cd0ba Frank Wunderlich 2025-10-21  4530  				"mod-def0", 0, GPIOD_IN |
8e531f9a7cd0ba Frank Wunderlich 2025-10-21  4531  				GPIOD_FLAGS_BIT_NONEXCLUSIVE, "?");
8e531f9a7cd0ba Frank Wunderlich 2025-10-21  4532  
8e531f9a7cd0ba Frank Wunderlich 2025-10-21  4533  	if (IS_ERR(mux->mod_def0_gpio)) {
8e531f9a7cd0ba Frank Wunderlich 2025-10-21  4534  		dev_err(priv->ds->dev, "failed to requset gpio for mod-def0\n");
8e531f9a7cd0ba Frank Wunderlich 2025-10-21  4535  		err = PTR_ERR(mux->mod_def0_gpio);
8e531f9a7cd0ba Frank Wunderlich 2025-10-21  4536  		goto err_free_mux;
8e531f9a7cd0ba Frank Wunderlich 2025-10-21  4537  	}
8e531f9a7cd0ba Frank Wunderlich 2025-10-21  4538  
8e531f9a7cd0ba Frank Wunderlich 2025-10-21  4539  	mux->chan_sel_gpio = fwnode_gpiod_get_index(of_fwnode_handle(np),
8e531f9a7cd0ba Frank Wunderlich 2025-10-21  4540  				"chan-sel", 0, GPIOD_OUT_LOW, "?");
8e531f9a7cd0ba Frank Wunderlich 2025-10-21  4541  
8e531f9a7cd0ba Frank Wunderlich 2025-10-21  4542  	if (IS_ERR(mux->chan_sel_gpio)) {
8e531f9a7cd0ba Frank Wunderlich 2025-10-21  4543  		dev_err(priv->ds->dev, "failed to requset gpio for chan-sel\n");
8e531f9a7cd0ba Frank Wunderlich 2025-10-21  4544  		err = PTR_ERR(mux->chan_sel_gpio);
8e531f9a7cd0ba Frank Wunderlich 2025-10-21  4545  		goto err_put_mod_def0;
8e531f9a7cd0ba Frank Wunderlich 2025-10-21  4546  	}
8e531f9a7cd0ba Frank Wunderlich 2025-10-21  4547  
8e531f9a7cd0ba Frank Wunderlich 2025-10-21  4548  	of_property_read_u32(np, "sfp-present-channel",
8e531f9a7cd0ba Frank Wunderlich 2025-10-21  4549  		&mux->sfp_present_channel);
8e531f9a7cd0ba Frank Wunderlich 2025-10-21  4550  
8e531f9a7cd0ba Frank Wunderlich 2025-10-21  4551  	priv->ds_mux[id] = mux;
8e531f9a7cd0ba Frank Wunderlich 2025-10-21  4552  	mux->dp = dsa_to_port(priv->ds, id);
8e531f9a7cd0ba Frank Wunderlich 2025-10-21  4553  	/* configure default channel to 10G PHY */
8e531f9a7cd0ba Frank Wunderlich 2025-10-21  4554  	mux->channel = !mux->sfp_present_channel;
8e531f9a7cd0ba Frank Wunderlich 2025-10-21  4555  	mux->initialized = false;
8e531f9a7cd0ba Frank Wunderlich 2025-10-21  4556  
8e531f9a7cd0ba Frank Wunderlich 2025-10-21  4557  	for_each_child_of_node(np, child) {
8e531f9a7cd0ba Frank Wunderlich 2025-10-21  4558  		err = ds_add_mux_channel(mux, child);
8e531f9a7cd0ba Frank Wunderlich 2025-10-21  4559  		if (err) {
8e531f9a7cd0ba Frank Wunderlich 2025-10-21  4560  			dev_err(priv->ds->dev, "failed to add ds_mux\n");
8e531f9a7cd0ba Frank Wunderlich 2025-10-21  4561  			of_node_put(child);
8e531f9a7cd0ba Frank Wunderlich 2025-10-21  4562  			goto err_put_chan_sel;
8e531f9a7cd0ba Frank Wunderlich 2025-10-21  4563  		}
8e531f9a7cd0ba Frank Wunderlich 2025-10-21  4564  	}
8e531f9a7cd0ba Frank Wunderlich 2025-10-21  4565  
8e531f9a7cd0ba Frank Wunderlich 2025-10-21  4566  	INIT_DELAYED_WORK(&mux->sfp_monitor_work, sfp_monitor_work_func);
8e531f9a7cd0ba Frank Wunderlich 2025-10-21  4567  	mod_delayed_work(system_wq, &mux->sfp_monitor_work, msecs_to_jiffies(3000));
8e531f9a7cd0ba Frank Wunderlich 2025-10-21  4568  
8e531f9a7cd0ba Frank Wunderlich 2025-10-21  4569  	return 0;
8e531f9a7cd0ba Frank Wunderlich 2025-10-21  4570  
8e531f9a7cd0ba Frank Wunderlich 2025-10-21  4571  err_put_chan_sel:
8e531f9a7cd0ba Frank Wunderlich 2025-10-21  4572  	gpiod_put(mux->chan_sel_gpio);
8e531f9a7cd0ba Frank Wunderlich 2025-10-21  4573  err_put_mod_def0:
8e531f9a7cd0ba Frank Wunderlich 2025-10-21  4574  	gpiod_put(mux->mod_def0_gpio);
8e531f9a7cd0ba Frank Wunderlich 2025-10-21  4575  err_free_mux:
8e531f9a7cd0ba Frank Wunderlich 2025-10-21  4576  	kfree(mux);
8e531f9a7cd0ba Frank Wunderlich 2025-10-21  4577  	priv->ds_mux[id] = NULL;
8e531f9a7cd0ba Frank Wunderlich 2025-10-21  4578  	return err;
8e531f9a7cd0ba Frank Wunderlich 2025-10-21  4579  }
8e531f9a7cd0ba Frank Wunderlich 2025-10-21  4580  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
