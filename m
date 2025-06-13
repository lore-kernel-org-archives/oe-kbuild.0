Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 756C9275AE6
	for <oe-kbuild@lists.linux.dev>; Fri, 13 Jun 2025 11:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749815913; cv=none; b=NrBd7KexCOZupVMhYhZjFmhT5JmcOoXxYe9M6kLP0I2SJGJJFYF7xU2lMMiS2pdmbrgHVC7PCD/rEznUbpAKG91BIr3DMhBdjyKgFB5pkOL5MsUb+Xki5pVvrqIOcIEcEnbTI/FOZF6Duc2H3wlkO5pba5qOo0VFf8aRlGY5KFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749815913; c=relaxed/simple;
	bh=ufbrXaQ0dPHxtmpk+fB2U9OYPZ4LlOmhY/upJ3QWVZ4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nU2XR4Wu77g7FMXaXABwCmEZ86jyu4S5KZ7d5iqzBZyRX6jFZh7RqQMv4FevP3yxHcaAHxMl0mcH84F7CE2ICxP0V8UGTH9yxrTbmxF3T/Ngc5JfmblV1GnPANZsHiuJ4F2cebLVG96KpGMdSRHztQTzhNbKJvEhaadPhh5nL/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H5bzNa0v; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H5bzNa0v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749815911; x=1781351911;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ufbrXaQ0dPHxtmpk+fB2U9OYPZ4LlOmhY/upJ3QWVZ4=;
  b=H5bzNa0vPbPYtD5P7knkEQ2qnl2iWt469bS+Oa04J/8mgqOkvQYkQm3/
   VELw+3pld2t7qAV+n4VTEyM7vC/SXuU/klGiPYf7xbBr82vXen8UwB9jL
   Y8xgpJCWM8p+8vJ0huE5gaN0+KJeu/KO2nv6f4jewvvXMjJF/f+2/UjWN
   WBErgs0tUejHFa2O23D9NAYzBqcW66uCqScnBNW1T2VOXifqUrhHzPSC5
   xNhjU2oBfO3LT9D+IpNrQQIRKObI/WvyC+SYf7aPs4SGbXer8ts+KPmVY
   UKuNWxEYQCbrZqmQoLSdS4n7WuhhEKb25o2HQC7cjSzcDHw/ujmdq2CFM
   g==;
X-CSE-ConnectionGUID: +GuAiKE3TeW/7953UnRUrQ==
X-CSE-MsgGUID: R6EXphxjRO+NtbACzEn/HQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="55701197"
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; 
   d="scan'208";a="55701197"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2025 04:58:31 -0700
X-CSE-ConnectionGUID: UCdAs5vpR92H+8+U6AXSJw==
X-CSE-MsgGUID: +sM9QXwtRW2aNgoCAyi7Ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; 
   d="scan'208";a="147712568"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 13 Jun 2025 04:58:28 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uQ33D-000CZG-1k;
	Fri, 13 Jun 2025 11:58:27 +0000
Date: Fri, 13 Jun 2025 19:58:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [robh:dt/memory-region 2/17] drivers/remoteproc/ti_k3_common.c:522
 k3_reserved_mem_init() error: uninitialized symbol 'rmem'.
