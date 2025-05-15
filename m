Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90B8F25A2DA
	for <oe-kbuild@lists.linux.dev>; Thu, 15 May 2025 17:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747330149; cv=none; b=W9mnD4Qfg0ZBTQLBDuXqkfM7i42qdaTaW2IBIqtiPM2XecuNzFvLg/65mLLzdLD7hvZc8nWNbWoQa7eERHGZzZslWA3Mf5lMFjQ6sorjJFRFzpFGPa3HWTOzu/2uj69KNjCJzFzwcXd7hvIOPeL57QbFGSU5XSQuiGdhpoajZTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747330149; c=relaxed/simple;
	bh=neIKZ8Q3pJ4tKBD5cBZbiv0eCT8MSM8vPyJbYSk2QoI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IGOaUDbzVEXi/IotwV8ebZ0DSJDME76AOriAb/uUFR8OV/cXGxa0vCmSOwjcE7xVKtSN2+4RvDaCV2kPrslIMRcLHj9JH1LORauBMaSOeD0mP15R5dmNNladi4qdf+cHzkjI21THvMabjFkz7RbKhNH9+iFzov/ZgNtwWD27cyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nkBliHg+; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nkBliHg+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747330148; x=1778866148;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=neIKZ8Q3pJ4tKBD5cBZbiv0eCT8MSM8vPyJbYSk2QoI=;
  b=nkBliHg+hoH5K/YWgwC4do376bi3jPUQz+zvG2r5tZ7GgYhCuZLAldOh
   Cdz7Tnpxi+PbdxxdAKgWwshHO6yAanIAxIVT4K6a9cedugyMyq/QvsGdN
   4MRVezBX+l4ciGP06yr21ufYAQvgJSO2UdklAvRZNzojX+i2rzKzANwIq
   pdSSk+xBQLQAKcbUY9pG849fHuTOH7pQMBEavVO1DOfrGk9LQyYOvZYP0
   XWgXvJFZ0B9Fz7MU6PzFgRpUSFJR0NcuREK6K8nZzugyBY+oC95ujH0Bm
   6ReStbf301OlZIeioaZSd05pqjCAkIwtQw2yLfaZ/i1hRj2salydlafU+
   g==;
X-CSE-ConnectionGUID: vb/adlFFQ+y6Cs8141Tx4A==
X-CSE-MsgGUID: 2iX7n5gxQHi/bMTlkF/tyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="49267047"
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="49267047"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 10:29:07 -0700
X-CSE-ConnectionGUID: vZuv/uGQQOehlMqKamAWSA==
X-CSE-MsgGUID: kvTd+k2UQ/uJg43JrmQF7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="138313331"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 15 May 2025 10:29:06 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFcOF-000Ibf-2N;
	Thu, 15 May 2025 17:29:03 +0000
Date: Fri, 16 May 2025 01:28:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/pci/controller/dwc/pcie-designware.c:1129
 dw_pcie_parent_bus_offset() error: uninitialized symbol 'reg_addr'.
Message-ID: <202505160128.yQCJavQ8-lkp@intel.com>
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
head:   088d13246a4672bc03aec664675138e3f5bff68c
commit: 9de3f3cd470b25fafd150cf243e3a51e40b036ee PCI: dwc: Add dw_pcie_parent_bus_offset()
date:   7 weeks ago
:::::: branch date: 12 hours ago
:::::: commit date: 7 weeks ago
config: sparc-randconfig-r073-20250515 (https://download.01.org/0day-ci/archive/20250516/202505160128.yQCJavQ8-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202505160128.yQCJavQ8-lkp@intel.com/

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
