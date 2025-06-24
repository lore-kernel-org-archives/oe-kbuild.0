Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FE2F13B7A3
	for <oe-kbuild@lists.linux.dev>; Tue, 24 Jun 2025 03:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750734923; cv=none; b=ITPOiAqDKCQE5hUUr4hgQ/vug0935XCaSnpx+WDAA/L7IzUY776KQ+KNhhX96m2/AXP6mROPp5hfC5QZm3SKbIcvARTzaGYiNYaFWyPDwQ8JH0Os8LzPZLauao7Szfk9Ogm3PD66v6txnbxj21iwUaQl2zn+OI2QQhzIc3yBtj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750734923; c=relaxed/simple;
	bh=UTAQIWBHUMyjNKa5buXBhH1GfCVsdYaiSD0E44+YQXg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k5MjUUQ8O7eyKNnShjNKW6GlIRlZl3uEH+nf6LhJYjsgtchXdGyYsorB9C7w2r/boMLH2YRypVacHXBrLscbXod75sFn+sXQZthRDGNL9eg6HwqwzXhcJ85uSyRfEwZboLS3L9tXMq/iVAie3EgbivSBojJKmrJSCvawwmMzPc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DeVzGJH5; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DeVzGJH5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750734921; x=1782270921;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UTAQIWBHUMyjNKa5buXBhH1GfCVsdYaiSD0E44+YQXg=;
  b=DeVzGJH59yvBpqNlbMkQlidIrUGAztNKQjoKXsuIw2q6SEa/G4o5VSrt
   KnByLL6nAdjr+e56SBu4uvRQvLuExvfB32Q5oET0+OCau53Da02IxVIxc
   kR0GhCVXQIi4mauqc4JnqvnOGjzNkvXZVDYSehoM7NYdZNDrzw0LQ8k3M
   EE2SajljyRbdOMLai1XHOQo7J0tcYejXMGTJzG6k/xCyvFNFxPG7rJmTE
   PJ/S7zn8mhhp/d6UNbz3w5RpL0dvTvYclYdDxD7jbIHoq3t+K4AOoqWb9
   LkP0q/iDR0CNIrzFZfPM0EcAu78dJkFXlCfBxsHgsLRgde4R7GVaCoAFS
   Q==;
X-CSE-ConnectionGUID: FaGGgMCxQ4SGWuB82mSZ8g==
X-CSE-MsgGUID: ph9POoF1SBmjEET1xpEpuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="40574451"
X-IronPort-AV: E=Sophos;i="6.16,260,1744095600"; 
   d="scan'208";a="40574451"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 20:15:20 -0700
X-CSE-ConnectionGUID: ODiTvDyvQ4umiaG4HHSXdw==
X-CSE-MsgGUID: FI2aTBJkQkKIsl/LURzcPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,260,1744095600"; 
   d="scan'208";a="152089967"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 23 Jun 2025 20:15:20 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uTu7w-000RfC-1d;
	Tue, 24 Jun 2025 03:15:16 +0000
Date: Tue, 24 Jun 2025 11:14:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v3 02/10] mei: late_bind: add late binding component
 driver
Message-ID: <202506241103.XiG3WA7g-lkp@intel.com>
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
In-Reply-To: <20250618190007.2932322-3-badal.nilawar@intel.com>
References: <20250618190007.2932322-3-badal.nilawar@intel.com>
TO: Badal Nilawar <badal.nilawar@intel.com>