Message-ID: <202506131936.YWTiF0TB-lkp@intel.com>
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
TO: "Rob Herring (Arm)" <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt/memory-region
head:   acb6a336a64dc26032171de30a4d43a25aa88284
commit: ad8112ef27e513573350ff33dfc28c2796c294ec [2/17] remoteproc: Use of_reserved_mem_region_* functions for "memory-region"
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: openrisc-randconfig-r072-20250613 (https://download.01.org/0day-ci/archive/20250613/202506131936.YWTiF0TB-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 10.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202506131936.YWTiF0TB-lkp@intel.com/

smatch warnings:
drivers/remoteproc/ti_k3_common.c:522 k3_reserved_mem_init() error: uninitialized symbol 'rmem'.

vim +/rmem +522 drivers/remoteproc/ti_k3_common.c

744270b336c70b Beleswar Padhi    2025-05-13  471  
c52d5f1d2aaca1 Beleswar Padhi    2025-05-13  472  int k3_reserved_mem_init(struct k3_rproc *kproc)
c52d5f1d2aaca1 Beleswar Padhi    2025-05-13  473  {
c52d5f1d2aaca1 Beleswar Padhi    2025-05-13  474  	struct device *dev = kproc->dev;
c52d5f1d2aaca1 Beleswar Padhi    2025-05-13  475  	struct device_node *np = dev->of_node;
c52d5f1d2aaca1 Beleswar Padhi    2025-05-13  476  	struct device_node *rmem_np;
c52d5f1d2aaca1 Beleswar Padhi    2025-05-13  477  	struct reserved_mem *rmem;
c52d5f1d2aaca1 Beleswar Padhi    2025-05-13  478  	int num_rmems;
c52d5f1d2aaca1 Beleswar Padhi    2025-05-13  479  	int ret, i;
c52d5f1d2aaca1 Beleswar Padhi    2025-05-13  480  
ad8112ef27e513 Rob Herring (Arm  2025-03-13  481) 	num_rmems = of_reserved_mem_region_count(np);
c52d5f1d2aaca1 Beleswar Padhi    2025-05-13  482  	if (num_rmems < 0) {
c52d5f1d2aaca1 Beleswar Padhi    2025-05-13  483  		dev_err(dev, "device does not reserved memory regions (%d)\n",
c52d5f1d2aaca1 Beleswar Padhi    2025-05-13  484  			num_rmems);
c52d5f1d2aaca1 Beleswar Padhi    2025-05-13  485  		return -EINVAL;
c52d5f1d2aaca1 Beleswar Padhi    2025-05-13  486  	}
c52d5f1d2aaca1 Beleswar Padhi    2025-05-13  487  	if (num_rmems < 2) {
c52d5f1d2aaca1 Beleswar Padhi    2025-05-13  488  		dev_err(dev, "device needs at least two memory regions to be defined, num = %d\n",
c52d5f1d2aaca1 Beleswar Padhi    2025-05-13  489  			num_rmems);
c52d5f1d2aaca1 Beleswar Padhi    2025-05-13  490  		return -EINVAL;
c52d5f1d2aaca1 Beleswar Padhi    2025-05-13  491  	}
c52d5f1d2aaca1 Beleswar Padhi    2025-05-13  492  
c52d5f1d2aaca1 Beleswar Padhi    2025-05-13  493  	/* use reserved memory region 0 for vring DMA allocations */
c52d5f1d2aaca1 Beleswar Padhi    2025-05-13  494  	ret = of_reserved_mem_device_init_by_idx(dev, np, 0);
c52d5f1d2aaca1 Beleswar Padhi    2025-05-13  495  	if (ret) {
c52d5f1d2aaca1 Beleswar Padhi    2025-05-13  496  		dev_err(dev, "device cannot initialize DMA pool (%d)\n", ret);
c52d5f1d2aaca1 Beleswar Padhi    2025-05-13  497  		return ret;
c52d5f1d2aaca1 Beleswar Padhi    2025-05-13  498  	}
c52d5f1d2aaca1 Beleswar Padhi    2025-05-13  499  	ret = devm_add_action_or_reset(dev, k3_mem_release, dev);
c52d5f1d2aaca1 Beleswar Padhi    2025-05-13  500  	if (ret)
c52d5f1d2aaca1 Beleswar Padhi    2025-05-13  501  		return ret;
c52d5f1d2aaca1 Beleswar Padhi    2025-05-13  502  
c52d5f1d2aaca1 Beleswar Padhi    2025-05-13  503  	num_rmems--;
c52d5f1d2aaca1 Beleswar Padhi    2025-05-13  504  	kproc->rmem = devm_kcalloc(dev, num_rmems, sizeof(*kproc->rmem), GFP_KERNEL);
c52d5f1d2aaca1 Beleswar Padhi    2025-05-13  505  	if (!kproc->rmem)
c52d5f1d2aaca1 Beleswar Padhi    2025-05-13  506  		return -ENOMEM;
c52d5f1d2aaca1 Beleswar Padhi    2025-05-13  507  
c52d5f1d2aaca1 Beleswar Padhi    2025-05-13  508  	/* use remaining reserved memory regions for static carveouts */
c52d5f1d2aaca1 Beleswar Padhi    2025-05-13  509  	for (i = 0; i < num_rmems; i++) {
ad8112ef27e513 Rob Herring (Arm  2025-03-13  510) 		struct resource res;
c52d5f1d2aaca1 Beleswar Padhi    2025-05-13  511  
ad8112ef27e513 Rob Herring (Arm  2025-03-13  512) 		ret = of_reserved_mem_region_to_resource(np, i + 1, &res);
ad8112ef27e513 Rob Herring (Arm  2025-03-13  513) 		if (ret)
ad8112ef27e513 Rob Herring (Arm  2025-03-13  514) 			return ret;
c52d5f1d2aaca1 Beleswar Padhi    2025-05-13  515  
ad8112ef27e513 Rob Herring (Arm  2025-03-13  516) 		kproc->rmem[i].bus_addr = res.start;
c52d5f1d2aaca1 Beleswar Padhi    2025-05-13  517  		/* 64-bit address regions currently not supported */
ad8112ef27e513 Rob Herring (Arm  2025-03-13  518) 		kproc->rmem[i].dev_addr = (u32)res.start;
ad8112ef27e513 Rob Herring (Arm  2025-03-13  519) 		kproc->rmem[i].size = resource_size(&res);
ad8112ef27e513 Rob Herring (Arm  2025-03-13  520) 		kproc->rmem[i].cpu_addr = devm_ioremap_resource_wc(dev, &res);
c52d5f1d2aaca1 Beleswar Padhi    2025-05-13  521  		if (!kproc->rmem[i].cpu_addr) {
c52d5f1d2aaca1 Beleswar Padhi    2025-05-13 @522  			dev_err(dev, "failed to map reserved memory#%d at %pa of size %pa\n",
c52d5f1d2aaca1 Beleswar Padhi    2025-05-13  523  				i + 1, &rmem->base, &rmem->size);
c52d5f1d2aaca1 Beleswar Padhi    2025-05-13  524  			return -ENOMEM;
c52d5f1d2aaca1 Beleswar Padhi    2025-05-13  525  		}
c52d5f1d2aaca1 Beleswar Padhi    2025-05-13  526  
c52d5f1d2aaca1 Beleswar Padhi    2025-05-13  527  		dev_dbg(dev, "reserved memory%d: bus addr %pa size 0x%zx va %pK da 0x%x\n",
c52d5f1d2aaca1 Beleswar Padhi    2025-05-13  528  			i + 1, &kproc->rmem[i].bus_addr,
c52d5f1d2aaca1 Beleswar Padhi    2025-05-13  529  			kproc->rmem[i].size, kproc->rmem[i].cpu_addr,
c52d5f1d2aaca1 Beleswar Padhi    2025-05-13  530  			kproc->rmem[i].dev_addr);
c52d5f1d2aaca1 Beleswar Padhi    2025-05-13  531  	}
c52d5f1d2aaca1 Beleswar Padhi    2025-05-13  532  	kproc->num_rmems = num_rmems;
c52d5f1d2aaca1 Beleswar Padhi    2025-05-13  533  
c52d5f1d2aaca1 Beleswar Padhi    2025-05-13  534  	return 0;
c52d5f1d2aaca1 Beleswar Padhi    2025-05-13  535  }
c52d5f1d2aaca1 Beleswar Padhi    2025-05-13  536  EXPORT_SYMBOL_GPL(k3_reserved_mem_init);
c52d5f1d2aaca1 Beleswar Padhi    2025-05-13  537  

:::::: The code at line 522 was first introduced by commit
:::::: c52d5f1d2aaca18b57b71d1c146e03fd08bbd91a remoteproc: k3: Refactor reserved_mem_init() functions into common driver

:::::: TO: Beleswar Padhi <b-padhi@ti.com>
:::::: CC: Mathieu Poirier <mathieu.poirier@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
