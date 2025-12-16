Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B21FE25C838
	for <oe-kbuild@lists.linux.dev>; Tue, 16 Dec 2025 02:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765851474; cv=none; b=A+ILrhgKwN2TKoJnmkKE977LQFvQC1Cvb1TumIpD2ffRz5FzcSF1j8YnPulhu5EvkY4U24wSQf1Sf5xW1RcCHaGbzhQgMHCojfrMtOlkT8fqWY5qp2s/sDrFFeG60YiYe2OqAh/RPNReS9HOJW5uLs2+7sh8Qs/ga6uznrwKmMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765851474; c=relaxed/simple;
	bh=0YTRN7TTX9KlD1Gx9fzbBtsQAUj9RW3MxWGWV0dGQgU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=P9shBjFcGck/3lCe/LJhrhvPz2rctEJgBfOh5R1yZ3MfubgFwehMTnuWZokSMDG9DGaiB036G28eFDAfYJBHk5xJWyqAPj7Sf8/GnZo4CGoVzxB+gYCYkBqHwqJAPpLtBFNBn3YBqAyFV/cFh94q/220AfSa+Jp7wePYEhyvhiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VqIhzEpR; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VqIhzEpR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765851473; x=1797387473;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0YTRN7TTX9KlD1Gx9fzbBtsQAUj9RW3MxWGWV0dGQgU=;
  b=VqIhzEpRzYy2bDqLbtWMfOlCPc8zHuhruE27B4zMT9rB80AVr9sXmvRo
   MA9W7lrs0ykJLJNbb+yh2xk2nXSF6FqIF10H9SGR+f/DoxEDSTHRDCO6A
   8mgjKPIEP0gj/TQ4F986kQju56DvHWFvTzTRnqoGpvkD13paHgMHxHiXX
   DvARsFtwt3NFa2T3yLrvCKwijh8r0+JkPA5TVk3J2Vp3LW7bHsP5+E6ec
   BtjflZjdzhJ/BKB8ZxWT4eIJGALVwbfXIKHtrIsktQfDD0wo1RvUw3j5f
   tiLnJSltFsYiHdMyxuVnIlYxRByVnDGhm74PdocHLtaXIZjil8WOzce5+
   Q==;
X-CSE-ConnectionGUID: rd+OGIADT8Cm2MG3pcE6yg==
X-CSE-MsgGUID: Mgz8XyDPTiuNo7zRiMavBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="78073239"
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; 
   d="scan'208";a="78073239"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 18:17:49 -0800
X-CSE-ConnectionGUID: 5+K9LZ9OSGewbJLXQODFRw==
X-CSE-MsgGUID: fL3db04jTsC0F2mb0wBlzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; 
   d="scan'208";a="197875750"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 15 Dec 2025 18:17:48 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVKdF-0000000013l-0wgT;
	Tue, 16 Dec 2025 02:17:45 +0000
Date: Tue, 16 Dec 2025 10:17:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/iommu/generic_pt/fmt/../iommu_pt.h:153
 pt_iommu_x86_64_iova_to_phys() warn: sizeof(NUMBER)?