Hi Badal,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-xe/drm-xe-next]
[also build test WARNING on char-misc/char-misc-testing char-misc/char-misc-next char-misc/char-misc-linus drm-i915/for-linux-next drm-i915/for-linux-next-fixes linus/master v6.16-rc3 next-20250623]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Badal-Nilawar/mei-bus-add-mei_cldev_mtu-interface/20250619-025825
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20250618190007.2932322-3-badal.nilawar%40intel.com
patch subject: [PATCH v3 02/10] mei: late_bind: add late binding component driver
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: i386-randconfig-141-20250623 (https://download.01.org/0day-ci/archive/20250624/202506241103.XiG3WA7g-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202506241103.XiG3WA7g-lkp@intel.com/

smatch warnings:
drivers/misc/mei/late_bind/mei_late_bind.c:203 mei_late_bind_component_match() warn: was && intended here instead of ||?

vim +203 drivers/misc/mei/late_bind/mei_late_bind.c

b4fe758cb831cd Alexander Usyskin 2025-06-19  170  
b4fe758cb831cd Alexander Usyskin 2025-06-19  171  /**
b4fe758cb831cd Alexander Usyskin 2025-06-19  172   * mei_late_bind_component_match - compare function for matching mei late bind.
b4fe758cb831cd Alexander Usyskin 2025-06-19  173   *
b4fe758cb831cd Alexander Usyskin 2025-06-19  174   *    The function checks if requested is Intel VGA device
b4fe758cb831cd Alexander Usyskin 2025-06-19  175   *    and the parent of requester and the grand parent of mei_if are the same
b4fe758cb831cd Alexander Usyskin 2025-06-19  176   *    device.
b4fe758cb831cd Alexander Usyskin 2025-06-19  177   *
b4fe758cb831cd Alexander Usyskin 2025-06-19  178   * @dev: master device
b4fe758cb831cd Alexander Usyskin 2025-06-19  179   * @subcomponent: subcomponent to match (I915_COMPONENT_LATE_BIND)
b4fe758cb831cd Alexander Usyskin 2025-06-19  180   * @data: compare data (mei late-bind bus device)
b4fe758cb831cd Alexander Usyskin 2025-06-19  181   *
b4fe758cb831cd Alexander Usyskin 2025-06-19  182   * Return:
b4fe758cb831cd Alexander Usyskin 2025-06-19  183   * * 1 - if components match
b4fe758cb831cd Alexander Usyskin 2025-06-19  184   * * 0 - otherwise
b4fe758cb831cd Alexander Usyskin 2025-06-19  185   */
b4fe758cb831cd Alexander Usyskin 2025-06-19  186  static int mei_late_bind_component_match(struct device *dev, int subcomponent,
b4fe758cb831cd Alexander Usyskin 2025-06-19  187  					 void *data)
b4fe758cb831cd Alexander Usyskin 2025-06-19  188  {
b4fe758cb831cd Alexander Usyskin 2025-06-19  189  	struct device *base = data;
b4fe758cb831cd Alexander Usyskin 2025-06-19  190  	struct pci_dev *pdev;
b4fe758cb831cd Alexander Usyskin 2025-06-19  191  
b4fe758cb831cd Alexander Usyskin 2025-06-19  192  	if (!dev)
b4fe758cb831cd Alexander Usyskin 2025-06-19  193  		return 0;
b4fe758cb831cd Alexander Usyskin 2025-06-19  194  
b4fe758cb831cd Alexander Usyskin 2025-06-19  195  	if (!dev_is_pci(dev))
b4fe758cb831cd Alexander Usyskin 2025-06-19  196  		return 0;
b4fe758cb831cd Alexander Usyskin 2025-06-19  197  
b4fe758cb831cd Alexander Usyskin 2025-06-19  198  	pdev = to_pci_dev(dev);
b4fe758cb831cd Alexander Usyskin 2025-06-19  199  
b4fe758cb831cd Alexander Usyskin 2025-06-19  200  	if (pdev->vendor != PCI_VENDOR_ID_INTEL)
b4fe758cb831cd Alexander Usyskin 2025-06-19  201  		return 0;
b4fe758cb831cd Alexander Usyskin 2025-06-19  202  
b4fe758cb831cd Alexander Usyskin 2025-06-19 @203  	if (pdev->class != (PCI_CLASS_DISPLAY_VGA << 8) ||
b4fe758cb831cd Alexander Usyskin 2025-06-19  204  	    pdev->class != (PCI_CLASS_DISPLAY_OTHER << 8))
b4fe758cb831cd Alexander Usyskin 2025-06-19  205  		return 0;
b4fe758cb831cd Alexander Usyskin 2025-06-19  206  
b4fe758cb831cd Alexander Usyskin 2025-06-19  207  	if (subcomponent != I915_COMPONENT_LATE_BIND)
b4fe758cb831cd Alexander Usyskin 2025-06-19  208  		return 0;
b4fe758cb831cd Alexander Usyskin 2025-06-19  209  
b4fe758cb831cd Alexander Usyskin 2025-06-19  210  	base = base->parent;
b4fe758cb831cd Alexander Usyskin 2025-06-19  211  	if (!base) /* mei device */
b4fe758cb831cd Alexander Usyskin 2025-06-19  212  		return 0;
b4fe758cb831cd Alexander Usyskin 2025-06-19  213  
b4fe758cb831cd Alexander Usyskin 2025-06-19  214  	base = base->parent; /* pci device */
b4fe758cb831cd Alexander Usyskin 2025-06-19  215  
b4fe758cb831cd Alexander Usyskin 2025-06-19  216  	return !!base && dev == base;
b4fe758cb831cd Alexander Usyskin 2025-06-19  217  }
b4fe758cb831cd Alexander Usyskin 2025-06-19  218  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
