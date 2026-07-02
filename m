Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90BD4548EE
	for <oe-kbuild@lists.linux.dev>; Thu,  2 Jul 2026 09:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782983325; cv=none; b=NLRuwA7wnmjNDuQ5HGR3J8h8ZdlFqKX8dm0qm4x59EZerIn1N+5OVBGeprp1bOZCqLGLTPuZOvs4WB8y6eepP3MX6armaAgE46G/zuPHqLmSzwptMOOGLhhszGRnqHzYIEkdcNivpzTxcGk5DaufTuC8TsFPH9Y3sREm2jiN0ME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782983325; c=relaxed/simple;
	bh=I3pX+7x6hfIBJwDiqqFp5+q7PSvkoMpYDr4qefH7Lyc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=T0UOGEB/ap6Nzj9heqJWJwmcnNYb18DLKET/Gl+kaBEAoUsr/XAtlKuEG0Yhy6M7uyyLvD7FOjDBH+E05lH9gOSGgyf5yCoY2QsmPD90zq4YOP0y/7/BgmsZLwiNiwegJYgC+SfcVS+23ItalNuZanhwGKKEPIGOdoOB3Mrvwfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nIL8PGY3; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nIL8PGY3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782983323; x=1814519323;
  h=date:from:to:cc:subject:message-id;
  bh=I3pX+7x6hfIBJwDiqqFp5+q7PSvkoMpYDr4qefH7Lyc=;
  b=nIL8PGY3UH6myDb7tZeigybj6r+XaKrmjhRqQw0d7nOkM7dI/lJYB/AS
   AOZFq+Ml1PX+v8SnOEQ09d9VLWMNGSoB8YPmra5NNZMaSiGcpSFqv6Hkz
   46Nk35uLb3goLos+zVuNtjbOoN+I951odonzlMmpOQq7S++i6xseniYcR
   KKgrA8yacBCYW6AesvOxnGPTk7tAH1BdLoR+6GYxVGc1pi+nlCV5CdrOh
   J2/32nPfCAiK4MtIeG7kHlq8KMJgKl4iPgvgySW4XOu+7oxIUyMgZpGzN
   t/LoAjJ2/VTl3ZSKUsBPdoYvo6URdEuJErTCvzRTwDQbYAGavt0eg3XLR
   A==;
X-CSE-ConnectionGUID: jAYmdo5vSuW4l6dAt2mR0g==
X-CSE-MsgGUID: upNwizs6TNOvP3SWK2Ri6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="83762567"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="83762567"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 02:08:43 -0700
X-CSE-ConnectionGUID: UfcE07kmR8GKSuA6VJ9esQ==
X-CSE-MsgGUID: ZmO/woAHRI+d2RFyl1EDww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="282890861"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 02 Jul 2026 02:08:42 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfDPH-00000000AZy-0OKE;
	Thu, 02 Jul 2026 09:08:28 +0000
Date: Thu, 02 Jul 2026 17:07:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [frank-w-bpi-r2-4.14:pr/187 1/1]
 drivers/net/dsa/mxl862xx/mxl862xx.c:4518:18: sparse: sparse: unsigned value
 that used to be signed checked against zero?
Message-ID: <202607021748.WP492e0Y-lkp@intel.com>
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

