Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E01429ACDD
	for <oe-kbuild@lists.linux.dev>; Mon, 15 Dec 2025 22:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765836416; cv=none; b=n8TpZGqpw4SYzB+SmaoZw0FedseVDpGetlE6slaLCs6txVCV7/QS2E08M3D/AryNQiJYZkEPDO9L2nlV1yMhyE0qLckq3l7+54VxHkUME7oaE0eCdJQCfOxU2vFmWDz5qYf0D8o8kmul/H94rGhQPJ//QXRcYLKiBYKqcVAyDos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765836416; c=relaxed/simple;
	bh=EKB9dz1XtDOfHyoMOp1OKfR/R34Bd4+t17h42RTPglo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BMGvGV5uYuYVm8gjaWRH9OIvoSaqIjyXmLXyQb1hiJCILGn4tBxPfhaeyfrEClWf/AytovfjiBogpx7rbjFEMu0wlH0LRAwvK5LHPeM2gFcQsZIdneFt8wUFpZXhquEl6iMFVDWm6hKhy+hfNxPpETJN/OR1Jdm3cgpCggZ/ojE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e62/LR4w; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e62/LR4w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765836415; x=1797372415;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EKB9dz1XtDOfHyoMOp1OKfR/R34Bd4+t17h42RTPglo=;
  b=e62/LR4wvhIDU2etEJAf0l6FvwSkc8kHGrvSMH0nfkIpLe1mGlalvxLB
   XeU808RHgVV8pw505eUtJPxBDgCsoB37YQzkqPZCUhCjEktg6stvH6y0O
   tgiWwX0lwsmhVsOaPqaV9a7k3AwEjI+Xb6batYFv2tciX9xgVmtb5XsWF
   baoDg212h1p8mEq71Vdl3V1aMVaTX5CYf+KeJCm52S5AejlY/mF/hkZg5
   LAXSqD2YqmEp/3KXHGPf+dh9SxzgSRb13jqkOZILaT2blw+XDsksk+w23
   OsXFbC8zp9ZLkmbeSzDU/+n4Tu8o8b1oBIgqfn52qUVqQjkoanwa+KIml
   Q==;
X-CSE-ConnectionGUID: C0Xqv5oAQlOXgs2tqx/wDQ==
X-CSE-MsgGUID: 0gyy2z8dRJWSkH/Q+nno3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="67626090"
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; 
   d="scan'208";a="67626090"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 14:06:54 -0800
X-CSE-ConnectionGUID: kDNIdckKQsmz9W4ojH12Og==
X-CSE-MsgGUID: L+dYX6+4QGGgT2kCt5a6ZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; 
   d="scan'208";a="198325601"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 15 Dec 2025 14:06:52 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVGiG-000000000rn-3jT6;
	Mon, 15 Dec 2025 22:06:43 +0000
Date: Tue, 16 Dec 2025 06:06:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/pci/controller/dwc/pcie-designware.c:1129
 dw_pcie_parent_bus_offset() error: uninitialized symbol 'reg_addr'.
Message-ID: <202512160528.y466PQam-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Frank Li <Frank.Li@nxp.com>
CC: Bjorn Helgaas <helgaas@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8f0b4cce4481fb22653697cced8d0d04027cb1e8
commit: 9de3f3cd470b25fafd150cf243e3a51e40b036ee PCI: dwc: Add dw_pcie_parent_bus_offset()
date:   9 months ago
:::::: branch date: 2 days ago
:::::: commit date: 9 months ago
config: sparc-randconfig-r072-20251213 (https://download.01.org/0day-ci/archive/20251216/202512160528.y466PQam-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512160528.y466PQam-lkp@intel.com/

smatch warnings:
drivers/pci/controller/dwc/pcie-designware.c:1129 dw_pcie_parent_bus_offset() error: uninitialized symbol 'reg_addr'.

vim +/reg_addr +1129 drivers/pci/controller/dwc/pcie-designware.c

9de3f3cd470b25 Frank Li 2025-03-15  1109  
9de3f3cd470b25 Frank Li 2025-03-15  1110  resource_size_t dw_pcie_parent_bus_offset(struct dw_pcie *pci,
9de3f3cd470b25 Frank Li 2025-03-15  1111  					  const char *reg_name,
9de3f3cd470b25 Frank Li 2025-03-15  1112  					  resource_size_t cpu_phys_addr)
9de3f3cd470b25 Frank Li 2025-03-15  1113  {
9de3f3cd470b25 Frank Li 2025-03-15  1114  	struct device *dev = pci->dev;
9de3f3cd470b25 Frank Li 2025-03-15  1115  	struct device_node *np = dev->of_node;
9de3f3cd470b25 Frank Li 2025-03-15  1116  	int index;
9de3f3cd470b25 Frank Li 2025-03-15  1117  	u64 reg_addr;
9de3f3cd470b25 Frank Li 2025-03-15  1118  
9de3f3cd470b25 Frank Li 2025-03-15  1119  	/* Look up reg_name address on parent bus */
9de3f3cd470b25 Frank Li 2025-03-15  1120  	index = of_property_match_string(np, "reg-names", reg_name);
9de3f3cd470b25 Frank Li 2025-03-15  1121  
9de3f3cd470b25 Frank Li 2025-03-15  1122  	if (index < 0) {
9de3f3cd470b25 Frank Li 2025-03-15  1123  		dev_err(dev, "No %s in devicetree \"reg\" property\n", reg_name);
9de3f3cd470b25 Frank Li 2025-03-15  1124  		return 0;
9de3f3cd470b25 Frank Li 2025-03-15  1125  	}
9de3f3cd470b25 Frank Li 2025-03-15  1126  
9de3f3cd470b25 Frank Li 2025-03-15  1127  	of_property_read_reg(np, index, &reg_addr, NULL);
9de3f3cd470b25 Frank Li 2025-03-15  1128  
9de3f3cd470b25 Frank Li 2025-03-15 @1129  	return cpu_phys_addr - reg_addr;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