Message-ID: <202512161040.dtbxBygw-lkp@intel.com>
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
TO: Jason Gunthorpe <jgg@nvidia.com>
CC: Joerg Roedel <joerg.roedel@amd.com>
CC: Kevin Tian <kevin.tian@intel.com>
CC: Vasant Hegde <vasant.hegde@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8f0b4cce4481fb22653697cced8d0d04027cb1e8
commit: aef5de756ea871ab44e3a1a87be6c944e6587c51 iommupt: Add the x86 64 bit page table format
date:   6 weeks ago
:::::: branch date: 2 days ago
:::::: commit date: 6 weeks ago
config: sparc-randconfig-r072-20251213 (https://download.01.org/0day-ci/archive/20251216/202512161040.dtbxBygw-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512161040.dtbxBygw-lkp@intel.com/

New smatch warnings:
drivers/iommu/generic_pt/fmt/../iommu_pt.h:153 pt_iommu_x86_64_iova_to_phys() warn: sizeof(NUMBER)?

Old smatch warnings:
drivers/iommu/generic_pt/fmt/../pt_defs.h:205 pt_feature() warn: bitwise AND condition is false here
drivers/iommu/generic_pt/fmt/../iommu_pt.h:291 x86_64_set_dirty() warn: sizeof(NUMBER)?
drivers/iommu/generic_pt/fmt/../iommu_pt.h:662 increase_top() error: uninitialized symbol 'table_mem'.
drivers/iommu/generic_pt/fmt/../iommu_pt.h:662 increase_top() error: uninitialized symbol 'new_level'.
drivers/iommu/generic_pt/fmt/../iommu_pt.h:621 increase_top() warn: missing unwind goto?
drivers/iommu/generic_pt/fmt/../iommu_pt.h:1020 pt_init_common() warn: bitwise AND condition is false here

vim +153 drivers/iommu/generic_pt/fmt/../iommu_pt.h

9d4c274cd7d5e1 Jason Gunthorpe 2025-11-04  131  
9d4c274cd7d5e1 Jason Gunthorpe 2025-11-04  132  /**
9d4c274cd7d5e1 Jason Gunthorpe 2025-11-04  133   * iova_to_phys() - Return the output address for the given IOVA
9d4c274cd7d5e1 Jason Gunthorpe 2025-11-04  134   * @iommu_table: Table to query
9d4c274cd7d5e1 Jason Gunthorpe 2025-11-04  135   * @iova: IO virtual address to query
9d4c274cd7d5e1 Jason Gunthorpe 2025-11-04  136   *
9d4c274cd7d5e1 Jason Gunthorpe 2025-11-04  137   * Determine the output address from the given IOVA. @iova may have any
9d4c274cd7d5e1 Jason Gunthorpe 2025-11-04  138   * alignment, the returned physical will be adjusted with any sub page offset.
9d4c274cd7d5e1 Jason Gunthorpe 2025-11-04  139   *
9d4c274cd7d5e1 Jason Gunthorpe 2025-11-04  140   * Context: The caller must hold a read range lock that includes @iova.
9d4c274cd7d5e1 Jason Gunthorpe 2025-11-04  141   *
9d4c274cd7d5e1 Jason Gunthorpe 2025-11-04  142   * Return: 0 if there is no translation for the given iova.
9d4c274cd7d5e1 Jason Gunthorpe 2025-11-04  143   */
9d4c274cd7d5e1 Jason Gunthorpe 2025-11-04  144  phys_addr_t DOMAIN_NS(iova_to_phys)(struct iommu_domain *domain,
9d4c274cd7d5e1 Jason Gunthorpe 2025-11-04  145  				    dma_addr_t iova)
9d4c274cd7d5e1 Jason Gunthorpe 2025-11-04  146  {
9d4c274cd7d5e1 Jason Gunthorpe 2025-11-04  147  	struct pt_iommu *iommu_table =
9d4c274cd7d5e1 Jason Gunthorpe 2025-11-04  148  		container_of(domain, struct pt_iommu, domain);
9d4c274cd7d5e1 Jason Gunthorpe 2025-11-04  149  	struct pt_range range;
9d4c274cd7d5e1 Jason Gunthorpe 2025-11-04  150  	pt_oaddr_t res;
9d4c274cd7d5e1 Jason Gunthorpe 2025-11-04  151  	int ret;
9d4c274cd7d5e1 Jason Gunthorpe 2025-11-04  152  
9d4c274cd7d5e1 Jason Gunthorpe 2025-11-04 @153  	ret = make_range(common_from_iommu(iommu_table), &range, iova, 1);
9d4c274cd7d5e1 Jason Gunthorpe 2025-11-04  154  	if (ret)
9d4c274cd7d5e1 Jason Gunthorpe 2025-11-04  155  		return ret;
9d4c274cd7d5e1 Jason Gunthorpe 2025-11-04  156  
9d4c274cd7d5e1 Jason Gunthorpe 2025-11-04  157  	ret = pt_walk_range(&range, __iova_to_phys, &res);
9d4c274cd7d5e1 Jason Gunthorpe 2025-11-04  158  	/* PHYS_ADDR_MAX would be a better error code */
9d4c274cd7d5e1 Jason Gunthorpe 2025-11-04  159  	if (ret)
9d4c274cd7d5e1 Jason Gunthorpe 2025-11-04  160  		return 0;
9d4c274cd7d5e1 Jason Gunthorpe 2025-11-04  161  	return res;
9d4c274cd7d5e1 Jason Gunthorpe 2025-11-04  162  }
9d4c274cd7d5e1 Jason Gunthorpe 2025-11-04  163  EXPORT_SYMBOL_NS_GPL(DOMAIN_NS(iova_to_phys), "GENERIC_PT_IOMMU");
9d4c274cd7d5e1 Jason Gunthorpe 2025-11-04  164  

:::::: The code at line 153 was first introduced by commit
:::::: 9d4c274cd7d5e1b6b9e116e155f16bcd208237d8 iommupt: Add iova_to_phys op

:::::: TO: Jason Gunthorpe <jgg@nvidia.com>
:::::: CC: Joerg Roedel <joerg.roedel@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
