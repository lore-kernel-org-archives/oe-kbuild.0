Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7DCB27453
	for <oe-kbuild@lists.linux.dev>; Sat,  6 Jun 2026 04:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780720109; cv=none; b=rjZhCfwqX64iQylO9FiFKffeu/tYXwjPmYd1p4tmqFHsxvrYV3usnxd8QfVo9KLjgpNOzsfb0h/RE//+MWQx4b6M58aKlCTnGounZvMKN4pYFa1g2sUIrrDOSjYKu60HdOu0iw2+/aIcw18nZvdqj98Ku4cKzO4jJItKITXkI4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780720109; c=relaxed/simple;
	bh=2sTVwu8hX5HCor6YG9zDQUK1qTFwX7khGoD6snZzkJQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cj3+VCIVovOIyf41BG6tX7Vxeq0+x4Sud3P6AlkQPDyiUp+CNfhDrS1g63oBhnLMG6652s+GAsNTEo4TZ6Xkn9qR2BF6zUn+1wZbe8jtg1E2cUP1jRda0gc+HiyRPQGCZD8ifMFVcV0gNTAo9gvIY2H2nJn7AqFDgQVZF2rZfw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KxmZRHqW; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KxmZRHqW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780720108; x=1812256108;
  h=date:from:to:cc:subject:message-id;
  bh=2sTVwu8hX5HCor6YG9zDQUK1qTFwX7khGoD6snZzkJQ=;
  b=KxmZRHqWtjBTl+0/eL1+NK9mNwj3l54u6I67/Bag8BvTYRxe7xOCOs9u
   h6vCb0ePwyvqjWORV5Nl+aI0M9rowPCG1aqcqkrQWblXWsH6wS0+u1ZUS
   4luIGCwNeR60y/mCc+hm9oOaw80bvIcC/wtAUz8UdY5eQShfJkwQfhELU
   tLVjWAhVvQGA0V7qfh79NMTyZeIR+AFBTHhdVvUM0lk4RgbRYa6yBV8Jp
   Gb7q9EAdMnGVodo139HReWBv7pA/MV9Y+8I/gLRz0Dljt0Fyd2pK6GB5I
   lZqPBpgk6K9RYf7Eow0ey+PC05aULicnyDD4IXDLAyc1NJq1tTu4tNi7a
   Q==;
X-CSE-ConnectionGUID: A3BMnfimSQeEtgZAq6NrVQ==
X-CSE-MsgGUID: rGIG3sJAQcygO+BUoSZNeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11808"; a="92231472"
X-IronPort-AV: E=Sophos;i="6.24,190,1774335600"; 
   d="scan'208";a="92231472"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2026 21:28:27 -0700
X-CSE-ConnectionGUID: 35AV+RvxQj+lse7hscJsRQ==
X-CSE-MsgGUID: H6N6a4dCSeSWAC2eCfth1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,190,1774335600"; 
   d="scan'208";a="250116885"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 05 Jun 2026 21:28:26 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wVidz-00000000Gk8-2jhg;
	Sat, 06 Jun 2026 04:28:23 +0000
Date: Sat, 06 Jun 2026 12:27:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/edac/versalnet_edac.c:785 init_one_mc() error:
 buffer overflow 'priv->adec' 152 <= s32max