tree:   https://github.com/frank-w/BPI-R2-4.14 pr/187
head:   3591b14936035fc6eaa4ffb659d63289367e34d4
commit: 577f2ee0515d84bb0aa78dbe0d3b3b1fe4d2658d [1/1] net: dsa: mxl862xx: add ds-mux (WIP)
:::::: branch date: 4 days ago
:::::: commit date: 5 days ago
config: sparc64-randconfig-r121-20260702 (https://download.01.org/0day-ci/archive/20260702/202607021748.WP492e0Y-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260702/202607021748.WP492e0Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607021748.WP492e0Y-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/dsa/mxl862xx/mxl862xx.c:4518:18: sparse: sparse: unsigned value that used to be signed checked against zero?
   drivers/net/dsa/mxl862xx/mxl862xx.c: note: in included file (through include/linux/byteorder/big_endian.h, arch/sparc/include/uapi/asm/byteorder.h, include/linux/bitfield.h):
   include/uapi/linux/byteorder/big_endian.h:83:32: sparse: signed value source

vim +4518 drivers/net/dsa/mxl862xx/mxl862xx.c

577f2ee0515d84 Frank Wunderlich 2025-10-21  4503  
577f2ee0515d84 Frank Wunderlich 2025-10-21  4504  static int ds_add_mux(struct mxl862xx_priv *priv, struct device_node *np)
577f2ee0515d84 Frank Wunderlich 2025-10-21  4505  {
577f2ee0515d84 Frank Wunderlich 2025-10-21  4506  	const __be32 *_id = of_get_property(np, "reg", NULL);
577f2ee0515d84 Frank Wunderlich 2025-10-21  4507  	struct device_node *child;
577f2ee0515d84 Frank Wunderlich 2025-10-21  4508  	struct combo_port_mux *mux;
577f2ee0515d84 Frank Wunderlich 2025-10-21  4509  	unsigned int id;
577f2ee0515d84 Frank Wunderlich 2025-10-21  4510  	int err;
577f2ee0515d84 Frank Wunderlich 2025-10-21  4511  
577f2ee0515d84 Frank Wunderlich 2025-10-21  4512  	if (!_id) {
577f2ee0515d84 Frank Wunderlich 2025-10-21  4513  		dev_err(priv->ds->dev, "missing attach dp id\n");
577f2ee0515d84 Frank Wunderlich 2025-10-21  4514  		return -EINVAL;
577f2ee0515d84 Frank Wunderlich 2025-10-21  4515  	}
577f2ee0515d84 Frank Wunderlich 2025-10-21  4516  
577f2ee0515d84 Frank Wunderlich 2025-10-21  4517  	id = be32_to_cpup(_id);
577f2ee0515d84 Frank Wunderlich 2025-10-21 @4518  	if (id < 0 || id >= MXL862XX_MAX_PORTS) {
577f2ee0515d84 Frank Wunderlich 2025-10-21  4519  		dev_err(priv->ds->dev, "%d is not a valid attach dp id\n", id);
577f2ee0515d84 Frank Wunderlich 2025-10-21  4520  		return -EINVAL;
577f2ee0515d84 Frank Wunderlich 2025-10-21  4521  	}
577f2ee0515d84 Frank Wunderlich 2025-10-21  4522  
577f2ee0515d84 Frank Wunderlich 2025-10-21  4523  	mux = kmalloc(sizeof(struct combo_port_mux), GFP_KERNEL);
577f2ee0515d84 Frank Wunderlich 2025-10-21  4524  	if (unlikely(!mux)) {
577f2ee0515d84 Frank Wunderlich 2025-10-21  4525  		dev_err(priv->ds->dev, "failed to create mux structure\n");
577f2ee0515d84 Frank Wunderlich 2025-10-21  4526  		return -ENOMEM;
577f2ee0515d84 Frank Wunderlich 2025-10-21  4527  	}
577f2ee0515d84 Frank Wunderlich 2025-10-21  4528  
577f2ee0515d84 Frank Wunderlich 2025-10-21  4529  	mux->mod_def0_gpio = fwnode_gpiod_get_index(of_fwnode_handle(np),
577f2ee0515d84 Frank Wunderlich 2025-10-21  4530  				"mod-def0", 0, GPIOD_IN |
577f2ee0515d84 Frank Wunderlich 2025-10-21  4531  				GPIOD_FLAGS_BIT_NONEXCLUSIVE, "?");
577f2ee0515d84 Frank Wunderlich 2025-10-21  4532  
577f2ee0515d84 Frank Wunderlich 2025-10-21  4533  	if (IS_ERR(mux->mod_def0_gpio)) {
577f2ee0515d84 Frank Wunderlich 2025-10-21  4534  		dev_err(priv->ds->dev, "failed to requset gpio for mod-def0\n");
577f2ee0515d84 Frank Wunderlich 2025-10-21  4535  		err = PTR_ERR(mux->mod_def0_gpio);
577f2ee0515d84 Frank Wunderlich 2025-10-21  4536  		goto err_free_mux;
577f2ee0515d84 Frank Wunderlich 2025-10-21  4537  	}
577f2ee0515d84 Frank Wunderlich 2025-10-21  4538  
577f2ee0515d84 Frank Wunderlich 2025-10-21  4539  	mux->chan_sel_gpio = fwnode_gpiod_get_index(of_fwnode_handle(np),
577f2ee0515d84 Frank Wunderlich 2025-10-21  4540  				"chan-sel", 0, GPIOD_OUT_LOW, "?");
577f2ee0515d84 Frank Wunderlich 2025-10-21  4541  
577f2ee0515d84 Frank Wunderlich 2025-10-21  4542  	if (IS_ERR(mux->chan_sel_gpio)) {
577f2ee0515d84 Frank Wunderlich 2025-10-21  4543  		dev_err(priv->ds->dev, "failed to requset gpio for chan-sel\n");
577f2ee0515d84 Frank Wunderlich 2025-10-21  4544  		err = PTR_ERR(mux->chan_sel_gpio);
577f2ee0515d84 Frank Wunderlich 2025-10-21  4545  		goto err_put_mod_def0;
577f2ee0515d84 Frank Wunderlich 2025-10-21  4546  	}
577f2ee0515d84 Frank Wunderlich 2025-10-21  4547  
577f2ee0515d84 Frank Wunderlich 2025-10-21  4548  	of_property_read_u32(np, "sfp-present-channel",
577f2ee0515d84 Frank Wunderlich 2025-10-21  4549  		&mux->sfp_present_channel);
577f2ee0515d84 Frank Wunderlich 2025-10-21  4550  
577f2ee0515d84 Frank Wunderlich 2025-10-21  4551  	priv->ds_mux[id] = mux;
577f2ee0515d84 Frank Wunderlich 2025-10-21  4552  	mux->dp = dsa_to_port(priv->ds, id);
577f2ee0515d84 Frank Wunderlich 2025-10-21  4553  	/* configure default channel to 10G PHY */
577f2ee0515d84 Frank Wunderlich 2025-10-21  4554  	mux->channel = !mux->sfp_present_channel;
577f2ee0515d84 Frank Wunderlich 2025-10-21  4555  	mux->initialized = false;
577f2ee0515d84 Frank Wunderlich 2025-10-21  4556  
577f2ee0515d84 Frank Wunderlich 2025-10-21  4557  	for_each_child_of_node(np, child) {
577f2ee0515d84 Frank Wunderlich 2025-10-21  4558  		err = ds_add_mux_channel(mux, child);
577f2ee0515d84 Frank Wunderlich 2025-10-21  4559  		if (err) {
577f2ee0515d84 Frank Wunderlich 2025-10-21  4560  			dev_err(priv->ds->dev, "failed to add ds_mux\n");
577f2ee0515d84 Frank Wunderlich 2025-10-21  4561  			of_node_put(child);
577f2ee0515d84 Frank Wunderlich 2025-10-21  4562  			goto err_put_chan_sel;
577f2ee0515d84 Frank Wunderlich 2025-10-21  4563  		}
577f2ee0515d84 Frank Wunderlich 2025-10-21  4564  	}
577f2ee0515d84 Frank Wunderlich 2025-10-21  4565  
577f2ee0515d84 Frank Wunderlich 2025-10-21  4566  	INIT_DELAYED_WORK(&mux->sfp_monitor_work, sfp_monitor_work_func);
577f2ee0515d84 Frank Wunderlich 2025-10-21  4567  	mod_delayed_work(system_wq, &mux->sfp_monitor_work, msecs_to_jiffies(3000));
577f2ee0515d84 Frank Wunderlich 2025-10-21  4568  
577f2ee0515d84 Frank Wunderlich 2025-10-21  4569  	return 0;
577f2ee0515d84 Frank Wunderlich 2025-10-21  4570  
577f2ee0515d84 Frank Wunderlich 2025-10-21  4571  err_put_chan_sel:
577f2ee0515d84 Frank Wunderlich 2025-10-21  4572  	gpiod_put(mux->chan_sel_gpio);
577f2ee0515d84 Frank Wunderlich 2025-10-21  4573  err_put_mod_def0:
577f2ee0515d84 Frank Wunderlich 2025-10-21  4574  	gpiod_put(mux->mod_def0_gpio);
577f2ee0515d84 Frank Wunderlich 2025-10-21  4575  err_free_mux:
577f2ee0515d84 Frank Wunderlich 2025-10-21  4576  	kfree(mux);
577f2ee0515d84 Frank Wunderlich 2025-10-21  4577  	priv->ds_mux[id] = NULL;
577f2ee0515d84 Frank Wunderlich 2025-10-21  4578  	return err;
577f2ee0515d84 Frank Wunderlich 2025-10-21  4579  }
577f2ee0515d84 Frank Wunderlich 2025-10-21  4580  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
