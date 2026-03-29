Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE43F282F2C
	for <oe-kbuild@lists.linux.dev>; Sun, 29 Mar 2026 14:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774793910; cv=none; b=L59BvP6lBf/0gYXPg2Ek5Ag2qFz/6yXyatMi9aSsKt3jQM34dXMksDkYaof8kuHf9eYR59agdZOVMg3MNGliDwZFM1OG7/tlGhn7E+MfLVJ/P4axiUYr/e/BGrFVnEO/hCarwATh0M82hngPdVMj53aygjnwYlnFrqdtLNpWE1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774793910; c=relaxed/simple;
	bh=ZI1Wi5WRzA6tR5xDBsNxe7aBmKydLyf28xbG/w55ZPM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CILmrG4EF8UuHbOLTH3gevNMxsgd9N+nOPrfEYFO0cYz0q4tnbd7jP2e7dc3NwvqNunTaqBr57PaL4f4XKLopTJSPS0FM1Rvi7mjo7esLhPS7CuniI5WzPfoJQE8KIjMd17awBobtCXHLFf+38/vMz0yEHTha2K+8YWd+kBCVEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gv4eT8iy; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gv4eT8iy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774793907; x=1806329907;
  h=date:from:to:cc:subject:message-id;
  bh=ZI1Wi5WRzA6tR5xDBsNxe7aBmKydLyf28xbG/w55ZPM=;
  b=Gv4eT8iyj0DE1IJHIGkZbxpgsxWo765QiI0YKAisEyhe4FyRyS3Ny976
   hvQInQtHpo59f6Ih0MuQs6lKPcNyj0qeXYfsqzNy9Qk16q4aOxp0WM4w/
   FKC07+tin2nINGZA0xuTnDkRqR64VMJMnV9b3y4B9qa0AmJ6/KKQ/R7/6
   EdjApXNAgdZAWvqFdQAZzY7PlxYmGDSttPGO0nad+kWzlF/DbWxyjySBd
   ElxqgbEEjaOo65r1p3j/2k8FP1cUeWBeMhYVUe8Ow6Xk2IhWFvH6u/6gD
   15C2CPQqTdtMS6rcAP/mQbvJ8pGrtM8EB9qPDiSlEGc96U9oOKL17Se30
   Q==;
X-CSE-ConnectionGUID: f6RTPxMBT8WfFqAq4qyXaw==
X-CSE-MsgGUID: 1M8CkbCnRA6dmO1q3Wf9Ug==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="78398069"
X-IronPort-AV: E=Sophos;i="6.23,148,1770624000"; 
   d="scan'208";a="78398069"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2026 07:18:26 -0700
X-CSE-ConnectionGUID: QCg3VhakRW+e6PxxFlGjTw==
X-CSE-MsgGUID: xTMwzj5oR6WGvHTAomJNBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,148,1770624000"; 
   d="scan'208";a="221404854"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 29 Mar 2026 07:18:25 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6qy6-00000000CRF-3rW4;
	Sun, 29 Mar 2026 14:18:22 +0000
Date: Sun, 29 Mar 2026 22:17:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [android-common:android-mainline 12/12]
 drivers/pci/pwrctrl/core.c:198:1-7: ERROR: missing put_device; call
 of_find_device_by_node on line 168, but without a corresponding object
 release within this function.
Message-ID: <202603292219.7I3EgPFc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   f913cf91bd605dfe1c02404e4ed46d65b9a40169
commit: 4c413248920106393b35b5e014e6ac525405437e [12/12] PCI/pwrctrl: Add APIs to create, destroy pwrctrl devices
:::::: branch date: 20 hours ago
:::::: commit date: 2 months ago
config: arm-randconfig-r064-20260329 (https://download.01.org/0day-ci/archive/20260329/202603292219.7I3EgPFc-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202603292219.7I3EgPFc-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/pci/pwrctrl/core.c:198:1-7: ERROR: missing put_device; call of_find_device_by_node on line 168, but without a corresponding object release within this function.

vim +198 drivers/pci/pwrctrl/core.c

4565d2652a37e4 drivers/pci/pwrctl/core.c  Bartosz Golaszewski       2024-06-12  154  
4c413248920106 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  155  static int pci_pwrctrl_create_device(struct device_node *np,
4c413248920106 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  156  				     struct device *parent)
4c413248920106 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  157  {
4c413248920106 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  158  	struct platform_device *pdev;
4c413248920106 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  159  	int ret;
4c413248920106 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  160  
4c413248920106 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  161  	for_each_available_child_of_node_scoped(np, child) {
4c413248920106 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  162  		ret = pci_pwrctrl_create_device(child, parent);
4c413248920106 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  163  		if (ret)
4c413248920106 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  164  			return ret;
4c413248920106 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  165  	}
4c413248920106 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  166  
4c413248920106 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  167  	/* Bail out if the platform device is already available for the node */
4c413248920106 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15 @168  	pdev = of_find_device_by_node(np);
4c413248920106 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  169  	if (pdev) {
4c413248920106 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  170  		platform_device_put(pdev);
4c413248920106 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  171  		return 0;
4c413248920106 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  172  	}
4c413248920106 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  173  
4c413248920106 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  174  	/*
4c413248920106 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  175  	 * Sanity check to make sure that the node has the compatible property
4c413248920106 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  176  	 * to allow driver binding.
4c413248920106 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  177  	 */
4c413248920106 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  178  	if (!of_property_present(np, "compatible"))
4c413248920106 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  179  		return 0;
4c413248920106 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  180  
4c413248920106 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  181  	/*
4c413248920106 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  182  	 * Check whether the pwrctrl device really needs to be created or not.
4c413248920106 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  183  	 * This is decided based on at least one of the power supplies being
4c413248920106 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  184  	 * defined in the devicetree node of the device.
4c413248920106 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  185  	 */
4c413248920106 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  186  	if (!of_pci_supply_present(np)) {
4c413248920106 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  187  		dev_dbg(parent, "Skipping OF node: %s\n", np->name);
4c413248920106 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  188  		return 0;
4c413248920106 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  189  	}
4c413248920106 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  190  
4c413248920106 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  191  	/* Now create the pwrctrl device */
4c413248920106 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  192  	pdev = of_platform_device_create(np, NULL, parent);
4c413248920106 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  193  	if (!pdev) {
4c413248920106 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  194  		dev_err(parent, "Failed to create pwrctrl device for node: %s\n", np->name);
4c413248920106 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  195  		return -EINVAL;
4c413248920106 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  196  	}
4c413248920106 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  197  
4c413248920106 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15 @198  	return 0;
4c413248920106 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  199  }
4c413248920106 drivers/pci/pwrctrl/core.c Krishna Chaitanya Chundru 2026-01-15  200  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