Message-ID: <202606061200.j14yIFYw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
CC: "Borislav Petkov (AMD)" <bp@alien8.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8e65320d91cdc3b241d4b94855c88459b91abf66
commit: 62a9fc50e8d947601ea3484e732b1a65a0a54b96 EDAC/versalnet: Refactor memory controller initialization and cleanup
date:   3 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 3 months ago
config: arm64-randconfig-r072-20260606 (https://download.01.org/0day-ci/archive/20260606/202606061200.j14yIFYw-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 62a9fc50e8d9 ("EDAC/versalnet: Refactor memory controller initialization and cleanup")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202606061200.j14yIFYw-lkp@intel.com/

smatch warnings:
drivers/edac/versalnet_edac.c:785 init_one_mc() error: buffer overflow 'priv->adec' 152 <= s32max

vim +785 drivers/edac/versalnet_edac.c

62a9fc50e8d947 Shubhrajyoti Datta 2025-11-04  774  
62a9fc50e8d947 Shubhrajyoti Datta 2025-11-04  775  static int init_one_mc(struct mc_priv *priv, struct platform_device *pdev, int i)
d5fe2fec6c40dd Shubhrajyoti Datta 2025-09-08  776  {
d5fe2fec6c40dd Shubhrajyoti Datta 2025-09-08  777  	u32 num_chans, rank, dwidth, config;
d5fe2fec6c40dd Shubhrajyoti Datta 2025-09-08  778  	struct edac_mc_layer layers[2];
d5fe2fec6c40dd Shubhrajyoti Datta 2025-09-08  779  	struct mem_ctl_info *mci;
d5fe2fec6c40dd Shubhrajyoti Datta 2025-09-08  780  	struct device *dev;
d5fe2fec6c40dd Shubhrajyoti Datta 2025-09-08  781  	enum dev_type dt;
d5fe2fec6c40dd Shubhrajyoti Datta 2025-09-08  782  	char *name;
62a9fc50e8d947 Shubhrajyoti Datta 2025-11-04  783  	int rc;
d5fe2fec6c40dd Shubhrajyoti Datta 2025-09-08  784  
d5fe2fec6c40dd Shubhrajyoti Datta 2025-09-08 @785  	config = priv->adec[CONF + i * ADEC_NUM];
d5fe2fec6c40dd Shubhrajyoti Datta 2025-09-08  786  	num_chans = FIELD_GET(MC5_NUM_CHANS_MASK, config);
d5fe2fec6c40dd Shubhrajyoti Datta 2025-09-08  787  	rank = 1 << FIELD_GET(MC5_RANK_MASK, config);
d5fe2fec6c40dd Shubhrajyoti Datta 2025-09-08  788  	dwidth = FIELD_GET(MC5_BUS_WIDTH_MASK, config);
d5fe2fec6c40dd Shubhrajyoti Datta 2025-09-08  789  
d5fe2fec6c40dd Shubhrajyoti Datta 2025-09-08  790  	switch (dwidth) {
d5fe2fec6c40dd Shubhrajyoti Datta 2025-09-08  791  	case XDDR5_BUS_WIDTH_16:
d5fe2fec6c40dd Shubhrajyoti Datta 2025-09-08  792  		dt = DEV_X16;
d5fe2fec6c40dd Shubhrajyoti Datta 2025-09-08  793  		break;
d5fe2fec6c40dd Shubhrajyoti Datta 2025-09-08  794  	case XDDR5_BUS_WIDTH_32:
d5fe2fec6c40dd Shubhrajyoti Datta 2025-09-08  795  		dt = DEV_X32;
d5fe2fec6c40dd Shubhrajyoti Datta 2025-09-08  796  		break;
d5fe2fec6c40dd Shubhrajyoti Datta 2025-09-08  797  	case XDDR5_BUS_WIDTH_64:
d5fe2fec6c40dd Shubhrajyoti Datta 2025-09-08  798  		dt = DEV_X64;
d5fe2fec6c40dd Shubhrajyoti Datta 2025-09-08  799  		break;
d5fe2fec6c40dd Shubhrajyoti Datta 2025-09-08  800  	default:
d5fe2fec6c40dd Shubhrajyoti Datta 2025-09-08  801  		dt = DEV_UNKNOWN;
d5fe2fec6c40dd Shubhrajyoti Datta 2025-09-08  802  	}
d5fe2fec6c40dd Shubhrajyoti Datta 2025-09-08  803  
d5fe2fec6c40dd Shubhrajyoti Datta 2025-09-08  804  	if (dt == DEV_UNKNOWN)
62a9fc50e8d947 Shubhrajyoti Datta 2025-11-04  805  		return 0;
d5fe2fec6c40dd Shubhrajyoti Datta 2025-09-08  806  
d5fe2fec6c40dd Shubhrajyoti Datta 2025-09-08  807  	/* Find the first enabled device and register that one. */
d5fe2fec6c40dd Shubhrajyoti Datta 2025-09-08  808  	layers[0].type = EDAC_MC_LAYER_CHIP_SELECT;
d5fe2fec6c40dd Shubhrajyoti Datta 2025-09-08  809  	layers[0].size = rank;
d5fe2fec6c40dd Shubhrajyoti Datta 2025-09-08  810  	layers[0].is_virt_csrow = true;
d5fe2fec6c40dd Shubhrajyoti Datta 2025-09-08  811  	layers[1].type = EDAC_MC_LAYER_CHANNEL;
d5fe2fec6c40dd Shubhrajyoti Datta 2025-09-08  812  	layers[1].size = num_chans;
d5fe2fec6c40dd Shubhrajyoti Datta 2025-09-08  813  	layers[1].is_virt_csrow = false;
d5fe2fec6c40dd Shubhrajyoti Datta 2025-09-08  814  
d5fe2fec6c40dd Shubhrajyoti Datta 2025-09-08  815  	rc = -ENOMEM;
62a9fc50e8d947 Shubhrajyoti Datta 2025-11-04  816  	name = kzalloc(MC_NAME_LEN, GFP_KERNEL);
62a9fc50e8d947 Shubhrajyoti Datta 2025-11-04  817  	if (!name)
62a9fc50e8d947 Shubhrajyoti Datta 2025-11-04  818  		return rc;
62a9fc50e8d947 Shubhrajyoti Datta 2025-11-04  819  
62a9fc50e8d947 Shubhrajyoti Datta 2025-11-04  820  	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
62a9fc50e8d947 Shubhrajyoti Datta 2025-11-04  821  	if (!dev)
62a9fc50e8d947 Shubhrajyoti Datta 2025-11-04  822  		goto err_name_free;
62a9fc50e8d947 Shubhrajyoti Datta 2025-11-04  823  
62a9fc50e8d947 Shubhrajyoti Datta 2025-11-04  824  	mci = edac_mc_alloc(i, ARRAY_SIZE(layers), layers, sizeof(struct mc_priv));
d5fe2fec6c40dd Shubhrajyoti Datta 2025-09-08  825  	if (!mci) {
d5fe2fec6c40dd Shubhrajyoti Datta 2025-09-08  826  		edac_printk(KERN_ERR, EDAC_MC, "Failed memory allocation for MC%d\n", i);
62a9fc50e8d947 Shubhrajyoti Datta 2025-11-04  827  		goto err_dev_free;
d5fe2fec6c40dd Shubhrajyoti Datta 2025-09-08  828  	}
d5fe2fec6c40dd Shubhrajyoti Datta 2025-09-08  829  
d5fe2fec6c40dd Shubhrajyoti Datta 2025-09-08  830  	sprintf(name, "versal-net-ddrmc5-edac-%d", i);
62a9fc50e8d947 Shubhrajyoti Datta 2025-11-04  831  
d5fe2fec6c40dd Shubhrajyoti Datta 2025-09-08  832  	dev->init_name = name;
62a9fc50e8d947 Shubhrajyoti Datta 2025-11-04  833  	dev->release = versal_edac_release;
62a9fc50e8d947 Shubhrajyoti Datta 2025-11-04  834  
d5fe2fec6c40dd Shubhrajyoti Datta 2025-09-08  835  	rc = device_register(dev);
d5fe2fec6c40dd Shubhrajyoti Datta 2025-09-08  836  	if (rc)
62a9fc50e8d947 Shubhrajyoti Datta 2025-11-04  837  		goto err_mc_free;
d5fe2fec6c40dd Shubhrajyoti Datta 2025-09-08  838  
d5fe2fec6c40dd Shubhrajyoti Datta 2025-09-08  839  	mci->pdev = dev;
d5fe2fec6c40dd Shubhrajyoti Datta 2025-09-08  840  	mc_init(mci, dev);
62a9fc50e8d947 Shubhrajyoti Datta 2025-11-04  841  
d5fe2fec6c40dd Shubhrajyoti Datta 2025-09-08  842  	rc = edac_mc_add_mc(mci);
d5fe2fec6c40dd Shubhrajyoti Datta 2025-09-08  843  	if (rc) {
d5fe2fec6c40dd Shubhrajyoti Datta 2025-09-08  844  		edac_printk(KERN_ERR, EDAC_MC, "Failed to register MC%d with EDAC core\n", i);
62a9fc50e8d947 Shubhrajyoti Datta 2025-11-04  845  		goto err_unreg;
d5fe2fec6c40dd Shubhrajyoti Datta 2025-09-08  846  	}
d5fe2fec6c40dd Shubhrajyoti Datta 2025-09-08  847  
62a9fc50e8d947 Shubhrajyoti Datta 2025-11-04  848  	priv->mci[i] = mci;
62a9fc50e8d947 Shubhrajyoti Datta 2025-11-04  849  	priv->dwidth = dt;
d5fe2fec6c40dd Shubhrajyoti Datta 2025-09-08  850  
62a9fc50e8d947 Shubhrajyoti Datta 2025-11-04  851  	platform_set_drvdata(pdev, priv);
d5fe2fec6c40dd Shubhrajyoti Datta 2025-09-08  852  
62a9fc50e8d947 Shubhrajyoti Datta 2025-11-04  853  	return 0;
62a9fc50e8d947 Shubhrajyoti Datta 2025-11-04  854  
62a9fc50e8d947 Shubhrajyoti Datta 2025-11-04  855  err_unreg:
62a9fc50e8d947 Shubhrajyoti Datta 2025-11-04  856  	device_unregister(mci->pdev);
62a9fc50e8d947 Shubhrajyoti Datta 2025-11-04  857  err_mc_free:
d5fe2fec6c40dd Shubhrajyoti Datta 2025-09-08  858  	edac_mc_free(mci);
62a9fc50e8d947 Shubhrajyoti Datta 2025-11-04  859  err_dev_free:
62a9fc50e8d947 Shubhrajyoti Datta 2025-11-04  860  	kfree(dev);
62a9fc50e8d947 Shubhrajyoti Datta 2025-11-04  861  err_name_free:
62a9fc50e8d947 Shubhrajyoti Datta 2025-11-04  862  	kfree(name);
d5fe2fec6c40dd Shubhrajyoti Datta 2025-09-08  863  
d5fe2fec6c40dd Shubhrajyoti Datta 2025-09-08  864  	return rc;
d5fe2fec6c40dd Shubhrajyoti Datta 2025-09-08  865  }
d5fe2fec6c40dd Shubhrajyoti Datta 2025-09-08  866  

:::::: The code at line 785 was first introduced by commit
:::::: d5fe2fec6c40dda03df8cc9b4a97de0b7e39f984 EDAC: Add a driver for the AMD Versal NET DDR controller

:::::: TO: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
:::::: CC: Borislav Petkov (AMD) <bp@alien8.de>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
